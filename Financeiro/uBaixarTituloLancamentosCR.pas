unit uBaixarTituloLancamentosCR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, uTiposPagamentoCadastrados, Data.Win.ADODB,
  uContasCorrenteCadastradas, uClassLancamentosCR;

type
  TfrmBaixarTituloLancamentosCR = class(TForm)
    PageControl1: TPageControl;
    tbsBaixaTitulo: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnVoltar: TButton;
    dtpDataRecebimento: TDateTimePicker;
    edtTipoPagamento: TEdit;
    btnSelecionarTipoPagamento: TButton;
    edtContaCorrente: TEdit;
    btnSelecionarContaCorrente: TButton;
    btnSalvar: TButton;
    edtValorRecebido: TEdit;
    mmObservacao: TMemo;
    edtIdContaCorrente: TEdit;
    edtIdTipoPagamento: TEdit;
    edtSaldoCredor: TEdit;
    tbsLancamentos: TTabSheet;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    mmObservacaoPagamento: TMemo;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOCommand1: TADOCommand;
    ADOConnection1: TADOConnection;
    btnVoltar2: TButton;
    ADOQuery1DatadoPagamento: TWideStringField;
    ADOQuery1ContaCorrrente: TWideStringField;
    ADOQuery1TipodePagamento: TWideStringField;
    ADOQuery1ValorPago: TFloatField;
    ADOQuery2: TADOQuery;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSelecionarTipoPagamentoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSelecionarContaCorrenteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltar2Click(Sender: TObject);
  private
    lancamentoCR : ClassLancamentosCR;
    tipo_pagamento : TfrmTiposPagamentoCadastrados;
    contas_corrente : TfrmContasCorrenteCadastradas;
    function VerificarCamposNulos : boolean;
    function VerificarValorPago : boolean;
    procedure SalvarPagamento;
    procedure PegarDados;
    procedure AtualizarValorPago;
    procedure VerificarQuita��o;
    procedure AtualizarSaldoCredor;
    procedure AtualizarContaCorrente;
    function PegarSaldoContaCorrente : double;
    procedure LimparCampos;
  public
    idconta_receber : string;
    valor_a_receber : double;
  end;

var
  frmBaixarTituloLancamentosCR: TfrmBaixarTituloLancamentosCR;

implementation

{$R *.dfm}

procedure TfrmBaixarTituloLancamentosCR.btnSelecionarContaCorrenteClick(
  Sender: TObject);
begin
  self.contas_corrente.selecionar := true;
  self.contas_corrente.ShowModal;

  self.edtContaCorrente.Text := self.contas_corrente.nome_conta_corrente;
  self.edtIdContaCorrente.Text := IntToStr(self.contas_corrente.idconta_corrente);
end;

procedure TfrmBaixarTituloLancamentosCR.btnSelecionarTipoPagamentoClick(Sender: TObject);
begin
  self.tipo_pagamento.selecionar := true;
  self.tipo_pagamento.ShowModal;

  self.edtIdTipoPagamento.Text := self.tipo_pagamento.idtipo_pagamentoS;
  self.edtTipoPagamento.Text := self.tipo_pagamento.tipo_pagamentoS;
  self.tipo_pagamento.selecionar := false;
end;


procedure TfrmBaixarTituloLancamentosCR.btnVoltar2Click(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmBaixarTituloLancamentosCR.btnVoltarClick(Sender: TObject);
begin
  self.Close;
end;


procedure TfrmBaixarTituloLancamentosCR.FormActivate(Sender: TObject);
begin
  self.lancamentoCR := ClassLancamentosCR.cLancamentosCR;
  self.dtpDataRecebimento.Date := now;
  self.contas_corrente := TfrmContasCorrenteCadastradas.Create(nil);
  self.tipo_pagamento := TfrmTiposPagamentoCadastrados.Create(nil);
  self.ADOQuery1.Parameters.ParamByName('idconta_especifica').Value := self.idconta_receber;
  self.ADOQuery1.Active := false;
  self.ADOQuery1.Active := true;
end;


procedure TfrmBaixarTituloLancamentosCR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.lancamentoCR.dLancamentosCR;
  self.contas_corrente.Destroy;
  self.tipo_pagamento.Destroy;
end;

procedure TfrmBaixarTituloLancamentosCR.btnSalvarClick(Sender: TObject);
begin
  if self.VerificarCamposNulos = true then
    Application.MessageBox('Os campos com * n�o podem ser nulos!', 'Aten��o',
      MB_OK + MB_ICONEXCLAMATION)
  else if self.VerificarValorPago = true then
    Application.MessageBox('O valor pago n�o pode ser maior do que o valor devido!',
      'Aten��o', MB_OK + MB_ICONEXCLAMATION)
  else
  begin
    try
      self.SalvarPagamento;

      self.AtualizarValorPago;

      self.VerificarQuita��o;

      self.AtualizarSaldoCredor;

      self.AtualizarContaCorrente;

      self.LimparCampos;

      Application.MessageBox('Recebimento cadastrado com sucesso!', 'Conclu�do',
        MB_OK + MB_ICONINFORMATION);

      btnVoltar.SetFocus;

      self.ADOQuery1.Active := false;
      self.ADOQuery1.Active := true;
    except
      on e : Exception do
        Application.MessageBox('N�o foi poss�vel cadastrar o recebimento do valor!',
          'Erro ao cadastrar', MB_OK + MB_ICONSTOP);
    end;
  end;
end;


procedure TfrmBaixarTituloLancamentosCR.SalvarPagamento;
begin
  self.PegarDados;

  ADOCommand1.CommandText := 'insert into lancamento_contas_receber values(null, ' +
    IntToStr(self.lancamentoCR.getIdContaReceber) + ', "' +
    self.lancamentoCR.getDataRecebimento + '", ' +
    IntToStr(self.lancamentoCR.getIdContaCorrente) + ', ' +
    IntToStr(self.lancamentoCR.getIdTipoPagamento) + ', ' +
    FloatToStr(self.lancamentoCR.getValorRecebido) + ', "' +
    self.lancamentoCR.getObservacao + '");';

  ADOCommand1.Execute;
end;


procedure TfrmBaixarTituloLancamentosCR.PegarDados;
begin
  self.lancamentoCR.setIdContaReceber(StrToInt(self.idconta_receber));
  self.lancamentoCR.setDataRecebimento(FormatDateTime('yyyy-mm-dd', self.dtpDataRecebimento.Date));
  self.lancamentoCR.setIdContaCorrente(StrToInt(self.edtIdContaCorrente.Text));
  self.lancamentoCR.setIdTipoPagamento(StrToInt(self.edtIdTipoPagamento.Text));
  self.lancamentoCR.setValorRecebido(StrToFloat(self.edtValorRecebido.Text));
  self.lancamentoCR.setObservacao(self.mmObservacao.Text);
end;


procedure TfrmBaixarTituloLancamentosCR.AtualizarValorPago;
begin
  ADOCommand1.CommandText := '';
  ADOCommand1.CommandText := 'update contas_receber set valor_recebido=valor_recebido + ' +
    self.edtValorRecebido.Text + ' where idconta_receber=' + self.idconta_receber;

  ADOCommand1.Execute;
end;


procedure TfrmBaixarTituloLancamentosCR.AtualizarSaldoCredor;
begin
  //atualiza o edit "Saldo Devedor"
  self.edtSaldoCredor.Text :=
    FloatTOStr(StrToFloat(self.edtSaldoCredor.Text) - StrToFloat(self.edtValorRecebido.Text));
end;


procedure TfrmBaixarTituloLancamentosCR.AtualizarContaCorrente;
var
  saldo : double;
begin
  saldo := self.PegarSaldoContaCorrente;

  //atualiza a conta corrente com o novo saldo
  saldo := saldo + self.lancamentoCR.getValorRecebido;

  self.ADOCommand1.CommandText := '';
  self.ADOCommand1.CommandText := 'update conta_corrente set saldo=' +
    FloatToStr(saldo) + ' where idconta_corrente=' +
    IntToStr(self.lancamentoCR.getIdContaCorrente) + ';';
  self.ADOCommand1.Execute;
end;


function TfrmBaixarTituloLancamentosCR.PegarSaldoContaCorrente;
var
  saldo_contacorrente : double;
begin
  self.ADOQuery2.SQL.Clear;
  self.ADOQuery2.SQL.Add('select saldo from conta_corrente where idconta_corrente=' +
    IntToStr(self.lancamentoCR.getIdContaCorrente) + ';');
  self.ADOQuery2.Active := true;
  saldo_contacorrente := StrToFloat(self.ADOQuery2.Fields[0].AsString);

  result := saldo_contacorrente;
end;


function TfrmBaixarTituloLancamentosCR.VerificarCamposNulos;
begin
  if (edtTipoPagamento.Text = '') or (edtValorRecebido.Text = '') or
      (StrToFloat(self.edtValorRecebido.Text) = 0) then
    result := true
  else
    result := false;
end;


function TfrmBaixarTituloLancamentosCR.VerificarValorPago;
begin
  if (StrToFloat(self.edtValorRecebido.Text)) > StrToFloat(self.edtSaldoCredor.Text) then
    result := true
  else
    result := false;
end;


procedure TfrmBaixarTituloLancamentosCR.VerificarQuita��o;
begin
  if (StrToFloat(self.edtSaldoCredor.Text)) = (StrToFloat(self.edtValorRecebido.Text)) then
  begin
    ADOCommand1.CommandText := '';
    ADOCommand1.CommandText := 'update contas_receber set quitado_em="' +
      FormatDateTime('yyyy-mm-dd', self.dtpDataRecebimento.Date) +
      '" where idconta_receber=' + self.idconta_receber + ';';

    ADOCommand1.Execute;

    self.btnSalvar.Enabled := false;
  end;
end;


procedure TfrmBaixarTituloLancamentosCR.LimparCampos;
begin
  self.dtpDataRecebimento.Date := now;
  self.edtIdTipoPagamento.Text := '';
  self.edtTipoPagamento.Text := '';
  self.edtContaCorrente.Text := '';
  self.edtIdContaCorrente.Text := '';
  self.edtValorRecebido.Text := '';
  mmObservacao.Text := '';
end;


end.
