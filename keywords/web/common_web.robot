*** Keywords ***
Open browser and redirect to expected url
    [Arguments]    ${url}
    SeleniumLibrary.Open browser    ${url}    browser=chrome

Open new tab and redirect to expected url
    [Arguments]    ${url}
    SeleniumLibrary.Execute javascript    window.open('${url}');
    ${ids}    SeleniumLibrary.Get Window Handles
    SeleniumLibrary.Switch Window    ${ids}[-1]

Wait until element is ready
    [Arguments]    ${locator}    ${timeout}=${timeout.medium_timeout}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}

Wait until element is ready with replace string
    [Arguments]    ${locator}    ${expected_text}    ${timeout}=${timeout.medium_timeout}
    ${new_locator}    String.Replace string    ${locator}    @#string@#    ${expected_text}
    SeleniumLibrary.Wait until element is visible    ${new_locator}    ${timeout}

Click element when ready
    [Arguments]    ${locator}    ${timeout}=${timeout.medium_timeout}
    Wait until element is ready    ${locator}    ${timeout}
    SeleniumLibrary.Click element    ${locator}

Click element when ready with replace string
    [Arguments]    ${locator}    ${expected_text}    ${timeout}=${timeout.medium_timeout}
    ${new_locator}    String.Replace string    ${locator}    @#string@#    ${expected_text}
    Wait until element is ready    ${locator}    ${timeout}
    SeleniumLibrary.Click element    ${new_locator}

Input text to textbox when ready
    [Arguments]    ${locator}    ${text}    ${timeout}=${timeout.medium_timeout}
    Wait until element is ready    ${locator}    ${timeout}
    SeleniumLibrary.Input text    ${locator}    ${text}