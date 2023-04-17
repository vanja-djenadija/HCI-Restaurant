CREATE DEFINER=`root`@`localhost` PROCEDURE `dodajArtikalUNarudžbu`(in idNarudžba INTEGER, in idArtikal INTEGER, in kol INTEGER)
BEGIN
	INSERT INTO narudžba_ima_artikal(NARUDŽBA_IdNarudžba, ARTIKAL_IdArtikal, Količina) VALUES (idNarudžba, idArtikal, kol);
END