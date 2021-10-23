{ config, pkgs, ... }:

with pkgs; {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    (python39.withPackages (pyPkgs:
      with pyPkgs; [
        astropy
        astroquery
        beautifulsoup4
        biopython
        cartopy
        cftime
        dask
        flake8
        intake
        joblib
        matplotlib
        netcdf4
        networkx
        numba
        numpy
        obspy
        pandas
        pycryptodomex
        requests
        scikitlearn
        scipy
        seaborn
        sympy
        tensorflowWithCuda # Unfree.
        xarray
      ]))
  ];
}
