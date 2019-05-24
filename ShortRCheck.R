# ========================================================================
# ShortRCheck.R (Release 1.0)
# =============-----------------------------------------------------------
#
# Copyright (C) 2019 Norman Markgraf
# 
# Release  Datum            Bemerkung
# ------------------------------------------------------------------------
# 1.0.0    24.05.2019 (nm)  Initial Commit
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

check_for_packages <- function(packages = packages_list) {
    error <- FALSE
    ipl <- installed.packages()[,1]
    for (pkg in packages) {
        if (pkg %in% ipl) {
            cat(
                paste(
                    "Paket",
                    pkg,
                    "gefunden!",
                    "\n"
                )
            )
        } else {
            cat(
                paste(
                    "Paket",
                    pkg,
                    "wurde nicht gefunden! Bitte installieren Sie es nach und prüfen Sie erneut!",
                    "\n"
                )
            )
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