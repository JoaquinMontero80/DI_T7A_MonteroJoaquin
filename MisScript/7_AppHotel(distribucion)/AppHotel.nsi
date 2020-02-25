;NSIS Modern User Interface
;Start Menu Folder Selection Example Script
;Written by Joaquin Montero

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"
  ; Incluye archivo zip con LanzaAyuda ( NSIS - pluggins )
  !include "ZipDLL.nsh"


;--------------------------------
;General

  ;Name and file
  Name "AppHotel"
  OutFile "Instalador_AppHotel.exe"

  ;Default installation folder --> Cambio ruta a PROGRAMFILES
  InstallDir "$PROGRAMFILES\AppHotel"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\AppHotel" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Variables

  Var StartMenuFolder

;--------------------------------
;Interface Settings
  ; Introduzco imagen de Logo
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "C:\Users\joaquin\Desktop\Joaquin\DESARROLLADOR_MULTIPLATAFORMA\SEGUNDO\DI\DI_T7A_MonteroJoaquin\MisScript\7_AppHotel(distribucion)\logo.bmp" ; optional
  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  ; Aniado mi licencia
  !insertmacro MUI_PAGE_LICENSE "C:\Users\joaquin\Desktop\Joaquin\DESARROLLADOR_MULTIPLATAFORMA\SEGUNDO\DI\DI_T7A_MonteroJoaquin\MisScript\7_AppHotel(distribucion)\licencia.txt"
  !insertmacro MUI_PAGE_COMPONENTS

  !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder

  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU"
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\AppHotel"
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "AppHotel"

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "Spanish"

;--------------------------------
;Installer Sections

Section "Dummy Section" SecDummy

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...  --> Aniado fichero LanzaAyuda.rar
  File AppHotel.rar

  ;Store installation folder
  WriteRegStr HKCU "Software\AppHotel" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  ; Crea lanzador de manu principal
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application

    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortcut "$SMPROGRAMS\$StartMenuFolder\AppHotel.lnk" "$INSTDIR\AppHotel.jar"
    CreateShortcut "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk" "$INSTDIR\Uninstall.exe"

  !insertmacro MUI_STARTMENU_WRITE_END

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings   --> Cambio a LANG_SPANISH
  LangString DESC_SecDummy ${LANG_SPANISH} "AppHotel"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  Delete "$INSTDIR\Uninstall.exe"
  Delete "$INSTDIR\AppHotel.jar"
  Delete "$INSTDIR\README.TXT"
  Delete "$INSTDIRlib\lib\TemporizadorSalon.jar"
  Delete "$INSTDIRlib\lib\commons-collections4-4.4.jar"
  Delete "$INSTDIRlib\lib\commons-digester-2.1.jar"
  Delete "$INSTDIRlib\lib\commons-beanutils-1.7.0.jar"
  Delete "$INSTDIRlib\lib\commons-logging-api-1.0.4.jar"
  Delete "$INSTDIRlib\lib\derby.jar"
  Delete "$INSTDIRlib\lib\derbyclient.jar"
  Delete "$INSTDIRlib\lib\derbynet.jar"
  Delete "$INSTDIRlib\lib\eclipselink.jar"
  Delete "$INSTDIRlib\lib\groovy-all-2.0.1.jar"
  Delete "$INSTDIRlib\lib\hsqldb.jar"
  Delete "$INSTDIRlib\lib\itext-2.1.0.jar"
  Delete "$INSTDIRlib\lib\jasperreports-6.11.0.jar"
  Delete "$INSTDIRlib\lib\jasperreports-fonts-6.11.0.jar"
  Delete "$INSTDIRlib\lib\org.eclipse.persistence.jpa.jpql_2.5.2.v20140319-9ad6abd.jar"
  Delete "$INSTDIRlib\lib\log4j-1.2.15.jar"
  Delete "$INSTDIRlib\lib\png-encoder-1.5.jar"
  Delete "$INSTDIRlib\lib\spring-beans-3.2.18.RELEASE.jar"
  Delete "$INSTDIRlib\lib\spring-core-3.2.18.RELEASE.jar"
  Delete "$INSTDIRlib\lib\spring-expression-3.2.18.RELEASE.jar"
  Delete "$INSTDIRlib\lib\derby.jar"

  RMDir "$INSTDIR\lib"
  RMDir "$INSTDIR"

  Delete "$SMPROGRAMS\$StartMenuFolder\AppHotel.jar"
  Delete "$SMPROGRAMS\$StartMenuFolder\Uninstall.exe"
  RMDir "$SMPROGRAMS\$StartMenuFolder"

  DeleteRegKey /ifempty HKCU "Software\AppHotel"

  DeleteRegKey /ifempty HKCU "C:\Users\joaquin\Desktop\Joaquin\DESARROLLADOR_MULTIPLATAFORMA\SEGUNDO\DI\DI_T7A_MonteroJoaquin\MisScript\7_AppHotel(distribucion)\licencia.txt"

  Delete "$INSTDIR\Uninstall.exe"

  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder

SectionEnd
