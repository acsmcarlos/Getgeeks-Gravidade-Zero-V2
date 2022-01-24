clear
rm -rf Logs/

# EXECUTA O DELOREAN SEM GERAR O LOG (NONE) ============|
robot -r NONE -l NONE -o NONE Tasks/Delorean.robot

# TODOS OS TESTES ======================================|
# robot -d ./Logs Testes/
# robot -d ./Logs Testes/AttemptBeGeek.robot
# robot -d ./Logs Testes/BeGeek.robot
# robot -d ./Logs Testes/Login.robot
# robot -d ./Logs Testes/Signup.robot

# TESTE DE FUMAÇA (PRINCIPAIS) ==========================|
# robot -d ./Logs -i smoke Testes/


## TRATAMENTO DAS SCREENSHOTS DO PABOT
robot -d ./Logs Testes/
rm -rf Logs/browser
mkdir -p ./Logs/browser
mkdir ./Logs/browser/screenshot
cp $(find ./Logs/pabot_results -type f -name "*.png") ./Logs/browser/screenshot
rm -rf Logs/pabot_results/

