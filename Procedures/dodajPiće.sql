CREATE DEFINER=`root`@`localhost` PROCEDURE `dodajPiće`(in artikalId INTEGER, in količina INTEGER, in proizvođač VARCHAR(50))
BEGIN
	DECLARE proizvođačId INTEGER;
	SELECT IdProizvođač INTO proizvođačId FROM proizvođač p WHERE proizvođač=p.Naziv;
	INSERT INTO piće(ARTIKAL_IdArtikal, TrenutnaKoličina, PROIZVOĐAČ_IdProizvođač) VALUES (artikalId, količina, proizvođačId);
END