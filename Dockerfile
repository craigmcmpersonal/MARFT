FROM nvidia/cuda:13.0.1-cudnn-devel-ubuntu24.04

WORKDIR /MARFT

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /MARFT/marft/scripts/checkpoints
RUN mkdir -p /MARFT/marft/scripts/logs
RUN mkdir -p /MARFT/marft/scripts/results

CMD ["tail", "-f", "/dev/null"]




