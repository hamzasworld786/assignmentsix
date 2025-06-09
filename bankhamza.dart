import 'dart:io';

class Account {
  static int _idCounter = 1000;
  final String accountNumber;
  final String name;
  String password;
  double balance;

  Account({required this.name, required this.password, this.balance = 0})
    : accountNumber = (_idCounter++).toString();

  void deposit(double amount) {
    if (amount <= 0) {
      print("Invalid deposit amount.");
      return;
    }
    balance += amount;
    print(
      "Deposited \$${amount.toStringAsFixed(2)}. New Balance: \$${balance.toStringAsFixed(2)}",
    );
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print("Invalid withdrawal amount.");
      return;
    }
    if (amount > balance) {
      print("Insufficient balance.");
    } else {
      balance -= amount;
      print(
        "Withdrawn \$${amount.toStringAsFixed(2)}. New Balance: \$${balance.toStringAsFixed(2)}",
      );
    }
  }

  void showDetails() {
    print("\n--- Account Details ---");
    print("Account Number: $accountNumber");
    print("Name: $name");
    print("Balance: \$${balance.toStringAsFixed(2)}");
  }
}

class BankSystem {
  final Map<String, Account> accounts = {};

  Account? login(String accNum, String password) {
    final acc = accounts[accNum];
    if (acc == null) {
      print("Account not found.");
    } else if (acc.password != password) {
      print("Incorrect password.");
    } else {
      print("Login successful.");
      return acc;
    }
    return null;
  }

  void createAccount() {
    stdout.write("Enter name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter password: ");
    String password = stdin.readLineSync()!;
    final acc = Account(name: name, password: password);
    accounts[acc.accountNumber] = acc;
    print("Account created successfully. Account Number: ${acc.accountNumber}");
  }

  void deleteAccount(String accNum) {
    if (accounts.containsKey(accNum)) {
      accounts.remove(accNum);
      print("Account deleted successfully.");
    } else {
      print("Account not found.");
    }
  }

  void transferMoney(Account fromAccount) {
    stdout.write("Enter recipient account number: ");
    String toAccNum = stdin.readLineSync()!;
    if (!accounts.containsKey(toAccNum)) {
      print("Recipient account not found.");
      return;
    }

    stdout.write("Enter amount to transfer: ");
    double? amount = double.tryParse(stdin.readLineSync()!);
    if (amount == null || amount <= 0) {
      print("Invalid amount.");
      return;
    }

    if (amount > fromAccount.balance) {
      print("Insufficient balance.");
      return;
    }

    fromAccount.withdraw(amount);
    accounts[toAccNum]!.deposit(amount);
    print("Money transferred successfully.");
  }

  void listAllAccounts() {
    if (accounts.isEmpty) {
      print("No accounts to show.");
      return;
    }
    print("\nAll Accounts:");
    accounts.forEach((_, acc) => acc.showDetails());
  }
}

void main() {
  final bank = BankSystem();
  while (true) {
    print("\nBank Management System");
    print("1. Create Account");
    print("2. Login to Account");
    print("3. List All Accounts");
    print("4. Exit");
    stdout.write("Choose option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        bank.createAccount();
        break;
      case '2':
        stdout.write("Enter Account Number: ");
        String accNum = stdin.readLineSync()!;
        stdout.write("Enter Password: ");
        String password = stdin.readLineSync()!;
        final acc = bank.login(accNum, password);
        if (acc != null) {
          accountMenu(bank, acc);
        }
        break;
      case '3':
        bank.listAllAccounts();
        break;
      case '4':
        print("Thank you for using the system.");
        return;
      default:
        print("Invalid option.");
    }
  }
}

void accountMenu(BankSystem bank, Account acc) {
  while (true) {
    print("\nWelcome, ${acc.name}");
    print("1. View Account Details");
    print("2. Deposit");
    print("3. Withdraw");
    print("4. Transfer Money");
    print("5. Delete Account");
    print("6. Logout");
    stdout.write("Choose option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        acc.showDetails();
        break;
      case '2':
        stdout.write("Enter amount to deposit: ");
        double? amt = double.tryParse(stdin.readLineSync()!);
        if (amt != null)
          acc.deposit(amt);
        else
          print("Invalid input.");
        break;
      case '3':
        stdout.write("Enter amount to withdraw: ");
        double? amt = double.tryParse(stdin.readLineSync()!);
        if (amt != null)
          acc.withdraw(amt);
        else
          print("Invalid input.");
        break;
      case '4':
        bank.transferMoney(acc);
        break;
      case '5':
        stdout.write("Are you sure? (yes/no): ");
        String? confirm = stdin.readLineSync();
        if (confirm?.toLowerCase() == 'yes') {
          bank.deleteAccount(acc.accountNumber);
          return;
        }
        break;
      case '6':
        print("Logging out...");
        return;
      default:
        print("Invalid choice.");
    }
  }
}
