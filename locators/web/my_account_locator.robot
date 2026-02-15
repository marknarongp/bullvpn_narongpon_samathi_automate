*** Variables ***
&{my_account_locator}
...    lbl_my_account_header=//div[@id="account-page"]//*[text()="${my_account_page.lbl_my_account}"]
...    lbl_profile_header=//div[@class="profile-container"]//h3[contains(text(),"@#string@#")]
...    ddl_navbar=//div[@id="account-navbar"]//a[contains(text(),"@#string@#")]