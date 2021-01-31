# RASPlant

  O RASPlant é um aplicativo desenvolvido em Flutter, com o objetivo de identificar Plantas Alimentícias Não Convencionais (PANCs) nativas da região do interior do estado de São Paulo através de fotos. Para identificar, foi desenvolvida uma rede neural convolucional com a bilioteca TensorFlow, que foi treinada para identificar 8 plantas:
 * Araruta
 * Beldroegão
 * Capiçoba
 * Capuchinha
 * Caruru
 * Ora-pro-nóbis
 * Peixinho
 * Taioba
 
 Para treinar a rede é necessário um dataset, devido à pandemia, não era possível fotografar as espécies em campo, portanto estas foram tiradas do Google Imagens e normalizadas.
<br>   ![alt text](https://github.com/matheoxz/identificacao-vegetal/blob/master/.imagens_readme/Screenshot%20from%202020-11-25%2019-29-52.png)

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
  No geral, os resultados obtidos foram positivos. O aplicativo proposto foi desenvolvido pela equipe de acordo com o que foi planejado, atendendo a todos os requisitos iniciais. As estruturas funcionam como o previsto, entregando boa eficiência e um visual agradável ao usuário. Ademais, o uso do aplicativo é simples e estruturado, transmitindo boa experiência e facilidade em sua utilização. 
Porém, em virtude do uso, para treino da rede neural, de um dataset limitado com relação a algumas espécies de pancs, o sistema de identificação pode entregar resultados imprecisos em algumas ocasiões.  
	A ideia de entregar um aplicativo android de celular capaz de reconhecer espécies de PANCs (Plantas Alimentícias Não Convencionais) endêmicas do Brasil, através de suas fotos sem necessariamente ter acesso à internet foi feita. Embora possa apresentar em alguns momentos erros de identificação, o aplicativo corresponde a ideia do projeto e a precisão do identificador pode ser melhorada futuramente.
	Desenvolvido o projeto, com a aplicação em mãos, e as redes neurais testadas, chegamos à conclusão de que é necessário um dataset que seja dedicado e específico para o problema. 

  
  # Bibliografia
  
  BALSE, Kundan. KundanBalse/Plant-Detection-Using-TensorFlow. GitHub. Disponível em: <https://github.com/KundanBalse/Plant-Detection-Using-TensorFlow>. Acesso em: 28 Dec. 2020.
HOU, Alvin. CryoliteZ/Plants-Identification. GitHub. Disponível em: <https://github.com/CryoliteZ/Plants-Identification>. Acesso em: 28 Dec. 2020. </br>
KUMAR, Neeraj; BELHUMEUR, Peter N.; BISWAS, Arijit; et al. Leafsnap: A Computer Vision System for Automatic Plant Species Identification. Computer Vision – ECCV 2012, p. 502–516, 2012. Disponível em: <https://link.springer.com/chapter/10.1007%2F978-3-642-33709-3_36>. Acesso em: 15 Jun. 2019.</br>
LASSECK, Mario. Image-based Plant Species Identification with Deep Convolutional Neural Networks. [s.l.: s.n., s.d.]. Disponível em: <http://ceur-ws.org/Vol-1866/paper_174.pdf>. Acesso em: 28 Dec. 2020.</br>
LEE, Sue; CHANG, Yang; CHAN, Chee. LifeClef 2017 Plant Identification Challenge: Classifying Plants Using Generic-Organ Correlation Features. [s.l.: s.n., s.d.]. Disponível em: <http://ceur-ws.org/Vol-1866/paper_162.pdf>. Acesso em: 28 Dec. 2020.</br>
NGUYEN, Thi Thanh-Nhan; LE, Thi-Lan; VU, Hai; et al. Towards an Automatic Plant Identification System without Dedicated Dataset. International Journal of Machine Learning and Computing, v. 9, n. 1, p. 26–34, 2019.</br>
PATEL, Umang. umangjpatel/Plant-Classifier. GitHub. Disponível em: <https://github.com/umangjpatel/Plant-Classifier>. Acesso em: 28 Dec. 2020.</br>
RANGEL T. DE ALMEIDA, Gustavo; LOCATELLI SOARES, Virgílio; MOUTINHO DA PONTES, Márcio José; et al. Reconhecimento de Plantas Comestíveis Não Convencionais: Uma Análise de Métodos de Classificação Aplicados à Visão Computacional. Instituto de Engenharia e Geociências - Universidade Federal do Oeste do Pará, .</br>
SUN, Yu; LIU, Yuan; WANG, Guan; et al. Deep Learning for Plant Identification in Natural Environment. Computational Intelligence and Neuroscience, v. 2017, p. 1–6, 2017.
VISHWAJITH, Sujith. sujithv28/Deep-Leafsnap. GitHub. Disponível em: <https://github.com/sujithv28/Deep-Leafsnap>. Acesso em: 28 Dec. 2020.</br>
WANG, Zhaobin; LI, Huale; ZHU, Ying; et al. Review of Plant Identification Based on Image Processing. Archives of Computational Methods in Engineering, v. 24, n. 3, p. 637–654, 2016.</br>
Flutter Documentation. flutter.dev. Disponível em: <https://flutter.dev/docs>.</br>

