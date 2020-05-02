import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList({this.transactions, this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                  children: <Widget>[
                    Text('No Transactions Yet',style: TextStyle(fontSize: 25.0,color: Colors.green[300],),),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
            })
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 400
                        ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            textColor: Colors.white ,
                            color: Theme.of(context).errorColor,

                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// Card(
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                           vertical: 10,
//                           horizontal: 15,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Theme.of(context).primaryColor,
//                             width: 2,
//                           ),
//                         ),
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           '\$ ${transactions[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             transactions[index].title,
//                             style: TextStyle(
//                               color: Color(0xff00A896),
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             DateFormat.yMMMd().format(transactions[index].date),
//                             style: TextStyle(
//                               color: Colors.blueGrey,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
