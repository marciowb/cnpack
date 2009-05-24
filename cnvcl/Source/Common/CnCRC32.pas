{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     �й����Լ��Ŀ���Դ�������������                         }
{                   (C)Copyright 2001-2009 CnPack ������                       }
{                   ------------------------------------                       }
{                                                                              }
{            ���������ǿ�Դ��������������������� CnPack �ķ���Э������        }
{        �ĺ����·�����һ����                                                }
{                                                                              }
{            ������һ��������Ŀ����ϣ�������ã���û���κε���������û��        }
{        �ʺ��ض�Ŀ�Ķ������ĵ���������ϸ���������� CnPack ����Э�顣        }
{                                                                              }
{            ��Ӧ���Ѿ��Ϳ�����һ���յ�һ�� CnPack ����Э��ĸ��������        }
{        ��û�У��ɷ������ǵ���վ��                                            }
{                                                                              }
{            ��վ��ַ��http://www.cnpack.org                                   }
{            �����ʼ���master@cnpack.org                                       }
{                                                                              }
{******************************************************************************}

unit CnCRC32;
{* |<PRE>
================================================================================
* ������ƣ�������������
* ��Ԫ���ƣ�CRC32ѭ������У�鵥Ԫ
* ��Ԫ���ߣ��ܾ��� (zjy@cnpack.org)
* ��    ע��
* ����ƽ̨��PWin2000Pro + Delphi 5.0
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id: CnCRC32.pas,v 1.8 2009/05/03 08:51:54 liuxiao Exp $
* �޸ļ�¼��2009.04.16 V1.1
*               ����һ���������������
*           2002.08.11 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

interface

{$I CnPack.inc}

uses
  Windows;

type
  TCRC32 = type DWORD;

function CRC32Calc(OrgCRC32: DWORD; const Data; Len: DWORD): DWORD;
{* ����CRC32ֵ
 |<PRE>
   OrgCRC32: DWORD  - ��ʼCRC32ֵ
   const Data       - Ҫ��������ݿ�
   Len: DWORD       - ���ݿ鳤��
   Result: DWORD    - ����CRC32������
 |</PRE>}

function StrCRC32(OrgCRC32: DWORD; const Text: string): DWORD;
{* �����ַ�����CRC32ֵ }

function StrCRC32A(OrgCRC32: DWORD; const Text: AnsiString): DWORD;
{* ���� AnsiString �ַ�����CRC32ֵ }

function FileCRC32(const FileName: string; var CRC: TCRC32; StartPos: Integer = 0;
  Len: Integer = 0): Boolean;
{* �����ļ�CRC32ֵ
 |<PRE>
   const FileName: string   - Ŀ���ļ���
   var CRC: TCRC32          - CRC32ֵ����������������ԭʼֵ���������ֵ
   StartPos: Integer = 0    - �ļ���ʼλ�ã�Ĭ�ϴ�ͷ��ʼ
   Len: Integer = 0         - ���㳤�ȣ�Ϊ��Ĭ��Ϊ�����ļ�
   Result: Boolean          - ���سɹ���־���ļ���ʧ�ܻ�ָ��������Чʱ����False
 |</PRE>}

implementation

const
  csBuff_Size = 4096;
  
type
  // �ļ�������
  PBuff = ^TBuff;
  TBuff = array[0..csBuff_Size - 1] of Byte;

  // CRC32��
  TCRC32Table = array[0..255] of DWORD;

var
  CRC32Table: TCRC32Table;

// ����CRC32��
procedure Make_CRC32Table;
asm
        PUSH    EBX
        MOV     EDX, OFFSET CRC32Table

        XOR     EBX, EBX
@MakeCRC32Loop:
        CMP     EBX, $100
        JE      @MakeCRC32_Succ
        MOV     EAX, EBX
        MOV     ECX, 8
@MakeLoop:
        TEST    EAX, 1
        JZ      @MakeIsZero
        SHR     EAX, 1
        XOR     EAX, $EDB88320
        JMP     @MakeNext
@MakeIsZero:
        SHR     EAX, 1
@MakeNext:
        LOOP    @MakeLoop
        MOV     DWORD PTR [EDX], EAX
        ADD     EDX, 4
        INC     EBX
        JMP     @MakeCRC32Loop

@MakeCRC32_Succ:
        POP     EBX
        RET
end;

// ����CRC32ֵ
function CRC32Calc(OrgCRC32: DWORD; const Data; Len: DWORD): DWORD;
asm
        OR      EDX, EDX   // Data = nil?
        JE      @Exit
        JECXZ   @Exit      // Len = 0?
        PUSH    ESI
        PUSH    EBX
        MOV     ESI, OFFSET CRC32Table
        XOR     EAX, -1
@Upd:
        MOVZX   EBX, AL    // CRC32
        XOR     BL, [EDX]
        SHR     EAX, 8
        AND     EAX, $00FFFFFF
        XOR     EAX, [EBX * 4 + ESI]
        INC     EDX
        LOOP    @Upd
        POP     EBX
        POP     ESI
        XOR     EAX, -1
@Exit:
        RET
end;

// �����ַ�����CRC32ֵ
function StrCRC32(OrgCRC32: DWORD; const Text: string): DWORD;
begin
  Result := CRC32Calc(OrgCRC32, PChar(Text)^, Length(Text) * SizeOf(Char));
end;

// ���� AnsiString �ַ�����CRC32ֵ
function StrCRC32A(OrgCRC32: DWORD; const Text: AnsiString): DWORD;
begin
  Result := CRC32Calc(OrgCRC32, PAnsiChar(Text)^, Length(Text));
end;

// �����ļ�CRCֵ�������ֱ�Ϊ���ļ�����CRCֵ����ʼ��ַ�����㳤��
function FileCRC32(const FileName: string; var CRC: TCRC32; StartPos: Integer = 0;
  Len: Integer = 0): Boolean;
var
  Handle: THandle;
  ReadCount: Integer;
  Size: Integer;
  Count: Integer;
  Buff: TBuff;
begin
  // �Թ������ʽ���ļ�
  Handle := CreateFile(PChar(FileName), GENERIC_READ,
    FILE_SHARE_READ, nil, OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL, 0);
  Result := Handle <> INVALID_HANDLE_VALUE;
  if Result then
  begin
    Size := GetFileSize(Handle, nil);
    if Size < StartPos + Len then
    begin
      Result := False;                  // �����ļ�����
      Exit;
    end;
    if Len > 0 then
      Count := Len
    else
      Count := Size - StartPos;         // ����Ϊ�㣬���㵽�ļ�β
    SetFilePointer(Handle, StartPos, nil, FILE_BEGIN);
    while Count > 0 do
    begin
      if Count > SizeOf(Buff) then
        ReadCount := SizeOf(Buff)
      else
        ReadCount := Count;
      ReadFile(Handle, Buff, ReadCount, LongWord(ReadCount), nil);
      CRC := Crc32Calc(CRC, Buff, ReadCount);
      Dec(Count, ReadCount);
    end;
    CloseHandle(Handle);
  end;
end;

initialization
  Make_CRC32Table; // ��ʼ��CRC32��

end.

