unit uContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  uClientesFornecedoresCadastrados, uPlanoContasCadastradas, Data.DB,
  Data.Win.ADODB, Vcl.DBCtrls, uTiposCobrancaCadastrados, uClassContasPagar;

type
  TfrmContasPagar = class(TForm)
    GroupBox1: TGroupBox;
    T�tulo: TLabel;
    edtTitulo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    dtpDataEmissao: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    edtParcelas: TEdit;
    dtpVencimento: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    edtFornecedor: TEdit;
    Label8: TLabel;
    edtPlanoConta: TEdit;
    btnSelecionarFornecedor: TButton;
    btnSelecionaPlanoConta: TButton;
    btnCadastrarContaPagar: TButton;
    btnVoltar: TButton;
    edtValorTotal: TEdit;
    mmDescricao: TMemo;
    Label9: TLabel;
    edtIdFornecedor: TEdit;
    Label10: TLabel;
    edtIdPlanoContas: TEdit;
    Label11: TLabel;
    edtIdTipoCobranca: TEdit;
    edtTipoCobranca: TEdit;
    btnSelecionarTipoCobranca: TButton;
    ADOCommand1: TADOCommand;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCadastrarContaPagarClick(Sender: TObject);
    procedure btnSelecionarFornecedorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionaPlanoContaClick(Sender: TObject);
    procedure btnSelecionarTipoCobrancaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fornecedor : TfrmClieFornCadastrados;
    plano: TfrmPlanoContasCadastradas;
    tipo_cobranca : TfrmTiposCobrancaCadastrados;
    contas_pagar : ClassContasPagar;
    function VerificarCamposNulos : boolean;
    procedure CadastrarContaPagar;
    procedure PegarDados;
    function PegarUltimaConta : string;
    procedure LimparCampos;
    procedure LoopParcelas;
  public
    { Public declarations }
  end;

var
  frmContasPagar: TfrmContasPagar;

implementation

{$R *.dfm}

function TfrmContasPagar.VerificarCamposNulos;
begin
  if (edtTitulo.Text = '') or (edtTipoCobranca.Text = '') or
      (StrToInt(edtParcelas.Text) <= 0) or (StrToFloat(edtValorTotal.Text) <= 0) or
      (edtFornecedor.Text = '') or (edtPlanoConta.Text = '') then
    result := true
  else
    result := false;
end;


procedure TfrmContasPagar.btnCadastrarContaPagarClick(Sender: TObject);
begin
  if self.VerificarCamposNulos = true then
    Application.MessageBox('Os campos com * n�o podem ser nulos!', 'Aten��o',
      MB_OK + MB_ICONEXCLAMATION)
  else
  begin
    try
      self.CadastrarContaPagar;

      self.LimparCampos;

      Application.MessageBox('Conta � Pagar cadastrada com sucesso!', 'Conclu�do',
        MB_OK + MB_ICONINFORMATION);

      edtTitulo.SetFocus;
    except
    on e : Exception do
      Application.MessageBox('N�o foi poss�vel cadastrar a conta � pagar!',
        'Erro ao cadastrar', MB_OK + MB_ICONSTOP);
    end;
  end;
end;


procedure TfrmContasPagar.CadastrarContaPagar;
begin
  self.PegarDados;

  self.LoopParcelas;
end;


procedure TfrmContasPagar.PegarDados;
begin
  self.contas_pagar.setDataCadastro(FormatDateTime('yyyy-mm-dd', date));
  self.contas_pagar.setTitulo(edtTitulo.Text);
  self.contas_pagar.setDescricao(mmDescricao.Text);
  self.contas_pagar.setDataEmissao(FormatDateTime('yyyy-mm-dd', dtpDataEmissao.Date));
  self.contas_pagar.setQuantParcelas(StrToInt(edtParcelas.Text));
  self.contas_pagar.setVencimento(FormatDateTime('yyyy-mm-dd', dtpVencimento.Date));
  self.contas_pagar.setValor(StrToFloat(edtValorTotal.Text));
  self.contas_pagar.setIdTipoCobranca(StrToInt(edtIdTipoCobranca.Text));
  self.contas_pagar.setIdPlanoContas(StrToInt(edtIdPlanoContas.Text));
  self.contas_pagar.setIdClienteFornecedor(StrToInt(edtIdFornecedor.Text));
end;


procedure TfrmContasPagar.LoopParcelas;
var
  i : integer;
  numero_conta : string;
  data_parcela : string;
begin
  //pega a data da primeira parcela
  data_parcela := '"' + contas_pagar.getVencimento + '"';

  //pega o �ltimo numero_conta
  numero_conta := '';
  numero_conta := self.PegarUltimaConta;

  i := 1;
  while i <= contas_pagar.getQuantParcelas do
  begin
    ADOCommand1.CommandText := '';

    ADOCommand1.CommandText := 'insert into contas_pagar values(null, ' +
      numero_conta + ', "' +
      contas_pagar.getDataCadastro + '", "' +
      contas_pagar.getTitulo + '", "' +
      contas_pagar.getDescricao + '", "' +
      contas_pagar.getDataEmissao + '", ' +
      IntToStr(i) + ', ' +
      data_parcela + ', ' +
      FloatToStr(contas_pagar.getValor) + ', 0, 0, ' +
      IntToStr(contas_pagar.getIdTipoCobranca) + ', ' +
      IntToStr(contas_pagar.getIdPlanoContas) + ', ' +
      IntToStr(contas_pagar.getIdClienteFornecedor) + ');';

    ADOCommand1.Execute;

    //pega a data da parcela seguinte
    data_parcela := 'date_add("' + contas_pagar.getVencimento + '", interval ' +
      IntToStr(i) + ' month)';
    i := i + 1;
  end;
end;


function TfrmContasPagar.PegarUltimaConta;
var
  num_conta : string;
begin
  //pega o �ltimo numero_conta
  self.ADOQuery1.SQL.Clear;
  self.ADOQuery1.SQL.Add('select max(numero_conta) from contas_pagar;');
  self.ADOQuery1.Active := true;
  num_conta := ADOQuery1.Fields[0].AsString;

  if num_conta <> '' then
    num_conta := IntToStr(StrToInt(num_conta) + 1)
  else
    num_conta := '1'; //ou seja, � a primeira conta

  result := num_conta;
end;


procedure TfrmContasPagar.LimparCampos;
begin
  edtTitulo.Text := '';
  mmDescricao.Text := '';
  edtTipoCobranca.Text := '';
  edtIdTipoCobranca.Text := '';
  edtParcelas.Text := '1';
  edtValorTotal.Text := '0.00';
  edtFornecedor.Text := '';
  edtIdFornecedor.Text := '';
  edtPlanoConta.Text := '';
  edtIdPlanoContas.Text := '';
  self.dtpDataEmissao.Date := now;
  self.dtpVencimento.Date := now;
end;


procedure TfrmContasPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.fornecedor.Destroy;
  self.contas_pagar.dContasPagar;
  self.plano.Destroy;
  self.tipo_cobranca.Destroy;
end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  self.tipo_cobranca := TfrmTiposCobrancaCadastrados.Create(nil);
  self.fornecedor := TfrmClieFornCadastrados.Create(nil);
  self.plano := TfrmPlanoContasCadastradas.Create(nil);
  self.contas_pagar := ClassContasPagar.cContasPagar;
  self.dtpDataEmissao.Date := now;
  self.dtpVencimento.Date := now;
end;

procedure TfrmContasPagar.btnSelecionaPlanoContaClick(Sender: TObject);
begin
  self.plano.selecionar_plano := true;

  self.plano.ShowModal;

  edtPlanoConta.Text := self.plano.titulo;
  edtIdPlanoContas.Text := IntToStr(self.plano.idplano);
end;

procedure TfrmContasPagar.btnSelecionarFornecedorClick(Sender: TObject);
begin
  //seleciona o FORNECEDOR
  self.fornecedor.selecionar_forn := true;

  self.fornecedor.ADOQuery1.SQL.Clear;
  self.fornecedor.ADOQuery1.SQL.Add('select idcliente_fornecedor as "C�digo", ' +
    'nome_razaosocial as "Nome/Raz�o Social", ' +
    'apelido_nomefantasia as "Apelido/Nome Fantasia", ' +
	  'cpf as "CPF", cnpj as "CNPJ", telefone as "Telefone", celular as "Celular", ' +
    'email as "Email", ativo as "Ativo" ' +
    'from cliente_fornecedor where ativo="S" and (tipo="F" or tipo="CF");');
  self.fornecedor.ADOQuery1.Active := false;
  self.fornecedor.ADOQuery1.Active := true;

  self.fornecedor.ShowModal;

  self.edtIdFornecedor.Text := IntToStr(self.fornecedor.id_fornecedor);
  self.edtFornecedor.Text := self.fornecedor.nome_clie_forn;
end;

procedure TfrmContasPagar.btnSelecionarTipoCobrancaClick(Sender: TObject);
begin
  self.tipo_cobranca.selecionar_tc := true;

  self.tipo_cobranca.ShowModal;

  edtIdTipoCobranca.Text := IntToStr(self.tipo_cobranca.id_tipo);
  edtTipoCobranca.Text := self.tipo_cobranca.tipo;
end;

procedure TfrmContasPagar.btnVoltarClick(Sender: TObject);
begin
  self.LimparCampos;
  self.Close;
end;

end.
