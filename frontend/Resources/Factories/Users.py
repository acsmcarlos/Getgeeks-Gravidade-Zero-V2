import bcrypt
from faker import Faker
faker = Faker()
# criptografar a senha com bcrypt (pypi.org) = pip install bcrypt


def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed


def factory_user(target):
    data = {
        'faker': {
            'firstname': faker.first_name(),
            'lastname': faker.last_name(),
            'email': faker.free_email(),
            'password': '123456'
        },
        'user': {
            'firstname': 'Tony',
            'lastname': 'Stark',
            'email': 'tony@stark.com',
            'password': '123456'
            # DELETE FROM users WHERE email IN ('tony@stark.com', 'tony2@stark.com');
        },
        'incorrect_email': {
            'firstname': 'Tony',
            'lastname': 'Stark',
            'email': 'tony&gmail.com',
            'password': '123456'
        },
        'login': {
            'firstname': 'Antonio',
            'lastname': 'Moreira',
            'email': 'acsmcarlos@gmail.com',
            'password': '123456'
            # 'password_hash': '$2b$08$YEU1fMXb/7FNchJ.nGP8LOzbkUNs09gpV9vqk8.x2TW70ere3/Ejq'
        },
        'be_geek': {
            'firstname': 'Kim',
            'lastname': 'Dotcom',
            'email': 'kim@gmail.com',
            'password': '123456',
            'geek_profile': {
                'whats': '34988875666',
                'desc': 'Posso formatar o seu computador, instalando o windows 10 e 11, e também o Linux Mint ou Ubuntu (recomendado para iniciantes). Além disso, consigo remover qualquer vírus, malware e até mesmo o baidoo. Tudo de forma profissional, com a garantia de 2 anos.',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '100'
            }
        },
        # massa de teste que vai atender todos os outros casos de testes infeliz
        'attempt_be_geek': {
            'firstname': 'Dio',
            'lastname': 'Linux',
            'email': 'dio@linux.com',
            'password': '123456',
            'geek_profile': {
                'whats': '11985652525',
                'desc': 'Posso formatar o seu computador, instalando o windows 10 e 11, e também o Linux Mint ou Ubuntu (recomendado para iniciantes). Além disso, consigo remover qualquer vírus, malware e até mesmo o baidoo. Tudo de forma profissional, e com a garantia de 2 anos.',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '250'
            }
        }
    }
    return data[target]