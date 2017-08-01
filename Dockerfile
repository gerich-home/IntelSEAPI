FROM python:2-alpine

RUN apk add --no-cache \
    git \
    openssh-client \
    && pip install pylint

VOLUME /code
WORKDIR /code

CMD find . -name "*.py" -print0 | xargs -0 pylint 2>&1 | tee pylint_results.txt