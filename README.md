

![logo](http://logo.grabwhois.com/2/cover.png)

# [Kod źródłowy - grabWHOIS.com](http://bash.grabwhois.com/) [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/grabWHOIS/www/edit/main/DOCS/MENU.md)

+ [Documentation - docs.grabwhois.com](http://docs.grabwhois.com/)
+ [Strona informacyjna - www.grabWHOIS.com](http://www.grabwhois.com/)




## ABOUT grabWHOIS [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/grabWHOIS/www/edit/main/DOCS/ABOUT.md)


Projekt odpytujący whois ze zmiennym IP z resetowaniem routera DSL przez API

+ [Repozytorium plików git grabWHOIS/bash: bash.grabwhois.com](https://github.com/grabWHOIS/bash)
+ [Projekt grabWHOIS](https://github.com/grabWHOIS)


Poniżej kilka informacji:

+ Jak to działa
+ Do czego służy
+ Jak zainstalować

## Install [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/grabWHOIS/www/edit/main/DOCS/INSTALL.md)


Jak zainstalować na systemie linux: Debian, Ubuntu, ...

```bash
sudo apt update
sudo apt upgrade
sudo apt install whois
```

więcej informacji na bashfunc/www/whois: [How to Use the whois Command on Linux](https://www.howtogeek.com/680086/how-to-use-the-whois-command-on-linux/)

### Pobranie projektu

```bash
git clone https://github.com/grabWHOIS/bash.git grabWHOIS
```

```bash
cd grabWHOIS
```

## check WHOIS

Sprawdź domeny z plików tekstowych znajdujących się w folderze **input/**
```bash
./whois_all.sh 
```

Sprawdź listę domeny bezpośrednio z pliku tekstowego
```bash
./whois_from_file.sh strato.de
```

Stan liczebny domen w róznych statusach. Liczy osobno domeny zajęte, wolne, zablokowane.
```bash
./count.sh
```

Sprawdź różnice pomiędzy wczorajszym i dzisiejszym stanem domen
```bash
./diff.sh
```


## Check free domains

Check free domains in many extensions

whois domains .com .org .net

```bash
./whois_free.sh freedoman
```




## START [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/grabWHOIS/www/edit/main/DOCS/START.md)


### Zapraszam do testowania!

+ [Repozytorium plików git grabWHOIS/bash: bash.grabwhois.com](https://github.com/grabWHOIS/bash)


Program odpytuje WHOIS ze zmiennym IP poprzez router DSL
skrypt **restart.sh** resetuje go w momencie uzyskania limitu zapytań dla aktualnego adresu IP
W celu informowania o momencie resetowania wydaje dźwięk 1 raz
Skrypt odczekuje 1 minutę i ponawia dwukrotnie dźwięk by zasygnalizowąc powrót połączenia do sieci internet
```bash
./restart.sh
```

Skrypt **import_deleted_pl.sh** pobiera plik listy domen w trakcie wygasania ze strony
[https://www.dns.pl/deleted_domains.txt](https://www.dns.pl/deleted_domains.txt)
Plik z listą domen jest zapisywany folderze **input/** z nazwą zaczynającą się od daty utworzenia
```bash
./import_deleted_pl.sh
```

Uruchomienie pobierania danych z plików znajdujących się w folderze **input/**
```bash
./whois_all.sh 
```

Pobrane dane WHOIS domen są zapisywane do plików tekstowych, każda domena oddzielnie.
Skrypt **move.sh** przenosi pliki do folderów: **free**, **expire**, **blocked** na podstawie statusu WHOIS
```bash
./move.sh 
```
Domeny ze statusami: **wolne do rejestracji**, **wygasające po rejestracji** i **zablokowane** znajdują się w osobnych pod-folderach dla danej daty pobierania w folderze **output**

## Statusy
Status domeny jest wykrywany poprzez wyszukiwanie charakterystycznej frazy w pliku wyniku WHOIS:

### Blocked - domena zablokowana przez rejestr NASK bez wyroku sądu
    "Trwa postępowanie wyjaśniające [REGISTERED, ze statusem clientHold/serverHold]"

### Expire - wygasająca
    "billing period had finished"
Zakończył się opłacony okres rozliczeniowy; w tym stanie domena przebywa do 30 dni.


### Free - wolna do rejestracji
    "No information available about domain name"
Domena nie istnieje w bazie Registry NASK.

+ ['clientHold/serverHold'. - Forum Di.pl Domeny Internetowe](https://di.pl/search/?q=clientHold/serverHold)
+ [STATUSY domen globalnych](STATUSY.md)

## Użycie programu

Rozwiązanie najlepiej uruchomić na zewnętrznym urządzeniu jak RPI, które może pracować całą noc pobierając mniej energii
a także resetować router jeśli taka opcja jest możliwa obecnie jest wspierane resetowanie routera marki fritz.

Struktura plików

```bash    
|__LICENSE
|__.input
| |__2022-05-10_deleted_domains.txt
|__.output
| |__2022-05-10
| | |__free
| | |__expire
| | |__blocked
|__count.sh
|__data_clean.sh
|__data_create.sh
|__find.sh
|__find_input.sh
|__find_move.sh
|__find_output.sh
|__find_output_dns.sh
|__import_deleted_pl.sh
|__move.sh
|__nameserver.sh
|__README.md
|__registrar.sh
|__restart.bat
|__restart.sh
|__split.sh
|__whois.sh
|__whois_all.sh
|__whois_data.txt
|__whois_file_count.sh
|__whois_free.sh
|__whois_free.txt
|__whois_free_all.txt
|__whois_from_file.sh
```



## TOOLS [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/grabWHOIS/www/edit/main/DOCS/TOOLS.md)

### WHOIS

Jak sprawdzić status domeny i dane abonenta?
+ [DNS - Krajowy Rejestr Domen](https://www.dns.pl/whois)

Jak sprawdzić hurtowo setki, tysiące domen?
+ [Domain Whois Search - Whois lookup - GetWhois.com](http://getwhois.com/)
+ [getWHOIS](https://getwhois.io/softreck.com#)

### DNS

Globalna Lista usuniętych domen
+ [Deleted Domains (last 7 days) » ExpiredDomains.net](https://member.expireddomains.net/domains/combinedexpired/?o=statustld_registered&r=d&ftlds[]=196&flimit=200&fwordpl=1#listing)

+ [ WHOIS, DNS, & Domain Info - DomainTools](https://whois.domaintools.com/example.pl)

+ [ Reverse NS Lookup - DomainTools](https://reversens.domaintools.com/search/?q=)



## TODO [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/grabWHOIS/www/edit/main/DOCS/TODO.md)


Następny krok to aplikacja webowa z UI dla zarządzania i przyjmowania zgłoszeń, statyczne API z autoryzacją i limitami per client do 1000 zapytań dziennie.

2 metody dostępu do publicznego serwisu
+ token do zapytań generowany dla usera na rok
+ zapytania IP opóznianie do 1s/zapytanie
+ opcja hurtowego sprawdzania dla zarejestrowanych per email lub per token dla 1000 zapytań udostępniany dla wybranych, którzy nie chcą się rejestrować w systemie.
+ każdy kto zrobi donate, nawet bez rejestracji dostanie hash na 10k zapytań

Dzięki temu będzie szansa by więcej osób skorzystało i to nadal działało.
To część większego systemu, dlatego nie chcę zarabiać na dostępie do danych ogólnie dostępnych
a jedynie go ułatwić i też nawiązać współpracę z domainerami
Niestety to wszystko kosztuje czas i trwa miesiącami, kolejne usługi to będzie codzienna archiwizacja stron www w formacie HTML i zrzut ekranu


### Przykłady użycia

https://github.com/grabWHOIS/examples

na letWHOIS z opcją używania innnych agentów i przetwarzaniem formatu

z instalacją i przykładową listą input i output

### Lista wszystkich metod pozyskania whois

jako oddzielny projekt
do monitorowania zmian w rejestrach



---

+ [edit](https://github.com/grabWHOIS/www/edit/main/README.md)
+ [grabWHOIS/www](https://github.com/grabWHOIS/www)
+ [LICENSE](LICENSE)

