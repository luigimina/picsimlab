; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "PicsimLab"
#define MyAppVersion "0.8.10_220221"
#define MyAppPublisher "lcgamboa@yahoo.com"
#define MyAppURL "https://github.com/lcgamboa/picsimlab"
#define MyAppExeName "picsimlab.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{27A02D7D-EA5E-44B6-B7E1-E68B2E827DC5}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableDirPage=no
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=Y:\projetos\picsimlab\picsimlab_win64\COPYING
OutputDir=Y:\projetos\picsimlab\
OutputBaseFilename=picsimlab_{#MyAppVersion}_win64_setup
SetupIconFile=Y:\projetos\picsimlab\picsimlab_win64\share\picsimlab.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
ChangesAssociations = yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "Y:\projetos\picsimlab\picsimlab_win64\picsimlab.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "Y:\projetos\picsimlab\picsimlab_win64\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\CuteCom"; Filename: "{app}\tools\cutecom\CuteCom.exe"
Name: "{group}\Serial Remote Tank"; Filename: "{app}\srtank.exe"
Name: "{group}\ESP8266 Modem Simulator"; Filename: "{app}\espmsim.exe"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{commondesktop}\CuteCom"; Filename: "{app}\tools\cutecom\CuteCom.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: HKCR; Subkey: ".pzw"; ValueData: "{#MyAppName}  Workspace"; Flags: uninsdeletevalue; ValueType: string;  ValueName: ""
Root: HKCR; Subkey: "{#MyAppName}  Workspace";ValueData: "{#MyAppName} Workspace";  Flags: uninsdeletekey;   ValueType: string;  ValueName: ""
Root: HKCR; Subkey: "{#MyAppName}  Workspace\DefaultIcon";ValueData: "{app}\{#MyAppExeName},1"; ValueType: string;  ValueName: ""
Root: HKCR; Subkey: "{#MyAppName}  Workspace\shell\open\command";  ValueData: """{app}\{#MyAppExeName}"" ""%1""";  ValueType: string;  ValueName: ""

Root: HKCR; Subkey: ".sterm"; ValueData: "Serial Terminal"; Flags: uninsdeletevalue; ValueType: string;  ValueName: ""
Root: HKCR; Subkey: "Serial Terminal";ValueData: "Serial Terminal";  Flags: uninsdeletekey;   ValueType: string;  ValueName: ""
Root: HKCR; Subkey: "Serial Terminal\DefaultIcon";ValueData: "{app}\tools\cutecom\CuteCom.exe,1"; ValueType: string;  ValueName: ""
Root: HKCR; Subkey: "Serial Terminal\shell\open\command";  ValueData: """{app}\tools\cutecom\CuteCom.exe"" ""%1""";  ValueType: string;  ValueName: ""
[code]
/////////////////////////////////////////////////////////////////////
function GetUninstallString(): String;
var
  sUnInstPath: String;
  sUnInstallString: String;
begin
  sUnInstPath := ExpandConstant('Software\Microsoft\Windows\CurrentVersion\Uninstall\{#emit SetupSetting("AppId")}_is1');
  sUnInstallString := '';
  if not RegQueryStringValue(HKLM, sUnInstPath, 'UninstallString', sUnInstallString) then
    RegQueryStringValue(HKCU, sUnInstPath, 'UninstallString', sUnInstallString);
  Result := sUnInstallString;
end;


/////////////////////////////////////////////////////////////////////
function IsUpgrade(): Boolean;
begin
  Result := (GetUninstallString() <> '');
end;


/////////////////////////////////////////////////////////////////////
function UnInstallOldVersion(): Integer;
var
  sUnInstallString: String;
  iResultCode: Integer;
begin
// Return Values:
// 1 - uninstall string is empty
// 2 - error executing the UnInstallString
// 3 - successfully executed the UnInstallString

  // default return value
  Result := 0;

  // get the uninstall string of the old app
  sUnInstallString := GetUninstallString();
  if sUnInstallString <> '' then begin
    sUnInstallString := RemoveQuotes(sUnInstallString);
    if Exec(sUnInstallString, '/SILENT /NORESTART /SUPPRESSMSGBOXES','', SW_HIDE, ewWaitUntilTerminated, iResultCode) then
      Result := 3
    else
      Result := 2;
  end else
    Result := 1;
end;

/////////////////////////////////////////////////////////////////////
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if (CurStep=ssInstall) then
  begin
    if (IsUpgrade()) then
    begin
      UnInstallOldVersion();
    end;
  end;
end;

