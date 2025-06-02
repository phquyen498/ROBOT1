*** Settings ***
Documentation    Lấy views
Library    SeleniumLibrary

*** Variables ***
${BROWSER}         Chrome
${URL}             https://www.youtube.com
${SEARCH_TERM}     Eleven
${Video_Element}   xpath=//yt-formatted-string[contains(@class, "ytd-video-renderer") and contains(text(), "IVE") and contains(text(), "ELEVEN")]
${Input_Element}   xpath=//input[@placeholder='Search']
${View_Element}    xpath=//div[@id='info-container']
${View_XPath}      xpath=//span[@class="style-scope yt-formatted-string bold" and @style-target="bold"]

*** Test Cases ***
Open YouTube And Get Views
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep           3s
    Wait Until Element Is Visible    ${Input_Element}

    Input Text    ${Input_Element}    ${SEARCH_TERM}
    Press Keys    ${Input_Element}    RETURN
    Sleep         3s

    Click Element    ${Video_Element}
    Sleep           3s

    Click Element    ${View_Element}
    Sleep           3s

    ${views}=    Get Text    ${View_XPath}
    Log To Console    Current video view count: ${views}

    Close Browser
