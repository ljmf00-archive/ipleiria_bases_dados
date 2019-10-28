# Second normal form (2NF)

Second normal form (2NF) is a normal form used in database normalization.

## Requirements

1. It is in first normal form.
2. It does not have any non-prime attribute that is functionally dependent on
   any proper subset of any candidate key of the relation. A non-prime attribute
   of a relation is an attribute that is not a part of any candidate key of the
   relation.

## Examples

### Non-complient

The following relation does not satisfy 2NF because multiple {Manufacturer country} is dependent on part of a candidate key:

|Manufacturer|Model|Model full name|Manufacturer country|
|-|-|-|-|
|Forte|X-Prime|Forte X-Prime|Italy|
|Forte|Ultraclean|Forte Ultraclean|Italy|
|Dent-o-Fresh|EZbrush|Dent-o-Fresh EZbrush|USA|
|Brushmaster|SuperBrush|Brushmaster SuperBrush|USA|
|Kobayashi|ST-60|Kobayashi ST-60|Japan|
|Hoch|Toothmaster|Hoch Toothmaster|Germany|
|Hoch|X-Prime|Hoch X-Prime|Germany|

### Complient

|Manufacturer|Manufacturer country|
|-|-|
|Forte|Italy|
|Dent-o-Fresh|USA|
|Brushmaster|USA|
|Kobayashi|Japan|
|Hoch|Germany|

|Manufacturer|Model|Model full name|
|-|-|-|
|Forte|X-Prime|Forte X-Prime|
|Forte|Ultraclean|Forte Ultraclean|
|Dent-o-Fresh|EZbrush|Dent-o-Fresh EZbrush|
|Brushmaster|SuperBrush|Brushmaster SuperBrush|
|Kobayashi|ST-60|Kobayashi ST-60|
|Hoch|Toothmaster|Hoch Toothmaster|
|Hoch|X-Prime|Hoch X-Prime |