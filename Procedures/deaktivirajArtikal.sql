CREATE DEFINER=`root`@`localhost` PROCEDURE `deaktivirajArtikal`(in artikalId INTEGER)
BEGIN
	UPDATE artikal a SET Aktivan = 0 WHERE a.IdArtikal=artikalId;
END