*** Settings ***
Library    DocTest.PdfTest
Library    DocTest.VisualTest

*** Keywords ***
Check PDF Should Contain Strings
    [Documentation]    ตรวจสอบว่า PDF ที่ระบุมีข้อความที่ต้องการหรือไม่ โดยรับข้อความเป็น list และไฟล์ PDF เป็น input
    [Arguments]    ${strings}    ${pdf_file}
    @{strings}=    Create List    ${strings}
    PDF Should Contain Strings    ${strings}    ${pdf_file}

Get Text Content in PDF
    [Documentation]    ดึงข้อความทั้งหมดจากไฟล์ PDF และส่งคืนเป็น text เพื่อใช้ในการตรวจสอบหรือเปรียบเทียบ
    [Arguments]    ${pdf_file}
    ${text}=    Get Text From Document    ${pdf_file}
    RETURN    ${text}

Compare PDF only Text
    [Documentation]    เปรียบเทียบข้อความใน PDF สองไฟล์ โดยไม่สนใจฟอนต์หรือรูปแบบอื่น ๆ
    [Arguments]    ${reference_pdf}    ${candidate_pdf}
    Compare Pdf Documents    ${reference_pdf}    ${candidate_pdf}    compare=text

Compare PDF Text and Fonts
    [Documentation]    เปรียบเทียบข้อความและฟอนต์ใน PDF สองไฟล์ เพื่อตรวจสอบความตรงกันทั้งเนื้อหาและรูปแบบตัวอักษร
    [Arguments]    ${reference_pdf}    ${candidate_pdf}
    Compare Pdf Documents    ${reference_pdf}    ${candidate_pdf}    compare=text,fonts

Compare two Images in PDF
    [Documentation]    เปรียบเทียบรูปภาพ 2 รูปที่อยู่ใน PDF โดยไม่ใช้ mask
    [Arguments]    ${pdf_reference_image}    ${pdf_candidate_image}
    Compare Images   ${pdf_reference_image}    ${pdf_candidate_image}

Compare two Images and Ignore Mask
    [Documentation]    เปรียบเทียบรูปภาพใน PDF สองภาพ พร้อมระบุ mask เพื่อไม่ตรวจบางส่วนของภาพที่ไม่ต้องการเปรียบเทียบ
    [Arguments]    ${pdf_reference_image}    ${pdf_candidate_image}     ${mask}
    Compare Images   ${pdf_reference_image}    ${pdf_candidate_image}   mask=${mask}

Get Unique Elements
    [Documentation]    หาข้อความที่ไม่ตรงกันระหว่าง PDF สองไฟล์ โดยดึงข้อความทั้งหมดมาเปรียบเทียบและส่งคืนรายการที่ไม่ซ้ำกัน
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
    [Documentation]    ดึงข้อความจาก PDF แล้วสร้างรายการของ patterns ที่สามารถใช้เป็น mask ในการเปรียบเทียบ PDF โดยเลือกเฉพาะ element ที่มีเงื่อนไขพิเศษ 
    ...                โดยจะทำ manaul ในไฟล์เอกสาร PDF ที่สนใจ  จะ ignore field โดยการใส่ -  ดังตัวอย่างในไฟล์ Customer details reference.pdf  ใน folder data
    [Arguments]    ${pdf_file}
    ${text1}=    Get Text From Document    ${pdf_file}
    Log    ${text1}
    ${masks}=    Create List
    FOR    ${element}    IN    @{text1}
        Log    ${element}
        ${mask_element}=    Create Dictionary    page=all    type=pattern    pattern=${element}
        IF    '${element}'.replace('-','') == ''
            Append To List    ${masks}    ${mask_element}
        END
    END
    RETURN    ${masks}

Format Unique Elements As Mask
    [Documentation]    รับข้อความที่แตกต่างระหว่าง PDF สองไฟล์ แล้วแปลงเป็นรูปแบบ mask สำหรับใช้ในการ ignore หรือ filter ข้อมูลบางส่วน
    [Arguments]    ${unique_elements}
    ${masks}=    Create List
    FOR    ${element}    IN    @{unique_elements}
        Log    ${element}
        ${mask_element}=    Create Dictionary    page=all    type=pattern    pattern=.*${element}.*
        Append To List    ${masks}    ${mask_element}
    END
    RETURN    ${masks}
