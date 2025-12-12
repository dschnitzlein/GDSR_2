## Vorbereitendes

rm(list=ls()) # Entfernt alle Objekte (Datensätze, Variablen usw.) aus dem Speicher

library(tidyverse)
library(palmerpenguins)

penguins <- penguins

dim(penguins)
dim(na.omit(penguins))

penguins <- na.omit(penguins)

summary(penguins)

## Analyse

ggplot(data=penguins, aes(x=bill_length_mm, y=body_mass_g)) +
  geom_point()

body_mass_mean <- mean(penguins$body_mass_g)
bill_length_mean <- mean(penguins$bill_length_mm)

ggplot(data=penguins, aes(x=bill_length_mm, y=body_mass_g, colour=species, shape=species)) +
  geom_point()

ggplot(data=penguins, aes(x=bill_length_mm, y=body_mass_g, colour=species, shape=species)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)

ggplot(data=penguins, aes(x=bill_length_mm, y=body_mass_g)) +
  geom_point(aes(colour=species, shape=species)) +
  geom_smooth(method=lm, se=FALSE)

ggplot(data=penguins, aes(x=bill_length_mm, y=body_mass_g)) +
  geom_point(aes(colour=species, shape=species)) +
  geom_smooth(method=lm, se=FALSE) +
  labs(title="Gewicht und Schnabellänge",
       subtitle="Daten von drei Pinguinarten",
       x="Schnabellänge in mm",
       y="Gewicht in g") +
  geom_hline(yintercept=body_mass_mean, colour="blue", linetype=2) +
  geom_vline(xintercept=bill_length_mean, colour="blue", linetype=2)

WB_cols <- c("#b30040", "#86b3b3", "#9ea49e")


ggplot(data=penguins, aes(x=bill_length_mm, y=body_mass_g)) +
  geom_point(aes(colour=species, shape=species)) +
  geom_smooth(method=lm, se=FALSE, colour="#b30040") +
  labs(title="Gewicht und Schnabellänge",
       subtitle="Daten von drei Pinguinarten",
       x="Schnabellänge in mm",
       y="Gewicht in g") +
  geom_hline(yintercept=body_mass_mean, colour="blue", linetype=2) +
  geom_vline(xintercept=bill_length_mean, colour="blue", linetype=2) +
  scale_colour_manual(values=WB_cols) +
  theme_bw()


##### Einschub Logo plazieren

# install.packages("magick")
# install.packages("grid")

logo <-grid::rasterGrob(magick::image_read("logo_WB.jpg"), interpolate = TRUE)

ggplot(data=penguins, aes(x=bill_length_mm, y=body_mass_g)) +
  geom_point(aes(colour=species, shape=species)) +
  geom_smooth(method=lm, se=FALSE, colour="#b30040") +
  labs(title="Gewicht und Schnabellänge",
       subtitle="Daten von drei Pinguinarten",
       x="Schnabellänge in mm",
       y="Gewicht in g") +
  geom_hline(yintercept=body_mass_mean, colour="blue", linetype=2) +
  geom_vline(xintercept=bill_length_mean, colour="blue", linetype=2) +
  scale_colour_manual(values=WB_cols) +
  theme_bw() +
  annotation_custom(logo, xmin = 55, xmax = 60.5, ymin = 2500, ymax = 3000)

#######

ggplot(data=penguins, aes(x=bill_length_mm, y=body_mass_g)) +
  geom_point(aes(colour=species, shape=species)) +
  geom_smooth(method=lm, se=FALSE, colour="#b30040") +
  labs(title="Gewicht und Schnabellänge",
       subtitle="Daten von drei Pinguinarten",
       x="Schnabellänge in mm",
       y="Gewicht in g") +
  geom_hline(yintercept=body_mass_mean, colour="blue", linetype=2) +
  geom_vline(xintercept=bill_length_mean, colour="blue", linetype=2) +
  scale_colour_manual(values=WB_cols) +
  theme_bw() +
  facet_wrap(~species)

