# clear
# rm -rf logs/

# EXECUTA O DELOREAN SEM GERAR O LOG (NONE) ============|
robot -r NONE -l NONE -o NONE Tasks/Delorean.robot

## TRATAMENTO DAS SCREENSHOTS DO PABOT
pabot -x xunit.xml -d ./logs -i smoke Testes/

rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot
# rm -rf logs/pabot_results/

