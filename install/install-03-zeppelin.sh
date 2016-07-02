#!/usr/bin/env bash

echo "Installing Apache Spark spark-1.6.2-bin-hadoop2.6"

#wget http://apache.rediris.es/incubator/zeppelin/0.5.6-incubating/zeppelin-0.5.6-incubating-bin-all.tgz
mkdir /usr/share/zeppelin
tar zxvf zeppelin-0.5.6-incubating-bin-all.tgz -C /usr/share/zeppelin
sudo chown -R vagrant /usr/share/zeppelin

cp /home/vagrant/zeppelin-env.sh /usr/share/zeppelin/zeppelin-0.5.6-incubating-bin-all/conf/
cp /home/vagrant/zeppelin-site.xml /usr/share/zeppelin/zeppelin-0.5.6-incubating-bin-all/conf/

/usr/share/zeppelin/zeppelin-0.5.6-incubating-bin-all/bin/zeppelin-daemon.sh start
