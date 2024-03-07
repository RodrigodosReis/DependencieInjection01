unit Project.Interfaces;

interface

type
  iEndereco<T> = interface;
  iPessoaFisica<T> = interface;
  iPessoaJuridica<T> = interface;

  iEndereco<T> = interface
    ['{7F0F0C8B-B714-4BA8-831E-4A15D285FC21}']
    function Rua ( aValue : String ) : iEndereco<T>; overload;
    function Rua : String; overload;
    function Numero ( aValue : Integer ) : iEndereco<T>; overload;
    function Numero : Integer; overload;
    function &End : T;
  end;

  iPessoa = interface
    ['{40983515-F8A6-4803-8D5B-386AF5905E10}']
    function PessoaFisica : iPessoaFisica<iPessoa>;
    function PessoaJuridica : iPessoaJuridica<iPessoa>;
    function Nome ( aValue : String ) : iPessoa; overload;
    function Nome : String; overload;
  end;

  iPessoaFisica<T> = interface
    ['{BA97123F-5B75-466B-8F3C-D2DA3FDE9267}']
    function Endereco : iEndereco<iPessoaFisica<T>>;
    function CPF ( aValue : String ) : iPessoaFisica<T>; overload;
    function CPF : String; overload;
    function &End : T;
  end;

  iPessoaJuridica<T> = interface
    ['{3D0D4CB3-BCAE-4205-8F92-F2E01143454A}']
    function Endereco : iEndereco<iPessoaJuridica<T>>;
    function CNPJ ( aValue : String ) : iPessoaJuridica<T>; overload;
    function CNPJ : String; overload;
    function &End : T;
  end;

implementation

end.
