FROM alexisno/nginx-dev

ENV SAILS_ADDRESS=sails.local

# Add and enable virtualhost
COPY /etc/nginx/sites-available/sails.conf /etc/nginx/sites-available/sails.conf
RUN sed -i -e "s/{{SAILS_ADDRESS}}/$SAILS_ADDRESS/" /etc/nginx/sites-available/sails.conf
RUN ln -s /etc/nginx/sites-available/sails.conf /etc/nginx/sites-enabled/sails.conf
