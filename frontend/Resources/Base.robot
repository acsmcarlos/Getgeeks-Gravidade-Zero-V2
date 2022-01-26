*** Settings ***
Documentation    Base de testes | Arquivo base do projeto

Library    Browser
Library     Collections

Library     Factories/Users.py
Library     Utils.py

Resource    Actions/SharedActions.robot
Resource    Actions/LoginActions.robot
Resource    Actions/SignupActions.robot
Resource    Actions/BeGeekActions.robot

Resource    Database.robot
Resource    Helpers.robot


*** Variables ***
${URL_BASE}    https://getgeeks-web-antonio.herokuapp.com


*** Keywords ***
Start Session
    New Browser    chromium       headless=True    slowMo=00:00:00
    New Page       ${URL_BASE}


After Test
    ${shot_name}        Screenshot Name
    Take Screenshot    fullPage=True    filename=${shot_name}