unit Project.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Project.PessoaFisica, Project.Pessoa,
  Project.PessoaJuridica, Vcl.StdCtrls, Project.Interfaces;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Pessoa : iPessoa;
begin

  //Atribuindo Valores a Classe
  Pessoa :=
    TPessoa
      .New
        .PessoaFisica
          .CPF('221.636.278-61')
          .Endereco
            .Rua('Av. das Hortencias')
            .Numero(31)
          .&End
      .&End
      .Nome('Rodrigo');

  Memo1.Lines.Add(
    'Pessoa Fisica: ' +
    'CPF: ' + Pessoa.PessoaFisica.CPF + ' ' +
    'Endereco: ' + Pessoa.PessoaFisica.Endereco.Rua + ' - ' + Pessoa.PessoaFisica.Endereco.Numero.ToString + ' ' +
    'Nome: ' + Pessoa.Nome
  );
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Pessoa : iPessoa;
begin

  //Atribuindo Valores a Classe
  Pessoa :=
    TPessoa
      .New
        .PessoaJuridica
          .CNPJ('100.232.123/0001-92')
          .Endereco
            .Rua('Av. das Hortencias PJ')
            .Numero(144)
          .&End
      .&End
      .Nome('Rodrigo PJ');

  Memo1.Lines.Add(
    'Pessoa Juridica: ' +
    'CNPJ: ' + Pessoa.PessoaJuridica.CNPJ + ' ' +
    'Endereco: ' + Pessoa.PessoaJuridica.Endereco.Rua + ' - ' + Pessoa.PessoaJuridica.Endereco.Numero.ToString + ' ' +
    'Nome: ' + Pessoa.Nome
  );
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
