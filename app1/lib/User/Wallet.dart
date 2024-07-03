import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class Transaction {
  final String description;
  final double amount;
  final String date;

  Transaction({required this.description, required this.amount, required this.date});
}

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int walletBalance = 0;
  List<Transaction> transactions = [];

  // Replace this with a function to fetch the wallet balance and transactions
  Future<void> fetchWalletData() async {
    // Simulate fetching data (replace with your actual logic)
    await Future.delayed(const Duration(seconds: 2));
    walletBalance = 799;
    transactions = [
      Transaction(description: 'Deposit', amount: 100.0, date: '2023-10-13'),
      Transaction(description: 'Purchase', amount: -50.0, date: '2023-10-12'),
      // Add more transactions here
    ];
  }

  @override
  void initState() {
    super.initState();
    fetchWalletData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wallet'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                const Text(
                  'Account Balance',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Rs.$walletBalance',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  leading: const Icon(Icons.account_balance_wallet),
                  title: Text(transaction.description),
                  subtitle: Text(transaction.date),
                  trailing: Text(
                    '\$${transaction.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: transaction.amount >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // Implement action to make a transaction (e.g., add money, withdraw money)
              },
              child: const Text('Make Transaction'),
            ),
          ),
        ],
      ),
    );
  }
}
