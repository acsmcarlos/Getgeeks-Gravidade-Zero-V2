*** Settings ***
Documentation    Base teste


Library    RequestsLibrary
Library    Factories/Users.py

Resource    Helpers.robot

Resource    Routes/GeeksRoute.robot
Resource    Routes/SessionsRoute.robot
Resource    Routes/UsersRoute.robot


*** Variables ***
${API_USERS}    https://getgeeks-users-antonio.herokuapp.com
${API_GEEKS}    https://getgeeks-geeks-antonio.herokuapp.com
