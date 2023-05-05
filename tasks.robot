*** Settings ***
Documentation       Robot Cancelacion de deudas


Library        RPA.Windows
Library    RPA.FTP

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
    Emision de poliza    ${fecha_desde}    ${fecha_hasta}    ${seccion}   
    ...    ${entidad}    ${referencia}    ${digital}




*** Keywords ***
Emision de poliza
    [Arguments]    ${fecha_desde}    ${fecha_hasta}    ${seccion}     
    ...    ${entidad}    ${referencia}    ${digital}
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
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    si
    Send Keys    desktop    keys={Enter}
    Cargar articulos

Cargar articulos
    Click    name:Articulos
    #Datos de articulo
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    ${fecha_desde}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    ${fecha_hasta}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}    #hasta real
    Send Keys    desktop    1               #tabla
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}    #amortizacion
    Send Keys    desktop    12              #plazo
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Tab}
    #Coberturas
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    0
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    s
    Send Keys    desktop    keys={Down}
    Send Keys    desktop    keys={Down}       
    Send Keys    desktop    keys={Space}   
    Send Keys    desktop    keys={Up} 
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    0
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    s

    #Beneficiarios
    
    #Para borrar lo que contiene incicialmente beneficiarios       
    FOR    ${i}    IN RANGE    25
        Send Keys    desktop    keys={Del}
        ${i}=    Evaluate    ${i}+1
    END





