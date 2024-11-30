# trabalhoIAC_112024

Atividade final IaC:
- Apresentação com slides dia 30/11 explicando o que foi feito
- Armazenar código no repositório, pode utilizar o tf variables
- Obs.: Deve funcionar no dia da apresentação!

Detalhes da arquitetura:
- O bastion é apenas para uso do terraform e criação da estrutura
- Server 1 - LAMP deve ter acesso público a página padrão
- Server 2 - NGINX deve ter acesso público a página padrão
- RDS usando qualquer banco de dados - isolado do restante
- Criação de bucket - isolado do restante

------------------------------
Configuração das Credenciais AWS :
1- Via comando aws configure:
No EC2 Bastion, execute: aws configure
OU
2- Insira as credenciais (Access Key, Secret Key, região e formato de saída).
Ou manualmente no arquivo: ~/.aws/credentials
*Coloque as credenciais fornecidas no Lab da AWS diretamente neste arquivo.
