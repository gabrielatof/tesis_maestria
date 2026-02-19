############## Alluvial Plot ##########################

#Este script tiene el código con el que se realizo el alluvial plot. 
#Se decidió realizarlo con la paquete de ggplot2 en R, en lugar de plotly en python por razones estéticas y mejor interpretación.

####  
library(ggplot2)
library(ggalluvial)
library(dplyr)
library(readr)
####

exchanged_plot <- read_csv ("porcentage_exchanges.csv") #cargar la base de datos que incluye todas las reacciones de intercambio con su respectivo porcentaje.


ggplot(exchanged_plot,
       aes(axis1 = compartment_producer, #Productor
           axis2 = metabolite, #Metabolito
           axis3 = compartment_consumer, # Consumo
           y = percentage)) + #Porcentaje
  
  geom_alluvium(aes(fill = compartment_producer), width = 0.2) +
  geom_stratum(width = 0.2, fill = "gray80", color = "black") +
  geom_text(stat = "stratum", aes(label = after_stat(stratum))) +
  
  scale_x_discrete(limits = c("Producer", "Metabolite", "Consumer"),
                   expand = c(.1, .1)) +
  
  labs(y = "Percentage of Producer Output") +
  theme_minimal()
