Universidade de Caxias do Sul - Centro de Computação e Tecnologia da Informação 

Disciplina: SIS0206A – Organização de Arquivos
Professor: Daniel Luis Notari
Especificação do Trabalho I
Este trabalho de implementação consiste em implementar uma organização de arquivos indexada
com o uso de índices em arquivos. A estrutura do registro de tamanho fixo a ser usado é a seguinte:
• codigo: representa o identificador do livro, é um código numérico de 7 dígitos, representa a
chave primária do arquivo.
• título: campo alfanumérico de 45 posições, representa o título do livro.
• autor: campo alfanumérico de 30 posições, representa o nome do autor principal do livro.
• edição: campo de um dígito, representa a edição do livro.
• ano: campo numérico de 4 dígitos, representando o ano de publicação do livro.
Deve-se gerar o arquivo de dados para a estrutura de registro acima usando registro fixo para
três milhões de registros. Use informações reais para gerar este arquivo. Os valores da chave
primária devem ser geradas de forma aleatório (não sequencial e não consecutivos).
Implemente uma consulta pelo campo código usando um índice exaustivo a ser criado na
forma de um arquivo sequencial, ou seja, para cada entrada de dados uma nova entrada deve ser
gerada no arquivo de índice. Esta consulta deve ser implementada usando a pesquisa binária.
Implemente uma segunda consulta pelo campo código usando um índice a ser criado com a
organização de arquivos de acesso direto com endereçamento indireto em um arquivo. Para isto,
você deve definir o tamanho dos blocos e a função hash a ser aplicada para inserir o registro do
índice. O número de conflitos será muito grande. É recomendado fazer uma leitura do aquivo de
dados para testar possíveis funções hash a serem usadas.
O trabalho pode ser feito em grupos de quatro pessoas (nem mais nem menos). As
linguagens de programação C, C# e Java podem ser usadas para o desenvolvimento deste trabalho.
O comando static não pode ser utilizado para as linguagens de programação orientadas a objeto (e
nem comandos semelhantes) na definição de atributos e métodos. O uso de coleções, vetores,
matrizes, listas encadeadas e estruturas de dados semelhantes não podem ser usadas neste trabalho.
Para a montagem do registro de tamanho fixo não podem ser usados quaisquer delimitadores. Um
delimitador somente pode ser usado para pular linha. Todas as operações devem ser feitas em
arquivo. Os programas fonte, o arquivo de dados e os arquivos de índice devem ser salvos no
webfolio da disciplina até a data indicada no cronograma da disciplina. No dia da apresentação,
cada grupo deverá demonstrar o programa para o professor.
