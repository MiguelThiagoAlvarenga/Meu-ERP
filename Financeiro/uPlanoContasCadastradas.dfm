object frmPlanoContasCadastradas: TfrmPlanoContasCadastradas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Plano de Contas'
  ClientHeight = 229
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 13
    Top = 22
    Width = 473
    Height = 161
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object btnVoltar: TButton
    Left = 292
    Top = 193
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
  object btnNovo: TButton
    Left = 131
    Top = 193
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 2
    OnClick = btnNovoClick
  end
  object btnExcluir: TButton
    Left = 211
    Top = 193
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = btnExcluirClick
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=MeuERP'
    CursorType = ctStatic
    TableName = 'plano_contas'
    Left = 360
    Top = 160
    object ADOTable1idplano_contas: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'idplano_contas'
      ReadOnly = True
    end
    object ADOTable1sequencia: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia'
      DisplayWidth = 12
      FieldName = 'sequencia'
    end
    object ADOTable1titulo: TWideStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'titulo'
      Size = 45
    end
    object ADOTable1ativo: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      DisplayWidth = 7
      FieldName = 'ativo'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 432
    Top = 160
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=MeuERP'
    Parameters = <>
    Left = 408
    Top = 112
  end
end
