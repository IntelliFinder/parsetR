% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/parset.R
\name{parset}
\alias{parset}
\title{Create a Parallel Sets Visualization}
\usage{
parset(data = NULL, dimensions = NULL, value = NULL, spacing = NULL,
  tension = NULL, duration = NULL, dimensionFormat = NULL,
  tooltip = NULL, categoryTooltip = NULL, width = NULL, height = NULL)
}
\arguments{
\item{data}{\code{table} such as \code{Titanic}}

\item{dimensions}{If dimensions is specified, sets the categorical dimensions to be visualised. If a function is specified, it is invoked for every element in the target selection and an array of dimension names is expected in return. If an array is specified, it should be an array of dimension names (object keys).
If dimensions is not specified, returns the current dimensions.}

\item{value}{Specifies the value accessor. If value is not specified, returns the current value accessor. The default accessor simply returns 1 for each input data element i.e. the absolute frequency count. This value is used to set the width of the horizontal bars and connecting ribbons in proportion to the value.
If the input data is a pivot table, you’ll want to set this to return the aggregate sum for each input data element. You could also use an arbitrary numerical measure instead of frequency if appropriate.}

\item{spacing}{Specifies the total amount of spacing in pixels to be divided between the horizontal category bars. If spacing is not specified, returns the current spacing, which defaults to 20.}

\item{tension}{Specifies the tension for the ribbon curves. This should be a value between 0 and 1 inclusive. If tension is not specified, returns the current tension, which defaults to 1 (straight lines).}

\item{duration}{Specifies the duration for the animated transitions in milliseconds. If duration is not specified, returns the current duration, which defaults to 500.}

\item{dimensionFormat}{Specifies a formatting function for the dimension name. If dimensionFormat is not specified, returns the current formatting function, which defaults to String.}

\item{tooltip}{Specifies a formatting function for the ribbon tooltip. If tooltip is not specified, returns the current formatting function.}

\item{categoryTooltip}{Specifies a formatting function for the category tooltip. If categoryTooltip is not specified, returns the current formatting function, which defaults to:}

\item{width,height}{Any valid \code{CSS} height and width for the htmlwidget container.}
}
\description{
Create a Parallel Sets Visualization
}
\examples{
# devtools::install_github("timelyportfolio/parsetR")
library(parsetR)

# using defaults
parset(Titanic)

# curved lines
parset(Titanic, tension = 0.2)

# with HairEyeColor
parset(HairEyeColor)

# examples from ggparallel
#  http://artax.karlin.mff.cuni.cz/r-help/library/ggparallel/html/ggparallel.html
#  ggparallel(list("gear", "cyl"), data=mtcars)
parset(mtcars[,c("gear","cyl")])

data(genes,package="ggparallel")
parset(genes[,c("path","chrom")])


# demonstrate working with non-table
data(Alligator, package="vcdExtra")
# with data.frame to demo how it doesn't work
parset(Alligator)
# contrived example converting to data.frame first
parset(
  Alligator,
  # dimensions are the categorical columns
  dimensions = colnames(Alligator)[-5],
  # use some JavaScript to inform parset that Freq has the value
  value = htmlwidgets::JS("function(d){return d.count}")
)

}

