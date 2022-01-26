*** Settings ***
Documentation    Base de testes | Arquivo base do projeto

Library    Browser
Library    Collections
Library    Utils.py

Library    Factories/Users.py

Resource    Actions/LoginActions.robot
Resource    Actions/SharedActions.robot
Resource    Actions/SignupActions.robot
Resource    Actions/BeGeekActions.robot

Resource    Helpers.robot
Resource    Database.robot
Resource    Services.robot


*** Variables ***
${URL_BASE}    https://getgeeks-web-antonio.herokuapp.com


*** Keywords ***
Start Session
    New Browser    chromium       headless=True    slowMo=00:00:00
    New Page       ${URL_BASE}


After Test
    
    ${shot_name}    Screenshot Name
    
    Take Screenshot    fullPage=True    filename=${shot_name}