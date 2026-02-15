*** Keywords ***
Login with username and password
    [Arguments]    ${username}    ${password}
    login_page.Input username    ${username}
    login_page.Input password    ${password}
    login_page.Click login button