FROM python:3-slim
WORKDIR /app
RUN pip install grip
COPY . .
EXPOSE 6419
CMD ["grip", "0.0.0.0:6419"]
