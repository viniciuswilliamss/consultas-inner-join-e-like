CREATE DATABASE detran;
USE detran;

CREATE TABLE proprietario (
    CodProp INT AUTO_INCREMENT PRIMARY KEY,
    nomeProprietario VARCHAR(100),
    endereco VARCHAR(100),
    CNH VARCHAR(100),
    categoriaCNH VARCHAR(55),
    telefone VARCHAR(55), 
    localidade VARCHAR(55),
    validadeCNH DATE,
    estadoProprietario VARCHAR(55)
);

CREATE TABLE veiculo( 
    CodVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    nomeVeiculo VARCHAR(55),
    PlacaVeiculo VARCHAR(55),
    ModeloVeiculo VARCHAR(55),
    CorVeiculo VARCHAR(55),
    ModeloAntigo VARCHAR(55),
    fk_proprietario INT,
    FOREIGN KEY (fk_proprietario) REFERENCES proprietario(CodProp)
);

INSERT INTO proprietario (nomeProprietario, endereco, CNH, categoriaCNH, telefone, localidade, validadeCNH, estadoProprietario)
VALUES 
('Vinicius', 'Rua dos Anjos, 302', '12345678900', 'B', '11999999999', 'Minas Gerais', '2027-10-10', 'MG'),
('Mayara', 'Rua Via dos Mangues, 440', '98765432100', 'AB', '21988888888', 'Pernambuco', '2026-08-01', 'PE'),
('Cleiton', 'Rua Isabel, 709', '55566677700', 'C', '31977777777', 'Rio de Janeiro', '2028-03-15', 'RJ'),
('Amanda', 'Rua Lavit, 394', '44433322211', 'A', '11988887777', 'São Paulo', '2029-01-20', 'SP'),
('Thiago', 'Rua Albert Einsten, 192', '22233344455', 'D', '11977776666', 'Bahia', '2025-07-12', 'BA'),
('Clara', 'Rua Filadelfia, 400', '99988877766', 'B', '31966665555', 'Ceará', '2027-09-30', 'CE'),
('Hunter', 'Rua Kiss, 102', '11122233344', 'E', '21955554444', 'Paraná', '2026-06-15', 'PR'),
('Matheus', 'Rua da Colombia, 499', '66655544433', 'AB', '11944443333', 'Amazonas', '2028-02-25', 'AM'),
('Martin', 'Rua Paraiso, 214', '33322211100', 'C', '31933332222', 'Goiás', '2029-12-01', 'GO'),
('Pedro', 'Rua Monte Negro, 555', '77788899900', 'B', '21922221111', 'Santa Catarina', '2025-11-20', 'SC');

INSERT INTO veiculo (nomeVeiculo, PlacaVeiculo, ModeloVeiculo, CorVeiculo, ModeloAntigo, fk_proprietario)
VALUES 
('Nissan', 'ABC1234', 'Maybach', 'Preto', 'Ford', 1),
('Lamborghini', 'DEF5678', 'Porsche', 'Branco', 'Hyundai Kia', 2),
('Ferrari', 'GHI9012', 'Uno Mille', 'Vermelho', 'Suzuki', 3),
('Toyota', 'JKL3456', 'Corolla', 'Cinza', 'Honda Civic', 4),
('Honda', 'MNO6789', 'City', 'Prata', 'Chevrolet', 5),
('Chevrolet', 'PQR2345', 'Onix', 'Branco', 'Volkswagen', 6),
('Hyundai', 'STU7890', 'HB20', 'Azul', 'Fiat', 7),
('Volkswagen', 'VWX1234', 'Gol', 'Vermelho', 'Peugeot', 8),
('Fiat', 'YZA5678', 'Mobi', 'Preto', 'Renault', 9),
('Renault', 'BCD9012', 'KwID', 'Cinza', 'Dacia', 10);


SELECT v.nomeVeiculo, v.ModeloVeiculo, p.nomeProprietario
FROM veiculo v
INNER JOIN proprietario p ON v.fk_proprietario = p.CodProp
WHERE v.ModeloVeiculo LIKE '%o%';

SELECT p.nomeProprietario, v.PlacaVeiculo
FROM proprietario p
INNER JOIN veiculo v ON p.CodProp = v.fk_proprietario
WHERE p.nomeProprietario LIKE 'M%';

SELECT v.nomeVeiculo, v.CorVeiculo, p.nomeProprietario
FROM veiculo v
INNER JOIN proprietario p ON v.fk_proprietario = p.CodProp
WHERE v.CorVeiculo LIKE '%o';

SELECT p.nomeProprietario, p.categoriaCNH, v.ModeloVeiculo
FROM proprietario p
INNER JOIN veiculo v ON p.CodProp = v.fk_proprietario
WHERE p.categoriaCNH LIKE '%B%';

SELECT v.PlacaVeiculo, v.nomeVeiculo, p.nomeProprietario
FROM veiculo v
INNER JOIN proprietario p ON v.fk_proprietario = p.CodProp
WHERE v.PlacaVeiculo LIKE 'A%';
