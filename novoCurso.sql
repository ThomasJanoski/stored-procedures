DELIMITER $

CREATE PROCEDURE novoCurso(titulo VARCHAR(45))
BEGIN
	INSERT INTO Curso (titulo) VALUES(titulo);
END$

DELIMITER ;

CALL novoCurso("Engenharia de Software");
CALL novoCurso("Biologia Molecular");
CALL novoCurso("Design Gráfico");