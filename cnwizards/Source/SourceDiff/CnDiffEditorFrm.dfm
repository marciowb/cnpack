object CnDiffEditorForm: TCnDiffEditorForm
  Left = 251
  Top = 196
  Width = 678
  Height = 202
  Caption = 'ƴ���ı��༭'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 670
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 176
      Top = 11
      Width = 368
      Height = 13
      Caption = 
        '��ʾ: Ctrl+Enter ���棬Esc ȡ��������ԭ�ı����������ݽ��Զ���ȥ' +
        '��'
    end
    object bSave: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 21
      Caption = '����(&S)'
      ModalResult = 1
      TabOrder = 0
    end
    object bCancel: TButton
      Left = 90
      Top = 6
      Width = 75
      Height = 21
      Cancel = True
      Caption = 'ȡ��(&C)'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 33
    Width = 670
    Height = 142
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
    OnKeyPress = MemoKeyPress
  end
  object ActionList: TActionList
    Left = 8
    Top = 40
    object actSave: TAction
      Caption = 'actSave'
      ShortCut = 16397
      OnExecute = actSaveExecute
    end
    object actCancel: TAction
      Caption = 'actCancel'
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
end
