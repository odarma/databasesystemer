use øve_til_eksamen;
select fornavn, etternavn from pasienter where upper(allergier='nka');

select fornavn from pasienter where fornavn like 'C%';

select fornavn, etternavn from pasienter where vekt>=100 and vekt <=120;

update pasienter set allergier='NKA' where allergier='null';

select concat(fornavn,' ', etternavn) as full_navn from pasienter;

select * from pasienter where id in (1,45,234,379,500);

select distinct sted, provins.id, navn from pasienter join provins on provins_id = provins.id where provins.id='NS';

select distinct year(fodseldag) as unike_fødselsdag from pasienter order by unike_fødselsdag asc;

select fornavn from pasienter group by fornavn having count(fornavn)=1; -- for nøyaktighet

select distinct fornavn from pasienter; -- for oversikt 

select fornavn from pasienter order by length(fornavn) asc, fornavn asc;

select fornavn, etternavn, navn as 'provins' from pasienter join provins on provins_id = provins.id;

select innleggelser.id as innleggelse_id, pasienter.id as pasient_id, fornavn, etternavn, diagnose
from innleggelser inner join pasienter on innleggelser.pasienter_id = pasienter.id where diagnose like "%ementia";

select day(innleggelsesdato) as dag, count(*) as antall_innleggelser from innleggelser group by dag order by antall_innleggelser desc;

select * FROM innleggelser WHERE  pasienter_id = 442 and innleggelsesdato = (SELECT MAX(innleggelsesdato) FROM innleggelser 
WHERE pasienter_id = 442);

select fornavn, etternavn, count(*) as håndtert_innleggelser from innleggelser join leger on leger_id = leger.id group by leger_id;

select leger_id, concat(fornavn, " ", etternavn) as full_navn, spesialitet, min(innleggelsesdato), max(utskrivningsdato) 
from innleggelser i join leger l on leger_id = l.id group by leger_id;

select navn, count(pasienter_id) as antall_pasienter from innleggelser i join pasienter pa on pasienter_id = pa.id 
join provins pr on provins_id = pr.id group by navn order by antall_pasienter desc; -- innlegget pasienter per provins

select pr.navn as provins,count(pa.id) as antall_pasienter  from provins pr 
inner join pasienter pa on pr.id = provins_id group by provins order by antall_pasienter desc; -- pasienter per provins

select p.id, fornavn, etternavn from pasienter p where p.id not in (select pasienter_id from innleggelser);

select fornavn,etternavn,count(i.id) as antall_forekomster from pasienter p inner join innleggelser i on p.id=pasienter_id
group by fornavn,etternavn having antall_forekomster>1;

select pasienter_id, leger_id, diagnose from innleggelser where (leger_id in (1,5,19) 
and mod(pasienter_id,2)>0) or (leger_id like "%2%" and pasienter_id like"___");

select 
    case 
        when vekt < 150 then concat('vektgruppe ', floor(vekt / 10) * 10, '-', (floor(vekt / 10) * 10) + 9)
        else 'vektgruppe 150+'
    end as vektgruppe,
    count(id) as antall
from pasienter
group by vektgruppe
order by min(vekt) desc; -- sortere etter minstevekt fra hver vektgruppe

select id, vekt, hoyde, 
case
    when vekt/power(hoyde/100,2) >= 30 then '1'
    else '0' 
end as erOvervektig from pasienter;

select id, concat(id,length(etternavn),year(fodseldag)) as 'midlertidig passord' from pasienter;

select leger_id, concat(fornavn,' ',etternavn) as fullt_navn, spesialitet, year(innleggelsesdato) as år, 
count(i.id) as antall_innleggelser 
from innleggelser i inner join leger l on leger_id = l.id 
group by l.id, l.fornavn, l.etternavn, spesialitet,år 
order by fullt_navn, spesialitet,år asc;

select innleggelsesdato, count(*) as antall_innleggelser,  
count(*) - lag(count(*)) over(order by innleggelsesdato) as endring_fra_dagen_før
from innleggelser i1 group by innleggelsesdato order by innleggelsesdato asc;
-- lag() henter verdien fra forrige rad, 
-- over(order by innleggelsesdato) ser på at forrige rad er dagen før istedenfor tilfeldig dato


/* rekkefølge av spørringer: 
SELECT Hvilke kolonner skal med?
FROM Fra hvilken tabell?
WHERE Hvilke rader skal med?
GROUP BY Gruppere på hvilke kolonner?
HAVING Hvilke grupper skal med?
ORDER BY Sortere på hvilke kolonner?*/

/*
 hvordan fungerer rank(), over(), partition by og order by sammen og individuelt? eksempler også individuelt og sammen

Når vi snakker om disse fire begrepene, beveger vi oss inn i verdenen av Window Functions (vindusfunksjoner). De lar deg utføre beregninger på tvers av et sett med rader som fortsatt er relatert til den nåværende raden – uten at du trenger å gruppere alt sammen til én linje (slik GROUP BY gjør).

Her er en gjennomgang av hvordan de fungerer, både hver for seg og som en samlet enhet.
1. Individuelle definisjoner
OVER()

Dette er selve "billetten" til vindusfunksjoner. Uten OVER() er RANK() bare en vanlig funksjon som ikke vet hva den skal se på. OVER() definerer hvilket "vindu" av data funksjonen skal operere på.

    Tom OVER(): Behandler hele resultatet som én stor gruppe.

PARTITION BY

Tenk på dette som en "intern GROUP BY". Den deler dataene inn i mindre grupper (partisjoner).

    Hvis du partisjonerer på "Avdeling", vil beregningen starte på nytt for hver avdeling.

ORDER BY

Inne i en vindusfunksjon bestemmer ORDER BY hvilken rekkefølge radene skal vurderes i. Dette er kritisk for rangering eller løpende summer.
RANK()

Dette er funksjonen som gir hver rad et nummer basert på rekkefølgen.

    Spesialitet: Hvis to rader er like (delt plass), får de samme nummer, men den neste ledige plassen blir "hoppet over" (f.eks. 1, 2, 2, 4).

2. Eksempler steg-for-steg

La oss bruke en tabell over Salg som utgangspunkt:
Selger	Region	Salgssum
Ola	Nord	500
Kari	Nord	700
Per	Sør	300
Lise	Sør	800
Eksempel 1: RANK() med ORDER BY (Global rangering)

Her rangerer vi alle selgere basert på salg, uavhengig av region.
SQL

SELECT 
    Selger, 
    Salgssum,
    RANK() OVER (ORDER BY Salgssum DESC) as TabellRang
FROM Salg;

    Resultat: Lise får 1, Kari 2, Ola 3, Per 4.

Eksempel 2: PARTITION BY (Gruppert rangering)

Her vil vi se hvem som er best innad i sin region.
SQL

SELECT 
    Selger, 
    Region, 
    Salgssum,
    RANK() OVER (PARTITION BY Region ORDER BY Salgssum DESC) as RegionRang
FROM Salg;

    Hva skjer? SQL deler tabellen i Nord og Sør. Kari blir nr. 1 i Nord, og Lise blir nr. 1 i Sør.

3. Hvordan de fungerer sammen (Totalpakken)

Når du bruker alle sammen, lager du en avansert sortering og filtrering i ett uttrykk.

Syntaxen ser slik ut:
FUNKSJON() OVER (PARTITION BY kolonne1 ORDER BY kolonne2)
Et praktisk scenario:

Tenk deg at du har en butikkjede og vil finne de 3 mest solgte produktene i hver kategori.
SQL

SELECT * FROM (
    SELECT 
        ProduktNavn,
        Kategori,
        AntallSolgt,
        RANK() OVER (
            PARTITION BY Kategori 
            ORDER BY AntallSolgt DESC
        ) as Rangering
    FROM Lager
) som RangertTabell
WHERE Rangering <= 3;

Logikken her er:

    PARTITION BY Kategori: Del alle produktene inn i mapper basert på kategori (f.eks. "Elektronikk", "Mat").

    ORDER BY AntallSolgt DESC: Inne i hver mappe, legg de med flest salg øverst.

    RANK(): Gi dem et nummer (1, 2, 3...).

    OVER(...): Forteller SQL at denne rangeringen skal skje "på siden" av de vanlige radene, slik at vi ikke mister detaljene om hvert produkt.

Kort oppsummert:

    RANK(): Hva skal vi gjøre? (Gi et nummer).

    OVER: Nå skal vi bruke en vindusfunksjon!

    PARTITION BY: Skal vi dele opp dataene i grupper først?

    ORDER BY: Hvem skal stå øverst i køen før vi teller?

hva med andre vindusfunksjoner

Det finnes mange andre vindusfunksjoner enn bare RANK(). De kan grovt deles inn i tre kategorier: Rangering, Distribusjon og Analytiske funksjoner.

Her er de viktigste du bør kjenne til for å bli en mester i SQL:
1. Rangeringsfunksjoner (Forskjellige måter å telle på)

Det er tre funksjoner som ligner på RANK(), men som håndterer "uavgjort" forskjellig:
Funksjon	Oppførsel ved like verdier	Eksempel (ved lik verdi på 2. plass)
ROW_NUMBER()	Gir unike tall uansett.	1, 2, 3, 4
RANK()	Samme tall til like verdier, hopper over neste.	1, 2, 2, 4
DENSE_RANK()	Samme tall til like verdier, hopper ikke over.	1, 2, 2, 3

Når bruker du hva?

    Bruk ROW_NUMBER() hvis du bare trenger en unik ID eller skal fjerne duplikater.

    Bruk DENSE_RANK() hvis du vil vite hvem som kom på "bronseplass" selv om to personer fikk sølv.

2. Analytiske "Navigasjonsfunksjoner"

Disse er ekstremt kraftige fordi de lar deg se på rader over eller under den nåværende raden uten å gjøre en komplisert JOIN.
LAG() og LEAD()

    LAG(): Henter verdi fra en tidligere rad (f.eks. "Hva var salget i går?").

    LEAD(): Henter verdi fra en kommende rad (f.eks. "Hva er neste planlagte hendelse?").

Eksempel (Sammenligne med forrige måned):
SQL

SELECT 
    Måned, 
    Salg,
    LAG(Salg) OVER (ORDER BY Måned) as ForrigeMånedSalg
FROM ButikkSalg;

FIRST_VALUE() og LAST_VALUE()

Henter den aller første eller siste verdien i partisjonen. Nyttig for å se differansen mellom nåværende verdi og startverdien i en serie.
3. Aggregerte vindusfunksjoner

Du kan bruke vanlige funksjoner som SUM(), AVG(), MIN(), og MAX() som vindusfunksjoner. Den store forskjellen er at de ikke kollapser radene.
Løpende total (Running Total)

Dette er en av de vanligste bruksområdene for OVER():
SQL

SELECT 
    Dato, 
    Salg,
    SUM(Salg) OVER (ORDER BY Dato) as AkkumulertSalg
FROM SalgsData;

Her vil AkkumulertSalg øke for hver rad etter hvert som datoene skrider frem.
4. Distribusjonsfunksjoner

Hvis du jobber med statistikk, er disse gull verdt:

    NTILE(n): Deler radene inn i n like store grupper. NTILE(4) vil for eksempel dele datasettet ditt inn i kvartiler (de 25% beste, de 25% neste, osv.).

    PERCENT_RANK(): Regner ut den relative rangeringen som en prosentdel (mellom 0 og 1).

Oppsummering: Hvilken skal jeg velge?

    Skal du ha en liste over topp 10? Bruk RANK() eller ROW_NUMBER().

    Skal du beregne vekst fra i fjor? Bruk LAG().

    Skal du lage en løpende sum i en rapport? Bruk SUM() OVER (...).

    Skal du finne medianen eller topp 10%? Bruk NTILE(10).

Har du et spesifikt problem du prøver å løse med dataene dine, eller vil du se et kodeeksempel på en av disse?

"select g.navn,p.navn,pris,round(avg(pris) over (order by pris rows between 2 preceding and 2 following),2) as 'glidende snitt' 

from garn g inner join produsent p on produsent_id=p.id;" hva med nøkkelordene i over()

Denne spørringen din er et perfekt eksempel på en mer avansert bruk av OVER(). Her bruker du det som kalles en Window Frame (en vindusramme).

I ditt eksempel med ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING, forteller du SQL nøyaktig hvilke rader som skal inkluderes i beregningen for hver enkelt linje.

Her er de viktigste nøkkelordene du kan bruke inne i OVER() for å styre dette:
1. Window Frame (ROWS og RANGE)

Dette definerer grensene for "vinduet".

    ROWS: Teller fysiske rader (f.eks. de 2 radene over og de 2 under).

    RANGE: Ser på verdiene i ORDER BY. Hvis to rader har samme pris, vil RANGE behandle dem som én blokk.

Vanlige uttrykk i rammen:

    PRECEDING: Rader før den nåværende.

    FOLLOWING: Rader etter den nåværende.

    UNBOUNDED PRECEDING: Fra starten av partisjonen/tabellen.

    UNBOUNDED FOLLOWING: Helt til slutten av partisjonen/tabellen.

    CURRENT ROW: Den raden du står på akkurat nå.

2. Praktisk forklaring av ditt eksempel

I koden din: rows between 2 preceding and 2 following

Når SQL står på rad nummer 10, vil den regne ut gjennomsnittet av:

    Rad 8 og 9 (2 preceding)

    Rad 10 (current row)

    Rad 11 og 12 (2 following)

Dette kalles et glidende snitt (moving average) over totalt 5 rader. Det er ekstremt nyttig for å "glatte ut" støy i data, for eksempel hvis prisene på garn svinger veldig fra dag til dag.
3. Kombinasjon med de andre nøkkelordene

Du kan selvfølgelig kombinere rammen med det vi snakket om i sted:
SQL

AVG(pris) OVER (
    PARTITION BY g.kategori           -- Start snittet på nytt for hver garntype (ull, bomull osv)
    ORDER BY pris                     -- Sorter etter pris før vi teller rader
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW -- Løpende snitt fra start til "nå"
)

Hvorfor bruke UNBOUNDED PRECEDING?

Hvis du vil ha en akkumulert sum eller et løpende gjennomsnitt som tar med alt fra første rad og frem til der du er nå, bruker du ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW. Dette er faktisk standardoppførselen til mange databaser hvis du bare skriver ORDER BY uten å definere rammen.
En liten "advarsel"

Vær obs på at spørringen din i eksempelet mangler en PARTITION BY. Det betyr at den regner ut snittet på tvers av alle produsenter og alt garn i hele tabellen, sortert etter pris. Hvis du vil ha glidende snitt per produsent, må du legge til PARTITION BY p.navn inni parentesen!

Er det noen av disse uttrykkene som virker uklare, eller vil du se hvordan RANGE skiller seg fra ROWS i praksis?
*/