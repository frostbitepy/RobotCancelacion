*** Settings ***
Documentation       Robot Cancelacion de deudas


Library        RPA.Windows
Library        RPA.FTP
Library        RPA.FileSystem
Library        RPA.Desktop

*** Variables ***
${fecha_desde}=    05052023
${fecha_hasta}=    04052024
${seccion}=    106
${entidad}=    BANCO REGIONAL  
${moneda}=    GS
${producto}=    45
${referencia}=    000202-001     #seguros de vida br - sin solicitud
${digital}=    ${True}
${asegurado}=    00000020243-0000
${beneficiario}=    A DECLARAR.-
${texto_poliza}=    SEPARATOR=
...                \nBeneficiario: Tomador y/o Acreedor: BANCO REGIONAL SAECA
...                \n
...                \nEDADES LÍMITE
...                \nEdad máxima de ingreso: 75 años para Cobertura de Fallecimiento y 65 años para Cobertura de Incapacidad Total y Permanente.
...                \nEdad máxima de permanencia: 85 años para Cobertura de Fallecimiento y 70 años para Cobertura de Incapacidad Total y Permanente.
...                \n
...                \nTipo de Crédito: PRESTAMOS DE CONSUMO
...                \n
...                \nForman parte integrante de la presente Póliza, las siguientes Coberturas Adicionales, Anexos y Endosos: 
...                \nCoberturas: 
...                \n- Fallecimiento
...                \n- Cobertura complementaria de Incapacidad Total y Permanente



*** Tasks ***
 
Emitir poliza
    Emision de poliza    ${fecha_desde}    ${fecha_hasta}    ${seccion}   
    ...    ${entidad}    ${referencia}    ${digital}    ${texto_poliza}




*** Keywords ***
Emision de poliza
    [Arguments]    ${fecha_desde}    ${fecha_hasta}    ${seccion}     
    ...    ${entidad}    ${referencia}    ${digital}    ${texto_poliza}
    Abrir menu de emision
    Cargar nuevo  
    

Abrir menu de emision
    Send Keys    desktop    keys={Ctrl}{m}
    Send Keys    desktop    emitir polizas
    Send Keys    desktop    keys={Enter}
    Send Keys    desktop    keys={Enter}
    
Cargar nuevo    
    Send Keys    desktop    keys={n}
    Cargar datos generales
    Cargar articulos
    Cargar texto especial
    Carga terminada

Cargar datos generales
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
    RPA.Windows.Click    name:Articulos
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
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Alt}+${8}    
    #Para borrar lo que contene incicialmente beneficiarios y agregar A DECLARAR      
    Send Keys    desktop    keys={Ctrl}{a}
    Send Keys    desktop    ${beneficiario}
    #Asegurado
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    ${asegurado}
    Send Keys    desktop    keys={Enter}
    #Grabar articulos
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Tab}
    Send Keys    desktop    keys={Enter}

Cargar texto especial
    Send Keys    desktop    keys={Alt}+${4}
    #Seleccionar "Desde otra poliza"
    Send Keys    desktop    keys={Tab}    
    Send Keys    desktop    keys={Ctrl}{a}
    #${texto_poliza}=    Read File    ${CURDIR}${/}resources${/}texto_poliza.txt
    Type Text    ${texto_poliza}    
    RPA.Windows.Click    name:Grabar

Cargar cuotas    #Para polizas madre no es necesaria esta funcion
    Send Keys    desktop    keys={Alt}+${1}

Carga terminada
    Send Keys    desktop    keys={Alt}+${1}
    Send Keys    desktop    keys{Alt}+{T}



    





