petcupid
========

Pet Cupid é um projeto ainda em desenvolvimento que foi iniciado na aula de Graphic Design Studio II na SCAD. O objetivo desse projeto é estimular a adoção de animais, criando uma rede social similar à sites de relacionamento, cuja proposta é encontrar o seu par animal perfeito.

Nesse serviço, abrigos e protetores cadastrariam seus animais disponíveis para adoção e usuários cadastrariam suas preferências. Assim que detectada a compatibilidade, o usuário poderia ver o perfil do animal e decidir se quer adotar ou não. É uma forma mais descomplicada e despojada para os abrigos e protetores se comunicarem com possíveis pais adotivos.

---

[![Code Climate](https://codeclimate.com/github/leonardowf/petcupid/badges/gpa.svg)](https://codeclimate.com/github/leonardowf/petcupid)

---

Executando
===
Para executar localmente o projeto, siga os passos:

```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
$ rails s
```

Deploy com:

```
$ cap production deploy
```