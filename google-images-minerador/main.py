import os
from selenium import webdriver
from time import sleep
import csv
import urllib.request

class GoogleImagesMinerador:
    #A variável path serve para guardar onde será salvo o arquivo (pasta raiz e pasta), utilizada na função criaPasta
    path = ''

    def __init__(self, pathLista, palavraChave):
        '''
        A classe roda uma instância do Chrome, procura cada item da Lista dada, que deve ser um csv, no google imagens e baixa em torno de 100 imagens.
        Cada imagem é salva numa pasta com o nome do arquivo da lista/ sua categoria.
        palavra chave é responsável por limitar o que o google irá mostrar (exemplo: planta, para que se retornem somente imagens de planta)
        
        pathLista - arquivo csv com a lista do que se deseja pesquisar
        palavraChave - palavras chave que acompanham a pesquisa, separadas por espaço
        '''
        
        self.pathLista = pathLista
        #seta nome do diretório raiz com o mesmo nome do arquivo csv dado em pathLista
        self.nome = pathLista.split('.')[0]
        #troca os espaços por '+' para a pesquisa na url do google
        self.palavraChave = palavraChave.replace(' ', '+')
        
        #abre o navegador Chrome
        self.driver = webdriver.Chrome()

        #abre a lista de pathLista e salva na list lista
        lista = self.readLista()

        #itera para cada categoria na lista, criando sua pasta, pesquisando e baixando as imagens
        for categoria in lista:
            self.criaPasta(categoria)
            self.baixaImagens(categoria)

        #fecha o navegador após o fim
        self.closeBrowser()
        
    
    def closeBrowser(self):
        '''
        Função responsável por fechar o navegador.
        '''
        self.driver.close()
     
    
    def readLista(self): 
        '''
        Função reponsável por criar uma lista de plantas a serem pesquisadas a partir de um arquivo .csv fornecido através da variável
        pathLista da função principal.  
        '''
        
        #Variável lista vai ser usada para armazenar as plantas a serem pesquisadas
        lista = []
        #Abrindo o arquivo .csv no modo de leitura                        
        with open(self.pathLista, 'r') as arq_csv :
            #Utilizando a biblioteca csv para ler os arquivos 
            arq = csv.reader(arq_csv, delimiter = '\n')
            #Salvando as plantas a serem pesquisadas
            for col in arq:
                lista.append(col[0])
        #Retorna a lista com todas as plantas como resultado 
        return lista

    def criaPasta(self, nome):
        '''
        Cria um diretório raiz(self.nome) e dentro dele são criadas pastas para cada uma das categorias(nome) plantas analisadas
        '''
        #Verifica existência da pasta raiz e a cria se não houver uma com nome igual
        if not os.path.exists(self.nome):
            os.mkdir(self.nome)
        #Cria uma pasta com o nome da categoria caso ela não tenha sido criada ainda
        if not os.path.exists(self.nome + '/' + nome):
            os.mkdir(self.nome + '/' +nome)
        else:
            print('A pasta '+ nome+ ' já está criada')
        self.path = self.nome + '/' + nome

    def baixaImagens(self, categoria):
        '''
        categoria - é a palavra que deverá ser pesquisada no google imagens para que sejam baixadas as imagens referentes

        procura a categoria e baixa as imagens
        '''
        
        #garante que a categoria, se tiver espaços, sejam trocados por '+' para que seja usado na url do google
        pesquisa = categoria.replace(" ", '+')

        #vai ao site google imagens e pesquisa a imagem direto pela url
        self.driver.get('https://www.google.com/search?q='+ pesquisa + '+' + self.palavraChave +'&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjPwcyUu5TsAhUZILkGHW3QC1kQ_AUoAXoECCEQAw&biw=1920&bih=903')
       
        #da um scroll ate o fim da página para aumentar o número de imagens encontradas
        self.driver.execute_script("window.scrollBy(0, document.body.scrollHeight)", "")
        #espera até que tudo seja carregado
        self.driver.implicitly_wait(10)

        #pega tudo que for um img na página e salva na lista images
        images = self.driver.find_elements_by_tag_name('img')

        #para cada imagem na lista images, o src (url onde a imagem está) será encontrado e baixado no arquivo i, que é o número da imagem encontrada
        for i, image in enumerate(images):
            #pega a url onde está a imagem
            img = image.get_attribute('src')
            #checa se de fato é uma url, ou seja, uma string
            if type(img) is str:
                #tenta baixar a imagem, se não for possível, printa erro
                try:
                    #baixa a imagem na url img, salvando no caminho Raiz/Categoria/i.jpg
                    urllib.request.urlretrieve(img, self.path+'/'+ str(i) +'.jpg')
                    print('Baixando ' + img)
                except:
                    print('Erro na url')
        



#Exemplo de utilização
x = GoogleImagesMinerador('PANCS.csv', 'planta')
x.readLista()

#google-images-minerador