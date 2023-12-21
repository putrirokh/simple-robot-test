*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    https://katalon-demo-cura.herokuapp.com/profile.php#login    chrome
Suite Teardown    Close All Browsers

*** Test Cases ***
Successful Login and Logout
    # Using the attributes from the HTML code
    Input Text    id=txt-username    John Doe
    Input Password    id=txt-password    ThisIsNotAPassword
    Capture Page Screenshot    Before Login
    Click Button    id=btn-login
    Capture Page Screenshot    After Login

    # Attempt to click the 'Logout' link
    ${success}    Run Keyword And Return Status    Click Link    link=Logout

    # Capture the page after logout
    Capture Page Screenshot    After Logout

    # Attempt to click the login link
    Run Keyword And Ignore Error    Click Link    css=a[href*='profile.php#login']

    # Log a message indicating the result
    Log    ${success}    # Log the result of attempting to click the login link
    Capture Page Screenshot    After Failed Login
