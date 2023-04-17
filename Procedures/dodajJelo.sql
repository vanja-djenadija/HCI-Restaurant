CREATE DEFINER=`root`@`localhost` PROCEDURE `dodajJelo`(in artikalId INTEGER, in recept VARCHAR(1000), in porcija VARCHAR(50))
BEGIN
	INSERT INTO jelo(ARTIKAL_IdArtikal, Recept, VeličinaPorcije) VALUES (artikalId, recept, porcija);
END