program KF2ServerToolCMD;
{$APPTYPE CONSOLE}

uses
  SysUtils,
  IniFiles,
  Forms,
  KFFile in 'KFFile.pas',
  KFItemEntity in 'KFItemEntity.pas',
  KFWksp in 'KFWksp.pas',
  UFuncoes in 'UFuncoes.pas',
  MainCMD in 'MainCMD.pas';

var
  useCustomServerPath: Boolean;
  customServerPath, pathKFGameIni, pathKFEngineIni, pathAcfSubFolder,
    pathAcfFile, Binaries, pathWorkshopCacheFolder, pathSteamAppCacheFolder,
    pathCmdTool, pathWorkshopSubItem, pathServerEXE: string;
  kfItems: TKFItems;
  serverPath: string;
  configName: String = 'KFServerToolCMD.ini';

function loadConfig: Boolean;
var
  IniConfig: TIniFile;
  iniPath: string;

begin
  Result := False;

  iniPath := ExtractFilePath(Application.ExeName) + configName;
  IniConfig := TIniFile.Create(iniPath);
  // Create if there's no config file

  if not FileExists(iniPath) then
  begin
    with IniConfig do
    begin
      WriteBool('PATHS', 'UseCustomServerPath', False);
      WriteString('PATHS', 'CustomServerPath', 'CHANGE_ME_FOR_CUSTOM_PATH');
      WriteString('PATHS', 'KFGameIni', 'KFGame\Config\PCServer-KFGame.ini');
      WriteString('PATHS', 'KFEngineIni',
        'KFGame\Config\PCServer-KFEngine.ini');
      WriteString('PATHS', 'AcfSubFolder',
        'Binaries\Win64\steamapps\workshop\');
      WriteString('PATHS', ' AcfFile',
        'Binaries\Win64\steamapps\workshop\content\232090');
      WriteString('PATHS', 'WorkshopCacheFolder',
        'Binaries\Win64\steamapps\workshop\content\232090');
      WriteString('PATHS', 'SteamAppCacheFolder', 'Binaries\Win64');
      WriteString('PATHS', 'SteamCmdTool', 'STEAMCMD\SteamCmd.exe');
      WriteString('PATHS', 'WorkshopSubItems',
        'steamapps\workshop\content\232090');
      WriteString('PATHS', 'ServerEXE', 'Binaries\win64\kfserver.exe');

    end;

  end;
  // Read config file
  try
    with IniConfig do
    begin
      // GAME
      useCustomServerPath := ReadBool('PATHS', 'UseCustomServerPath', False);
      customServerPath := ReadString('PATHS', 'CustomServerPath',
        'CHANGE_ME_FOR_CUSTOM_PATH');
      pathKFGameIni := ReadString('PATHS', 'KFGameIni',
        'KFGame\Config\PCServer-KFGame.ini');
      pathKFEngineIni := ReadString('PATHS', 'KFEngineIni',
        'KFGame\Config\PCServer-KFEngine.ini');
      pathAcfSubFolder := ReadString('PATHS', 'AcfSubFolder',
        'Binaries\Win64\steamapps\workshop\');
      pathAcfFile := ReadString('PATHS', ' AcfFile', 'appworkshop_232090.acf');
      pathWorkshopCacheFolder := ReadString('PATHS', 'WorkshopCacheFolder',
        'Binaries\Win64\steamapps\workshop\content\232090');
      pathSteamAppCacheFolder := ReadString('PATHS', 'SteamAppCacheFolder',
        'Binaries\Win64');
      pathCmdTool := ReadString('PATHS', 'SteamCmdTool',
        'STEAMCMD\SteamCmd.exe');
      pathWorkshopSubItem := ReadString('PATHS', 'WorkshopSubItems',
        'steamapps\workshop\content\232090');
      pathServerEXE := ReadString('PATHS', 'ServerEXE',
        'Binaries\win64\kfserver.exe');
    end;
    Result := True;
  finally
    IniConfig.Free;
  end;

end;

procedure CheckServerPath;
begin

  if useCustomServerPath then
  begin
    if FileExists(customServerPath + pathServerEXE) then
    begin
      serverPath := IncludeTrailingPathDelimiter(customServerPath);
    end
    else
    begin

      raise Exception.Create('Killing Floor 2 server not found.' + #13#10 +
          'Check if the app is in server folder or the ' + configName +
          ' is configured correctly.');
    end;
  end
  else
  begin

    if FileExists(ExtractFilePath(Application.ExeName) + pathServerEXE) then
    begin
      serverPath := ExtractFilePath(Application.ExeName);
    end
    else
    begin
      raise Exception.Create('Killing Floor 2 server not found.' + #13#10 +
          'Check if the app is in server folder or the ' + configName +
          ' is configured correctly.');
    end;
  end;

end;

var
  i: Integer;
  itemID, itemName: string;

begin

  try
    if (ParamCount <= 0) or (LowerCase(ParamStr(0)) = '-help') then
    begin
      Writeln('KF2ServerToolCMD 1.5');
      Writeln('  Usage:');
      Writeln('  KF2ServerToolCMD -option agurment=value');
      Writeln('  Example:');
      Writeln('  KF2ServerToolCMD -addmap id=1234567891');
      Writeln('');
      Writeln('');
      Writeln('Options:');
      Writeln('-list : list all installed itens');
      Writeln('');
      Writeln('-listdetalied : list all itens installed in a detalied view');
      Writeln('');
      Writeln('-remove id=<WorkshopID>   : Fully remove item');
      Writeln('');
      Writeln('-addmap id=<WorkshopID>   : Download and add entrys to map');
      Writeln('');
      Writeln('-addmod id=<WorkshopID>   : Download and add entrys to mod');
      Writeln('');
      Writeln('-custom <Agurments>  : Does one o more specied steps');
      Writeln('    Custom agurments:');
      Writeln('    aws=<WorkshopID>  : Add specified Workshop Subcribe');
      Writeln('    rws=<WorkshopID>  : Remove specified Workshop Subcribe');
      Writeln('    ame=<MapFileName> : Add specified Map Entry');
      Writeln('    rme=<MapFileName> : Remove specified Map Entry');
      Writeln('    amc=<MapFileName> : Add specified Map In Map Cycle');
      Writeln('    rmc=<MapFileName> : Remove specified Map In Map Cycle');
      Writeln(
        '    adl=<WorkshopID>  : Download specified Workshop map or item to cache');
      Writeln(
        '    rdl=<WorkshopID>  : Remove specified Workshop map or item to cache'
        );
      Writeln('');
      Writeln(
        '    Example: KF2ServerToolCMD -custom ame=KF-MyMap amc=KF-MyMap aws=1234567891');
      Writeln(
        '   (This will add just the map entry, the map in server cycle and workshop subscription.)');
      Writeln('');
      Writeln('-help : Show this message');

    end
    else
    begin
      loadConfig;
      CheckServerPath;
      kfItems := TKFItems.Create;
      try
        kfItems.SetKFApplicationPath(serverPath);
        kfItems.SetkKFngineIniSubPath(pathKFEngineIni);
        kfItems.SetKFGameIniSubPath(pathKFGameIni);
        kfItems.SetKFServerPathEXE(pathServerEXE);
        kfItems.appType := atGui;

        // ------------------------------------------------------------------- -AddMap
        if (LowerCase(ParamStr(1)) = '-addmap') then
        begin

          if ParamCount <> 2 then
            raise Exception.Create('Addmap: Invalid arguments');

          itemID := CleanInt(ParamStr(2));
          if Length(itemID) < 6 then
            raise Exception.Create('Addmap: Invalid ID');
          Writeln(' Starting...');
          Writeln(' Item ID: ' + itemID);
          kfItems.NewItem(itemID, itemName, True, True, True, True, False);

          Writeln(' Finished');
          Exit;
        end;
        // ------------------------------------------------------------------ -AddMod
        if (LowerCase(ParamStr(1)) = '-addmod') then
        begin

          if ParamCount <> 2 then
            raise Exception.Create('addmod: Invalid arguments');

          itemID := CleanInt(ParamStr(2));
          if Length(itemID) < 6 then
            raise Exception.Create('addmod: Invalid ID');

          Writeln(' Starting...');
          Writeln(' Item ID: ' + itemID);
          kfItems.NewItem(itemID, itemName, True, True, False, False, True);

          Writeln(' Finished');
          Exit;
        end;
        // ------------------------------------------------------------------ -Remove
        if (LowerCase(ParamStr(1)) = '-remove') then
        begin

          if ParamCount <> 2 then
            raise Exception.Create('remove: Invalid arguments');

          itemID := CleanInt(ParamStr(2));
          if Length(itemID) < 6 then
            raise Exception.Create('remove: Invalid ID');

          Writeln(' Starting...');
          Writeln(' Item ID: ' + itemID);
          kfItems.LoadItems;
          for i := 0 to High(kfItems.Items) do begin
            if kfItems.Items[i].ID = itemID then begin
              itemName := kfItems.Items[i].FileName;
              Writeln(' Item Name: ' + itemName);
              if kfItems.Items[i].IsMod then
              kfItems.RemoveItem(itemName, itemID, False, False, True, True) else
              kfItems.RemoveItem(itemName, itemID, True, True, True, True);
              Exit;
            end;

          end;


          Writeln(' Finished');
          Exit;
        end;
        // ------------------------------------------------------------------ -list
        if (LowerCase(ParamStr(1)) = '-list') then
        begin

          if ParamCount <> 1 then
            raise Exception.Create('addmod: Invalid arguments');
          kfItems.LoadItems;
          Writeln(
            '----------------------------------------------------------------------------');
          Writeln(
            '   NAME                     /    ID     / SUBS. / M.ENTRY / M.CYCLE / CACHE');
          Writeln(
            '----------------------------------------------------------------------------');
          for i := 0 to High(kfItems.Items) do
          begin
            with kfItems.Items[i] do
            begin
              Writeln(TextForXchar(FileName, 26) + ' ' + TextForXchar(ID,
                  12) + TextForXchar(BoolToWord(ServerSubscribe),
                  8) + TextForXchar(BoolToWord(MapEntry), 8) + TextForXchar
                  (BoolToWord(MapCycleEntry), 9) + TextForXchar
                  (BoolToWord(ServerCache), 8));

            end;
          end;

          Writeln(
            '----------------------------------------------------------------------------');
          Exit;
        end;
        // ------------------------------------------------------------------ -listdetalied

        if (LowerCase(ParamStr(1)) = '-listdetalied') then
        begin

          kfItems.LoadItems;

          for i := 0 to High(kfItems.Items) do
          begin

            with kfItems.Items[i] do
            begin

              if IsMod then
              begin
                Writeln('');
                Writeln('Name:            ' + FileName);
                Writeln('ID:              ' + ID);
                Writeln('Subscribed:      ' + BoolToWord(ServerSubscribe));
                Writeln('In Server cache: ' + BoolToWord(ServerCache));

              end
              else
              begin
                Writeln('');
                Writeln('Name:            ' + FileName);
                Writeln('ID:              ' + ID);
                Writeln('Subscribed:      ' + BoolToWord(ServerSubscribe));
                Writeln('In Map Entry:    ' + BoolToWord(MapEntry));
                Writeln('In Map Cycle:    ' + BoolToWord(MapCycleEntry));
                Writeln('In Server cache: ' + BoolToWord(ServerCache));

              end;

            end;
          end;

          Exit;
        end;

        Readln(serverPath);
      finally
        kfItems.Free;
      end;

    end;

    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln('Error: ' + E.Message);
  end;

end.
