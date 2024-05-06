create database ex1;
use ex1;

-- criação da tabela "Pedidos"

create table Pedidos (
	IDPedido int auto_increment primary key,
    DataPedido datetime,
    NomeCliente varchar(100)
);

-- Inserção de dados de exemplo

insert into Pedidos (DataPedido, NomeCliente) values (now(), 'Cliente 1'),
(now(), 'Cliente 2'),
(now(), 'Cliente 3');

-- Criação da Trigger

DELIMITER $

create trigger RegistroDataCriacaoPedido
before insert on Pedidos
for each row
begin
	set NEW.DataPedido = now();
end;
$

DELIMITER ;

-- Inserção de um novo registro na tabela "Pedidos" sem fornecer a data

insert into Pedidos (NomeCliente) values ('Novo Cliente');

-- Consulta para verificar os resultados

select * from Pedidos;
