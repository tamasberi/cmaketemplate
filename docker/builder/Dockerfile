FROM cmaketemplate:base

RUN --mount=type=cache,sharing=locked,target=/var/cache/apt --mount=type=cache,sharing=locked,target=/var/lib/apt --mount=type=secret,id=auth_conf,target=/etc/apt/auth.conf.d/mini-dinstall.conf \
 apt-get update && apt-get install --yes \
 build-essential \
 cmake \
 && rm -rf /var/lib/apt/lists/*
