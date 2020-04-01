FROM wordpress

RUN apt-get update -y && apt-get install -y less vim 

RUN mkdir /usr/share/code

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \ 
    chmod +x /usr/local/bin/wp