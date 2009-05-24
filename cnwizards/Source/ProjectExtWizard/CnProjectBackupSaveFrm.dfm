object CnProjectBackupSaveForm: TCnProjectBackupSaveForm
  Left = 429
  Top = 247
  BorderStyle = bsDialog
  Caption = '����ѹ������ѡ��'
  ClientHeight = 369
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '����'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object btnOK: TButton
    Left = 146
    Top = 335
    Width = 75
    Height = 21
    Caption = '����(&S)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 224
    Top = 335
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 2
  end
  object btnHelp: TButton
    Left = 302
    Top = 335
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 3
    OnClick = btnHelpClick
  end
  object pgc1: TPageControl
    Left = 8
    Top = 8
    Width = 369
    Height = 318
    ActivePage = ts1
    TabOrder = 0
    object ts1: TTabSheet
      Caption = '����ѹ��ѡ��(Z)'
      object grpSave: TGroupBox
        Left = 8
        Top = 8
        Width = 345
        Height = 89
        Caption = '����ѹ������Ŀ��(&D)'
        TabOrder = 0
        object lblFile: TLabel
          Left = 16
          Top = 27
          Width = 48
          Height = 12
          Caption = '����Ϊ��'
        end
        object lblTime: TLabel
          Left = 16
          Top = 57
          Width = 120
          Height = 12
          Caption = '�ļ�������ʱ���ʽ��'
        end
        object btnSelect: TButton
          Left = 309
          Top = 23
          Width = 21
          Height = 21
          Hint = 'ѡ�񱣴��Ŀ���ļ�'
          Caption = '...'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnSelectClick
        end
        object edtFile: TEdit
          Left = 64
          Top = 23
          Width = 241
          Height = 20
          TabOrder = 0
          OnChange = edtFileChange
        end
        object cbbTimeFormat: TComboBox
          Left = 144
          Top = 54
          Width = 187
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 2
          OnChange = cbbTimeFormatChange
          Items.Strings = (
            'yyyy-mm-dd'
            'yyyy-mm-dd_hh-mm-ss'
            'yyyy-mm-dd_hh-mm'
            'yyyy-mm-dd_hh')
        end
      end
      object grp1: TGroupBox
        Left = 8
        Top = 109
        Width = 345
        Height = 173
        Caption = '����ѹ��ѡ��(&O)'
        TabOrder = 1
        object lblSecond: TLabel
          Left = 32
          Top = 111
          Width = 36
          Height = 12
          Caption = 'ȷ�ϣ�'
        end
        object lblPass: TLabel
          Left = 32
          Top = 81
          Width = 36
          Height = 12
          Caption = '���룺'
        end
        object chkRememberPass: TCheckBox
          Left = 88
          Top = 140
          Width = 233
          Height = 17
          Caption = '��ס����'
          TabOrder = 4
          OnClick = chkPasswordClick
        end
        object edtSecond: TEdit
          Left = 88
          Top = 77
          Width = 241
          Height = 20
          PasswordChar = '*'
          TabOrder = 2
        end
        object edtPass: TEdit
          Left = 88
          Top = 107
          Width = 241
          Height = 20
          PasswordChar = '*'
          TabOrder = 3
        end
        object chkPassword: TCheckBox
          Left = 16
          Top = 50
          Width = 321
          Height = 17
          Caption = '����ѹ���ļ�'
          TabOrder = 1
          OnClick = chkPasswordClick
        end
        object chkRemovePath: TCheckBox
          Left = 16
          Top = 26
          Width = 321
          Height = 17
          Caption = 'ɾ��·����Ϣ�����ܵ���ͬ���ļ��޷����棩'
          TabOrder = 0
        end
      end
    end
    object ts2: TTabSheet
      Caption = '�ⲿѹ������(&E)'
      ImageIndex = 1
      object grp2: TGroupBox
        Left = 8
        Top = 8
        Width = 345
        Height = 274
        Caption = '�ⲿѹ������(&O)'
        TabOrder = 0
        object lblPredefine: TLabel
          Left = 34
          Top = 90
          Width = 96
          Height = 12
          Caption = 'Ԥ�������и�ʽ��'
        end
        object lblCompressor: TLabel
          Left = 34
          Top = 59
          Width = 60
          Height = 12
          Caption = 'ѹ������'
        end
        object lblCmd: TLabel
          Left = 16
          Top = 120
          Width = 48
          Height = 12
          Caption = '�����У�'
        end
        object chkUseExternal: TCheckBox
          Left = 16
          Top = 26
          Width = 273
          Height = 17
          Caption = 'ʹ���ⲿѹ������'
          TabOrder = 0
          OnClick = chkUseExternalClick
        end
        object cbbPredefine: TComboBox
          Left = 156
          Top = 86
          Width = 175
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 3
          OnChange = cbbPredefineChange
          Items.Strings = (
            'RAR(rar.exe)'
            'RAR(rar.exe) -ep'
            '7-Zip(7z.exe)'
            'WinZip(zip.exe/wzzip.exe)')
        end
        object edtCompressor: TEdit
          Left = 96
          Top = 55
          Width = 209
          Height = 20
          TabOrder = 1
          OnChange = edtFileChange
        end
        object btnCompressor: TButton
          Left = 309
          Top = 55
          Width = 21
          Height = 21
          Hint = 'ѡ���ⲿѹ������'
          Caption = '...'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnCompressorClick
        end
        object mmoCmd: TMemo
          Left = 16
          Top = 144
          Width = 313
          Height = 113
          TabOrder = 4
        end
      end
    end
    object tsAfter: TTabSheet
      Caption = '���ݺ�֪ͨ(&A)'
      ImageIndex = 2
      object grpAfter: TGroupBox
        Left = 8
        Top = 8
        Width = 345
        Height = 274
        Caption = '���ݺ�֪ͨ����(&N)'
        TabOrder = 0
        object lblPreParams: TLabel
          Left = 34
          Top = 90
          Width = 96
          Height = 12
          Caption = 'Ԥ�������и�ʽ��'
        end
        object lblAfterCmd: TLabel
          Left = 34
          Top = 59
          Width = 48
          Height = 12
          Caption = '�����У�'
        end
        object lblPreCmd: TLabel
          Left = 16
          Top = 120
          Width = 48
          Height = 12
          Caption = '�����У�'
        end
        object chkExecAfter: TCheckBox
          Left = 16
          Top = 26
          Width = 273
          Height = 17
          Caption = '������Ϻ�ִ������'
          TabOrder = 0
          OnClick = chkUseExternalClick
        end
        object cbbParams: TComboBox
          Left = 156
          Top = 86
          Width = 175
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 3
          OnChange = cbbParamsChange
          Items.Strings = (
            '<No Param>'
            '<BackupFile>')
        end
        object edtAfterCmd: TEdit
          Left = 96
          Top = 55
          Width = 209
          Height = 20
          TabOrder = 1
          OnChange = edtFileChange
        end
        object btnAfterCmd: TButton
          Left = 309
          Top = 55
          Width = 21
          Height = 21
          Hint = 'ѡ���ⲿ����'
          Caption = '...'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnAfterCmdClick
        end
        object mmoAfterCmd: TMemo
          Left = 16
          Top = 144
          Width = 313
          Height = 113
          TabOrder = 4
        end
      end
    end
  end
  object dlgSave: TSaveDialog
    Filter = 
      'Zip Files(*.zip)|*.zip|Rar Files(*.rar)|*.rar|7-Zip Files(*.7z)|' +
      '*.7z|All Files(*.*)|*.*'
    Left = 288
    Top = 56
  end
  object dlgOpenCompressor: TOpenDialog
    Filter = '*.exe;*.com|*.com;*.exe'
    Left = 252
    Top = 55
  end
end
