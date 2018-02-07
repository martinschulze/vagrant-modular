# Please see README.md for usage
if [ ! ( -a ./password.rb ) ]
then
  cp password.rb.example password.rb
fi

if [ ! ( -a ./data/commands.txt ) ]
then
  cp data/commands.txt.example data/commands.txt
fi

git submodule init
git submodule update

touch data/ssh/id_rsa
touch data/ssh/id_rsa.pub
touch data/ssh/config

vagrant up
vagrant reload
vagrant vbguest --do install
vagrant reload
