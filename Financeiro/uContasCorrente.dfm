object frmContasCorrente: TfrmContasCorrente
  Left = 0
  Top = 0
  Caption = 'Contas Corrente'
  ClientHeight = 329
  ClientWidth = 447
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
  object Label1: TLabel
    Left = 54
    Top = 104
    Width = 42
    Height = 13
    Caption = 'Ag'#234'ncia:'
  end
  object Label2: TLabel
    Left = 255
    Top = 104
    Width = 33
    Height = 13
    Caption = 'Conta:'
  end
  object Label3: TLabel
    Left = 63
    Top = 144
    Width = 33
    Height = 13
    Caption = 'Banco:'
  end
  object Label4: TLabel
    Left = 45
    Top = 223
    Width = 51
    Height = 19
    Caption = 'Saldo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 25
    Top = 166
    Width = 37
    Height = 13
    Caption = 'idbanco'
    Visible = False
  end
  object Label6: TLabel
    Left = 65
    Top = 64
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object edtAgencia: TEdit
    Left = 102
    Top = 101
    Width = 68
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object chkAtivo: TCheckBox
    Left = 102
    Top = 24
    Width = 44
    Height = 17
    Caption = 'Ativo'
    Checked = True
    State = cbChecked
    TabOrder = 11
  end
  object edtDigitoAgencia: TEdit
    Left = 176
    Top = 101
    Width = 34
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object edtConta: TEdit
    Left = 294
    Top = 101
    Width = 68
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
  object edtDigitoConta: TEdit
    Left = 368
    Top = 101
    Width = 34
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object edtBanco: TEdit
    Left = 102
    Top = 142
    Width = 212
    Height = 21
    Enabled = False
    TabOrder = 12
  end
  object btnSelecionar: TButton
    Left = 320
    Top = 139
    Width = 75
    Height = 25
    Caption = 'Selecionar...'
    TabOrder = 5
    OnClick = btnSelecionarClick
  end
  object edtSaldo: TEdit
    Left = 102
    Top = 221
    Width = 111
    Height = 21
    NumbersOnly = True
    TabOrder = 7
  end
  object chkImpressaoBoleto: TCheckBox
    Left = 102
    Top = 184
    Width = 231
    Height = 17
    Caption = 'Conta padr'#227'o para a impress'#227'o de boleto'
    TabOrder = 6
  end
  object btnCadastrar: TButton
    Left = 145
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 9
    OnClick = btnCadastrarClick
  end
  object btnVoltar: TButton
    Left = 226
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 10
    OnClick = btnVoltarClick
  end
  object cmbSaldo: TComboBox
    Left = 226
    Top = 221
    Width = 39
    Height = 21
    Hint = 'Saldo Positivo ou Negativo'
    Style = csDropDownList
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = '+'
    Items.Strings = (
      '+'
      '-')
  end
  object edtIdBanco: TEdit
    Left = 68
    Top = 163
    Width = 28
    Height = 21
    NumbersOnly = True
    TabOrder = 13
    Visible = False
  end
  object edtNome: TEdit
    Left = 102
    Top = 61
    Width = 300
    Height = 21
    TabOrder = 0
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=MeuERP'
    LoginPrompt = False
    Left = 376
    Top = 208
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 376
    Top = 264
  end
end
