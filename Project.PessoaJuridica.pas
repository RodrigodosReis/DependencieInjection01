unit Project.PessoaJuridica;

interface

uses
  Project.Interfaces, Project.Endereco;

type
  TPessoaJuridica<T : IInterface> = class(TInterfacedObject, iPessoaJuridica<T>)
    private
      [Weak]
      FParent : T;
      FEndereco : iEndereco<iPessoaJuridica<T>>;
      FCNPJ : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iPessoaJuridica<T>;
      function Endereco : iEndereco<iPessoaJuridica<T>>;
      function CNPJ ( aValue : String ) : iPessoaJuridica<T>; overload;
      function CNPJ : String; overload;
      function &End : T;
  end;

implementation

{ TPessoaJuridica<T> }

function TPessoaJuridica<T>.CNPJ(aValue: String): iPessoaJuridica<T>;
begin
  Result := Self;
  FCNPJ := aValue;
end;

function TPessoaJuridica<T>.&End: T;
begin
  Result := FParent;
end;

function TPessoaJuridica<T>.CNPJ: String;
begin
  Result := FCNPJ;
end;

constructor TPessoaJuridica<T>.Create(Parent : T);
begin
  FParent := Parent;
  FEndereco := TEndereco<iPessoaJuridica<T>>.New(Self);
end;

destructor TPessoaJuridica<T>.Destroy;
begin

  inherited;
end;

function TPessoaJuridica<T>.Endereco: iEndereco<iPessoaJuridica<T>>;
begin
  Result := FEndereco;
end;

class function TPessoaJuridica<T>.New(Parent : T): iPessoaJuridica<T>;
begin
    Result := Self.Create(Parent);
end;

end.
