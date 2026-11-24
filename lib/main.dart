import 'package:flutter/material.dart';

void main() {
  runApp(const MaxmudBankApp());
}

class MaxmudBankApp extends StatelessWidget {
  const MaxmudBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaxmudBank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A66C2)),
        useMaterial3: true,
      ),
      home: const BankHomePage(),
    );
  }
}

class BankHomePage extends StatefulWidget {
  const BankHomePage({super.key});

  @override
  State<BankHomePage> createState() => _BankHomePageState();
}

class _BankHomePageState extends State<BankHomePage> {
  double balance = 4500000;
  final List<String> history = [
    'Boshlang‘ich balans: +4 500 000 so‘m',
  ];

  void _showTransferDialog() {
    final amountController = TextEditingController();
    final cardController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Karta orqali o‘tkazma'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: cardController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Karta raqami (16 raqam)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Summa (so‘m)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Bekor qilish'),
          ),
          FilledButton(
            onPressed: () {
              final amount = double.tryParse(amountController.text.trim()) ?? 0;
              final card = cardController.text.trim();
              if (amount > 0 && amount <= balance && card.isNotEmpty) {
                setState(() {
                  balance -= amount;
                  final last4 = card.length >= 4
                      ? card.substring(card.length - 4)
                      : card;
                  history.insert(
                    0,
                    'O‘tkazma (**$last4): -${amount.toStringAsFixed(0)} so‘m',
                  );
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Yuborish'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaxmudBank'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0A66C2), Color(0xFF1E88E5)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Asosiy hisob balansi',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${balance.toStringAsFixed(0)} so‘m',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '•••• •••• •••• 8600',
                    style: TextStyle(color: Colors.white, letterSpacing: 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _showTransferDialog,
              icon: const Icon(Icons.send),
              label: const Text('Pul o‘tkazish'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tranzaksiyalar tarixi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.receipt_long),
                    title: Text(history[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
