unit uTiposCobranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Win.ADODB, Vcl.StdCtrls;

type
  TfrmTiposCobranca = class(TForm)
    Label1: TLabel;
    edtNome: TEdit;
    chkAtivo: TCheckBox;
    btnCadastrar: TButton;
    btnVoltar: TButton;
    ADOCommand1: TADOCommand;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
  private
    nome : string;
    ativo : char;
    procedure CadastrarTipoCobranca;
  public
    { Public declarations }
  end;

var
  frmTiposCobranca: TfrmTiposCobranca;

implementation

{$R *.dfm}

procedure TfrmTiposCobranca.btnCadastrarClick(Sender: TObject);
begin
  if edtNome.Text = '' then
    Application.MessageBox('N�o deixe o campo em branco!', 'Aten��o',
      MB_OK + MB_ICONEXCLAMATION)
  else
  begin
    try
      self.CadastrarTipoCobranca;

      Application.MessageBox('Tipo de Cobran�a cadastrado com sucesso!', 'Conclu�do',
        MB_OK + MB_ICONINFORMATION);

      edtNome.Text := '';
      chkAtivo.Checked := true;

      edtNome.SetFocus;
    except
      on e : Exception do
        Application.MessageBox('N�o foi poss�vel cadastrar o tipo de cobran�a!',
          'Erro ao cadastrar', MB_OK + MB_ICONSTOP);
    end;
  end;
end;


procedure TfrmTiposCobranca.CadastrarTipoCobranca;
begin
  if chkAtivo.Checked = true then
    ADOCommand1.CommandText := 'insert into tipo_cobranca values(null, "' +
      edtNome.Text + '", "S");'
  else
    ADOCommand1.CommandText := 'insert into tipo_cobranca values(null, "' +
      edtNome.Text + '", "N");';

  ADOCommand1.Execute;
end;


procedure TfrmTiposCobranca.btnVoltarClick(Sender: TObject);
begin
  self.Close;
end;

end.
