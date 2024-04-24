program delObjFolder;
{$WARN 5092 off : Variable "$1" of a managed type does not seem to be initialized}

//-----------------------------------------------------------------------------
//
//   B4X Object folder deletion Utility (April 2024 - Kherson, UA)
//   Written to keep my sanity while the city is being shelled by the ruskies.
//   And wanted to play with Pascal again...
//
//   (c)2024 - All Of Humanity
//-----------------------------------------------------------------------------

uses
  SysUtils,fileutil,LazFileUtils;


var
  currDir: String;
  Result: Boolean;

begin


  WriteLn('=========================================');
  WriteLn('B4X Objects folder cleanup!');
  WriteLn('=========================================');
  WriteLn('');
      
  currDir := ExtractFilePath(ParamStr(0)) + 'Objects';
  If DirPathExists(currDir) then Begin

      WriteLn('Removing folder: ' + currDir);
      Sleep(500);
      Result := DeleteDirectory(currDir,True);

      if Result then begin
         RemoveDirUTF8(currDir);
         WriteLn('All done!');
      End Else Begin
         WriteLn('ERROR removing folder');
         Sleep(8000);
      End;

  End Else Begin

    WriteLn('Folder **' + currDir + '**   NOT FOUND, exiting...');
    Sleep(4000);

  End;

  //--- stop program loop
  Exit;

end.

