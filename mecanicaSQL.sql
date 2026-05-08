CREATE DATABASE OficinaMecanica;

Use OficinaMecanica;

CREATE TABLE clientes(
	
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(50),
    cidade VARCHAR(50)
);

CREATE TABLE veiculos(
	
    id_veiculo INT PRIMARY KEY,
    modelo VARCHAR(50),
    ano VARCHAR(4),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) 
);

CREATE TABLE mecanicos(
	
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    especialidade VARCHAR(200)
);

CREATE TABLE ordem_servico(

    id_os INT PRIMARY KEY,
    data_emissão DATE,
    valor_total FLOAT,
    stats VARCHAR(100),
    id_veiculo INT,
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo),
    id_mecanico INT,
    FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico)
);

CREATE TABLE servicos(
	
    id_servico INT PRIMARY KEY,
    descrição VARCHAR(100),
    preco_base FLOAT
);

	ALTER TABLE itens_servicos
    ADD COLUMN quantidade INT;
    
CREATE TABLE itens_servicos(
	
	id_os INT,
    id_servico INT,
    PRIMARY KEY (id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES ordem_servico(id_os),
	FOREIGN KEY (id_servico) REFERENCES servicos(id_servico)

);

INSERT INTO Clientes (id_cliente, nome, cidade) VALUES
(1, 'Carlos Silva', 'São Paulo'), (2, 'Ana Souza', 'Curitiba'), (3, 'Bruno Lima', 'São Paulo'), (4, 'Julia Costa', 'Santos'),
(5, 'Ricardo Oliveira', 'Belo Horizonte'), (6, 'Beatriz Santos', 'Rio de Janeiro'), (7, 'Fernando Alves', 'São Paulo'), (8, 'Mariana Rocha', 'Porto Alegre'),
(9, 'Lucas Mendes', 'Salvador'), (10, 'Camila Ferreira', 'Fortaleza'), (11, 'Gabriel Sousa', 'Brasília'), (12, 'Larissa Pereira', 'Recife'),
(13, 'Rafael Gomes', 'Manaus'), (14, 'Isabela Ribeiro', 'São Luís'), (15, 'Gustavo Martins', 'Natal'), (16, 'Letícia Carvalho', 'João Pessoa'),
(17, 'Daniel Almeida', 'Maceió'), (18, 'Amanda Rodrigues', 'Aracaju'), (19, 'Matheus Silva', 'Teresina'), (20, 'Vitoria Lima', 'Palmas'),
(21, 'Thiago Duarte', 'Campo Grande'), (22, 'Sofia Neves', 'Cuiabá'), (23, 'Enzo Lopes', 'Goiânia'), (24, 'Valentina Ramos', 'Belém'),
(25, 'João Paulo', 'Vitória'), (26, 'Maria Clara', 'Florianópolis'), (27, 'Pedro Henrique', 'São Paulo'), (28, 'Lorena Castro', 'Curitiba'),
(29, 'Felipe Cardoso', 'Londrina'), (30, 'Manuela Cunha', 'Joinville'), (31, 'Vinícius Rocha', 'Caxias do Sul'), (32, 'Alice Moreira', 'Pelotas'),
(33, 'Murilo Farias', 'Niterói'), (34, 'Eduarda Teixeira', 'Duque de Caxias'), (35, 'Samuel Vieira', 'Campinas'), (36, 'Giovanna Nogueira', 'Sorocaba'),
(37, 'Kaique Freitas', 'Ribeirão Preto'), (38, 'Yasmin Barros', 'São José dos Campos'), (39, 'Rodrigo Porto', 'Osasco'), (40, 'Bianca Meireles', 'Santo André'),
(41, 'Igor Azevedo', 'São Bernardo do Campo'), (42, 'Clara Batista', 'Uberlândia'), (43, 'Caio Nascimento', 'Juiz de Fora'), (44, 'Lívia Pires', 'Contagem'),
(45, 'Augusto Sales', 'Betim'), (46, 'Renata Guerra', 'Aparecida de Goiânia'), (47, 'Sérgio Campos', 'Anápolis'), (48, 'Patrícia Borges', 'Jundiaí'),
(49, 'Roberto Antunes', 'Piracicaba'), (50, 'Fernanda Lira', 'Bauru');


INSERT INTO Veiculos (id_veiculo, modelo, ano, id_cliente) VALUES
(1, 'Celta', 2012, 1), (2, 'Jetta', 2020, 1), (3, 'Voyage', 2015, 2), (4, 'Tiida', 2013, 3), (5, 'Civic', 2018, 5),
(6, 'Corolla', 2021, 6), (7, 'HB20', 2019, 7), (8, 'Onix', 2022, 8), (9, 'Gol', 2010, 9), (10, 'Palio', 2014, 10),
(11, 'Uno', 2011, 11), (12, 'Argo', 2021, 12), (13, 'Cronos', 2020, 13), (14, 'Sandero', 2017, 14), (15, 'Logan', 2016, 15),
(16, 'Duster', 2019, 16), (17, 'Kwid', 2022, 17), (18, 'Cruze', 2018, 18), (19, 'Tracker', 2021, 19), (20, 'S10', 2015, 20),
(21, 'Hilux', 2020, 21), (22, 'Etios', 2016, 22), (23, 'Yaris', 2019, 23), (24, 'Polo', 2021, 24), (25, 'Virtus', 2022, 25),
(26, 'T-Cross', 2021, 26), (27, 'Nivus', 2022, 27), (28, 'Compass', 2020, 28), (29, 'Renegade', 2019, 29), (30, 'Commander', 2022, 30),
(31, 'EcoSport', 2018, 31), (32, 'Ka', 2019, 32), (33, 'Fiesta', 2015, 33), (34, 'Ranger', 2021, 34), (35, 'Fit', 2017, 35),
(36, 'City', 2020, 36), (37, 'HR-V', 2021, 37), (38, 'Sentra', 2016, 38), (39, 'Versa', 2021, 39), (40, 'Kicks', 2022, 40),
(41, 'Creta', 2021, 41), (42, 'Tucson', 2018, 42), (43, 'Peugeot 208', 2022, 43), (44, 'C3', 2021, 44), (45, 'Mobi', 2022, 45),
(46, 'Captur', 2020, 46), (47, 'Oroch', 2019, 47), (48, 'Spin', 2018, 48), (49, 'Fiorino', 2021, 49), (50, 'Saveiro', 2020, 50);


INSERT INTO Mecanicos (id_mecanico, nome, especialidade) VALUES
(1, 'Roberto', 'Motores'), (2, 'Marcos', 'Suspensão'), (3, 'Aline', 'Elétrica'), (4, 'Sérgio', 'Motores'),
(5, 'Cláudio', 'Freios'), (6, 'Fábio', 'Alinhamento'), (7, 'Paula', 'Injeção Eletrônica'), (8, 'Márcio', 'Suspensão'),
(9, 'Renato', 'Câmbio'), (10, 'Patrícia', 'Ar Condicionado'), (11, 'Jorge', 'Motores'), (12, 'Sônia', 'Elétrica'),
(13, 'Bruno', 'Pintura'), (14, 'Carlos', 'Lanternagem'), (15, 'Davi', 'Motores'), (16, 'Eduardo', 'Suspensão'),
(17, 'Flávia', 'Elétrica'), (18, 'Gilberto', 'Freios'), (19, 'Hugo', 'Motores'), (20, 'Ítalo', 'Injeção Eletrônica'),
(21, 'Jair', 'Câmbio'), (22, 'Kelly', 'Motores'), (23, 'Luís', 'Elétrica'), (24, 'Marta', 'Suspensão'), (25, 'Nilson', 'Freios'),
(26, 'Otávio', 'Motores'), (27, 'Pedro', 'Injeção Eletrônica'), (28, 'Quiteria', 'Elétrica'), (29, 'Ronaldo', 'Suspensão'), (30, 'Sandra', 'Ar Condicionado'),
(31, 'Tânia', 'Motores'), (32, 'Ubirajara', 'Câmbio'), (33, 'Vagner', 'Elétrica'), (34, 'Wanda', 'Suspensão'), (35, 'Xavier', 'Freios'),
(36, 'Yago', 'Motores'), (37, 'Zilda', 'Injeção Eletrônica'), (38, 'Arthur', 'Elétrica'), (39, 'Breno', 'Suspensão'), (40, 'Célia', 'Motores'),
(41, 'Diego', 'Câmbio'), (42, 'Eliane', 'Freios'), (43, 'Fagner', 'Elétrica'), (44, 'Gerson', 'Motores'), (45, 'Heloísa', 'Suspensão'),
(46, 'Ivan', 'Injeção Eletrônica'), (47, 'Jussara', 'Câmbio'), (48, 'Kleber', 'Motores'), (49, 'Lúcia', 'Freios'), (50, 'Mauro', 'Elétrica');


INSERT INTO servicos (id_servico, descrição, preco_base) VALUES
(1, 'Troca de Óleo', 150.00), (2, 'Alinhamento', 80.00), (3, 'Revisão Elétrica', 200.00), (4, 'Troca de Pastilhas', 120.00),
(5, 'Balanceamento', 60.00), (6, 'Limpeza de Bicos', 180.00), (7, 'Carga de Gás AC', 150.00), (8, 'Troca de Filtro Ar', 50.00),
(9, 'Substituição Amortecedor', 450.00), (10, 'Reparo de Motor', 1500.00), (11, 'Troca de Embreagem', 800.00), (12, 'Sangria de Freio', 90.00),
(13, 'Troca de Velas', 110.00), (14, 'Ajuste de Farol', 40.00), (15, 'Troca de Bateria', 350.00), (16, 'Higienização Interna', 120.00),
(17, 'Troca de Correia Dentada', 600.00), (18, 'Cambagem', 100.00), (19, 'Reparo de Radiador', 250.00), (20, 'Troca de Pneu', 40.00),
(21, 'Polimento', 300.00), (22, 'Cristalização', 500.00), (23, 'Troca Fluido Freio', 130.00), (24, 'Limpeza Arrefecimento', 160.00), (25, 'Troca de Cabo Vela', 90.00),
(26, 'Pintura Parachoque', 400.00), (27, 'Martelinho de Ouro', 150.00), (28, 'Troca de Lâmpada', 20.00), (29, 'Revisão Geral', 450.00), (30, 'Troca Terminal Direção', 140.00),
(31, 'Troca de Pivô', 130.00), (32, 'Troca Bucha Bandeja', 110.00), (33, 'Alinhamento Farol', 50.00), (34, 'Escaneamento Injeção', 100.00), (35, 'Troca de Sensor ABS', 250.00),
(36, 'Reparo Alternador', 300.00), (37, 'Troca de Bobina', 280.00), (38, 'Troca de Junta Cabeçote', 900.00), (39, 'Retífica de Disco', 100.00), (40, 'Troca de Escapamento', 350.00),
(41, 'Solda Escapamento', 80.00), (42, 'Troca de Bomba Combustível', 380.00), (43, 'Troca de Boia Tanque', 150.00), (44, 'Regulagem de Válvulas', 200.00), (45, 'Troca de Coxim Motor', 220.00),
(46, 'Troca de Junta Homocinética', 280.00), (47, 'Troca de Rolamento Roda', 180.00), (48, 'Reparo de Vidro Elétrico', 120.00), (49, 'Reparo Trava Elétrica', 100.00), (50, 'Instalação de Som', 200.00);


INSERT INTO ordem_Servico (id_os, data_emissão, valor_total, stats, id_veiculo, id_mecanico) VALUES
(1, '2024-01-10', 300.00, 'Finalizado', 1, 1), (2, '2024-01-12', 150.00, 'Finalizado', 2, 1), (3, '2024-02-01', 80.00, 'Aberto', 3, 2),
(4, '2024-02-05', 450.00, 'Finalizado', 4, 3), (5, '2024-02-10', 120.00, 'Finalizado', 5, 4), (6, '2024-02-15', 180.00, 'Aberto', 6, 5),
(7, '2024-02-20', 250.00, 'Finalizado', 7, 6), (8, '2024-02-25', 1500.00, 'Aberto', 8, 7), (9, '2024-03-01', 90.00, 'Finalizado', 9, 8),
(10, '2024-03-05', 200.00, 'Finalizado', 10, 9), (11, '2024-03-10', 350.00, 'Aberto', 11, 10), (12, '2024-03-15', 600.00, 'Finalizado', 12, 11),
(13, '2024-03-20', 100.00, 'Finalizado', 13, 12), (14, '2024-03-25', 150.00, 'Aberto', 14, 13), (15, '2024-04-01', 400.00, 'Finalizado', 15, 14),
(16, '2024-04-05', 120.00, 'Finalizado', 16, 15), (17, '2024-04-10', 800.00, 'Aberto', 17, 16), (18, '2024-04-15', 50.00, 'Finalizado', 18, 17),
(19, '2024-04-20', 110.00, 'Finalizado', 19, 18), (20, '2024-04-25', 200.00, 'Aberto', 20, 19), (21, '2024-05-01', 150.00, 'Finalizado', 21, 20),
(22, '2024-05-05', 300.00, 'Finalizado', 22, 21), (23, '2024-05-10', 180.00, 'Aberto', 23, 22), (24, '2024-05-15', 450.00, 'Finalizado', 24, 23),
(25, '2024-05-20', 120.00, 'Finalizado', 25, 24), (26, '2024-05-25', 60.00, 'Aberto', 26, 25), (27, '2024-06-01', 250.00, 'Finalizado', 27, 26),
(28, '2024-06-05', 150.00, 'Finalizado', 28, 27), (29, '2024-06-10', 90.00, 'Aberto', 29, 28), (30, '2024-06-15', 200.00, 'Finalizado', 30, 29),
(31, '2024-01-20', 1200.00, 'Finalizado', 31, 30), (32, '2024-01-25', 350.00, 'Finalizado', 32, 31), (33, '2024-02-28', 150.00, 'Aberto', 33, 32),
(34, '2024-03-02', 400.00, 'Finalizado', 34, 33), (35, '2024-03-12', 110.00, 'Finalizado', 35, 34), (36, '2024-03-22', 250.00, 'Aberto', 36, 35),
(37, '2024-04-02', 600.00, 'Finalizado', 37, 36), (38, '2024-04-12', 300.00, 'Finalizado', 38, 37), (39, '2024-04-22', 150.00, 'Aberto', 39, 38),
(40, '2024-05-02', 90.00, 'Finalizado', 40, 39), (41, '2024-05-12', 200.00, 'Finalizado', 41, 40), (42, '2024-05-22', 350.00, 'Aberto', 42, 41),
(43, '2024-06-02', 400.00, 'Finalizado', 43, 42), (44, '2024-06-12', 120.00, 'Finalizado', 44, 43), (45, '2024-06-22', 800.00, 'Aberto', 45, 44),
(46, '2024-01-05', 50.00, 'Finalizado', 46, 45), (47, '2024-01-15', 110.00, 'Finalizado', 47, 46), (48, '2024-01-25', 200.00, 'Aberto', 48, 47),
(49, '2024-02-05', 150.00, 'Finalizado', 49, 48), (50, '2024-02-15', 300.00, 'Finalizado', 50, 49);


INSERT INTO itens_servicos (id_os, id_servico, quantidade) VALUES
(1, 1, 1), (1, 2, 1), (2, 1, 1), (3, 2, 1), (4, 9, 1),
(5, 4, 1), (6, 6, 1), (7, 7, 1), (8, 10, 1), (9, 12, 1),
(10, 3, 1), (11, 15, 1), (12, 17, 1), (13, 18, 1), (14, 1, 1),
(15, 26, 1), (16, 16, 1), (17, 11, 1), (18, 28, 2), (19, 13, 1),
(20, 3, 1), (21, 7, 1), (22, 21, 1), (23, 6, 1), (24, 29, 1),
(25, 4, 1), (26, 5, 1), (27, 7, 1), (28, 1, 1), (29, 12, 1),
(30, 3, 1), (31, 38, 1), (32, 15, 1), (33, 1, 1), (34, 26, 1),
(35, 13, 1), (36, 35, 1), (37, 17, 1), (38, 21, 1), (39, 7, 1),
(40, 25, 1), (41, 3, 1), (42, 40, 1), (43, 26, 1), (44, 16, 1),
(45, 11, 1), (46, 14, 1), (47, 13, 1), (48, 3, 1), (49, 7, 1), (50, 21, 1);

SELECT 
    c.nome AS Nome_Cliente, 
    v.modelo AS Modelo_Veiculo
FROM clientes c
LEFT JOIN veiculos v ON c.id_cliente = v.id_cliente;


SELECT 
    m.nome AS Mecanico, 
    COUNT(os.id_os) AS Total_OS
FROM mecanicos m
LEFT JOIN ordem_servico os ON m.id_mecanico = os.id_mecanico
GROUP BY m.nome
ORDER BY Total_OS DESC;



SELECT 
    SUM(os.valor_total) AS Faturamento_Total_SP
FROM ordem_servico os
JOIN veiculos v ON os.id_veiculo = v.id_veiculo
JOIN clientes c ON v.id_cliente = c.id_cliente
WHERE c.cidade = 'São Paulo';



SELECT 
    v.modelo AS Veiculo, 
    m.nome AS Mecanico, 
    s.descrição AS Servico
FROM ordem_servico os
JOIN veiculos v ON os.id_veiculo = v.id_veiculo
JOIN mecanicos m ON os.id_mecanico = m.id_mecanico
JOIN item_servicos its ON os.id_os = its.id_os
JOIN servicos s ON its.id_servico = s.id_servico
WHERE os.status = 'Aberto';



SELECT 
    c.nome, 
    SUM(os.valor_total) AS Total_Gasto
FROM clientes c
JOIN veiculos v ON c.id_cliente = v.id_cliente
JOIN ordem_servico os ON v.id_veiculo = os.id_veiculo
GROUP BY c.id_cliente, c.nome
HAVING SUM(os.valor_total) > (
    SELECT AVG(valor_total) FROM ordem_servico
)
ORDER BY Total_Gasto DESC;