inherited CnProjectFramesForm: TCnProjectFramesForm
  Caption = 'Frames �б�'
  ClientWidth = 606
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00000000000070000000000000007BBBBBBBBBBBBB007F07777777777B007F0B
    FBFBBBBB7B007F0FBF44444B7B007F0BFFFBFBBB7B007F0FF44444BB7B007F0F
    FBFFFBFB7B007F0F44444FBF7B007F0FFFFBFBFB7B007F00000000000B007FFF
    FFFFFFFFFB0074444444444444007F444444444F4F007777777777777770FFFF
    0000000100000001000000010000000100000001000000010000000100000001
    000000010000000100000001000000010000000100000001000000010000}
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    Width = 606
  end
  inherited lvList: TListView
    Width = 606
    Columns = <
      item
        Caption = 'Frame ����'
        Width = 210
      end
      item
        Caption = '����'
        Width = 90
      end
      item
        Caption = '����'
        Width = 130
      end
      item
        Alignment = taRightJustify
        Caption = '��С(Byte)'
        Width = 100
      end
      item
        Caption = '��ʽ'
        Width = 72
      end>
    MultiSelect = False
  end
  inherited StatusBar: TStatusBar
    Width = 606
  end
  inherited ToolBar: TToolBar
    Width = 606
    inherited btnSelectAll: TToolButton
      Visible = False
    end
    inherited btnSelectNone: TToolButton
      Visible = False
    end
    inherited btnSelectInvert: TToolButton
      Visible = False
    end
    inherited btnSep5: TToolButton
      Visible = False
    end
    inherited btnMatchStart: TToolButton
      Hint = 'ƥ�� Frame ����ͷ'
    end
    inherited btnMatchAny: TToolButton
      Hint = 'ƥ�� Frame ������λ��'
    end
    inherited btnHookIDE: TToolButton
      Visible = False
    end
    inherited btnQuery: TToolButton
      Visible = False
    end
    inherited tbnSep2: TToolButton
      Visible = False
    end
    inherited tbnConvertToText: TToolButton
      Visible = False
    end
    inherited tbnConvertToBinary: TToolButton
      Visible = False
    end
  end
  inherited ActionList: TActionList
    inherited actOpen: TAction
      Hint = '����ѡ Frame ���봰��'
    end
    inherited actAttribute: TAction
      Hint = '��ʾ��ѡ Frame ���ļ�����'
    end
    inherited actCopy: TAction
      Hint = '������ѡ Frame ���Ƶ�������'
    end
    inherited actSelectAll: TAction
      Caption = ''
      Hint = ''
    end
    inherited actSelectNone: TAction
      Caption = ''
      Hint = ''
    end
    inherited actSelectInvert: TAction
      Caption = ''
      Hint = ''
    end
    inherited actHookIDE: TAction
      Caption = ''
      Hint = ''
    end
    inherited actQuery: TAction
      Caption = ''
      Hint = ''
    end
  end
end
