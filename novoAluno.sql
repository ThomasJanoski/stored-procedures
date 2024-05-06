DELIMITER $

CREATE PROCEDURE novoAluno(nome VARCHAR(45), sobrenome VARCHAR(45), cursoID INT)
BEGIN
	INSERT INTO Alunos (nome, sobrenome, email, cursoID) VALUES(nome, sobrenome, @email, cursoID);
END$

DELIMITER ;

DELIMITER $

CREATE TRIGGER TriggerNovoAluno BEFORE INSERT 
ON Alunos
FOR EACH ROW
BEGIN
	SET @CountEqual = (SELECT COUNT(*) FROM ALunos WHERE nome LIKE NEW.nome AND sobrenome LIKE NEW.sobrenome);
	SET @email = CONCAT(LOWER(NEW.nome), ".", LOWER(NEW.sobrenome), IF(@CountEqual > 0, CAST(@CountEqual AS CHAR(10)), ""), "@facens.com");
    
    SET NEW.email = @email;
END$

DELIMITER ;

CALL novoAluno("Ana", "Clara", 1);
CALL novoAluno("Pedro", "Silva", 2);
CALL novoAluno("Maria", "Eduarda", 2);
CALL novoAluno("João", "Gabriel", 2);
CALL novoAluno("Laura", "Beatriz", 3);