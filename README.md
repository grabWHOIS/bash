# [bash.grabwhois.com](https://bash.grabwhois.com/)

## TODO
examples
z instalacją i przykładową listą input i output

Jak to działa

do czego służy

jak zainstalować

co dalej

inne projekty



Następny krok to będzie aplikacja webowa i statyczne API z autoryzacją i limitami per client do 1000 zapytań dziennie.
2 metody
+ token do zapytań generowany dla usera na rok
+ zapytania IP opóznianie do 1s/zapytanie
+ opcja hurtowego sprawdzania dla zarejestrowanych per email lub per token dla 1000 zapytań udostępniany dla wybranych, którzy nie chcą się rejestrować w systemie.
+ każdy kto zrobi donate, nawet bez rejestracji dostanie hash na 10k zapytań
+ 

Dzięki temu będzie szansa by więcej osób skorzystało i to nadal działało.
To część większego systemu, dlatego nie chcę zarabiać na dostępie do danych ogólnie dostępnych a jedynie go ułatwić i też nawiązać współpracę z domainerami
Niestety to wszystko kosztuje czas i trwa miesiącami, kolejne usługi to będzie codzienna archiwizacja stron www w formacie HTML i zrzut ekranu

## Lista wszystkich metod pozyskania whois

jako oddzielny projekt
do monitorowania zmian w rejestrach

PL-captcha:
whois.pl
dns.pl

PL-API




## Install

```bash
sudo apt update
sudo apt upgrade
sudo apt install whois
```

## check WHOIS

```bash
./whois.sh 
```

```bash
./whois_from_file.sh strato.de
```

```bash
./whois_from_file.sh premium.pl
```

```bash
./whois_from_file.sh aftermarket.pl
```

## Check free domains

Check free domains in many extensions

whois domains .com .org .net

```bash
./whois_free.sh freedoman
```

## docs



---
+ [edit](https://github.com/grabWHOIS/bash/edit/main/README.md)
---