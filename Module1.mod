MODULE Module1
    !Julistetaan ensimmäiseksi kaikki muuttujat ja vakiot:
    !Muuttuja pääohjelman silmukan suorituskertoja varten:
    VAR num nLaskuri;
    !Muuttuja hylättyjen kappaleiden lukumäärälle:
    VAR num nHylsy;
    !Muuttuja valmiiden kappaleiden lukumäärälle:
    VAR num nValmisKappale;
    !Muuttuja valmistuotelavan sarakkeiden määrälle:
    VAR num nSarakkeetVienti;
    !Muuttuja valmistuotelavan rivien määrälle:
    VAR num nRivitVienti;
    !Muuttuja valmistuotelavan rivien välille:
    VAR num nValiX;
    !Muuttuja valmistuotelavan sarakkeiden välille:
    VAR num nValiY;
    !Muuttuja valmistuotelavan matriisin kokonaisleveyttä varten,
    !tämän arvon perusteella määritetään mahtuvatko kappaleet lavalle rinnakkain:
    VAR num nMatriisinLeveys;
    !Muuttuja valmistuotelavan matriisin kokonaispituutta varten,
    !tämän arvon perusteella määritetään mahtuvatko kappaleet lavalle peräkkäin:
    VAR num nMatriisinPituus;
    !Muuttuja jolla määritetään joka monesko kappale mitataan koneituksen jälkeen:
    VAR num nMitattavat;
    !Muuttuja jolla määritetään pestäänkö kappaleet koneistuksen jälkeen:
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
    
    !Vakio hakulavan sarakkeiden määrälle:
    CONST num nSarakkeetHaku := 2;
    !Vakio jota käytetään hakupisteen paikan laskemiselle x-suunnassa,
    !todellisuudessa matriisissa on 4 riviä mutta itselleni on helpompaa
    !mieltää mitä asiaa ollaan laskemassa kun arvo on nimetty näin:
    CONST num nRivitHaku := 2;
    !Vakio hakupisteiden välille x-akselilla:
    CONST num nHakuPisteX := 300;
    !Vakio hakupisteiden välille y-akselilla:
    CONST num nHakuPisteY := 400;
    !Vakio hylsypinon sarakkeiden määrälle:
    CONST num nSarakkeetHylsy := 2;
    !Vakio hylsypinon rivien määrälle:
    CONST num nRivitHylsy := 2;
    !Vakio jolla määritellään kappaleen leveys,
    !tätä arvoa hyödynnetään valmistuotelavan matriisin leveyden laskennassa:
    CONST num nKappaleenLeveys := 200;
    !Vakio jolla määritellään kappaleen pituus,
    !tätä arvoa hyödynnetään valmistuotelavan matriisin pituuden laskennassa:
    CONST num nKappaleenPituus := 300;
    !Vakio kappaleiden kokonaismäärälle, pääohjelman while-silmukka toistetaan näin monta kertaa:
    CONST num nKappaleet := 8;
    !Vakio valmistuotelavan matriisin suurimmalle sallitulle leveydelle,
    !tämän arvon perusteella määritetään mahtuvatko kappaleet lavalle y-suunnassa:
    CONST num nMaxLeveys := 800;
    !Vakio valmistuotelavan matriisin suurimmalle sallitulle pituudelle,
    !tämän arvon perusteella määritetään mahtuvatko kappaleet lavalle x-suunnassa:
    CONST num nMaxPituus := 1200;
    !Vakio valmistuotelavan sarakkeiden vähimmäismäärälle:
    CONST num nSarakkeetVientiMin := 2;
    !Vakio valmistuotelavan sarakkeiden suurimmalle sallitulle määrälle:
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
        !Kirjoitetaan Operator Window-näkymään tervehdysteksti:
        TPWrite "Aloitetaan!";
        !Pyydetään käyttäjältä asetukset, nämä vaiheet on kukin kommentoitu omissa aliohjelmissaan.
        asetukset;

        !Aloitetaan while-silmukka, joka jatkuu niin kauan kuin muuttuja nLaskuri on pienempi kuin nKappaleet muuttuja.
        !Silmukan aliohjelmien sisältö on kommentoitu kuhunkin aliohjelmaan.
        WHILE nLaskuri < nKappaleet DO
            !Kasvatetaan nLaskuri-muuttujan arvoa yhdellä:
            Incr nLaskuri;
            !Poimitaan kappale lavalta:
            haku;
            !Viedään kappale työstettäväksi koneistuskeskukseen:
            keskus_vienti;
            !Haetaan valmis kappale koneistuksesta:
            keskus_haku;
            !Viedään kappale pesuun, jos ne on asetuksissa määritelty pestäviksi koneistuksen jälkeen:
            pesuri;
            !Mitataan kappale sen mukaan mikä mittausväli kappaleille on määritelty asetuksissa.
            !Mikäli kappaleita ei ole määritelty mitattaviksi ollenkaan ne viedään mittauspisteen ohi valmislavalle.
            mittaus;
        ENDWHILE
        
        !Silmukka päättyy kun laskuri on tullut täyteen, käydään läpi lopetusrutiini:
        lopetus;

    ENDPROC
    
    PROC asetukset()
        !Pyydetään ensin käyttäjää antamaan sarakkeiden määrä valmistuotelavan matriisissa:
        TPReadNum nSarakkeetVienti, "Kuinka monta saraketta matriisissa, 2-4?";
        !Tarkistetaan onko käyttäjän antama arvo pienempi kuin ilmoitettu minimiarvo:
        IF nSarakkeetVienti < nSarakkeetVientiMin THEN
            !Mikäli annettu arvo on pienempi kuin ilmoitettu minimiarvo näytetään virheilmoitus:
            TPWrite "Virheellinen arvo, käytetään minimiarvoa "+ValToStr(nSarakkeetVientiMin)+".";
            !Ja asetetaan muuttujan arvoksi ennalta määrätty minimiarvo:
            nSarakkeetVienti := nSarakkeetVientiMin;
        !Jos nSarakkeetVienti-muuttujan arvo on  suurempi kuin ennalta määrätty minimiarvo
        !tarkistetaan onko käyttäjän antama arvo suurempi kuin ilmoitettu maksimiarvo:
        ELSEIF nSarakkeetVienti > nSarakkeetVientiMax THEN
            !Mikäli annettu arvo on suurempi kuin ilmoitettu maksimiarvo näytetään virheilmoitus:
            TPWrite "Virheellinen arvo, käytetään maksimiarvoa "+ValToStr(nSarakkeetVientiMax)+".";
            !Ja asetetaan muuttujan arvoksi ennalta määrätty maksimiarvo:
            nSarakkeetVienti := nSarakkeetVientiMax;
        ENDIF
        
        !Lasketaan matriisin rivien määrä jakamalla nKappaleet-muuttujan arvo nSarakkeetVienti-muuttujan arvolla
        !ja pyöristämällä lopputulos lähimpään tasalukuun ylöspäin.
        nRivitVienti := Round (nKappaleet / nSarakkeetVienti);
        !Mikäli nSarakkeetVienti-muuttujan arvo on yhtä suuri kuin nSarakkeetVientiMax-vakion arvo:
        IF nSarakkeetVienti = nSarakkeetVientiMax THEN
            !Määritetään sarakkeiden väli y-akselilla, eli lavan lyhyellä sivulla 0 mm:iin jotta kappaleet mahtuvat lavalle kiinni toisiinsa:
            nValiY := 0;
        ELSE
            !Jos nSarakkeetVienti-muuttujan arvo on jotain muuta kuin nSarakkeetVientiMax-vakion arvo
            !kysytään sarakkeiden väli.
            TPReadNum nValiY, "Sarakkeiden väli, mm?";
            !Mikäli välin arvoksi on syötetty negatiivinen luku näytetään virheilmoitus ja muutetaan väliksi 0:
            IF nValiY < 0 THEN            
                TPWrite "Virhe, annettu negatiivinen arvo! Muutetaan arvoksi 0.";
                nValiY := 0;
            ENDIF
        ENDIF
        
        !Tarkistetaan matriisin leveys, tämäkin aliohjelma on tarkemmin kommentoitu omassa koodissaan:
        leveyden_tarkistus;
        !Jos nSarakkeetVienti-muuttujan arvo on sama kuin nSarakkeetVientiMin-vakion arvo
        IF nSarakkeetVienti = nSarakkeetVientiMin THEN
            !Määritetään rivien väliksi 0 mm jottei matriisista tulisi liian pitkä:
            nValiX := 0;
        ELSE !Muussa tapauksessa pyydetään käyttäjää antamaan matriisin rivien väli millimetreinä:
            TPReadNum nValiX,"Rivien väli matriisissa, mm?";
        ENDIF
        
        !Tarkistetaan ettei matriisista tule liian pitkä, ohjelman sisältö on kommentoitu omaan osaansa:
        pituuden_tarkistus;
        
        !Kysytään käyttäjältä pestäänkö osat koneistuksen jälkeen, tallennetaan vastaus nPesu-muuttujaan.
        TPReadNum nPesu, "Pestäänkö osat koneistuksen jälkeen? 0=Ei 1=Kyllä";
        !Jos nPesu-muuttujan arvoksi on syötetty negatiivinen luku näytetään virheilmoitus ja muutetaan arvoksi 0:
        IF nPesu < 0 THEN
            TPWrite "Virhe, annettu negatiivinen arvo! Muutetaan arvoksi 0.";
            nPesu := 0;
        !Mikäli käyttäjän antama luku on suurempi kuin yksi
        ELSEIF nPesu > 1 THEN
            !Näytetään virheilmoitus...
            TPWrite "Virheellinen arvo, oletetaan että pestään osat...";
            !...ja asetetaan nPesu-muuttujan arvoksi 1.
            nPesu := 1;
        ENDIF
        
        !Kysytään käyttäjältä joka monesko kappale halutaan mitata, näytetään suurimpana sallittuna arvona nKappaleet-vakion arvo:
        TPReadNum nMitattavat, "Joka monesko kappale mitataan, 0-"+ValToStr(nKappaleet)+"? 0=Ei Yhtään 1=Kaikki";
        !Mikäli käyttäjä on syöttänyt negatiivisen luvun näytetään virheilmoitus ja asetetaan arvoksi 0:
        IF nMitattavat < 0 THEN
            TPWrite "Virhe, annettu negatiivinen arvo! Muutetaan arvoksi 0.";
            nMitattavat := 0;
        !Mikäli annettu arvo on suurempi kuin nKappaleet-vakion arvo...
        ELSEIF nMitattavat > nKappaleet THEN
            !Näytetään virheilmoitus...
            TPWrite "Virheellinen arvo, mitataan vain viimeinen kappale.";
            !...ja asetetaan nMitattavat-muuttujan arvoksi nKappaleet-vakion arvo:
            nMitattavat := nKappaleet;
        ENDIF
        
    ENDPROC
    
    PROC leveyden_tarkistus()
        !Lasketaan nMatriisinLeveys-muuttujan arvoksi valmiskappalelavan sarakkeiden määrä kertaa nKappaleenLeveys-vakion arvo,
        !tuloon lisätään sarakkeiden määrän ja niiden välien tulo, josta on vähennetty yksi sarakkeiden välin mitta.
        !Näin matriisin leveyteen ei lasketa viimeisen sarakkeen jälkeen sarakevälin mittaa.
        nMatriisinLeveys := (nSarakkeetVienti * nKappaleenLeveys) + (nSarakkeetVienti * nValiY - nValiY);
        !Jos käyttäjän antamalla sarakevälillä matriisista tulisi valmistuotelavaa leveämpi:
        IF nMatriisinLeveys > nMaxLeveys THEN
            !Näytetään virheilmoitus:
            TPWrite "Virhe, matriisi liian leveä!";
            TPWrite "Sovitetaan matriisin leveys suurimpaan sallittuun mittaan!";
            !Lasketaan sarakkeiden väli kaavalla matriisin suurin sallittu leveys vähennettynä sarakkeiden ja kappaleen leveyden tulolla,
            !erotuksesta lasketaan osamäärä jakamalla se rivien määrällä josta on vähennetty yksi.
            nValiY := (nMaxLeveys-(nSarakkeetVienti*nKappaleenLeveys)) / (nSarakkeetVienti - 1);
            !Muutetaan sitten matriisin leveydeksi sarakkeiden ja kappaleen leveyden tulo
            !johon lisätään sarakkeiden määrän ja niiden välin tulo vähennettynä yhden välin arvolla.
            nMatriisinLeveys := (nSarakkeetVienti * nKappaleenLeveys) + (nSarakkeetVienti * nValiY - nValiY);
            !Näin matriisin leveyteen ei lasketa viimeistä kappaletta seuraavaa sarakkeiden väliä.
        ENDIF
    ENDPROC
    
    PROC pituuden_tarkistus()
        !Lasketaan nMatriisinPituus-muuttujan arvoksi valmiskappalelavan rivien määrä kertaa nKappaleenPituus-vakion arvo,
        !tuloon lisätään rivien määrän ja niiden välien tulo, josta on vähennetty yksi rivien välin mitta.
        !Näin matriisin pituuteen ei lasketa viimeisen rivin jälkeen rivivälin mittaa.
        nMatriisinPituus := (nRivitVienti * nKappaleenPituus) + (nRivitVienti * nValiX - nValiX);
        !Jos käyttäjän antamalla rivivälillä matriisista tulisi valmistuotelavaa pidempi:
        IF nMatriisinPituus > nMaxPituus THEN
            !Näytetään virheilmoitus:
            TPWrite "Virhe, matriisi liian pitkä!";
            TPWrite "Sovitetaan matriisin pituus suurimpaan sallittuun mittaan!";
            !Lasketaan rivien väli kaavalla matriisin suurin sallittu pituus vähennettynä rivien ja kappaleen pituuden tulolla,
            !erotuksesta lasketaan osamäär jakamalla se rivien määrällä josta on vähennetty yksi.
            nValiX := (nMaxPituus-(nRivitVienti*nKappaleenPituus)) / (nRivitVienti - 1);
            !Muutetaan sitten matriisin pituudeksi rivien ja kappaleen pituuden tulo
            !johon lisätään rivien määrän ja niiden välin tulo vähennettynä yhden välin arvolla.
            nMatriisinPituus := (nRivitVienti * nKappaleenPituus) + (nRivitVienti * nValiX - nValiX);
            !Näin matriisin pituuteen ei lasketa viimeistä kappaletta seuraavaa rivien väliä.
        ENDIF
    ENDPROC
    
    PROC valipiste_haku()
        !Siirrytään joint-liikkeellä maksiminopedella 200 mm säteelle hakulavan välipisteestä:
        MoveJ pvalipiste_haku,vmax,z200,t_Imukuppi\WObj:=wInPallet;
    ENDPROC
    
    PROC valipiste_valmislava()
        !Siirrytään joint-liikkeellä maksiminopeudella 200 mm säteelle valmistuotelavan välipisteestä:
        MoveJ pvalipiste_valmislava,vmax,z200,t_Imukuppi\WObj:=wOutPallet;
    ENDPROC
    
    PROC valipiste_keskus()
        !Siirrytään joint-liikkeellä 200 mm säteelle työstökeskuksen välipisteestä maksiminopeudella:
        MoveJ pvalipiste_keskus,vmax,z200,t_Imukuppi\WObj:=wMillMachine;
    ENDPROC
    
    PROC haku()
        !Näytetään kuinka monetta kappaletta ollaan hakemassa käyttäen nLaskuri-muuttujan arvoa:
        TPWrite "Haetaan kappaletta "+ValToStr(nLaskuri)+".";
        !Ajetaan robotti hakulavan välipisteeseen:
        valipiste_haku;
        !Siirrytään joint-liikkeellä 250 mm hakupisteen yläpuolelle maksiminopeudella,
        !paikkapisteen tarkkuus on 150 mm jotta robotin liikkeestä seuraavaan pisteeseen saadaan jouhevampi:
        MoveJ Offs(phakupiste,0,0,250),vmax,z150,t_Imukuppi\WObj:=wInPallet;
        !Siirrytään lineaarisesti alaspäin hakupisteeseen
        !nopeudella 500 mm/s, paikkapisteen tarkkuus on fine
        !jotta robotin on siirryttävä todelliseen pisteeseen ennen seuraavan komennon suorittamista:
        MoveL phakupiste,v500,fine,t_Imukuppi\WObj:=wInPallet;
        !Annetaan imukuppitarraimelle käsky tarttua kappaleeseen:
        Set do_Kiinnita;
        !Odotetaan puoli sekuntia jotta kappale ehtii tarttua kunnolla:
        WaitTime 0.5;
        !Siirrytään lineaarisesti ylöspäin 250 mm hakupisteen yläpuolelle:
        MoveL Offs(phakupiste,0,0,250),v500,z200,t_Imukuppi\WObj:=wInPallet;
        !Siirrytään hakulavan välipisteeseen:
        valipiste_haku;
        !Lasketaan lopuksi uusi hakupisteen paikka seuraavalle kappaleelle:
        uusi_haku_piste;
    ENDPROC

    PROC keskus_vienti()
        !Siirrytään keskuksen välipisteeseen:
        valipiste_keskus;
        !Siirrytään lineaariliikkeellä 150 mm työstökeskuksen vientipisteen yläpuolelle,
        !liikenopeus 500 mm/s ja paikkapisteen tarkkuus 50 mm jotta seuraavasta liikkeestä saadaan jouheva:
        MoveL Offs (pvientipiste_keskus,0,0,150),v500,z50,t_Imukuppi\WObj:=wMillMachine;
        !Lasketaan lineaariliikkeellä nopeudella 200 mm/s kappale työstökeskuksen pöydälle,
        !paikkapisteen tarkkuus on fine, jotta robotti siirtyy todelliseen pisteeseen ennen seuraavan käskyn suoritusta:
        MoveL pvientipiste_keskus,v200,fine,t_Imukuppi\WObj:=wMillMachine;
        !Vapautetaan kappale tarraimesta:
        Reset do_Kiinnita;
        !Odotetaan puoli sekuntia jotta kappale ehtii irrota:
        WaitTime 0.5;
        !Siirrytään taas lineaariliikkeellä 150 mm työstökeskuksen vientipisteen yläpuolelle,
        !nopeus 500 mm/s ja paikkapisteen tarkkuus 50 mm jotta liikkeestä saadaan jouheva:
        MoveL Offs (pvientipiste_keskus,0,0,150),v500,z50,t_Imukuppi\WObj:=wMillMachine;
        !Siirrytään lineaariliikkeellä työstökeskuksen välipisteeseen, nopeus 500 mm/s ja paikkapisteen tarkkuus fine.
        MoveL pvalipiste_keskus,v500,fine,t_Imukuppi\WObj:=wMillMachine;
        !Annetaan työstökeskukselle käsky sulkea ovi:
        Set DO_CloseDoor;
        !Odotetaan puoli sekuntia:
        WaitTime 0.5;
        !Näytetään meneillään oleva työvaihe Operator window-näkymässä:
        TPWrite "Koneistetaan...";
    ENDPROC
    
    PROC keskus_haku()
        !Odotetaan että saadaan työstökeskukselta signaali että kappale on valmis:
        WaitDI DI_PartReady,1;
        !Vapautetaan työstökeskuksen oven sulkemissignaali:
        Reset DO_CloseDoor;
        !Odotetaan sekunti jotta keskuksen ovi ehtii aueta kokonaan:
        WaitTime 1;
        !Siirrytään taas lineaariliikkeellä 150 mm työstökeskuksen vientipisteen yläpuolelle,
        !nopeus 500 mm/s ja paikkapisteen tarkkuus 50 mm jotta liikkeestä saadaan jouheva:
        MoveL Offs (pvientipiste_keskus,0,0,150),v500,z50,t_Imukuppi\WObj:=wMillMachine;
        !Lasketaan lineaariliikkeellä nopeudella 200 mm/s tarrain kiinni kappaleeseen,
        !paikkapisteen tarkkuus on fine, jotta robotti siirtyy todelliseen pisteeseen ennen seuraavan käskyn suoritusta:
        MoveL pvientipiste_keskus,v200,fine,t_Imukuppi\WObj:=wMillMachine;
        !Annetaan tarraimelle käsky tarttua kappaleeseen:
        Set do_Kiinnita;
        !Odotetaan puoli sekuntia jotta kappale ehtii kiinnittyä kunnolla:
        WaitTime 0.5;
        !Siirrytään taas lineaariliikkeellä 150 mm työstökeskuksen vientipisteen yläpuolelle,
        !nopeus 500 mm/s ja paikkapisteen tarkkuus 50 mm jotta liikkeestä saadaan jouheva:
        MoveL Offs (pvientipiste_keskus,0,0,150),v500,z50,t_Imukuppi\WObj:=wMillMachine;
        !Siirrytään lineaariliikkeellä 200 mm säteelle työstökeskuksen välipisteestä, nopeus 500 mm/s.
        MoveL pvalipiste_keskus,v500,z200,t_Imukuppi\WObj:=wMillMachine;
    ENDPROC
    
    PROC pesuri()
        !Jos nPesu-muuttujan arvo on muuta kuin 0:
        IF nPesu <> 0 THEN
        !Näytetään työvaihe:
        TPWrite "Pestään...";
        !Siirrytään lineaariliikkeellä 100 mm pesurin vientipisteen yläpuolelle nopeudella 1000 mm/s, paikkapisteen tarkkuus 50 mm.
        MoveL Offs (pvientipiste_pesu,0,0,100),v1000,z50,t_Imukuppi\WObj:=wPesupoyta;
        !Lasketaan kappale lineaariliikkeellä pesurin vientipisteeseen nopeudella 500 mm/s,
        !tarkkuus fine jotta robotti siirtyy todelliseen pisteeseen ennen seuraavan käskyn suoritusta:
        MoveL pvientipiste_pesu,v500,fine,t_Imukuppi\WObj:=wPesupoyta;
        !Vapautetaan kappaleen kiinnityssignaali:
        Reset do_Kiinnita;
        !Odotetaan puoli sekuntia jotta kappale ehtii irrota:
        WaitTime 0.5;
        !Siirrytään lineaariliikkeellä 100 mm pesurin vientipisteen yläpuolelle nopeudella 500 mm/s, paikkapisteen tarkkuus 50 mm.
        MoveL Offs (pvientipiste_pesu,0,0,100),v500,z50,t_Imukuppi\WObj:=wPesupoyta;
        !Odotetaan 1 sekunti kappaleen "pesua":
        WaitTime 1;
        !Siirrytään lineaariliikkeellä pesurin vientipisteeseen nopedella 500 mm/s, tarkkuus fine.
        MoveL pvientipiste_pesu,v500,fine,t_Imukuppi\WObj:=wPesupoyta;
        !Annetaan tarraimelle käsky tarttua kappaleeseen:
        Set do_Kiinnita;
        !Odotetaan tartuntaa puoli sekuntia:
        WaitTime 0.5;
        !Siirrytään lineaariliikkeellä 100 mm pesurin vientipisteen yläpuolelle nopeudella 500 mm/s, paikkapisteen tarkkuus 50 mm.
        MoveL Offs (pvientipiste_pesu,0,0,100),v500,z50,t_Imukuppi\WObj:=wPesupoyta;
        ENDIF
    ENDPROC
    
    PROC mittaus()
        !Mikäli nMitattavat-muutujan arvoksi on asetettu 0:
        IF nMitattavat = 0 THEN
            !Viedään kappaleet mittaamatta valmislavalle:
            valmislava;
        ELSE !Mikäli muuttujan arvo on jotain muuta kuin 0 suoritetaan aliohjelma:
            !Jos nLaskuri-muuttujan arvon jakojäännös nMitattavat-muuttujan arvolla on jotain muuta kuin 0:
            IF nLaskuri MOD nMitattavat <> 0 THEN
                !Viedään kappale mittauksen ohi valmislavalle:
                valmislava;
            !Jos nLaskuri-muuttujan arvon jakojäännös nMitattavat-muuttujan arvolla on 0:
            ELSEIF nLaskuri MOD nMitattavat = 0 THEN
                !Näytetään työvaihe:
                TPWrite "Mitataan...";
                !Siirrytään lineaariliikkeellä 100 mm mittauksen vientipisteen yläpuolelle, nopeus 1000 mm/s ja tarkkuus 50 mm.
                MoveL Offs (pvientipiste_mittaus,0,0,100),v1000,z50,t_Imukuppi\WObj:=wMeasuringDevice;
                !Lasketaan kappale lineaariliikkeellä nopeudella 500 mm/s mittauslaitteen vientipisteeseen:
                MoveL pvientipiste_mittaus,v500,fine,t_Imukuppi\WObj:=wMeasuringDevice;
                !Vapautetaan kappaleen kiinnitys:
                Reset do_Kiinnita;
                !Odotetaan kappaleen irtoamista puoli sekuntia:
                WaitTime 0.5;
                !Siirrytään lineaariliikkeellä 100 mm mittauksen vientipisteen yläpuolelle, nopeus 500 mm/s ja tarkkuus 50 mm.
                MoveL Offs (pvientipiste_mittaus,0,0,100),v500,z50,t_Imukuppi\WObj:=wMeasuringDevice;
                !Annetaan mittalaitteelle käsky mitata kappale:
                Set do_Mittaa;
                !Odotetaan "mittausta 1 sekunti:
                WaitTime 1;
                !Laskeudutaan lineaariliikkeellä nopeudella 500 mm/s mittauslaitteen vientipisteeseen:
                MoveL pvientipiste_mittaus,v500,fine,t_Imukuppi\WObj:=wMeasuringDevice;
                !Annetaan tarraimelle käsky kiinnittyä kappaleeseen:
                Set do_Kiinnita;
                !Odotetaan tartuntaa puoli sekuntia:
                WaitTime 0.5;
                !Siirrytään lineaariliikkeellä 100 mm mittauksen vientipisteen yläpuolelle, nopeus 500 mm/s ja tarkkuus 50 mm.
                MoveL Offs (pvientipiste_mittaus,0,0,100),v500,z50,t_Imukuppi\WObj:=wMeasuringDevice;
                !Jos mittalaite antaa signaalin robotin tuloon di_Hylsy:
                    IF di_Hylsy = 1 THEN
                        !Kasvatetaan nHylsy-muuttujan arvoa yhdellä:
                        Incr nHylsy;
                        !Viedään kappale hylsypinoon:
                        hylsy_vienti;
                    ELSE
                        !Mikäli mittalaite ei anna signaalia di_Hylsy-tuloon viedään kappale valmistuotalavalle:
                        valmislava;
                    ENDIF
                !Nollataan mittalaitteelle annettu signaali mitata kappale:
                Reset do_Mittaa;
            ENDIF
        ENDIF
    ENDPROC
    
    PROC valmislava()
        !Kasvatetaan valmiiden kappaleiden laskuria yhdellä:
        Incr nValmisKappale;
        !Kerrotaan monesko kappale viedään valmistuotelavalle:
        TPWrite "Viedään valmis kappale "+ValToStr(nValmiskappale)+" valmislavalle";
        !Siirrytään valmistuotelavan välipisteeseen:
        valipiste_valmislava;
        !Siirrytään joint-liikkeellä 250 mm valmistuotelavan vientipisteen yläpuolelle,
        !nopeus 500 mm/s ja paikkapisteen tarkkuus 100 mm.
        MoveJ offs (pvientipiste_valmislava,0,0,250),v500,z100,t_Imukuppi\WObj:=wOutPallet;
        !Lasketaan lineaariliikkeellä kappale valmislavan vientipisteeseen, nopeus 500 mm/s ja tarkkuus fine.
        MoveL pvientipiste_valmislava,v500,fine,t_Imukuppi\WObj:=wOutPallet;
        !Vapautetaan kappaleen kiinnitys tarraimeen:
        Reset do_Kiinnita;
        !Odotetaan irtoamista puoli sekuntia:
        WaitTime 0.5;
        !Siirrytään taas lineaariliikkeellä 250 mm valmistuotelavan vientipisteen yläpuolelle,
        !nopeus 500 mm/s ja pisteen tarkkuus 200 mm.
        MoveL offs (pvientipiste_valmislava,0,0,250),v500,z200,t_Imukuppi\WObj:=wOutPallet;
        !Siirrytään valmistuotelavan välipisteeseen jottei törmättäisi seuraavassa liikkeessä mihinkään:
        valipiste_valmislava;
        !Siirrytään keskuksen välipisteeseen:
        valipiste_keskus;
        !Lasketaan lopuksi uusi vientipiste matriisissa seuraavaa valmista kappaletta varten:
        uusi_vienti_piste;
    ENDPROC
    
    PROC koti()
        !Poistetaan corner path failure-varoitus käytöstä tässä aliohjelmassa
        !jottei saataisi turhia varoituksia seuraavan liikekäskyn puuttumisesta:
        CornerPathWarning FALSE;
        !Siirrytään joint-liikkeellä kotipisteeseen nopeudella 5000 mm/s, tarkkuus fine.
        MoveJ pkotipiste,v5000,fine,t_Imukuppi\WObj:=wobj0;
    ENDPROC
    
    PROC hylsy_vienti()
        !Kerrotaan että viedään kappaletta hylsypinoon:
        TPWrite "Viedään kappale hylsypinoon...";
        !Siirrytään lineaariliikkeellä maksiminopeudella 200 mm säteelle työstökeskuksen välipisteestä jottei törmättäisi pesukoneeseen:
        MoveL pvalipiste_keskus,vmax,z200,t_Imukuppi\WObj:=wMillMachine;
        !Siirrytään lineaariliikkeellä 250 mm hylsypinon vientipisteen yläpuolelle maksiminopeudella, paikkapisteen tarkkuus 100 mm.
        MoveL Offs (phylsypino,0,0,250),vmax,z100,t_Imukuppi\WObj:=wHylsypino;
        !Lasketaan lineaariliikkeellä kappale hylsypinoon, nopeus 500 mm/s ja pisteen tarkkuus fine:
        MoveL phylsypino,v500,fine,t_Imukuppi\WObj:=wHylsypino;
        !Vapautetaan kappaleen tartunta:
        Reset do_Kiinnita;
        !Odotetaan kappaleen irtoamista puoli sekuntia:
        WaitTime 0.5;
        !Siirrytään lineaariliikkeellä 250 mm hylsypinon vientipisteen yläpuolelle nopeudella 500 mm/s paikkapisteen tarkkuus 100 mm. 
        MoveL Offs (phylsypino,0,0,250),v500,z100,t_Imukuppi\WObj:=wHylsypino;
        !Reset do_Mittaa;
        !Lasketaan uusi vientipiste seuraavalle hylsylle:
        uusi_hylsy_piste;
    ENDPROC
    
    PROC lopetus()
        !Siirrytään kotipisteeseen:
        koti;
        !Kerrotaan ohjelman valmistumisesta ja työstettyjen kappaleiden määrä:
        TPWrite "Valmis, työstettiin "+ValToStr(nKappaleet)+" kappaletta.";
        !Kerrotaan kuinka monta valmista kappaletta saatiin tehtyä, ja kuinka monta hylättiin mittauksessa:
        TPWrite "Valmiita kappaleita "+ValToStr(nValmisKappale)+", hylsyjä "+ValToStr(nHylsy)+".";
        !Mikäli hylsyjä oli enemmän kuin valmiita kappaleita:
        IF nHylsy > nValmisKappale THEN
            !Ilmoitetaan käyttäjälle että nyt ei menny ihan putkeen:
            TPWrite "Nyt ei menny niinku strömsössä...";
        ENDIF
        !Nollataan ohjelman lopuksi muuttujien arvot jotta ne alkaisivat seuraavalla suorituskerralla alusta:
        nollaa_muuttujat;
    ENDPROC
    
    PROC uusi_haku_piste()
        !Asetetaan ensin nSarakeHaku-muuttujalle arvoksi nLaskuri-muuttujan jakojäännös nSarakkeetHaku-vakion arvosta:
        nSarakeHaku := nLaskuri MOD nSarakkeetHaku;
        !Asetetaan sitten nRiviHaku-muuttujan arvoksi nLaskuri jaettuna nRivitHaku-vakion arvolla:
        nRiviHaku := nLaskuri DIV nRivitHaku;
        !Lasketaan nInPalletFrameX-muuttujan arvoksi pisteiden väli kerrottuna nRiviHaku-muuttujan arvolla:
        nInPalletFrameX := nHakuPisteX * nRiviHaku;
        !Lasketaan nInPalletFrameY-muuttujan arvoksi pisteiden väli kerrottuna nSarakeHaku-muuttujan arvolla:
        nInPalletFrameY := nHakuPisteY * nSarakeHaku;
        !Siirretään wInPallet-workobjectin object framea x-akselilla nInPalletFrameX-muuttujan sisällön verran:
        wInPallet.oframe.trans.x := nInPalletFrameX;
        !Siirretään wInPallet-workobjectin object framea y-akselilla nInPalletFrameY-muuttujan sisällön verran:
        wInPallet.oframe.trans.y := nInPalletFrameY;
        !wInPallet-workobjectin object framen paikka on nyt muutettu uuteen hakupisteeseen.
    ENDPROC
    
    PROC uusi_vienti_piste()
        !Asetetaan ensin nSarakeVienti-muuttujalle arvoksi nValmiskappale-muuttujan jakojäännös nSarakkeetVienti-muuttujan arvosta:
        nSarakeVienti := nValmisKappale MOD nSarakkeetVienti;
        !Asetetaan sitten nRiviVienti-muuttujan arvoksi nValmisKappale jaettuna nSarakkeetVIenti-muuttujan arvolla:
        nRiviVienti := nValmisKappale DIV nSarakkeetVienti;
        !Lasketaan nOutPalletFrameX-muuttujan arvoksi rivien välin ja kappaleen pituuden summa kerrottuna nRiviVIenti-muuttujan arvolla:
        nOutPalletFrameX := (nValiX + nKappaleenPituus)*nRiviVienti;
        !Lasketaan nOutPalletFrameY-muuttujan arvoksi sarakkeiden välin ja kappaleen leveyden summa kerrottuna nSarakeVienti-muuttujan arvolla:
        nOutPalletFrameY := (nValiY + nKappaleenLeveys)*nSarakeVienti;
        !Siirretään wOutPallet-workobjectin object framea x-akselilla nOutPalletFrameX-muuttujan sisällön verran:
        wOutPallet.oframe.trans.x := nOutPalletFrameX;
        !Siirretään wOutPallet-workobjectin object framea y-akselilla nOutPalletFrameY-muuttujan sisällön verran:
        wOutPallet.oframe.trans.y := nOutPalletFrameY;
        !wOutPallet-workobjectin object framen paikka on nyt muutettu uuteen vientipisteeseen.
    ENDPROC
    
    PROC uusi_hylsy_piste()
        !Asetetaan nSarakeHylsy-muuttujalle arvoksi nHylsy-laskurin jakojäännös nSarakkeetHylsy-vakion arvosta.
        nSarakeHylsy := nHylsy MOD nSarakkeetHylsy;
        !Asetetaan nRiviHylsy-muuttujan arvoksi nHylsy-laskurin arvo jaettuna nRivitHylsy-vakion arvolla.
        nRiviHylsy := nHylsy DIV nRivitHylsy;
        !Lasketaan nHylsyPinoFrameX-muuttujan arvoksi nKappaleenPituus-vakion arvo kerrottuna nRiviHylsy-muuttujan arvolla.
        nHylsyPinoFrameX := nKappaleenPituus*nRiviHylsy;
        !Lasketaan nHylsyPinoFrameY-muuttujan arvoksi nKappaleenLeveys-vakion arvo kerrottuna nSarakeHylsy-muuttujan arvolla.        
        nHylsyPinoFrameY := nKappaleenLeveys*nSarakeHylsy;
        !Siirretään wHylsyPino-workobjectin object framea x-akselilla nHylsyPinoFrameX-muuttujan sisällön verran:
        wHylsypino.oframe.trans.x := nHylsyPinoFrameX;
        !Siirretään wHylsyPino-workobjectin object framea x-akselilla nHylsyPinoFrameX-muuttujan sisällön verran:
        wHylsypino.oframe.trans.y := nHylsyPinoFrameY;
        !wHylsyPino-workobjectin object framen paikka on nyt muutettu uuteen vientipisteeseen.
    ENDPROC
    
    PROC nollaa_muuttujat()
        !Asetetaan muuttujat nollaksi jotta ne varmasti alkavat alusta, muistetaan myös nollata kaikkien object framejen paikat:
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