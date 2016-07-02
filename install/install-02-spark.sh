#!/usr/bin/env bash

echo "Installing Apache Spark spark-1.6.2-bin-hadoop2.6"

#wget http://ftp.cixug.es/apache/spark/spark-1.6.2/spark-1.6.2-bin-hadoop2.6.tgz
mkdir /usr/share/spark
tar zxvf spark-1.6.2-bin-hadoop2.6.tgz -C /usr/share/spark
sudo chown -R vagrant /usr/share/spark
mkdir /usr/share/spark/spark-1.6.2-bin-hadoop2.6/logs
chmod 777 /usr/share/spark/spark-1.6.2-bin-hadoop2.6/logs

export SPARK_HOME=/usr/share/spark/spark-1.6.2-bin-hadoop2.6
export PATH=$PATH:$SPARK_HOME/bin

sudo touch /etc/profile.d/spark.sh
sudo sh -c "echo 'SPARK_HOME=/usr/share/spark/spark-1.6.2-bin-hadoop2.6\nPATH=$PATH:/usr/share/spark/spark-1.6.2-bin-hadoop2.6/bin' > /etc/profile.d/spark.sh"

ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

cp /home/vagrant/spark-env.sh /usr/share/spark/spark-1.6.2-bin-hadoop2.6/conf/
chmod +x /usr/share/spark/spark-1.6.2-bin-hadoop2.6/conf/spark-env.sh


/usr/share/spark/spark-1.6.2-bin-hadoop2.6/conf/spark-env.sh
sudo sh -c "/usr/share/spark/spark-1.6.2-bin-hadoop2.6/sbin/start-all.sh"
