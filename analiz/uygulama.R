getwd()
df <- read.csv("insurance.csv")
install.packages("ggplot2")
install.packages("tidyverse")
library(tidyverse)
head(df)
glimpse(df)
summary(df)
df$region
kadin <- df[df$sex == "female", ]
View(kadin)
Erkek <- df[df$sex == "male", ]
View(Erkek)
table(df$sex)

colSums(is.na(df))

#histogram
plot_ege_hist <- ggplot(df, aes(x=age))+
  geom_histogram(binwidth = 5,
                  fill = "orange",
                  color = "black",
                  alpha = 0.8)+
                   labs(title= "yaş dağılımı",
                        x= "yaş",
                        y="kişi sayısı")+
                   theme_light()
plot_ege_hist




#bunu vki telefonda var ona göre ayarla çalıştır
plot_bmi_hist <- ggplot(df, aes( x = bmi)) +
  geom_histogram(binwidth = 2,
                 fill = "blue",
                 color = "white",
                 alpha = 0.8)+
  labs(title= "vki dağılımı",
       x= "vki",
       y="kişi sayısı")+
  theme_light()
plot_bmi_hist

#---------------------------------------------------


plot_children_hist <- ggplot(df, aes(x=children))+
  geom_histogram(binwidth = 1,
                 fill = "red",
                 color = "white",
                 alpha = 0.8)+
  labs(title= "çocuk sayısı dağılımı",
       x= "çocuk sayısı",
       y="kişi sayısı")+
  theme_light()
plot_children_hist
#-----------------------------------------------------


plot_maliyet_hist <- ggplot(df, aes(x=expenses))+
  geom_histogram(binwidth = 1000,
                 fill = "pink",
                 color = "black",
                 alpha = 0.8)+
  labs(title= "maliyet dağılımı",
       x= "maliyetler",
       y="kişi sayısı")+
  theme_light()
plot_maliyet_hist
#------------------------------------------------------

install.packages("patchwork")
library(patchwork)


(plot_ege_hist + plot_bmi_hist) / (plot_children_hist + plot_maliyet_hist)


rlang::last_trace()

#------------------------------------------------------



plot_sex_bar <- ggplot(df, aes(x=sex, fill=sex))+
  geom_bar()+
                
  labs(title= "cinsiyet dağılımı",
       x= "cinsiyet",
       y="kişi sayısı")+
  theme_light()
theme(legend.position = "none")
plot_sex_bar


#----------------------------------------------------
# Dil ayarı
Sys.setlocale("LC_ALL","tr_TR.UTF-8") 

# Grafik oluşturma
plot_smoker_bar <- ggplot(df, aes(x=smoker, fill=smoker)) +
  geom_bar() +
  scale_fill_manual(values=c(
    "no" ="blue",
    "yes" ="green")) +
  labs(title="Sigara İçme Durumu", 
       x="Sigara İçiyor mu?",
       y="Kişi Sayısı") +
  theme_light() # Buradaki + işaretini kaldırdık

# Grafiği ekrana basma
plot_smoker_bar

#----------------------------------------------------------------
# Dil ayarı
Sys.setlocale("LC_ALL","tr_TR.UTF-8") 

# Grafik oluşturma
plot_region_bar <- ggplot(df, aes(x=region, fill=region)) +
  geom_bar() +
  scale_fill_manual(values=c(
    "southwest" = "blue",
    "southeast" = "purple",
    "northwest" = "orange",
    "northeast" = "pink"
  )) +
  labs(title="Bölgelere Göre Dağılım", 
       x="Bölge",
       y="Kişi Sayısı") +
  theme_light() +
  theme(legend.position = "none")

# Grafiği ekrana basma
plot_region_bar
#

# Eğer yüklü değilse şu satırı bir kez çalıştır:
# install.packages("patchwork")

library(patchwork)

# Şimdi grafikleri birleştirip ekrana basabilirsin
plot_smoker_bar + plot_region_bar / plot_sex_bar