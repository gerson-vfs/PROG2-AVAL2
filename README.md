## Segunda Prova de Programação 2

# Como rodar o Projeto
## Setup
rode `dart pub get` para instalar as dependências necessárias

## Rodando a aplicação
rode `dart main.dart` para executar a aplicação

# Como rodar os testes
## Setup
rode `dart pub get` para instalar as dependências para os testes

## Rodando os testes
rode `dart test` para testar

# Requisitos:
1. As classes Data e DelimitedData são abstratas, portanto, não podem ser instanciadas.

2. Os nomes dos campos de dados são obrigatórios em todos os dados manipulados. A não presença dos nomes dos campos nas strings de dados é condição de erro.

3. As demais classes são concretas e devem implementar os métodos abstratos das classes Data e DelimitedData (getters e setters também são métodos).

4. As implementações dos métodos load() e save() em cada classe concreta devem ser capazes de ler e escrever em arquivos texto no formato que sua respectiva classe representa.

5. O getter hasData deve indicar se existem dados armazenados internamente no objeto. O armazenamento interno não precisa obedecer o formato representado pela classe, podendo ser utilizado qualquer estrutura de dados do Dart que seja conveniente.

6. O membro data representa dois métodos, um getter e um setter (em Dart é permitido ter um getter e um setter na mesma
classe com o mesmo nome).

7. O getter data deve retornar uma única string contendo os dados armazenados internamente no objeto no formato que a classe representa. O método deve retornar uma string vazia (ou, opcionalmente, null) caso não existam dados armazendos no objeto.

8. O setter data deve receber uma única string no formato representado pela classe. Caso o formato seja inválido, uma exceção deve ser levantada.

9. O método clear() limpa os dados armazenados no objeto. Após um clear() o getter hasData deverá retornar false.

10. A implementação do getter “fields” deve retornar uma lista de strings representando os nomes dos campos de dados. Esta lista deve ser atualizada a cada atualização da memória interna do objeto. Caso não existam dados armazenados, a listadeve estar vazia.

11. O getter separator da classe SeparatedData representa um método que retorna o caractere utilizado como separador de campo pelo formato representado pela classe concreta que o implementa.

12. Em todos os métodos devem ser levantadas exceções em caso de erro.

13. Para cada tipo de erro deve ser levantada uma tipo de exceção customizada (criada por você) diferente.

14. Todos os identificadores utilizados na aplicação devem usar a língua inglesa e a notação Camel Case.

15. É facultada a utilização de bibliotecas externas para manipulação dos formatos solicitados.

16. A aplicação deverá ser organizada em arquivos e pastas conforme a necessidade.

17. Deve ser implementado um programa para demonstrar todas as funcionalidades de cada classe, incluindo casos de levantam exceções. Os exemplos de exceção devem ser manipulados por instruções try-catch.

18. A última linha exibida pelo programa deverá conter os nomes dos membros da equipe.

19. Deve ser fornecido juntamente com o código fonte arquivos texto em cada um dos formatos solicitados contendo os mesmos campos e dados. O nome de cada arquivo de dados deverá possuir extensão conforme o formato dos dados que armazena (“.csv”, “.tsv”, “.json” e “.xml”).

20. O código fonte do projeto deverá ser armazenado no GitHub (github.com) em um repositório com acesso público.

21. O repositório do projeto deverá conter um arquivo “README.md” contendo os nomes dos membros da equipe além de, obviamente, os arquivos do projeto (código fonte e os arquivos de dados).

# Autores:
    João de Oliveira Castro Neto
    Gerson Victor
    Daniel Magalhães Farias