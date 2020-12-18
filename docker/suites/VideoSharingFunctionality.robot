***Settings***
Documentation   
...     1. Launch browser with a YT video URL
...     2. Pass youtube agreement Popup
...     3. Pass youtube signin Popup
...     4. Click on video share button
...     5. Click on Copy url button [video link will be saved on clipborad]
...     6. Launch another browser tab with the copied video URL
...     7. Verify if the same video is playing in the new tab, by verifying both titles 

Library  SeleniumLibrary        
Library  ./helperKeywords.py
Test Setup      backup_existing_reports
Test Teardown   Close Browser

***Variables***
${BaseURL}       youtube.com
${VideoURL}      https://www.youtube.com/watch?v=k6NmJKcS7wk
${Browser}       Chrome
${MinWait}       1s   
${Timeout}       10s  

# Constans
${Xpath_VideoShareIcon}    xpath://*[@id="button"]/yt-icon
${Id_ShareIconCopyBtn}     id:copy-button
${Id_YTAgreementPopup}     id:dialog 
${Id_YTSignInPopup}        id:iframe


***Test Cases***
Verify-Video-LinkSharing-Using-ShareButton
    # hard coded ${MinWait} is added just for the safe side as the iframe is Jave Script bases element and takes unexpected time to load DOM
    Open Browser with Goto URL
    ByPass Youtube Agreement Popup
    ByPass SignIn Popup 
    sleep   ${MinWait}  
    Click Element By Locator    ${Xpath_VideoShareIcon}
    Click Element By Locator    ${Id_ShareIconCopyBtn}
    ${copied_video_url}         get_text_from_clipboard 
    Switch To New Tab With Goto URL    ${copied_video_url}
    sleep     ${MinWait} 
    @{titles}       Get Window Titles    
    log       ${titles}[0] 
    should be equal       ${titles}[0]        ${titles}[1]   

***Keywords***
Open Browser with Goto URL
    Open Browser    ${VideoURL}      ${Browser}

ByPass Youtube Agreement Popup 
    Wait Until Element is Visible   ${Id_YTAgreementPopup}     ${Timeout}
    Press Keys     None    TAB 
    Press Keys     None    TAB 
    Press Keys     None    RETURN

ByPass SignIn Popup 
    Wait Until Element is Visible   ${Id_YTSignInPopup}     ${Timeout}    
    sleep   ${MinWait} 
    Press Keys     None    TAB 
    Press Keys     None    TAB 
    Press Keys     None    RETURN
    
Click Element By Locator
    [Arguments]      ${locator}
    Wait Until Element is Visible   ${locator}    ${Timeout}
    Click Element     ${locator}

Switch To New Tab With Goto URL
    [Arguments]       ${url}
    Execute Javascript        window.open('')
    Switch window   title=undefined
    Go To    ${url}

     

    




