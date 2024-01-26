# read libraries
library(magick)
library(tidyr)
library(stringr)


# credit to: https://www.nagraj.net/notes/gifs-in-r/ 

#create data_frame with images in correct day order
image_data <- data.frame(
  image_id = 1:12,
  image_path = paste0("./day_", 1:12, ".jpg")
)

# read images in a list
img_list <- lapply(image_data$image_path, image_read)

## join the images together
img_joined <- image_join(img_list)

## animate at 1 frames per second
img_animated <- image_animate(img_joined, fps = 1)

# write the gif
image_write(image = img_animated,
            path = "puzzle.gif")
