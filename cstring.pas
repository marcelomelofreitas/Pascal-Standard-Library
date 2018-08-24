{===========================================================================
   The C Standard Library - <cstring> string.h

   Referencias: http://www.cplusplus.com/reference/cstring
                https://www.tutorialspoint.com/c_standard_library/string_h.htm
============================================================================
  Unit cstring.pas
--------------------------------------------------------------------------
  Versao: 0.0.1
  Data: 06/08/2018
============================================================================
  Historico de versões
  ------------------------------------------------------------------------
  [2018-08/06] (v0.0.1) <Marcello Mello>

  - Criação da versão inicial
===========================================================================}

unit cstring;

interface

  function strcpy(Dest: PAnsiChar; const Source: PAnsiChar): PAnsiChar; overload;
  function strcpy(Dest: PAnsiChar; const Source: AnsiString): PAnsiChar; overload;
  function strcpy(var Dest: AnsiString; const Source: PAnsiChar): PAnsiChar; overload;
  function strcpy(var Dest: AnsiString; const Source: AnsiString): PAnsiChar; overload;

  function strlen(const str: PAnsiChar): NativeUInt; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function strcmp(const Str1: PAnsiChar; const str2: PAnsiChar): Integer; overload;
  function strcmp(const Str1: AnsiString; const str2: AnsiString): Integer; overload;
  function atoi(const str: PAnsiChar): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function strtok(const str: PAnsiChar; const delim: PAnsiChar): PAnsiChar; overload;
  function strtok(var str: AnsiString; const delim: AnsiString): AnsiString; overload;
  function strchr(const str: PAnsiChar; c: AnsiChar): PAnsiChar; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function stricmp(const Str1: PAnsiChar; const Str2: PAnsiChar): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function strncmp(const str1: PAnsiChar; const str2: PAnsiChar; n: Integer): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function strcspn(const str1: pansichar; const str2: pansichar): NativeUInt; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function strstr(const haystack: PAnsiChar; const needle: PAnsiChar): PAnsiChar; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}

  function strcat(dest: PAnsiChar; const src: PAnsiChar): PAnsiChar; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}

implementation

uses
  System.Win.Crtl,
  windows;

function strcmp_external_lib(Str1: PAnsiChar; str2: PAnsiChar): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} external msvcrt name 'strcmp';
function strtok_external_lib(const str: PAnsiChar; const delim: PAnsiChar): PAnsiChar; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} external msvcrt name 'strtok';
function strcpy_external_lib(Dest: PAnsiChar; const Source: PAnsiChar): PAnsiChar; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} external msvcrt name 'strcpy';

function stricmp; external msvcrt name '_stricmp';
function atoi; external msvcrt;
function strlen; external msvcrt;
function strchr; external msvcrt;
function strncmp; external msvcrt;
function strcspn; external msvcrt;
function strstr; external msvcrt;
function strcat; external msvcrt;

function strcpy(Dest: PAnsiChar; const Source: PAnsiChar): PAnsiChar;
begin
  Result := strcpy_external_lib(Dest, Source);
end;

function strcpy(var Dest: AnsiString; const Source: AnsiString): PAnsiChar; overload;
begin
  Result := strcpy_external_lib(@Dest[1], PAnsiChar(Source));
end;

function strcpy(var Dest: AnsiString; const Source: PAnsiChar): PAnsiChar; overload;
begin
  Result := strcpy_external_lib(@Dest[1], Source);
end;

function strcpy(Dest: PAnsiChar; const Source: AnsiString): PAnsiChar; overload;
begin
  Result := strcpy_external_lib(Dest, @Source[1]);
end;

function strtok(const str: PAnsiChar; const delim: PAnsiChar): PAnsiChar;
begin
  Result := strtok_external_lib(str, delim);
end;

function strtok(var str: AnsiString; const delim: AnsiString): AnsiString;
begin
  Result := strtok_external_lib(@str[1], @delim[1]);
end;

function strcmp(const Str1: AnsiString; const str2: AnsiString): Integer;
begin
  Result := strcmp_external_lib(PAnsiChar(str1), PAnsiChar(str2));
end;

function strcmp(const Str1: PAnsiChar; const str2: PAnsiChar): Integer;
begin
  Result := strcmp_external_lib(str1, str2);
end;

end.
