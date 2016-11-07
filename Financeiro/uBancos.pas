unit uBancos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Win.ADODB, Data.DB,
  uClassBancos;

type
  TfrmBancos = class(TForm)
    edtCodigo: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    chkAtivo: TCheckBox;
    brnCadastrar: TButton;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOCommand1: TADOCommand;
    procedure Button2Click(Sender: TObject);
    procedure brnCadastrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    bancos : ClassBancos;
    procedure PegarDados;
    procedure CadastrarBanco;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmBancos: TfrmBancos;

implementation

{$R *.dfm}

procedure TfrmBancos.brnCadastrarClick(Sender: TObject);
begin
  self.CadastrarBanco;
end;


procedure TfrmBancos.CadastrarBanco;
begin
  self.PegarDados;

  self.ADOCommand1.CommandText := 'insert into banco values(null, "' +
    self.bancos.getCodigo + '", "' + self.bancos.getNome +'", "' +
    self.bancos.getAtivo + '");';

  try
    self.ADOCommand1.Execute;

    self.LimparCampos;

    Application.MessageBox('Banco cadastrado com sucesso!', 'Conclu�do',
      MB_OK + MB_ICONINFORMATION);

    self.edtCodigo.SetFocus;
  except
    on e : Exception do
      Application.MessageBox('N�o foi poss�vel cadastrar o banco!', 'Erro ao cadastrar',
        MB_OK + MB_ICONSTOP);
  end;
end;


procedure TfrmBancos.PegarDados;
begin
  self.bancos.setCodigo(self.edtCodigo.Text);
  self.bancos.setNome(self.edtNome.Text);
  if self.chkAtivo.Checked = true then
    self.bancos.setAtivo('S')
  else
    self.bancos.setAtivo('N');
end;


procedure TfrmBancos.FormActivate(Sender: TObject);
begin
  self.bancos := ClassBancos.cBancos;
end;

procedure TfrmBancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.bancos.dBancos;
end;


procedure TfrmBancos.LimparCampos;
begin
  self.chkAtivo.Checked := true;
  self.edtCodigo.Text := '';
  self.edtNome.Text := '';
end;


procedure TfrmBancos.Button2Click(Sender: TObject);
begin
  self.Close;
end;

end.
