FROM docker pull alpine:3.10        
MAINTAINER Coach Ebby <ebenezer.oladimeji@raytheon.com
COPY ./src/ /var/www/html/
VOLUME /var/www/html /var/www/html
ENTRYPOINT

RUN . /etc/environment \
  # Install linux depedendencies here
  # e.g. need this for ggforce::geom_sina
  && sudo apt-get update \
  && sudo apt-get install libudunits2-dev -y \
  # build this compendium package
  && R -e "devtools::install('/rrcompendiumDTB', dep=TRUE)" \
  # render the manuscript into a docx, you'll need to edit this if you've
  # customised the location and name of your main Rmd file
  && R -e "rmarkdown::render('/rrcompendiumDTB/analysis/paper/paper.Rmd')"


# docker images ls 
# docker image
