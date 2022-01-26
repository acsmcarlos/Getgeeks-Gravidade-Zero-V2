robot -l NONE -o NONE -r NONE Tasks/Delorean.robot
pabot -x xunit.xml -d ./logs -i smoke -v HEADLESS:True Testes/

rm -rf ./logs/browser
mkdir ./logs/browser
mkdir ./logs/browser/screenshot

cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot/

