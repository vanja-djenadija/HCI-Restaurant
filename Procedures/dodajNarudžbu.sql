CREATE DEFINER=`root`@`localhost` PROCEDURE `dodajNarudžbu`(in idSto INTEGER, in zaposleniId INTEGER, out narudžbaId INTEGER)
BEGIN
	INSERT INTO narudžba(DatumVrijeme, STO_IdSto, STATUS_IdStatus, RAČUN_IdRačun, ZAPOSLENI_IdZaposleni) 
	VALUES (now(), idSto, 1, null, zaposleniId);
    SELECT last_insert_id() INTO narudžbaId;
END