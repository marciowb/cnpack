inherited CnProjectUseUnitsForm: TCnProjectUseUnitsForm
  Top = 250
  Caption = '�����õ�Ԫ�б�'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited lvList: TListView
    Columns = <
      item
        Caption = '��Ԫ'
        Width = 210
      end
      item
        Caption = '����'
        Width = 100
      end
      item
        Caption = '����'
        Width = 140
      end
      item
        Alignment = taRightJustify
        Caption = '��С(Byte)'
        Width = 80
      end
      item
        Caption = '�ļ�״̬'
        Width = 72
      end>
    OwnerData = True
    OnData = lvListData
  end
  inherited StatusBar: TStatusBar
    OnDrawPanel = StatusBarDrawPanel
  end
  inherited ActionList: TActionList
    inherited actOpen: TAction
      Caption = '����(&U)'
      Hint = '������ѡ��Ԫ'
    end
    inherited actAttribute: TAction
      Hint = '��ʾ��ѡ��Ԫ�ļ�����'
    end
    inherited actCopy: TAction
      Hint = '������ѡ��Ԫ����������'
    end
    inherited actSelectAll: TAction
      Hint = 'ѡ�����е�Ԫ'
    end
    inherited actSelectNone: TAction
      Hint = 'ȡ��ѡ��Ԫ'
    end
    inherited actSelectInvert: TAction
      Hint = '����ѡ��Ԫ'
    end
    inherited actMatchStart: TAction
      Hint = 'ƥ�䵥Ԫ����ͷ'
    end
    inherited actMatchAny: TAction
      Hint = 'ƥ�䵥Ԫ������λ��'
    end
    inherited actHookIDE: TAction
      Hint = '�ҽ����õ�Ԫ�б� IDE'
    end
    inherited actQuery: TAction
      Hint = '�򿪶����Ԫʱ��ʾ'
    end
  end
end
