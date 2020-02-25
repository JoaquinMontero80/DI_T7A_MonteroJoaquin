;NSIS Modern User Interface
;Header Bitmap Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "MisScript2"
  OutFile "Instalador2.exe"

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\Modern UI Test"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\Modern UI Test" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Interface Configuration

  !define MUI_HEADERIMAGE
  ; Aqui defino ruta de imagen logo empresa
  !define MUI_HEADERIMAGE_BITMAP "C:\Users\joaquin\Desktop\Joaquin\DESARROLLADOR MULTIPLATAFORMA\SEGUNDO\DESARROLLO DE INTERFACES\DI_T7A_MonteroJoaquin\MisScript\2_HeaderBitmap\logo.bmp" ; optional
  !define MUI_ABORTWARNING

;--------------------------------
;Pages

    ; Aqui inserto mi licencia
  !insertmacro MUI_PAGE_LICENSE "C:\Users\joaquin\Desktop\Joaquin\DESARROLLADOR MULTIPLATAFORMA\SEGUNDO\DESARROLLO DE INTERFACES\DI_T7A_MonteroJoaquin\MisScript\2_HeaderBitmap\licencia.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
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
  WriteRegStr HKCU "Software\Modern UI Test" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  ; Aqui lo pongo en español
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

  DeleteRegKey /ifempty HKCU "Software\Modern UI Test"

SectionEnd
