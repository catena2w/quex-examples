
## Install libraries

Install [openzeppelin](https://docs.openzeppelin.com/contracts/5.x/) contracts:

```shell
forge install @openzeppelin/contracts
```

Install Quex intergaces:

```shell
forge install quex-tech/quex-v1-interfaces
```

Put private key to environment variables;
```shell
export SECRET=0xYourPrivateKey
```

Deploy to arbitrum sepolia:
```shell
forge script script/DeployPublicData.s.sol:DeployPublicData --broadcast
```

Expect response like:

```shell
##### arbitrum-sepolia
✅  [Success] Hash: 0x563fed215695ab5be8395a30e91bbc19443cc76c081c4ca92c2ddcae11aae783
Contract Address: 0x393e4610CD8449f023C2eEef3004BEAC9bCE7C97
Block: 128167129
Paid: 0.0008893517 ETH (8893517 gas * 0.1 gwei)

✅ Sequence #1 on arbitrum-sepolia | Total Paid: 0.0008893517 ETH (8893517 gas * avg 0.1 gwei)
```

Rememeber the "Contract Address" value, we'll need it later. Let's put it into environment:
```shell
export CONTRACT_ADDRESS=0x393e4610CD8449f023C2eEef3004BEAC9bCE7C97
```


## Create flow

Go to `lib/quex-v1-interfaces/tools/create_flow`

```shell
python -m venv venv 
source ./venv/bin/activate
pip install -r requirements.txt
```


!!! Internal note: create flow fails on this line if secret is in environment variables
```python
account: LocalAccount = Account.from_key(config["chain"]["secret_key"])
```

Get your method identifier. Run
```shell
forge inspect PublicDataStructures methods
```
and get identifier of `processResponse` method

Format config.json:
1. Check that td_pubkey, oracle_pool.address, quex_core.address equal to ones, presented at [adresses page](https://docs.quex.tech/general-information/addresses)
2. Set consumer to your contract address to the value, got from forge inspect command

Run:
```shell
python create_flow.py config.json
```

Expect response like:
```shell
action_id:    0x185a86d59dee1308fffd3e813c3fa2a91cc5c9daa35959105f59cdb797e058f3
flow_id:      0x0000000000000000000000000000000000000000000000000000000000000014
Native fee:   30000000000000
Gas to cover: 810000
```

We need to remember the `flow_id` value from here. Let's put it to environment variables:

```shell
export FLOW_ID=0x0000000000000000000000000000000000000000000000000000000000000014
```


Request data:



action_id

