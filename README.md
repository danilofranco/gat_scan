# GAT InfoSec - GAT Scan 

## Sobre a GAT InfoSec

A GAT InfoSec é uma empresa de software especializada em produtos SaaS em segurança da informação, oferecendo soluções para proteger os ativos digitais de seus clientes.

## Sobre o Projeto

Este projeto trata-se de uma ferramenta de varredura de vulnerabilidades de rede baseada no Nmap, e o GAT Core, nossa plataforma central de gerenciamento de segurança. O objetivo é automatizar a detecção de vulnerabilidades em ativos de rede e integrar essas informações ao GAT Core para análise e gerenciamento centralizado.

## O que é o Flan Scan?

O Flan Scan é um scanner de vulnerabilidades de rede desenvolvido pela Cloudflare, que utiliza o Nmap como base. Ele é projetado para ser fácil de implantar e usar, fornecendo relatórios detalhados sobre as vulnerabilidades encontradas nos ativos de rede. Para mais informações sobre o Flan Scan, visite o [repositório oficial no GitHub](https://github.com/cloudflare/flan).

## Como Funciona

O projeto consiste em um contêiner Docker que executa o Flan Scan para varrer as redes especificadas e, em seguida, utiliza um script Python para converter os resultados em um formato compatível com o GAT Core e enviá-los para a plataforma via API.

## Pré-requisitos

- Docker
- Python 3.5 ou superior
- Acesso ao GAT Core

## Como Usar

1. Clone este repositório para o seu ambiente.
2. Edite o arquivo `flan/shared/ips.txt` para incluir os endereços IP ou as redes que deseja escanear.
3. Construa a imagem Docker com o comando `docker build -t gat_images/gat_scan .`.
4. Execute o contêiner com o comando:

    Linux
    ```sh
    docker run --network=host -e GAT_API_HOST=seu_host_do_gat_core -e GAT_API_KEY=sua_chave_do_gat_core -v $(pwd)/flan/shared:/shared gat_images/gat_scan
    ```

    Powershell
    ```powershell
    docker run --network=host -e GAT_API_HOST=host_do_gat_core -e GAT_API_KEY=sua_chave_sem_BEARER -e format=json -v ${PWD}/flan/shared:/shared gat_images/gat_scan
    ```

    Cmd
    ```cmd
    docker run --network=host -e GAT_API_HOST=host_do_gat_core -e GAT_API_KEY=sua_chave_sem_BEARER -e format=json -v %cd%/flan/shared:/shared gat_images/gat_scan
    ```

Certifique-se de substituir `host_do_gat_core`, `sua_chave_sem_BEARER` pelos valores apropriados para o seu ambiente.

   Substitua `host_do_gat_core` pelo endereço do seu GAT Core e `sua_chave_sem_BEARER` pela sua chave de API do GAT Core.

## Contribuindo

Sua contribuição é bem-vinda! Sinta-se à vontade para abrir issues ou pull requests para sugerir melhorias ou adicionar novas funcionalidades.

## Licença

Este projeto é licenciado sob a [Licença MIT](LICENSE).