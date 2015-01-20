###########################
# install pip for python3 #
###########################
sudo apt-get install python3-pip

################
# for flycheck #
################
sudo pip3 install flake8

##################
# for emacs jedi #
##################
sudo apt-get install virtualenv
sudo pip3 install jedi
sudo pip3 install epc
# for Python 2.6
# sudo pip install argparse
# Use `el-get install jedi' to install it after you installed prerequisites.
