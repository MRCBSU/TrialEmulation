// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// expand_func
Rcpp::IntegerVector expand_func(Rcpp::DataFrame& d, int range, int first_period);
RcppExport SEXP _RandomisedTrialsEmulation_expand_func(SEXP dSEXP, SEXP rangeSEXP, SEXP first_periodSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::DataFrame& >::type d(dSEXP);
    Rcpp::traits::input_parameter< int >::type range(rangeSEXP);
    Rcpp::traits::input_parameter< int >::type first_period(first_periodSEXP);
    rcpp_result_gen = Rcpp::wrap(expand_func(d, range, first_period));
    return rcpp_result_gen;
END_RCPP
}
// censor_func
Rcpp::DataFrame censor_func(Rcpp::DataFrame& sw_data);
RcppExport SEXP _RandomisedTrialsEmulation_censor_func(SEXP sw_dataSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::DataFrame& >::type sw_data(sw_dataSEXP);
    rcpp_result_gen = Rcpp::wrap(censor_func(sw_data));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_RandomisedTrialsEmulation_expand_func", (DL_FUNC) &_RandomisedTrialsEmulation_expand_func, 3},
    {"_RandomisedTrialsEmulation_censor_func", (DL_FUNC) &_RandomisedTrialsEmulation_censor_func, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_RandomisedTrialsEmulation(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
