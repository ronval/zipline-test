# TDD TEST: Baked Goods Packaged Orders

## Background
A bakery used to base the price of their produce on an individual item cost. So if a customer ordered 10 cross buns then they would be charged 10x the cost of single bun. The bakery has decided to start selling their produce prepackaged in bunches and charging the customer on a per pack basis. So if the shop sold vegemite scroll in packs of 3 and 5 and a customer ordered 8 they would get a pack of 3 and a pack of 5. The bakery currently sells the following products:

We want to write calculations using functions and get the results.

**Here are some examples:**

| Name          | Code          | Packs                            |
| ------------- |:-------------:| -----:                           |
| Vegemtite Scroll  | VS5       | 3 @ $6.99, 5 @ $8.99             |
| Blueberry Muffin  | MB11      | 2 @ $9,95, 5 @ $16.95, 8 @ $24.95|
| Croissant         | CF        | 3 @ $5,95, 5 @ $9.95, 9 @ $16.99 |

## Task

Given a customer order you are required to determine the cost and pack breakdown for each product. To save on shipping space each order should contain the minimal number of packs.

### Input:
Each order has a series of lines with each line containing the number of items followed by the product code. 
An example input:

* 10 VS5
* 14 MB11
* 13 CF


### Output:

A successfully passing test(s) that demonstrates the following output: 
* 10 VS5 $17.98
  * 2 x 5 $8.99 
* 14 MB11 $54.8
  * 1 x 8 $24.95
  * 3 x 2 $9.95 
* 13 CF $25.85
  * 2 x 5 $9.95 
  * 1 x 3 $5.95


### Advice
* Choose whatever language you’re comfortable with
* The input/output format is not important, do whatever feels reasonable
* Make sure you include at least one test
* We expect the see code which you would be happy to put in production
* If something is not clear don’t hesitate to ask or just make an assumption and go with it
* Readable, but concise code
* TDD, tested at the right level, and mocked appropriately 
* Good, simple, well-thought out modelling. S.O.L.I.D. principles followed where applicable. Simple classes with few responsibilities, particularly.
* Easy to extend/modify. What if this behaviour changed subtly? 

* Use Git and commit as often as you think is necessary to properly tell your story

* Engineer your solution as if there’s a high chance it will be re-used
* Keep lines wrapped at 120 characters


## What we're looking for

* Coding style (tidyness &amp; legibility)
* Abstractions
* Testing practices
* Commit journey

## How to get started & submit

1. Clone the repo
2. Create a new branch to work from
3. Do your thing
4. When you're done, push your branch and create a PR for the team to review
