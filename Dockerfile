FROM python:3.9-slim

WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN pip install --no-cache-dir --upgrade pip

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "todoApp.wsgi:application"]