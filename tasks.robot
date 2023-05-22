*** Settings ***
Documentation       Robot Cancelacion de deudas

Variables        variables.py
Resource         keywords.robot

Library        RPA.Windows
Library        RPA.FTP
Library        RPA.FileSystem
Library        RPA.Desktop




*** Tasks ***
 
Emitir poliza
    Emision de poliza    ${fecha_desde}    ${fecha_hasta}    ${seccion}   
    ...    ${entidad}    ${referencia}    ${digital}    ${texto_poliza}




