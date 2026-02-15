*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    yaml

# Common
Variables    ${CURDIR}/../resources/testdata/common/common_config.yaml
Variables    ${CURDIR}/../resources/testdata/common/credential_testdata.yaml

# Web
## keywords
Resource    ${CURDIR}/../keywords/web/common_web.robot
Resource    ${CURDIR}/../keywords/web/page/login_page.robot
Resource    ${CURDIR}/../keywords/web/page/my_account_page.robot

## features
Resource    ${CURDIR}/../keywords/web/feature/login_feature.robot

## locators
Resource    ${CURDIR}/../locators/web/login_locator.robot
Resource    ${CURDIR}/../locators/web/my_account_locator.robot

## translation
Variables    ${CURDIR}/../resources/translation/translation_${lang}.yaml