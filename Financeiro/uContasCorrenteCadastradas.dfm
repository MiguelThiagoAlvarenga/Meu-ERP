﻿object frmContasCorrenteCadastradas: TfrmContasCorrenteCadastradas
  Left = 0
  Top = 0
  Caption = 'Contas Correntes'
  ClientHeight = 229
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object btnNova: TButton
    Left = 262
    Top = 191
    Width = 75
    Height = 25
    Caption = 'Nova'
    TabOrder = 0
    OnClick = btnNovaClick
  end
  object btnVoltar: TButton
    Left = 343
    Top = 191
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 24
    Width = 665
    Height = 153
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=MeuERP'
    LoginPrompt = False
    Left = 472
    Top = 176
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select idconta_corrente as "C'#243'digo", nome as "Nome", agencia as ' +
        '"Ag'#234'ncia", saldo as "Saldo", impressao_boleto as "Padr'#227'o p/ impr' +
        'imir boleto",'
      #9'ativo as "Ativo" from conta_corrente;')
    Left = 560
    Top = 176
    object ADOQuery1Código: TAutoIncField
      Alignment = taCenter
      FieldName = 'C'#243'digo'
      ReadOnly = True
    end
    object ADOQuery1Nome: TWideStringField
      FieldName = 'Nome'
      Size = 45
    end
    object ADOQuery1Agência: TIntegerField
      Alignment = taCenter
      FieldName = 'Ag'#234'ncia'
    end
    object ADOQuery1Saldo: TFloatField
      FieldName = 'Saldo'
    end
    object ADOQuery1Padrãopimprimirboleto: TWideStringField
      Alignment = taCenter
      FieldName = 'Padr'#227'o p/ imprimir boleto'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1Ativo: TWideStringField
      Alignment = taCenter
      FieldName = 'Ativo'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 632
    Top = 176
  end
end
