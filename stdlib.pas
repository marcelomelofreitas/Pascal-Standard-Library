{===========================================================================
   The C Standard Library - <cstdlib> (stdlib.h)

   Referencias: http://www.cplusplus.com/reference/cstdlib
                https://www.tutorialspoint.com/c_standard_library/stdlib_h.htm
============================================================================
  Unit stdlib.pas
--------------------------------------------------------------------------
  Versao: 0.0.1
  Data: 06/08/2018
============================================================================
  Historico de versões
  ------------------------------------------------------------------------
  [2018-08/06] (v0.0.1) <Marcello Mello>

  - Criação da versão inicial
===========================================================================}

unit stdlib;


interface

  function memset(dest: Pointer; val: Integer; count: Integer): Pointer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function _errno: PInteger; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function strtoull(const Str: PAnsiChar; var EndPtr: PAnsiChar; Radix: integer): UInt64; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  procedure _exit(Code: Integer); {$IFNDEF CPU64BITS} cdecl; {$ENDIF}

const
  SEEK_SET        = 0;               { seek to an absolute position }
  SEEK_CUR        = 1;               { seek relative to current position }
  SEEK_END        = 2;               { seek relative to end of file }

implementation

uses
  System.Win.Crtl,
  windows;

function memset; external msvcrt;
function _errno; external msvcrt;
function strtoull; external msvcrt name '_strtoui64';
procedure _exit; external msvcrt;


initialization

end.
