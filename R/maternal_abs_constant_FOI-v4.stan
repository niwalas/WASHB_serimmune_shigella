// constant FOI model: including maternal antibodies

functions{
  real[] prob_infection_calc(int[] ages, real lambda, real gamma, int n_obs) {
    real prob[n_obs];
    for(i in 1:n_obs){
      real a = ages[i];
      prob[i] = 1-(gamma/gamma-lambda)*(exp(-lambda*a) - exp(-gamma*a));
    }
    
    return prob;
  }
  
}

data{
  int<lower=0> n_obs; // No. rows in data or no. age classes
  int n_pos[n_obs]; // seropositive
  int n_total[n_obs]; // tested
  int ages[n_obs];
  
}

parameters{
  real<lower=0> gamma; // rate of decay of maternal antibodies
  real<lower=0> lambda; // real<lower=0, upper=gamma>; // 

}

transformed parameters{
  real<lower=0> prob_infection[n_obs] = prob_infection_calc(ages, lambda, gamma, n_obs);
  
}

model{
  // priors
  lambda ~ normal(0.1, 0.5); // somewhat low FOI of mean 0.1 per month
  log(gamma) ~ normal(log(0.25), 0.001); // slightly slower strongly informative prior of waning rate 
   
  // likelihood
  n_pos ~ binomial(n_total, prob_infection);
  
}

generated quantities{
  int pos_pred[n_obs] = binomial_rng(n_total, prob_infection);

  // pointwise log likelihoods for model comparison:
  vector[n_obs] log_likelihood;
  
  for(i in 1:n_obs){
    log_likelihood[i] = binomial_lpmf(n_pos[i] | n_total[i], prob_infection[i]);
  }
  
}
