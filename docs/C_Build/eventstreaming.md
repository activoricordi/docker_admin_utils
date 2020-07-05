# Event Data Integration Streaming

Point-to-Point Integration slow down business. The cost and complexity of Point-to-Point Integrations increases over time. For instance, if we integrate an ERP and a Salesforce system.
In traditional enterprise projects, most of the customers start choosing to build Point-to-Point integrations since the initial cost and complexity tend to be small at the beginning (Year 1); however, these integrations do not only increase its cost and complexity exponentially everytime a new change is made or new integration is donw but also they tend to slow down business since they force to perform a full regression testing everytime we change them.

There are several alternative ways to implement them. Move from a Point-to-Point integration to scale them through a Event-Driven Architecture which can decouple these integrations.

## Event Stream

### Event Bus

#### Azure Event Hubs

It is a hyper-scale telemetry ingestion service.

### Event Data

* Event Data is a record of a single event at a particular moment in time.
* An event consists of core attributes such as a timestamp and an event type. It can be annotated with many additional attributes to provide more context.

```yaml
entityName: "Event Data"
entityDescription: "Record of a single event at a particular moment in time"
```

### Rabbit MQ

### Apache Kafka

It could be a solution or Azure Event Hub or any other propietary Cloud solution.

#### Kafka Management

##### Installation Paths

```shell
# Confluent CLI and individual driver scripts for starting/stopping services, prefixed with <package> names
/usr/bin/
# Configuration files
/etc/<package>/
# Jars
/usr/share/java/<package>/
export PATH=usr/bin:$PATH
```

##### kafka Topics Command Line

```shell
kafka-topics --describe
```

```shell
kafka-topics --create --bootstrap-server 127.0.0.1:9092 --replication-factor 1 --partitions 1 --topic test
```

##### Kafka Console Producer Command Line

```shell
kafka-console-producer --bootstrap-server localhost:9092 --topic test
```

##### Kafka Console Consumer Command Line

```shell
kafka-console-consumer --bootstrap-server localhost:9092 --topic test --from-beginning
```

##### Kafka Server Start

```shell
kafka-server-start
```

##### kafka-server-stop

##### Zookeeper Server Start

##### Zookeeper Server Stops

#### Schema Registry

##### Schema Registry Configuration

The parameter are defined in the Schema Registry configuration file **schema-registry.properties** located at /etc/schema-registry/schema-registry.properties

###### Kafkastore bootstrap servers

The effect of **kafkastore.bootstrap.servers** setting depends on whether you specify kafkastore.connection.url.

If kafkastore.connection.url is not specified, then the Kafka cluster containing these bootstrap servers will be used both to coordinate Schema Registry instances (primary election) and store schema data.

If kafkastore.connection.url is specified, then this setting is used to control how Schema Registry connects to Kafka to store schema data and is particularly important when Kafka security is enabled. When this configuration is not specified, Schema Registry’s internal Kafka clients will get their Kafka bootstrap server list from ZooKeeper (configured with kafkastore.connection.url). In that case, all available listeners matching the kafkastore.security.protocol setting will be used.

By specifying this **kafkastore.bootstrap.servers**, you can control which endpoints are used to connect to Kafka. Kafka may expose multiple endpoints that will be stored in ZooKeeper, but Schema Registry may need to be configured with just one of those endpoints, for example, to control which security protocol it uses.

## Data Sources

### External Data Sources

* There are

### Internal Data Sources

* There are applications without any Business Logic. There are Raw data which does not have business logic to be changed. It is not be subject to changes.
* A company has many types of internal data sources, all these data can be ingesting in a event stream.

## Business Apps

There are application with Business Logic (It embedded Business Rules which are subject to be changed).

### Change Data Capture

**Change Data Capture (CDC)** is a software technique to keep track of data changes due to either data modification language (DML) such as insert, update and delete SQL statements or data definition language (DDL) such as create table, alter table SQL statements.  

Every **DML** operation in your database is captured, and that allows you to seize any insert, update, or delete operation and use them for your own purposes.

**CDC** can be viewed as a design pattern for identifying and collecting database record changes.

**CDC** is a typically first step in ETL (extract, transform, and load); a Data Integration tool that provides sophisticated transformation, enrichment and delivery capabilities to a wide range of destinations.

### Pub / Sub Messaging

Publish / subscribe messaging or pub/sub messaging is a form of asynchronous service-to-service communication used in serverless and microservices architectures. In a pub/sub model, messages published to a topic are immediately received by all the subscribers to the topic.

### Directed Acyclic Graphs

* There are directed graphs with a topological order. Every edge at the graph is in a sequence from earlier to later.
* **Directed Acyclic Graphs** are often used in ETL processes to define pipelines for file ingestion/transform.

## References

* [Installing and upgrading the Kafka Schema Registry](https://blog.clairvoyantsoft.com/installing-and-upgrading-the-kafka-schema-registry-2b2944a22244)
