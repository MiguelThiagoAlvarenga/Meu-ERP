object frmBancosCadastrados: TfrmBancosCadastrados
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Bancos'
  ClientHeight = 231
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 24
    Width = 531
    Height = 153
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object btnNovo: TButton
    Left = 191
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 1
    OnClick = btnNovoClick
  end
  object btnVoltar: TButton
    Left = 272
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 2
    OnClick = btnVoltarClick
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=MeuERP'
    LoginPrompt = False
    Left = 424
    Top = 64
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select idbanco as "C'#243'digo no sistema", codigo as "C'#243'digo FEBRABA' +
        'N", nome as "Nome", ativo as "Ativo" from banco;')
    Left = 424
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 424
    Top = 168
  end
end
