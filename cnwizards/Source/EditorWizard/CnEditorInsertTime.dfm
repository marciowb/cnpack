object CnEditorInsertTimeForm: TCnEditorInsertTimeForm
  Left = 509
  Top = 415
  BorderStyle = bsDialog
  Caption = '��������ʱ��'
  ClientHeight = 117
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '����'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object lblFmt: TLabel
    Left = 16
    Top = 18
    Width = 36
    Height = 12
    Caption = '��ʽ��'
  end
  object lblPreview: TLabel
    Left = 16
    Top = 50
    Width = 36
    Height = 12
    Caption = 'Ԥ����'
  end
  object cbbDateTimeFmt: TComboBox
    Left = 72
    Top = 16
    Width = 193
    Height = 20
    ItemHeight = 12
    TabOrder = 0
    OnChange = cbbDateTimeFmtChange
    Items.Strings = (
      'yyyy-mm-dd hh:mm:ss'
      'yyyy-mm-dd hh:mm'
      'yyyy-mm-dd hh'
      'yyyy-mm-dd')
  end
  object edtPreview: TEdit
    Left = 72
    Top = 48
    Width = 193
    Height = 20
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 70
    Top = 82
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 150
    Top = 82
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 3
  end
end
