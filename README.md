Please cite LSST references, including the LSST simulations products. This list is intended to make it easy to cite LSST!

To compile (and produce `LSSTreferences.pdf`):
```
> make 
```
To add a new reference, add the BibTeX entry to `LSSTbiblio.bib`, and add 
a citation to the appropriate section of `LSSTreferences.tex`;  e.g.
```latex
@BOOK{RHLStatsBook,
   author = {{Lupton}, R.~H.},
    title = "{Statistics in theory and practice}",
publisher = {Princeton University Press},
     year = 1993,
   adsurl = {http://adsabs.harvard.edu/abs/1993stp..book.....L},
  adsnote = {Provided by the SAO/NASA Astrophysics Data System}
}
```
and
```latex
\cite{RHLStatsBook}
```
N.b. Please check that your BibTeX entry is written in ascii, some entries you 
find on the net use more general character sets.  The entry will probably work, 
but will generate complaints.
