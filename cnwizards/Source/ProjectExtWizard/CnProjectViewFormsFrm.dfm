inherited CnProjectViewFormsForm: TCnProjectViewFormsForm
  Top = 200
  Caption = '�����鴰���б�'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited lvList: TListView
    Columns = <
      item
        Caption = '����'
        Width = 140
      end
      item
        Caption = '����'
        Width = 130
      end
      item
        Caption = '����'
        Width = 90
      end
      item
        Caption = '����'
        Width = 100
      end
      item
        Alignment = taRightJustify
        Caption = '��С(Byte)'
        Width = 80
      end
      item
        Caption = '��ʽ'
        Width = 62
      end>
    OwnerData = True
    OnData = lvListData
  end
  inherited StatusBar: TStatusBar
    OnDrawPanel = StatusBarDrawPanel
  end
  inherited ToolBar: TToolBar
    object tbnSep2: TToolButton
      Left = 355
      Top = 0
      Width = 8
      Caption = 'tbnSep2'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object tbnConvertToText: TToolButton
      Left = 363
      Top = 0
      Hint = '����ѡ�����ƴ���ת��Ϊ�ı�����'
      Caption = 'ת��Ϊ�ı�(&T)'
      ImageIndex = 46
      OnClick = tbnConvertToTextClick
    end
    object tbnConvertToBinary: TToolButton
      Left = 386
      Top = 0
      Hint = '����ѡ�ı�����ת��Ϊ�����ƴ���'
      Caption = 'ת��Ϊ������(&B)'
      ImageIndex = 64
      OnClick = tbnConvertToBinaryClick
    end
  end
end
