object CnMemProfForm: TCnMemProfForm
  Left = 334
  Top = 235
  BorderStyle = bsDialog
  Caption = 'CnMemProf ����������'
  ClientHeight = 205
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpMain: TGroupBox
    Left = 8
    Top = 8
    Width = 345
    Height = 161
    Caption = 'CnMemProf �����������ã���Ҫ��װ CnMemProf��'
    TabOrder = 0
    object lblLogFile: TLabel
      Left = 24
      Top = 111
      Width = 60
      Height = 13
      Caption = '��־�ļ���'
    end
    object btnBrowse: TSpeedButton
      Left = 304
      Top = 106
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btnBrowseClick
    end
    object lblNote: TLabel
      Left = 24
      Top = 136
      Width = 299
      Height = 13
      Caption = 'ע���ļ���������Ĭ��ʹ�ó���ͬһĿ¼�µ� Memory.log'
    end
    object chkPopupMsg: TCheckBox
      Left = 8
      Top = 20
      Width = 329
      Height = 17
      Caption = '��������󵯳��ڴ汨����Ϣ��'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = UpdateContents
    end
    object chkUseObjList: TCheckBox
      Left = 8
      Top = 42
      Width = 329
      Height = 17
      Caption = '��¼�����б�'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = UpdateContents
    end
    object chkUseObjInfo: TCheckBox
      Left = 24
      Top = 64
      Width = 313
      Height = 17
      Caption = 'ʹ�� RTTI ��¼����������Ϣ'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = UpdateContents
    end
    object chkLogToFile: TCheckBox
      Left = 8
      Top = 86
      Width = 329
      Height = 17
      Caption = '��¼���ڴ�ʹ�������¼����־�ļ�'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = UpdateContents
    end
    object edtLogFile: TEdit
      Left = 88
      Top = 108
      Width = 209
      Height = 21
      TabOrder = 4
    end
  end
  object btnOK: TButton
    Left = 107
    Top = 177
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 193
    Top = 177
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 2
  end
  object btnHelp: TButton
    Left = 278
    Top = 177
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 3
    OnClick = btnHelpClick
  end
  object dlgSave: TSaveDialog
    DefaultExt = '*.log'
    Filter = '*.log|*.log|*.txt|*.txt'
    Left = 304
    Top = 80
  end
end
