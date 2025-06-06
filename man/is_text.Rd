% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predicates.R
\name{is_text}
\alias{is_text}
\title{Check if a vector is text-based (character or factor)}
\usage{
is_text(x)
}
\arguments{
\item{x}{A vector}
}
\value{
TRUE if vector is either character or factor
}
\description{
`NA`s are ignored as long as they are `NA_character_`.
}
\examples{
is_text(letters[1:4]) # TRUE
is_text(as.factor(letters[1:4])) # TRUE
is_text(1) # FALSE
}
