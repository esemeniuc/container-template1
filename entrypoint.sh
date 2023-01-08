#!/bin/bash
set -xeo

echo Running script

if [ -z "$INPUT_RPC_NODE" ]; then
  echo Need RPC endpoint
  exit 1
fi

if [ -z "$INPUT_KEYPAIR_JSON" ]; then
  echo Need keypair
  exit 1
fi

echo =========================== the keypair is "$INPUT_KEYPAIR_JSON"

# default location that anchor reads from when in github actions environment
mkdir -p /github/home/.config/solana
echo "$INPUT_KEYPAIR_JSON" > /github/home/.config/solana/id.json

export ANCHOR_PROVIDER_URL=$INPUT_RPC_NODE
export ANCHOR_WALLET=/github/home/.config/solana/id.json

#print all env vars
set

yarn start