;NSIS Modern User Interface
;Welcome/Finish Page Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file --> Cambio nombre y ejecutable
  Name "MisScript5"
  OutFile "Instalador5.exe"

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\Desinstalador5"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\MisScript5" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------

;Interface Settings
!define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  ; Ruta de archivo de licencia
  !insertmacro MUI_PAGE_LICENSE "C:\Users\joaquin\Desktop\Joaquin\DESARROLLADOR_MULTIPLATAFORMA\SEGUNDO\DI\DI_T7A_MonteroJoaquin\MisScript\5_WelcomeFinish\licencia.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages
  ; Lenguaje español
  !insertmacro MUI_LANGUAGE "Spanish"

;--------------------------------
;Installer Sections

Section "Dummy Section" SecDummy

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE... --> Aniado File y archivo zip de LanzaAydua

  ;Store installation folder
  WriteRegStr HKCU "Software\MisScript5" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings --> Cambio a LANG_SPANISH
  LangString DESC_SecDummy ${LANG_SPANISH} "A test section."

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

  DeleteRegKey /ifempty HKCU "Software\MisScript5"

SectionEnd
