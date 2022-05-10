# [bash.grabwhois.com](https://bash.grabwhois.com/)

## Cel

Przygotwałem ten projekt odpytujący whois ze zmiennym IP
w celu sprawdzania poziomu cenzury w Polsce
+ [„Dlaczego nie działa mi strona”, czyli jak ABW walczy z kremlowską propagandą | Zaufana Trzecia Strona](https://zaufanatrzeciastrona.pl/post/dlaczego-nie-dziala-mi-strona-czyli-jak-abw-walczy-z-kremlowska-propaganda/)
 
Domeny ze statusem: 

    "Trwa postępowanie wyjaśniające [REGISTERED, ze statusem clientHold/serverHold]"

na dzień dzisiejszy to co najmniej kilkanaście procent domen usuniętych.



Zapraszam do testowania!

Poniżej kilka informacji:

+ Jak to działa
+ Do czego służy
+ Jak zainstalować


 

## Oficjalna lista stron www / domen znajduje się tutaj:

+ [Rejestr Domen Ocenzurowanych](https://hazard.mf.gov.pl/)
+ [Lista Domen ocenzurowanych](https://hole.cert.pl/domains/domains.txt)


## DNS TOOLS

Jak sprawdzić status domeny i dane abonenta?
+ [DNS | Krajowy Rejestr Domen](https://www.dns.pl/whois)

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


## Użycie programu

Rozwiazanie najlepiej uruchomić na zewnętrznym urządzeniu jak RPI, które może pracować całą noc pobierając mniej prądu
a także resetować router jeśli taka opjca jest możliwa obecnie jest wspierane resetowanie routera marki fritz.


## INSTALL WHOIS

Jak zainstalować

    sudo apt-get install whois

więcej informacji na bashfunc/www/whois
https://www.howtogeek.com/680086/how-to-use-the-whois-command-on-linux/


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



### Przykłady użycia

https://github.com/grabWHOIS/examples

na letWHOIS z opcją używania innnych agentów i przetwarzaniem formatu

z instalacją i przykładową listą input i output





## Install

```bash
sudo apt update
sudo apt upgrade
sudo apt install whois
```


## check WHOIS

```bash
./whois_all.sh 
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