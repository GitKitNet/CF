#!/bin/bash

function RUN_FUNC() {

  read -p "Enter you TOKEN CloudFlare: " TOKEN;
  read -p "Enter DNS ZONE Domain with CloudFlare: " ZONE;

curl -s -X GET \
  -H "Content-Type:application/json" -H "Authorization: Bearer ${TOKEN}" \
  "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records"\
  | awk -vRS='},{' '{print}' \
  | cut -d'"' -f 4 \
  | xargs -I@ bash -c 'curl -X DELETE "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/@" -H "Content-Type:application/json" -H "Authorization: Bearer ${TOKEN}"'

};

RUN_FUNC
