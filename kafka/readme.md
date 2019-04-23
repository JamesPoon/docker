
bin/kafka-topics.sh --create --zookeeper zk01:2181 --replication-factor 1 --partitions 1 --topic test

bin/kafka-topics.sh --list --zookeeper zk01:2181

bin/kafka-console-consumer.sh --bootstrap-server kfk01:9092 --topic test --from-beginning

bin/kafka-console-producer.sh --broker-list kfk02:9092 --topic test

