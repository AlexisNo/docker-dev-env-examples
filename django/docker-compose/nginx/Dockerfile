FROM alexisno/nginx-dev

ENV DJANGO_ADDRESS=django.local

# Install self signed certificate
RUN gencert $DJANGO_ADDRESS

# Create virtualhost
COPY /etc/nginx/sites-available/django.conf /etc/nginx/sites-available/django.conf
RUN sed -i -e "s/{{DJANGO_ADDRESS}}/$DJANGO_ADDRESS/" /etc/nginx/sites-available/django.conf &&\
    ln -s /etc/nginx/sites-available/django.conf /etc/nginx/sites-enabled/django.conf
