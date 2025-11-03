# LIBRARIES ==================================================================
## Shiny ==============================
library(shiny)
library(shinydashboard)
## Data handling ======================
library(dplyr)
library(DT)
## Github integration =================
library(gh)
## Google Sheets ======================
library(googledrive)
library(googlesheets4)


# Functions ==================================================================
## Trim white spaces across a data frame
trimws_df <- function(x, ...){
    x[] <- lapply(x, trimws, ...)
    return(x)
}
## Create function to scramble the letters of a string
scramble_letters <- function(s) {
    set.seed(as.numeric(format(Sys.time(), "%OS3")))
    letters <- strsplit(s,"")[[1]]   # Take characters
    scrambled <- sample(letters)     # Shuffle
    paste0(scrambled, collapse = "") # combine back to a string
}



# Template data frames =======================================================
template_npprod_batch <- data.frame(
    org_phase = c(NA),
    org_reag_species = c(NA),
    org_reag_conc_nM = c(NA),
    org_vol_mL = c(NA),
    aq_phase = c(NA),
    aq_reag_species = c(NA),
    aq_reag_conc_nM = c(NA),
    payload = c(NA),
    payload_conc_nM = c(NA),
    stir_time_hr = c(NA),
    rotovap_P_mmHg = c(NA),
    rotovap_time_min = c(NA),
    purification = c(NA),
    attr_hydroDiam_nm = c(NA),
    attr_pdi = c(NA),
    attr_zetaPot_mV = c(NA),
    attr_payloadYield_perc = c(NA),
    attr_payloadEE_perc = c(NA),
    notes = c(NA)
)

template_ufluidic_prod <- data.frame(
    ufluidic_system = c(NA),
    ufluidic_chip = c(NA),
    ufluidic_geometry = c(NA),
    ufluidic_aq_FR_ml_min = c(NA),
    ufluidic_org_FR_ml_min = c(NA),
    org_phase = c(NA),
    org_reag_species = c(NA),
    org_reag_conc_nM = c(NA),
    aq_phase = c(NA),
    aq_reag_species = c(NA),
    aq_reag_conc_nM = c(NA),
    payload = c(NA),
    payload_conc_nM = c(NA),
    attr_hydroDiam_nm = c(NA),
    attr_pdi = c(NA),
    attr_zetaPot_mV = c(NA),
    attr_payloadYield_perc = c(NA),
    attr_payloadEE_perc = c(NA),
    notes = c(NA)
)

template_invitro_cytotox <- data.frame(
    np_description = c(NA),
    np_materials = c(NA),
    payload = c(NA),
    np_conc_ug_ml = c(NA),
    payload_conc_nM = c(NA),
    np_attr_hydroDiam_nm = c(NA),
    np_attr_pdi = c(NA),
    np_attr_zetaPot_mV = c(NA),
    notes = c(NA),
    cell_species = c(NA),
    cell_culture_medium = c(NA),
    well_plate_no = c(NA),
    cell_seed_density_cells_cm2 = c(NA),
    assay_vol_ul = c(NA),
    assay_type = c(NA),
    neg_control = c(NA),
    pos_control = c(NA),
    perc_cellViability = c(NA)
)

template_invitro_drugEfficacy <- data.frame(
    np_description = c(NA),
    np_materials = c(NA),
    payload = c(NA),
    np_conc_ug_ml = c(NA),
    payload_conc_nM = c(NA),
    np_attr_hydroDiam_nm = c(NA),
    np_attr_pdi = c(NA),
    np_attr_zetaPot_mV = c(NA),
    notes = c(NA),
    cell_species = c(NA),
    cell_culture_medium = c(NA),
    well_plate_no = c(NA),
    cell_seed_density_cells_cm2 = c(NA),
    assay_vol_ul = c(NA),
    assay_type = c(NA),
    neg_control = c(NA),
    pos_control = c(NA),
    perc_cellViability = c(NA)
)

template_invitro_transfeff_exp <- data.frame(
    np_description = c(NA),
    np_materials = c(NA),
    payload = c(NA),
    np_conc_ug_ml = c(NA),
    payload_conc_nM = c(NA),
    np_attr_hydroDiam_nm = c(NA),
    np_attr_pdi = c(NA),
    np_attr_zetaPot_mV = c(NA),
    notes = c(NA),
    cell_species = c(NA),
    cell_culture_medium = c(NA),
    well_plate_no = c(NA),
    cell_seed_density_cells_cm2 = c(NA),
    assay_vol_ul = c(NA),
    assay_type = c(NA),
    neg_control = c(NA),
    pos_control = c(NA),
    perc_cellPositive = c(NA)
)


template_invitro_transfeff_sil <- data.frame(
    np_description = c(NA),
    np_materials = c(NA),
    payload = c(NA),
    np_conc_ug_ml = c(NA),
    payload_conc_nM = c(NA),
    np_attr_hydroDiam_nm = c(NA),
    np_attr_pdi = c(NA),
    np_attr_zetaPot_mV = c(NA),
    notes = c(NA),
    cell_species = c(NA),
    cell_culture_medium = c(NA),
    well_plate_no = c(NA),
    cell_seed_density_cells_cm2 = c(NA),
    assay_vol_ul = c(NA),
    assay_type = c(NA),
    neg_control = c(NA),
    pos_control = c(NA),
    perc_cellPositive = c(NA)
)

