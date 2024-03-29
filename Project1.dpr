program Project1;

uses
  Vcl.Forms,
  Project.View.Principal in 'Project.View.Principal.pas' {Form1},
  Project.Interfaces in 'Project.Interfaces.pas',
  Project.Endereco in 'Project.Endereco.pas',
  Project.PessoaFisica in 'Project.PessoaFisica.pas',
  Project.PessoaJuridica in 'Project.PessoaJuridica.pas',
  Project.Pessoa in 'Project.Pessoa.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
