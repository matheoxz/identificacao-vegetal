import cv2
import os

# img = cv2.imread(imagem)

# crop_img = img[y:y+h, x:x+w]                  -> crop
# width, height = cv2.GetSize(img)              -> obter dimensões
# new_image = cv2.resize(img,(newx,newy))       -> resize

class NormalizadorDataset:

    def __init__(self, path_dataset, dimensao):
        self.dimensao = dimensao
        for dir_ in self.acessa_dir(path_dataset):
            try:
                cort = os.path.join(dir_, 'cortada')
                os.mkdir(cort)
            except:
                print('pasta ja criada')
            else:
                print('Criada a pasta '+ cort)

            for img in self.lista_img(dir_):
                new_img = cv2.imread(os.path.join(dir_,img))
                new_img = self.corta(new_img)
                try:
                    new_img = self.resize(new_img)
                    self.save_img(dir_, img, new_img)
                except:
                    print('Erro ao normalizar ' + dir_+img)


    def acessa_dir(self, diretorio):
        dirs = [os.path.join(diretorio, nome) for nome in os.listdir(diretorio)]
        for dir_ in dirs:
            yield dir_

    def lista_img(self, dir_):
        imgs = [img for img in os.listdir(dir_) if img.lower().endswith('.jpg')]
        for img in imgs:
            yield img

    def corta(self, img):   
        min_ = min(img.shape[0], img.shape[1])
        if img.shape[0] < img.shape[1]:
            min_ = img.shape[0]
            cropped_img = img[:, img.shape[1]//2 - min_//2 : img.shape[1]//2 + min_//2]
        else:
            min_ = img.shape[1]
            cropped_img = img[img.shape[0]//2 - min_//2 : img.shape[0]//2 + min_//2, :]
        return cropped_img

    def resize(self, img):
        img_resized =cv2.resize(img,(self.dimensao,self.dimensao))
        return img_resized
        
    def save_img(self, dir_, img_p, img):
        path = os.path.join(dir_, 'cortada', img_p)
        cv2.imwrite(path, img)
        print('Imagem '+path+ ' criada')


NormalizadorDataset('../google-images-minerador/PANCS', 224)