MODULE Module1
    !Julistetaan ensimm�iseksi kaikki muuttujat ja vakiot:
    !Muuttuja p��ohjelman silmukan suorituskertoja varten:
    VAR num nLaskuri;
    !Muuttuja hyl�ttyjen kappaleiden lukum��r�lle:
    VAR num nHylsy;
    !Muuttuja valmiiden kappaleiden lukum��r�lle:
    VAR num nValmisKappale;
    !Muuttuja valmistuotelavan sarakkeiden m��r�lle:
    VAR num nSarakkeetVienti;
    !Muuttuja valmistuotelavan rivien m��r�lle:
    VAR num nRivitVienti;
    !Muuttuja valmistuotelavan rivien v�lille:
    VAR num nValiX;
    !Muuttuja valmistuotelavan sarakkeiden v�lille:
    VAR num nValiY;
    !Muuttuja valmistuotelavan matriisin kokonaisleveytt� varten,
    !t�m�n arvon perusteella m��ritet��n mahtuvatko kappaleet lavalle rinnakkain:
    VAR num nMatriisinLeveys;
    !Muuttuja valmistuotelavan matriisin kokonaispituutta varten,
    !t�m�n arvon perusteella m��ritet��n mahtuvatko kappaleet lavalle per�kk�in:
    VAR num nMatriisinPituus;
    !Muuttuja jolla m��ritet��n joka monesko kappale mitataan koneituksen j�lkeen:
    VAR num nMitattavat;
    !Muuttuja jolla m��ritet��n pest��nk� kappaleet koneistuksen j�lkeen:
    VAR num nPesu;
    !Muuttuja hylsypinon sarakelukua varten:
    VAR num nSarakeHylsy;
    !Muuttuja hylsypinon rivilukua varten:
    VAR num nRiviHylsy;
    !Muuttuja hakulavan rivilukua varten:
    VAR num nRiviHaku;
    !Muuttuja hakulavan sarakelukua varten:
    VAR num nSarakeHaku;
    !Muuttuja valmistuotelavan rivilukua varten:
    VAR num nRiviVienti;
    !Muuttuja valmistuotelavan sarakelukua varten:
    VAR num nSarakeVienti;
    !Muuttuja hakulavan object framen paikkatiedolle x-akselilla:
    VAR num nInPalletFrameX;
    !Muuttuja hakulavan object framen paikkatiedolle y-akselilla:
    VAR num nInPalletFrameY;
    !Muuttuja valmistuotelavan object framen paikkatiedolle x-akselilla:
    VAR num nOutPalletFrameX;
    !Muuttuja valmistuotelavan object framen paikkatiedolle y-akselilla:
    VAR num nOutPalletFrameY;
    !Muuttuja hylsypinon object framen paikkatiedolle x-akselilla:
    VAR num nHylsyPinoFrameX;
    !Muuttuja hylsypinon object framen paikkatiedolle y-akselilla:
    VAR num nHylsypinoFrameY;
    
    !Vakio hakulavan sarakkeiden m��r�lle:
    CONST num nSarakkeetHaku := 2;
    !Vakio jota k�ytet��n hakupisteen paikan laskemiselle x-suunnassa,
    !todellisuudessa matriisissa on 4 rivi� mutta itselleni on helpompaa
    !mielt�� mit� asiaa ollaan laskemassa kun arvo on nimetty n�in:
    CONST num nRivitHaku := 2;
    !Vakio hakupisteiden v�lille x-akselilla:
    CONST num nHakuPisteX := 300;
    !Vakio hakupisteiden v�lille y-akselilla:
    CONST num nHakuPisteY := 400;
    !Vakio hylsypinon sarakkeiden m��r�lle:
    CONST num nSarakkeetHylsy := 2;
    !Vakio hylsypinon rivien m��r�lle:
    CONST num nRivitHylsy := 2;
    !Vakio jolla m��ritell��n kappaleen leveys,
    !t�t� arvoa hy�dynnet��n valmistuotelavan matriisin leveyden laskennassa:
    CONST num nKappaleenLeveys := 200;
    !Vakio jolla m��ritell��n kappaleen pituus,
    !t�t� arvoa hy�dynnet��n valmistuotelavan matriisin pituuden laskennassa:
    CONST num nKappaleenPituus := 300;
    !Vakio kappaleiden kokonaism��r�lle, p��ohjelman while-silmukka toistetaan n�in monta kertaa:
    CONST num nKappaleet := 8;
    !Vakio valmistuotelavan matriisin suurimmalle sallitulle leveydelle,
    !t�m�n arvon perusteella m��ritet��n mahtuvatko kappaleet lavalle y-suunnassa:
    CONST num nMaxLeveys := 800;
    !Vakio valmistuotelavan matriisin suurimmalle sallitulle pituudelle,
    !t�m�n arvon perusteella m��ritet��n mahtuvatko kappaleet lavalle x-suunnassa:
    CONST num nMaxPituus := 1200;
    !Vakio valmistuotelavan sarakkeiden v�himm�ism��r�lle:
    CONST num nSarakkeetVientiMin := 2;
    !Vakio valmistuotelavan sarakkeiden suurimmalle sallitulle m��r�lle:
    CONST num nSarakkeetVientiMax := 4;
    
    !Station-osiosta synkronoidut paikkapisteet:
    CONST robtarget pvalipiste_haku:=[[100,150,755],[0.000000022,1,0,-0.000000005],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget phakupiste:=[[100,150,100],[0,1,0,0],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pvalipiste_keskus:=[[-1000,0,250],[0.001047185,0.000000822,-0.999999143,0.000785397],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pvientipiste_keskus:=[[0,0,100],[0.001047176,0.000000823,-0.999999143,0.000785397],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pvientipiste_pesu:=[[0,0,100],[0.000000006,0,1,0.000000005],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pvientipiste_mittaus:=[[0,0,100],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pvalipiste_valmislava:=[[150,100,755],[0.000000003,0.707133286,-0.707080276,-0.000000006],[0,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pvientipiste_valmislava:=[[150,100,100],[0.000000003,-0.707106692,0.707106871,0.000000006],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pkotipiste:=[[556.425290806,-22.063779947,1403.8958852],[0.012163802,-0.07692048,0.996956055,-0.003729011],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget phylsypino:=[[150,100,100],[0.000000012,0.707106772,0.70710679,0.000000008],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    PROC main()
        !Ajetaan robotti aluksi kotipisteeseen:
        koti;
        !Nollataan muuttujat:
        nollaa_muuttujat;
        !Kirjoitetaan Operator Window-n�kym��n tervehdysteksti:
        TPWrite "Aloitetaan!";
        !Pyydet��n k�ytt�j�lt� asetukset, n�m� vaiheet on kukin kommentoitu omissa aliohjelmissaan.
        asetukset;

        !Aloitetaan while-silmukka, joka jatkuu niin kauan kuin muuttuja nLaskuri on pienempi kuin nKappaleet muuttuja.
        !Silmukan aliohjelmien sis�lt� on kommentoitu kuhunkin aliohjelmaan.
        WHILE nLaskuri < nKappaleet DO
            !Kasvatetaan nLaskuri-muuttujan arvoa yhdell�:
            Incr nLaskuri;
            !Poimitaan kappale lavalta:
            haku;
            !Vied��n kappale ty�stett�v�ksi koneistuskeskukseen:
            keskus_vienti;
            !Haetaan valmis kappale koneistuksesta:
            keskus_haku;
            !Vied��n kappale pesuun, jos ne on asetuksissa m��ritelty pest�viksi koneistuksen j�lkeen:
            pesuri;
            !Mitataan kappale sen mukaan mik� mittausv�li kappaleille on m��ritelty asetuksissa.
            !Mik�li kappaleita ei ole m��ritelty mitattaviksi ollenkaan ne vied��n mittauspisteen ohi valmislavalle.
            mittaus;
        ENDWHILE
        
        !Silmukka p��ttyy kun laskuri on tullut t�yteen, k�yd��n l�pi lopetusrutiini:
        lopetus;

    ENDPROC
    
    PROC asetukset()
        !Pyydet��n ensin k�ytt�j�� antamaan sarakkeiden m��r� valmistuotelavan matriisissa:
        TPReadNum nSarakkeetVienti, "Kuinka monta saraketta matriisissa, 2-4?";
        !Tarkistetaan onko k�ytt�j�n antama arvo pienempi kuin ilmoitettu minimiarvo:
        IF nSarakkeetVienti < nSarakkeetVientiMin THEN
            !Mik�li annettu arvo on pienempi kuin ilmoitettu minimiarvo n�ytet��n virheilmoitus:
            TPWrite "Virheellinen arvo, k�ytet��n minimiarvoa "+ValToStr(nSarakkeetVientiMin)+".";
            !Ja asetetaan muuttujan arvoksi ennalta m��r�tty minimiarvo:
            nSarakkeetVienti := nSarakkeetVientiMin;
        !Jos nSarakkeetVienti-muuttujan arvo on  suurempi kuin ennalta m��r�tty minimiarvo
        !tarkistetaan onko k�ytt�j�n antama arvo suurempi kuin ilmoitettu maksimiarvo:
        ELSEIF nSarakkeetVienti > nSarakkeetVientiMax THEN
            !Mik�li annettu arvo on suurempi kuin ilmoitettu maksimiarvo n�ytet��n virheilmoitus:
            TPWrite "Virheellinen arvo, k�ytet��n maksimiarvoa "+ValToStr(nSarakkeetVientiMax)+".";
            !Ja asetetaan muuttujan arvoksi ennalta m��r�tty maksimiarvo:
            nSarakkeetVienti := nSarakkeetVientiMax;
        ENDIF
        
        !Lasketaan matriisin rivien m��r� jakamalla nKappaleet-muuttujan arvo nSarakkeetVienti-muuttujan arvolla
        !ja py�rist�m�ll� lopputulos l�himp��n tasalukuun yl�sp�in.
        nRivitVienti := Round (nKappaleet / nSarakkeetVienti);
        !Mik�li nSarakkeetVienti-muuttujan arvo on yht� suuri kuin nSarakkeetVientiMax-vakion arvo:
        IF nSarakkeetVienti = nSarakkeetVientiMax THEN
            !M��ritet��n sarakkeiden v�li y-akselilla, eli lavan lyhyell� sivulla 0 mm:iin jotta kappaleet mahtuvat lavalle kiinni toisiinsa:
            nValiY := 0;
        ELSE
            !Jos nSarakkeetVienti-muuttujan arvo on jotain muuta kuin nSarakkeetVientiMax-vakion arvo
            !kysyt��n sarakkeiden v�li.
            TPReadNum nValiY, "Sarakkeiden v�li, mm?";
            !Mik�li v�lin arvoksi on sy�tetty negatiivinen luku n�ytet��n virheilmoitus ja muutetaan v�liksi 0:
            IF nValiY < 0 THEN            
                TPWrite "Virhe, annettu negatiivinen arvo! Muutetaan arvoksi 0.";
                nValiY := 0;
            ENDIF
        ENDIF
        
        !Tarkistetaan matriisin leveys, t�m�kin aliohjelma on tarkemmin kommentoitu omassa koodissaan:
        leveyden_tarkistus;
        !Jos nSarakkeetVienti-muuttujan arvo on sama kuin nSarakkeetVientiMin-vakion arvo
        IF nSarakkeetVienti = nSarakkeetVientiMin THEN
            !M��ritet��n rivien v�liksi 0 mm jottei matriisista tulisi liian pitk�:
            nValiX := 0;
        ELSE !Muussa tapauksessa pyydet��n k�ytt�j�� antamaan matriisin rivien v�li millimetrein�:
            TPReadNum nValiX,"Rivien v�li matriisissa, mm?";
        ENDIF
        
        !Tarkistetaan ettei matriisista tule liian pitk�, ohjelman sis�lt� on kommentoitu omaan osaansa:
        pituuden_tarkistus;
        
        !Kysyt��n k�ytt�j�lt� pest��nk� osat koneistuksen j�lkeen, tallennetaan vastaus nPesu-muuttujaan.
        TPReadNum nPesu, "Pest��nk� osat koneistuksen j�lkeen? 0=Ei 1=Kyll�";
        !Jos nPesu-muuttujan arvoksi on sy�tetty negatiivinen luku n�ytet��n virheilmoitus ja muutetaan arvoksi 0:
        IF nPesu < 0 THEN
            TPWrite "Virhe, annettu negatiivinen arvo! Muutetaan arvoksi 0.";
            nPesu := 0;
        !Mik�li k�ytt�j�n antama luku on suurempi kuin yksi
        ELSEIF nPesu > 1 THEN
            !N�ytet��n virheilmoitus...
            TPWrite "Virheellinen arvo, oletetaan ett� pest��n osat...";
            !...ja asetetaan nPesu-muuttujan arvoksi 1.
            nPesu := 1;
        ENDIF
        
        !Kysyt��n k�ytt�j�lt� joka monesko kappale halutaan mitata, n�ytet��n suurimpana sallittuna arvona nKappaleet-vakion arvo:
        TPReadNum nMitattavat, "Joka monesko kappale mitataan, 0-"+ValToStr(nKappaleet)+"? 0=Ei Yht��n 1=Kaikki";
        !Mik�li k�ytt�j� on sy�tt�nyt negatiivisen luvun n�ytet��n virheilmoitus ja asetetaan arvoksi 0:
        IF nMitattavat < 0 THEN
            TPWrite "Virhe, annettu negatiivinen arvo! Muutetaan arvoksi 0.";
            nMitattavat := 0;
        !Mik�li annettu arvo on suurempi kuin nKappaleet-vakion arvo...
        ELSEIF nMitattavat > nKappaleet THEN
            !N�ytet��n virheilmoitus...
            TPWrite "Virheellinen arvo, mitataan vain viimeinen kappale.";
            !...ja asetetaan nMitattavat-muuttujan arvoksi nKappaleet-vakion arvo:
            nMitattavat := nKappaleet;
        ENDIF
        
    ENDPROC
    
    PROC leveyden_tarkistus()
        !Lasketaan nMatriisinLeveys-muuttujan arvoksi valmiskappalelavan sarakkeiden m��r� kertaa nKappaleenLeveys-vakion arvo,
        !tuloon lis�t��n sarakkeiden m��r�n ja niiden v�lien tulo, josta on v�hennetty yksi sarakkeiden v�lin mitta.
        !N�in matriisin leveyteen ei lasketa viimeisen sarakkeen j�lkeen sarakev�lin mittaa.
        nMatriisinLeveys := (nSarakkeetVienti * nKappaleenLeveys) + (nSarakkeetVienti * nValiY - nValiY);
        !Jos k�ytt�j�n antamalla sarakev�lill� matriisista tulisi valmistuotelavaa leve�mpi:
        IF nMatriisinLeveys > nMaxLeveys THEN
            !N�ytet��n virheilmoitus:
            TPWrite "Virhe, matriisi liian leve�!";
            TPWrite "Sovitetaan matriisin leveys suurimpaan sallittuun mittaan!";
            !Lasketaan sarakkeiden v�li kaavalla matriisin suurin sallittu leveys v�hennettyn� sarakkeiden ja kappaleen leveyden tulolla,
            !erotuksesta lasketaan osam��r� jakamalla se rivien m��r�ll� josta on v�hennetty yksi.
            nValiY := (nMaxLeveys-(nSarakkeetVienti*nKappaleenLeveys)) / (nSarakkeetVienti - 1);
            !Muutetaan sitten matriisin leveydeksi sarakkeiden ja kappaleen leveyden tulo
            !johon lis�t��n sarakkeiden m��r�n ja niiden v�lin tulo v�hennettyn� yhden v�lin arvolla.
            nMatriisinLeveys := (nSarakkeetVienti * nKappaleenLeveys) + (nSarakkeetVienti * nValiY - nValiY);
            !N�in matriisin leveyteen ei lasketa viimeist� kappaletta seuraavaa sarakkeiden v�li�.
        ENDIF
    ENDPROC
    
    PROC pituuden_tarkistus()
        !Lasketaan nMatriisinPituus-muuttujan arvoksi valmiskappalelavan rivien m��r� kertaa nKappaleenPituus-vakion arvo,
        !tuloon lis�t��n rivien m��r�n ja niiden v�lien tulo, josta on v�hennetty yksi rivien v�lin mitta.
        !N�in matriisin pituuteen ei lasketa viimeisen rivin j�lkeen riviv�lin mittaa.
        nMatriisinPituus := (nRivitVienti * nKappaleenPituus) + (nRivitVienti * nValiX - nValiX);
        !Jos k�ytt�j�n antamalla riviv�lill� matriisista tulisi valmistuotelavaa pidempi:
        IF nMatriisinPituus > nMaxPituus THEN
            !N�ytet��n virheilmoitus:
            TPWrite "Virhe, matriisi liian pitk�!";
            TPWrite "Sovitetaan matriisin pituus suurimpaan sallittuun mittaan!";
            !Lasketaan rivien v�li kaavalla matriisin suurin sallittu pituus v�hennettyn� rivien ja kappaleen pituuden tulolla,
            !erotuksesta lasketaan osam��r jakamalla se rivien m��r�ll� josta on v�hennetty yksi.
            nValiX := (nMaxPituus-(nRivitVienti*nKappaleenPituus)) / (nRivitVienti - 1);
            !Muutetaan sitten matriisin pituudeksi rivien ja kappaleen pituuden tulo
            !johon lis�t��n rivien m��r�n ja niiden v�lin tulo v�hennettyn� yhden v�lin arvolla.
            nMatriisinPituus := (nRivitVienti * nKappaleenPituus) + (nRivitVienti * nValiX - nValiX);
            !N�in matriisin pituuteen ei lasketa viimeist� kappaletta seuraavaa rivien v�li�.
        ENDIF
    ENDPROC
    
    PROC valipiste_haku()
        !Siirryt��n joint-liikkeell� maksiminopedella 200 mm s�teelle hakulavan v�lipisteest�:
        MoveJ pvalipiste_haku,vmax,z200,t_Imukuppi\WObj:=wInPallet;
    ENDPROC
    
    PROC valipiste_valmislava()
        !Siirryt��n joint-liikkeell� maksiminopeudella 200 mm s�teelle valmistuotelavan v�lipisteest�:
        MoveJ pvalipiste_valmislava,vmax,z200,t_Imukuppi\WObj:=wOutPallet;
    ENDPROC
    
    PROC valipiste_keskus()
        !Siirryt��n joint-liikkeell� 200 mm s�teelle ty�st�keskuksen v�lipisteest� maksiminopeudella:
        MoveJ pvalipiste_keskus,vmax,z200,t_Imukuppi\WObj:=wMillMachine;
    ENDPROC
    
    PROC haku()
        !N�ytet��n kuinka monetta kappaletta ollaan hakemassa k�ytt�en nLaskuri-muuttujan arvoa:
        TPWrite "Haetaan kappaletta "+ValToStr(nLaskuri)+".";
        !Ajetaan robotti hakulavan v�lipisteeseen:
        valipiste_haku;
        !Siirryt��n joint-liikkeell� 250 mm hakupisteen yl�puolelle maksiminopeudella,
        !paikkapisteen tarkkuus on 150 mm jotta robotin liikkeest� seuraavaan pisteeseen saadaan jouhevampi:
        MoveJ Offs(phakupiste,0,0,250),vmax,z150,t_Imukuppi\WObj:=wInPallet;
        !Siirryt��n lineaarisesti alasp�in hakupisteeseen
        !nopeudella 500 mm/s, paikkapisteen tarkkuus on fine
        !jotta robotin on siirrytt�v� todelliseen pisteeseen ennen seuraavan komennon suorittamista:
        MoveL phakupiste,v500,fine,t_Imukuppi\WObj:=wInPallet;
        !Annetaan imukuppitarraimelle k�sky tarttua kappaleeseen:
        Set do_Kiinnita;
        !Odotetaan puoli sekuntia jotta kappale ehtii tarttua kunnolla:
        WaitTime 0.5;
        !Siirryt��n lineaarisesti yl�sp�in 250 mm hakupisteen yl�puolelle:
        MoveL Offs(phakupiste,0,0,250),v500,z200,t_Imukuppi\WObj:=wInPallet;
        !Siirryt��n hakulavan v�lipisteeseen:
        valipiste_haku;
        !Lasketaan lopuksi uusi hakupisteen paikka seuraavalle kappaleelle:
        uusi_haku_piste;
    ENDPROC

    PROC keskus_vienti()
        !Siirryt��n keskuksen v�lipisteeseen:
        valipiste_keskus;
        !Siirryt��n lineaariliikkeell� 150 mm ty�st�keskuksen vientipisteen yl�puolelle,
        !liikenopeus 500 mm/s ja paikkapisteen tarkkuus 50 mm jotta seuraavasta liikkeest� saadaan jouheva:
        MoveL Offs (pvientipiste_keskus,0,0,150),v500,z50,t_Imukuppi\WObj:=wMillMachine;
        !Lasketaan lineaariliikkeell� nopeudella 200 mm/s kappale ty�st�keskuksen p�yd�lle,
        !paikkapisteen tarkkuus on fine, jotta robotti siirtyy todelliseen pisteeseen ennen seuraavan k�skyn suoritusta:
        MoveL pvientipiste_keskus,v200,fine,t_Imukuppi\WObj:=wMillMachine;
        !Vapautetaan kappale tarraimesta:
        Reset do_Kiinnita;
        !Odotetaan puoli sekuntia jotta kappale ehtii irrota:
        WaitTime 0.5;
        !Siirryt��n taas lineaariliikkeell� 150 mm ty�st�keskuksen vientipisteen yl�puolelle,
        !nopeus 500 mm/s ja paikkapisteen tarkkuus 50 mm jotta liikkeest� saadaan jouheva:
        MoveL Offs (pvientipiste_keskus,0,0,150),v500,z50,t_Imukuppi\WObj:=wMillMachine;
        !Siirryt��n lineaariliikkeell� ty�st�keskuksen v�lipisteeseen, nopeus 500 mm/s ja paikkapisteen tarkkuus fine.
        MoveL pvalipiste_keskus,v500,fine,t_Imukuppi\WObj:=wMillMachine;
        !Annetaan ty�st�keskukselle k�sky sulkea ovi:
        Set DO_CloseDoor;
        !Odotetaan puoli sekuntia:
        WaitTime 0.5;
        !N�ytet��n meneill��n oleva ty�vaihe Operator window-n�kym�ss�:
        TPWrite "Koneistetaan...";
    ENDPROC
    
    PROC keskus_haku()
        !Odotetaan ett� saadaan ty�st�keskukselta signaali ett� kappale on valmis:
        WaitDI DI_PartReady,1;
        !Vapautetaan ty�st�keskuksen oven sulkemissignaali:
        Reset DO_CloseDoor;
        !Odotetaan sekunti jotta keskuksen ovi ehtii aueta kokonaan:
        WaitTime 1;
        !Siirryt��n taas lineaariliikkeell� 150 mm ty�st�keskuksen vientipisteen yl�puolelle,
        !nopeus 500 mm/s ja paikkapisteen tarkkuus 50 mm jotta liikkeest� saadaan jouheva:
        MoveL Offs (pvientipiste_keskus,0,0,150),v500,z50,t_Imukuppi\WObj:=wMillMachine;
        !Lasketaan lineaariliikkeell� nopeudella 200 mm/s tarrain kiinni kappaleeseen,
        !paikkapisteen tarkkuus on fine, jotta robotti siirtyy todelliseen pisteeseen ennen seuraavan k�skyn suoritusta:
        MoveL pvientipiste_keskus,v200,fine,t_Imukuppi\WObj:=wMillMachine;
        !Annetaan tarraimelle k�sky tarttua kappaleeseen:
        Set do_Kiinnita;
        !Odotetaan puoli sekuntia jotta kappale ehtii kiinnitty� kunnolla:
        WaitTime 0.5;
        !Siirryt��n taas lineaariliikkeell� 150 mm ty�st�keskuksen vientipisteen yl�puolelle,
        !nopeus 500 mm/s ja paikkapisteen tarkkuus 50 mm jotta liikkeest� saadaan jouheva:
        MoveL Offs (pvientipiste_keskus,0,0,150),v500,z50,t_Imukuppi\WObj:=wMillMachine;
        !Siirryt��n lineaariliikkeell� 200 mm s�teelle ty�st�keskuksen v�lipisteest�, nopeus 500 mm/s.
        MoveL pvalipiste_keskus,v500,z200,t_Imukuppi\WObj:=wMillMachine;
    ENDPROC
    
    PROC pesuri()
        !Jos nPesu-muuttujan arvo on muuta kuin 0:
        IF nPesu <> 0 THEN
        !N�ytet��n ty�vaihe:
        TPWrite "Pest��n...";
        !Siirryt��n lineaariliikkeell� 100 mm pesurin vientipisteen yl�puolelle nopeudella 1000 mm/s, paikkapisteen tarkkuus 50 mm.
        MoveL Offs (pvientipiste_pesu,0,0,100),v1000,z50,t_Imukuppi\WObj:=wPesupoyta;
        !Lasketaan kappale lineaariliikkeell� pesurin vientipisteeseen nopeudella 500 mm/s,
        !tarkkuus fine jotta robotti siirtyy todelliseen pisteeseen ennen seuraavan k�skyn suoritusta:
        MoveL pvientipiste_pesu,v500,fine,t_Imukuppi\WObj:=wPesupoyta;
        !Vapautetaan kappaleen kiinnityssignaali:
        Reset do_Kiinnita;
        !Odotetaan puoli sekuntia jotta kappale ehtii irrota:
        WaitTime 0.5;
        !Siirryt��n lineaariliikkeell� 100 mm pesurin vientipisteen yl�puolelle nopeudella 500 mm/s, paikkapisteen tarkkuus 50 mm.
        MoveL Offs (pvientipiste_pesu,0,0,100),v500,z50,t_Imukuppi\WObj:=wPesupoyta;
        !Odotetaan 1 sekunti kappaleen "pesua":
        WaitTime 1;
        !Siirryt��n lineaariliikkeell� pesurin vientipisteeseen nopedella 500 mm/s, tarkkuus fine.
        MoveL pvientipiste_pesu,v500,fine,t_Imukuppi\WObj:=wPesupoyta;
        !Annetaan tarraimelle k�sky tarttua kappaleeseen:
        Set do_Kiinnita;
        !Odotetaan tartuntaa puoli sekuntia:
        WaitTime 0.5;
        !Siirryt��n lineaariliikkeell� 100 mm pesurin vientipisteen yl�puolelle nopeudella 500 mm/s, paikkapisteen tarkkuus 50 mm.
        MoveL Offs (pvientipiste_pesu,0,0,100),v500,z50,t_Imukuppi\WObj:=wPesupoyta;
        ENDIF
    ENDPROC
    
    PROC mittaus()
        !Mik�li nMitattavat-muutujan arvoksi on asetettu 0:
        IF nMitattavat = 0 THEN
            !Vied��n kappaleet mittaamatta valmislavalle:
            valmislava;
        ELSE !Mik�li muuttujan arvo on jotain muuta kuin 0 suoritetaan aliohjelma:
            !Jos nLaskuri-muuttujan arvon jakoj��nn�s nMitattavat-muuttujan arvolla on jotain muuta kuin 0:
            IF nLaskuri MOD nMitattavat <> 0 THEN
                !Vied��n kappale mittauksen ohi valmislavalle:
                valmislava;
            !Jos nLaskuri-muuttujan arvon jakoj��nn�s nMitattavat-muuttujan arvolla on 0:
            ELSEIF nLaskuri MOD nMitattavat = 0 THEN
                !N�ytet��n ty�vaihe:
                TPWrite "Mitataan...";
                !Siirryt��n lineaariliikkeell� 100 mm mittauksen vientipisteen yl�puolelle, nopeus 1000 mm/s ja tarkkuus 50 mm.
                MoveL Offs (pvientipiste_mittaus,0,0,100),v1000,z50,t_Imukuppi\WObj:=wMeasuringDevice;
                !Lasketaan kappale lineaariliikkeell� nopeudella 500 mm/s mittauslaitteen vientipisteeseen:
                MoveL pvientipiste_mittaus,v500,fine,t_Imukuppi\WObj:=wMeasuringDevice;
                !Vapautetaan kappaleen kiinnitys:
                Reset do_Kiinnita;
                !Odotetaan kappaleen irtoamista puoli sekuntia:
                WaitTime 0.5;
                !Siirryt��n lineaariliikkeell� 100 mm mittauksen vientipisteen yl�puolelle, nopeus 500 mm/s ja tarkkuus 50 mm.
                MoveL Offs (pvientipiste_mittaus,0,0,100),v500,z50,t_Imukuppi\WObj:=wMeasuringDevice;
                !Annetaan mittalaitteelle k�sky mitata kappale:
                Set do_Mittaa;
                !Odotetaan "mittausta 1 sekunti:
                WaitTime 1;
                !Laskeudutaan lineaariliikkeell� nopeudella 500 mm/s mittauslaitteen vientipisteeseen:
                MoveL pvientipiste_mittaus,v500,fine,t_Imukuppi\WObj:=wMeasuringDevice;
                !Annetaan tarraimelle k�sky kiinnitty� kappaleeseen:
                Set do_Kiinnita;
                !Odotetaan tartuntaa puoli sekuntia:
                WaitTime 0.5;
                !Siirryt��n lineaariliikkeell� 100 mm mittauksen vientipisteen yl�puolelle, nopeus 500 mm/s ja tarkkuus 50 mm.
                MoveL Offs (pvientipiste_mittaus,0,0,100),v500,z50,t_Imukuppi\WObj:=wMeasuringDevice;
                !Jos mittalaite antaa signaalin robotin tuloon di_Hylsy:
                    IF di_Hylsy = 1 THEN
                        !Kasvatetaan nHylsy-muuttujan arvoa yhdell�:
                        Incr nHylsy;
                        !Vied��n kappale hylsypinoon:
                        hylsy_vienti;
                    ELSE
                        !Mik�li mittalaite ei anna signaalia di_Hylsy-tuloon vied��n kappale valmistuotalavalle:
                        valmislava;
                    ENDIF
                !Nollataan mittalaitteelle annettu signaali mitata kappale:
                Reset do_Mittaa;
            ENDIF
        ENDIF
    ENDPROC
    
    PROC valmislava()
        !Kasvatetaan valmiiden kappaleiden laskuria yhdell�:
        Incr nValmisKappale;
        !Kerrotaan monesko kappale vied��n valmistuotelavalle:
        TPWrite "Vied��n valmis kappale "+ValToStr(nValmiskappale)+" valmislavalle";
        !Siirryt��n valmistuotelavan v�lipisteeseen:
        valipiste_valmislava;
        !Siirryt��n joint-liikkeell� 250 mm valmistuotelavan vientipisteen yl�puolelle,
        !nopeus 500 mm/s ja paikkapisteen tarkkuus 100 mm.
        MoveJ offs (pvientipiste_valmislava,0,0,250),v500,z100,t_Imukuppi\WObj:=wOutPallet;
        !Lasketaan lineaariliikkeell� kappale valmislavan vientipisteeseen, nopeus 500 mm/s ja tarkkuus fine.
        MoveL pvientipiste_valmislava,v500,fine,t_Imukuppi\WObj:=wOutPallet;
        !Vapautetaan kappaleen kiinnitys tarraimeen:
        Reset do_Kiinnita;
        !Odotetaan irtoamista puoli sekuntia:
        WaitTime 0.5;
        !Siirryt��n taas lineaariliikkeell� 250 mm valmistuotelavan vientipisteen yl�puolelle,
        !nopeus 500 mm/s ja pisteen tarkkuus 200 mm.
        MoveL offs (pvientipiste_valmislava,0,0,250),v500,z200,t_Imukuppi\WObj:=wOutPallet;
        !Siirryt��n valmistuotelavan v�lipisteeseen jottei t�rm�tt�isi seuraavassa liikkeess� mihink��n:
        valipiste_valmislava;
        !Siirryt��n keskuksen v�lipisteeseen:
        valipiste_keskus;
        !Lasketaan lopuksi uusi vientipiste matriisissa seuraavaa valmista kappaletta varten:
        uusi_vienti_piste;
    ENDPROC
    
    PROC koti()
        !Poistetaan corner path failure-varoitus k�yt�st� t�ss� aliohjelmassa
        !jottei saataisi turhia varoituksia seuraavan liikek�skyn puuttumisesta:
        CornerPathWarning FALSE;
        !Siirryt��n joint-liikkeell� kotipisteeseen nopeudella 5000 mm/s, tarkkuus fine.
        MoveJ pkotipiste,v5000,fine,t_Imukuppi\WObj:=wobj0;
    ENDPROC
    
    PROC hylsy_vienti()
        !Kerrotaan ett� vied��n kappaletta hylsypinoon:
        TPWrite "Vied��n kappale hylsypinoon...";
        !Siirryt��n lineaariliikkeell� maksiminopeudella 200 mm s�teelle ty�st�keskuksen v�lipisteest� jottei t�rm�tt�isi pesukoneeseen:
        MoveL pvalipiste_keskus,vmax,z200,t_Imukuppi\WObj:=wMillMachine;
        !Siirryt��n lineaariliikkeell� 250 mm hylsypinon vientipisteen yl�puolelle maksiminopeudella, paikkapisteen tarkkuus 100 mm.
        MoveL Offs (phylsypino,0,0,250),vmax,z100,t_Imukuppi\WObj:=wHylsypino;
        !Lasketaan lineaariliikkeell� kappale hylsypinoon, nopeus 500 mm/s ja pisteen tarkkuus fine:
        MoveL phylsypino,v500,fine,t_Imukuppi\WObj:=wHylsypino;
        !Vapautetaan kappaleen tartunta:
        Reset do_Kiinnita;
        !Odotetaan kappaleen irtoamista puoli sekuntia:
        WaitTime 0.5;
        !Siirryt��n lineaariliikkeell� 250 mm hylsypinon vientipisteen yl�puolelle nopeudella 500 mm/s paikkapisteen tarkkuus 100 mm. 
        MoveL Offs (phylsypino,0,0,250),v500,z100,t_Imukuppi\WObj:=wHylsypino;
        !Reset do_Mittaa;
        !Lasketaan uusi vientipiste seuraavalle hylsylle:
        uusi_hylsy_piste;
    ENDPROC
    
    PROC lopetus()
        !Siirryt��n kotipisteeseen:
        koti;
        !Kerrotaan ohjelman valmistumisesta ja ty�stettyjen kappaleiden m��r�:
        TPWrite "Valmis, ty�stettiin "+ValToStr(nKappaleet)+" kappaletta.";
        !Kerrotaan kuinka monta valmista kappaletta saatiin tehty�, ja kuinka monta hyl�ttiin mittauksessa:
        TPWrite "Valmiita kappaleita "+ValToStr(nValmisKappale)+", hylsyj� "+ValToStr(nHylsy)+".";
        !Mik�li hylsyj� oli enemm�n kuin valmiita kappaleita:
        IF nHylsy > nValmisKappale THEN
            !Ilmoitetaan k�ytt�j�lle ett� nyt ei menny ihan putkeen:
            TPWrite "Nyt ei menny niinku str�ms�ss�...";
        ENDIF
        !Nollataan ohjelman lopuksi muuttujien arvot jotta ne alkaisivat seuraavalla suorituskerralla alusta:
        nollaa_muuttujat;
    ENDPROC
    
    PROC uusi_haku_piste()
        !Asetetaan ensin nSarakeHaku-muuttujalle arvoksi nLaskuri-muuttujan jakoj��nn�s nSarakkeetHaku-vakion arvosta:
        nSarakeHaku := nLaskuri MOD nSarakkeetHaku;
        !Asetetaan sitten nRiviHaku-muuttujan arvoksi nLaskuri jaettuna nRivitHaku-vakion arvolla:
        nRiviHaku := nLaskuri DIV nRivitHaku;
        !Lasketaan nInPalletFrameX-muuttujan arvoksi pisteiden v�li kerrottuna nRiviHaku-muuttujan arvolla:
        nInPalletFrameX := nHakuPisteX * nRiviHaku;
        !Lasketaan nInPalletFrameY-muuttujan arvoksi pisteiden v�li kerrottuna nSarakeHaku-muuttujan arvolla:
        nInPalletFrameY := nHakuPisteY * nSarakeHaku;
        !Siirret��n wInPallet-workobjectin object framea x-akselilla nInPalletFrameX-muuttujan sis�ll�n verran:
        wInPallet.oframe.trans.x := nInPalletFrameX;
        !Siirret��n wInPallet-workobjectin object framea y-akselilla nInPalletFrameY-muuttujan sis�ll�n verran:
        wInPallet.oframe.trans.y := nInPalletFrameY;
        !wInPallet-workobjectin object framen paikka on nyt muutettu uuteen hakupisteeseen.
    ENDPROC
    
    PROC uusi_vienti_piste()
        !Asetetaan ensin nSarakeVienti-muuttujalle arvoksi nValmiskappale-muuttujan jakoj��nn�s nSarakkeetVienti-muuttujan arvosta:
        nSarakeVienti := nValmisKappale MOD nSarakkeetVienti;
        !Asetetaan sitten nRiviVienti-muuttujan arvoksi nValmisKappale jaettuna nSarakkeetVIenti-muuttujan arvolla:
        nRiviVienti := nValmisKappale DIV nSarakkeetVienti;
        !Lasketaan nOutPalletFrameX-muuttujan arvoksi rivien v�lin ja kappaleen pituuden summa kerrottuna nRiviVIenti-muuttujan arvolla:
        nOutPalletFrameX := (nValiX + nKappaleenPituus)*nRiviVienti;
        !Lasketaan nOutPalletFrameY-muuttujan arvoksi sarakkeiden v�lin ja kappaleen leveyden summa kerrottuna nSarakeVienti-muuttujan arvolla:
        nOutPalletFrameY := (nValiY + nKappaleenLeveys)*nSarakeVienti;
        !Siirret��n wOutPallet-workobjectin object framea x-akselilla nOutPalletFrameX-muuttujan sis�ll�n verran:
        wOutPallet.oframe.trans.x := nOutPalletFrameX;
        !Siirret��n wOutPallet-workobjectin object framea y-akselilla nOutPalletFrameY-muuttujan sis�ll�n verran:
        wOutPallet.oframe.trans.y := nOutPalletFrameY;
        !wOutPallet-workobjectin object framen paikka on nyt muutettu uuteen vientipisteeseen.
    ENDPROC
    
    PROC uusi_hylsy_piste()
        !Asetetaan nSarakeHylsy-muuttujalle arvoksi nHylsy-laskurin jakoj��nn�s nSarakkeetHylsy-vakion arvosta.
        nSarakeHylsy := nHylsy MOD nSarakkeetHylsy;
        !Asetetaan nRiviHylsy-muuttujan arvoksi nHylsy-laskurin arvo jaettuna nRivitHylsy-vakion arvolla.
        nRiviHylsy := nHylsy DIV nRivitHylsy;
        !Lasketaan nHylsyPinoFrameX-muuttujan arvoksi nKappaleenPituus-vakion arvo kerrottuna nRiviHylsy-muuttujan arvolla.
        nHylsyPinoFrameX := nKappaleenPituus*nRiviHylsy;
        !Lasketaan nHylsyPinoFrameY-muuttujan arvoksi nKappaleenLeveys-vakion arvo kerrottuna nSarakeHylsy-muuttujan arvolla.        
        nHylsyPinoFrameY := nKappaleenLeveys*nSarakeHylsy;
        !Siirret��n wHylsyPino-workobjectin object framea x-akselilla nHylsyPinoFrameX-muuttujan sis�ll�n verran:
        wHylsypino.oframe.trans.x := nHylsyPinoFrameX;
        !Siirret��n wHylsyPino-workobjectin object framea x-akselilla nHylsyPinoFrameX-muuttujan sis�ll�n verran:
        wHylsypino.oframe.trans.y := nHylsyPinoFrameY;
        !wHylsyPino-workobjectin object framen paikka on nyt muutettu uuteen vientipisteeseen.
    ENDPROC
    
    PROC nollaa_muuttujat()
        !Asetetaan muuttujat nollaksi jotta ne varmasti alkavat alusta, muistetaan my�s nollata kaikkien object framejen paikat:
        nLaskuri :=0;
        nHylsy :=0;
        nValmisKappale := 0;
        nSarakkeetVienti := 0;
        nRivitVienti := 0;
        nValiX := 0;
        nValiY := 0;
        nMatriisinLeveys := 0;
        nMatriisinPituus := 0;
        nMitattavat := 0;
        nPesu := 0;
        nSarakeHylsy := 0;
        nRiviHylsy := 0;
        nRiviHaku := 0;
        nSarakeHaku := 0;
        nRiviVienti := 0;
        nSarakeVienti := 0;
        nRiviHylsy := 0;
        nSarakeHylsy := 0;
        nInPalletFrameX := 0;
        nInPalletFrameY := 0;
        nOutPalletFrameX := 0;
        nOutPalletFrameY := 0;
        nHylsyPinoFrameX := 0;
        nHylsyPinoFrameY := 0;
        wInPallet.oframe.trans.x := 0;
        wInPallet.oframe.trans.y := 0;
        wOutPallet.oframe.trans.x := 0;
        wOutPallet.oframe.trans.y := 0;
        wHylsypino.oframe.trans.x := 0;
        wHylsypino.oframe.trans.y := 0;
    ENDPROC

ENDMODULE