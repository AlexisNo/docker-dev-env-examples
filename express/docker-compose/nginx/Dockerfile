FROM alexisno/nginx-dev

ENV EXPRESS_ADDRESS=express.local

# Install self signed certificate
RUN gencert $EXPRESS_ADDRESS

# Add and enable virtualhost
COPY /etc/nginx/sites-available/express.conf /etc/nginx/sites-available/express.conf
RUN sed -i -e "s/{{EXPRESS_ADDRESS}}/$EXPRESS_ADDRESS/" /etc/nginx/sites-available/express.conf &&\
    ln -s /etc/nginx/sites-available/express.conf /etc/nginx/sites-enabled/express.conf
