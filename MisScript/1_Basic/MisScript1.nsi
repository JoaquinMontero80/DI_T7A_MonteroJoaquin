; Joaquin Montero. 2DAM. DI --> Basic.nsi ( MisScript1.nsi )
;NSIS Modern User Interface
;Basic Example Script
;Written by Joost Verburg

;--------------------------------
; Incluye interfaz de usuario moderna

  !include "MUI2.nsh"

;--------------------------------
;General

  ; atributo correspondiente al nombre de nuestra aplicación,
  Name "MisScript1"
  ; Fichero ejecutable
  OutFile "Instalador1.exe"
  ; Instalar el instalador Unicode
  Unicode True

  ; Direccion donde se instala por defecto
  InstallDir "$LOCALAPPDATA\Modern UI Test"

  ; Obtiene la carpeta de instalación del registro si está disponible
  InstallDirRegKey HKCU "Software\Modern UI Test" ""

  ; Solicitar privilegios de aplicación para Windows Vista
  RequestExecutionLevel user

;--------------------------------
; Configuraciones de interfaz

  !define MUI_ABORTWARNING

;--------------------------------
; Páginas

  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Lenguajes

  !insertmacro MUI_LANGUAGE "Spanish"
  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
; Secciones del instalador

Section "Dummy Section" SecDummy

  SetOutPath "$INSTDIR"

  ; Agregar sus propios archivos aquí

  ; Almacenar carpeta de instalación
  WriteRegStr HKCU "Software\Modern UI Test" "" $INSTDIR

  ; Crear desinstalador
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd ; Fin de seccion

;--------------------------------
; Descripciones

  ; Cadena de idiomas
  LangString DESC_SecDummy ${LANG_ENGLISH} "A test section."

  ; Asignar cadenas de idioma a secciones
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
; Sección de desinstalación

Section "Uninstall"

  ; Agregar propios archivos aqui

  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\Modern UI Test"

SectionEnd ; Termina seccion
