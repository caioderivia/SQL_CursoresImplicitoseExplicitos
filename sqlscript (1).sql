REM   Script: Cursores explícitos e implícitos
REM   Caio Augusto de Oliveira - 3024203303

CREATE TABLE ALUNO ( 
    RA NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    NOME VARCHAR2(100), 
    NOTA1 NUMBER(5,2), 
    NOTA2 NUMBER(5,2), 
    NOTA3 NUMBER(5,2) 
);

INSERT INTO ALUNO (NOME, NOTA1, NOTA2, NOTA3) VALUES ('João Silva', 8.5, 7.0, 9.0);

INSERT INTO ALUNO (NOME, NOTA1, NOTA2, NOTA3) VALUES ('Maria Oliveira', 6.5, 8.0, 7.5);

INSERT INTO ALUNO (NOME, NOTA1, NOTA2, NOTA3) VALUES ('Carlos Souza', 7.0, 6.5, 8.5);

INSERT INTO ALUNO (NOME, NOTA1, NOTA2, NOTA3) VALUES ('Ana Pereira', 9.0, 9.5, 8.0);

DECLARE 
    CURSOR C_ALUNO IS 
        SELECT RA, NOME, NOTA1, NOTA2, NOTA3, 
               (NOTA1 + NOTA2 + NOTA3) / 3 AS MEDIA 
        FROM ALUNO; 
         
    V_SITUACAO VARCHAR2(10); 
     
BEGIN 
    FOR V_ALUNO IN C_ALUNO LOOP 
         
        IF V_ALUNO.MEDIA >= 6 THEN 
            V_SITUACAO := 'Aprovado'; 
        ELSE 
            V_SITUACAO := 'Reprovado'; 
        END IF; 
 
        
        DBMS_OUTPUT.PUT_LINE( 
            'Aluno: ' || RPAD(V_ALUNO.NOME, 20, '_') || 
            ' | RA: ' || V_ALUNO.RA || 
            ' | Nota1: ' || V_ALUNO.NOTA1 || 
            ' | Nota2: ' || V_ALUNO.NOTA2 || 
            ' | Nota3: ' || V_ALUNO.NOTA3 || 
            ' | Média: ' || V_ALUNO.MEDIA || 
            ' | Situação: ' || V_SITUACAO || 
            CASE WHEN V_ALUNO.MEDIA = 10 THEN ' | Parabéns' ELSE '' END 
        ); 
    END LOOP; 
END;
/

