unit Main;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvComCtrls, StdCtrls,
  Menus,
  JvSpeedButton, IniFiles, KFItemEntity,
  UFuncoes, ExtCtrls, Buttons, ShellAPI, frmDnt, Workshop, Clipbrd,
  JvgImage,
  KFWksp, JvColorButton,
  JvCombobox, JvEdit, SHDocVw, IdBaseComponent,
  IdTCPConnection, IdTCPClient, IdComponent, ImgList, OleCtrls, JvExControls,
  JvColorBox, JvExStdCtrls, JvExComCtrls;

type
  TFormMain = class(TForm)
    pmRemove: TPopupMenu;
    RemoveGameSteamCache1: TMenuItem;
    RemovefromCycle1: TMenuItem;
    RemoveMapEntry1: TMenuItem;
    Removeall1: TMenuItem;
    il1: TImageList;
    RemoveServerSubcribe1: TMenuItem;
    pmLV: TPopupMenu;
    add1: TMenuItem;
    Remove1: TMenuItem;
    Browserworkshop1: TMenuItem;
    AddbyID1: TMenuItem;
    Manual1: TMenuItem;
    allfilesandentry1: TMenuItem;
    cache1: TMenuItem;
    Mapentry1: TMenuItem;
    MapCycle1: TMenuItem;
    Subcribe1: TMenuItem;
    Forceupdate1: TMenuItem;
    Reinstall1: TMenuItem;
    N1: TMenuItem;
    lbl2: TLabel;
    pnl1: TPanel;
    btnRemove: TJvSpeedButton;
    btnAddNew: TJvSpeedButton;
    lblDonate: TLabel;
    btnReinstall: TBitBtn;
    btnUpdate: TBitBtn;
    mniCopyID1: TMenuItem;
    mniShowitempage1: TMenuItem;
    mniN2: TMenuItem;
    jvpgcntrl1: TJvPageControl;
    tsMaps: TTabSheet;
    lvMaps: TListView;
    tsMods: TTabSheet;
    lvMods: TListView;
    tsServer: TTabSheet;
    grpStartServer: TGroupBox;
    pnl2: TPanel;
    lblSearch: TLabel;
    edtSearch: TEdit;
    JvgBitmapImage1: TJvgBitmapImage;
    tsExtra: TTabSheet;
    grpEnableDisable: TGroupBox;
    lblWkspDownMan: TLabel;
    tsUnknowed: TTabSheet;
    lvUnknowed: TListView;
    grpapplication: TGroupBox;
    lblFontSize: TLabel;
    trckbrFontSize: TTrackBar;
    pnl3: TPanel;
    btnNewProfile: TButton;
    btnRenameProfile: TButton;
    btnDeleteProfile: TButton;
    cbbProfile: TComboBox;
    lblProfile: TLabel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnlmap: TPanel;
    pnldifficulty: TPanel;
    cbbMap: TComboBox;
    lblMap: TLabel;
    cbbDifficulty: TComboBox;
    lblDifficulty: TLabel;
    pnlgamelenght: TPanel;
    cbbLength: TComboBox;
    lblGameLength: TLabel;
    pnl10: TPanel;
    lblAddParam: TLabel;
    edtExtra: TEdit;
    edtGmPass: TEdit;
    lblGamePass: TLabel;
    lblFontColor: TLabel;
    btnfontcolor: TJvColorButton;
    btnStartServer: TButton;
    lblDescWebAdmin: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lblDescWebPort: TLabel;
    cbWorkshopDMStatus: TJvComboBox;
    cbStatusWeb: TJvComboBox;
    edtPort: TJvEdit;
    tsNotes: TTabSheet;
    lbl1: TLabel;
    mmoNotepad: TMemo;
    grpmaintenance: TGroupBox;
    btnCheckForUpdate: TButton;
    btnCleanDownloadCache: TButton;
    btnCheckForPreview: TButton;
    lbl6: TLabel;
    lbl7: TLabel;
    btnCleanWorkshopData: TButton;
    tswebadmin: TTabSheet;
    wb1: TWebBrowser;
    tmrWebAdmin: TTimer;
    idtcpclnt1: TIdTCPClient;
    chkAutoConnectWeb: TCheckBox;
    lblAllChangesWillbe: TLabel;
    pmAdd: TPopupMenu;
    AddWorkshopMap: TMenuItem;
    AddWorkshopIDorURL: TMenuItem;
    Multipleitems1: TMenuItem;
    AddManualEntry: TMenuItem;
    lblGameMode: TLabel;
    cbbGameMode: TComboBox;
    lblLanguage: TLabel;
    cbbLanguage: TJvComboBox;
    tsDebug: TTabSheet;
    btn1: TButton;
    btn2: TButton;
    edtDebugID: TEdit;
    edtDebugItemName: TEdit;
    lbl4: TLabel;
    lbl8: TLabel;
    btn3: TButton;
    btn4: TButton;
    lbl9: TLabel;
    procedure AddWorkshopClick(Sender: TObject);
    procedure Removeall1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AddWorkshopIDorURLClick(Sender: TObject);
    procedure pmRemovePopup(Sender: TObject);
    procedure RemoveGameSteamCache1Click(Sender: TObject);
    procedure RemovefromCycle1Click(Sender: TObject);
    procedure RemoveMapEntry1Click(Sender: TObject);
    procedure RemoveServerSubcribe1Click(Sender: TObject);
    procedure btnReinstallClick(Sender: TObject);
    procedure pmLVPopup(Sender: TObject);
    procedure lvClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure lblDonateClick(Sender: TObject);
    procedure jvpgcntrl1Change(Sender: TObject);
    procedure btnStartServerClick(Sender: TObject);
    procedure lblsasdadClick(Sender: TObject);
    procedure mniShowitempage1Click(Sender: TObject);
    procedure mniCopyID1Click(Sender: TObject);
    procedure lvMapsColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure edtSearchChange(Sender: TObject);
    procedure cbbProfileChange(Sender: TObject);
    procedure btnNewProfileClick(Sender: TObject);
    procedure btnDeleteProfileClick(Sender: TObject);
    procedure btnRenameProfileClick(Sender: TObject);
    procedure cbbMapChange(Sender: TObject);
    procedure cbbDifficultyChange(Sender: TObject);
    procedure cbbLengthChange(Sender: TObject);
    procedure edtExtraChange(Sender: TObject);
    procedure edtGmPassChange(Sender: TObject);
    procedure trckbrFontSizeChange(Sender: TObject);
    procedure btnfontcolorChange(Sender: TObject);
    procedure btnCheckForUpdateClick(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure cbWorkshopDMStatusChange(Sender: TObject);
    procedure cbStatusWebChange(Sender: TObject);
    procedure edtPortExit(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btnCheckForPreviewClick(Sender: TObject);
    procedure btnCleanDownloadCacheClick(Sender: TObject);
    procedure btnCleanWorkshopDataClick(Sender: TObject);
    procedure tmrWebAdminTimer(Sender: TObject);
    procedure chkAutoConnectWebClick(Sender: TObject);
    procedure Multipleitems1Click(Sender: TObject);
    function getSelectedCount(ListView: TListView): Integer;
    procedure lvMapsCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure cbbGameModeChange(Sender: TObject);
    procedure cbbLanguageChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure lbl9Click(Sender: TObject);
  private
    function loadConfig: Boolean;
    function saveconfig: Boolean;
    procedure LoadItensToLv(Filter: String);
    procedure TranstaleToBR;
    procedure LoadServerProfile;
    procedure LoadExtraConfig;
    procedure InstallServer(Path: String);
    function CheckForServerRunningAndClose: Boolean;

  var
    ActiveLV: TListView;
    Descending: Boolean;
    SortedColumn: Integer;

  const

    memoName = 'KF2ServerTool.text';
    { Private declarations }
  public
  var
    pathKFGameIni, pathKFEngineIni, pathKFWebIni, pathAcfFile,
      pathWorkshopCacheFolder, pathSteamAppCacheFolder, pathCmdTool,
      pathAcfSubFolder, pathWorkshopSubItem, customServerPath,
      pathServerEXE: string;
    useCustomServerPath, AutoConnectWeb, appMaximized: Boolean;
    appLanguage: string;
    appWidth: Integer;
    appHeight: Integer;
    fontSize: Integer;
    defaultProfile: Integer;
    configName: String;
    { Public declarations }
    kfItems: TKFItems;
    kfprofiles: array of TKFServerProfile;
  end;

var
  FormMain: TFormMain;

implementation

uses
  Addmap, PathDialog, Queue;
{$R *.dfm}

procedure TFormMain.AddWorkshopClick(Sender: TObject);
var
  frmAdd: TFormAdd;
  frmWksp: TFormWorkshop;
  textToFind: string;
  itemID: string;
  isMod: Boolean;
  lgFindAItemWksp, lgSearchFor: string;
  mdResult: Integer;

begin
  mdResult := mrNone;
  if appLanguage = 'BR' then
  begin
    lgFindAItemWksp := 'Buscar na workshop';
    lgSearchFor := 'Buscar por';
  end
  else
  begin
    lgFindAItemWksp := 'Find an item in workshop';
    lgSearchFor := 'Search for';
  end;
  if InputQuery(lgFindAItemWksp, lgSearchFor, textToFind) then
  begin

    frmWksp := TFormWorkshop.Create(Self);
    try
      isMod := ActiveLV = lvMods;
      if isMod then
      begin

        itemID := frmWksp.BrowserItem(TWkspType.WorkshopMod, textToFind)
      end
      else
      begin
        itemID := frmWksp.BrowserItem(TWkspType.WorkshopMap, textToFind)
      end;
      if itemID <> '' then
      begin

        frmAdd := TFormAdd.Create(Self);
        try
          if isMod then
          begin
            frmAdd.SetAddType(TAddType.EditWorkshopItem);
          end
          else
          begin
            frmAdd.SetAddType(TAddType.EditWorkshopMap);
          end;
          frmAdd.edtID.Text := itemID;
          mdResult := frmAdd.ShowModal;
          if mdResult = mrOk then
          begin

            if kfItems.NewItem(frmAdd.edtID.Text, frmAdd.ItemName,
              frmAdd.addWkspRedirect, frmAdd.downloadNow, frmAdd.addMapCycle,
              frmAdd.addMapENtry) = false then
            begin
              Application.MessageBox
                (PWideChar('One o more steps for item ' + frmAdd.edtID.Text +
                    ' falied!'), '', MB_OK + MB_ICONEXCLAMATION);

            end;
          end;

        finally
          frmAdd.Free;
        end;
      end;
    finally
      frmWksp.Free;
      LoadItensToLv('');
    end;

  end;

end;

procedure TFormMain.AddWorkshopIDorURLClick(Sender: TObject);
var
  frmAdd: TFormAdd;
  inputText: String;
  itemID: string;
  lgAddWkspItem, lgWkspIdUrl, lgInvalidUrlID: string;
  mdResult: Integer;
begin
  mdResult := mrNone;

  if appLanguage = 'BR' then
  begin
    lgAddWkspItem := 'Adicionar item da Workshop';
    lgWkspIdUrl := 'ID ou URL da Workshop:';
    lgInvalidUrlID := 'ID/URL inv�lidos';
  end
  else
  begin
    lgAddWkspItem := 'Add Workshop item';
    lgWkspIdUrl := 'Workshop ID or URL:';
    lgInvalidUrlID := 'Invalid ID/URL';
  end;

  if InputQuery(lgAddWkspItem, lgWkspIdUrl, inputText) then
  begin
    if Length(inputText) <= 11 then
    begin
      itemID := cleanInt(inputText)
    end
    else
    begin
      itemID := WorkshopURLtoID(inputText);
    end;

    if Length(itemID) > 4 then
    begin

      frmAdd := TFormAdd.Create(Self);
      try
        frmAdd.edtID.Text := itemID;
        if ActiveLV = lvMaps then
        begin
          frmAdd.SetAddType(TAddType.EditWorkshopMap);
        end
        else
        begin
          frmAdd.SetAddType(TAddType.EditWorkshopItem);
        end;

        mdResult := frmAdd.ShowModal;

        if mdResult = mrOk then
        begin

          if kfItems.NewItem(frmAdd.edtID.Text, frmAdd.ItemName,
            frmAdd.addWkspRedirect, frmAdd.downloadNow, frmAdd.addMapCycle,
            frmAdd.addMapENtry) = false then
          begin
            Application.MessageBox
              (PWideChar('One o more steps for item ' + frmAdd.edtID.Text +
                  ' falied!'), '', MB_OK + MB_ICONEXCLAMATION);

          end;
        end;

      finally
        frmAdd.Free;
        LoadItensToLv('');
      end;
    end
    else
    begin

      Application.MessageBox(PWideChar(lgInvalidUrlID), 'Error',
        MB_OK + MB_ICONWARNING);

    end;

  end;

end;

procedure TFormMain.btnStartServerClick(Sender: TObject);
var
  svPath: string;
  argCmd: string;
  lgAInstaceIsRun, lgBeforeSelect: string;
begin
  if ProcessExists(ExtractFileName(pathServerEXE)) then
  begin

    if appLanguage = 'BR' then
    begin
      lgAInstaceIsRun :=
        'Um processo do servidor j� est� em execu��o' + #13#10 +
        'Deseja fechar este antes';
      lgBeforeSelect := 'Antes de iniciar o servidor selecione um mapa';
    end
    else
    begin
      lgAInstaceIsRun := 'An instace of server is already running.' + #13#10 +
        'Do you wanna kill this process before?';
      lgBeforeSelect := 'Select a map before start the server';
    end;
    case Application.MessageBox(PWideChar(lgAInstaceIsRun), 'Server',
      MB_YESNOCANCEL + MB_ICONINFORMATION) of
      IDCANCEL:
        begin
          Exit;
        end;
      IDYES:
        begin
          KillProcessByName(ExtractFileName(pathServerEXE));
          Sleep(1000);
        end;
    end;

  end
  else
  begin

  end;

  if cbbMap.Text <> '' then
  begin

    if useCustomServerPath then
    begin
      svPath := IncludeTrailingPathDelimiter(customServerPath);
    end
    else
    begin
      svPath := ExtractFilePath(Application.ExeName);
    end;
    argCmd := cbbMap.Text;
    argCmd := argCmd + '?Difficulty=' + IntToStr(cbbDifficulty.ItemIndex);
    argCmd := argCmd + '?GameLength=' + IntToStr(cbbLength.ItemIndex);
    if edtGmPass.Text <> '' then
      argCmd := argCmd + '?GamePassword=' + edtGmPass.Text;
    if edtExtra.Text <> '' then
      argCmd := argCmd + edtExtra.Text;
    case cbbGameMode.ItemIndex of
      0:
        argCmd := argCmd + '?game=KFGameContent.KFGameInfo_Survival';
      1:
        argCmd := argCmd + '?game=KFGameContent.KFGameInfo_VersusSurvival';
      2:
        argCmd := argCmd + '?game=KFGameContent.KFGameInfo_WeeklySurvival';
    end;

    // ShowMessage(argCmd);
    ShellExecute(handle, 'open', Pchar(pathServerEXE), Pchar(argCmd),
      Pchar(svPath), SW_SHOWNORMAL);

    if (chkAutoConnectWeb.Checked) and (cbStatusWeb.ItemIndex = 1) then
      tmrWebAdmin.Enabled := True;
  end
  else
  begin
    Application.MessageBox(PWideChar(lgBeforeSelect), 'Map',
      MB_OK + MB_ICONINFORMATION);

  end;

end;

procedure TFormMain.btn1Click(Sender: TObject);
begin
kfItems.AddWorkshopSubcribe(edtDebugID.Text);
end;

procedure TFormMain.btn2Click(Sender: TObject);
begin
kfItems.DownloadWorkshopItem(edtDebugID.Text);
end;

procedure TFormMain.btn3Click(Sender: TObject);
begin
kfItems.AddMapCycle(edtDebugItemName.Text);
end;

procedure TFormMain.btn4Click(Sender: TObject);
begin
kfItems.AddMapEntry(edtDebugItemName.Text);
end;

procedure TFormMain.btnCheckForPreviewClick(Sender: TObject);
var
  i: Integer;
  cmdToolFullPath, cmdToolArgs: string;
  serverpath: string;
begin
  i := Application.MessageBox(
    'This will check for a BETA PREVIEW server update.' + #13 +
      ' If it''s avaliable the server will be updated.' + #13#10 +
      'Are you sure?', 'Update server to BETA/PREVIEW',
    MB_OKCANCEL + MB_ICONQUESTION);

  if i = IDOK then
  begin
    if useCustomServerPath then
      serverpath := IncludeTrailingPathDelimiter(customServerPath)
    else
      serverpath := ExtractFilePath(Application.ExeName);

    cmdToolFullPath := serverpath + pathCmdTool;
    cmdToolArgs := '+login anonymous +force_install_dir ' + serverpath +
      ' +app_update 232130 -beta preview +exit';
    ExecuteFileAndWait(Self.handle, cmdToolFullPath, cmdToolArgs, SW_NORMAL);

    Application.MessageBox('Finished', 'Server update',
      MB_OK + MB_ICONINFORMATION);

  end;
end;

procedure TFormMain.btnCheckForUpdateClick(Sender: TObject);
var
  i: Integer;
  cmdToolFullPath, cmdToolArgs: string;
  serverpath: string;
begin
  i := Application.MessageBox('This will check for a server update.' + #13 +
      ' If it''s avaliable the server will be updated.' + #13#10 +
      'Are you sure?', 'Update server', MB_OKCANCEL + MB_ICONQUESTION);

  if i = IDOK then
  begin
    if useCustomServerPath then
      serverpath := IncludeTrailingPathDelimiter(customServerPath)
    else
      serverpath := ExtractFilePath(Application.ExeName);

    cmdToolFullPath := serverpath + pathCmdTool;
    cmdToolArgs := '+login anonymous +force_install_dir ' + serverpath +
      ' +app_update 232130 +exit';
    ExecuteFileAndWait(Self.handle, cmdToolFullPath, cmdToolArgs, SW_NORMAL);

    Application.MessageBox('Finished', 'Server update',
      MB_OK + MB_ICONINFORMATION);

  end;

end;

procedure TFormMain.btnCleanDownloadCacheClick(Sender: TObject);
var
  i: Integer;

  DeleteFolder: TStringList;
  serverpath: String;
begin
  i := Application.MessageBox
    ('This will erase all data in cache folder.' + #13#10 + 'Are you sure?',
    'Clean download cache', MB_OKCANCEL + MB_ICONEXCLAMATION);
  if i = IDOK then
  begin

    DeleteFolder := TStringList.Create;
    try
      if useCustomServerPath then
        serverpath := IncludeTrailingPathDelimiter(customServerPath)
      else
        serverpath := ExtractFilePath(Application.ExeName);
      DeleteFolder.Add(serverpath + 'KFGame\Cache\');
      ExplorerFileOp(DeleteFolder, '', FO_DELETE, True, Application.handle);
    finally
      DeleteFolder.Free;
    end;
    Application.MessageBox('Finished', 'Clear cache',
      MB_OK + MB_ICONINFORMATION);

  end;

end;

procedure TFormMain.btnCleanWorkshopDataClick(Sender: TObject);
var
  i: Integer;
  DeleteFolder: TStringList;
  wkspacf: TStringList;
  serverpath: String;
begin
  i := Application.MessageBox
    ('This will erase the workshop data base file.' + #13#10 +
      'Are you sure?', 'Clean download cache',
    MB_OKCANCEL + MB_ICONEXCLAMATION);
  if i = IDOK then
  begin
    DeleteFolder := TStringList.Create;
    wkspacf := TStringList.Create;
    try
      if useCustomServerPath then
        serverpath := IncludeTrailingPathDelimiter(customServerPath)
      else
        serverpath := ExtractFilePath(Application.ExeName);
      DeleteFolder.Add(serverpath +
          'Binaries\Win64\steamapps\workshop\content\232090');
      ExplorerFileOp(DeleteFolder, '', FO_DELETE, True, Application.handle);
      kfItems.CreateBlankACFFile;
    finally
      DeleteFolder.Free;
      wkspacf.Free;
    end;
    Application.MessageBox('Finished', 'Clear cache',
      MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TFormMain.btnDeleteProfileClick(Sender: TObject);
var
  TitleDelete, TextDelete: String;
  i: Integer;
begin
  if appLanguage = 'BR' then
  begin
    TitleDelete := 'Remover perfil';
    TextDelete := 'Voc� tem certeza que deseja remover este perfil?';
  end
  else
  begin
    TitleDelete := 'Remove profile';
    TextDelete := 'Are you sure you want to delete this profile?';
  end;

  if Application.MessageBox(Pchar(TextDelete), Pchar(TitleDelete),
    MB_OKCANCEL + MB_ICONWARNING) = IDOK then
  begin
    kfprofiles[cbbProfile.ItemIndex].Free;
    for i := cbbProfile.ItemIndex to High(kfprofiles) - 1 do
      kfprofiles[i] := kfprofiles[i + 1];
    SetLength(kfprofiles, Length(kfprofiles) - 1);
    defaultProfile := 0;
    LoadServerProfile;
  end;

end;

procedure TFormMain.InstallServer(Path: String);
var
  cmdToolFullPath, cmdToolArgs: string;
begin
  cmdToolFullPath := ExtractFilePath(Application.ExeName) + pathCmdTool;
  cmdToolArgs := '+login anonymous +force_install_dir ' + Path +
    ' +app_update 232130 +exit';
  ExecuteFileAndWait(Self.handle, cmdToolFullPath, cmdToolArgs, SW_NORMAL);
end;

procedure TFormMain.btnfontcolorChange(Sender: TObject);
begin

  Self.Font.Color := btnfontcolor.Color;
end;

procedure TFormMain.btnNewProfileClick(Sender: TObject);
var
  newItemTitle, newItemText, newItemError, newItemError1, newName: String;
  inputResult: Boolean;
begin
  if appLanguage = 'BR' then
  begin
    newItemTitle := 'Adicionar novo perfil';
    newItemText := 'Nome do perfil';
    newItemError := 'Voc� precisa informar um nome para o perfil';
    newItemError1 := 'Erro';
  end
  else
  begin
    newItemTitle := 'Add new profile';
    newItemText := 'Profile name';
    newItemError := 'You must type in a name for the profile';
    newItemError1 := 'Error';

  end;

  repeat
    inputResult := InputQuery(newItemTitle, newItemText, newName);
    if inputResult then
    begin
      if newName = '' then
      begin
        Application.MessageBox(Pchar(newItemError), Pchar(newItemError1),
          MB_OK + MB_ICONSTOP);

      end
      else
      begin
        SetLength(kfprofiles, Length(kfprofiles) + 1);
        kfprofiles[ High(kfprofiles)] := TKFServerProfile.Create;
        defaultProfile := High(kfprofiles);
        with kfprofiles[defaultProfile] do
        begin
          ProfileName := newName;
          DefaultDifficulty := 0;
          DefaultLength := 0;
          DefaultPass := '';
          AdditionalParam := '';
          DefaultMap := '';

        end;
        LoadServerProfile;

      end;

    end;

  until (newName <> '') or (inputResult = false);

end;

procedure TFormMain.btnReinstallClick(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  frmReinstall: TFormAdd;
  slItems, i: Integer;
  itemsDone: Integer;
  modalResult: Integer;
begin

  if ActiveLV.Selected = nil then
  begin
    ShowMessage('Select na item first.');
    Exit;
  end
  else
  begin
    slItems := getSelectedCount(ActiveLV);
    itemsDone := 0;
    modalResult := mrNone;
    frmReinstall := TFormAdd.Create(Self);
    try

      for i := 0 to ActiveLV.Items.Count - 1 do
      begin
        if ActiveLV.Items[i].Selected then
        begin

          try
            // For more than one item
            ItemName := ActiveLV.Items[i].Caption;
            itemID := ActiveLV.Items[i].SubItems[0];
            if ActiveLV = lvMaps then
            begin
              if (ItemName <> '') and (itemID <> '') then
                frmReinstall.SetAddType(TAddType.ReinstallWorkshopMap)
              else
                frmReinstall.SetAddType(TAddType.EditWorkshopMap);
            end
            else if ActiveLV = lvMods then
            begin
              if (ItemName <> '') and (itemID <> '') then
                frmReinstall.SetAddType(TAddType.ReinstallWorkshopItem)
              else
                frmReinstall.SetAddType(TAddType.EditWorkshopItem);
            end
            else if ActiveLV = lvUnknowed then
            begin
              frmReinstall.SetAddType(TAddType.UnknowedWorkshopItem)

            end;

            frmReinstall.edtID.Text := itemID;
            frmReinstall.ItemName := ItemName;
            frmReinstall.edtID.Enabled := false;
            frmReinstall.Browse.Visible := false;
            frmReinstall.Caption := 'Reinstall ' + ItemName;
            if slItems > 1 then
            begin
              frmReinstall.chkDoForAll.Visible := True;
              if appLanguage = 'BR' then
              begin
                frmReinstall.chkDoForAll.Caption :=
                  'Fazer isso para os pr�ximos ' + IntToStr
                  (slItems - itemsDone) + ' itens';
              end
              else
              begin
                frmReinstall.chkDoForAll.Caption :=
                  'Do the same for the next ' +
                  IntToStr(slItems - itemsDone) + ' items';
              end;

              if modalResult <> mrAll then
              begin
                modalResult := frmReinstall.ShowModal;
              end;

              if (modalResult = mrOk) or (modalResult = mrAll) then
              begin
                if kfItems.NewItem(frmReinstall.edtID.Text,
                  frmReinstall.ItemName, frmReinstall.addWkspRedirect,
                  frmReinstall.downloadNow, frmReinstall.addMapCycle,
                  frmReinstall.addMapENtry) = false then
                begin
                  Application.MessageBox
                    (PWideChar
                      ('One o more steps for item ' +
                        frmReinstall.edtID.Text + ' falied!'), '',
                    MB_OK + MB_ICONEXCLAMATION);

                end;
              end
              else
              begin
                Break;
              end;

              itemsDone := itemsDone + 1;
            end
            else
            begin
              // Just one item
              modalResult := frmReinstall.ShowModal;
              if (modalResult = mrOk) then
              begin
                if kfItems.NewItem(frmReinstall.edtID.Text,
                  frmReinstall.ItemName, frmReinstall.addWkspRedirect,
                  frmReinstall.downloadNow, frmReinstall.addMapCycle,
                  frmReinstall.addMapENtry) = false then
                begin
                  Application.MessageBox
                    (PWideChar
                      ('One o more steps for item ' +
                        frmReinstall.edtID.Text + ' falied!'), '',
                    MB_OK + MB_ICONEXCLAMATION);

                end;

              end
              else
              begin
                LoadItensToLv('');
                Exit;
              end;

            end;

          except
            on E: Exception do
              ShowMessage(E.Message);
          end;

        end;
      end;
      LoadItensToLv('');
      Application.MessageBox('Finished!', '', MB_OK + MB_ICONINFORMATION)
        finally frmReinstall.Free;
    end;

  end;
end;

procedure TFormMain.btnRenameProfileClick(Sender: TObject);
var
  renameItemTitle, renameItemText, newName, renameItemError,
    renameItemError1: String;
  inputResult: Boolean;
begin
  if appLanguage = 'BR' then
  begin
    renameItemTitle := 'Renomear perfil';
    renameItemText := 'Novo nome';
    renameItemError := 'Voc� precisa informar um novo item para o perfil';
    renameItemError1 := 'Erro';
  end
  else
  begin
    renameItemTitle := 'Rename profile';
    renameItemText := 'New name';
    renameItemError := 'You must type in a name for the profile';
    renameItemError1 := 'Error';
  end;
  repeat
    inputResult := InputQuery(renameItemTitle, renameItemText, newName);
    if inputResult then
    begin
      if newName = '' then
      begin
        Application.MessageBox(Pchar(renameItemError), Pchar(renameItemError1),
          MB_OK + MB_ICONSTOP);

      end
      else
      begin
        kfprofiles[defaultProfile].ProfileName := newName;
        LoadServerProfile;
      end;
    end;
  until (newName <> '') or (inputResult = false);

end;

procedure TFormMain.btnUpdateClick(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  slItems, i: Integer;
  dlgText: String;
begin
  if ActiveLV.Selected = nil then
  begin
    ShowMessage('Select na item first.');
    Exit;
  end
  else
  begin

    slItems := getSelectedCount(ActiveLV);

    try
      if slItems = 1 then
        dlgText := 'Force update?'
      else
        dlgText := 'Force update to ' + IntToStr(slItems) + ' selected items?';

      if messagedlg(dlgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        for i := 0 to ActiveLV.Items.Count - 1 do
        begin
          if ActiveLV.Items[i].Selected then
          begin

            ItemName := ActiveLV.Items[i].Caption;
            itemID := ActiveLV.Items[i].SubItems[0];
            kfItems.ForceUpdate(itemID, false);

          end;
        end;
        ShowMessage('Finished!');
        LoadItensToLv('');
      end;

    except
      on E: Exception do
        ShowMessage(E.Message);
    end;

  end;

end;

procedure TFormMain.cbb1Change(Sender: TObject);
begin

  // sknmngr1.SkinName := cbb1.Text;
end;

procedure TFormMain.cbbDifficultyChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].DefaultDifficulty := cbbDifficulty.ItemIndex;
end;

procedure TFormMain.cbbGameModeChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].DefaultGameMode := cbbGameMode.ItemIndex;
end;

procedure TFormMain.cbbLanguageChange(Sender: TObject);
begin
  if cbbLanguage.ItemIndex = 0 then
    appLanguage := 'EG'
  else
    appLanguage := 'BR';
  // ShowMessage('The application will be restarted');
  Application.Terminate;

  ShellExecute(Application.handle, 'Open', Pchar(Application.ExeName), nil,
    nil, SW_NORMAL);
end;

procedure TFormMain.cbbLengthChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].DefaultLength := cbbLength.ItemIndex;
end;

procedure TFormMain.cbbMapChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].DefaultMap := cbbMap.Items[cbbMap.ItemIndex];
end;

procedure TFormMain.cbbProfileChange(Sender: TObject);
begin
  // cb Server Length and Difficulty
  saveconfig();
  defaultProfile := cbbProfile.ItemIndex;
  LoadServerProfile();
  saveconfig();
end;

function TFormMain.CheckForServerRunningAndClose: Boolean;
var
  lgAInstaceIsRun: String;
begin
  Result := false;
  if ProcessExists(ExtractFileName(pathServerEXE)) then
  begin
    Result := True;
    if appLanguage = 'BR' then
    begin

      lgAInstaceIsRun :=
        'Servidor est� est� em execu��o, voc� precisa fecha-lo para poder fazer este tipo de modifica��o.'
        + #13#10 + 'Deseja fechar o server agora?';
    end
    else
    begin
      lgAInstaceIsRun :=
        'An instace of server is running, you need close it to make this kind of change.' +
        #13#10 + 'Do you wanna close the server now??';
    end;
    case Application.MessageBox(PWideChar(lgAInstaceIsRun), 'Server',
      MB_YESNOCANCEL + MB_ICONINFORMATION) of
      IDCANCEL:
        begin
          Result := True;
          Exit;
        end;
      IDYES:
        begin
          KillProcessByName(ExtractFileName(pathServerEXE));
          Sleep(1000);
          Result := false;
        end;
    end;

  end;
end;

procedure TFormMain.chkAutoConnectWebClick(Sender: TObject);
begin
  AutoConnectWeb := chkAutoConnectWeb.Checked;
end;

procedure TFormMain.cbStatusWebChange(Sender: TObject);

begin
  if CheckForServerRunningAndClose = false then
  begin
    if cbStatusWeb.ItemIndex = 0 then
      kfItems.SetWebStatus(false)
    else
      kfItems.SetWebStatus(True);

  end;
end;

procedure TFormMain.cbWorkshopDMStatusChange(Sender: TObject);
begin
  if cbWorkshopDMStatus.ItemIndex = 0 then
    kfItems.RemoveWorkshopManager
  else
    kfItems.InstallWorkshopManager;
end;

procedure TFormMain.edtExtraChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].AdditionalParam := edtExtra.Text;
end;

procedure TFormMain.edtGmPassChange(Sender: TObject);
begin
  kfprofiles[defaultProfile].DefaultPass := edtGmPass.Text;
end;

procedure TFormMain.edtPortExit(Sender: TObject);
var
  Port: Integer;
begin
  if CheckForServerRunningAndClose = false then
  begin
    try
      edtPort.Text := cleanInt(edtPort.Text);
      Port := StrToInt(edtPort.Text);

    except
      ShowMessage('Invalid port number');
      edtPort.Text := '8080';
      Exit;
    end;
    kfItems.SetWebPort(Port);

  end;
end;

procedure TFormMain.edtSearchChange(Sender: TObject);
begin
  LoadItensToLv(edtSearch.Text);
end;

procedure TFormMain.LoadItensToLv(Filter: String);
var
  i: Integer;
  Item: TListItem;
  textYes, textNo: string;
  mapCycle: TStringList;
  ItemNameF, ItemIDF: string;
begin

  kfItems.LoadItems;
  textYes := '';
  textNo := '';
  lvMaps.Items.Clear;
  lvMods.Clear;
  lvUnknowed.Items.Clear;
  for i := 0 to High(kfItems.Items) do
  begin
    Filter := UpperCase(Filter);
    ItemNameF := UpperCase(kfItems.Items[i].FileName);
    ItemIDF := UpperCase(kfItems.Items[i].ID);

    if (Filter = '') or (Pos(Filter, ItemNameF) > 0) or
      (Pos(Filter, ItemIDF) > 0) then
    begin

      if kfItems.Items[i].ItemType = KFMod then
      begin
        Item := lvMods.Items.Add;
        Item.Caption := kfItems.Items[i].FileName;
        Item.SubItems.Add(kfItems.Items[i].ID);
        Item.SubItems.Add(BoolToWord(kfItems.Items[i].ServerSubscribe));
        Item.SubItems.Add(BoolToWord(kfItems.Items[i].ServerCache));
      end
      else
      begin
        if kfItems.Items[i].ItemType = KFMap then
          Item := lvMaps.Items.Add
        else
          Item := lvUnknowed.Items.Add;
        Item.ImageIndex := 3;
        Item.Caption := kfItems.Items[i].FileName;
        Item.SubItems.Add(kfItems.Items[i].ID);

        if kfItems.Items[i].ServerSubscribe then
        begin
          Item.SubItems.Add(textYes);
          Item.SubItemImages[1] := 0
        end
        else
        begin
          Item.SubItems.Add(textNo);
          if kfItems.Items[i].ItemType = KFUnknowed then
            Item.SubItemImages[1] := 4
          else
            Item.SubItemImages[1] := 1;
        end;

        if kfItems.Items[i].MapEntry then
        begin
          Item.SubItems.Add(textYes);
          Item.SubItemImages[2] := 0
        end
        else
        begin
          Item.SubItems.Add(textNo);
          if kfItems.Items[i].ItemType = KFUnknowed then
            Item.SubItemImages[2] := 4
          else
            Item.SubItemImages[2] := 1;
        end;

        if kfItems.Items[i].MapCycleEntry then
        begin
          Item.SubItems.Add(textYes);
          Item.SubItemImages[3] := 0
        end
        else
        begin
          Item.SubItems.Add(textNo);
          if kfItems.Items[i].ItemType = KFUnknowed then
            Item.SubItemImages[3] := 4
          else
            Item.SubItemImages[3] := 1;
        end;

        if kfItems.Items[i].ServerCache then
        begin
          Item.SubItems.Add(textYes);
          Item.SubItemImages[4] := 0
        end
        else
        begin
          Item.SubItems.Add(textNo);
          if kfItems.Items[i].ItemType = KFUnknowed then
            Item.SubItemImages[4] := 4
          else
            Item.SubItemImages[4] := 1;

        end;

      end;
    end;

  end;

  if lvUnknowed.Items.Count > 0 then
    tsUnknowed.TabVisible := True
  else
    tsUnknowed.TabVisible := false;
  // Map Cycle to combo box

  cbbMap.Clear;
  mapCycle := kfItems.GetGameCycle;
  try
    for i := 0 to mapCycle.Count - 1 do
      cbbMap.Items.Add(mapCycle[i]);
  finally
    mapCycle.Free;
  end;

end;

procedure TFormMain.lvMapsColumnClick(Sender: TObject; Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> SortedColumn then
  begin
    SortedColumn := Column.Index;
    Descending := false;
  end
  else
    Descending := not Descending;
  TListView(Sender).SortType := stText;
end;

procedure TFormMain.lvMapsCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  with lvMaps.Canvas.Brush do
  begin
    if (Item.Index mod 2) = 0 then
      Color := clInactiveBorder
    else
      Color := clWhite;
  end;
end;

procedure TFormMain.lvCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else if SortedColumn <> 0 then
    Compare := CompareText(Item1.SubItems[SortedColumn - 1],
      Item2.SubItems[SortedColumn - 1]);
  if Descending then
    Compare := -Compare;
end;

procedure TFormMain.lvClick(Sender: TObject);
begin
  if ActiveLV.Selected <> nil then
  begin
    btnReinstall.Enabled := True;
    btnUpdate.Enabled := True;
    btnRemove.Enabled := True;
  end
  else
  begin
    btnReinstall.Enabled := false;
    btnUpdate.Enabled := false;
    btnRemove.Enabled := false;
  end;

end;

procedure TFormMain.mniCopyID1Click(Sender: TObject);
var
  itemsId: String;
  i: Integer;
begin
  itemsId := '';
  for i := 0 to ActiveLV.Items.Count - 1 do
  begin
    if ActiveLV.Items[i].Selected then
      itemsId := itemsId + ActiveLV.Items[i].SubItems[0] + ' ';

    Clipboard.AsText := itemsId;

  end;
end;

procedure TFormMain.mniShowitempage1Click(Sender: TObject);
var
  i: Integer;
begin
  if ActiveLV.Selected <> nil then
  begin

    for i := 0 to ActiveLV.Items.Count - 1 do
    begin
      if ActiveLV.Items[i].Selected then
        ShellExecute(0, 'open', Pchar(
            'https://steamcommunity.com/sharedfiles/filedetails/?id=' +
              ActiveLV.Items[i].SubItems[0]), nil, nil, SW_SHOWNORMAL);
    end;
  end;

end;

procedure TFormMain.Multipleitems1Click(Sender: TObject);
var
  frmQueue: TfrmQueue;
  isMod: Boolean;
begin
  frmQueue := TfrmQueue.Create(Self);
  isMod := ActiveLV = lvMods;
  try
    try
      if isMod then
      begin
        frmQueue.addType := TAddType.EditWorkshopItem;
      end
      else
      begin
        frmQueue.addType := TAddType.EditWorkshopMap;
      end;
      frmQueue.Font.Size := fontSize;
      frmQueue.ShowModal;
      LoadItensToLv('');
    finally
      frmQueue.Free;
    end;

  except
    on E: Exception do
      ShowMessage(E.Message);

  end;
end;

procedure TFormMain.pmLVPopup(Sender: TObject);
begin
  if (ActiveLV = lvMaps) or (ActiveLV = lvUnknowed) then
  begin
    Mapentry1.Visible := True;
    MapCycle1.Visible := True;

  end
  else if ActiveLV = lvMods then
  begin
    Mapentry1.Visible := false;
    MapCycle1.Visible := false;
  end;

  if ActiveLV.Selected = nil then
  begin
    add1.Enabled := True;
    add1.Visible := True;
    Browserworkshop1.Enabled := True;
    AddbyID1.Enabled := True;
    Remove1.Enabled := false;
    allfilesandentry1.Enabled := false;
    cache1.Enabled := false;
    RemoveMapEntry1.Enabled := false;
    MapCycle1.Enabled := false;
    Subcribe1.Enabled := false;
    Forceupdate1.Enabled := false;
    Reinstall1.Enabled := false;
    mniShowitempage1.Visible := false;
    mniCopyID1.Visible := false;

  end
  else
  begin
    // ShowMessage(IntToStr( ActiveLV.Selected.SubItemImages[2]));
    add1.Visible := false;
    add1.Enabled := True;
    Browserworkshop1.Enabled := True;
    AddbyID1.Enabled := True;
    Remove1.Enabled := True;
    allfilesandentry1.Enabled := True;
    cache1.Enabled := True;
    RemoveMapEntry1.Enabled := True;
    MapCycle1.Enabled := True;
    Subcribe1.Enabled := True;
    Forceupdate1.Enabled := True;
    Reinstall1.Enabled := True;
    mniShowitempage1.Visible := True;
    mniCopyID1.Visible := True;

  end;
  lvClick(Self);
end;

procedure TFormMain.pmRemovePopup(Sender: TObject);
var
  i: Integer;
begin
  if ActiveLV = lvMaps then
  begin
    if appLanguage = 'BR' then
    begin
      Removeall1.Caption := 'Remover completamente';
      RemoveGameSteamCache1.Caption := 'Remover cache do mapa';
      RemoveServerSubcribe1.Caption := 'Remover inscri��o do mapa';

    end
    else
    begin

      Removeall1.Caption := 'Remove full map';
      RemoveGameSteamCache1.Caption := 'Remove map cache';
      RemoveServerSubcribe1.Caption := 'Remove map subcribe';

    end;
    RemoveMapEntry1.Visible := True;
    RemovefromCycle1.Visible := True;
  end
  else
  begin
    if appLanguage = 'BR' then
    begin
      Removeall1.Caption := 'Remover completamente';
      RemoveGameSteamCache1.Caption := 'Remover cache do item';
      RemoveServerSubcribe1.Caption := 'Remover inscri��o do item';

    end
    else
    begin
      Removeall1.Caption := 'Remove full item';
      RemoveGameSteamCache1.Caption := 'Remove item cache';
      RemoveServerSubcribe1.Caption := 'Remove item subcribe';

    end;
    RemoveMapEntry1.Visible := false;
    RemovefromCycle1.Visible := false;
  end;

  if ActiveLV.Selected = nil then
  begin
    for i := 0 to pmRemove.Items.Count - 1 do
      pmRemove.Items[i].Enabled := false;
  end
  else
  begin
    for i := 0 to pmRemove.Items.Count - 1 do
      pmRemove.Items[i].Enabled := True;

  end;
end;

procedure TFormMain.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  try

    if NewWidth > 950 then
    begin
      pnlgamelenght.Align := alLeft;
      pnldifficulty.Align := alLeft;
    end
    else
    begin

      pnlgamelenght.Align := alRight;
      pnldifficulty.Align := alRight;
    end;
  except

  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var

  serverpath: string;
  kfPathDialog: TkfPathDialog;
  pathDialogResult: Integer;
  ExeName: String;
begin
  ExeName := ExtractFileName(Application.ExeName);
  configName := Copy(ExeName, 0, Length(ExeName) - 4) + '.ini';

  // ShowMessage(configName);


  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  tsDebug.TabVisible := True;
  {$ELSE}
  tsDebug.TabVisible := false;
  {$ENDIF}

  jvpgcntrl1.ActivePageIndex := 0;
  jvpgcntrl1Change(Self);
  SetLength(kfprofiles, 0);
  // ---- Config load
  loadConfig;
  // ---- Server check
  repeat
    if useCustomServerPath then
      serverpath := IncludeTrailingPathDelimiter(customServerPath)
    else
      serverpath := ExtractFilePath(Application.ExeName);
    // ShowMessage(serverPath);

    if FileExists(serverpath + pathServerEXE) = false then
    begin
      kfPathDialog := TkfPathDialog.Create(Self);
      try
        pathDialogResult := kfPathDialog.ShowModal;
        case pathDialogResult of
          2: // Cancel
            begin
              Application.Terminate;
              Exit;
            end;
          101: // Path set
            begin
              useCustomServerPath := True;
              serverpath := IncludeTrailingPathDelimiter(customServerPath)
            end;
          102:
            // Install Server
            begin
              useCustomServerPath := false;
              customServerPath := '';
              serverpath := ExtractFilePath(Application.ExeName);
              InstallServer(ExtractFilePath(Application.ExeName));
            end;

        end;

      finally
        kfPathDialog.Free;
      end;

    end;
  until FileExists(serverpath + pathServerEXE);

  // ---- Translation
  if appLanguage = 'BR' then
    TranstaleToBR;
  // ---- Files load

  kfItems := TKFItems.Create;
  kfItems.SetKFApplicationPath(serverpath);
  kfItems.SetkKFngineIniSubPath(pathKFEngineIni);
  kfItems.SetKFGameIniSubPath(pathKFGameIni);
  kfItems.SetKFServerPathEXE(pathServerEXE);
  kfItems.SetKFWebIniSubPath(pathKFWebIni);
  kfItems.appType := atGui;
  LoadItensToLv('');
  btnReinstall.Enabled := false;
  btnUpdate.Enabled := false;
  btnRemove.Enabled := false;
  if jvpgcntrl1.ActivePage = tsMaps then

    ActiveLV := lvMaps
  else
    ActiveLV := lvMods;

  LoadServerProfile();
  // Windows size
  Self.Width := appWidth;
  Self.Height := appHeight;
  if appMaximized then
    Self.WindowState := wsMaximized;

  // Font size
  Self.Font.Size := fontSize;
  trckbrFontSize.Position := fontSize;
  // Workshop redirect installed

  if kfItems.IsWorkshopManagerInstalled then
    cbWorkshopDMStatus.ItemIndex := 1
  else
    cbWorkshopDMStatus.ItemIndex := 0;
  chkAutoConnectWeb.Checked := AutoConnectWeb;
  cbWorkshopDMStatus.Font.Size := fontSize;
  cbWorkshopDMStatus.Top := lblWkspDownMan.Top;
  cbWorkshopDMStatus.Left := lblWkspDownMan.Left + lblWkspDownMan.Width + 5;
  LoadExtraConfig

end;

procedure TFormMain.LoadExtraConfig;
var

  webPort: String;

begin

  // Web port
  try
    webPort := IntToStr(kfItems.GetWebPort);
  except
    on E: Exception do
    begin
      webPort := 'Error';
      ShowMessage(E.Message);
    end;
  end;
  edtPort.Text := webPort;
  // Web Status
  try
    if kfItems.GetWebStatus then
      cbStatusWeb.ItemIndex := 1
    else
      cbStatusWeb.ItemIndex := 0;
  except
    on E: Exception do
    begin
      cbStatusWeb.ItemIndex := -1;
      ShowMessage(E.Message);
    end;
  end;
  // Language
  if appLanguage = 'EG' then
    cbbLanguage.ItemIndex := 0
  else
    cbbLanguage.ItemIndex := 1;

end;

procedure TFormMain.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  try
    // cb Server Length and Difficulty
    with kfprofiles[defaultProfile] do
    begin
      DefaultDifficulty := cbbDifficulty.ItemIndex;
      DefaultLength := cbbLength.ItemIndex;
      DefaultPass := edtGmPass.Text;
      AdditionalParam := edtExtra.Text;
      DefaultMap := cbbMap.Text;
    end;
    appWidth := Self.Width;
    appHeight := Self.Height;
    appMaximized := FormMain.WindowState = wsMaximized;
    saveconfig;
    kfItems.Free;
    for i := 0 to High(kfprofiles) do
      FreeAndNil(kfprofiles[i]);
  except

  end;

end;

procedure TFormMain.LoadServerProfile();
var
  i: Integer;
begin
  if cbbMap.Items.Count > 0 then
    cbbMap.ItemIndex := 0;
  // cb Profile
  cbbProfile.Clear;
  for i := 0 to High(kfprofiles) do
    cbbProfile.Items.Add(kfprofiles[i].ProfileName);

  // cb Server Length and Difficulty
  cbbProfile.ItemIndex := defaultProfile;
  with kfprofiles[defaultProfile] do
  begin
    cbbDifficulty.ItemIndex := DefaultDifficulty;
    cbbLength.ItemIndex := DefaultLength;
    edtGmPass.Text := DefaultPass;
    edtExtra.Text := AdditionalParam;
    if cbbMap.Items.IndexOf(DefaultMap) > 0 then
      cbbMap.ItemIndex := cbbMap.Items.IndexOf(DefaultMap);
    cbbGameMode.ItemIndex := DefaultGameMode;
  end;
  if High(kfprofiles) < 1 then
    btnDeleteProfile.Enabled := false
  else
    btnDeleteProfile.Enabled := True;

end;

procedure TFormMain.jvpgcntrl1Change(Sender: TObject);
begin
  if jvpgcntrl1.ActivePage = tsMaps then
  begin
    ActiveLV := lvMaps;
    btnRemove.Visible := True;
    btnAddNew.Visible := True;
    btnReinstall.Visible := True;
    btnUpdate.Visible := True;
    lvClick(Sender);
  end;
  if jvpgcntrl1.ActivePage = tsMods then
  begin
    ActiveLV := lvMods;
    btnRemove.Visible := True;
    btnAddNew.Visible := True;
    btnReinstall.Visible := True;
    btnUpdate.Visible := True;
    lvClick(Sender);
  end;
  if jvpgcntrl1.ActivePage = tsUnknowed then
  begin
    ActiveLV := lvUnknowed;
    btnRemove.Visible := True;
    btnAddNew.Visible := false;
    btnReinstall.Visible := True;
    btnUpdate.Visible := True;
    lvClick(Sender);
  end;
  if (jvpgcntrl1.ActivePage = tsServer) or (jvpgcntrl1.ActivePage = tsExtra)
    then
  begin
    ActiveLV := nil;
    btnRemove.Visible := false;
    btnAddNew.Visible := false;
    btnReinstall.Visible := false;
    btnUpdate.Visible := false;
  end;

  if jvpgcntrl1.ActivePage = tswebadmin then
  begin
    ActiveLV := nil;
    btnRemove.Visible := false;
    btnAddNew.Visible := false;
    btnReinstall.Visible := false;
    btnUpdate.Visible := false;
    if ProcessExists(ExtractFileName(pathServerEXE)) then
    begin

      wb1.Navigate('http://127.0.0.1:' + edtPort.Text);
    end
    else
    begin
      if appLanguage = 'BR' then
        ShowMessage('O server n�o est� sendo executado.')
      else
        ShowMessage('Server is not running.');
    end;
  end;

end;

function TFormMain.getSelectedCount(ListView: TListView): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to ActiveLV.Items.Count - 1 do
    if ActiveLV.Items[i].Selected then
      Result := Result + 1;
end;

procedure TFormMain.Removeall1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  lgText1, lgText2, lgText: string;
  i: Integer;
  slCount: Integer;

begin
  slCount := getSelectedCount(ActiveLV);
  if ActiveLV.Selected = nil then
  begin
    ShowMessage('Select na item first.');
    Exit;
  end
  else
  begin
    try

      if appLanguage = 'BR' then
      begin
        if slCount = 1 then
        begin

          lgText1 :=
            'Voc� tem certeza que deseja apagar completamente o mapa? ';
          lgText2 := 'Voc� tem certeza que deseja apagar completamente o item?';

        end
        else
        begin
          lgText1 :=
            'Voc� tem certeza que deseja apagar completamente os ' + IntToStr
            (slCount) + ' mapa selecionados? ';
          lgText2 :=
            'Voc� tem certeza que deseja apagar completamente os ' + IntToStr
            (slCount) + ' itens selecionados?';

        end;
      end
      else
      begin
        if slCount = 1 then
        begin
          lgText1 := 'Are you sure you want to full delete the map? ';
          lgText2 := 'Are you sure you want to full delete the item?';
        end
        else
        begin
          lgText1 := 'Are you sure you want to full delete the ' + IntToStr
            (slCount) + ' selected maps? ';
          lgText2 := 'Are you sure you want to full delete the ' + IntToStr
            (slCount) + ' selected items?';

        end;

      end;

      if ActiveLV = lvMaps then
        lgText := lgText1;
      if ActiveLV = lvMods then
        lgText := lgText2;

      if messagedlg(lgText1, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        for i := 0 to ActiveLV.Items.Count - 1 do
        begin
          if ActiveLV.Items[i].Selected then
          begin
            ItemName := ActiveLV.Items[i].Caption;
            itemID := ActiveLV.Items[i].SubItems[0];
            if ActiveLV = lvMaps then
            begin
              kfItems.RemoveItem(ItemName, itemID, (itemID <> ''),
                (ItemName <> ''), (ItemName <> ''), (itemID <> ''));

            end
            else
            begin
              if ActiveLV = lvMods then
              begin
                kfItems.RemoveItem(ItemName, itemID, false, false, True, True);

              end
              else
              begin
                if ActiveLV = lvUnknowed then
                  kfItems.RemoveItem(ItemName, itemID, True, True, True, True);
              end;
            end;

          end;
        end;
      end;

      LoadItensToLv('');

    except
      on E: Exception do
        ShowMessage(E.Message);
    end;

  end;
end;

procedure TFormMain.RemovefromCycle1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  lgText: string;
  slCount, i: Integer;
begin
  slCount := getSelectedCount(ActiveLV);
  if ActiveLV.Selected = nil then
  begin
    ShowMessage('Select na item first.');
    Exit;
  end
  else
  begin
    try
      if appLanguage = 'BR' then
      begin
        if slCount = 1 then
          lgText := 'Remover ' + ActiveLV.Selected.Caption +
            ' do ciclo de mapas?'
        else
          lgText := 'Remover os ' + IntToStr(slCount) +
            ' mapas selecionados do ciclo de mapas?';
      end
      else
      begin
        if slCount = 1 then
          lgText := 'Remove ' + ActiveLV.Selected.Caption + ' from map cycle?'
        else
          lgText := 'Remove the ' + IntToStr(slCount) +
            ' selected maps from map cycle?';

      end;

      if messagedlg(lgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        for i := 0 to ActiveLV.Items.Count - 1 do
        begin
          if ActiveLV.Items[i].Selected then
          begin
            ItemName := ActiveLV.Items[i].Caption;
            itemID := ActiveLV.Items[i].SubItems[0];

            kfItems.RemoveItem(ItemName, itemID, false, True, false, false);

          end;
        end;

      end;
      LoadItensToLv('');
    except

    end;

  end;
end;

procedure TFormMain.RemoveGameSteamCache1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  lgText: string;
  slCount, i: Integer;
begin
  slCount := getSelectedCount(ActiveLV);
  if ActiveLV.Selected = nil then
  begin
    ShowMessage('Select na item first.');
    Exit;
  end
  else
  begin

    if appLanguage = 'BR' then
    begin
      if slCount = 1 then

        lgText := 'Apagar cache do ' + ActiveLV.Selected.Caption + '?'
      else
        lgText := 'Apagar cache dos ' + IntToStr(slCount)
          + ' itens selecionados?';
    end
    else
    begin
      if slCount = 1 then
        lgText := 'Delete cache for ' + ActiveLV.Selected.Caption + '?'
      else
        lgText := 'Delete cache for the ' + IntToStr(slCount)
          + ' selected itens?';
    end;
    try

      if messagedlg(lgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        for i := 0 to ActiveLV.Items.Count - 1 do
        begin
          if ActiveLV.Items[i].Selected then
          begin
            ItemName := ActiveLV.Items[i].Caption;
            itemID := ActiveLV.Items[i].SubItems[0];
            kfItems.RemoveItem(ItemName, itemID, false, false, false, True);
          end;
        end;
      end;
      LoadItensToLv('');
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;

  end;
end;

procedure TFormMain.RemoveMapEntry1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  lgText: string;
  slCount, i: Integer;
begin
  slCount := getSelectedCount(ActiveLV);
  if ActiveLV.Selected = nil then
  begin
    ShowMessage('Select na item first.');
    Exit;
  end
  else
  begin
    try
      if appLanguage = 'BR' then
      begin
        if slCount = 1 then
          lgText :=
            'Remover a entrada de mapa do ' +
            ActiveLV.Selected.Caption + '?'
        else
          lgText := 'Remover as entradas de mapas dos ' + IntToStr(slCount)
            + ' mapas selecionados?';
      end
      else
      begin
        if slCount = 1 then
          lgText := 'Remove the map entry of  ' + ActiveLV.Selected.Caption +
            '?'
        else
          lgText := 'Remove the map entrys from the ' + IntToStr(slCount)
            + ' selected maps?';

      end;

      if messagedlg(lgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        for i := 0 to ActiveLV.Items.Count - 1 do
        begin
          if ActiveLV.Items[i].Selected then
          begin
            ItemName := ActiveLV.Items[i].Caption;
            itemID := ActiveLV.Items[i].SubItems[0];

            kfItems.RemoveItem(ItemName, itemID, True, false, false, false);

          end;
        end;

      end;
      LoadItensToLv('');
    except

    end;

  end;
end;

procedure TFormMain.RemoveServerSubcribe1Click(Sender: TObject);
var
  ItemName: string;
  itemID: string;
  lgText: string;
  slCount, i: Integer;
begin
  slCount := getSelectedCount(ActiveLV);
  if ActiveLV.Selected = nil then
  begin
    ShowMessage('Select na item first.');
    Exit;
  end
  else
  begin
    try
      if appLanguage = 'BR' then
      begin
        if slCount = 1 then
          lgText :=
            'Remover inscri��o da workshop do ' + ActiveLV.Selected.Caption +
            '?'
        else
          lgText := 'Remover as iscri��es da workshop para os ' + IntToStr
            (slCount) + ' items selecionados?';
      end
      else
      begin
        if slCount = 1 then
          lgText :=
            'Remove workshop server subcribe for ' +
            ActiveLV.Selected.Caption + ' ?'
        else
          lgText := 'Remove the ' + IntToStr(slCount) +
            ' selected items from workshop server subscribe?';

      end;

      if messagedlg(lgText, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      begin
        for i := 0 to ActiveLV.Items.Count - 1 do
        begin
          if ActiveLV.Items[i].Selected then
          begin
            ItemName := ActiveLV.Items[i].Caption;
            itemID := ActiveLV.Items[i].SubItems[0];

            kfItems.RemoveItem(ItemName, itemID, false, false, True, false);

          end;
        end;

      end;
      LoadItensToLv('');
    except

    end;

  end;
end;

procedure TFormMain.lbl9Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar('https://github.com/darkdks/KF2ServerTool/releases'), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormMain.lblDonateClick(Sender: TObject);
var
  frmDnt: TfrmDonate;
begin
  frmDnt := TfrmDonate.Create(Self);
  try
    frmDnt.Position := poMainFormCenter;
    frmDnt.ShowModal;
  finally
    frmDnt.Free;
  end;

end;

procedure TFormMain.lblsasdadClick(Sender: TObject);
begin

  if kfItems.IsWorkshopManagerInstalled then
  begin
    // kfItems.RemoveWorkshopManager
  end
  else
  begin
    kfItems.InstallWorkshopManager;
  end;

end;

function TFormMain.loadConfig: Boolean;
var
  IniConfig: TIniFile;
  regCount, i: Integer;
  section: String;
begin
  Result := false;
  try

    IniConfig := TIniFile.Create(ExtractFilePath(Application.ExeName)
        + configName);
    try
      with IniConfig do
      begin
        // GAME
        useCustomServerPath := ReadBool('PATHS', 'UseCustomServerPath', false);
        customServerPath := ReadString('PATHS', 'CustomServerPath',
          'CHANGE_ME_FOR_CUSTOM_PATH');
        pathKFWebIni := ReadString('PATHS', 'KFWebIni',
          'KFGame\Config\KFWeb.ini');
        pathKFGameIni := ReadString('PATHS', 'KFGameIni',
          'KFGame\Config\PCServer-KFGame.ini');
        pathKFEngineIni := ReadString('PATHS', 'KFEngineIni',
          'KFGame\Config\PCServer-KFEngine.ini');
        pathAcfSubFolder := ReadString('PATHS', 'AcfSubFolder',
          'Binaries\Win64\steamapps\workshop\');
        pathAcfFile := ReadString('PATHS', ' AcfFile',
          'appworkshop_232090.acf');
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

        regCount := ReadInteger('GERAL', 'ProfileCount', 1);
        defaultProfile := ReadInteger('GERAL', 'DefaultProfileID', 0);
        for i := 0 to regCount - 1 do
        begin
          SetLength(kfprofiles, Length(kfprofiles) + 1);
          kfprofiles[ High(kfprofiles)] := TKFServerProfile.Create;
          with kfprofiles[ High(kfprofiles)] do
          begin
            section := 'SERVERPROFILE' + IntToStr(i);
            DefaultDifficulty := ReadInteger(section, 'DefaultDifficulty', 2);
            DefaultLength := ReadInteger(section, 'DefaultLength', 2);
            DefaultPass := ReadString(section, 'DefaultPass', '');
            AdditionalParam := ReadString(section, 'AdditionalParam', '');
            DefaultMap := ReadString(section, 'DefaultMap', '');
            DefaultGameMode := ReadInteger(section, 'DefaultGameMode', 0);
            ProfileName := ReadString(section, 'ProfileName', 'Default');
            AutoConnectWeb := ReadBool(section, 'AutoConnectWeb', false);
          end;
        end;

        // App
        appLanguage := ReadString('GENERAL', 'Language', 'EG');
        appHeight := ReadInteger('GENERAL', 'WindowHeight', Self.Height);
        appWidth := ReadInteger('GENERAL', 'WindowWidth', Self.Width);
        fontSize := ReadInteger('GENERAL', 'FontSize', 10);
        appMaximized := ReadBool('GENERAL', 'Maximized', false);
        if FileExists(ExtractFilePath(Application.ExeName) + memoName) then
          mmoNotepad.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)
              + memoName);
      end;
    finally
      IniConfig.Free;
    end;
  except
    ShowMessage('Falied to load config file');

  end;
end;

function TFormMain.saveconfig: Boolean;
var
  IniConfig: TIniFile;
  i: Integer;
  section: String;
begin
  Result := false;

  try

    IniConfig := TIniFile.Create(ExtractFilePath(Application.ExeName)
        + configName);
    try
      with IniConfig do
      begin
        WriteBool('PATHS', 'UseCustomServerPath', useCustomServerPath);
        WriteString('PATHS', 'CustomServerPath', customServerPath);
        WriteString('PATHS', 'KFWebIni', pathKFWebIni);
        WriteString('PATHS', 'KFGameIni', pathKFGameIni);
        WriteString('PATHS', 'KFEngineIni', pathKFEngineIni);
        WriteString('PATHS', 'AcfSubFolder', pathAcfSubFolder);
        WriteString('PATHS', ' AcfFile', pathAcfFile);
        WriteString('PATHS', 'WorkshopCacheFolder', pathWorkshopCacheFolder);
        WriteString('PATHS', 'SteamAppCacheFolder', pathSteamAppCacheFolder);
        WriteString('PATHS', 'SteamCmdTool', pathCmdTool);
        WriteString('PATHS', 'WorkshopSubItems', pathWorkshopSubItem);
        WriteString('PATHS', 'ServerEXE', pathServerEXE);
        WriteInteger('GERAL', 'ProfileCount', Length(kfprofiles));
        WriteInteger('GERAL', 'DefaultProfileID', defaultProfile);

        for i := 0 to High(kfprofiles) do
        begin
          with kfprofiles[i] do
          begin
            section := 'SERVERPROFILE' + IntToStr(i);
            WriteInteger(section, 'DefaultDifficulty', DefaultDifficulty);
            WriteInteger(section, 'DefaultLength', DefaultLength);
            WriteInteger(section, 'DefaultGameMode', DefaultGameMode);
            WriteString(section, 'DefaultPass', DefaultPass);
            WriteString(section, 'AdditionalParam', AdditionalParam);
            WriteString(section, 'DefaultMap', DefaultMap);
            WriteString(section, 'ProfileName', ProfileName);
            WriteBool(section, 'AutoConnectWeb', AutoConnectWeb);
          end;

          WriteString('GENERAL', 'Language', appLanguage);
          WriteInteger('GENERAL', 'WindowHeight', appHeight);
          WriteInteger('GENERAL', 'WindowWidth', appWidth);
          WriteInteger('GENERAL', 'FontSize', fontSize);
          WriteBool('GENERAL', 'Maximized', appMaximized);
        end;
      end;
      if mmoNotepad.Text <> '' then
      begin
        mmoNotepad.Lines.SaveToFile(ExtractFilePath(Application.ExeName)
            + memoName);
      end
      else
      begin
        if FileExists(ExtractFilePath(Application.ExeName) + memoName) then
          DeleteFile(ExtractFilePath(Application.ExeName) + memoName)
      end;

      Result := True;
    finally
      IniConfig.Free;
    end;
  except
    ShowMessage('Falied to save config. Admin rights?');
  end;

end;

procedure TFormMain.tmrWebAdminTimer(Sender: TObject);
var
  tcpResponse: TIdTCPClient;
begin
  tcpResponse := TIdTCPClient.Create(Self);
  try
    try
      tcpResponse.Host := '127.0.0.1';
      tcpResponse.Port := StrToInt(edtPort.Text);
      tcpResponse.ConnectTimeout := 200;
      tcpResponse.Connect;
      if tcpResponse.Connected then
      begin

        wb1.Navigate('http://127.0.0.1:' + edtPort.Text);
        jvpgcntrl1.ActivePage := tswebadmin;
        tmrWebAdmin.Enabled := false;
      end;

    finally
      tcpResponse.Free;
    end;
  except

  end;
end;

procedure TFormMain.TranstaleToBR();
begin
  btnRemove.Caption := 'Remover';
  btnAddNew.Caption := 'Adicionar';
  btnReinstall.Caption := 'Reinstalar';
  btnUpdate.Caption := 'Atualizar';
  lblDonate.Caption := 'Contribuir';
  with lvMaps do
  begin
    Columns.Items[0].Caption := 'Mapa';
    Columns.Items[2].Caption := 'Inscrito';
    Columns.Items[3].Caption := 'Entrada';
    Columns.Items[4].Caption := 'No ciclo';
    Columns.Items[5].Caption := 'Em cache';
  end;
  with lvMods do
  begin
    Columns.Items[0].Caption := 'Arquivo';
    Columns.Items[2].Caption := 'Inscrito';
    Columns.Items[3].Caption := 'Em cache';
  end;
  AddWorkshopMap.Caption := 'Procurar na Workshop';
  AddWorkshopIDorURL.Caption := 'ID ou URL da Workshop';
  tsMaps.Caption := 'Mapas';
  lblMap.Caption := 'Mapa';
  lblDifficulty.Caption := 'Dificuldade';
  lblGameLength.Caption := 'Dura��o';
  lblGamePass.Caption := 'Senha';
  btnStartServer.Caption := 'Iniciar servidor';
  grpEnableDisable.Caption := 'Ativar / Desativar';
  grpStartServer.Caption := 'Iniciar servidor';
  cbbDifficulty.Items[1] := 'Dif�cil';
  cbbDifficulty.Items[2] := 'Suicida';
  cbbDifficulty.Items[3] := 'Inferno na terra';
  cbbLength.Items[0] := 'Curto';
  cbbLength.Items[1] := 'M�dio';
  cbbLength.Items[2] := 'Longo';
  add1.Caption := 'Adicionar';
  Remove1.Caption := 'Remover';
  Forceupdate1.Caption := 'For�ar atualiza��o';
  Reinstall1.Caption := 'Reinstalar';
  Browserworkshop1.Caption := 'Procurar na Workshop';
  AddbyID1.Caption := 'ID ou URL da Workshop';
  allfilesandentry1.Caption := 'Completamente';
  Mapentry1.Caption := 'Entrada';
  MapCycle1.Caption := 'Do ciclo';
  Subcribe1.Caption := 'Inscri��o';
  mniShowitempage1.Caption := 'Ir na p�gina da workshop';
  mniCopyID1.Caption := 'Copiar ID';
  lblAddParam.Caption := 'Par�metros adicionais';
  lblSearch.Caption := 'Filtro';
  btnNewProfile.Caption := 'Novo';
  btnRenameProfile.Caption := 'Renomear';
  btnDeleteProfile.Caption := 'Remover';
  lblProfile.Caption := 'Perfil';
  chkAutoConnectWeb.Caption := 'Auto conectar ao WebServer';
  Multipleitems1.Caption := 'Multiplos items';
  lblDescWebPort.Caption := 'Porta do Web admin:';
  cbWorkshopDMStatus.Items[0] := 'Desativado';
  cbWorkshopDMStatus.Items[1] := 'Ativado';
  cbStatusWeb.Items[0] := 'Desativado';
  cbStatusWeb.Items[1] := 'Ativado';
  tsExtra.Caption := 'Op��es';
  btnCheckForUpdate.Caption := 'Vers�o atual';
  btnCleanDownloadCache.Caption := 'Limpar chache de download';
  btnCleanWorkshopData.Caption := 'Limpar dados da workshop';
  grpmaintenance.Caption := 'Manuten��o';
  grpapplication.Caption := 'Aplica��o';
  lblFontSize.Caption := 'Tamanho da fonte: ';
  lblFontColor.Caption := 'Cor da fonte: ';
  tsNotes.Caption := 'Notas';
  lblAllChangesWillbe.Caption :=
    'Todas altera��es ser�o salvas automaticamente';
end;

procedure TFormMain.trckbrFontSizeChange(Sender: TObject);
begin
  fontSize := trckbrFontSize.Position;
  Self.Font.Size := fontSize;
  cbWorkshopDMStatus.ParentFont := false;
  cbWorkshopDMStatus.Font.Size := fontSize;
  cbWorkshopDMStatus.Top := lblWkspDownMan.Top + Round
    (lblWkspDownMan.Height / 2) - Round(cbWorkshopDMStatus.Height / 2); ; ;
  cbWorkshopDMStatus.Left := lblWkspDownMan.Left + lblWkspDownMan.Width + 5;
  trckbrFontSize.Top := lblFontSize.Top + Round(lblFontSize.Height / 2) - Round
    (trckbrFontSize.Height / 2);

  trckbrFontSize.Left := lblFontSize.Left + lblFontSize.Width;
  btnfontcolor.Top := lblFontColor.Top + Round(lblFontColor.Height / 2) - Round
    (btnfontcolor.Height / 2); ;
  btnfontcolor.Left := lblFontColor.Left + lblFontColor.Width;

  cbStatusWeb.Top := lblDescWebAdmin.Top + Round(lblDescWebAdmin.Height / 2)
    - Round(cbStatusWeb.Height / 2);

  cbbLanguage.Top := lblLanguage.Top + Round(lblLanguage.Height / 2) - Round
    (cbbLanguage.Height / 2);
  cbbLanguage.Left := lblLanguage.Left + lblLanguage.Width + 5;

  cbStatusWeb.Left := lblDescWebAdmin.Left + lblDescWebAdmin.Width + 5;

  edtPort.Top := lblDescWebPort.Top + Round(lblDescWebPort.Height / 2) - Round
    (edtPort.Height / 2);

  edtPort.Left := lblDescWebPort.Left + lblDescWebPort.Width + 5;

end;

end.
