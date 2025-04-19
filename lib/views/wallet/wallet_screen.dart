import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 60,
        title: Text(
          'My Wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => context.goNamed('home'),
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          _buildBalanceCard(),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildWalletItem(
                  icon: Icons.credit_card,
                  title: 'Visa Card',
                  subtitle: '**** **** **** 1234',
                  trailing: '\$2,300.00',
                ),
                _buildWalletItem(
                  icon: Icons.account_balance_wallet,
                  title: 'Cash Wallet',
                  subtitle: 'Available balance',
                  trailing: '\$500.00',
                ),
                _buildWalletItem(
                  icon: Icons.currency_bitcoin,
                  title: 'Crypto Wallet',
                  subtitle: 'BTC Wallet',
                  trailing: '₿0.06',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Total Balance', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 8),
          Text(
            '\$4,500.00',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String trailing,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.deepPurple.shade100,
        child: Icon(icon, color: Colors.deepPurple),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Text(
        trailing,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
