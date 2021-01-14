# Using 1200wd's bitcoinlib, not to be confused with "python-bitcoinlib" by Peter Todd.
# https://github.com/1200wd/bitcoinlib
# http://bitcoinlib.readthedocs.io/

mkdir btcsandbox2
python3 -m venv btcsandbox2
cd btcsandbox2
source bin/activate
pip install --upgrade pip

pip install bitcoinlib

cat << EOF > generate-bech32-address.py

from bitcoinlib.wallets import Wallet
w = Wallet.create('segwit_p2wpkh', witness_type='segwit')
addy = w.get_key().address
print(addy)

EOF

python generate-bech32-address.py
