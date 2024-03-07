unit Project.PessoaFisica;

interface

uses
  Project.Interfaces, Project.Endereco;

type
  TPessoaFisica<T : IInterface> = class(TInterfacedObject, iPessoaFisica<T>)
    private
      [Weak]
      FParent : T;
      FCPF : String;
      FEndereco : iEndereco<iPessoaFisica<T>>;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iPessoaFisica<T>;
      function Endereco : iEndereco<iPessoaFisica<T>>;
      function CPF ( aValue : String ) : iPessoaFisica<T>; overload;
      function CPF : String; overload;
      function &End : T;
  end;

implementation

{ TPessoaFisica }

function TPessoaFisica<T>.CPF(aValue: String): iPessoaFisica<T>;
begin
  Result := Self;
  FCPF := aValue;
end;

function TPessoaFisica<T>.&End: T;
begin
  Result := FParent;
end;

function TPessoaFisica<T>.CPF: String;
begin
  Result := FCPF;
end;

constructor TPessoaFisica<T>.Create(Parent : T);
begin
  FParent := Parent;
  FEndereco := TEndereco<iPessoaFisica<T>>.New(Self);
end;

destructor TPessoaFisica<T>.Destroy;
begin

  inherited;
end;

function TPessoaFisica<T>.Endereco: iEndereco<iPessoaFisica<T>>;
begin
  Result := FEndereco;
end;

class function TPessoaFisica<T>.New(Parent : T): iPessoaFisica<T>;
begin
    Result := Self.Create(Parent);
end;

end.
