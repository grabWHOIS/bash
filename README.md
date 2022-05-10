# [bash.grabwhois.com](https://bash.grabwhois.com/)

Projekt odpytujący whois ze zmiennym IP z resetowaniem routera DSL przez API

+ [Repozytorium plików git grabWHOIS/bash: bash.grabwhois.com](https://github.com/grabWHOIS/bash)
+ [Projekt grabWHOIS](https://github.com/grabWHOIS)


Zapraszam do skorzystania z narzędzia grabWHOIS do pobierania danych domeny WHOIS i weryfikacji samemu ile tak na prawdę domen jest cenzurowanych w Polsce przez "instytucję" NASK:
Szczególnie interesujące są domeny zablokowane ze statusem:

    "Trwa postępowanie wyjaśniające [REGISTERED, ze statusem clientHold/serverHold]"

Jak podaje NASK (opłacany przez Polaków) status **clientHold/serverHold** oznacza, że 
"Utrzymywanie domeny zostało wstrzymane do czasu wyjaśnienia wątpliwości dotyczących współpracy z jej abonentem, np. w przypadku zaległości płatniczych u rejestratora, braku aktualizacji danych abonenta (pomimo wezwania), wykorzystywania domeny do celów zagrażających bezpieczeństwu sieci."

Rodzą się naturalne wątpliwości i pytania:

1. Dlaczego tak istotnie różne sytuacje są **ukryte** pod jednym statusem?
2. Dlaczego wiele domen w trakcie wygasania, te które nie są przedłużane (świadomie przez abonenta) nie mają tego statusu?
   Warto wiedzieć, że w Polsce nie ma obowiązku przedłużania ważności domen a nierozliczona domena może zostać usunięta z rejestru.


+ [„Dlaczego nie działa mi strona”, czyli jak ABW walczy z kremlowską propagandą](https://zaufanatrzeciastrona.pl/post/dlaczego-nie-dziala-mi-strona-czyli-jak-abw-walczy-z-kremlowska-propaganda/)


Poniżej kilka informacji:

+ Jak to działa
+ Do czego służy
+ Jak zainstalować

## Zapraszam do testowania!

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

## INSTALL WHOIS


## Install

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


## Oficjalna lista stron www / domen znajduje się tutaj:

+ [Rejestr Domen Ocenzurowanych](https://hazard.mf.gov.pl/)
+ [Lista Domen ocenzurowanych](https://hole.cert.pl/domains/domains.txt)


## DNS TOOLS

Jak sprawdzić status domeny i dane abonenta?
+ [DNS - Krajowy Rejestr Domen](https://www.dns.pl/whois)

Globalna Lista usuniętych domen
+ [Deleted Domains (last 7 days) » ExpiredDomains.net](https://member.expireddomains.net/domains/combinedexpired/?o=statustld_registered&r=d&ftlds[]=196&flimit=200&fwordpl=1#listing)

+ [ WHOIS, DNS, & Domain Info - DomainTools](https://whois.domaintools.com/example.pl)

+ [ Reverse NS Lookup - DomainTools](https://reversens.domaintools.com/search/?q=)


## Check DNS

There are two ways that a domain name => DNS server map can be constructed:

Zone file access: some registries grant access to their zone files to their registrars and other entities.
This makes it pretty easy to determine which domains in those zones are delegated to a given DNS server.
This is how DomainTools.com provides their Name Server Spy product.
This is the most reliable method, but is obviously limited to the zone files that they have access to.


Passive DNS. This involves examining traffic through recursive DNS servers at ISPs
and reconstructing zone data based on what's seen.
This method lets you discover information from the entire DNS space,
but is less reliable as changes take longer to appear in your database,
and won't recover information about domains that get little or no queries.



# TODO


## Plany

Następny krok to aplikacja webowa i statyczne API z autoryzacją i limitami per client do 1000 zapytań dziennie.

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


### subdomeny dla whoisarch.com zalezne od kraju/TLD

    *.whoisarch.com
    
    com.whoisarch.com
    net.whoisarch.com
    org.whoisarch.com
    pl.whoisarch.com
    de.whoisarch.com
    ch.whoisarch.com

+ LOGS each day
+ REPORTS each 2 days, diff
+ watch logs


### Lista wszystkich metod pozyskania whois

jako oddzielny projekt
do monitorowania zmian w rejestrach




## docs




---
+ [edit](https://github.com/grabWHOIS/bash/edit/main/README.md)
---