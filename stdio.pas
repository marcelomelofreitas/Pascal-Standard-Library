{===========================================================================
   The C Standard Library - <cstdio> (stdio.h)

   Referencias: http://www.cplusplus.com/reference/cstdio
                https://www.tutorialspoint.com/c_standard_library/stdio_h.htm
============================================================================
  Unit stdio.pas
--------------------------------------------------------------------------
  Versao: 0.0.1
  Data: 06/08/2018
============================================================================
  Historico de versões
  ------------------------------------------------------------------------
  [2018-08-06] (v0.0.1) <Marcello Mello>

  - Criação da versão inicial
===========================================================================}

unit stdio;

interface

uses
  System.Types,
  windows,
  System.SysUtils;

const
  EOF = -1;

  function fopen(const Name: AnsiString; const Mode:  AnsiString): THandle; overload;
  function fopen(const Name: string; const Mode:  AnsiString): THandle; overload;
  function fclose(stream: THandle): Integer; cdecl;
  function fread(var ptr; size: size_t; count: Integer; stream: THandle): size_t; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function fwrite(ptr: Pointer; size: size_t; nmemb: size_t; stream: THandle): size_t; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function printf(format: PAnsiChar {args}): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} varargs;
  function wprintf(format: PChar {args}): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} varargs;
  function fscanf(stream: THandle; const format: PAnsiChar {args}): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} varargs;
  function scanf(format: PAnsiChar {args}): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} varargs;
  function feof(stream: THandle): Boolean; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function ferror(stream: THandle): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function fgets(Buffer: PAnsiChar; MaxCount: Integer; Handle: THandle): PAnsiChar; overload;
  function fgets(var Buffer: AnsiString; MaxCount: Integer; Handle: THandle): PAnsiChar; overload;
  procedure rewind(stream: THandle); {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function fseek(stream: THandle; offset: NativeInt; origin: Integer): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function ftell(stream: THandle): NativeInt; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function fprintf(fHandle: THandle; const format: PAnsiChar {args}): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} varargs;
  function sscanf(const Buffer: PAnsiChar; const Format: PAnsiChar {args}): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} varargs;
  function getch(): PAnsiChar; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function ungetc(Ch: AnsiChar; Stream: THandle): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function fgetc(stream: THandle): AnsiChar; {$IFNDEF CPU64BITS} cdecl; {$ENDIF}
  function vsprintf(str: PAnsiChar; const format: PAnsiChar {args}): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} varargs;
  function sprintf(str: PAnsiChar; const format: PAnsiChar {args}): Integer; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} varargs;

const
  SEEK_SET        = 0;               { seek to an absolute position }
  SEEK_CUR        = 1;               { seek relative to current position }
  SEEK_END        = 2;               { seek relative to end of file }

implementation

const
  msvcrt = 'msvcrt.dll';


function fopen_external_lib(const name: PAnsiChar; const mode:  PAnsiChar): THandle; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} external msvcrt name 'fopen';
function fgets_external_lib(Buffer: PAnsiChar; MaxCount: Integer; Handle: THandle): PAnsiChar; {$IFNDEF CPU64BITS} cdecl; {$ENDIF} external msvcrt name 'fgets';

function sscanf; external msvcrt;

function ferror; external msvcrt;
function feof; external msvcrt name 'feof';
procedure rewind; external msvcrt name 'rewind';
function fprintf; external msvcrt name 'fprintf';
function printf; external msvcrt name 'printf';

function sprintf; external msvcrt;

function wprintf; external msvcrt name 'wprintf';

function scanf; external msvcrt name 'scanf';
function fscanf; external msvcrt name 'fscanf';
function fread; external msvcrt name 'fread';
function fwrite; external msvcrt name 'fwrite';
function ftell; external msvcrt name 'ftell';
function fclose; external msvcrt name 'fclose';
function getch; external msvcrt name '_getch';
function ungetc; external msvcrt;
function fgetc; external msvcrt name 'fgetc';
function fseek; external msvcrt name 'fseek';
function vsprintf; external msvcrt;

//function fseek(handle: NativeUInt; offset: Integer; origin: Integer): Integer;
//begin
//  Result := SetFilePointer(Handle, Offset, nil, origin);
//end;

//function ftell(Handle: NativeUInt): Integer;
//begin
//  Result := fseek(handle, 0, SEEK_CUR);
//end;

//function fopen(const Name : String; const Mode: Cardinal) : Integer;
//begin
//  Result := FileOpen(Name, fmOpenReadWrite);
//end;

//function fclose(handle: NativeUInt) : Boolean;
//begin
//  Result := System.Win.Crtl._close(handle) = 0;
//end;

//function fread(var ptr; size: Cardinal; nmemb: Integer; Handle: NativeUInt): size_t;
//begin
//  Result := FileRead(Handle, ptr, size);
//end;

function fopen(const Name: AnsiString; const Mode:  AnsiString): THandle;
begin
  Result := fopen_external_lib(PAnsiChar(Name), PAnsiChar(Mode));
end;

function fgets(Buffer: PAnsiChar; MaxCount: Integer; Handle: NativeUInt): PAnsiChar;
begin
  Result := fgets_external_lib(Buffer, MaxCount, Handle);
end;

function fgets(var Buffer: AnsiString; MaxCount: Integer; Handle: NativeUInt): PAnsiChar;
begin
  if Length(Buffer) < MaxCount then
    SetLength(Buffer, MaxCount);

  Result := fgets_external_lib(@Buffer[1], MaxCount, Handle);
end;


function fopen(const Name: string; const Mode:  AnsiString): THandle;
begin
  Result := fopen_external_lib(PAnsiChar(@AnsiString(Name)[1]), PAnsiChar(Mode));
end;

initialization

end.
