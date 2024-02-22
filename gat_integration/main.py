import argparse
import parse_flan_json

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Parser do JSON gerado pelo Flan para CSV do GAT e upload via API")
    parser.add_argument("--path", help="Diretório onde estão os arquivos JSON")
    parser.add_argument("--gat_api_host", help="Host+Port da API do GAT, sem o protocolo")
    parser.add_argument("--gat_api_key", help="API Key do GAT, encodado com base64")
    parser.add_argument("--custom_parser_name", help="Nome do template do Custom Parser a ser utilizado")
    parser.add_argument("--delete_source", help="Flag para assinalar se o JSON gerado pelo Flan deverá ser excluído "
                                                "ou não após o parser", action="store_true")
    args = parser.parse_args()
    parsed_files = parse_flan_json.parse_json(args.path)
    parse_flan_json.send_to_gat_api(parsed_files, args.gat_api_host, args.gat_api_key, args.custom_parser_name, args.delete_source)
