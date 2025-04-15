*** Settings ***
Library     ScreenCapLibrary

*** Keywords ***
Start Video Recording for Test
    [Arguments]    ${alias}    ${name}
    Start Video Recording    alias=${alias}    name=${name}

Stop Video Recording for Test
    [Arguments]    ${alias}
    Stop Video Recording    alias=${alias}

Stop All Video Recordings for Test
    Stop All Video Recordings

Pause Video Recording for Test
    [Arguments]    ${alias}
    Pause Video Recording    alias=${alias}

Resume Video Recording for Test
    [Arguments]    ${alias}
    Resume Video Recording    alias=${alias}


