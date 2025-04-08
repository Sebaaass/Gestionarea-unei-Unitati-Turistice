CREATE TABLE CABANE (
    id_cabana INT PRIMARY KEY,
    tip_cabana VARCHAR(20) NOT NULL,
    tarif_noapte DECIMAL(10, 2) NOT NULL,
    capacitate INT NOT NULL CHECK (capacitate > 0),
    disponibilitate VARCHAR(2) DEFAULT 'DA' CHECK (disponibilitate IN ('DA', 'NU')));

CREATE TABLE FACILITATI (
    id_facilitate INT PRIMARY KEY,
    denumire VARCHAR2(50) NOT NULL,
    tarif_utilizare NUMBER(10, 2) CHECK (tarif_utilizare >= 0),
    descriere CLOB);

CREATE TABLE CLIENTI (
    id_client INT PRIMARY KEY,
    nume VARCHAR(30) NOT NULL,
    prenume VARCHAR(30) NOT NULL,
    telefon VARCHAR(15),
    email VARCHAR(50));
    
CREATE TABLE STOCURI (
    id_produs INT PRIMARY KEY,
    nume_produs VARCHAR(50) NOT NULL,
    cantitate INT NOT NULL,
    prag_minim INT NOT NULL CHECK (prag_minim >= 0),
    furnizor VARCHAR(50),
    id_facilitate INT,
    FOREIGN KEY (id_facilitate) REFERENCES FACILITATI (id_facilitate));
    
CREATE TABLE REZERVARI (
    id_rezervare INT PRIMARY KEY,
    id_client INT NOT NULL,
    id_cabana INT NOT NULL,
    data_inceput DATE NOT NULL,
    data_sfarsit DATE NOT NULL,
    FOREIGN KEY (id_client) REFERENCES CLIENTI (id_client),
    FOREIGN KEY (id_cabana) REFERENCES CABANE (id_cabana));
    
    select * from rezervari;
    
CREATE TABLE FACTURI (
    id_factura INT PRIMARY KEY,
    id_rezervare INT NOT NULL,
    data_factura DATE NOT NULL,
    suma_total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('Platita', 'Neplatita')),
    FOREIGN KEY (id_rezervare) REFERENCES REZERVARI (id_rezervare));
    

CREATE TABLE PLATI (
    id_plata INT PRIMARY KEY,
    id_factura INT NOT NULL,
    suma DECIMAL(10, 2) NOT NULL,
    data_plata DATE NOT NULL,
    metoda_plata VARCHAR(20) DEFAULT 'Card',
    FOREIGN KEY (id_factura) REFERENCES FACTURI (id_factura));

CREATE TABLE REVIEWURI_CLIENTI (
    id_review INT PRIMARY KEY,
    id_client INT NOT NULL,
    id_cabana INT NOT NULL,
    data_review DATE NOT NULL,
    nota INT CHECK (nota BETWEEN 1 AND 10),
    FOREIGN KEY (id_client) REFERENCES CLIENTI (id_client),
    FOREIGN KEY (id_cabana) REFERENCES CABANE (id_cabana));
    
CREATE TABLE ANGAJATI (
    id_angajat INT PRIMARY KEY,
    nume VARCHAR(30) NOT NULL,
    functie VARCHAR(50),
    id_facilitate INT,
    FOREIGN KEY (id_facilitate) REFERENCES FACILITATI (id_facilitate));
    
CREATE TABLE SERVICII (
    id_serviciu INT PRIMARY KEY,
    denumire_serviciu VARCHAR(50) NOT NULL,
    tarif_serviciu DECIMAL(10, 2) NOT NULL,
    id_angajat INT,
    FOREIGN KEY (id_angajat) REFERENCES ANGAJATI (id_angajat));

INSERT INTO CABANE VALUES(1, 'Standard', 300.00, 4, 'DA');
INSERT INTO CABANE VALUES(2, 'Lux', 500.00, 6, 'DA');
INSERT INTO CABANE VALUES(3, 'Economic', 200.00, 2, 'NU');
INSERT INTO CABANE VALUES(4, 'Deluxe', 700.00, 8, 'DA');
INSERT INTO CABANE VALUES(5, 'Superior', 600.00, 7, 'DA');
INSERT INTO CABANE VALUES(6, 'Familial', 400.00, 5, 'NU');


INSERT INTO FACILITATI VALUES(1, 'Piscina', 50.00, 'Piscina interioara încalzita');
INSERT INTO FACILITATI VALUES(2, 'Sauna', 30.00, 'Sauna uscata si umeda');
INSERT INTO FACILITATI VALUES(3, 'Sala de fitness', 20.00, 'Echipamente moderne de fitness');
INSERT INTO FACILITATI VALUES(4, 'Spa', 100.00, 'Tratament de relaxare si înfrumusetare');
INSERT INTO FACILITATI VALUES(5, 'Jacuzzi', 70.00, 'Jacuzzi cu sistem de masaj performant');
INSERT INTO FACILITATI VALUES(6, 'Teren de tenis', 40.00, 'Teren de tenis cu nocturna');

INSERT INTO CLIENTI VALUES(1, 'Popescu', 'Andrei', '0723123456', 'andrei.popescu@gmail.com');
INSERT INTO CLIENTI VALUES(2, 'Ionescu', 'Maria', '0734123456', 'maria.ionescu@yahoo.com');
INSERT INTO CLIENTI VALUES(3, 'Georgescu', 'Alex', '0745123456', 'alex.georgescu@hotmail.com');
INSERT INTO CLIENTI VALUES(4, 'Dumitrescu', 'Ioana', '0756123456', 'ioana.dumitrescu@gmail.com');    
INSERT INTO CLIENTI VALUES(5, 'Avram', 'George', '0766123456', 'george.avram@gmail.com');
INSERT INTO CLIENTI VALUES(6, 'Lungu', 'Diana', '0777123456', 'diana.lungu@yahoo.com');    
    
    
INSERT INTO STOCURI VALUES(1, 'Prosoape', 100, 10, 'Furnizor Prosoape SRL', 1);
INSERT INTO STOCURI VALUES(2, 'Arome pentru sauna', 50, 5, 'Furnizor Arome SRL', 2);
INSERT INTO STOCURI VALUES(3, 'Greutati fitness', 20, 2, 'Furnizor Fitness SRL', 3);
INSERT INTO STOCURI VALUES(4, 'Uleiuri spa', 30, 5, 'Furnizor Spa SRL', 4);
INSERT INTO STOCURI VALUES(5, 'Rachete de tenis', 15, 3, 'Furnizor Sport SRL', 6);
INSERT INTO STOCURI VALUES(6, 'Seturi de halate', 50, 10, 'Furnizor Textile SRL', 5);    
    
    
INSERT INTO REZERVARI VALUES(1, 1, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-05', 'YYYY-MM-DD'));
INSERT INTO REZERVARI VALUES(2, 2, 2, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO REZERVARI VALUES(3, 3, 3, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-03', 'YYYY-MM-DD'));
INSERT INTO REZERVARI VALUES(4, 4, 4, TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-14', 'YYYY-MM-DD'));
INSERT INTO REZERVARI VALUES(5, 5, 5, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'));
INSERT INTO REZERVARI VALUES(6, 6, 6, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'));

    
INSERT INTO FACTURI VALUES(1, 1, TO_DATE('2024-01-06', 'YYYY-MM-DD'), 1500.00, 'Platita');
INSERT INTO FACTURI VALUES(2, 2, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 2500.00, 'Platita');
INSERT INTO FACTURI VALUES(3, 3, TO_DATE('2024-02-04', 'YYYY-MM-DD'), 400.00, 'Neplatita');
INSERT INTO FACTURI VALUES(4, 4, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 3500.00, 'Platita');
INSERT INTO FACTURI VALUES(5, 5, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 3000.00, 'Platita');
INSERT INTO FACTURI VALUES(6, 6, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 2000.00, 'Neplatita');
    
    
    
INSERT INTO PLATI VALUES(1, 1, 1500.00, TO_DATE('2024-01-06', 'YYYY-MM-DD'), 'Card');
INSERT INTO PLATI VALUES(2, 2, 2500.00, TO_DATE('2024-01-16', 'YYYY-MM-DD'), 'Cash');
INSERT INTO PLATI VALUES(3, 4, 3500.00, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'Transfer Bancar');
INSERT INTO PLATI VALUES(4, 5, 3000.00, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'Card');
INSERT INTO PLATI VALUES(5, 6, 2000.00, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'Cash');


INSERT INTO REVIEWURI_CLIENTI VALUES(1, 1, 1, TO_DATE('2024-01-07', 'YYYY-MM-DD'), 9);
INSERT INTO REVIEWURI_CLIENTI VALUES(2, 2, 2, TO_DATE('2024-01-17', 'YYYY-MM-DD'), 10);
INSERT INTO REVIEWURI_CLIENTI VALUES(3, 3, 3, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 7);
INSERT INTO REVIEWURI_CLIENTI VALUES(4, 4, 4, TO_DATE('2024-02-16', 'YYYY-MM-DD'), 8);
INSERT INTO REVIEWURI_CLIENTI VALUES(5, 5, 5, TO_DATE('2024-03-07', 'YYYY-MM-DD'), 9);
INSERT INTO REVIEWURI_CLIENTI VALUES(6, 6, 6, TO_DATE('2024-04-07', 'YYYY-MM-DD'), 8);


INSERT INTO ANGAJATI VALUES(1, 'Popa Mihai', 'Manager', 1);
INSERT INTO ANGAJATI VALUES(2, 'Stan Elena', 'Receptioner', 2);
INSERT INTO ANGAJATI VALUES(3, 'Iordache Liviu', 'Antrenor fitness', 3);
INSERT INTO ANGAJATI VALUES(4, 'Marin Ana', 'Maseur', 4);
INSERT INTO ANGAJATI VALUES(5, 'Vasile Adrian', 'Instructor sportiv', 6);
INSERT INTO ANGAJATI VALUES(6, 'Nistor Raluca', 'Supraveghetor spa', 5);



INSERT INTO SERVICII VALUES(1, 'Antrenament personal', 100.00, 3);
INSERT INTO SERVICII VALUES(2, 'Masaj relaxare', 150.00, 4);
INSERT INTO SERVICII VALUES(3, 'Sauna privata', 80.00, 2);
INSERT INTO SERVICII VALUES(4, 'Acces piscina', 50.00, 1);
INSERT INTO SERVICII VALUES(5, 'Teren de tenis', 40.00, 5);
INSERT INTO SERVICII VALUES(6, 'Jacuzzi privat', 90.00, 6);



SELECT c.id_cabana, c.tip_cabana, c.tarif_noapte,(SELECT SUM(f.suma_total) FROM FACTURI f 
    WHERE f.id_rezervare IN (SELECT r.id_rezervare 
                             FROM REZERVARI r 
                             WHERE r.id_cabana = c.id_cabana)) AS venit_total
    FROM CABANE c
    ORDER BY venit_total DESC NULLS LAST;





SELECT c.id_client, c.nume, c.prenume, COUNT(r.id_rezervare) AS numar_rezervari
FROM CLIENTI c
LEFT JOIN REZERVARI r ON c.id_client = r.id_client
GROUP BY c.id_client, c.nume, c.prenume
HAVING COUNT(r.id_rezervare) > 0
ORDER BY numar_rezervari DESC;




SELECT f.id_facilitate, f.denumire, f.tarif_utilizare, 
       a.id_angajat, a.nume AS nume_angajat
FROM FACILITATI f
LEFT OUTER JOIN ANGAJATI a ON f.id_facilitate = a.id_facilitate
WHERE f.tarif_utilizare > 50
ORDER BY f.tarif_utilizare DESC;


CREATE OR REPLACE PROCEDURE AfisareCabaneDisponibile IS
    v_tip_cabana VARCHAR(20);
    v_tarif DECIMAL(10, 2);
    done BOOLEAN := FALSE;

    CURSOR cur_cabane IS
        SELECT tip_cabana, tarif_noapte
        FROM CABANE
        WHERE disponibilitate = 'DA';

    BEGIN
        OPEN cur_cabane;
        LOOP
            FETCH cur_cabane INTO v_tip_cabana, v_tarif;
            EXIT WHEN cur_cabane%NOTFOUND;
             DBMS_OUTPUT.PUT_LINE('Tip cabana: ' || v_tip_cabana || ', Tarif: ' || v_tarif || ' RON/noapte');
        END LOOP;

        CLOSE cur_cabane;
    END;
/

SET SERVEROUTPUT ON;

EXEC AfisareCabaneDisponibile;



CREATE OR REPLACE FUNCTION TotalNoptiRezervate( 
    p_id_client INT,
    p_id_cabana INT
) RETURN VARCHAR2 IS
    v_total_nopti INT;
BEGIN
    
    SELECT SUM(data_sfarsit - data_inceput)
    INTO v_total_nopti
    FROM REZERVARI
    WHERE id_client = p_id_client
      AND id_cabana = p_id_cabana;

    IF v_total_nopti IS NULL THEN
        RETURN 'Clientul nu are nicio rezervare pentru cabana indicata.';
    ELSE
        RETURN 'Total nopti rezervate: ' || v_total_nopti;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RETURN 'A aparut o eroare neasteptata: ' || SQLERRM;
END TotalNoptiRezervate;



BEGIN   
    DBMS_OUTPUT.PUT_LINE(TotalNoptiRezervate(1, 1)); 
END;


BEGIN   
    DBMS_OUTPUT.PUT_LINE(TotalNoptiRezervate(3, 2)); 
END;





CREATE OR REPLACE PROCEDURE RaportVenituriCabana(
    p_id_cabana IN INT
) IS
    v_venit_total DECIMAL(10, 2);
    v_status VARCHAR2(50);
    v_clienti VARCHAR2(500);
BEGIN
    SELECT 
        NVL(SUM(f.suma_total), 0) AS venit_total,
        LISTAGG(c.nume || ' ' || c.prenume, ', ') WITHIN GROUP (ORDER BY c.nume) AS clienti,
        CASE 
            WHEN COUNT(p.id_plata) = 0 THEN 'Fara plati'
            WHEN COUNT(p.id_plata) > 0 THEN 'Plati inregistrate'
        END AS status_plati
    INTO
        v_venit_total, v_clienti, v_status
    FROM 
        CABANE cb
        LEFT JOIN REZERVARI r ON cb.id_cabana = r.id_cabana
        LEFT JOIN FACTURI f ON r.id_rezervare = f.id_rezervare
        LEFT JOIN PLATI p ON f.id_factura = p.id_factura
        LEFT JOIN CLIENTI c ON r.id_client = c.id_client
    WHERE 
        cb.id_cabana = p_id_cabana
    GROUP BY cb.id_cabana;
    DBMS_OUTPUT.PUT_LINE('Cabana ID: ' || p_id_cabana);
    DBMS_OUTPUT.PUT_LINE('Venit total generat: ' || v_venit_total || ' RON');
    DBMS_OUTPUT.PUT_LINE('Lista clientilor: ' || NVL(v_clienti, 'Niciun client'));
    DBMS_OUTPUT.PUT_LINE('Status plati: ' || v_status);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista nicio cabana cu ID-ul specificat: ' || p_id_cabana);
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: Interogarea a returnat prea multe randuri. Verificati datele.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('A aparut o eroare neasteptata: ' || SQLERRM);
END RaportVenituriCabana;
/

BEGIN
    RaportVenituriCabana(1); 
END;

BEGIN
    RaportVenituriCabana(3); 
END;

BEGIN
    RaportVenituriCabana(99); 
END;

SET SERVEROUTPUT ON;


CREATE OR REPLACE TRIGGER info_rezervari
AFTER INSERT OR DELETE OR UPDATE ON REZERVARI
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('Adaugare rezervare: ID ' || :NEW.id_rezervare || ', Cabana ' || :NEW.id_cabana);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('Stergere rezervare: ID ' || :OLD.id_rezervare || ', Cabana ' || :OLD.id_cabana);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('Actualizare rezervare: ID ' || :OLD.id_rezervare || ' -> ' || :NEW.id_rezervare);
    END IF;
END;
/

INSERT INTO REZERVARI VALUES(7, 1, 2, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'));

DELETE FROM REZERVARI WHERE id_rezervare = 7;

UPDATE REZERVARI
SET data_sfarsit = TO_DATE('2024-03-10', 'YYYY-MM-DD')
WHERE id_rezervare = 1;


select * from Rezervari where id_rezervare = 1;



CREATE OR REPLACE TRIGGER modificari_cabane
AFTER INSERT OR UPDATE OR DELETE ON CABANE
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('Adaugare cabana: ID=' || :NEW.id_cabana || 
                             ', Tip=' || :NEW.tip_cabana || 
                             ', Tarif=' || :NEW.tarif_noapte);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('Actualizare cabana: ID=' || :OLD.id_cabana || 
                             ', Tip vechi=' || :OLD.tip_cabana || 
                             ', Tip nou=' || :NEW.tip_cabana || 
                             ', Tarif vechi=' || :OLD.tarif_noapte || 
                             ', Tarif nou=' || :NEW.tarif_noapte);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('Stergere cabana: ID=' || :OLD.id_cabana || 
                             ', Tip=' || :OLD.tip_cabana);
    END IF;
END;
/


INSERT INTO CABANE VALUES(7, 'Premium', 800.00, 10, 'DA');

UPDATE CABANE
SET tarif_noapte = 750.00
WHERE id_cabana = 2;


DELETE FROM CABANE
WHERE id_cabana = 7;
