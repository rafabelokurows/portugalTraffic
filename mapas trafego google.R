#install.packages("C:\\Users\\rafae\\Downloads\\googletraffic-0.1.0.tar.gz",dependencies=TRUE)
library(googletraffic)
library(ggplot2)
library(dplyr)
library(raster)
library(leaflet)
library(leaflet.providers)
library(raster)
library(dplyr)

## Set API key
google_key <- "GOOGLE_KEY"



rPorto <- gt_make_raster(location   = c(41.1579, -8.6291),
                    height     = 5000,
                    width      = 5000,
                    zoom       = 16,
                    google_key = google_key)

## Plot
rPorto_df <- rasterToPoints(r, spatial = TRUE) %>% as.data.frame()
names(r_df) <- c("value", "x", "y")


# ggplot() +
#   geom_raster(data = r_df, 
#               aes(x = x, y = y, 
#                   fill = as.factor(value))) +
#   labs(fill = "Traffic\nLevel") +
#   scale_fill_manual(values = c("green2", "orange", "red", "#660000")) +
#   coord_quickmap() + 
#   theme_void() +
#   theme(plot.background = element_rect(fill = "white", color="white"))




traffic_pal <- colorNumeric(c("green", "orange", "red", "#660000"), 
                            1:4,
                            na.color = "transparent")
leaflet(width = "100%") %>%
  addProviderTiles("Esri.WorldGrayCanvas") %>%
  addRasterImage(r, colors = traffic_pal, opacity = 1) 



rLisboa <- gt_make_raster(location   = c(38.722197, -9.139671),
                         height     = 3000,
                         width      = 3000,
                         zoom       = 14,
                         google_key = google_key)

## Plot
rLisboa_df <- rasterToPoints(r, spatial = TRUE) %>% as.data.frame()
names(rLisboa_df) <- c("value", "x", "y")

leaflet(width = "100%") %>%
  addProviderTiles("Esri.WorldGrayCanvas") %>%
  addRasterImage(rLisboa, colors = traffic_pal, opacity = 1) 


# library(googleway)
# 
# Johannesburg_traffic <- google_map(key = google_key, 
#                                    location = c(-26.166747,
#                                                 28.041337),
#                                    width = 1280,
#                                    height = 980,
#                                    zoom = 13) %>%
#   add_traffic() %>% 
#   add_transit()
