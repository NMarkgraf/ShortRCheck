# ========================================================================
# ShortRCheck.R (Release 1.0.1)
# =============-----------------------------------------------------------
#
# Copyright (C) 2019 Norman Markgraf
# 
# Release  Datum            Bemerkung
# ------------------------------------------------------------------------
# 1.0.0    24.05.2019 (nm)  Initial Commit
# 1.0.1    24.05.2019 (nm)  "deep_check_package()" vorgesehen um die 
#                           Funktionstüchtigkeit der Pakete zu testen.
#
#
# ------------------------------------------------------------------------

packages_list <- c(
    "mosaic",
    "rmarkdown",
    "dplyr",
    "ggplot2",
    "ggformula",
    "gridExtra",
    "mosaicCalc"
)

write_copyright_notice <- function() {
    cat(
        paste(
            " ",
            "ShortRCheck.R  Copyright (C) 2019 Norman Markgraf",
            "This program comes with ABSOLUTELY NO WARRANTY.",
            "This is free software, and you are welcome to redistribute it",
            "under certain conditions.",
            "",
            "",
            sep = '\n'
        )
    )
}

write_program_notice <- function() {
    cat(
        paste(
            " ",
            "ShortRCheck.R",
            "=============",
            "",
            "Ein kleiner Test ob die R Installation erfolgreich abgeschlossen ist.",
            " ",
            sep = "\n"
        )
    )
}

write_package_found_message <- function(package_name="") {
    cat(
        paste(
            "Paket",
            package_name,
            "gefunden!",
            "\n"
        )
    )
}

write_package_okay_message <- function(package_name="") {
    cat(
        paste(
            "Paket",
            package_name,
            "konnte geladen werden.",
            "\n"
        )
    )
}

write_package_not_found_message <- function(package_name="") {
    cat(
        paste(
            "Paket",
            package_name,
            "wurde nicht gefunden! Bitte installieren Sie es nach und prüfen Sie erneut!",
            "\n"
        )
    )
}

write_user_message <- function(error_found = FALSE) {
    if (error_found) {
        cat(
            paste(
                "",
                "Leider haben wir bei der Prüfung Ihrer Pakete einige nicht installierte Pakete bemerkt.",
                "Bitte prüfen Sie noch einmal ob und wenn welche Pakete nicht installiert waren und installieren Sie diese von Hand (erneut).",
                "Danach prüfen Sie bitte Ihre Installation erneut.",
                "",
                "Viel Erfolg!",
                "",
                sep = "\n"
            )
        )
        
    } else {
        cat(
            paste(
                "",
                "Es wurden keine fehlenden Pakete gefunden. Ihre Installation sollte hiermit abgeschlossen sein!",
                "",
                "Viel Erfolg und Spaß mit R!",
                "",
                sep = "\n"
            )
        )
    }
}


deep_check_package <- function(package_name = "") {
#    old_warn <- options()$warn
#    options(warn=2)
    
    cl <- try(suppressWarnings(suppressMessages(
            require(
                package_name, 
                attach.required=T, 
                warn.conflicts=F, 
                quietly=T, 
                character.only = TRUE
            )))
          )
    
    if (class(cl) == "try-error") {
        cl <- FALSE
    }
    
#   try(detach(paste0("package:", package_name), character.only = TRUE))
#    options(warn=old_warn)
    cl
}

check_for_packages <- function(packages = packages_list) {
    error <- FALSE
    ipl <- installed.packages()[,1]
    for (pkg in packages) {
        if (pkg %in% ipl) {
            write_package_found_message(pkg)
            if (deep_check_package(pkg)) {
                write_package_okay_message(pkg)
            }
        } else {
            write_package_not_found_message(pkg)
            error <- TRUE
        }
    }
    error
}

# ------------------------------------------------------------------------
# Main 
# ------------------------------------------------------------------------

write_program_notice()
write_copyright_notice()
error_found <- check_for_packages()
write_user_message(error_found)

# ========================================================================