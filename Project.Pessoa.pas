unit Project.Pessoa;


interface

uses
  Project.Interfaces, Project.Endereco;

type
  TPessoa = class(TInterfacedObject, iPessoa)
    private
      FPessoaFisica : iPessoaFisica<iPessoa>;
      FPessoaJuridica : iPessoaJuridica<iPessoa>;
      FNome : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iPessoa;
      function PessoaFisica : iPessoaFisica<iPessoa>;
      function PessoaJuridica : iPessoaJuridica<iPessoa>;
      function Nome ( aValue : String ) : iPessoa; overload;
      function Nome : String; overload;
  end;

implementation

uses
  Project.PessoaFisica, Project.PessoaJuridica;

{ TPessoa }

function TPessoa.Nome(aValue: String): iPessoa;
begin
  Result := Self;
  FNome := aValue;
end;

function TPessoa.Nome: String;
begin
  Result := FNome;
end;

function TPessoa.PessoaFisica: iPessoaFisica<iPessoa>;
begin
  Result := FPessoaFisica;
end;

function TPessoa.PessoaJuridica: iPessoaJuridica<iPessoa>;
begin
  Result := FPessoaJuridica;
end;

constructor TPessoa.Create;
begin
  FPessoaFisica := TPessoaFisica<iPessoa>.New(Self);
  FPessoaJuridica := TPessoaJuridica<iPessoa>.New(Self);
end;

destructor TPessoa.Destroy;
begin

  inherited;
end;

class function TPessoa.New: iPessoa;
begin
    Result := Self.Create;
end;

end.
