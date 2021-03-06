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
Test Teardown   Close Browser

***Variables***
${BaseURL}       youtube.com
${VideoURL}      https://www.youtube.com/watch?v=k6NmJKcS7wk
${Browser}       Chrome
${MinWait}       1s   
${Timeout}       30s  

# Constans
#IA - the shorter xPath is not workin being not the unique one, therfore, full xpath had be to used 
#${Locator_VideoShareIcon}      xpath://*[@id="button"]/yt-icon
${Locator_VideoShareIcon}       xpath://html/body/ytd-app/div/ytd-page-manager/ytd-watch-flexy/div[4]/div[1]/div/div[5]/div[2]/ytd-video-primary-info-renderer/div/div/div[3]/div/ytd-menu-renderer/div/ytd-button-renderer[1]/a/yt-formatted-string
${Locator_ShareIconCopyBtn}     id:copy-button
${Locator_YTAgreementPopup}     id:dialog 
${Locator_YTSignInPopup}        id:iframe


***Test Cases***
Verify-Video-LinkSharing-Using-ShareButton
    #IA - hard coded ${MinWait} is added just for the safe side as the iframe is Jave Script bases element and takes unexpected time to load DOM
    Open Browser    ${VideoURL}      ${Browser}
    ByPass Youtube Agreement Popup
    ByPass SignIn Popup 
    sleep   ${MinWait}  
    #step:  wait and click for video share icon
    Wait Until Element is Visible   ${Locator_VideoShareIcon}    ${Timeout}
    Click Element     ${Locator_VideoShareIcon}
    #step:  wait and click for copy button
    Wait Until Element is Visible   ${Locator_ShareIconCopyBtn}    ${Timeout}
    Click Element     ${Locator_ShareIconCopyBtn}
    #step: get copied text from clipboard
    ${copied_video_url}         get_text_from_clipboard 
    #step: opne new tab and verify if both videos are the same
    Execute Javascript        window.open('')
    Switch window   title=undefined
    Go To     ${copied_video_url}
    sleep     ${MinWait} 
    @{titles}       Get Window Titles    
    log       ${titles}[0] 
    should be equal       ${titles}[0]        ${titles}[1]   

***Keywords***
ByPass Youtube Agreement Popup 
    Wait Until Element is Visible   ${Locator_YTAgreementPopup}     ${Timeout}
    Press Keys     None    TAB 
    Press Keys     None    TAB 
    Press Keys     None    RETURN

ByPass SignIn Popup 
    Wait Until Element is Visible   ${Locator_YTSignInPopup}     ${Timeout}    
    sleep   ${MinWait} 
    Press Keys     None    TAB 
    Press Keys     None    TAB 
    Press Keys     None    RETURN

     

    




