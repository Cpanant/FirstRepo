
echo "Please set the below values correctly"
read -p "Enter the BUCKET_NAME: " BUCKET_NAME

cat >> cors-config.json <EOF
[
  {
    "origin": ["http://example.com"],
    "responseHeader": ["Content-Type"],
    "method": ["GET"],
    "maxAgeSeconds": 3600
  }
]
EOF

gcloud storage buckets update $BUCKET_NAME --cors-file=cors-config.json

gcloud storage buckets describe $BUCKET_NAME --format="json(cors)"
