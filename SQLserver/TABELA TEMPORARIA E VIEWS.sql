USE DEVDOJO;

--CREATE SCHEMA Ativ2;

DROP TABLE IF EXISTS Ativ2.TblFeriadoNacional
GO

CREATE TABLE Ativ2.TblFeriadoNacional
(
    Data        DATE PRIMARY KEY,
    DiaDaSemana VARCHAR(15),
    Feriado     VARCHAR(50)
);

INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-03-03', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-03-04', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-04-18', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-06-19', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2003-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-02-23', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-02-24', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-04-09', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-06-10', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-02-26', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-02-27', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-04-13', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-06-14', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2001-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-02-11', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-02-12', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-03-29', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-04-21', 'domingo', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-05-30', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2002-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2004-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-01-01', 'sábado', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-02-07', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-02-08', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-03-25', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-05-26', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2005-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-02-27', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-02-28', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-04-14', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-04-21', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-05-01', 'segunda-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-06-15', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-09-07', 'quinta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-10-12', 'quinta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-11-02', 'quinta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-11-15', 'quarta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2006-12-25', 'segunda-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-02-19', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-02-20', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-04-06', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-06-07', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2007-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-02-04', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-02-05', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-03-21', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-05-22', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2008-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-02-23', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-02-24', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-04-10', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-06-11', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2009-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-02-15', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-02-16', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-04-02', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-06-03', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2010-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-01-01', 'sábado', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-03-07', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-03-08', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-04-21', 'quinta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-04-22', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-06-23', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2011-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-02-20', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-02-21', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-04-06', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-06-07', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2012-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-02-11', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-02-12', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-03-29', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-04-21', 'domingo', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-05-30', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2013-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-03-03', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-03-04', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-04-18', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-06-19', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2014-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-02-16', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-02-17', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-04-03', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-06-04', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2015-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-02-08', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-02-09', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-03-25', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-05-26', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2016-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-02-27', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-02-28', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-04-14', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-04-21', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-05-01', 'segunda-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-06-15', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-09-07', 'quinta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-10-12', 'quinta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-11-02', 'quinta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-11-15', 'quarta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2017-12-25', 'segunda-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-02-12', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-02-13', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-03-30', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-05-31', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2018-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-03-04', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-03-05', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-04-19', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-04-21', 'domingo', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-06-20', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2019-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-02-24', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-02-25', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-04-10', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-06-11', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2020-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-02-15', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-02-16', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-04-02', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-06-03', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2021-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-01-01', 'sábado', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-02-28', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-03-01', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-04-15', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-06-16', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2022-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-02-20', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-02-21', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-04-07', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-04-21', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-05-01', 'segunda-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-06-08', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-09-07', 'quinta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-10-12', 'quinta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-11-02', 'quinta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-11-15', 'quarta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2023-12-25', 'segunda-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-02-12', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-02-13', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-03-29', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-04-21', 'domingo', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-05-30', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2024-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-03-03', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-03-04', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-04-18', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-06-19', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2025-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-02-16', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-02-17', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-04-03', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-06-04', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2026-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-02-08', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-02-09', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-03-26', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-05-27', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2027-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-01-01', 'sábado', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-02-28', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-02-29', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-04-14', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-04-21', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-05-01', 'segunda-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-06-15', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-09-07', 'quinta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-10-12', 'quinta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-11-02', 'quinta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-11-15', 'quarta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2028-12-25', 'segunda-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-02-12', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-02-13', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-03-30', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-05-31', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2029-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-03-04', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-03-05', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-04-19', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-04-21', 'domingo', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-06-20', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2030-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-02-24', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-02-25', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-04-11', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-06-12', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2031-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-02-09', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-02-10', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-03-26', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-05-27', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2032-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-01-01', 'sábado', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-02-28', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-03-01', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-04-15', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-06-16', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2033-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-02-20', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-02-21', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-04-07', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-04-21', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-05-01', 'segunda-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-06-08', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-09-07', 'quinta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-10-12', 'quinta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-11-02', 'quinta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-11-15', 'quarta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2034-12-25', 'segunda-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-02-05', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-02-06', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-03-23', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-05-24', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2035-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-02-25', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-02-26', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-04-11', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-06-12', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2036-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-02-16', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-02-17', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-04-03', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-06-04', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2037-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-03-08', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-03-09', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-04-23', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-06-24', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2038-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-01-01', 'sábado', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-02-21', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-02-22', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-04-08', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-06-09', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2039-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-02-13', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-02-14', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-03-30', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-05-31', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2040-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-03-04', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-03-05', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-04-19', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-04-21', 'domingo', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-06-20', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2041-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-02-17', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-02-18', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-04-04', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-06-05', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2042-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-02-09', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-02-10', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-03-27', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-05-28', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2043-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-02-29', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-03-01', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-04-15', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-06-16', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2044-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-02-20', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-02-21', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-04-07', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-04-21', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-05-01', 'segunda-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-06-08', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-09-07', 'quinta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-10-12', 'quinta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-11-02', 'quinta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-11-15', 'quarta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2045-12-25', 'segunda-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-02-05', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-02-06', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-03-23', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-05-24', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2046-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-02-25', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-02-26', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-04-12', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-06-13', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2047-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-02-17', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-02-18', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-04-03', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-06-04', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2048-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-03-01', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-03-02', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-04-16', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-06-17', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2049-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-01-01', 'sábado', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-02-21', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-02-22', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-04-08', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-06-09', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2050-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-02-13', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-02-14', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-03-31', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-04-21', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-05-01', 'segunda-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-06-01', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-09-07', 'quinta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-10-12', 'quinta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-11-02', 'quinta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-11-15', 'quarta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2051-12-25', 'segunda-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-03-04', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-03-05', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-04-19', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-04-21', 'domingo', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-06-20', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2052-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-02-17', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-02-18', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-04-04', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-06-05', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2053-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-02-09', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-02-10', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-03-27', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-05-28', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2054-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-03-01', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-03-02', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-04-16', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-06-17', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2055-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-01-01', 'sábado', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-02-14', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-02-15', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-03-31', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-04-21', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-05-01', 'segunda-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-06-01', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-09-07', 'quinta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-10-12', 'quinta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-11-02', 'quinta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-11-15', 'quarta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2056-12-25', 'segunda-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-03-05', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-03-06', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-04-20', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-06-21', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2057-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-02-25', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-02-26', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-04-12', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-04-21', 'domingo', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-06-13', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2058-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-02-10', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-02-11', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-03-28', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-05-29', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2059-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-03-01', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-03-02', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-04-16', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-06-17', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2060-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-01-01', 'sábado', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-02-21', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-02-22', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-04-08', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-06-09', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2061-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-02-06', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-02-07', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-03-24', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-04-21', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-05-01', 'segunda-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-05-25', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-09-07', 'quinta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-10-12', 'quinta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-11-02', 'quinta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-11-15', 'quarta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2062-12-25', 'segunda-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-02-26', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-02-27', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-04-13', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-06-14', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2063-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-02-18', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-02-19', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-04-04', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-06-05', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2064-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-02-09', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-02-10', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-03-27', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-05-28', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2065-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-02-22', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-02-23', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-04-09', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-06-10', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2066-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-01-01', 'sábado', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-02-14', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-02-15', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-04-01', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-06-02', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2067-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-03-05', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-03-06', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-04-20', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-06-21', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2068-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-02-25', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-02-26', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-04-12', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-04-21', 'domingo', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-06-13', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2069-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-02-10', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-02-11', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-03-28', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-04-21', 'segunda-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-05-01', 'quinta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-05-29', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-09-07', 'domingo', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-10-12', 'domingo', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-11-02', 'domingo', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-11-15', 'sábado', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2070-12-25', 'quinta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-01-01', 'quinta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-03-02', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-03-03', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-04-17', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-06-18', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2071-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-02-22', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-02-23', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-04-08', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-05-01', 'domingo', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-06-09', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2072-12-25', 'domingo', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-01-01', 'domingo', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-02-06', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-02-07', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-03-24', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-04-21', 'sexta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-05-01', 'segunda-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-05-25', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-09-07', 'quinta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-10-12', 'quinta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-11-02', 'quinta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-11-15', 'quarta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2073-12-25', 'segunda-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-01-01', 'segunda-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-02-26', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-02-27', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-04-13', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-04-21', 'sábado', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-05-01', 'terça-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-06-14', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-09-07', 'sexta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-10-12', 'sexta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-11-02', 'sexta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-11-15', 'quinta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2074-12-25', 'terça-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-02-18', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-02-19', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-04-05', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-04-21', 'domingo', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-06-06', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-09-07', 'sábado', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-10-12', 'sábado', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-11-02', 'sábado', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-11-15', 'sexta-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2075-12-25', 'quarta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-01-01', 'quarta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-03-02', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-03-03', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-04-17', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-04-21', 'terça-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-05-01', 'sexta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-06-18', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-09-07', 'segunda-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-10-12', 'segunda-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-11-02', 'segunda-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-11-15', 'domingo', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2076-12-25', 'sexta-feira', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-01-01', 'sexta-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-02-22', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-02-23', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-04-09', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-04-21', 'quarta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-05-01', 'sábado', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-06-10', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-09-07', 'terça-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-10-12', 'terça-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-11-02', 'terça-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-11-15', 'segunda-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2077-12-25', 'sábado', 'Natal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-01-01', 'terça-feira', 'Confraternização Universal');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-02-14', 'segunda-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-02-15', 'terça-feira', 'Carnaval');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-04-01', 'sexta-feira', 'Paixão de Cristo');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-04-21', 'quinta-feira', 'Tiradentes');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-05-01', 'quarta-feira', 'Dia do Trabalho');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-06-02', 'quinta-feira', 'Corpus Christi');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-09-07', 'quarta-feira', 'Independência do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-10-12', 'quarta-feira', 'Nossa Sr.a Aparecida - Padroeira do Brasil');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-11-02', 'quarta-feira', 'Finados');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-11-15', 'terça-feira', 'Proclamação da República');
INSERT INTO Ativ2.TblFeriadoNacional
VALUES ('2078-12-25', 'quarta-feira', 'Natal');


--     SELECT * FROM Ativ2.TblFeriadoNacional;
--
-- --     WITH CTE_ANOS AS (
-- --         SELECT DISTINCT
-- --             year(Data) as Ano
-- --         from Ativ2.TblFeriadoNacional
-- --     ),
--
--     WITH CTE_ANOMIN AS (
--         --SELECT MIN(Ano) as Ano from CTE_ANOS
--         SELECT MIN(YEAR(Data)) as Ano FROM Ativ2.TblFeriadoNacional
--     ),
--
--     CTE_ANOMAX AS(
--         --SELECT max(Ano) AS ANO FROM CTE_ANOS
--         SELECT MAX(YEAR(Data)) as Ano FROM Ativ2.TblFeriadoNacional
--
--     ),
--
--     CTE_CALENDARIO AS (
--         SELECT TRY_CAST(CONCAT( (SELECT Ano from CTE_ANOMIN), '0101') AS DATE) AS [DATA]
--         UNION ALL
--         SELECT DATEADD(DAY, 1, [DATA]) AS [DATA]
--             FROM CTE_CALENDARIO
--         WHERE [DATA] < TRY_CAST(CONCAT((SELECT Ano FROM CTE_ANOMAX), '1231') AS DATE)
--     )
--
--     SELECT CTE.DATA as Data_Completa,
--            Feriado
--         INTO Ativ2.tblCalendarioAux
--         FROM CTE_CALENDARIO as CTE
--         LEFT JOIN Ativ2.TblFeriadoNacional as F
--         ON CTE.[Data] = F.Data
--     OPTION (MAXRECURSION 0)
--
--
--     select * from Ativ2.tblCalendarioAux;


--     ____________________________________________________________________________________________________--

-- Nova forma (mais rapida) de fazer a consulta de calendário.
drop table if exists #tblAnoMin;
drop table if exists #tblAnoMax;
drop table if exists tblCalendarioAux;

SELECT MIN(YEAR(Data)) as Ano
INTO #tblAnoMin
FROM Ativ2.TblFeriadoNacional;

SELECT MAX(YEAR(Data)) as Ano
INTO #tblAnoMax
FROM Ativ2.TblFeriadoNacional;

WITH CTE_CALENDARIO AS (SELECT TRY_CAST(CONCAT((SELECT Ano from #tblAnoMin), '0101') AS DATE) AS [DATA]
                        UNION ALL
                        SELECT DATEADD(DAY, 1, [DATA]) AS [DATA]
                        FROM CTE_CALENDARIO
                        WHERE [DATA] < TRY_CAST(CONCAT((SELECT Ano FROM #tblAnoMax), '1231') AS DATE))

SELECT CTE.Data,
       Feriado
INTO Ativ2.tblCalendarioAux
FROM CTE_CALENDARIO as CTE
         LEFT JOIN Ativ2.TblFeriadoNacional as F
                   ON CTE.[Data] = F.Data
OPTION (MAXRECURSION 0)


CREATE OR ALTER VIEW VW_CALENDARIO
AS
SELECT Data,
       DATEPART(WEEKDAY, Data) as DiadaSemana,
       CASE DATEPART(WEEKDAY, Data)
           WHEN 1 THEN 'Domingo'
           WHEN 2 THEN 'Segunda-feira'
           WHEN 3 THEN 'Terça-feira'
           WHEN 4 THEN 'Quarta-feira'
           WHEN 5 THEN 'Quinta-feira'
           WHEN 6 THEN 'Sexta-feira'
           WHEN 7 THEN 'Sábado'
           end                 AS NomeSemana,
       DATEPART(QUARTER, Data) as Trimestre,
       DATENAME(MONTH, Data)   as NomeMes,
       CASE
           WHEN Feriado is null and DATEPART(WEEKDAY, Data) in (1, 7) then 'Final de semana'
           ELSE ISNULL(Feriado, '')
           end                 as Feriado
from Ativ2.tblCalendarioAux;

GO

select *
from VW_CALENDARIO;


 