object frmGruposCFCadastrados: TfrmGruposCFCadastrados
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Grupos de Cliente/Fornecedor'
  ClientHeight = 219
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 14
    Top = 24
    Width = 388
    Height = 146
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object btnVoltar: TButton
    Left = 251
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 2
    OnClick = btnVoltarClick
  end
  object btnNovo: TButton
    Left = 89
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 0
    OnClick = btnNovoClick
  end
  object btnExcluir: TButton
    Left = 170
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 1
    OnClick = btnExcluirClick
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=MeuERP'
    CursorType = ctStatic
    TableName = 'grupo_cliente_fornecedor'
    Left = 296
    Top = 168
    object ADOTable1idgrupo_cliente_fornecedor: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'idgrupo_cliente_fornecedor'
      ReadOnly = True
    end
    object ADOTable1nome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 45
    end
    object ADOTable1ativo: TWideStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ativo'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 368
    Top = 168
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=MeuERP'
    Parameters = <>
    Left = 336
    Top = 112
  end
end
