inherited CnProjectListUsedForm: TCnProjectListUsedForm
  Left = 289
  Top = 188
  Caption = '�����õ�Ԫ�б�'
  ClientHeight = 349
  ClientWidth = 424
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000070
    0000000000000078888888888800007FBBBBBBBBB800007BF6666666B800007F
    BBBBBBBBB800007BF6666666B800007FBFBFBFBBB800007FF6666666B800007F
    FFBFBFBBB800007FF666FBFBB800007FFFFFB0000000007FFFFFF0BB0000007F
    FFFFF0B00000007FFFFFF000000000777777700000000000000000000000C001
    0000C0010000C0010000C0010000C0010000C0010000C0010000C0010000C001
    0000C0010000C0030000C0070000C00F0000C01F0000C03F0000FFFF0000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    Width = 424
    inherited lblProject: TLabel
      Caption = '·��(&P):'
      Visible = False
    end
    inherited edtMatchSearch: TEdit
      Width = 298
      Anchors = [akLeft, akTop, akRight]
    end
    inherited cbbProjectList: TComboBox
      Visible = False
    end
  end
  inherited lvList: TListView
    Width = 424
    Height = 264
    Columns = <
      item
        Caption = '��Ԫ����'
        Width = 250
      end
      item
        Caption = '��������'
        Width = 150
      end>
    OwnerData = True
    OnCustomDrawItem = nil
    OnData = lvListData
  end
  inherited StatusBar: TStatusBar
    Top = 330
    Width = 424
    Panels = <
      item
        Style = psOwnerDraw
        Width = 310
      end
      item
        Text = '��Ԫ����: 1'
        Width = 110
      end>
  end
  inherited ToolBar: TToolBar
    Width = 424
    inherited btnSep1: TToolButton
      Visible = False
    end
    inherited btnAttribute: TToolButton
      Visible = False
    end
    inherited btnSep3: TToolButton
      Visible = False
    end
    inherited btnHookIDE: TToolButton
      Visible = False
    end
  end
  inherited ActionList: TActionList
    inherited actOpen: TAction
      Hint = '����������ѡ�ĵ�Ԫ'
    end
    inherited actAttribute: TAction
      Hint = '��ʾ��ѡ Frame ���ļ�����'
    end
    inherited actCopy: TAction
      Hint = '������ѡ��Ԫ���Ƶ�������'
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
      Caption = ''
      Hint = ''
    end
    inherited actQuery: TAction
      Caption = ''
      Hint = '�򿪶����Ԫʱ��ʾ'
    end
  end
end
