unit uPlanoContasCadastradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, uPlanoContas;

type
  TfrmPlanoContasCadastradas = class(TForm)
    DBGrid1: TDBGrid;
    btnVoltar: TButton;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOTable1idplano_contas: TAutoIncField;
    ADOTable1sequencia: TIntegerField;
    ADOTable1titulo: TWideStringField;
    ADOTable1ativo: TWideStringField;
    btnNovo: TButton;
    btnExcluir: TButton;
    ADOCommand1: TADOCommand;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    plano : TfrmPlanoContas;
  public
    selecionar_plano : boolean;
    idplano : integer;
    titulo : string;
  end;

var
  frmPlanoContasCadastradas: TfrmPlanoContasCadastradas;

implementation

{$R *.dfm}

procedure TfrmPlanoContasCadastradas.btnExcluirClick(Sender: TObject);
begin
  if DBGrid1.Fields[0].AsString <> '' then
    if Application.MessageBox('Tem certeza que deseja excluir esse dado?',
      'Confirma��o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      ADOCommand1.CommandText := 'delete from plano_contas where idplano_contas=' +
        DBGrid1.Fields[0].AsString + ';';

      try
        ADOCommand1.Execute;

        ADOTable1.Active := false;
        ADOTable1.Active := true;

        Application.MessageBox('Dado exclu�do com sucesso!', 'Conclu�do',
          MB_OK + MB_ICONINFORMATION);
      except
        on e : Exception do
          Application.MessageBox('N�o foi poss�vel excluir o dado selecionado'#10'porque ele tem rela��o com outro dado cadastrado!',
            'Erro ao excluir', MB_OK + MB_ICONSTOP);
      end;
    end;
end;

procedure TfrmPlanoContasCadastradas.btnNovoClick(Sender: TObject);
begin
  self.plano.ShowModal;

  self.ADOTable1.Active := false;
  self.ADOTable1.Active := true;
end;

procedure TfrmPlanoContasCadastradas.btnVoltarClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmPlanoContasCadastradas.DBGrid1CellClick(Column: TColumn);
begin
  if selecionar_plano = true then
  begin
    self.idplano := StrToInt(DBGrid1.Fields[0].AsString);
    self.titulo := DBGrid1.Fields[2].AsString;

    self.selecionar_plano := false;

    self.Close;
  end;
end;

procedure TfrmPlanoContasCadastradas.FormActivate(Sender: TObject);
begin
  self.plano := TfrmPlanoContas.Create(nil);
end;

procedure TfrmPlanoContasCadastradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.plano.Destroy;
end;

end.
