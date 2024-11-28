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
As senhas de comunicação com a AWS tem que ser setadas exemplo abaixo:

Para iniciar tem que na maquina Ec2 Bastian e rodar o comando  `aws configure` E colocar os valores.
Ou no ~/.aws/credentials
Colocar o arquivo atual da sessão do Lab da AWS:.
