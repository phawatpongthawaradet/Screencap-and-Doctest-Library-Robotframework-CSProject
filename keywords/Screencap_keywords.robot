*** Settings ***
Library     ScreenCapLibrary

*** Keywords ***
Start Video Recording for Test
    [Documentation]    เริ่มต้นการบันทึกวิดีโอด้วยชื่อและ alias ที่กำหนด ใช้สำหรับเริ่มบันทึกหน้าจอของ test case
    [Arguments]    ${alias}    ${name}
    Start Video Recording    alias=${alias}    name=${name}

Stop Video Recording for Test
    [Documentation]    หยุดการบันทึกวิดีโอของ alias ที่ระบุ โดยไม่กระทบ alias อื่น ๆ
    [Arguments]    ${alias}
    Stop Video Recording    alias=${alias}

Stop All Video Recordings for Test
    [Documentation]    หยุดการบันทึกวิดีโอทั้งหมดที่กำลังทำงานอยู่ เหมาะสำหรับ cleanup ตอนท้ายของ test suite
    Stop All Video Recordings

Pause Video Recording for Test
    [Documentation]    หยุดการบันทึกชั่วคราวสำหรับ alias ที่ระบุ สามารถ Resume ได้ภายหลัง
    [Arguments]    ${alias}
    Pause Video Recording    alias=${alias}

Resume Video Recording for Test
    [Documentation]    ทำการบันทึกวิดีโอต่อจากที่ Pause ไว้สำหรับ alias ที่ระบุ
    [Arguments]    ${alias}
    Resume Video Recording    alias=${alias}



