CREATE DEFINER=`root`@`localhost` PROCEDURE `prijava`(in korisnickoIme VARCHAR(50), in lozinka VARCHAR(50), out prijava boolean, out idZaposleni INTEGER, out uloga VARCHAR(50), out ime VARCHAR(50), out prezime VARCHAR(50), out brojTelefona VARCHAR(20), out mjesto VARCHAR(50))
BEGIN
	SELECT count(*)>0, IdZaposleni, Uloga, Ime, Prezime, BrojTelefona, MjestoStanovanja 
    INTO prijava, idZaposleni, uloga, ime, prezime, brojTelefona, mjesto FROM zaposleni z
	WHERE z.KorisničkoIme=korisnickoIme AND z.Lozinka=lozinka;
END