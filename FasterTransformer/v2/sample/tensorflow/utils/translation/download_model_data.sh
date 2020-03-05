# Clone the OpenNMT-tf repo
git clone https://github.com/OpenNMT/OpenNMT-tf -b r1
cp OpenNMT-tf/opennmt/ . -r
rm OpenNMT-tf -r

# Download the vocabulary and test data
# wget https://s3.amazonaws.com/opennmt-trainingdata/wmt_ende_sp.tar.gz

# Download the pretrained model
wget https://s3.amazonaws.com/opennmt-models/averaged-ende-ckpt500k.tar.gz

mkdir translation
mkdir translation/ckpt
# mkdir translation/data
# tar xf wmt_ende_sp.tar.gz -C translation/data
tar xf averaged-ende-ckpt500k.tar.gz -C translation/ckpt
rm wmt_ende_sp.tar.gz averaged-ende-ckpt500k.tar.gz
# head -n 5 translation/data/test.en > test.en
# head -n 5 translation/data/test.de > test.de

# convert the pretrained model to fit our model structure 
python utils/dump_model.py translation/ckpt/model.ckpt-500000
