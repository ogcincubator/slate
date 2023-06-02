FROM slatedocs/slate:v2.13.1

COPY multilang.rb /srv/slate/lib/
COPY slate.sh /srv/slate/

ENTRYPOINT ["/srv/slate/slate.sh"]
CMD ["build"]
