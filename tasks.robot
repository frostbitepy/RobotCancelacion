*** Settings ***
Documentation       Robot Cancelacion de deudas


Library        RPA.Windows

*** Variables ***
${fecha_desde}=    05052023
${fecha_hasta}=    04052024
${seccion}=    106
${entidad}=    BANCO REGIONAL  
${moneda}=    GS
${producto}=    45
${referencia}=    000202-001     #seguros de vida br - sin solicitud
${digital}=    ${True}

*** Tasks ***
Emitir poliza
    Emision de poliza    ${fecha_desde}    ${fecha_hasta}    ${seccion}   ${entidad}    ${referencia}




*** Keywords ***
Emision de poliza
    [Arguments]    ${fecha_desde}    ${fecha_hasta}    ${seccion}     ${entidad}    ${referencia}
    Abrir menu de emision
    Cargar nuevo  
    

Abrir menu de emision
    Send Keys    desktop    keys={Ctrl}{m}
    Send Keys    desktop    emitir polizas
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    
Cargar nuevo    
    Send Keys    desktop    keys={n}
    Send Keys    desktop    ${seccion}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    ${fecha_desde}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    ${fecha_hasta}
    Send Keys    desktop    keys={Enter}
    IF    "${moneda}" == "GS"
        Send Keys    desktop    guaranies
    ELSE
        Send Keys    desktop    dolares
    END
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    ${entidad}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    ${producto}    
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    ${referencia}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    IF    ${digital} == ${True}
        Send Keys    desktop    digital
    ELSE
        Send Keys    desktop    facsimilar
    END
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
        