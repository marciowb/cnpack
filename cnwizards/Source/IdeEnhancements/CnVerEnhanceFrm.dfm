inherited CnVerEnhanceForm: TCnVerEnhanceForm
  Left = 427
  Top = 392
  BorderStyle = bsDialog
  Caption = '�汾��Ϣ��չר������'
  ClientHeight = 125
  ClientWidth = 403
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpVerEnh: TGroupBox
    Left = 8
    Top = 8
    Width = 387
    Height = 81
    Caption = '�汾��Ϣ��չר������(&V)'
    TabOrder = 0
    object lblNote: TLabel
      Left = 24
      Top = 56
      Width = 312
      Height = 13
      Caption = '��ע��������ѡ��ֻ�ڹ���ѡ���а����汾��Ϣʱ��Ч����'
    end
    object chkLastCompiled: TCheckBox
      Left = 8
      Top = 16
      Width = 377
      Height = 17
      Caption = '�汾��Ϣ�в������ʱ�� ���������� Delphi 6 �����ϰ汾����'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkIncBuild: TCheckBox
      Left = 8
      Top = 36
      Width = 377
      Height = 17
      Caption = '����ʱ�Զ����� Build �� ���������� Delphi 6 �����ϰ汾����'
      TabOrder = 1
    end
  end
  object btnOK: TButton
    Left = 157
    Top = 96
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 239
    Top = 96
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 2
  end
  object btnHelp: TButton
    Left = 320
    Top = 96
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = '����(&H)'
    TabOrder = 3
    OnClick = btnHelpClick
  end
end
