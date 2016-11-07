unit uTiposCobrancaCadastrados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, uTiposCobranca;

type
  TfrmTiposCobrancaCadastrados = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    btnNovo: TButton;
    ADOTable1idtipo_cobranca: TAutoIncField;
    ADOTable1nome: TWideStringField;
    ADOTable1ativo: TWideStringField;
    btnExcluir: TButton;
    ADOCommand1: TADOCommand;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    tipo_cobranca : TfrmTiposCobranca;
  public
    selecionar_tc : boolean;
    id_tipo : integer;
    tipo : string;
  end;

var
  frmTiposCobrancaCadastrados: TfrmTiposCobrancaCadastrados;

implementation

{$R *.dfm}

procedure TfrmTiposCobrancaCadastrados.btnExcluirClick(Sender: TObject);
begin
  if DBGrid1.Fields[0].AsString <> '' then
    if Application.MessageBox('Tem certeza que deseja excluir esse dado?',
      'Confirma��o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      ADOCommand1.CommandText := 'delete from tipo_cobranca where idtipo_cobranca=' +
        DBGrid1.Fields[0].AsString + ';';

      try
        ADOCommand1.Execute;

        ADOTable1.Active := false;
        ADOTable1.Active := true;

        Application.MessageBox('Tipo de Cobran�a exclu�do com sucesso!', 'Conclu�do',
          MB_OK + MB_ICONINFORMATION);
      except
        on e : Exception do
          Application.MessageBox('N�o foi possivel excluir o dado selecionado'#10'porque ele tem rela��o com outro dado cadastrado!',
            'Erro ao excluir', MB_OK + MB_ICONSTOP);
      end;
    end;
end;

procedure TfrmTiposCobrancaCadastrados.btnNovoClick(Sender: TObject);
begin
  self.tipo_cobranca.ShowModal;

  ADOTable1.Active := false;
  ADOTable1.Active := true;
end;

procedure TfrmTiposCobrancaCadastrados.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmTiposCobrancaCadastrados.DBGrid1CellClick(Column: TColumn);
begin
  if (self.selecionar_tc = true) and (DBGrid1.Fields[0].AsString <> '') then
  begin
    self.id_tipo := StrToInt(DBGrid1.Fields[0].AsString);
    self.tipo := DBGrid1.Fields[1].AsString;

    self.selecionar_tc := false;

    self.Close;
  end;
end;

procedure TfrmTiposCobrancaCadastrados.FormActivate(Sender: TObject);
begin
  self.tipo_cobranca := TfrmTiposCobranca.Create(nil);
end;

procedure TfrmTiposCobrancaCadastrados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.tipo_cobranca.Destroy;
end;

end.
