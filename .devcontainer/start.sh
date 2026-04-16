#!/bin/bash
set -e

echo "⏳ Aguardando Docker ficar pronto..."
until docker info > /dev/null 2>&1; do
  sleep 1
done

echo "🚀 Subindo MiniStack..."
docker start ministack 2>/dev/null || docker run -d --name ministack -p 4566:4566 ministackorg/ministack:latest

echo "⚙️ Configurando AWS CLI..."
mkdir -p ~/.aws

cat > ~/.aws/config << 'EOF'
[default]
region = us-east-1
output = json
endpoint_url = http://localhost:4566
EOF

cat > ~/.aws/credentials << 'EOF'
[default]
aws_access_key_id = test
aws_secret_access_key = test
EOF

echo "✅ MiniStack pronto em http://localhost:4566"