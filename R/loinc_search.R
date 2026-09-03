#'
#' Search the LOINC database
#' 
#' @inheritParams loinc-params query rows offset sortorder language includefiltercounts tabular
#' @param summary Logical. Should the results summary be returned? If FALSE
#'   (default), full search results are  returned. If TRUE, only results summary
#'   are returned.
#' 
#' @returns A [list] or [tibble] of results summary or full search results.
#' 
#' @examples
#' \dontrun{
#' loinc_search_loincs()
#' loinc_search_answerlists()
#' loinc_search_parts()
#' loinc_search_groups()
#' }
#' 
#' @rdname loinc_search
#' @export
#' 

loinc_search_loincs <- function(query,
                                rows = NULL,
                                offset = NULL,
                                sortorder = NULL,
                                language = NULL,
                                includefiltercounts = NULL,
                                tabular = TRUE,
                                summary = FALSE) {
  req <- httr2::request(base_url = base_url_search) |>
    httr2::req_url_path_append("loincs") |>
    httr2::req_url_query(query = query)
  
  if (!is.null(rows))
    req <- req |>
      httr2::req_url_query(rows = rows)

  if (!is.null(offset))
    req <- req |>
      httr2::req_url_query(offset = offset)
  
  if (!is.null(sortorder))
    req <- req |>
      httr2::req_url_query(sortorder = sortorder)
  
  if (!is.null(language))
    req <- req |>
      httr2::req_url_query(language = language)
  
  if (!is.null(includefiltercounts))
    req <- req |>
      httr2::req_url_query(includefiltercounts = includefiltercounts)
  
  req <- req |>
    httr2::req_auth_basic(
    username = Sys.getenv("LOINC_USERNAME"),
    password = Sys.getenv("LOINC_PASSWORD")
  )

  resp <- httr2::req_perform(req) |>
    httr2::resp_body_json()

  if (summary) {
    if (tabular) {
      resp <- resp[[1]] |>
        dplyr::bind_rows()
    } else {
      resp <- resp[[1]]
    }
  } else {
    if (tabular) {
      resp <- resp[[2]] |>
        tibble::tibble() |>
        tidyr::unnest_wider(.data$`resp[[2]]`)
    } else {
      resp <- resp[[2]]
    }
  }

  resp
}

#'
#' @rdname loinc_search
#' @export
#' 

loinc_search_answerlists <- function(query,
                                     rows = NULL,
                                     offset = NULL,
                                     sortorder = NULL,
                                     language = NULL,
                                     includefiltercounts = NULL,
                                     tabular = TRUE,
                                     summary = FALSE) {
  req <- httr2::request(base_url = base_url_search) |>
    httr2::req_url_path_append("answerlists") |>
    httr2::req_url_query(query = query)
  
  if (!is.null(rows))
    req <- req |>
      httr2::req_url_query(rows = rows)

  if (!is.null(offset))
    req <- req |>
      httr2::req_url_query(offset = offset)
  
  if (!is.null(sortorder))
    req <- req |>
      httr2::req_url_query(sortorder = sortorder)
  
  if (!is.null(language))
    req <- req |>
      httr2::req_url_query(language = language)
  
  if (!is.null(includefiltercounts))
    req <- req |>
      httr2::req_url_query(includefiltercounts = includefiltercounts)
  
  req <- req |>
    httr2::req_auth_basic(
    username = Sys.getenv("LOINC_USERNAME"),
    password = Sys.getenv("LOINC_PASSWORD")
  )

  resp <- httr2::req_perform(req) |>
    httr2::resp_body_json()

  if (summary) {
    if (tabular) {
      resp <- resp[[1]] |>
        dplyr::bind_rows()
    } else {
      resp <- resp[[1]]
    }
  } else {
    if (tabular) {
      resp <- resp[[2]] |>
        tibble::tibble() |>
        tidyr::unnest_wider(.data$`resp[[2]]`)
    } else {
      resp <- resp[[2]]
    }
  }

  resp
}


#'
#' @rdname loinc_search
#' @export
#' 

loinc_search_parts <- function(query,
                               rows = NULL,
                               offset = NULL,
                               sortorder = NULL,
                               language = NULL,
                               includefiltercounts = NULL,
                               tabular = TRUE,
                               summary = FALSE) {
  req <- httr2::request(base_url = base_url_search) |>
    httr2::req_url_path_append("parts") |>
    httr2::req_url_query(query = query)
  
  if (!is.null(rows))
    req <- req |>
      httr2::req_url_query(rows = rows)

  if (!is.null(offset))
    req <- req |>
      httr2::req_url_query(offset = offset)
  
  if (!is.null(sortorder))
    req <- req |>
      httr2::req_url_query(sortorder = sortorder)
  
  if (!is.null(language))
    req <- req |>
      httr2::req_url_query(language = language)
  
  if (!is.null(includefiltercounts))
    req <- req |>
      httr2::req_url_query(includefiltercounts = includefiltercounts)
  
  req <- req |>
    httr2::req_auth_basic(
    username = Sys.getenv("LOINC_USERNAME"),
    password = Sys.getenv("LOINC_PASSWORD")
  )

  resp <- httr2::req_perform(req) |>
    httr2::resp_body_json()

  if (summary) {
    if (tabular) {
      resp <- resp[[1]] |>
        dplyr::bind_rows()
    } else {
      resp <- resp[[1]]
    }
  } else {
    if (tabular) {
      resp <- resp[[2]] |>
        tibble::tibble() |>
        tidyr::unnest_wider(.data$`resp[[2]]`)
    } else {
      resp <- resp[[2]]
    }
  }

  resp
}


#'
#' @rdname loinc_search
#' @export
#' 

loinc_search_groups <- function(query,
                                rows = NULL,
                                offset = NULL,
                                sortorder = NULL,
                                language = NULL,
                                includefiltercounts = NULL,
                                tabular = TRUE,
                                summary = FALSE) {
  req <- httr2::request(base_url = base_url_search) |>
    httr2::req_url_path_append("groups") |>
    httr2::req_url_query(query = query)
  
  if (!is.null(rows))
    req <- req |>
      httr2::req_url_query(rows = rows)

  if (!is.null(offset))
    req <- req |>
      httr2::req_url_query(offset = offset)
  
  if (!is.null(sortorder))
    req <- req |>
      httr2::req_url_query(sortorder = sortorder)
  
  if (!is.null(language))
    req <- req |>
      httr2::req_url_query(language = language)
  
  if (!is.null(includefiltercounts))
    req <- req |>
      httr2::req_url_query(includefiltercounts = includefiltercounts)
  
  req <- req |>
    httr2::req_auth_basic(
    username = Sys.getenv("LOINC_USERNAME"),
    password = Sys.getenv("LOINC_PASSWORD")
  )

  resp <- httr2::req_perform(req) |>
    httr2::resp_body_json()

  if (summary) {
    if (tabular) {
      resp <- resp[[1]] |>
        dplyr::bind_rows()
    } else {
      resp <- resp[[1]]
    }
  } else {
    if (tabular) {
      resp <- resp[[2]] |>
        tibble::tibble() |>
        tidyr::unnest_wider(.data$`resp[[2]]`)
    } else {
      resp <- resp[[2]]
    }
  }

  resp
}
