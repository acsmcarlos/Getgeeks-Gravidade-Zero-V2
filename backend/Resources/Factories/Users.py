
from ast import Return


def factory_new_user():

    return {
        'name': 'Marilene Candido',
        'email': 'marilene@gmail.com',
        'password': '123456'
    }


def factory_get_user():

    return {
        'name': 'Karlos Rafael',
        'email': 'rafael@gmail.com',
        'password': '123456'
    }


def factory_remove_user():

    return {
        'name': 'Benjamim William',
        'email': 'benjamin@gmail.com',
        'password': '123456'
    }


def factory_update_user():

    # email não é alterado no PUT
    email = 'carlos@gmail.com'

    return {
        'before': {
            'name': 'Antonio Carlos',
            'email': email,
            'password': '123456'
        },
        'after': {
            'name': 'Jose Carlos',
            'email': email,
            'whatsapp': '34984646464',
            'avatar': 'https://avatars.githubusercontent.com/u/55151078?s=400&u=82eac1a2e23b15ee29c2eac3fb4d89b5ec3e49fc&v=4'
        }
    }


def factory_user_session(target):

    name = 'Karlos Rafael'
    email = 'rafael@gmail.com'
    password = '123456'

    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }
    }

    return data[target]


def factory_be_geek():

    return {

        'name': 'Benedito Bene',
        'email': 'benedito@gmail.com',
        'password': '123456',
        'geek_profile': {
            'whatsapp': '11985652525',
            'desc': 'Posso formatar o seu computador, instalando o windows 10 e 11, e também o Linux Mint ou Ubuntu (recomendado para iniciantes). Além disso, consigo remover qualquer vírus, malware e até mesmo o baidoo. Tudo de forma profissional, e com a garantia de 2 anos.',
            'printer_repair': 'Sim',
            'work': 'Remoto',
            'cost': '150.99'
        }
    }


def factory_search_for_geeks():

    return {
        'user': {
            'name': 'Peter Quill',
            'email': 'quill@marvel.com',
            'password': '123456',
        },
        'geeks': [
            {
                'name': 'Riri Willians',
                'email': 'riri@marvel.com',
                'password': 'pwd123',
                'geek_profile': {
                        'whatsapp': '11999999999',
                        'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
                        'printer_repair': 'Não',
                        'work': 'Presencial',
                        'cost': '100'
                }
            },
            {
                'name': 'Arnim Zola',
                'email': 'zola@hidra.com',
                'password': 'pwd123',
                'geek_profile': {
                        'whatsapp': '21999999999',
                        'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
                        'printer_repair': 'Não',
                        'work': 'Ambos',
                        'cost': '110'
                }
            },
            {
                'name': 'Reed Richards',
                'email': 'reed@fantastic4.com',
                'password': 'pwd123',
                'geek_profile': {
                        'whatsapp': '31999999999',
                        'desc': 'Instalado e faço manutenção em qualquer tipo de impressora, matricial padrão, matricial fiscal, a jato, a cera, a laser e até 3D. Também faço remold de fitas coloridas para Epson LX300. ',
                        'printer_repair': 'Sim',
                        'work': 'Remoto',
                        'cost': '120'
                }
            }
        ]
    }
