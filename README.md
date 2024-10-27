

## No meu caso fiz a instalação do Linux Mint

1. **Download da ISO**: ISO do Linux Mint no [site oficial](https://linuxmint.com/download.php).
2. **Pendrive Bootável**: Criei um pendrive bootável com a ISO baixada.
3. **Instalação do Sistema**: Inicializei o sistema a partir do pendrive.

Configurei todo o sistema para estudos e trabalho.

## Instalação e Configuração do Nginx

### Passo a Passo

1. **Instalação do Nginx**: Use o comando abaixo para instalar o Nginx:

   ```bash
   sudo apt install nginx
   ```

   > **Nota**: A aplicação não subiu na primeira tentativa, pois a porta 80 já estava sendo usada pelo PgAdmin.

2. **Alteração da Porta**:
   - Naveguei até o diretório de configuração do Nginx:

     ```bash
     cd /etc/nginx/sites-available/
     ```

   - Editei o arquivo `default` para mudar a porta de 80 para 85:

     ```bash
     sudo nano default
     ```

   - Substitui todas as ocorrências de `listen 80;` para `listen 85;` e salvei o arquivo.

3. **Reiniciei o Nginx**:

   ```bash
   sudo systemctl start nginx
   sudo systemctl status nginx
   ```

   Agora o Nginx está ativo na porta 85.

## 3. Criação do Script de Monitoramento

Para monitorar o status do Nginx, foi criado um script que registra o status em logs distintos para "online" e "offline".

### Funcionamento do Script

   O script armazena variáveis para o monitoramento do status do serviço Nginx. Ele define o diretório onde está localizado e cria variáveis para os caminhos dos arquivos online.log e offline.log. Uma terceira variável, STATUS_SERVER, é configurada para capturar o status do Nginx com o comando systemctl is-active nginx, que retorna active se o serviço estiver funcionando ou inactive se estiver parado.

    ```bash
    STATUS_SERVER=$(systemctl is-active nginx)
    ```

   Este comando retorna `active` ou `inactive`.

   Em seguida, o script verifica o valor de STATUS_SERVER usando uma estrutura IF. Se o Nginx estiver ativo, o script registra essa informação no online.log; caso contrário, ele registra no offline.log.

### Automação com Crontab

Para executar o script a cada 5 minutos, configurei o cron:

1. Acessei o crontab com:

   ```bash
   crontab -e
   ```

2. Adicionei a seguinte linha para agendar a execução do script:

   ```bash
   */5 * * * * /home/modesto/nginx/timer_nginx.sh
   ```

3. Salvei e fechei o crontab.

Agora, o monitoramento está automatizado e atualiza o log a cada 5 minutos.
