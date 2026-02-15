*** Settings ***
Resource        ${CURDIR}/../resources/import.robot
Test Setup      common_web.Open browser and redirect to expected url    ${bullvpn_baseURL}/${lang}/${endpoint.login}
Test Teardown   SeleniumLibrary.Close all browsers

*** Test Cases ***
Case 1: Success login
    [Documentation]    สามารถเข้าสู่ระบบได้สำเร็จเมื่อใช้ Username และ Password ที่ถูกต้อง (และตรวจสอบว่าระบบพาไปหน้า Dashboard จริง)
    [Tags]    regression
    login_feature.Login with username and password    ${username}    ${password}
    my_account_page.Verify page landing on my account page

Case 2: Invalid credentials
    [Documentation]    ระบบต้องแสดง Error message ที่ถูกต้องเมื่อกรอกรหัสผ่านผิด
    [Tags]    regression
    login_feature.Login with username and password    ${username_incorrect}    ${password_incorrect}
    login_page.Verify error message should be visible    ${login_page.invalid_credential}

Case 3: Relogin after logout
    [Documentation]    ตรวจสอบว่าผู้ใช้สามารถเข้าสู่ระบบใหม่ได้หลังจากทำการ logout โดย session เดิมต้องถูกยกเลิก และระบบต้องสร้าง session ใหม่เมื่อ login อีกครั้งสำเร็จ
    [Tags]    regression
    login_feature.Login with username and password    ${username}    ${password}
    my_account_page.Verify page landing on my account page
    my_account_page.Click logout
    login_feature.Login with username and password    ${username}    ${password}
    my_account_page.Verify page landing on my account page

Case 4: Session persist after refresh or open new tab
    [Documentation]    ตรวจสอบว่าเมื่อผู้ใช้ login สำเร็จแล้ว ทำการ refresh หน้า ระบบยังคงสถานะ login อยู่และไม่ redirect กลับหน้า login
    [Tags]    regression    test
    login_feature.Login with username and password    ${username}    ${password}
    my_account_page.Verify page landing on my account page
    SeleniumLibrary.Reload page
    my_account_page.Verify page landing on my account page
    common_web.Open new tab and redirect to expected url    ${bullvpn_baseURL}/${lang}/${endpoint.login}
    my_account_page.Verify page landing on my account page

Case 5: Credential input validation
    [Documentation]    ตรวจสอบความถูกต้องของการกรอก username และ password เช่น ไม่กรอกข้อมูล, กรอกไม่ครบ, มีช่องว่างหน้า–หลัง หรือรูปแบบไม่ถูกต้อง ระบบต้องไม่อนุญาตให้ login และแสดงข้อความแจ้งเตือน
    [Tags]    regression
    # # Weired syntax
    login_feature.Login with username and password    ${username_incorrect_2}    ${password_incorrect_2}
    login_page.Verify error message should be visible    ${login_page.invalid_credential}
    # Empty
    login_feature.Login with username and password    ${EMPTY}    ${EMPTY}
    login_page.Verify error message should be visible    ${login_page.missing_username}
    login_page.Verify error message should be visible    ${login_page.missing_password}
    # White space on password
    login_feature.Login with username and password    ${SPACE}${username}${SPACE}    ${SPACE}${password}${SPACE}
    login_page.Verify error message should be visible    ${login_page.invalid_credential}
    # White space on username
    login_feature.Login with username and password    ${SPACE}${username}${SPACE}    ${password}
    my_account_page.Verify page landing on my account page
