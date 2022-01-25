import bcrypt
from faker import Faker
faker = Faker()
# criptografar a senha com bcrypt (pypi.org) = pip install bcrypt


def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

# Método para inserir usuários no banco


def users_to_insert_db():
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_common'),
        factory_user('searcher_alien'),
        factory_user('searcher_common')
    ]


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
        },
        'searcher_alien': {
            'firstname': 'Johnny',
            'lastname': 'Lawrence',
            'email': 'johnny@cobrakai.com',
            'password': '123456'
        },
        'search_alien': {
            'firstname': 'Dok',
            'lastname': 'Ock',
            'email': 'dok@oscorp.com',
            'password': '123456',
            'geek_profile': {
                'whatsapp': '34984323887',
                'desc': 'Faço conserto de qualquer impressora. Matricial a fita, Matricial a fita colorida, a laser, a jato de tinta e tambem impressora 3D.',
                'printer_repair': 'Sim',
                'work': 'Presencial',
                'cost': '350'
            }
        },
        'searcher_common': {
            'firstname': 'Daniel',
            'lastname': 'Larousso',
            'email': 'daniel@miyagido.com',
            'password': '123456'
        },
        'search_common': {
            'firstname': 'Peter',
            'lastname': 'Parker',
            'email': 'parker@oscorp.com',
            'password': '123456',
            'geek_profile': {
                'whatsapp': '34984323863',
                'desc': 'Posso formatar o seu computador, instalando o windows 10 e 11, e também o Linux Mint ou Ubuntu (recomendado para iniciantes). Além disso, consigo remover qualquer vírus, malware e até mesmo o baidoo. Tudo de forma profissional.',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '150'
            }
        }
    }

    return data[target]
