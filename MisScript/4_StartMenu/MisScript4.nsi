;NSIS Modern User Interface
;Start Menu Folder Selection Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "MisScript4"
  OutFile "Instalador4.exe"
  Unicode True

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\Desinstalador"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\MisScript4" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Variables

  Var StartMenuFolder

;--------------------------------
;Interface Settings
  ; Introduzco imagen de Logo
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "C:\Users\joaquin\Desktop\Joaquin\DESARROLLADOR MULTIPLATAFORMA\SEGUNDO\DESARROLLO DE INTERFACES\DI_T7A_MonteroJoaquin\MisScript\4_StartMenu\logo.bmp" ; optional
  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  ; Aniado mi licencia
  !insertmacro MUI_PAGE_LICENSE "C:\Users\joaquin\Desktop\Joaquin\DESARROLLADOR MULTIPLATAFORMA\SEGUNDO\DESARROLLO DE INTERFACES\DI_T7A_MonteroJoaquin\MisScript\4_StartMenu\licencia.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY

  ;Start Menu Folder Page Configuration
  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU"
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\MisScript4"
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"

  !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder

  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "Spanish"

;--------------------------------
;Installer Sections

Section "Dummy Section" SecDummy

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...

  ;Store installation folder
  WriteRegStr HKCU "Software\MisSript4" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application

    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortcut "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk" "$INSTDIR\Uninstall.exe"

  !insertmacro MUI_STARTMENU_WRITE_END

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings   --> Cambio a LANG_SPANISH
  LangString DESC_SecDummy ${LANG_SPANISH} "Seccion de prueba."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"

  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder

  Delete "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk"
  ; Esto hace que crea un acceso directo en directorio
  RMDir "$SMPROGRAMS\$StartMenuFolder"

  DeleteRegKey /ifempty HKCU "Software\MisScript4"

SectionEnd
