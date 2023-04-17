CREATE DEFINER=`root`@`localhost` PROCEDURE `artikli`(in naziv VARCHAR(50))
BEGIN
	SELECT * FROM artikal a WHERE a.Naziv LIKE naziv;
END