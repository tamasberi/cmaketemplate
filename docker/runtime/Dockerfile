FROM cmaketemplate:base
COPY *.deb /tmp/
RUN dpkg -i /tmp/*.deb && rm -rf /tmp/*.deb
ENTRYPOINT ["/usr/bin/CMakeTemplate"]
