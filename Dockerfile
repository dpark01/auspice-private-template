FROM nextstrain/base:build-20200506T095107Z

LABEL maintainer "Chris Tomkins-Tinch <tomkinsc@broadinstitute.org>"

ENV HOST=0.0.0.0 PORT=4000

RUN mkdir -p /auspice_data/data /auspice_data/narratives
COPY *.json *.json.gz  /auspice_data/data/
COPY *.md    /auspice_data/narratives/

RUN find /auspice_data/data -name \*.json.gz | xargs gzip --decompress

ENTRYPOINT ["auspice", "view", "--datasetDir", "/auspice_data/data", "--narrativeDir", "/auspice_data/narratives"]
