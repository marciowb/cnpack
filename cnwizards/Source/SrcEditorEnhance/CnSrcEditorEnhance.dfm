object CnSrcEditorEnhanceForm: TCnSrcEditorEnhanceForm
  Left = 300
  Top = 126
  BorderStyle = bsDialog
  Caption = '����༭����չר������'
  ClientHeight = 453
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TButton
    Left = 158
    Top = 422
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 238
    Top = 422
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 2
  end
  object btnHelp: TButton
    Left = 318
    Top = 422
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 3
    OnClick = btnHelpClick
  end
  object pgc1: TPageControl
    Left = 8
    Top = 8
    Width = 385
    Height = 406
    ActivePage = ts1
    TabOrder = 0
    object ts1: TTabSheet
      Caption = '�༭����ǿ(&E)'
      object grpEditorEnh: TGroupBox
        Left = 8
        Top = 8
        Width = 361
        Height = 169
        Caption = '����༭���˵���չ(&F)'
        TabOrder = 0
        object lbl4: TLabel
          Left = 26
          Top = 60
          Width = 64
          Height = 13
          Caption = 'ִ��������:'
        end
        object chkAddMenuCloseOtherPages: TCheckBox
          Left = 8
          Top = 16
          Width = 350
          Height = 17
          Caption = '�ڱ༭���Ҽ��˵������ӡ��ر�����ҳ�桱�˵��'
          TabOrder = 0
        end
        object chkAddMenuSelAll: TCheckBox
          Left = 8
          Top = 100
          Width = 350
          Height = 17
          Caption = '�ڱ༭���Ҽ��˵������ӡ�ѡ��ȫ�����˵��'
          TabOrder = 4
        end
        object chkAddMenuExplore: TCheckBox
          Left = 8
          Top = 36
          Width = 350
          Height = 17
          Caption = '�ڱ༭���Ҽ��˵������ӡ�����Դ�������д򿪡��˵��'
          TabOrder = 1
          OnClick = UpdateContent
        end
        object chkCodeCompletion: TCheckBox
          Left = 8
          Top = 140
          Width = 193
          Height = 17
          Caption = '���Ӵ����Զ���ɵ��ȼ���'
          TabOrder = 6
          OnClick = UpdateContent
        end
        object hkCodeCompletion: THotKey
          Left = 208
          Top = 140
          Width = 137
          Height = 19
          HotKey = 32833
          InvalidKeys = [hcNone, hcShift]
          Modifiers = [hkAlt]
          TabOrder = 7
        end
        object chkAddMenuShellMenu: TCheckBox
          Left = 8
          Top = 120
          Width = 350
          Height = 17
          Caption = '�ڱ༭���Ҽ��˵������ӡ���ǹ����˵����˵��'
          TabOrder = 5
        end
        object chkAddMenuCopyFileName: TCheckBox
          Left = 8
          Top = 80
          Width = 350
          Height = 17
          Caption = '�ڱ༭���Ҽ��˵������ӡ�����������·����/�ļ������˵���'
          TabOrder = 3
        end
        object edtExploreCmdLine: TEdit
          Left = 104
          Top = 56
          Width = 241
          Height = 21
          TabOrder = 2
        end
      end
      object grpAutoReadOnly: TGroupBox
        Left = 8
        Top = 180
        Width = 361
        Height = 189
        Caption = 'Դ����ֻ������(&R)'
        TabOrder = 1
        object lblDir: TLabel
          Left = 8
          Top = 137
          Width = 36
          Height = 13
          Caption = 'Ŀ¼��'
        end
        object chkAutoReadOnly: TCheckBox
          Left = 8
          Top = 17
          Width = 345
          Height = 17
          Caption = '������Ŀ¼�е�Դ�ļ�ʱ�Զ�ֻ��������'
          TabOrder = 0
          OnClick = UpdateContent
        end
        object lbReadOnlyDirs: TListBox
          Left = 8
          Top = 40
          Width = 337
          Height = 85
          ItemHeight = 13
          TabOrder = 1
          OnClick = lbReadOnlyDirsClick
        end
        object edtDir: TEdit
          Left = 48
          Top = 133
          Width = 273
          Height = 21
          TabOrder = 2
        end
        object btnSelectDir: TButton
          Left = 325
          Top = 133
          Width = 21
          Height = 21
          Caption = '...'
          TabOrder = 3
          OnClick = btnSelectDirClick
        end
        object btnReplace: TButton
          Left = 63
          Top = 159
          Width = 75
          Height = 21
          Action = actReplace
          TabOrder = 4
        end
        object btnAdd: TButton
          Left = 143
          Top = 159
          Width = 75
          Height = 21
          Action = actAdd
          TabOrder = 5
        end
        object btnDel: TButton
          Left = 223
          Top = 159
          Width = 75
          Height = 21
          Action = actDelete
          Cancel = True
          TabOrder = 6
        end
      end
    end
    object ts2: TTabSheet
      Caption = '�кż�������(&V)'
      ImageIndex = 1
      object grpLineNumber: TGroupBox
        Left = 8
        Top = 110
        Width = 361
        Height = 145
        Caption = '�к���ʾ(&L)'
        TabOrder = 1
        object lbl1: TLabel
          Left = 42
          Top = 120
          Width = 84
          Height = 13
          Caption = '�̶���ʾλ����'
        end
        object lbl2: TLabel
          Left = 42
          Top = 80
          Width = 84
          Height = 13
          Caption = '������ʾλ����'
        end
        object chkShowLineNumber: TCheckBox
          Left = 8
          Top = 14
          Width = 350
          Height = 17
          Caption = '�ڱ༭����������ʾ�кŵĹ��ܡ�'
          TabOrder = 0
          OnClick = UpdateContent
        end
        object rbLinePanelAutoWidth: TRadioButton
          Left = 24
          Top = 53
          Width = 321
          Height = 17
          Caption = '�к�������Զ�������'
          Checked = True
          TabOrder = 4
          TabStop = True
          OnClick = UpdateContent
        end
        object rbLinePanelFixedWidth: TRadioButton
          Left = 24
          Top = 99
          Width = 321
          Height = 17
          Caption = '�к����̶���ȡ�'
          TabOrder = 6
          OnClick = UpdateContent
        end
        object seLinePanelFixWidth: TCnSpinEdit
          Left = 184
          Top = 115
          Width = 49
          Height = 22
          MaxValue = 10
          MinValue = 1
          TabOrder = 7
          Value = 3
        end
        object chkShowLineCount: TCheckBox
          Left = 24
          Top = 32
          Width = 321
          Height = 17
          Caption = '��ʾ�ļ���������'
          TabOrder = 2
        end
        object seLinePanelMinWidth: TCnSpinEdit
          Left = 184
          Top = 75
          Width = 49
          Height = 22
          MaxValue = 10
          MinValue = 1
          TabOrder = 5
          Value = 3
        end
        object btnLineFont: TButton
          Left = 224
          Top = 16
          Width = 129
          Height = 21
          Caption = '�к�����(&F)...'
          TabOrder = 1
          OnClick = btnLineFontClick
        end
        object btnCurrLineFont: TButton
          Left = 224
          Top = 48
          Width = 129
          Height = 21
          Caption = '��ǰ���к�����(&U)...'
          TabOrder = 3
          OnClick = btnCurrLineFontClick
        end
      end
      object grpToolBar: TGroupBox
        Left = 8
        Top = 8
        Width = 361
        Height = 94
        Caption = '�༭��������(&T)'
        TabOrder = 0
        object chkShowToolBar: TCheckBox
          Left = 8
          Top = 16
          Width = 225
          Height = 17
          Caption = '�ڱ༭�������ӹ�������'
          TabOrder = 0
          OnClick = UpdateContent
        end
        object btnToolBar: TButton
          Left = 224
          Top = 16
          Width = 129
          Height = 21
          Caption = '���ư�ť(&B)...'
          TabOrder = 1
          OnClick = btnToolBarClick
        end
        object chkToolBarWrap: TCheckBox
          Left = 24
          Top = 66
          Width = 201
          Height = 17
          Caption = '��ť�Զ����С�'
          TabOrder = 4
        end
        object chkShowInDesign: TCheckBox
          Left = 8
          Top = 42
          Width = 209
          Height = 17
          Caption = '�� BDS ������ƽ�����ʾ��������'
          TabOrder = 2
          OnClick = UpdateContent
        end
        object btnDesignToolBar: TButton
          Left = 224
          Top = 42
          Width = 129
          Height = 21
          Caption = '���ư�ť(&F)...'
          TabOrder = 3
          OnClick = btnDesignToolBarClick
        end
      end
      object grpEditorNav: TGroupBox
        Left = 8
        Top = 262
        Width = 361
        Height = 106
        Caption = 'ǰ��������չ(&J)'
        TabOrder = 2
        object Label1: TLabel
          Left = 26
          Top = 44
          Width = 120
          Height = 13
          Caption = '�¼�¼����С�м����'
        end
        object Label2: TLabel
          Left = 26
          Top = 72
          Width = 84
          Height = 13
          Caption = '����б�������'
        end
        object chkExtendForwardBack: TCheckBox
          Left = 8
          Top = 16
          Width = 345
          Height = 17
          Caption = '��չ����༭����ǰ�������˰�ť���ܡ�'
          TabOrder = 0
          OnClick = UpdateContent
        end
        object seNavMinLineDiff: TCnSpinEdit
          Left = 184
          Top = 39
          Width = 49
          Height = 22
          MaxValue = 99
          MinValue = 1
          TabOrder = 1
          Value = 5
        end
        object seNavMaxItems: TCnSpinEdit
          Left = 184
          Top = 67
          Width = 49
          Height = 22
          MaxLength = 2
          MaxValue = 99
          MinValue = 1
          TabOrder = 2
          Value = 20
        end
      end
    end
    object ts3: TTabSheet
      Caption = '��ǩ��������ť(&T)'
      ImageIndex = 2
      object gbTab: TGroupBox
        Left = 8
        Top = 8
        Width = 361
        Height = 123
        Caption = 'Դ���ǩ��չ(&B)'
        TabOrder = 0
        object chkDispModifiedInTab: TCheckBox
          Left = 8
          Top = 16
          Width = 350
          Height = 17
          Caption = '��Դ�����ǩ��Ϊ���޸ĵ��ļ���� * �š�'
          TabOrder = 0
        end
        object chkDblClkClosePage: TCheckBox
          Left = 8
          Top = 36
          Width = 350
          Height = 17
          Caption = 'ͨ��˫���༭����ǩ�ر�ָ��ҳ�档'
          TabOrder = 1
        end
        object chkRClickShellMenu: TCheckBox
          Left = 8
          Top = 56
          Width = 350
          Height = 17
          Caption = 'ʹ�� Shift �� Ctrl ������Ҽ������ǩ��ʾ��ǲ˵���'
          TabOrder = 2
        end
        object chkEditorMultiLine: TCheckBox
          Left = 8
          Top = 76
          Width = 350
          Height = 17
          Caption = '���ô���༭����ǩΪ���з�ʽ����������BDS����'
          TabOrder = 3
        end
        object chkEditorFlatButtons: TCheckBox
          Left = 8
          Top = 96
          Width = 350
          Height = 17
          Caption = '���ô���༭����ǩΪƽ�水ť��񣨲�������BDS����'
          TabOrder = 4
        end
      end
      object gbFlatButton: TGroupBox
        Left = 8
        Top = 139
        Width = 361
        Height = 64
        Caption = 'ѡ��鸡����ť(&F)'
        TabOrder = 1
        object chkShowFlatButton: TCheckBox
          Left = 8
          Top = 16
          Width = 350
          Height = 17
          Caption = '��ѡ��ʱ��ʾ�������߰�ť��'
          TabOrder = 0
        end
        object chkAddMenuBlockTools: TCheckBox
          Left = 8
          Top = 38
          Width = 326
          Height = 17
          Caption = '�ڱ༭���Ҽ��˵�����ʾ�������߰�ť�����˵���'
          TabOrder = 1
        end
      end
      object grpAutoSave: TGroupBox
        Left = 8
        Top = 281
        Width = 361
        Height = 87
        Caption = '�Զ�����(&S)'
        TabOrder = 3
        object lblSaveInterval: TLabel
          Left = 26
          Top = 40
          Width = 36
          Height = 13
          Caption = 'ÿ����'
        end
        object lblMinutes: TLabel
          Left = 200
          Top = 40
          Width = 108
          Height = 13
          Caption = '����ȫ������һ�Ρ�'
        end
        object chkAutoSave: TCheckBox
          Left = 8
          Top = 16
          Width = 350
          Height = 17
          Caption = '�����Զ����湦�ܡ�'
          TabOrder = 0
          OnClick = UpdateContent
        end
        object seSaveInterval: TCnSpinEdit
          Left = 136
          Top = 38
          Width = 49
          Height = 22
          MaxValue = 30
          MinValue = 1
          TabOrder = 1
          Value = 3
        end
      end
      object grpSmart: TGroupBox
        Left = 8
        Top = 211
        Width = 361
        Height = 62
        Caption = '���������(&P)'
        TabOrder = 2
        object chkSmartCopy: TCheckBox
          Left = 8
          Top = 16
          Width = 350
          Height = 17
          Caption = 'δѡ��ʱ���и��Ƶ�ǰ����µı�ʶ����'
          TabOrder = 0
        end
        object chkSmartPaste: TCheckBox
          Left = 8
          Top = 36
          Width = 350
          Height = 17
          Caption = 'ճ��ʱ�Զ��滻��ǰ����µı�ʶ����'
          TabOrder = 1
        end
      end
    end
    object ts4: TTabSheet
      Caption = '����(&R)'
      ImageIndex = 3
      object grpKeyExtend: TGroupBox
        Left = 8
        Top = 8
        Width = 361
        Height = 224
        Caption = '���ܼ���չ(&K)'
        TabOrder = 0
        object chkShiftEnter: TCheckBox
          Left = 8
          Top = 40
          Width = 350
          Height = 17
          Caption = 'Shift+Enter ���Ƶ���β�ٻ��С�'
          TabOrder = 1
        end
        object chkHomeExtend: TCheckBox
          Left = 8
          Top = 140
          Width = 350
          Height = 17
          Caption = 'ʹ�� Home ���ƶ������׻��һ���ǿ��ַ���'
          TabOrder = 7
          OnClick = UpdateContent
        end
        object chkHomeFirstChar: TCheckBox
          Left = 24
          Top = 160
          Width = 329
          Height = 17
          Caption = '��������ʱ�� Home �������Ƶ���һ���ǿ��ַ���'
          TabOrder = 8
        end
        object chkSearchAgain: TCheckBox
          Left = 8
          Top = 80
          Width = 350
          Height = 17
          Caption = 'F3/Shift+F3 ����ѡ�е����֡�'
          TabOrder = 4
          OnClick = UpdateContent
        end
        object chkTabIndent: TCheckBox
          Left = 8
          Top = 20
          Width = 350
          Height = 17
          Caption = 'Tab/Shift+Tab ����/������ѡ�д���顣'
          TabOrder = 0
        end
        object chkAutoBracket: TCheckBox
          Left = 8
          Top = 120
          Width = 350
          Height = 17
          Caption = '�Զ�����ƥ������ (), [], {} ��'
          TabOrder = 6
        end
        object chkKeepSearch: TCheckBox
          Left = 24
          Top = 100
          Width = 330
          Height = 17
          Caption = 'F3/Shift+F3 ����ʱ������ҵ����ݡ�'
          TabOrder = 5
        end
        object chkF2Rename: TCheckBox
          Left = 8
          Top = 60
          Width = 350
          Height = 17
          Caption = 'ʹ�ô��ȼ����벢�滻����µı�ʶ����'
          TabOrder = 3
          OnClick = UpdateContent
        end
        object hkRename: THotKey
          Left = 272
          Top = 58
          Width = 73
          Height = 19
          HotKey = 32833
          InvalidKeys = [hcNone, hcShift]
          Modifiers = [hkAlt]
          TabOrder = 2
        end
        object chkSemicolon: TCheckBox
          Left = 8
          Top = 180
          Width = 350
          Height = 17
          Caption = '��Ч�������������ֺ�ʱ�Զ��ƶ�����β��'
          TabOrder = 9
          OnClick = UpdateContent
        end
        object chkAutoEnterEnd: TCheckBox
          Left = 8
          Top = 200
          Width = 350
          Height = 17
          Caption = 'begin �󰴻س�ʱ�Զ�����ƥ��� end ��������'
          TabOrder = 10
          OnClick = UpdateContent
        end
      end
      object grpAutoIndent: TGroupBox
        Left = 8
        Top = 237
        Width = 361
        Height = 132
        Caption = '�Զ�����(&I)'
        TabOrder = 1
        object lbl3: TLabel
          Left = 24
          Top = 37
          Width = 159
          Height = 13
          Caption = '��Ҫ������ Delphi �ؼ����б�:'
        end
        object chkAutoIndent: TCheckBox
          Left = 8
          Top = 16
          Width = 345
          Height = 17
          Caption = '�� Delphi ��ָ���ؼ��ֻ� C �� '#39'{'#39' ��س�ʱ�Զ�������'
          TabOrder = 0
          OnClick = UpdateContent
        end
        object mmoAutoIndent: TMemo
          Left = 24
          Top = 56
          Width = 325
          Height = 64
          ScrollBars = ssVertical
          TabOrder = 1
          WordWrap = False
        end
      end
    end
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 8
    Top = 416
    object actReplace: TAction
      Caption = '�滻(&R)'
      OnExecute = actReplaceExecute
    end
    object actAdd: TAction
      Caption = '���(&A)'
      OnExecute = actAddExecute
    end
    object actDelete: TAction
      Caption = 'ɾ��(&D)'
      OnExecute = actDeleteExecute
    end
  end
  object dlgFontCurrLine: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 72
    Top = 416
  end
  object dlgFontLine: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 40
    Top = 416
  end
end
