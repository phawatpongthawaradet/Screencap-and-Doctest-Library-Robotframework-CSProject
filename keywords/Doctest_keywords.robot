*** Settings ***
Library    DocTest.PdfTest
Library    DocTest.VisualTest

*** Keywords ***
Check PDF Should Contain Strings
    [Arguments]    ${strings}    ${pdf_file}
    @{strings}=    Create List    ${strings}
    PDF Should Contain Strings    ${strings}    ${pdf_file}

Get Text Content in PDF
    [Arguments]    ${pdf_file}
    ${text}=    Get Text From Document    ${pdf_file}
    RETURN    ${text}

Compare PDF only Text
    [Arguments]    ${reference_pdf}    ${candidate_pdf}
    Compare Pdf Documents    ${reference_pdf}    ${candidate_pdf}    compare=text

Compare PDF Text and Fonts
    [Arguments]    ${reference_pdf}    ${candidate_pdf}
    Compare Pdf Documents    ${reference_pdf}    ${candidate_pdf}    compare=text,fonts

Compare two Images in PDF
    [Arguments]    ${pdf_reference_image}    ${pdf_candidate_image}
    Compare Images   ${pdf_reference_image}    ${pdf_candidate_image}  

Compare two Images and Ignore Mask
    [Arguments]    ${pdf_reference_image}    ${pdf_candidate_image}     ${mask}
    Compare Images   ${pdf_reference_image}    ${pdf_candidate_image}   mask=${mask}  

Get Unique Elements
    [Arguments]    ${pdf1_file}    ${pdf2_file}
    ${text1}=    Get Text From Document    ${pdf1_file}
    ${text2}=    Get Text From Document    ${pdf2_file}

    ${unique_elements}=    Create List
    FOR    ${element}    IN    @{text1}
        ${condition}=    Evaluate    '${element}' not in ${text2}
        IF    ${condition}
            Append To List    ${unique_elements}    ${element}
        ELSE
            Continue For Loop
        END
    END
    FOR    ${element}    IN    @{text2}
        ${condition}=    Evaluate    '${element}' not in ${text1}
        IF    ${condition}
            Append To List    ${unique_elements}    ${element}
        ELSE
            Continue For Loop
        END
    END
    RETURN    ${unique_elements}



Get Reference Template
    [Arguments]    ${pdf_file}
    ${text1}=    Get Text From Document    ${pdf_file}
    Log    ${text1}
    ${masks}=    Create List
    FOR    ${element}    IN    @{text1}
        Log    ${element}
        ${mask_element}=    Create Dictionary    page=all    type=pattern    pattern=${element}
        # Check if the element meets your condition
        IF    '${element}'.replace('-','') == ''
            Append To List    ${masks}    ${mask_element}
        END
    END
    RETURN    ${masks}



Format Unique Elements As Mask
    [Arguments]    ${unique_elements}
    ${masks}=    Create List
    FOR    ${element}    IN    @{unique_elements}
        Log    ${element}
        ${mask_element}=    Create Dictionary    page=all    type=pattern    pattern=.*${element}.*
        Append To List    ${masks}    ${mask_element}
    END
    RETURN    ${masks}

