# Using Peter Todd's python-bitcoinlib, not to be confused with "bitcoinlib" both Python's and C's
# https://github.com/petertodd/python-bitcoinlib

mkdir btcsandbox
python3 -m venv btcsandbox
cd btcsandbox
source bin/activate
pip install --upgrade pip

pip install python-bitcoinlib

# "WARNING: …/Python is loading libcrypto in an unsafe way"
# Solution from https://stackoverflow.com/a/58445755 and https://stackoverflow.com/a/3172515
echo 'export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_FALLBACK_LIBRARY_PATH' >> ~/.zshrc
source ~/.zshrc

# Note we are not using Homebrew's OpenSSL (openssl) but macOS 11's built-in LibreSSL instead

cat << EOF > generate-keypair.py
import os
import bitcoin
from bitcoin.core import *
from bitcoin.wallet import *

bitcoin.SelectParams('testnet')
privkey = CBitcoinSecret.from_secret_bytes(os.urandom(32))
print('Using keypair %s (pub) %s (priv)' % (b2x(privkey.pub), privkey))
EOF

python generate-keypair.py
