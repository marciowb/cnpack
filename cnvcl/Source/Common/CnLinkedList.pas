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

unit CnLinkedList;
{* |<PRE>
================================================================================
* ������ƣ�������������
* ��Ԫ���ƣ�˫�������Listʵ�ֵ�Ԫ
* ��Ԫ���ߣ��͹�ķ��
* ����ƽ̨��PWin2000Pro + Delphi 5.01
* ���ݲ��ԣ�PWin2000/XP + Delphi 5/6/7
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id$
* ��    ע��2008.05.23
*               ��ֲ��Ԫ��ʵ�ֹ���
================================================================================
|</PRE>}

interface

{$I CnPack.inc}

uses
  Windows, Classes, SysUtils;

type
  PCnLinkedNode = ^TCnLinkedNode;
  TCnLinkedNode = packed record
  {* ˫������ڵ�ṹ}
    Previous: PCnLinkedNode; // ��һ�ڵ�
    Code: Pointer;           // ���ڵ������
    Next: PCnLinkedNode;     // ��һ�ڵ�
  end;

  ICnLinkedListIterator = interface
    ['{0380614D-F455-4FDA-8862-6E1505C0C5D4}']
  {* ˫������������ӿ�
     ʹ�÷���������

     var
       Iterator: ICnLinkedListIterator;
       List: TCnLinkedList;
     begin
       ...

       Iterator := List.CreateIterator;
       while not Iterator.Eof do
       begin
         Iterator.GetItem;
         Iterator.Next;
       end;
       
       // Iterator �����ͷţ��Զ��ͷš�
     end;
  }
    function Bof: Boolean;
    {* �Ƿ񳬹�������ͷ}
    function Eof: Boolean;
    {* �Ƿ񳬹�������β}
    procedure First;
    {* ������ͷ}
    procedure Last;
    {* ������ĩβ}
    procedure Previous;
    {* ������ǰλ�õ���һ��}
    procedure Next;
    {* ������ǰλ�õ���һ��}
    function GetCurrentItem: Pointer;
    {* �������ǰλ�õ�ֵ}
  end;

  TCnLinkedList = class(TObject)
  private
    FFirst, FLast, FNode: PCnLinkedNode;
    FCount, FIndex: Integer;
    FList: TList;
    FAutoClear: Boolean;

    FLock: TRTLCriticalSection;

    function GetItem(const Index: Integer): PCnLinkedNode;
    function GetList: TList;
  protected
    function Get(Index: Integer): Pointer;
    procedure Put(Index: Integer; Item: Pointer);
    procedure Notify(Ptr: Pointer; Action: TListNotification); virtual;
    procedure SetCount(const NewCount: Integer);

    function GetFirst: PCnLinkedNode;  // �����׽ڵ�
    function GetLast: PCnLinkedNode;   // ����β�ڵ�
    function GetBefore: PCnLinkedNode; // ����ǰһ�β��ҵĽڵ�
    function GetMiddle(const Index: Integer): PCnLinkedNode; // �����м�ڵ�

    function GetPrevious(Move: Boolean = False): PCnLinkedNode; // ������һ���ڵ�
    function GetNext(Move: Boolean = False): PCnLinkedNode;     // ������һ���ڵ�

    function AddFirst(const Item: Pointer): Boolean; // ����׽ڵ�
    function AddLast(const Item: Pointer): Boolean;  // ���β�ڵ�
    function AddMiddle(const Index: Integer; const Item: Pointer): Boolean; // ����м�ڵ�

    function DeleteFirst: Boolean; // ɾ���׽ڵ�
    function DeleteLast: Boolean;  // ɾ��β�ڵ�
    function DeleteMiddle(const Index: Integer): Boolean; // ɾ���м�ڵ�
    function DeleteLastNode: Boolean; // ɾ�����һ���ڵ�
  public
    constructor Create;
    destructor Destroy; override;
    function Add(const Item: Pointer): Integer;
    {* ���һ��Ŀ������β}
    function Delete(const Index: Integer): Integer;
    {* ɾ��ָ������������Ŀ}

    function First: Pointer;
    {* �������ͷ}
    function Last: Pointer;
    {* �������β}

    procedure Lock;
    {* ����, �����߳��в���ʹ��}
    procedure UnLock;
    {* ����, �����߳��в���ʹ��}

    // ���������ƶ�������Ӱ�쵽�ڲ���ǰָ�룬���̷߳���ʱ��Ҫ����������

    function Previous: Pointer;
    {* �������ڲ��ĵ�ǰָ���ƶ�����һ��, �糬��ͷ, ��ǰָ��Ϊ nil}
    function Next: Pointer;
    {* �������ڲ��ĵ�ǰָ���ƶ�����һ��, �糬��β, ��ǰָ��Ϊ nil}
    
    // ���ϼ����ƶ�������Ӱ�쵽�ڲ���ǰָ�룬���̷߳���ʱ��Ҫ����������

    function IndexOf(const Item: Pointer): Integer;
    {* ����һ��Ŀ��������}
    function Insert(Index: Integer; Item: Pointer): Integer;
    {* ��ָ��λ�ò���һ��Ŀ}
    function Clear: Integer;
    {* ���ȫ����Ŀ, ����ԭ����Ŀ����}

    procedure Exchange(Index1, Index2: Integer);
    {* ����������Ŀλ��}
    function Extract(Item: Pointer): Pointer;
    {* ��ȡһ�ڵ�}
    procedure Move(CurIndex, NewIndex: Integer);
    {* �ƶ��ڵ�}
    function Remove(Item: Pointer): Integer;
    {* ɾ��һ�ڵ�}
    procedure Pack;
    {* ѹ��}
    procedure Assign(AList: TCnLinkedList);
    {* ����һ˫��������}

    function CreateIterator: ICnLinkedListIterator;
    {* ����һ����������ӿڣ��ɹ����������˱������̷߳��ʰ�ȫ}

    property Items[Index: Integer]: Pointer read Get write Put; default;
    {* ��������ֱ�ӷ�����Ŀ, ��������ʱЧ�ʲ���}
    property Count: Integer read FCount write SetCount;
    {* ��Ŀ����}
    property List: TList read GetList;
    {* ����һ�������� TList, ����������������}
    property AutoClear: Boolean read FAutoClear write FAutoClear;
    {* �Ƿ���ɾ���ڵ�ʱ�Զ�Dispose�ڵ�����}
  end;

implementation

const
  SListIndexError = 'List Out of Bounds (%d).';
  SListCountError = 'Invalid List Count (%d).';

type
  TCnLinkedListIterator = class(TInterfacedObject, ICnLinkedListIterator)
  {* ˫�����������ʵ���࣬��װ��ͨ���ı�������}
  private
    FList: TCnLinkedList;
    FBof: Boolean;
    FEof: Boolean;
    FCurrent: PCnLinkedNode;
  public
    constructor Create(AList: TCnLinkedList);

    function Bof: Boolean;
    function Eof: Boolean;
    procedure First;
    procedure Last;
    procedure Previous;
    procedure Next;
    function GetCurrentItem: Pointer;
  end;

{ TCnLinkedList }

function TCnLinkedList.Add(const Item: Pointer): Integer;
begin
  Result := FCount;
  if not AddLast(Item) then
    Result := -1;
end;

function TCnLinkedList.AddFirst(const Item: Pointer): Boolean;
var
  AItem: PCnLinkedNode;
begin
  try
    AItem := New(PCnLinkedNode);
    AItem.Previous := nil;
    AItem.Code := Item;
    AItem.Next := FFirst;

    if FFirst = nil then //�������ӵ�һ���ڵ�
      FLast := AItem
    else
      FFirst.Previous := AItem;

    FFirst := AItem;

    if FIndex <> -1 then
      Inc(FIndex);

    Inc(FCount);
    if Item <> nil then
      Notify(Item, lnAdded);
    Result := True;
  except
    Result := False;
  end;
end;

function TCnLinkedList.AddLast(const Item: Pointer): Boolean;
var
  AItem: PCnLinkedNode;
begin
  try
    AItem := New(PCnLinkedNode);
    AItem.Previous := FLast;
    AItem.Code := Item;
    AItem.Next := nil;

    if FLast = nil then //�������ӵ�һ���ڵ�
      FFirst := AItem
    else
      FLast.Next := AItem;

    FLast := AItem;

    Inc(FCount);
    if Item <> nil then
      Notify(Item, lnAdded);
    Result := True;
  except
    Result := False;
  end;
end;

function TCnLinkedList.AddMiddle(const Index: Integer; const Item: Pointer): Boolean;
var
  Item_P, Item_N, AItem: PCnLinkedNode;
begin
  Result := False;
  try
    if (Index <= 0) or (Index >= FCount - 1) then
      Exit;

    Item_N := GetItem(Index); //��ǰ�ڵ�
    Item_P := GetPrevious();

    AItem := New(PCnLinkedNode);
    AItem.Previous := Item_P;
    AItem.Code := Item;
    AItem.Next := Item_N;

    Item_P.Next := AItem;
    Item_N.Previous := AItem;

    //if (FIndex <= Index) and (FIndex <> -1) then
    Inc(FIndex);

    Inc(FCount);
    if Item <> nil then
      Notify(Item, lnAdded);

    Result := True;
  except
  end;
end;

procedure TCnLinkedList.Assign(AList: TCnLinkedList);
var
  I: Integer;
begin
  Clear;
  if AList.Count = 0 then
    Exit;

  Add(AList.Items[0]);
  for I := 0 to AList.Count - 2 do
    Add(AList.Next);
end;

function TCnLinkedList.Clear: Integer;
begin
  Result := FCount;
  SetCount(0);
  FFirst := nil;
  FLast := nil;
end;

constructor TCnLinkedList.Create;
begin
  inherited Create();
  InitializeCriticalSection(FLock);

  FFirst := nil;
  FLast := nil;
  FNode := nil;
  FIndex := -1;
  FCount := 0;
  FAutoClear := False;
  FList := TList.Create;
end;

function TCnLinkedList.CreateIterator: ICnLinkedListIterator;
begin
  Result := TCnLinkedListIterator.Create(Self);
end;

function TCnLinkedList.Delete(const Index: Integer): Integer;
begin
  Result := -1;
  if (Index < 0) or (Index >= FCount) then
    Exit;

  if FCount > 1 then
  begin
    if Index = 0 then //ɾ���׽ڵ�
    begin
      DeleteFirst();
      Result := Index;
    end
    else
      if Index = FCount - 1 then //ɾ��β�ڵ�
      begin
        DeleteLast();
        Result := Index;
      end
      else
        if DeleteMiddle(Index) then
          Result := Index;
  end
  else //�����ɾ�����һ���ڵ�
  begin
    DeleteLastNode();
    Result := 0;
  end;
end;

function TCnLinkedList.DeleteFirst: Boolean;
var
  Item: PCnLinkedNode;
begin
  Result := False;

  if FFirst = nil then
    Exit;

  Item := FFirst;
  FFirst := FFirst.Next;
  FFirst.Previous := nil;

  if FIndex = 0 then
    FNode := FFirst
  else
    if FIndex <> -1 then
      Dec(FIndex);

  Dec(FCount);
  if Item.Code <> nil then
  begin
    Notify(Item.Code, lnDeleted);
    if FAutoClear then
      Dispose(Item.Code);
  end;
  Dispose(Item);

  Result := True;
end;

function TCnLinkedList.DeleteLast: Boolean;
var
  Item: PCnLinkedNode;
begin
  Result := False;

  if FLast = nil then
    Exit;

  Item := FLast;
  FLast := FLast.Previous;
  FLast.Next := nil;

  if FIndex = FCount - 1 then
  begin
    Dec(FIndex);
    FNode := FLast;
  end;

  Dec(FCount);
  if Item.Code <> nil then
  begin
    Notify(Item.Code, lnDeleted);
    if FAutoClear then
      Dispose(Item.Code);
  end;
  Dispose(Item);

  Result := True;
end;

function TCnLinkedList.DeleteLastNode: Boolean;
var
  Item: PCnLinkedNode;
begin
  Result := False;
  if FCount > 1 then
    Exit;

  Item := FFirst;

  FFirst := nil;
  FLast := nil;
  FNode := nil;
  FIndex := -1;

  Dec(FCount);
  if Item.Code <> nil then
  begin
    Notify(Item.Code, lnDeleted);
    if FAutoClear then
      Dispose(Item.Code);
  end;
  Dispose(Item);

  Result := True;
end;

function TCnLinkedList.DeleteMiddle(const Index: Integer): Boolean;
var
  Item_P, Item_N, Item: PCnLinkedNode;
begin
  Result := False;

  if (Index <= 0) or (Index >= FCount - 1) then
    Exit;

  Item := GetItem(Index); //��ǰ�ڵ�
  Item_P := GetPrevious(); //��һ�ڵ�
  Item_N := GetNext(); //��һ�ڵ�

  Item_P.Next := Item_N;
  Item_N.Previous := Item_P;

  FNode := Item_N;
{
  if FNode = Item then //�����ѯ�ýڵ�Ϊ��ǰҪɾ���Ľڵ�
    FNode := Item_N
  else
    if FIndex > Index then //���ɾ����ѯ�ڵ�ǰ�Ľڵ�
      Dec(FIndex);
}
  Dec(FCount);
  if Item.Code <> nil then
  begin
    Notify(Item.Code, lnDeleted);
    if FAutoClear then
      Dispose(Item.Code);
  end;

  DisPose(Item);
  Result := True;
end;

destructor TCnLinkedList.Destroy;
begin
  Lock();
  try
    if Assigned(FList) then
      FreeAndNil(FList);

    Clear;
    FIndex := -1;
    FNode := nil;
    FFirst := nil;
    FLast := nil;
  finally
    UnLock();
    DeleteCriticalSection(FLock);
  end;
  inherited Destroy();
end;

procedure TCnLinkedList.Exchange(Index1, Index2: Integer);
var
  Item: Pointer;
begin
  if (Index1 < 0) or (Index1 >= FCount) then
    raise Exception.Create(Format(SListIndexError, [Index1]));
  if (Index2 < 0) or (Index2 >= FCount) then
    raise Exception.Create(Format(SListIndexError, [Index2]));

  Item := Get(Index1);
  Put(Index1, Get(Index2));
  Put(Index2, Item);
end;

function TCnLinkedList.Extract(Item: Pointer): Pointer;
var
  I: Integer;
  AAutoClear: Boolean;
begin
  I := IndexOf(Item);
  if I >= 0 then
  begin
    Result := Item;
    AAutoClear := FAutoClear;
    FAutoClear := False;
    Delete(I);
    FAutoClear := AAutoClear;
    Notify(Result, lnExtracted);
  end
  else
    Result := nil;
end;

function TCnLinkedList.First: Pointer;
begin
  Result := FFirst.Code;
end;

function TCnLinkedList.Get(Index: Integer): Pointer;
var
  Item: PCnLinkedNode;
begin
  Item := GetItem(Index);
  if Item <> nil then
    Result := Item.Code
  else
    Result := nil;
end;

function TCnLinkedList.GetBefore: PCnLinkedNode;
begin
  Result := FNode;
end;

function TCnLinkedList.GetFirst: PCnLinkedNode;
begin
  Result := FFirst;
  if FFirst = nil then
    Exit;

  FIndex := 0;
  FNode := FFirst;
end;

function TCnLinkedList.GetItem(const Index: Integer): PCnLinkedNode;
begin
  Result := nil;
  if (Index < 0) or (Index >= FCount) then
    Exit;

  if Index = 0 then //�����׽ڵ�
    Result := GetFirst
  else
    if Index = FCount - 1 then //����β�ڵ�
      Result := GetLast
    else
      if Index = FIndex - 1 then //������β������ϴβ��ҵ�ǰһ�ڵ�
        Result := GetPrevious(True)
      else
        if Index = FIndex + 1 then //������β������ϴβ��ҵĺ�һ�ڵ�
          Result := GetNext(True)
        else
          if Index = FIndex then //������β���λ�ú��ϴβ�����ͬ
            Result := GetBefore
          else
            Result := GetMiddle(Index);
end;

function TCnLinkedList.GetLast: PCnLinkedNode;
begin
  Result := FLast;
  if FLast = nil then
    Exit;

  FNode := FLast;
  FIndex := FCount - 1;
end;

function TCnLinkedList.GetList: TList;
var
  Index: Integer;
begin
  FList.Clear;
  if FCount <> 0 then
  begin
    FList.Add(Get(0));
    for Index := 0 to FCount - 2 do
      FList.Add(Next());
  end;

  Result := FList;
end;

function TCnLinkedList.GetMiddle(const Index: Integer): PCnLinkedNode;
var
  I, IFirst, ILast, ICode: Integer;
  PFirst, PLast: PCnLinkedNode;
begin
  if FIndex = -1 then //����ǵ�һ�β���
  begin
    FIndex := 0;
    FNode := FFirst;
  end
  else //����ϴβ��ҽڵ�λ�ñ����ڵ��
  begin
    FIndex := FCount - 1;
    FNode := FLast;
  end;

  if Index < FIndex then //������β��ҽڵ����ϴβ��ҽڵ�֮ǰ
  begin
    IFirst := 0; //ѭ��������ʼֵ
    ILast := FIndex; //ѭ��������ֵֹ
    PFirst := FFirst; //ѭ��������ʼ�ڵ�
    PLast := FNode; //ѭ��������ֹ�ڵ�
  end
  else
  begin
    IFirst := FIndex; //ѭ��������ʼֵ
    ILast := FCount - 1; //ѭ��������ֵֹ
    PFirst := FNode; //ѭ��������ʼ�ڵ�
    PLast := FLast; //ѭ��������ֹ�ڵ�
  end;
  ICode := (ILast - IFirst) div 2; //�����м�ֵ

  if Index < ICode then //���������ű��м�ֵС�ʹ���ʼλ�ÿ�ʼ����
  begin
    Result := PFirst;
    I := IFirst;
    while I <> Index do
    begin
      Result := Result.Next;
      Inc(I);
    end;
  end
  else //���������ű��м�ֵС�ʹ���ֹλ�ÿ�ʼ����
  begin
    Result := PLast;
    I := ILast;
    while I <> Index do
    begin
      Result := Result.Previous;
      Dec(I);
    end;
  end;

  FNode := Result;
  FIndex := Index;
end;

function TCnLinkedList.GetNext(Move: Boolean): PCnLinkedNode;
begin
  Result := nil;
  if FNode = nil then
    Exit;

  Result := FNode.Next;
  if Move then
  begin
    Inc(FIndex);
    FNode := FNode.Next;
  end;
end;

function TCnLinkedList.GetPrevious(Move: Boolean): PCnLinkedNode;
begin
  Result := nil;
  if FNode.Previous = nil then
    Exit;

  Result := FNode.Previous;
  if Move then
  begin
    Dec(FIndex);
    FNode := FNode.Previous;
  end;
end;

function TCnLinkedList.IndexOf(const Item: Pointer): Integer;
begin
  Result := 0;
  while (Result < FCount) and (Item <> Get(Result)) do
    Inc(Result);

  if Result = FCount then
    Result := -1;
end;

function TCnLinkedList.Insert(Index: Integer; Item: Pointer): Integer;
var
  Flag: Boolean;
begin
  Result := -1;
  if Index < 0 then
    Exit;

  if Index = 0 then
    Flag := AddFirst(Item)
  else
    if Index >= FCount - 1 then
      Flag := AddLast(Item)
    else
      Flag := AddMiddle(Index, Item);

  if Flag then
    Result := Index;
end;

function TCnLinkedList.Last: Pointer;
begin
  Result := FLast.Code;
end;

procedure TCnLinkedList.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TCnLinkedList.Move(CurIndex, NewIndex: Integer);
var
  Item: Pointer;
  AAutoClear: Boolean;
begin
  if CurIndex <> NewIndex then
  begin
    if (NewIndex < 0) or (NewIndex >= FCount) then
      raise Exception.Create(Format(SListIndexError, [NewIndex]));

    Item := Get(CurIndex);
    AAutoClear := FAutoClear;
    FAutoClear := False;
    Delete(CurIndex);
    FAutoClear := AAutoClear;
    Insert(NewIndex, Item);
  end;
end;

function TCnLinkedList.Next: Pointer;
begin
  FNode := FNode.Next;
  Inc(FIndex);
  Result := FNode.Code;
end;

procedure TCnLinkedList.Notify(Ptr: Pointer; Action: TListNotification);
begin
end;

procedure TCnLinkedList.Pack;
var
  I: Integer;
begin
  for I := FCount - 1 downto 0 do
    if Get(I) = nil then
      Delete(I);
end;

function TCnLinkedList.Previous: Pointer;
begin
  FNode := FNode.Previous;
  Dec(FIndex);
  Result := FNode.Code;
end;

procedure TCnLinkedList.Put(Index: Integer; Item: Pointer);
var
  Code: Pointer;
begin
  if (Index < 0) or (Index >= FCount) then
    raise Exception.Create(Format(SListIndexError, [Index]));

  Code := Get(Index);
  if Item <> Code then
  begin
    GetItem(Index).Code := Item;
    if Code <> nil then
      Notify(Code, lnDeleted);
    if Item <> nil then
      Notify(Item, lnAdded);
  end;
end;

function TCnLinkedList.Remove(Item: Pointer): Integer;
begin
  Result := IndexOf(Item);
  if Result >= 0 then
    Delete(Result);
end;

procedure TCnLinkedList.SetCount(const NewCount: Integer);
var
  I: Integer;
begin
  if NewCount < 0 then
    raise Exception.Create(Format(SListCountError, [NewCount]));

  if NewCount > FCount then
    for I := 0 to NewCount - FCount do
      Add(nil)
  else
    for I := FCount - 1 downto NewCount do
      Delete(I);
  FCount := NewCount;
end;

procedure TCnLinkedList.UnLock;
begin
  LeaveCriticalSection(FLock);
end;

{ TCnLinkedListIterator }

function TCnLinkedListIterator.Bof: Boolean;
begin
  Result := FBof;
end;

constructor TCnLinkedListIterator.Create(AList: TCnLinkedList);
begin
  inherited Create();

  FList := AList;
  if FList.Count = 0 then
  begin
    FBof := True;
    FEof := True;
  end
  else
    First;
end;

function TCnLinkedListIterator.Eof: Boolean;
begin
  Result := FEof;
end;

procedure TCnLinkedListIterator.First;
begin
  FCurrent := FList.FFirst;
  if FCurrent = nil then
    FBof := True;
end;

function TCnLinkedListIterator.GetCurrentItem: Pointer;
begin
  if FCurrent <> nil then
    Result := FCurrent^.Code
  else
    Result := nil;
end;

procedure TCnLinkedListIterator.Last;
begin
  FCurrent := FList.FLast;
  if FCurrent = nil then
    FEof := True;
end;

procedure TCnLinkedListIterator.Next;
begin
  if FEof then
    Exit;

  FCurrent := FCurrent^.Next;
  FBof := False;
  if FCurrent = nil then
    FEof := True;
end;

procedure TCnLinkedListIterator.Previous;
begin
  if FBof then
    Exit;

  FCurrent := FCurrent^.Previous;
  FEof := False;
  if FCurrent = nil then
    FBof := True;
end;

end.
