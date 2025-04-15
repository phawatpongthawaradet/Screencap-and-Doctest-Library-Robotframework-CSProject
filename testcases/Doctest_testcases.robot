*** Settings ***
Library     Selenium2Library
Library     Collections
Resource    ../keywords/Doctest_keywords.robot



*** Variables ***
${customer1_file}    data/Customer details alice.pdf    
${customer2_file}    data/Customer details alice2.pdf
${customer3_file}    data/Customer details bob.pdf
${customer4_file}    data/Customer details bob2.pdf
${customer5_file}    data/Customer details alice copy.pdf
${customerdetails_reference}    data/Customer details reference.pdf
${seller_file}    data/Seller details.pdf
${scbicon1_file}    data/scbiconwhitebgg.pdf
${scbicon2_file}    data/scbiconpurplebgg.pdf
${scbicon3_file}    data/scbiconwhitebggcopy.pdf




*** Test Cases ***
TC x. 1 DocTest
    [Tags]    test
    Check PDF Should Contain Strings    Alice    ${customer1_file}

TC x. 2 DocTest
    [Tags]    test
    Check PDF Should Contain Strings    Alice    ${customer3_file}

TC x. 3 DocTest
    [Tags]    test
    Get Text Content in PDF    ${customer1_file}

TC x. 4 DocTest
    [Tags]    test
    Compare PDF only Text    ${customer1_file}    ${customer5_file}

TC x. 5 DocTest
    [Tags]    test
    Compare PDF only Text    ${customer1_file}    ${customer2_file}   

TC x. 6 DocTest
    [Tags]    test
    Compare PDF only Text    ${customer1_file}    ${customer3_file}

TC x. 7 DocTest
    [Tags]    test
    Compare PDF Text and Fonts    ${customer1_file}    ${customer5_file}

TC x. 8 DocTest
    [Tags]    test
    Compare PDF Text and Fonts    ${customer1_file}    ${customer2_file} 

TC x. 9 DocTest
    [Tags]    test
    Compare two Images in PDF    ${scbicon1_file}    ${scbicon3_file}

TC x. 10 DocTest
    [Tags]    test
    Compare two Images in PDF    ${scbicon1_file}    ${scbicon2_file}

TC x. 11 DocTest
    [Tags]    test
    ${ignore}=    Get Reference Template    ${customerdetails_reference}    
    Compare two Images and Ignore Mask    ${customerdetails_reference}    ${customer3_file}    ${ignore}

TC x. 12 DocTest
    [Tags]    test
    ${ignore}=    Get Reference Template    ${customerdetails_reference}    
    Compare two Images and Ignore Mask    ${customerdetails_reference}    ${seller_file}    ${ignore}

TC x. 13 DocTest
    [Tags]    test
    ${unique_elements}    Get Unique Elements    ${customer1_file}    ${customer3_file}
    Log    ${unique_elements}
