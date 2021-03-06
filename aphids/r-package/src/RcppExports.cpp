// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// get_utility
double get_utility(int core_no, int seed, NumericVector times);
RcppExport SEXP _aphids_get_utility(SEXP core_noSEXP, SEXP seedSEXP, SEXP timesSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< int >::type core_no(core_noSEXP);
    Rcpp::traits::input_parameter< int >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type times(timesSEXP);
    rcpp_result_gen = Rcpp::wrap(get_utility(core_no, seed, times));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_aphids_get_utility", (DL_FUNC) &_aphids_get_utility, 3},
    {NULL, NULL, 0}
};

RcppExport void R_init_aphids(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
