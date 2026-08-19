# Ruby-Mini-Projects
💎 Ruby Core Portfolio & Mini-Projects

Welcome to my Ruby mini-projects repository! This repository contains a collection of three command-line applications built using pure Ruby and its core Object-Oriented Programming (OOP) principles.

These projects showcase clean architecture, idiomatic Ruby conventions, state management, file structure, and data manipulation using Ruby Enumerables.


🛠️ Project Summaries
1. 🔐 Cipher Vault Journal System

A secure CLI-based journaling tool that stores entries, encrypts contents on-demand using a substitution cipher, and performs analytical reporting over stored data.

    Key Features:

        Auto-Incrementing IDs: Tracked via class variables (@@entry_counter).

        Substitution Cipher: In-place encryption/decryption (encrypt! & decrypt!) using character mapping (.tr).

        Vault Manager: Bulk operations to encrypt or decrypt all entries at once.

        Enumerable Analytics: Advanced querying using .map (titles), .select (filtering), .group_by (categories), and .reduce (word count calculations).

2. 🛒 Console-based E-Commerce Store Manager

An interactive inventory and checkout system simulating a real-world shopping cart workflow.

    Key Features:

        Inventory Management: Add, list, and update product stocks and prices.

        Cart & Checkout Logic: Add items to cart, calculate itemized subtotals, and compute overall totals with taxes/discounts.

        Interactive CLI Loop: Persistent terminal menu with robust user input parsing (gets.chomp).

3. 🧮 Ruby Calculator

A lightweight terminal calculator designed to perform essential arithmetic operations with proper error boundaries.

    Key Features:

        Operations: Addition, Subtraction, Multiplication, Division, and Modulus.

        Edge Case Handling: Prevents crash bugs like division by zero (ZeroDivisionError).

        Looping Interface: Perform continuous calculations until explicit user exit.

🧠 Core Ruby Concepts Demonstrated

    Object-Oriented Programming (OOP): Class design, instance vs. class variables, encapsulation, and custom accessors (attr_accessor / attr_reader).

    Enumerable Module Engine: Extensive use of .map, .select, .group_by, and .reduce for efficient data querying.

    Ruby Metaprogramming & Strings: String mutation, alphabet ranges, and text translation via .tr.

    Clean Code Structure: Following standard Ruby file conventions (lib/ directory structure, snake_case files, and require_relative).

    CLI Interactivity: Command-line input handling, control flow (case/when), and clean terminal formatting.
