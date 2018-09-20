FROM haskell:8.4.3

RUN cabal update

WORKDIR /megaparsec

ADD . /megaparsec 

RUN \
      if [ -f cabal.config ]; then cabal clean; fi && \
      cabal new-build --enable-tests --enable-benchmarks --flags=dev && \
      cabal new-test && \
      cabal new-haddock && \
      cabal sdist
