{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     �й����Լ��Ŀ���Դ�������������                         }
{                   (C)Copyright 2001-2012 CnPack ������                       }
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

unit CnFmxUtils;
{* |<PRE>
================================================================================
* ������ƣ�CnPack IDE ר�Ұ�
* ��Ԫ���ƣ�FMX��صĹ��̿ⵥԪ
* ��Ԫ���ߣ�CnPack ������
* ��    ע���õ�Ԫ������ XE2 ����FMX��ص�һЩ���ݡ�
*           ����Ԫ��ʹ��Vcl��TControl��ܣ�ֻʹ��FMX�ġ�
*           ������Ԫ��ֻʹ��Vcl��TControl��ܣ��������FMX����ز�����
*           ����Ҫ����˵�Ԫ����ʵ������ܸ����Ŀ�ġ�
* ����ƽ̨��WinXP + Delphi XE2
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7 + C++Builder 5/6
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id: CnFmxUtils.pas 952 2011-07-25 08:08:55Z liuxiaoshanzhashu@gmail.com $
* �޸ļ�¼��2011.10.02 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

interface

{$I CnPack.inc}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs;

type
  TCnFmxPosType = (fptLeft, fptTop, fptRight, fptBottom, fptWidth, fptHeight);

function CnFmxGetObjectParent(AObject: TComponent): TComponent;

function CnFmxGetControlParent(AControl: TComponent): TComponent;

function CnFmxGetControlsCount(AControl: TComponent): Integer;

function CnFmxGetControlByIndex(AControl: TComponent; Index: Integer): TControl;

function CnFmxIsInheritedFromClassByName(AObject: TObject; AClassName: string): Boolean;

function CnFmxIsInheritedFromControl(AObject: TObject): Boolean;

function CnFmxIsInheritedFromForm(AObject: TObject): Boolean;

function CnFmxIsInheritedFromCommonCustomForm(AObject: TObject): Boolean;

function CnFmxGetControlRect(AControl: TComponent): TRect;

procedure CnFmxSetControlRect(AControl: TComponent; ARect: TRect);

function CnFmxGetControlPositionValue(AControl: TComponent;
  PosType: TCnFmxPosType): Integer;

procedure CnFmxSetControlPositionValue(AControl: TComponent; AValue: Single;
  PosType: TCnFmxPosType);

procedure CnFmxControlBringToFront(AControl: TComponent);

procedure CnFmxControlSendToBack(AControl: TComponent);

implementation

{$IFDEF DEBUG}
uses
  CnDebug;
{$ENDIF}

type
  TControlHack = class(TControl);

function CnFmxGetObjectParent(AObject: TComponent): TComponent;
begin
  if AObject.InheritsFrom(TFmxObject) then
    Result := TFmxObject(AObject).Parent
  else
    Result := nil;
end;

function CnFmxGetControlParent(AControl: TComponent): TComponent;
begin
  if AControl.InheritsFrom(TControl) then
    Result := TControl(AControl).Parent
  else
    Result := nil;
end;

function CnFmxGetControlsCount(AControl: TComponent): Integer;
begin
  if (AControl = nil) or not (AControl is TControl) then
    Result := -1
  else
    Result := TControl(AControl).ControlsCount;
end;

function CnFmxGetControlByIndex(AControl: TComponent; Index: Integer): TControl;
begin
  if (AControl = nil) or not (AControl is TControl) then
    Result := nil
  else
    Result := TControl(AControl).Controls[Index];
end;

function CnFmxIsInheritedFromClassByName(AObject: TObject; AClassName: string): Boolean;
var
  AClass: TPersistentClass;
begin
  Result := False;
  AClass := GetClass(AClassName);
  if AClass = nil then
    Exit;

  Result := AObject.InheritsFrom(AClass);
end;

function CnFmxIsInheritedFromControl(AObject: TObject): Boolean;
begin
  Result := AObject.InheritsFrom(TControl);
end;

function CnFmxIsInheritedFromForm(AObject: TObject): Boolean;
begin
  Result := AObject.InheritsFrom(FMX.Forms.TForm);
end;

function CnFmxIsInheritedFromCommonCustomForm(AObject: TObject): Boolean;
begin
  Result := AObject.InheritsFrom(FMX.Forms.TCommonCustomForm);
end;

function CnFmxGetControlRect(AControl: TComponent): TRect;
var
  P: TPointF;
  AParent: TFmxObject;
begin
  // Local �� Absolute �����ת����� AV�����û��֧�֣���ʱȫʹ���������
  // Ҳ����˵ֻ֧��ͬһ Parent �µ�
  if (AControl <> nil) and AControl.InheritsFrom(TControl) then
  begin
    AParent := TControl(AControl).Parent;
    if (AParent <> nil)
      and (AParent.InheritsFrom(TControl) or AParent.InheritsFrom(TForm)) then
    begin
      P.X := TControl(AControl).Position.X;
      P.Y := TControl(AControl).Position.Y;
      // P := TControl(AParent).LocalToAbsolute(P);
      Result.Left := Trunc(P.X);
      Result.Top := Trunc(P.Y);

      P.X := TControl(AControl).Position.X + TControl(AControl).Width;
      P.Y := TControl(AControl).Position.Y + TControl(AControl).Height;
      // P := TControl(AParent).LocalToAbsolute(P);
      Result.Right := Trunc(P.X);
      Result.Bottom := Trunc(P.Y);
    end;
  end;
end;

procedure CnFmxSetControlRect(AControl: TComponent; ARect: TRect);
var
  P1, P2: TPointF;
  AParent: TFmxObject;
begin
  if (AControl <> nil) and AControl.InheritsFrom(TControl) then
  begin
    AParent := TControl(AControl).Parent;
    if (AParent <> nil)
      and (AParent.InheritsFrom(TControl) or AParent.InheritsFrom(TForm)) then
    begin
      P1.X := ARect.Left;
      P1.Y := ARect.Top;
      P2.X := ARect.Right;
      P2.Y := ARect.Bottom;
      // P1 := TControl(AParent).AbsoluteToLocal(P1);
      // P2 := TControl(AParent).AbsoluteToLocal(P2);
      TControl(AControl).SetBounds(P1.X, P1.Y, P2.X - P1.X, P2.Y - P1.Y);
    end;
  end;
end;

function CnFmxGetControlPositionValue(AControl: TComponent;
  PosType: TCnFmxPosType): Integer;
begin
  Result := -1;
  if AControl <> nil then
  begin
    if AControl.InheritsFrom(TControl) then
    begin
      case PosType of
        fptLeft:
          Result := Trunc(TControl(AControl).Position.X);
        fptTop:
          Result := Trunc(TControl(AControl).Position.Y);
        fptRight:
          Result := Trunc(TControl(AControl).Position.X + TControl(AControl).Width);
        fptBottom:
          Result := Trunc(TControl(AControl).Position.Y + TControl(AControl).Height);
        fptWidth:
          Result := Trunc(TControl(AControl).Width);
        fptHeight:
          Result := Trunc(TControl(AControl).Height);
      end;
    end
    else if AControl.InheritsFrom(TCustomForm) then
    begin
      case PosType of
        fptLeft:
          Result := Trunc(TCustomForm(AControl).Left);
        fptTop:
          Result := Trunc(TCustomForm(AControl).Top);
        fptRight:
          Result := Trunc(TCustomForm(AControl).Left + TControl(AControl).Width);
        fptBottom:
          Result := Trunc(TCustomForm(AControl).Top + TControl(AControl).Height);
        fptWidth:
          Result := Trunc(TCustomForm(AControl).Width);
        fptHeight:
          Result := Trunc(TCustomForm(AControl).Height);
      end;
    end;
  end;
end;

procedure CnFmxSetControlPositionValue(AControl: TComponent; AValue: Single;
  PosType: TCnFmxPosType);
begin
  if AControl <> nil then
  begin
    if  AControl.InheritsFrom(TControl) then
    begin
      case PosType of
        fptLeft:
          TControl(AControl).Position.X := Trunc(AValue);
        fptTop:
          TControl(AControl).Position.Y := Trunc(AValue);
        fptRight:
          TControl(AControl).Width := Trunc(AValue - TControl(AControl).Position.X);
        fptBottom:
          TControl(AControl).Height := Trunc(AValue - TControl(AControl).Position.Y);
        fptWidth:
          TControl(AControl).Width := Trunc(AValue);
        fptHeight:
          TControl(AControl).Height := Trunc(AValue);
      end;
    end
    else if AControl.InheritsFrom(TCustomForm) then
    begin
      case PosType of
        fptLeft:
          TCustomForm(AControl).Left := Trunc(AValue);
        fptTop:
          TCustomForm(AControl).Top := Trunc(AValue);
        fptRight:
          TCustomForm(AControl).Width := Trunc(AValue - TCustomForm(AControl).Left);
        fptBottom:
          TCustomForm(AControl).Height := Trunc(AValue - TCustomForm(AControl).Top);
        fptWidth:
          TCustomForm(AControl).Width := Trunc(AValue);
        fptHeight:
          TCustomForm(AControl).Height := Trunc(AValue);
      end;
    end;
  end;
end;

procedure CnFmxControlBringToFront(AControl: TComponent);
begin
  if (AControl <> nil) and AControl.InheritsFrom(TFmxObject) then
    TFmxObject(AControl).BringToFront;
end;

procedure CnFmxControlSendToBack(AControl: TComponent);
begin
  if (AControl <> nil) and AControl.InheritsFrom(TFmxObject) then
    TFmxObject(AControl).SendToBack;
end;

end.