robot -l NONE -o NONE -r NONE Tasks/Delorean.robot

robot -x xunit.xml -d ./logs -i smoke Testes/

# rm -rf ./logs/browser
# mkdir ./logs/browser
# mkdir ./logs/browser/screenshot

# cp $(find ./logs/pabot_results -type f -name "*.png") ./logs/browser/screenshot/

