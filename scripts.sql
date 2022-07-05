CREATE DATABASE MOC;
GO
USE MOC
GO

CREATE TABLE Clientes(
Id_Cliente INT IDENTITY(1,1) PRIMARY KEY,
Nome VARCHAR(100),
Dat_Nasc DATE,
Dat_Cadastro DATE);


CREATE TABLE Categoria(
Id_Categoria INT IDENTITY(1,1) PRIMARY KEY,
Nome VARCHAR(100));


CREATE TABLE Item(
Id_Item INT IDENTITY(1,1) PRIMARY KEY,
Nome VARCHAR(200),
Id_Categoria INT,
Pre_Unit decimal(15,2),
Dat_Cadastro DATE
CONSTRAINT fk_Id_Categoria FOREIGN KEY (Id_Categoria) REFERENCES Categoria (Id_Categoria)
);


CREATE TABLE Pedidos(
Id_Pedido INT IDENTITY(1,1) PRIMARY KEY,
Id_Cliente INT NOT NULL,
Dat_Pedido DATE
CONSTRAINT fk_Id_Cliente FOREIGN KEY (Id_Cliente) REFERENCES Clientes (Id_Cliente)
);


CREATE TABLE Ped_Itens(
Id_ped_itens INT IDENTITY(1,1) PRIMARY KEY,
Id_Pedido INT NOT NULL,
Id_Item INT NOT NULL,
Qtde INT
CONSTRAINT fk_Id_Pedido FOREIGN KEY (Id_Pedido) REFERENCES Pedidos (Id_Pedido),
CONSTRAINT fk_Id_Item FOREIGN KEY (Id_Item) REFERENCES Item (Id_Item)
);


CREATE TABLE Estoque(
Id_Estoque INT IDENTITY(1,1) PRIMARY KEY,
Id_Item INT,
Qtde INT
CONSTRAINT fk_Id_Item_Estoque FOREIGN KEY (Id_Item) REFERENCES Item (Id_Item)
);



INSERT INTO Clientes (Nome, Dat_Nasc, Dat_Cadastro) VALUES ('João Alberto', '1989-01-07','2020-01-01');
INSERT INTO Clientes (Nome, Dat_Nasc, Dat_Cadastro) VALUES ('Eliane Silva', '1970-02-15','2020-05-05');
INSERT INTO Clientes (Nome, Dat_Nasc, Dat_Cadastro) VALUES ('Mateus Henrique', '1982-04-30','2020-02-03');
INSERT INTO Clientes (Nome, Dat_Nasc, Dat_Cadastro) VALUES ('William Borges', '1976-12-10','2020-02-03');
INSERT INTO Clientes (Nome, Dat_Nasc, Dat_Cadastro) VALUES ('Maria do Carmo', '1980-11-15','2020-01-01');
INSERT INTO Clientes (Nome, Dat_Nasc, Dat_Cadastro) VALUES ('Roberta Piezek', '1990-07-09','2020-01-02');
INSERT INTO Clientes (Nome, Dat_Nasc, Dat_Cadastro) VALUES ('Carlos Menegueti', '1965-12-25','2020-02-08');
INSERT INTO Clientes (Nome, Dat_Nasc, Dat_Cadastro) VALUES ('Daniel Oliveira', '1980-09-11','2020-03-04');
INSERT INTO Clientes (Nome, Dat_Nasc, Dat_Cadastro) VALUES ('Francieli Jesus', '1987-10-14','2020-01-01');
INSERT INTO Clientes (Nome, Dat_Nasc, Dat_Cadastro) VALUES ('Renato Portaluppi', '1972-11-20','2020-03-04');


INSERT INTO Categoria (Nome) VALUES ('Calçados');
INSERT INTO Categoria (Nome) VALUES ('Roupas');
INSERT INTO Categoria (Nome) VALUES ('Equipamentos');
INSERT INTO Categoria (Nome) VALUES ('Futebol');
INSERT INTO Categoria (Nome) VALUES ('Bikes');


INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Bola de Futsal 2020', '4', '65.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Bola de Futebol Campo UEFA', '4', '99.99','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Luva Goleiro Tamanho 7', '4', '55.00','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Caneleira M', '4', '15.50','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Mochila Academy', '3', '99.99','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Mala Active', '4', '179.99','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Par de Halteres', '4', '99.00','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Caixa de Som', '3', '249.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Bicicleta Aro 29 KSW Aluminio', '5', '1499.00','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Anilha de Ferro', '3', '109.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Lanterna Traseiro', '5', '9.48','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Suporte Veicular Smart', '3', '189.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Camisa Seleção Brasileira 2019', '2', '189.00','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Fone de Ouvido Sem Fio JBL', '3', '969.40','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Calça MXD', '2', '69.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Corda Speed Rope', '3', '24.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Camisa Polo Slim', '2', '189.99','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Bota Couro', '1', '239.99','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Pula Corda', '3', '23.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Buzina Fon-Fon', '5', '8.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Garrafa Squeeze', '5', '10.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Short Dri-Fit', '2', '99.99','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Chinelo Rider Full NBA', '1', '49.99','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Sapatilha Camurça', '1', '79.99','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Sapatênis Couro', '1', '99.99','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Manopla Strada', '5', '10.42','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Pedal Calypson', '5', '12.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Calça Térmica', '2', '89.90','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Bermuda Run', '2', '79.99','2020-01-01');
INSERT INTO Item (Nome, Id_Categoria, Pre_Unit, Dat_Cadastro) VALUES ('Camisa Real Madrid', '2', '179.99','2020-01-01');




INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('10', '2020-02-05');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('1', '2020-02-05');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('3', '2020-02-06');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('4', '2020-02-06');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('2', '2020-02-06');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('5', '2020-02-09');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('6', '2020-02-09');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('2', '2020-02-10');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('1', '2020-02-10');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('9', '2020-02-10');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('10', '2020-02-10');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('4', '2020-02-11');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('8', '2020-02-12');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('2', '2020-02-12');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('4', '2020-02-15');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('6', '2020-02-15');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('7', '2020-02-15');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('9', '2020-02-15');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('8', '2020-02-15');
INSERT INTO Pedidos (Id_Cliente, Dat_pedido) VALUES ('1', '2020-02-15');



INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('1', '17', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('2', '1', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('3', '5', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('4', '3', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('5', '20', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('6', '23', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('7', '30', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('8', '21', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('9', '21', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('10', '23', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('11', '3', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('12', '3', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('13', '21', '2');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('14', '8', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('15', '2', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('16', '15', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('17', '12', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('18', '21', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('19', '13', '1');
INSERT INTO Ped_Itens (Id_Pedido, Id_Item, Qtde) VALUES ('20', '25', '1');



INSERT INTO Estoque(Id_Item, Qtde) VALUES ('1', '4');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('2', '2');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('3', '1');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('4', '5');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('5', '7');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('6', '3');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('7', '1');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('8', '5');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('9', '1');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('10', '2');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('11', '5');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('12', '8');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('13', '2');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('14', '1');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('15', '15');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('16', '5');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('17', '5');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('18', '2');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('19', '2');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('20', '6');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('21', '20');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('22', '3');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('23', '2');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('24', '1');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('25', '1');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('26', '3');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('27', '8');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('28', '2');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('29', '4');
INSERT INTO Estoque(Id_Item, Qtde) VALUES ('30', '3');