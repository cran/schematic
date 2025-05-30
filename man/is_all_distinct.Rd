% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predicates.R
\name{is_all_distinct}
\alias{is_all_distinct}
\title{Check if all values in a vector are distinct}
\usage{
is_all_distinct(x)
}
\arguments{
\item{x}{A vector}
}
\value{
TRUE if the vector has all unique values
}
\description{
Check if all values in a vector are distinct
}
\examples{
is_all_distinct(c(1:5)) # TRUE
is_all_distinct(c(1, 1, 2)) # FALSE
}
