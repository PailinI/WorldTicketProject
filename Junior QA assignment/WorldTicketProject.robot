*** Settings ***
Library    Selenium2Library
Test Teardown    Close All Browsers


*** Variables ***
${browser}    chrome
${url}    https://ecom-test-dat.worldticket.net/


*** Keywords ***
# 1. Access this URL: https://ecom-test-dat.worldticket.net/
Open WebBrowser 
    Open Browser     ${url}     ${browser}
    Maximize Browser Window
# 2. Check title name contains ”WorldTicket”.
Check title name
    ${title_text}=  Get Title
    Should Contain     ${title_text}   WorldTicket   
# 3. Click the Profile icon at the top right of the page.
Accept use cookies
    wait until element is visible       //a[@href="javascript:setCookieLaw(1);"]
    Click link    //a[@href="javascript:setCookieLaw(1);"]

Click the Profile icon
    wait until element is visible       //a[@href="https://ecom-test-dat.worldticket.net/customer/account/login/"]
    Click link    //a[@href="https://ecom-test-dat.worldticket.net/customer/account/login/"]          
# 4. Login by email via the following credential.
Login by email
    wait until element is visible       name=username
    Input Text      name=username       tester@worldticket.net
    Input Password  name=password       atm1234
    Click Button    class=button
# 5. Check the user name contains “Junior Tester”.
Check the user name
    wait until element is visible   //a[@class="prpop-close-btn"]
    Click link      //a[@class="prpop-close-btn"]
    Element Should Contain      //p[@class="hello"]     Junior Tester
# 6. Click the account information tab.
Click the account information tab
    Click link      //a[@href="https://ecom-test-dat.worldticket.net/customer/account/edit/"]
# 7.Check only the email address field is equal to the login email.
Check email address
    ${email_txt}    Get Value   //input[@name="email"] 
    Should Be Equal     ${email_txt}      tester@worldticket.net



*** Test Cases ***
Search case
# 1. Access this URL: https://ecom-test-dat.worldticket.net/
   Open WebBrowser
# 2. Check title name contains ”WorldTicket”.
   Check title name
# 3. Click the Profile icon at the top right of the page.
   Accept use cookies
   Click the Profile icon
# 4. Login by email via the following credential.
   Login by email
# 5. Check the user name contains “Junior Tester”.
   Check the user name
# 6. Click the account information tab.
   Click the account information tab
# 7.Check only the email address field is equal to the login email.
   Check email address
