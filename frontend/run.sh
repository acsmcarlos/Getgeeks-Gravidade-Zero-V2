clear

rm -rf ./logs
robot -l NONE -o NONE -r NONE Tasks/Delorean.robot
pabot -x xunit.xml -d ./logs Testes/

rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot/

