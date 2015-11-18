Blockchain Underpinnings
====================

JSON-RPC
---------------------
JSON-RPC is a data exchange protocol that allows a client (for example: a blockchain explorer) to communicate to a server (your local blockchain node) by issuing commands and listening to responses. As you may guess by the hyphen, JSON-RPC refers to two separate concepts which, when combined together, result in a very widely used protocol.

#### JSON
**JSON** stands for 'JavaScript Object Notation.' JSON is an efficient way of representing data in a human readable format. JSON was popularized in the early 2000s as an alternative to Extensible Markup Language (known as XML) which had been the defacto web standard since the late 1990s. Indeed since its introduction, the notation has largely replaced XML.

JSON can represent numbers, strings, ordered sequences of values, and collections of name/value pairs. Though the J stands for JavaScript, JSON is a language independent data format. Any programming language can interpret JSON data so long as it is well formed.

Example JSON data looks like this:
```
{
  "blockHash": "abc123",
  "numConfirmations": 3,
  "transactions": [
    {
      "txHash": "xyz456",
      "from": "myAddress1",
      "to": "recipient5",
      "amount": 50000
    },
    {
      "txHash": "def001",
      "from": "myAddress2",
      "to": "recipient1",
      "amount": 54312
    }
  ]
}
```

The data above represents a fictitious block which contains two transactions and has been confirmed by the blockchain 3 times. The above data demonstrates the robust nature of the data JSON can store: strings (such as the blockHash - "abc123"), raw numbers (such as numConfirmations - 3), ordered sequences of values (transactions).

The appeal of JSON from a developer's perspective is its flexibility and readability. With JSON data there are no pre-defined schemas or data definitions required by the developer to understand or look up. The data is exchanged in plain text and is readable by humans - which helps for developer productivity.

Of course, these benefits come with tradeoffs; JSON is not the most efficient data format to parse and transmit. Competing formats such as [protocol buffers](https://developers.google.com/protocol-buffers/) provide better optimizations and efficiencies at the cost of readibility and flexibility. It is often the case that the productivity gains of using JSON outweigh the performance gains of using other formats - this is true for most blockchain implementations.

#### RPC

**RPC** or 'Remote Procedure Call.' RPC is a concept in computer science that enables one computer to call a procedure of another computer.

The origins of RPC date all the way back to the [1970s](https://www.rfc-editor.org/rfc/pdfrfc/rfc684.txt.pdf) when researchers such as Richard Shantz and Bruce Jay Nelson were trying to understand how distributed applications could effectively communicate on the predecessors to today's internet.

We have come a long way since the the 1970s and the communications over the internet have been significantly influenced by the world wide web and the HTTP protocol. Modern web architecture has stirred a lot of debate over the best ways for clients and servers to communicate. One of the leading architectural styles today is known as REST (Representational State Transfer). Modern frameworks such as Ruby on Rails and NodeJS have resulted in a large number of RESTful services to take over the web.

While REST does have many benefits, many of these benefits are best realized in applications whose main functions are Creating, Reading, Updating, and Deleting records [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) - think about a website such as Reddit, where user interaction is driven by CRUD-like actions on posts and comments. Given the fact that one of the core aspects of Blockchain technology is the immutable nature of the chain data, as well as the consensus mechanisms for generating new blocks, REST is not necessarily the best fit for how nodes can talk to other applications.

While some blockchain architects may use RESTful APIs (e.g. see [BlockApps](http://blockapps.net)), many focus on using RPC for a more direct connection to the blockchain - a simple yet well understood means of client/server communication. An RPC is initiated by the client and sends a message to the server - in this case the blockchain node. The message that gets passed is a stubbed version of the procedure as it exists in the server's system along with all the required parameters to invoke that procedure. When the server receives the message, it unpacks the parameters and invokes the procedure, returning the result back to the client. Generally, the client waits for the RPC to complete before resuming its execution.

#### JSON-RPC
JSON-RPC is a type of RPC protocol which uses JSON to encode requests and responses between client and server. The JSON-RPC v2.0 specification was released in [2010](http://www.jsonrpc.org/specification) and aims to provide a simple RPC mechanism.

A request must contain the property:

`method` - A String containing the name of the method to be invoked.

And optionally contain the properties:

`params` - A Structured value that holds the parameter values to be used during the invocation of the method.

`id` - An identifier established by the Client

A successful response must contain:

`result` - The value of this member is determined by the method invoked on the Server.

`id` - An identifier which matches the value of `id` in the request object.

An example JSON-RPC 2.0 request looks like:
```
--> {"jsonrpc": "2.0", "method": "getBlockHeight", "id": 1}
```

And a response successful response:
```
<-- {"jsonrpc": "2.0", "result": 143129, "id": 1}
```
