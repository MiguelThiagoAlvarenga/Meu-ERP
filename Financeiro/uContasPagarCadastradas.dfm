﻿object frmContasPagarCadastradas: TfrmContasPagarCadastradas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contas '#224' Pagar'
  ClientHeight = 376
  ClientWidth = 856
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
    Left = 8
    Top = 27
    Width = 840
    Height = 306
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnVoltar: TButton
    Left = 512
    Top = 339
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 3
    OnClick = btnVoltarClick
  end
  object btnNova: TButton
    Left = 269
    Top = 339
    Width = 75
    Height = 25
    Caption = 'Nova'
    TabOrder = 0
    OnClick = btnNovaClick
  end
  object btnExcluir: TButton
    Left = 350
    Top = 339
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 1
    OnClick = btnExcluirClick
  end
  object btnBaixar: TButton
    Left = 431
    Top = 339
    Width = 75
    Height = 25
    Caption = 'Baixar T'#237'tulo'
    TabOrder = 2
    OnClick = btnBaixarClick
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 384
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 304
    Top = 232
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select idconta_pagar as "C'#243'digo", DATE_FORMAT(data_cadastro, "%d' +
        '/%m/%y") as "Data de Cadastro", titulo as "T'#237'tulo",'
      
        #9'DATE_FORMAT(vencimento, "%d/%m/%y") as "Vencimento", valor as "' +
        'Valor", valor - valor_pago as "'#192' Pagar",'
      
        '    DATE_FORMAT(pago_em, "%d/%m/%y") as "Pago em", valor_pago as' +
        ' "Valor Pago"'
      #9'from contas_pagar;')
    Left = 224
    Top = 232
    object ADOQuery1Código: TAutoIncField
      FieldName = 'C'#243'digo'
      ReadOnly = True
    end
    object ADOQuery1DatadeCadastro: TWideStringField
      Alignment = taCenter
      DisplayWidth = 16
      FieldName = 'Data de Cadastro'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1Título: TWideStringField
      FieldName = 'T'#237'tulo'
      Size = 45
    end
    object ADOQuery1Vencimento: TWideStringField
      Alignment = taCenter
      DisplayWidth = 12
      FieldName = 'Vencimento'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1Valor: TFloatField
      FieldName = 'Valor'
    end
    object ADOQuery1ÀPagar: TFloatField
      DisplayLabel = #192' Receber'
      FieldName = #192' Pagar'
      ReadOnly = True
    end
    object ADOQuery1Pagoem: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Quitado em'
      DisplayWidth = 12
      FieldName = 'Pago em'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1ValorPago: TFloatField
      DisplayLabel = 'Valor Recebido'
      FieldName = 'Valor Pago'
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=MeuERP'
    LoginPrompt = False
    Left = 80
    Top = 232
  end
end
