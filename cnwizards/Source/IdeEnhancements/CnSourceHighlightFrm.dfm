inherited CnSourceHighlightForm: TCnSourceHighlightForm
  Left = 349
  Top = 119
  BorderStyle = bsDialog
  Caption = 'Դ�����������'
  ClientHeight = 519
  ClientWidth = 377
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpBracket: TGroupBox
    Left = 8
    Top = 8
    Width = 361
    Height = 105
    Caption = '����ƥ�����(&B)'
    TabOrder = 0
    object lbl3: TLabel
      Left = 26
      Top = 40
      Width = 40
      Height = 13
      Caption = 'ǰ��ɫ:'
    end
    object shpBracket: TShape
      Left = 88
      Top = 37
      Width = 20
      Height = 20
      OnMouseDown = shpBracketMouseDown
    end
    object lbl4: TLabel
      Left = 130
      Top = 40
      Width = 40
      Height = 13
      Caption = '����ɫ:'
    end
    object shpBracketBk: TShape
      Left = 192
      Top = 37
      Width = 20
      Height = 20
      OnMouseDown = shpBracketMouseDown
    end
    object lbl5: TLabel
      Left = 234
      Top = 40
      Width = 40
      Height = 13
      Caption = '�߿�ɫ:'
    end
    object shpBracketBd: TShape
      Left = 296
      Top = 37
      Width = 20
      Height = 20
      OnMouseDown = shpBracketMouseDown
    end
    object chkMatchedBracket: TCheckBox
      Left = 8
      Top = 16
      Width = 350
      Height = 17
      Caption = '��������ƥ�������ʾ��'
      TabOrder = 0
      OnClick = UpdateControls
    end
    object chkBracketBold: TCheckBox
      Left = 24
      Top = 59
      Width = 329
      Height = 17
      Caption = '�Ӵ���ʾ��'
      TabOrder = 1
    end
    object chkBracketMiddle: TCheckBox
      Left = 24
      Top = 79
      Width = 329
      Height = 17
      Caption = '����������м���ı�ʱҲ������ʾ��'
      TabOrder = 2
    end
  end
  object btnOK: TButton
    Left = 134
    Top = 490
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 214
    Top = 490
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 3
  end
  object btnHelp: TButton
    Left = 294
    Top = 490
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 4
    OnClick = btnHelpClick
  end
  object grpStructHighlight: TGroupBox
    Left = 8
    Top = 120
    Width = 361
    Height = 362
    Caption = '����ṹƥ�����(&S)'
    TabOrder = 1
    object shpBk: TShape
      Left = 325
      Top = 19
      Width = 20
      Height = 32
      OnMouseDown = shpBracketMouseDown
    end
    object shpCurLine: TShape
      Left = 325
      Top = 57
      Width = 20
      Height = 20
      OnMouseDown = shpBracketMouseDown
    end
    object chkBkHighlight: TCheckBox
      Left = 8
      Top = 16
      Width = 305
      Height = 17
      Caption = '�����괦ƥ��ؼ��ָ���������ʾ��'
      TabOrder = 0
      OnClick = UpdateControls
    end
    object chkHighlight: TCheckBox
      Left = 8
      Top = 82
      Width = 337
      Height = 17
      Caption = '�������ṹƥ��ؼ��ָ�����ʾ��'
      TabOrder = 4
      OnClick = UpdateControls
    end
    object rgMatchRange: TRadioGroup
      Left = 16
      Top = 126
      Width = 137
      Height = 97
      Caption = '������ʾ��Χ(&R)'
      Items.Strings = (
        '������Ԫ'
        '��ǰ����/����'
        '��ǰ������'
        '��ǰ���ڲ��')
      TabOrder = 7
    end
    object grpHighlightColor: TGroupBox
      Left = 168
      Top = 126
      Width = 177
      Height = 97
      Caption = '���������ʾ��ɫ(&L)'
      TabOrder = 8
      object shpneg1: TShape
        Left = 16
        Top = 23
        Width = 20
        Height = 20
        OnMouseDown = shpBracketMouseDown
      end
      object shp0: TShape
        Left = 56
        Top = 23
        Width = 20
        Height = 20
        OnMouseDown = shpBracketMouseDown
      end
      object shp1: TShape
        Left = 96
        Top = 23
        Width = 20
        Height = 20
        OnMouseDown = shpBracketMouseDown
      end
      object shp2: TShape
        Left = 136
        Top = 23
        Width = 20
        Height = 20
        OnMouseDown = shpBracketMouseDown
      end
      object shp3: TShape
        Left = 16
        Top = 61
        Width = 20
        Height = 20
        OnMouseDown = shpBracketMouseDown
      end
      object shp4: TShape
        Left = 56
        Top = 61
        Width = 20
        Height = 20
        OnMouseDown = shpBracketMouseDown
      end
      object shp5: TShape
        Left = 96
        Top = 61
        Width = 20
        Height = 20
        OnMouseDown = shpBracketMouseDown
      end
      object pnlBtn: TPanel
        Left = 136
        Top = 56
        Width = 25
        Height = 33
        BevelOuter = bvNone
        TabOrder = 0
        object btnReset: TSpeedButton
          Left = 0
          Top = 4
          Width = 23
          Height = 22
          Hint = '����ΪĬ����ɫ'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FFFF00FFFF00FF
            840000840000840000840000840000FF00FFFF00FFFF00FFFF00FFFF00FF8400
            00FF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FFFF00FF
            840000840000840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF840000FF00FFFF00FFFF00FFFF00FF840000840000FF00FF840000FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FFFF00FF
            840000FF00FFFF00FFFF00FF840000840000FF00FFFF00FFFF00FFFF00FF8400
            00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF840000840000840000840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnResetClick
        end
      end
    end
    object rgMatchDelay: TRadioGroup
      Left = 16
      Top = 230
      Width = 329
      Height = 89
      Caption = '������ʾ��ʱ(&D)'
      Items.Strings = (
        '��ʱ��ʾ'
        '��ʾǰ��ʱ'
        '�ȼ�����ʱ��ʾ')
      TabOrder = 9
      OnClick = UpdateControls
    end
    object hkMatchHotkey: THotKey
      Left = 160
      Top = 292
      Width = 129
      Height = 19
      HotKey = 32833
      InvalidKeys = [hcNone, hcShift]
      Modifiers = [hkAlt]
      TabOrder = 12
    end
    object chkMaxSize: TCheckBox
      Left = 24
      Top = 330
      Width = 217
      Height = 17
      Caption = '������ƥ�����������������ĵ�Ԫ��'
      TabOrder = 14
      OnClick = UpdateControls
    end
    object seDelay: TCnSpinEdit
      Left = 160
      Top = 265
      Width = 73
      Height = 22
      Increment = 50
      MaxValue = 5000
      MinValue = 500
      TabOrder = 11
      Value = 500
    end
    object pnl1: TPanel
      Left = 240
      Top = 263
      Width = 73
      Height = 25
      BevelOuter = bvNone
      Caption = '����'
      TabOrder = 10
    end
    object seMaxLines: TCnSpinEdit
      Left = 248
      Top = 328
      Width = 97
      Height = 22
      Increment = 500
      MaxValue = 100000
      MinValue = 1000
      TabOrder = 13
      Value = 25000
    end
    object chkDrawLine: TCheckBox
      Left = 8
      Top = 104
      Width = 249
      Height = 17
      Caption = '�������ṹƥ��������ʾ��'
      TabOrder = 6
      OnClick = UpdateControls
    end
    object btnLineSetting: TButton
      Left = 270
      Top = 102
      Width = 75
      Height = 21
      Caption = '��������(&X)'
      TabOrder = 5
      OnClick = btnLineSettingClick
    end
    object chkCurrentToken: TCheckBox
      Left = 8
      Top = 38
      Width = 297
      Height = 17
      Caption = '�����괦ƥ���ʶ������������ʾ��'
      TabOrder = 2
      OnClick = UpdateControls
    end
    object pnl2: TPanel
      Left = 278
      Top = 28
      Width = 36
      Height = 13
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 1
      object lblBk: TLabel
        Left = 0
        Top = 0
        Width = 36
        Height = 13
        Caption = '����ɫ'
      end
    end
    object chkHighlightCurLine: TCheckBox
      Left = 8
      Top = 60
      Width = 313
      Height = 17
      Caption = '���������ǰ�б�������������Delphi 7�����°汾����'
      TabOrder = 3
      OnClick = UpdateControls
    end
  end
  object dlgColor: TColorDialog
    Ctl3D = True
    Options = [cdFullOpen, cdAnyColor]
    Left = 335
    Top = 17
  end
end
