object frmTiposCobrancaCadastrados: TfrmTiposCobrancaCadastrados
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tipos de Cobran'#231'a'
  ClientHeight = 214
  ClientWidth = 423
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
    Left = 15
    Top = 16
    Width = 393
    Height = 154
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
  object Button1: TButton
    Left = 254
    Top = 179
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object btnNovo: TButton
    Left = 93
    Top = 179
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 2
    OnClick = btnNovoClick
  end
  object btnExcluir: TButton
    Left = 173
    Top = 179
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
    TableName = 'tipo_cobranca'
    Left = 304
    Top = 104
    object ADOTable1idtipo_cobranca: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'idtipo_cobranca'
      ReadOnly = True
    end
    object ADOTable1nome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 45
      FieldName = 'nome'
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
    Left = 376
    Top = 104
  end
  object ADOCommand1: TADOCommand
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=MeuERP'
    Parameters = <>
    Left = 224
    Top = 104
  end
end
