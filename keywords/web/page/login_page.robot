*** Keywords ***
Input username
    [Arguments]    ${username}
    common_web.Input text to textbox when ready    ${login_locator.txt_username}    ${username}

Input password
    [Arguments]    ${password}
    common_web.Input text to textbox when ready    ${login_locator.txt_password}    ${password}

Click login button
    common_web.Click element when ready    ${login_locator.btn_login}

Verify error message should be visible
    [Arguments]    ${expected_error_message}
    common_web.Wait until element is ready with replace string    ${login_locator.lbl_error_message}    ${expected_error_message}