*** Settings ***
Library    Browser
Library           RequestsLibrary

*** Variables ***
${url}       https://www.asr.nl
${accept_cookies}     id=onetrust-accept-btn-handler
${alle_verzekeringen}    //*[@data-uitest="icon-tile-header" and span[text()="Alle verzekeringen"]]
${zorgverzekering}   //*[@data-uitest="icon-tile-header" and span[text()="Zorgverzekering"]]
${pensioen}     //*[@data-uitest="icon-tile-header" and span[text()="Pensioen"]]
${hypotheek}      //*[@data-uitest="icon-tile-header" and span[text()="Hypotheek"]]
${levensverzekeringen}    //*[@data-uitest="icon-tile-header" and span[text()="Levensverzekeringen"]]
${beleggen}               //*[@data-uitest="icon-tile-header" and span[text()="Beleggen"]]
${uitvaartverzekering}      //*[@data-uitest="icon-tile-header" and span[text()="Uitvaartverzekering"]]
${asr_vitality}          //*[@data-uitest="icon-tile-header" and span[text()="a.s.r. Vitality"]]
${contact_endpoint}         /contact
${adviseurs_endpoint}       /adviseurs  
${overASR_endpoint}        /over-asr



*** Test Cases ***
Scenario1: Open ASR Website And Accept cookies
    Open Browser    ${url}    chromium
    Wait For Elements State   ${accept_cookies}     visible    timeout=10s
    Click    ${accept_cookies}     # Accept cookies if prompted
    Wait For Load State   domcontentloaded   timeout=10s
    Take Screenshot
    [Teardown]    Close Browser

Scenario2: Open ASR and Navigate to verzekeringen
    Open Browser    ${url}    chromium
    Wait For Elements State    ${alle_verzekeringen}    visible    timeout=10s
    Click    ${alle_verzekeringen}
    Wait For Load State   domcontentloaded   timeout=10s
    Take Screenshot
    [Teardown]    Close Browser


Scenario3: Open ASR and Navigate to zorgverzekering
    Open Browser    ${url}    chromium
    Wait For Elements State    ${zorgverzekering}    visible    timeout=10s
    Click    ${zorgverzekering}
    Wait For Load State    load    timeout=10s
    Take Screenshot
    [Teardown]    Close Browser



Scenario4: Open ASR and Navigate to pesnionen
    Open Browser    ${url}    chromium
    Wait For Elements State    ${pensioen}    visible    timeout=10s
    Click    ${pensioen}
    Wait For Load State    timeout=10s
    Take Screenshot
    [Teardown]    Close Browser


Scenario5: Open ASR and Navigate to Hypotheek
    Open Browser  ${url}    chromium
    Wait For Elements State   ${hypotheek}    visible    timeout=10s
    Click    ${hypotheek}
    Wait For Load State    timeout=10s
    Take Screenshot
    [Teardown]    Close Browser


Scenario6: Open ASR and Navigate to Levensverzekeringen
    Open Browser    ${url}    chromium
    Wait For Elements State   ${levensverzekeringen}     visible    timeout=10s
    Click    ${levensverzekeringen} 
    Wait For Load State    timeout=10s
    Take Screenshot
    [Teardown]    Close Browser

Scenario7: Open ASR and Navigate to Beleggen
    Open Browser    ${url}    chromium
    Wait For Elements State   ${beleggen}     visible    timeout=10s
    Click    ${beleggen} 
    Wait For Load State    timeout=10s
    Take Screenshot
    [Teardown]    Close Browser


Scenario8: Open ASR and Navigate to Uitvaartverzekering
    Open Browser    ${url}    chromium
    Wait For Elements State   ${uitvaartverzekering}     visible    timeout=10s
    Click    ${uitvaartverzekering}
    Wait For Load State    timeout=10s
    Take Screenshot
    [Teardown]    Close Browser


Scenario9: Open ASR and Navigate to ASR Vitality
    Open Browser    ${url}    chromium
    Wait For Elements State   ${asr_vitality}    visible    timeout=10s
    Click   ${asr_vitality}
    Wait For Load State    timeout=10s
    Take Screenshot
    [Teardown]    Close Browser


Scenario10: Open ASR and Make an API Call
    Open Browser   ${url}     chromium
    Create Session      asr_session      ${url}     verify=False
    ${response}         GET On Session   asr_session    ${contact_endpoint}
    Should Be Equal As Integers    ${response.status_code}    200
    Should Contain                 ${response.headers['Content-Type']}    text/html
    [Teardown]    Close Browser


Scenario11: Open ASR and Make an API Call Adviseurs
    Open Browser   ${url}     chromium
    Create Session      asr_session      ${url}         verify=False
    ${response}         GET On Session   asr_session    ${adviseurs_endpoint}
    Should Be Equal As Integers    ${response.status_code}    200
    Should Contain                 ${response.headers['Content-Type']}    text/html
    [Teardown]    Close Browser

Scenario12: Open ASR and Make an API Call Over ASR
    Open Browser   ${url}     chromium
    Create Session      asr_session      ${url}         verify=False
    ${response}         GET On Session   asr_session    ${overASR_endpoint} 
    Should Be Equal As Integers    ${response.status_code}    200
    Should Contain                 ${response.headers['Content-Type']}    text/html
    [Teardown]    Close Browser

