*** Keywords ***
Verify page landing on my account page
    common_web.Wait until element is ready    ${my_account_locator.lbl_my_account_header}
    common_web.Wait until element is ready with replace string    ${my_account_locator.lbl_profile_header}    ${my_account_page.lbl_account_information}
    common_web.Wait until element is ready with replace string    ${my_account_locator.lbl_profile_header}    ${my_account_page.lbl_promo_code}
    common_web.Wait until element is ready with replace string    ${my_account_locator.lbl_profile_header}    ${my_account_page.lbl_url_for_friends}
    common_web.Wait until element is ready with replace string    ${my_account_locator.ddl_navbar}    ${my_account_page.menu.my_account}
    common_web.Wait until element is ready with replace string    ${my_account_locator.ddl_navbar}    ${my_account_page.menu.manage_device}
    common_web.Wait until element is ready with replace string    ${my_account_locator.ddl_navbar}    ${my_account_page.menu.wireguard_beta}
    common_web.Wait until element is ready with replace string    ${my_account_locator.ddl_navbar}    ${my_account_page.menu.change_password}
    common_web.Wait until element is ready with replace string    ${my_account_locator.ddl_navbar}    ${my_account_page.menu.login_on_the_tv}
    common_web.Wait until element is ready with replace string    ${my_account_locator.ddl_navbar}    ${my_account_page.menu.invoice}
    common_web.Wait until element is ready with replace string    ${my_account_locator.ddl_navbar}    ${my_account_page.menu.affiliate_program}
    common_web.Wait until element is ready with replace string    ${my_account_locator.ddl_navbar}    ${my_account_page.menu.logout}

Click logout
    common_web.Click element when ready with replace string    ${my_account_locator.ddl_navbar}    ${my_account_page.menu.logout}