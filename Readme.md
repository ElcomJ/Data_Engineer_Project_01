# Project 01 - Datawarehouse Northwind

> Resolução de problemas empresariais utilizando AWS Cloud desde o armazenamento local, até à visualização no painel de controlo.

## Objetivo:

> Responder perguntas de negócios a parte de requisições e problemas de uma empresa fictícia,
utilizando o banco de dados da empresa.

Relacional DB Schema:

![Schema](Images/Relacional_model.PNG)

## Preparação do Ambiente de Trabalho

> Abaixo estara o passo a passo desde a preparação do ambiente até a criação das tabelas no
Database:

 - Criação do Cluster no AWS Redshift.
 - Criação do Datawarehouse Northwind.
 - Upload dos arquivos .csv do PC Local para o bucket na AWS S3.
 - Criação das tabelas respectiva a cada arquivo .csv no bucket.
 - Utilizar o script de [**Copy**]() para inserir os dados do S3 nas tabelas do Northwind.
 - Realizar uma Querie de teste para saber se os dados foram inseridos corretamente.
