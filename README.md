# Econometrics Simplified

**Read the blog:** https://econometricsnotes.github.io/econometrics/

By Prof.(Dr). Santhosh Kumar P K, Cochin University of Science and Technology (CUSAT).

A blog about the ideas behind applied econometrics, explained in plain words. Each chapter takes one
idea, wraps it in a small story, and runs the numbers in EViews. Every chapter ends with a question
for readers to think about.

## Part I · Getting Started

| # | Chapter | Topic |
| --- | --- | --- |
| 1 | [Innocent Until Proven Guilty](https://econometricsnotes.github.io/econometrics/hypothesis-testing.html) | Hypothesis testing, Type I and II errors, power |
| 2 | [Drawing the Best Line](https://econometricsnotes.github.io/econometrics/idea-of-regression.html) | The idea of regression and the OLS derivation |

## Part II · Foundations

| # | Chapter | Topic |
| --- | --- | --- |
| 1 | [Does Ice Cream Drown People?](https://econometricsnotes.github.io/econometrics/ice-cream.html) | Omitted variable bias |
| 2 | [When Two Random Walks Fall in Love](https://econometricsnotes.github.io/econometrics/random-walks.html) | Spurious regression |
| 3 | [R-squared Is Not a Report Card](https://econometricsnotes.github.io/econometrics/r-squared.html) | R-squared and model selection |
| 4 | [The Noisy Ruler](https://econometricsnotes.github.io/econometrics/noisy-ruler.html) | Measurement error |
| 5 | [When the Errors Fan Out](https://econometricsnotes.github.io/econometrics/errors-fan-out.html) | Heteroskedasticity |
| 6 | [Residuals That Remember Yesterday](https://econometricsnotes.github.io/econometrics/autocorrelation.html) | Autocorrelation |
| 7 | [The Monsoon Dummy](https://econometricsnotes.github.io/econometrics/monsoon-dummy.html) | Dummy variables |
| 8 | [The Day the Rules Changed](https://econometricsnotes.github.io/econometrics/rules-changed.html) | Structural breaks and the Chow test |
| 9 | [Two Friends Who Always Arrive Together](https://econometricsnotes.github.io/econometrics/two-friends.html) | Multicollinearity |

## Part III · Unit Roots

| # | Chapter | Topic |
| --- | --- | --- |
| 1 | [The Kite and the Balloon](https://econometricsnotes.github.io/econometrics/kite-and-balloon.html) | What a unit root is |
| 2 | [The Test That Needed Its Own Table](https://econometricsnotes.github.io/econometrics/dickey-fuller.html) | Dickey-Fuller test |
| 3 | [Giving the Test a Memory](https://econometricsnotes.github.io/econometrics/augmented-dickey-fuller.html) | Augmented Dickey-Fuller test |
| 4 | [The Two Phillipses](https://econometricsnotes.github.io/econometrics/phillips-perron.html) | Phillips-Perron test |
| 5 | [Two Courts, Opposite Verdicts](https://econometricsnotes.github.io/econometrics/kpss.html) | KPSS test |
| 6 | [The Short-Sighted Umpire](https://econometricsnotes.github.io/econometrics/dfgls-ng-perron.html) | DF-GLS, ERS, Ng-Perron |
| 7 | [The Road with a Step](https://econometricsnotes.github.io/econometrics/structural-breaks-unit-roots.html) | Zivot-Andrews and breaks |
| 8 | [Twenty States, One Question](https://econometricsnotes.github.io/econometrics/panel-unit-roots.html) | Panel unit root tests |

## Data and EViews files

- [`blog_datasets.xlsx`](blog_datasets.xlsx) — one sheet per chapter, with a README sheet describing every variable
- [`blog_posts.prg`](blog_posts.prg) — EViews program that reproduces every table in the chapters

To use them: save both files in the same folder, open EViews, choose **File → Open → Program**,
select `blog_posts.prg` and click **Run**.

All datasets are simulated for teaching purposes. You are welcome to use them in your own classes.

## About this repository

This repository holds the published website, built with [MkDocs](https://www.mkdocs.org) and the
[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme, and hosted on GitHub Pages.
All files sit in one folder so the site can be updated by simply uploading files.
