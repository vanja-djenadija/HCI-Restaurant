CREATE DEFINER=`root`@`localhost` PROCEDURE `dodajArtikal`(in naziv VARCHAR(50), in cijena DECIMAL(4,2), in opis VARCHAR(200), in idVrstaArtikla INTEGER, out idArtikal INTEGER)
BEGIN
	DECLARE artikalId INTEGER;
	
	INSERT INTO artikal(Naziv, Cijena, Opis, Aktivan, VRSTA_ARTIKLA_IdVrstaArtikla) VALUES (naziv, cijena, opis, 1, idVrstaArtikla);
	SET idArtikal = last_insert_id();  
    
	SELECT IdArtikal INTO artikalId FROM artikal a WHERE naziv=a.Naziv;
END