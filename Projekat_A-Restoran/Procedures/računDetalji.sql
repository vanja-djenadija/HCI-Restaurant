CREATE DEFINER=`root`@`localhost` PROCEDURE `računDetalji`(in idRačuna INTEGER)
BEGIN
	SELECT IdRačun, UkupnaCijena, Datum, IdArtikal, Naziv, a.Cijena, Količina, a.Cijena*Količina AS CijenaStavke, Ime, Prezime FROM račun r 
    NATURAL JOIN zaposleni z 
    NATURAL JOIN stavka s 
    NATURAL JOIN artikal a
    WHERE r.IdRačun=idRačuna AND z.IdZaposleni=r.ZAPOSLENI_IdZaposleni AND s.RAČUN_IdRačun=r.IdRačun;
END