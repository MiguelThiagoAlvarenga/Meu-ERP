program MeuERP;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uGruposCF in 'Cliente-Fornecedor\uGruposCF.pas' {frmGruposCF},
  uClassGrupoCF in 'Classes\uClassGrupoCF.pas',
  uGruposCFCadastrados in 'Cliente-Fornecedor\uGruposCFCadastrados.pas' {frmGruposCFCadastrados},
  uClientesFornecedores in 'Cliente-Fornecedor\uClientesFornecedores.pas' {frmClientesFornecedores},
  uClassClienteFornecedor in 'Classes\uClassClienteFornecedor.pas',
  uClientesFornecedoresCadastrados in 'Cliente-Fornecedor\uClientesFornecedoresCadastrados.pas' {frmClieFornCadastrados},
  uTiposCobranca in 'Financeiro\uTiposCobranca.pas' {frmTiposCobranca},
  uPlanoContas in 'Financeiro\uPlanoContas.pas' {frmPlanoContas},
  uTiposPagamento in 'Financeiro\uTiposPagamento.pas' {frmTiposPagamento},
  uContasPagar in 'Financeiro\uContasPagar.pas' {frmContasPagar},
  uPlanoContasCadastradas in 'Financeiro\uPlanoContasCadastradas.pas' {frmPlanoContasCadastradas},
  uTiposCobrancaCadastrados in 'Financeiro\uTiposCobrancaCadastrados.pas' {frmTiposCobrancaCadastrados},
  uTiposPagamentoCadastrados in 'Financeiro\uTiposPagamentoCadastrados.pas' {frmTiposPagamentoCadastrados},
  uContasPagarCadastradas in 'Financeiro\uContasPagarCadastradas.pas' {frmContasPagarCadastradas},
  uClassContasPagar in 'Classes\uClassContasPagar.pas',
  uBaixarTituloLancamentosCP in 'Financeiro\uBaixarTituloLancamentosCP.pas' {frmBaixarTituloLancamentosCP},
  uContasReceberCadastradas in 'Financeiro\uContasReceberCadastradas.pas' {frmContasReceberCadastradas},
  uContasReceber in 'Financeiro\uContasReceber.pas' {frmContasReceber},
  uClassContasReceber in 'Classes\uClassContasReceber.pas',
  uBaixarTituloLancamentosCR in 'Financeiro\uBaixarTituloLancamentosCR.pas' {frmBaixarTituloLancamentosCR},
  uBancos in 'Financeiro\uBancos.pas' {frmBancos},
  uBancosCadastrados in 'Financeiro\uBancosCadastrados.pas' {frmBancosCadastrados},
  uClassBancos in 'Classes\uClassBancos.pas',
  uContasCorrente in 'Financeiro\uContasCorrente.pas' {frmContasCorrente},
  uContasCorrenteCadastradas in 'Financeiro\uContasCorrenteCadastradas.pas' {frmContasCorrenteCadastradas},
  uClassContasCorrente in 'Classes\uClassContasCorrente.pas',
  uClassLancamentosCP in 'Classes\uClassLancamentosCP.pas',
  uClassLancamentosCR in 'Classes\uClassLancamentosCR.pas',
  udmImprimir in 'Configuracoes\udmImprimir.pas' {dmImprimir: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmGruposCF, frmGruposCF);
  Application.CreateForm(TfrmGruposCFCadastrados, frmGruposCFCadastrados);
  Application.CreateForm(TfrmClientesFornecedores, frmClientesFornecedores);
  Application.CreateForm(TfrmClieFornCadastrados, frmClieFornCadastrados);
  Application.CreateForm(TfrmTiposCobranca, frmTiposCobranca);
  Application.CreateForm(TfrmPlanoContas, frmPlanoContas);
  Application.CreateForm(TfrmTiposPagamento, frmTiposPagamento);
  Application.CreateForm(TfrmContasPagar, frmContasPagar);
  Application.CreateForm(TfrmPlanoContasCadastradas, frmPlanoContasCadastradas);
  Application.CreateForm(TfrmTiposCobrancaCadastrados, frmTiposCobrancaCadastrados);
  Application.CreateForm(TfrmTiposPagamentoCadastrados, frmTiposPagamentoCadastrados);
  Application.CreateForm(TfrmContasPagarCadastradas, frmContasPagarCadastradas);
  Application.CreateForm(TfrmBaixarTituloLancamentosCP, frmBaixarTituloLancamentosCP);
  Application.CreateForm(TfrmContasReceberCadastradas, frmContasReceberCadastradas);
  Application.CreateForm(TfrmContasReceber, frmContasReceber);
  Application.CreateForm(TfrmBaixarTituloLancamentosCR, frmBaixarTituloLancamentosCR);
  Application.CreateForm(TfrmBancos, frmBancos);
  Application.CreateForm(TfrmBancosCadastrados, frmBancosCadastrados);
  Application.CreateForm(TfrmContasCorrente, frmContasCorrente);
  Application.CreateForm(TfrmContasCorrenteCadastradas, frmContasCorrenteCadastradas);
  Application.CreateForm(TdmImprimir, dmImprimir);
  Application.Run;
end.
