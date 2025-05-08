*** Settings ***
Library         SeleniumLibrary
Variables       ../locators/Common_locators.yaml
Resource        ../keywords/Screencap_keywords.robot

*** Variables ***
${browser}      Chrome
${scb_web}      https://www.scb.co.th/th/personal-banking


*** Test Cases ***
TC x. 1 ScreenCap
    [Tags]  test
    Given Open Browser    ${scb_web}    ${browser}
    Start Video Recording for Test   demotest    TCx.1ScreenCap
    And Maximize Browser Window
    Then Wait Until Element Is Enabled   ${search_textfield}
    And Input Text      ${search_textfield}     scbeasy
    Then Wait Until Element Is Enabled   ${search_button}
    And Click Element   ${search_button}
    Then Wait Until Element Is Visible    ${header_scbeasyapp}
    And Close Browser


TC x. 2 ScreenCap
    [Tags]  test
    Given Open Browser    ${scb_web}    ${browser}
    Start Video Recording   demotest    TCx.2ScreenCap
    And Maximize Browser Window
    Then Wait Until Element Is Enabled   ${search_textfield}
    And Input Text      ${search_textfield}     scbeasy
    Then Wait Until Element Is Enabled   ${search_button}
    And Click Element   ${search_button}
    Then Wait Until Element Is Visible    ${header_scbeasyapp}
    Stop Video Recording for Test   demotest
    And Close Browser


TC x. 3 ScreenCap
    [Tags]  test
    Given Open Browser    ${scb_web}    ${browser}
    Start Video Recording   demotest1    TCx.3ScreenCap
    And Maximize Browser Window
    Start Video Recording   demotest2    TCx.3ScreenCap
    Then Wait Until Element Is Enabled   ${search_textfield}
    And Input Text      ${search_textfield}     scbeasy
    Then Wait Until Element Is Enabled   ${search_button}
    And Click Element   ${search_button}
    Then Wait Until Element Is Visible    ${header_scbeasyapp}
    Stop Video Recording for Test   demotest1
    And Close Browser


TC x. 4 ScreenCap
    [Tags]  test
    Given Open Browser    ${scb_web}    ${browser}
    Start Video Recording   demotest1    TCx.4ScreenCap
    And Maximize Browser Window
    Start Video Recording   demotest2    TCx.4ScreenCap
    Then Wait Until Element Is Enabled   ${search_textfield}
    And Input Text      ${search_textfield}     scbeasy
    Then Wait Until Element Is Enabled   ${search_button}
    And Click Element   ${search_button}
    Then Wait Until Element Is Visible    ${header_scbeasyapp}
    Stop Video Recording for Test   demotest1
    Stop Video Recording for Test   demotest2
    And Close Browser
    

TC x. 5 ScreenCap
    [Tags]  test
    Given Open Browser    ${scb_web}    ${browser}
    Start Video Recording   demotest1    TCx.5ScreenCap
    And Maximize Browser Window
    Start Video Recording   demotest2    TCx.5ScreenCap
    Then Wait Until Element Is Enabled   ${search_textfield}
    And Input Text      ${search_textfield}     scbeasy
    Then Wait Until Element Is Enabled   ${search_button}
    And Click Element   ${search_button}
    Then Wait Until Element Is Visible    ${header_scbeasyapp}
    Stop All Video Recordings for Test
    And Close Browser


TC x. 6 ScreenCap
    [Tags]  test
    Given Open Browser    ${scb_web}    ${browser}
    Start Video Recording   demotest    TCx.6ScreenCap
    And Maximize Browser Window
    Then Wait Until Element Is Enabled   ${search_textfield}
    And Input Text      ${search_textfield}     scbeasy
    Pause Video Recording   demotest
    Then Wait Until Element Is Enabled   ${search_button}
    And Click Element   ${search_button}
    Then Wait Until Element Is Visible    ${header_scbeasyapp}
    And Close Browser

TC x. 7 ScreenCap
    [Tags]  test
    Given Open Browser    ${scb_web}    ${browser}
    Start Video Recording   demotest    TCx.7ScreenCap
    And Maximize Browser Window
    Then Wait Until Element Is Enabled   ${search_textfield}
    And Input Text      ${search_textfield}     scbeasy
    Pause Video Recording   demotest
    Then Wait Until Element Is Enabled   ${search_button}
    And Click Element   ${search_button}
    Then Wait Until Element Is Visible    ${header_scbeasyapp}
    Resume Video Recording  demotest
    And Close Browser


TC x. 8 ScreenCap
    [Tags]  test
    Given Open Browser    ${scb_web}    ${browser}
    Start Video Recording   demotest    TCx.8ScreenCap
    And Maximize Browser Window
    Then Wait Until Element Is Enabled   ${search_textfield}
    And Input Text      ${search_textfield}     scbeasy
    Pause Video Recording   demotest
    Then Wait Until Element Is Enabled   ${search_button}
    And Click Element   ${search_button}
    Then Wait Until Element Is Visible    ${header_scbeasyapp}
    Resume Video Recording  demotest
    Stop Video Recording for Test   demotest
    And Close Browser



