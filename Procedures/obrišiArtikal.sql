CREATE DEFINER=`root`@`localhost` PROCEDURE `obrišiArtikal`(in artikalId INTEGER)
BEGIN
	DELETE FROM jelo j WHERE j.ARTIKAL_IdArtikal=artikalId; -- brišemo iz HRANA
	DELETE FROM piće p WHERE p.ARTIKAL_IdArtikal=artikalId; -- brišemo iz PIĆE
	DELETE FROM artikal a WHERE a.IdArtikal=artikalId; -- brišemo iz tabele ARTIKAL
END