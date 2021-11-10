# MongoDB

Using Ubuntu 16.04, Javascript, Node.js and CPP with MongoDB.

## Setup MongoDB on Ubuntu 16.04

### MongoDB Installation

    #Add MongoDB LTS to PPA
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
    # ready to install
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    # mongodb configuration
    # -p to install multi-levels folder structure
    sudo mkdir -p /data/db
    sudo chmod 777 /data
    sudo chmod 777 /data/db

    # Using MongoDB
    # In one terminal 
    mongod
    # In another terminal 
    mongo
    # test mongo
    show dbs
    # create 'library' database and insert data into it
    use library
    db.book.insertOne({"title": "Blue Sky"})
    ### Hit Enter and then have this
    ### {"acknowledged": true, "insertedId" : ObjectId("5eb42fa3062af495b2bfba9c") }

### Node.js Installation

    # using curl to get package 
    sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    # install
    ## Run `sudo apt-get install -y nodejs` to install Node.js 12.x and npm
    ## Welcome to Node.js v12.18.3.

    ## You may also need development tools to build native addons:
     sudo apt-get install gcc g++ make
    ## To install the Yarn package manager, run:
     curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
     echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn
