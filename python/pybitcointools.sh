# Using Vitalik Buterin's pybitcointools (package name "bitcoin") which has been abandoned although multiple forks exist.
# https://github.com/vbuterin/pybitcointools

mkdir btcsandbox3
python3 -m venv btcsandbox3
cd btcsandbox3
source bin/activate
pip install --upgrade pip

pip install bitcoin

cat << EOF > generate-pk-address.py
from bitcoin import *

my_private_key = random_key()
my_public_key = privtopub(my_private_key)
my_bitcoin_address = pubtoaddr(my_public_key)

print('Using address %s from private key %s' % (my_bitcoin_address, my_private_key))
EOF

python generate-pk-address.py
