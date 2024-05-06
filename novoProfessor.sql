DELIMITER $

CREATE PROCEDURE novoProfessor(nome VARCHAR(45), sobrenome VARCHAR(45), cursoID INT)
BEGIN
	INSERT INTO Professores (nome, sobrenome, email, cursoAtual) VALUES(nome, sobrenome, @email, cursoID);
END$

DELIMITER ;

DELIMITER $

CREATE TRIGGER TriggerNovoProfessor BEFORE INSERT 
ON Professores
FOR EACH ROW
BEGIN
	SET @CountEqual = (SELECT COUNT(*) FROM Professores WHERE nome LIKE NEW.nome AND sobrenome LIKE NEW.sobrenome);
	SET @email = CONCAT(LOWER(NEW.nome), ".", LOWER(NEW.sobrenome), IF(@CountEqual > 0, CAST(@CountEqual AS CHAR(10)), ""), "@profacens.com");
    
    SET NEW.email = @email;
END$

DELIMITER ;

CALL novoProfessor("Carlos", "Eduardo", 1);
CALL novoProfessor("Fernanda", "Silva", 2);
CALL novoProfessor("Roberto", "Almeida", 3);
CALL novoProfessor("Particia", "Oliveira", 3);
CALL novoProfessor("Ricardo", "Souza", 3);