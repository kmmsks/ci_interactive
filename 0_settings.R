pr_year <- 2019


labs_lst <- list(
  sukup = data.table(val = c(2,1,0), lab = c("Women", "Men", "All")),
  sukup_title = "Sex/gener",
  age_title = "Age, y",
  agegr_labs = c("1-4", paste0(seq(5,95,5), "–", seq(9,100,5))),
  agegr_title = "Age group, y",
  sample = data.table(val = c("all", "esh", "inpatient"), lab = c("All Contacts", "Secondary Care Only", "Inpatient Care Only")),
  sample_title = "Treatment type",
  ci_ax_title = "Cumulative incidence, %",
  ir_ax_title = "Incidence rate per 10 000 Person-Years",
  pr_ax_title = "12-mo service utilization, %",
  ci_title = "Cumulative Incidence",
  ir_title = "Incidence",
  pr_title = "Service Utilization"
)

labs_lst$type <- data.table(val = c("ci", "ir", "pr"), lab = c(labs_lst$ci_title, labs_lst$ir_title, labs_lst$pr_title))

labs_lst_short <- list(
  ci_ax_title = "CumI, %",
  ir_ax_title = "IR per 10 000 PY",
  pr_ax_title = "12-mo SUR, %",
  ci_title = "Cumulative Incidence (CumI)",
  ir_title = "Incidence Rate (IR)",
  pr_title = "Service Utilization Rate (SUR)",
  confint = "and 95% CI"
)

# Diagnoses --------------------------------------------------------------------

f2x <- c("f21", "f22", "f23", "f24", "f25", "f28", "f29")
f2x_labs <- c("Schizotypal disorder (F21)", 
              "Persistent delusional disorders (F22)", 
              "Acute and transient psychotic disorders (F23)", 
              "Induced delusional disorder (F24)", 
              "Schizoaffective disorders (F25)", 
              "Other nonorganic psychotic disorders (F28)", 
              "Unspecified nonorganic psychosis (F29)")

dgs_tbl <- data.table(
  dg = c("any","any_psy", "f_any", "first",
         "any_no_f0", "f_any_no_f0", "first_no_f0",
         "f0", "f00_f03", "f04_f09", 
         "f1", "f10", "f11", "f12", "f13", "f14", "f15", "f16", "f17", "f18", "f19",
         "f2", "f20", "f2_no_sch", 
         f2x,
         "f3", "f30_f31", "f32_f33", "f3_other", 
         "f4", "f40_f41", "f42", "f43", "f44", "f45", "f48", "f4_other", 
         "f5", "f50", "f51", "f53", "f5_other", 
         "f6", "f600", "f601", "f602", "f603", "f604", "f605", "f606", "f607", 
         "f608", "f609", "f61", "f62", "f63_f69",
         "f7", "f70", "f71",  "f72", "f73", "f78", "f79",
         "f8", "f80", "f81", "f82", "f83", "f84", "f88", "f89", 
         "f9", "f90", "f9_other", 
         "f91", "f92", "f93", "f94", "f95", "f98", 
         "f99",
         "psychoses", "imtm"),
  labs = c("Any mental disorder","Any mental disorder", "Any mental disorder", "Any mental disorder",
           "Non-organic mental disorders (F10-F99)", "Non-organic mental disorders (F10-F99)", "Non-organic mental disorders (F10-F99)", #"Any mental disorder, organic mental disorders excluded (F10-F99)",
           "Organic mental disorders (F00-F09)", "Dementias (F00-03)", "Others (F04-09)", 
           "Substance use disorders (F10-F19)",
           "Alcohol use disorders (F10)", "Opiods use disorders (F11)", "Cannabinoids use disorders (F12)", "Sedatives or hypnotics use disorders (F13)",
           "Cocaine use disorders (F14)", "Other stimulants use disorders (F15)", "Hallucinogens use disorders (F16)", "Tobacco use disorders (F17)",
           "Volatile solvents use disorders (F18)", "Multiple and other substances use disorders (F19)",
           "Schizophrenia spectrum (F20-F29)", "Schizophrenia (F20)", "Other (F21-29)", 
           f2x_labs,
           "Mood disorders (F30-F39)", "Mania and bipolar disorder (F30-31)", 
           "Depressive disorders (F32-F33)", "Others (F34-F39)", 
           "Neurotic, stress-related and somatoform disorders (F40-F48)", "Anxiety disorders (F40-41)",
           "Obsessive - compulsive disorder (F42)", "Reaction to severe stress, and adjustment disorders (F43)",
           "Dissociative disorders (F44)", "Somatoform disorders (F45)", "Other neurotic disorders (F48)",
           "Others (F43-48)", 
           "Behavioural syndromes (F50-F59)", "Eating disorders (F50)", "Nonorganic sleep disorders (F51)", "Disorders associated with the puerperium (F53)", "Others (F54-F59)", 
           "Personality disorders (F60-F69)", 
           "Paranoid personality disorder (F60.0)", "Schizoid personality disorder (F60.1)", "Dissocial personality disorder (F60.2)", 
           "Emotionally unstable personality disorder (F60.3)", "Histrionic personality disorder (F60.4)", "Anankastic personality disorder (F60.5)",
           "Anxious [avoidant] personality disorder (F60.6)", "Dependent personality disorder (F60.7)", "Other specific personality disorders (F60.8)",
           "Personality disorder, unspecified (F60.9)",
           "Mixed and other personality disorders (F61)", "Enduring personality changes, not attributable to brain damage and disease (F62)", "Others (F63-F69)",
           "Intellectual disability (F70-F79)", 
           "Mild intellectual disability (F70)", "Moderate intellectual disability (F71)", "Severe intellectual disability (F72)", "Profound intellectual disability (F73)",
           "Other intellectual disability (F78)", "Unspecified intellectual disability (F79)",
           "Disorders of psychological development (F80-F89)",
           "Specific developmental disorders of speech and language (F80)",
           "Specific developmental disorders of scholastic skills (F81)",
           "Specific developmental disorder of motor function (F82)",
           "Mixed specific developmental disorders (F83)",
           "Pervasive developmental disorders (F84)",
           "Other disorders of psychological development (F88)",
           "Unspecified disorder of psychological development (F89)",
           "Behavioural and emotional disorders (F90-F98)", "ADHD (F90)", "Other (F91-98)",
           "Conduct disorders (F91)",
           "Mixed disorders of conduct and emotions (F92)",
           "Emotional disorders with onset specific to childhood (F93)",
           "Disorders of social functioning with onset specific to childhood and adolescence (F94)",
           "Tic disorders (F95)",
           "Other behavioural and emotional disorders with onset usually occurring in childhood and adolescence (F98)",
           "Unspecified mental disorder (F99)",
           "All psychoses", "Intentional self-harm (X60-84)"
  )
)
dgs_tbl[dg == "f9", labs_long := "Behavioural and emotional disorders with onset usually occurring in childhood
and adolescence (F90–F98)"]
dgs_tbl[, subgr := labs %>% str_detect("\\(F\\d\\d")]
dgs_tbl[dg == "f9", subgr := F]

dgs_tbl[, maingroup := dg %in% paste0("f", seq(0,9))]

dgs_tbl[, dg_maingroup := dg %>% str_sub(1,2)][!str_starts(dg_maingroup, "f"), dg_maingroup := NA][dg == "f_any", dg_maingroup := NA]


dg_min_ages <- list(
  overall = 5,
  dg_specific = 
    list(f7 = 1, f8 = 1, f9= 1, f90 = 1, f9_other = 1, f00_f03 = 35) %>% 
    stack() %>% setDT() %>%  setnames(c('ind', 'values'), c('dg', 'age')) %>% .[,.(dg, age)]
)

dgs_tbl[, min_age := dg_min_ages$overall]
dgs_tbl[dg_min_ages$dg_specific, on = "dg", min_age := i.age]

dgs_tbl[, sub_chapter := F][dg %in% paste0("f", seq(0,9)), sub_chapter := T]

dgs_tbl[, specific_dgs := 0]
dgs_tbl[sub_chapter == T |  grepl("f\\d\\d", dg) | dg %in% c("first", "first_no_f0"), specific_dgs := 1]

dgs_tbl[dg %in% c("f3_other", "f5_other"), specific_dgs := 1]

dgs_tbl[dg == "f99", specific_dgs := 0]


dgs_tbl[sub_chapter == 1, out := labs][sub_chapter == 0, out := dg %>% str_replace_all("f", "F") %>% str_replace("_", "-")]

dgs_tbl[dg == "first", out := paste0(labs, " (F00-F99)")]

dgs_tbl[dg == "first_no_f0", out := labs]

dgs_tbl[dg == "f3_other", out := "F34-F39"][dg == "f5_other", out := "F54-F59"]

dgs_tbl[, code := labs %>% word(start = -1) %>% str_remove(fixed("(")) %>% str_remove(fixed(")"))][code == "disorder", code := "F00-F99"]

dgs_tbl[, labs_main := labs]

dgs_tbl[dg == "first", `:=`(maingroup = TRUE, labs = "All vs. non-organic")]



