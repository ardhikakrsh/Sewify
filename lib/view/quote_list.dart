import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        author: 'Oscar Wilde',
        text: 'Be yourself; everyone else is already taken'),
    Quote(
        author: 'Oscar Wilde',
        text: 'I have nothing to declare except my genius'),
    Quote(
        author: 'Oscar Wilde',
        text: 'The truth is rarely pure and never simple')
  ];

  void addQuote() {
    setState(() {
      quotes.add(Quote(author: 'Ardhika', text: 'HAHAHAHAHA'));
    });
  }

  void editQuote(Quote quote) {
    setState(() {
      quotes[quotes.indexOf(quote)] = Quote(
        author: 'Ardhika',
        text: 'HAHAHAHAHA',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Awesome Quotes'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: quotes
                .map((quote) => QuoteCard(
                    quote: quote,
                    delete: () {
                      setState(() {
                        quotes.remove(quote);
                      });
                    },
                    edit: () {
                      setState(() {
                        editQuote(quote);
                      });
                    }))
                .toList(),
          ),
        ),

        /// Floating Button to Add New Quote
        floatingActionButton: FloatingActionButton(
          onPressed: addQuote,
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.add),
        ));
  }
}
