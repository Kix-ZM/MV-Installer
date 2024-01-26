#define SplS "0500"
#define SplR "3000"
#define SplE "1500"

#define AW = (Defined UNICODE) ? "W" : "A"
#define SetupSkinPath "{localappdata}\SetupSkin"

[Setup]
AppId={{9C72B5EE-6B23-41A5-9CA6-0264207864B3}
AppName=FTL: Multiverse
AppVersion=v5.4.1
AppPublisher=subsetgames.com/forum/viewtopic.php?f=11&t=35332&sid=edd22b7904dc8aa08f086f9a194d1de7
AppCopyright=subsetgames.com/forum/viewtopic.php?f=11&t=35332&sid=edd22b7904dc8aa08f086f9a194d1de7
AppPublisherURL=https://subsetgames.com/forum/viewtopic.php?f=11&t=35332&sid=edd22b7904dc8aa08f086f9a194d1de7
AppSupportURL=https://discord.gg/ftlmultiverse
AppUpdatesURL=https://discord.gg/ftlmultiverse
DefaultDirName={code:GetDefaultDir}
DefaultGroupName=Multiverse
OutputBaseFilename=Multiverse 5.4.1
SetupIconFile=icon.ico
Compression=lzma2/ultra64
SolidCompression=yes
DirExistsWarning=no
WizardImageFile=image.bmp
AllowNoIcons=yes
Uninstallable=yes
CreateUninstallRegKey=no
UpdateUninstallLogAppName=no
DisableWelcomePage=no
AppendDefaultDirName=False
WizardSmallImageFile=SmallImage.bmp

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Types]
Name: "compact"; Description: "Standard Installation"
Name: "custom"; Description: "Custom Installation"; Flags: iscustom 

[Components] 
Name: "MultiverseCore"; Description: "Core Mod"; Types: compact custom; Flags: fixed

Name: "MultiverseCore\TRC"; Description: "The Renegade Collection"; Types: custom
Name: "MultiverseCore\SlockFlag"; Description: "Slocknog's Flagship"; Types: custom
Name: "MultiverseCore\VanillaUI"; Description: "Restore Vanilla UI"; Types: custom

Name: "MultiverseThr"; Description: "3rd Party Addons"; Types: custom
Name: "MultiverseThr\GenGibs"; Description: "Generated Gibs"; Types: custom

Name: "Hyperspace"; Description: "Hyperspace API"; Types: compact custom; Flags: fixed
Name: "Hyperspace\Lua"; Description: "LUA API"; Types: compact custom; Flags: fixed

[Files]
Source: "Files\Modman\modman.cfg";  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs;
Source: "Files\Modman\modman.exe";  DestDir: "{app}";
Source: "Files\Modman\modman.jar";  DestDir: "{app}"; 
Source: "Files\Modman\modman_admin.exe";  DestDir: "{app}";
Source: "Files\Modman\modman_debug.bat";  DestDir: "{app}";
Source: "Files\Modman\mods\modorder.txt"; DestDir: "{app}\mods";
Source: "Files\Modman\modman_readme\license.txt"; DestDir: "{app}\modman_readme";
Source: "Files\Modman\modman_readme\readme_changelog.txt"; DestDir: "{app}\modman_readme";
Source: "Files\Modman\modman_readme\readme_for_windows.txt"; DestDir: "{app}\modman_readme";
Source: "Files\Modman\modman_readme\readme_modders.txt"; DestDir: "{app}\modman_readme";
Source: "Files\Modman\backup\backup.txt"; DestDir: "{app}\backup";

Source: "Files\Modman\mods\MV Read Me.zip"; DestDir: "{app}\mods"; Components: MultiverseCore
Source: "Files\Modman\mods\Multiverse 5.4 - Assets (Patch above Data).zip"; DestDir: "{app}\mods"; Components: MultiverseCore
Source: "Files\Modman\mods\Multiverse 5.4.1 - Data.zip"; DestDir: "{app}\mods"; Components: MultiverseCore
Source: "Files\Modman\mods\Multiverse - TRC 2.3.zip"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: MultiverseCore\TRC
Source: "Files\Modman\mods\Multiverse - VanUI 2.0.zip"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: MultiverseCore\VanillaUI
Source: "Files\Modman\mods\Multiverse - SlockFlag.zip"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: MultiverseCore\SlockFlag

Source: "Files\Modman\mods\MVAdn - GenGibs v1.3.5.zip"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: MultiverseThr\GenGibs
Source: "Files\Modman\mods\MVAdn - GenGibs TRC v1.3.5.zip"; DestDir: "{app}\mods"; Flags: ignoreversion; Components: MultiverseThr\GenGibs

Source: "Files\FTL downgrade\*"; DestDir: "{app}\"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: Hyperspace
Source: "Files\Hyperspace.dll"; DestDir: "{app}\"; Flags: ignoreversion; Components: Hyperspace
Source: "Files\xinput1_4.dll"; DestDir: "{app}\"; Flags: ignoreversion; Components: Hyperspace
Source: "Files\lua-5.3.dll"; DestDir: "{app}\"; Flags: ignoreversion; Components: Hyperspace\Lua

Source: "descctrl.dll"; Flags: dontcopy
Source: "isgsg.dll"; Flags: dontcopy;
Source: "splash.png"; Flags: dontcopy;
Source: "bass.dll"; Flags: dontcopy noencryption nocompression 
Source: ISSkinU.dll; DestDir: {#SetupSkinPath}; Flags: uninsneveruninstall
Source: skin.cjstyles; DestDir: {#SetupSkinPath}; Flags: uninsneveruninstall
Source: SmallImage.bmp; Flags: dontcopy nocompression; 

[Icons]
Name: "{group}\FTL Multiverse"; Filename: "{app}\FTLGame.exe"; WorkingDir: "{app}"
Name: "{group}\Uninstall FTL Multiverse"; Filename: "{uninstallexe}";
Name: "{commondesktop}\FTL Multiverse"; Filename: "{app}\FTLGame.exe"; Tasks: desktopicon           
        
[Run]
Filename: {app}\downgrade.bat; Description: Run Application; StatusMsg: "Downgrading to FTL 1.6.9..."; Flags: runhidden 
Filename: "{app}\modman.exe"; Parameters: {code:GetModmanParameters}; WorkingDir: "{app}"; StatusMsg: "Installing selected mods..."; Flags: runhidden 
Filename: "{app}\FTLGame.exe"; Description: "{cm:LaunchProgram,Multiverse}"; Flags: nowait postinstall skipifsilent runascurrentuser

[UninstallRun]
Filename: "{app}\modman.exe"; Parameters: "--patch ~none~"; StatusMsg: "Uninstalling Multiverse..."; Flags: runhidden 

[UninstallDelete]
Type: files; Name: "{app}\backup\cached_metadata.json"
Type: files; Name: "{app}\backup\data.dat.bak"
Type: files; Name: "{app}\backup\resource.dat.bak"
Type: files; Name: "{app}\modman-log.txt"
Type: dirifempty; Name: "{app}\backup"
Type: dirifempty; Name: "{app}\mods"

[Code]
//Parameters for launching modman.exe
function GetModmanParameters(def: string): string;
var
  Version: string;
  Path: string;
  Lines: TArrayOfString;
  S: String;
  I : Integer;
begin

	//change versions in files and fill modorder.txt in the same way as the list below
    Result := '--patch';

  if IsComponentSelected('MultiverseCore') then
    Result := Result + ' "MV Read Me.zip"' + ' "Multiverse 5.4 - Assets (Patch above Data).zip"' + ' "Multiverse 5.4.1 - Data.zip"'; ; 

  if IsComponentSelected('MultiverseCore\TRC') then
    Result := Result + ' "Multiverse - TRC 2.3.zip"';
	
  if IsComponentSelected('MultiverseCore\SlockFlag') then
    Result := Result + ' "Multiverse - SlockFlag.zip"';
	
  if IsComponentSelected('MultiverseCore\VanillaUI') then
    Result := Result + ' "Multiverse - VanUI 2.0.zip"';
	
  if IsComponentSelected('MultiverseThr\GenGibs') then
    Result := Result + ' "MVAdn - GenGibs v1.3.5.zip"';

  if IsComponentSelected('MultiverseThr\GenGibs') then
    Result := Result + ' "MVAdn - GenGibs TRC v1.3.5.zip"';
end;




function IsJREInstalled: Boolean;
var
  JREVersion: string;
begin
  Result := RegQueryStringValue(HKLM32, 'Software\JavaSoft\Java Runtime Environment', 'CurrentVersion', JREVersion);
  if not Result and IsWin64 then
    Result := RegQueryStringValue(HKLM64, 'Software\JavaSoft\Java Runtime Environment', 'CurrentVersion', JREVersion);
  if Result then
    Result := CompareStr(JREVersion, '1.6') >= 0;
end;

//Music - DISABLED
const 
  BASS_SAMPLE_LOOP = 4;
var 
  mp3Handle: HWND; 
  mp3Name: String;
function BASS_Init(device: Integer; freq, flags: DWORD; win: hwnd; CLSID: Integer): Boolean; external 'BASS_Init@files:BASS.dll stdcall delayload'; 
function BASS_StreamCreateFile(mem: BOOL; f: PAnsiChar; offset1: DWORD; offset2: DWORD; length1: DWORD; length2: DWORD; flags: DWORD): DWORD; external 'BASS_StreamCreateFile@files:BASS.dll stdcall delayload'; 
function BASS_Start: Boolean; external 'BASS_Start@files:BASS.dll stdcall delayload'; 
function BASS_ChannelPlay(handle: DWORD; restart: BOOL): Boolean; external 'BASS_ChannelPlay@files:BASS.dll stdcall delayload'; 
function BASS_Stop: Boolean; external 'BASS_Stop@files:BASS.dll stdcall delayload'; 
function BASS_Free: Boolean; external 'BASS_Free@files:BASS.dll stdcall delayload'; 

function enabledesc(ComponentsListHandle: HWND; DescLabelHandle: HWND; DescStrings: PAnsiChar): BOOL; external 'enabledesc@files:descctrl.dll stdcall';

function disabledesc(): BOOL; external 'disabledesc@files:descctrl.dll stdcall';

//Skin
procedure SetupLoadSkin(lpszPath: string; lpszIniFileName: string);external 'LoadSkin@files:ISSkinU.dll stdcall';
procedure SetupUnloadSkin;external 'UnloadSkin@files:ISSkinU.dll stdcall';
procedure UninstLoadSkin(lpszPath: string; lpszIniFileName: string);external 'LoadSkin@{#SetupSkinPath}\ISSkinU.dll stdcall uninstallonly';
procedure UninstUnloadSkin;external 'UnloadSkin@{#SetupSkinPath}\ISSkinU.dll stdcall uninstallonly';
function ShowWindow(hWnd: HWND; nCmdShow: Integer): BOOL;external 'ShowWindow@user32.dll stdcall';

procedure DeinitializeSetup();
begin
  disabledesc();
  //Skin
  ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), SW_HIDE);
  SetupUnloadSkin;
end;

function InitializeSetup(): Boolean;
var
  ErrorCode: Integer;
  MBResult: integer;
begin

  //Skin
  ExtractTemporaryFile('skin.cjstyles');
  SetupLoadSkin(ExpandConstant('{tmp}\skin.cjstyles'), '');

  //Music - DISABLED!
  ExtractTemporaryFile('BASS.dll'); 
  BASS_Init(-1, 44100, 0, 0, 0); 
  mp3Handle := BASS_StreamCreateFile(FALSE, PAnsiChar(mp3Name), 0, 0, 0, 0, BASS_SAMPLE_LOOP); 
  BASS_Start(); 
  BASS_ChannelPlay(mp3Handle, False); 


  Result := True;

  if not IsJREInstalled then begin
    if MsgBox('Java version 1.6 or higher is required to install the mod. Go to download page?', mbConfirmation, MB_YESNO) = IDYES then begin
      ShellExec('open', 'https://www.java.com/en/download/', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
    end;
    while true do begin
      MBResult := MsgBox('After installing Java, click "Retry" to continue installing the mod.', mbConfirmation, MB_ABORTRETRYIGNORE or MB_DEFBUTTON2);
      if MBResult = IDAbort then begin
        Result := false;
        MsgBox('The installation was interrupted by the user.', mbConfirmation, MB_OK);
        exit;
      end;
      if (MBResult = IDIgnore) and (MsgBox('Mod Installation will not work without Java. are you sure you want to skip installation and continue regardless?', mbError, MB_YESNO or MB_DEFBUTTON2) = idYes) then break;
      if IsJREInstalled then exit;
    end;
  end;
end;

function InitializeUninstall: Boolean;
begin  
  UninstLoadSkin(ExpandConstant('{#SetupSkinPath}\skin.cjstyles'),''); 
    Result := True; 
end;

procedure DeinitializeUninstall;
begin
  UninstUnloadSkin;
  UnloadDLL(ExpandConstant('{#SetupSkinPath}\ISSkinU.dll'));
  DeleteFile(ExpandConstant('{#SetupSkinPath}\ISSkinU.dll'));
  DeleteFile(ExpandConstant('{#SetupSkinPath}\skin.cjstyles'));
  RemoveDir(ExpandConstant('{#SetupSkinPath}'));
end;


procedure ShowSplashScreen(p1:HWND;p2:ansistring;p3,p4,p5,p6,p7:integer;p8:boolean;p9:Cardinal;p10:integer); external 'ShowSplashScreen@files:isgsg.dll stdcall delayload';
procedure RunSplash();
begin
 ExtractTemporaryFile('splash.png');
 ShowSplashScreen(WizardForm.Handle,ExpandConstant('{tmp}')+'\splash.png',{#SplS},{#SplR},{#SplE},0,255,False,$FFFFFF,10);
end;


function TryPath(path: string): boolean;
begin
  Result := FileExists(Path + '\FTLGame.exe') and FileExists(Path + '\Bass.dll');
end;


function GetPathFromRegistry(const SubKeyName, ValueName: String; var ResultStr: String): Boolean;
begin
  Result := RegQueryStringValue(HKLM32, SubKeyName, ValueName, ResultStr);
  if Result then exit;
  Result := RegQueryStringValue(HKCU32, SubKeyName, ValueName, ResultStr);
  if Result then exit;
  if not IsWin64 then exit;
  Result := RegQueryStringValue(HKLM64, SubKeyName, ValueName, ResultStr);
  if Result then exit;
  Result := RegQueryStringValue(HKCU64, SubKeyName, ValueName, ResultStr);
  if Result then exit;
end;


function GetDefaultDir(def: string): string;
var
  Uninstall: string;
begin
  Uninstall := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\';
  // Steam                                 
  if GetPathFromRegistry(Uninstall + 'Steam App 212680', 'InstallLocation', Result) and TryPath(Result) then exit;
  // GOG
  if GetPathFromRegistry('SOFTWARE\GOG.com\GOGFTL', 'PATH', Result) and TryPath(Result) then exit;
  // DRM-Free (HumbleBundle)
  if GetPathFromRegistry(Uninstall + '{20E23A40-38E5-4DD6-B738-BC8097AE66B6}_is1', 'InstallLocation', Result) and TryPath(Result) then exit;
  // Default
  Result := ExpandConstant('{pf}') + '\FTL';
end;

  



procedure BeforeInstallExe;
var Path: string;
begin
  Path := ExpandConstant('{app}');
 
    FileCopy(Path + '\FTLGame.exe', Path + '\FTLGame.exe.bak', true);
end;
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  OldFile: string;
begin
  case CurUninstallStep of    
    usPostUninstall:
      begin
        OldFile := ExpandConstant('{app}\FTLGame.exe.bak');
        if FileExists(OldFile) then
          RenameFile(OldFile, ExpandConstant('{app}\FTLGame.exe'));
      end;
  end;
end;


const SmallWidth = 55;
var PageNameLabel, PageDescriptionLabel: TLabel;

Procedure NSISImageHeader;
Begin
PageNameLabel:= TLabel.Create(WizardForm);
  with PageNameLabel do
  begin
	SetBounds(WizardForm.PageNameLabel.Left, WizardForm.PageNameLabel.Top, WizardForm.PageNameLabel.Width - 32, WizardForm.PageNameLabel.Height)
    AutoSize:= False; WordWrap:= True; Transparent:= True;
    Font.Color:= clWhite;
    Font.Style:= WizardForm.PageNameLabel.Font.Style;
    Parent:= WizardForm.MainPanel;
  end;
PageDescriptionLabel:= TLabel.Create(WizardForm);
  with PageDescriptionLabel do
  begin
	SetBounds(WizardForm.PageDescriptionLabel.Left, WizardForm.PageDescriptionLabel.Top, WizardForm.PageDescriptionLabel.Width - 32, WizardForm.PageDescriptionLabel.Height)
    AutoSize:= False; WordWrap:= True; Transparent:= True;
    Font.Color:= clWhite;
    Parent:= WizardForm.MainPanel;
  end;
    WizardForm.PageNameLabel.Hide; WizardForm.PageDescriptionLabel.Hide;
	WizardForm.WizardSmallBitmapImage.Left:= WizardForm.WizardSmallBitmapImage.Left - (SmallWidth - WizardForm.WizardSmallBitmapImage.Width) + 2
	WizardForm.WizardSmallBitmapImage.Width:= SmallWidth
End;

Procedure CurPageChanged(CurPageID: Integer);
Begin
  PageNameLabel.Caption:= WizardForm.PageNameLabel.Caption;
  PageDescriptionLabel.Caption:= WizardForm.PageDescriptionLabel.Caption;
End;
       

var
  Info: TNewStaticText;
  InfoCaption: TNewStaticText;
  InfoPanel: TPanel;
  MyExit: TSetupForm; 
 
  procedure MyExitMessage(); 
var 
  OkButton, CancelButton: TButton; 
  MyIcon: String; 
begin 
  MyExit := CreateCustomForm(); 
  with MyExit do 
  begin 
    Position := poScreenCenter; 
    ClientWidth := ScaleX(400); 
    ClientHeight := ScaleY(150); 
    Caption := ExpandConstant(SetupMessage(msgExitSetupTitle)); 
 
    MyIcon := ExpandConstant(AddBackSlash('{tmp}') + 'SmallImage.bmp'); 
    if not FileExists(MyIcon) then 
      ExtractTemporaryFile(ExtractFileName(MyIcon)); 
 
    with TBitmapImage.Create(MyExit) do 
    begin 
      Left := ScaleX(20); 
      Top := ScaleY(20); 
      Width := ScaleX(55); 
      Height := ScaleY(55); 
      Bitmap.LoadFromFile(MyIcon); 
      Parent := MyExit; 
    end; 
 
    with TNewStaticText.Create(MyExit) do 
    begin 
      Left := ScaleX(95); 
      Top := ScaleY(20); 
      Width := MyExit.Width - ScaleX(115); 
      Height := MyExit.Height div 2; 
      AutoSize := False; 
      WordWrap := True; 
      Caption := ExpandConstant(SetupMessage(msgExitSetupMessage)); 
      Parent := MyExit; 
    end; 
 
    CancelButton := TButton.Create(MyExit); 
    with CancelButton do 
    begin 
      Width := WizardForm.CancelButton.Width; 
      Height := WizardForm.CancelButton.Height; 
      Left := MyExit.Width - Width - ScaleX(15); 
      Top := MyExit.Height - Height * 2 - ScaleY(15); 
      Caption := ExpandConstant(SetupMessage(msgButtonCancel)); 
      ModalResult := mrCancel; 
      Parent := MyExit; 
    end; 
 
    OkButton := TButton.Create(MyExit); 
    with OkButton do 
    begin 
      Width := CancelButton.Width; 
      Height := CancelButton.Height; 
      Left := CancelButton.Left - Width - ScaleX(5); 
      Top := CancelButton.Top; 
      Caption := ExpandConstant(SetupMessage(msgButtonOK)); 
      ModalResult := mrOk; 
      Parent := MyExit; 
    end; 
 
    ActiveControl := CancelButton; 
  end; 
end; 
 
procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean); 
begin 
  Confirm := False; 
  MyExitMessage(); 
  if MyExit.ShowModal() = mrCancel then 
    Cancel := False; 
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := true;
  if (CurPageID = wpSelectDir) and not TryPath(WizardDirValue) then begin
    Result := MsgBox('Could not find FTLGame.exe in' + WizardDirValue + 'For proper installation of Multiverse you must select the game installation folder. Do you want to continue anyways?',
    mbError, MB_YESNO or MB_DEFBUTTON2) = idYes;
    exit;
  end;
end;

procedure URLLabelOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExecAsOriginalUser('open', 'https://discord.gg/ftlmultiverse', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure InitializeWizard;
var
  URLLabel: TNewStaticText;
begin

  RunSplash();
  NSISImageHeader;

  URLLabel := TNewStaticText.Create(WizardForm);
  URLLabel.Caption := 'https://discord.gg/ftlmultiverse';
  URLLabel.Cursor := crHand;
  URLLabel.OnClick := @URLLabelOnClick;
  URLLabel.Parent := WizardForm;
  URLLabel.Font.Color := clHotLight
  URLLabel.Top := WizardForm.CancelButton.Top + (WizardForm.CancelButton.Height - URLLabel.Height) div 2;
  URLLabel.Left := WizardForm.ClientWidth - WizardForm.CancelButton.Left - WizardForm.CancelButton.Width;

  WizardForm.TYPESCOMBO.Visible:= false;
  WizardForm.ComponentsList.Height := WizardForm.ComponentsList.Height + WizardForm.ComponentsList.Top - WizardForm.TYPESCOMBO.Top;
  WizardForm.ComponentsList.Top := WizardForm.TYPESCOMBO.Top;
  WizardForm.ComponentsList.Width := ScaleX(200);

  InfoPanel := TPanel.Create(WizardForm);
  InfoPanel.Parent := WizardForm.SelectComponentsPage;
  InfoPanel.Caption := '';
  InfoPanel.Top := WizardForm.ComponentsList.Top;
  InfoPanel.Left := ScaleX(216);
  InfoPanel.Width := ScaleX(200);
  InfoPanel.Height := WizardForm.ComponentsList.Height;
  InfoPanel.BevelInner := bvRaised;
  InfoPanel.BevelOuter := bvLowered;
  InfoCaption := TNewStaticText.Create(WizardForm);
  InfoCaption.Parent := WizardForm.SelectComponentsPage;
  InfoCaption.Caption := 'Description:';
  InfoCaption.Left := ScaleX(224);
  InfoCaption.Top := InfoPanel.Top - ScaleY(5);
  Info := TNewStaticText.Create(WizardForm);
  Info.Parent := InfoPanel;
  Info.AutoSize := False;
  Info.Left := ScaleX(6);
  Info.Width := ScaleX(188);
  Info.Top := ScaleY(12);
  Info.Height := WizardForm.ComponentsList.Height - ScaleY(18);
  Info.Caption := '';
  Info.WordWrap := true;
  enabledesc(WizardForm.ComponentsList.Handle,Info.Handle,
  '[Mandatory] Contains separate core Data and Asset files for Multiverse.;'+ //CORE
  'Adds a large new arsenal of weapons to the loot pool and additional playable ships centered around them, which focus on more unique gimmicks with less attention to balance.;'+ //TRC
  'Adds a very powerful and unlockable type B to the Pleasure Flagship player ship. Originally created as a prize for the 2021 Discord Christmas contest.;'+ //SLOCKNOG'S FLAGSHIP
  'Overrides the custom Multiverse UI and restores a vanilla-esque theme. We recommend you at least try the default MV theme first.;'+ //VANUI
  'A collection of approved third party addons, not developed by the core Multiverse team.;'+ //THIRD PARTY
  'Adds programmatically generated Gibs, preventing many ship types from simply disappearing when destroyed. Note: Increases startup time by about 20% and also increases memory consumption.;'+ //GEN GIBS
  'Gengibs support for The Renegade Collection official addon.;'+ //GEN GIBS TRC
  '[Mandatory] The core Hyperspace API that enables the creation of new player ships, crew, advanced event manipulation, etc;'+ //HS
  '[Mandatory] Additional Lua API that enables Lua scripting;' //LUA
  );
  
  //Core - TRC - SlockFlag - VanUI - 3rdP - GenGibs - GG Beta - GG TRC - HS - Lua
  //'WARNING: Incompatible with the Vanilla UI patch! A unique challenge mode inspired by the 2015 GenCool mod Sensory Deprivation. Limits the information displayed in the UI and tooltips, forcing you to rely more on your knowledge of the game.;'+ //SENSORY DEPRIVATION
end;