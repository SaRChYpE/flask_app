FROM debian:11-slim as build

RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends --yes python3-venv && \
    python3 -m venv /venv && \
    /venv/bin/pip install --upgrade pip setuptools wheel

FROM build as build-venv

COPY requirements.txt /requirements.txt

RUN /venv/bin/pip install --disable-pip-version-check -r /requirements.txt

FROM gcr.io/distroless/python3-debian11

COPY --from=build-venv /venv /venv

COPY app.py .

COPY static/ /static
COPY templates/ /templates

EXPOSE 5000

ENTRYPOINT ["/venv/bin/gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
