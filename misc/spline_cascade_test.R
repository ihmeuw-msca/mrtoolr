# test that spline cascade works

mod1_spline <- MRBRT(
  data = dat1,
  cov_models = list(
    LinearCovModel("intercept", use_re = TRUE),
    LinearCovModel("x1",
                   use_spline = TRUE,
                   spline_knots = array(seq(0, 1, by = 0.2)),
                   spline_degree = 2L
    )
  )
)
mod1_spline$fit_model()

df_sim1$x2 <- 1:nrow(df_sim1) %% 2

cascade1 <- run_spline_cascade(
  stage1_model_object = mod1_spline,
  df = df_sim1,
  col_obs = "y1",
  col_obs_se = "y1_se",
  col_study_id = "study_id",
  stage_id_vars = c("x2"),
  thetas = c(1),
  output_dir = "/home/rstudio/.local/share/",
  model_label = "spline_cascade_test1",
  overwrite_previous = TRUE
)

tmp <- predict_spline_cascade(fit = cascade1, newdata = df_sim1)

with(tmp %>% filter(cascade_prediction_id == "x2__1") %>% arrange(x1), plot(x1, pred, col = "darkorange"))
with(tmp %>% filter(cascade_prediction_id == "x2__0") %>% arrange(x1), lines(x1, pred, col = "blue"))
