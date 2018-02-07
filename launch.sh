# Please see README.md for usage
if [ ! ( -a ./password.rb ) ]
then
  cp password.rb.example password.rb
fi

if [ ! ( -a ./data/commands.txt ) ]
then
  cp data/commands.txt.example data/commands.txt
fi

vagrant up
vagrant reload
vagrant vbguest --do install
vagrant reload
