unit uGruposCF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  uClassGrupoCF, Data.Win.ADODB;

type
  TfrmGruposCF = class(TForm)
    Label1: TLabel;
    edtNome: TEdit;
    chkAtivo: TCheckBox;
    btnCadastrar: TButton;
    btnVoltar: TButton;
    ADOCommand1: TADOCommand;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    grupocf : ClassGrupoCF;
    procedure CadastrarGrupoCF;
  public
    { Public declarations }
  end;

var
  frmGruposCF: TfrmGruposCF;

implementation

{$R *.dfm}

procedure TfrmGruposCF.btnCadastrarClick(Sender: TObject);
begin
  self.CadastrarGrupoCF;
end;

procedure TfrmGruposCF.CadastrarGrupoCF;
begin
  if self.edtNome.Text = '' then
    Application.MessageBox('Preencha o campo em branco!', 'Aten��o',
      MB_OK + MB_ICONEXCLAMATION)
  else
  begin
    grupocf.setNome(edtNome.Text);

    if chkAtivo.Checked = true then
      ADOCommand1.CommandText :=
        'insert into grupo_cliente_fornecedor values(null, "' + grupocf.getNome + '", "S");'
    else
      ADOCommand1.CommandText :=
        'insert into grupo_cliente_fornecedor values(null, "' + grupocf.getNome + '", "N");';

    ADOCommand1.Execute;

    self.edtNome.Text := '';

    Application.MessageBox('Grupo de Cliente/Fornecedor adicionado com sucesso!',
      'Conclu�do', MB_OK + MB_ICONINFORMATION);

    self.edtNome.SetFocus;
  end;
end;

procedure TfrmGruposCF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.grupocf.dGrupoCF;
end;

procedure TfrmGruposCF.FormCreate(Sender: TObject);
begin
  self.grupocf := ClassGrupoCF.Create;
end;

procedure TfrmGruposCF.btnVoltarClick(Sender: TObject);
begin
  self.Close;
end;

end.
