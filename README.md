# RASPlant

  O RASPlant é um aplicativo desenvolvido em Flutter, com o objetivo de identificar Plantas Alimentícias Não Convencionais (PANCs) nativas da região do interior do estado de São Paulo através de fotos. Para identificar, foi desenvolvida uma rede neural convolucional com a bilioteca TensorFlow, que foi treinada para identificar 11 plantas:
 * Araruta
 * Beldroegão
 * Capiçoba
 * Capuchinha
 * Caruru
 * Ora-pro-nóbis
 * Peixinho
 * Picão Preto
 * Serralha
 * Taioba
 * Urtiga
 
 Para treinar a rede é necessário um dataset, devido à pandemia, não era possível fotografar as espécies em campo, portanto estas foram tiradas do Google Imagens e normalizadas.
   ![alt text](https://github.com/matheoxz/identificacao-vegetal/blob/master/.imagens_readme/Screenshot%20from%202020-11-25%2019-29-52.png)

## google-images-minerador
  Para conseguir várias imagens das PANCs desejadas, foi construído um minerador de dados com a biblioteca Selenium, que a partir de um arquivo .csv e pesquisa no Google Imagens cada palavra no arquivo com uma Palavra Chave e baixa todas as imagens ali presentes.
  Para rodar é necessário ter no computador instalada a biblioteca Selenium e o Chome WebDriver, um arquivo com o nome das categorias que deseja encontrar as imagens e uma Palavra Chave, por exemplo, carregando a tabela PANCS.csv com a Palavra Chave planta:
  
    GoogleImagesMinerador('PANCS.csv', 'planta')
  
  Ao final do arquivo é instanciada a classe com os parametros desejados, depois basta executar o programa, dentro da pasta:
  
    phyton3 main.py
    
  Após baxar as imagens, foi necessário limpar o dataset manualmente, selecionando as imagens mais úteis para a rede. O algoritmo baixa as imagens na resolução mínima do google imagens (tamanho da imagem pré carregada no Google Imagens).
  
## normalizador-dataset
  Baixadas as imagens, notou-se uma disparidade nos tamanhos e resoluções, portanto foi necessário escolher um tamanho único para que pudessem ser utilizadas na rede, assim, o algoritmo, que faz uso da biblioteca OpenCV corta a imagem num quadrado central, do tamanho do menor lado e redimensiona a imagem para o tamanho escolhido.
    Para rodar é necessário ter no computador instalada a biblioteca OpenCV e a pasta com as imagens baixadas. Ao final do arquivo instancia-se a classe com os parâmetros Caminho da Pasta de Imagens e tamanho desejado (pensando que a imagem ao final será quadrada):
  
    NormalizadorDataset('../google-images-minerador/PANCS', 224)
  
  Depois, basta executar o programa dentro da pasta:
    
    phyton3 main.py
    
  Agora é necessário construir a Rede Neural e o Aplicativo
  
  # Aplicativo
  
  # Rede Neural
  
  # Aplicativo rodando a Rede Neural
  
  # Conclusão
  
  # Bibliografia
