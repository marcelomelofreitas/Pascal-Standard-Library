{===========================================================================
   The C Standard Library - <cctype> ctype.h

   Referencias: http://www.cplusplus.com/reference/cctype/
                https://www.tutorialspoint.com/c_standard_library/ctype_h.htm
============================================================================
  Unit ctype.pas
--------------------------------------------------------------------------
  Versao: 0.0.1
  Data: 18/08/2018
============================================================================
  Historico de versões
  ------------------------------------------------------------------------
  [2018-08/18] (v0.0.1) <Marcello Mello>

  - Criação da versão inicial
===========================================================================}

unit ctype;

interface

function toupper(const c: AnsiChar): AnsiChar; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
function tolower(const c: AnsiChar): AnsiChar; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
function isalpha(const c: AnsiChar): Boolean; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
function isdigit(const c: AnsiChar): Boolean; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
function isspace(const c: AnsiChar): Boolean; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
function isupper(const c: AnsiChar): Boolean; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
function islower(const c: AnsiChar): Boolean; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
function isalnum(const c: AnsiChar): Boolean; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
function isxdigit(const c: AnsiChar): Boolean; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}

implementation
uses
  System.Win.Crtl;

function toupper; external msvcrt;
function tolower; external msvcrt;
function isalpha; external msvcrt;
function isdigit; external msvcrt;
function isspace; external msvcrt;
function isupper; external msvcrt;
function islower; external msvcrt;
function isalnum; external msvcrt;
function isxdigit; external msvcrt;

end.
