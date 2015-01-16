FROM alexisno/nginx

ENV EXPRESS_ADDRESS=express.local

# Create virtualhost
COPY /etc/nginx/sites-available/express.conf /etc/nginx/sites-available/express.conf
RUN sed -i -e "s/{{EXPRESS_ADDRESS}}/$EXPRESS_ADDRESS/" /etc/nginx/sites-available/express.conf &&\
    ln -s /etc/nginx/sites-available/express.conf /etc/nginx/sites-enabled/express.conf
