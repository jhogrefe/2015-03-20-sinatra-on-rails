# Rails Project: Software Localization

This project is a conversion of my Sinatra Software Localization version into a Rails version.

The Software Localization project is a web tool that software developers can use to enter text strings and receive the text back translated into the supported languages. Localization for software terms is important so you do not use a translation that means something outside the scope of software functionality.

For example: A user can go to the website and enter a string of text like "Save". The Software Localization website will store a database of common translations in multiple languages (french, spanish, german, italian) and will search this database for the text that was entered. If found, the website will return the entered text, along with the text translated into any supported language. If not found it will use the Microsoft Translator API to offer alternative translations.


## API Used

**Microsoft Translator:**

http://www.microsoft.com/translator/translator-api.aspx

Microsoft Translator is a machine translation service. The service translates a "source" text from one language to a different "target" language. The free API allows up to 2 million character translations per month and should be acceptable for the project.


## Gem Used

**bing_translator:**

https://github.com/relrod/bing_translator-gem

Ruby wrapper for Microsoft Translate API.


## "Should" cases

**Here's what I want to do:**

 * Have tables for terms, languages and translations. Terms will have a primary key column and term column where you can store a text string. Languages will have a primary key column and languages column where you can store supported languages (currently French, German, Spanish, Italian). Translations will have a primary key column, term_id column, language_id column, and translation column where you can store a text string of the translation for the matching term_id and language_id.
 * Enter a search term that will search my database first and return the translation if term is found in terms table.
 * Use Microsoft Translator API as alternative custom search when searching the terms table in my database returns nothing.
 * Use bing_translator gem to interact with Microsoft Translator.


## Models

**1) One-to-many relationship:**
Main web page where the user enters text for to search for a translation. There can only be a single text string, but many language options.

**2) One-to-many relationship:**
If a search on my database finds nothing, a custom wearch window will open with the term you want to search Microsoft Translator for. Once found, the term is translated into the supported languages.
