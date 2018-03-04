FROM docker.elastic.co/beats/metricbeat:6.2.2

# Make stuff like the docker socket actually work
USER root

# Copy configuration
COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml
RUN chmod go-w /usr/share/metricbeat/metricbeat.yml

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
