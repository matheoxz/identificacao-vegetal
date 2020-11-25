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

## google-images-minerador
  Para conseguir várias imagens das PANCs desejadas, foi construído um minerador de dados com a biblioteca Selenium, que 
  ![alt text](https://github.com/matheoxz/identificacao-vegetal/blob/master/.imagens_readme/Screenshot%20from%202020-11-25%2019-29-52.png)

