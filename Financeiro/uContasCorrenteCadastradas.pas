unit uContasCorrenteCadastradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uContasCorrente, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB;

type
  TfrmContasCorrenteCadastradas = class(TForm)
    btnNova: TButton;
    btnVoltar: TButton;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1Código: TAutoIncField;
    ADOQuery1Nome: TWideStringField;
    ADOQuery1Agência: TIntegerField;
    ADOQuery1Saldo: TFloatField;
    ADOQuery1Padrãopimprimirboleto: TWideStringField;
    ADOQuery1Ativo: TWideStringField;
    procedure btnNovaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
  private
  public
    contas_corrente : TfrmContasCorrente;
    selecionar : boolean;
    idconta_corrente : integer;
    nome_conta_corrente : string;
  end;

var
  frmContasCorrenteCadastradas: TfrmContasCorrenteCadastradas;

implementation

{$R *.dfm}

procedure TfrmContasCorrenteCadastradas.btnNovaClick(Sender: TObject);
begin
  self.contas_corrente := TfrmContasCorrente.Create(nil);
  self.contas_corrente.ShowModal;
  self.contas_corrente.Destroy;

  self.ADOQuery1.Active := false;
  self.ADOQuery1.Active := true;
end;

procedure TfrmContasCorrenteCadastradas.btnVoltarClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmContasCorrenteCadastradas.DBGrid1CellClick(Column: TColumn);
begin
  if self.selecionar = true then
  begin
    self.idconta_corrente := StrToInt(DBGrid1.Fields[0].AsString);
    self.nome_conta_corrente := DBGrid1.Fields[1].AsString;
    self.Close;

    self.selecionar := false;
  end;
end;

procedure TfrmContasCorrenteCadastradas.FormActivate(Sender: TObject);
begin
  self.ADOQuery1.Active := false;
  self.ADOQuery1.Active := true;
end;

end.
