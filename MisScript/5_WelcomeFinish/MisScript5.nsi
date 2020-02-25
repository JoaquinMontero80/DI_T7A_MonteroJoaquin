;NSIS Modern User Interface
;Welcome/Finish Page Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file --> Cambio nombre y ejecutable
  Name "MisSCript5"
  OutFile "Instalador5.exe"
  Unicode True

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\Desinstalador5"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\MisScript5" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
; Creo variable para acceso directo
   Var StartMenuFolder


;Interface Settings  --> Defino imagen de logo
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "C:\Users\joaquin\Desktop\Joaquin\DESARROLLADOR MULTIPLATAFORMA\SEGUNDO\DESARROLLO DE INTERFACES\DI_T7A_MonteroJoaquin\MisScript\6_LanzaAyuda\logo.bmp" ; optional
  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  ; Ruta de archivo de licencia
  !insertmacro MUI_PAGE_LICENSE "C:\Users\joaquin\Desktop\Joaquin\DESARROLLADOR MULTIPLATAFORMA\SEGUNDO\DESARROLLO DE INTERFACES\DI_T7A_MonteroJoaquin\MisScript\6_LanzaAyuda\licencia.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  ; Introduce mopcion de crear acceso directo
  !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU"
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\LanzaAyuda"
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "LanzaAyuda"

;--------------------------------
;Languages
  ; Lenguaje español
  !insertmacro MUI_LANGUAGE "Spanish"

;--------------------------------
;Installer Sections

Section "Dummy Section" SecDummy

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE... --> Aniado File y archivo zip de LanzaAydua
  File "LanzaAyuda.zip"

  !insertmacro ZIPDLL_EXTRACT "$INSTDIR\LanzaAyuda.zip" "$INSTDIR" "<ALL>"

  Delete "$INSTDIR\LanzaAyuda.zip"

  ;Store installation folder
  WriteRegStr HKCU "Software\Modern UI Test" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  ;Crea el lazador del menu principal
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
  CreateShortcut "$SMPROGRAMS\$StartMenuFolder\LanzaAyuda.lnk" "$INSTDIR\LanzaAyuda.jar"
  CreateShortcut "$SMPROGRAMS\$StartMenuFolder\uninstall.lnk" "$INSTDIR\Uninstall.exe"

  !insertmacro MUI_STARTMENU_WRITE_END

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings --> Cambio a LANG_SPANISH
  LangString DESC_SecDummy ${LANG_SPANISH} "LanzaAyuda."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  Delete "$INSTDIR\Uninstall.exe"
  Delete "$INSTDIR\LanzaAyuda.jar"
  Delete "$INSTDIR\README.TXT"
  Delete "$INSTDIR\lib\javahelp-2.0.05.jar"
  RMDir "$INSTDIR\lib"
  RMDir "$INSTDIR"

  Delete "$SMPROGRAMS\$StartMenuFolder\LanzaAyuda.jar"
  Delete "$SMPROGRAMS\$StartMenuFolder\Uninstall.exe"
  RMDir "$SMPROGRAMS\$StartMenuFolder"

  DeleteRegKey /ifempty HKCU "Software\LanzaAyuda"

  DeleteRegKey /ifempty HKCU "C:\Users\Usuario\MiScript\LicenciaUnis.txt"

  Delete "$INSTDIR\Uninstall.exe"

  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder

SectionEnd
