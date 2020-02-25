; example1.nsi
;
; This script is perhaps one of the simplest NSIs you can make. All of the
; optional settings are left to their default settings. The installer simply
; prompts the user asking them where to install, and drops a copy of example1.nsi
; there.

;--------------------------------

; Nombre de instalador
Name "Example1"

; fichero ejecutable
OutFile "example1.exe"

; Solicitar privilegios de aplicación para Windows Vista
RequestExecutionLevel user

; Instalar el instalador Unicode
Unicode True

; El directorio de instalación predeterminado
InstallDir $DESKTOP\Example1

;--------------------------------

;  Ventanas
Page directory
Page instfiles

;--------------------------------

; Las cosas para instalar
Section "" Página sin componentes, el nombre no es importante

  ; Establezca la ruta de salida al directorio de instalación.
  SetOutPath $INSTDIR

  ; Poner archivo allí
  File example1.nsi

SectionEnd ; Termina la sección
