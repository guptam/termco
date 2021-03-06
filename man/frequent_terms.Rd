% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/frequent_terms.R
\name{frequent_terms}
\alias{frequent_terms}
\alias{all_words}
\title{N Most Frequent Terms}
\usage{
frequent_terms(text.var, n = 20,
  stopwords = stopwords::stopwords("english"), min.freq = NULL,
  min.char = 4, max.char = Inf, stem = FALSE, language = "porter",
  strip = TRUE, strip.regex = "[^a-z' ]", alphabetical = FALSE, ...)

all_words(text.var, stopwords = NULL, min.char = 0, ...)
}
\arguments{
\item{text.var}{A vector of character strings.}

\item{n}{The number of rows to print.  If integer selects the frequency at
the nth row and prints all rows >= that value.  If proportional (less than 0)
the frequency value for the nth\% row is selected and prints all rows >= that
value.}

\item{stopwords}{A vector of stopwords to exclude.}

\item{min.freq}{The minimum frequency to print.  Note that this argument
overides the \code{n} argument.}

\item{min.char}{The minimum number of characters a word must be (including
apostrophes) for inclusion.}

\item{max.char}{The maximum number of characters a word must be (including
apostrophes) for inclusion.}

\item{stem}{logical.  If \code{TRUE} the \code{\link[SnowballC]{wordStem}}
is used with \code{language = "porter"} as the default.  Note that stopwords
will be stemmed as well.}

\item{language}{The stem language to use (see  \code{\link[SnowballC]{wordStem}}).}

\item{strip}{logical.  If \code{TRUE} all values that are not alpha, apostrophe,
or spaces are stripped.  This regex can be changed via the \code{strip.regex}
argument.}

\item{strip.regex}{A regular expression used for stripping undesired characters.}

\item{alphabetical}{logical.  Should rows be arranged alphabetically by term
or frequency.}

\item{\ldots}{ignored.}
}
\value{
Returns a \code{\link[base]{data.frame}} of terms and frequencies.
}
\description{
\code{frequent_terms} - Find a list of the n most frequent terms.

\code{all_words} - Find a list of all terms used.
}
\examples{
\dontrun{
x <- presidential_debates_2012[["dialogue"]]

frequent_terms(x)
frequent_terms(x, min.char = 1)
frequent_terms(x, n = 50)
frequent_terms(x, n = .02)
frequent_terms(x, stem = TRUE)
frequent_terms(x, n = 50, stopwords = c(stopwords::stopwords("english"), "said", "well"))

plot(frequent_terms(x))
plot(frequent_terms(x, n = .02))
plot(frequent_terms(x, n = 40))
plot(frequent_terms(x, n = 40), as.cloud = TRUE)

## Note `n` can be used in print to change how many rows are returned.
## This output can be reassigned when wrapped in print.  This is useful
## reduce computational time on larger data sets.
y <- frequent_terms(x, n=10)
nrow(y)
z <- print(frequent_terms(x, n=100))
nrow(z)

## Cumulative Percent Plot
plot_cum_percent(frequent_terms(presidential_debates_2012[["dialogue"]]))
}
}
\keyword{frequency}
\keyword{term}
\keyword{word}
