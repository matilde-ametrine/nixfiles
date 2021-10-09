{ config, pkgs, ... }:

with pkgs; {
  nixpkgs.config.allowUnfree = true; # tensorflowWithCuda

  environment.systemPackages = [
    (python39.withPackages (pyPkgs:
      with pyPkgs; [
        flake8
        requests
        pycryptodomex

        xarray
        netcdf4
        cftime
        numpy
        pandas
        intake

        numba
        dask
        joblib

        cartopy
        matplotlib
        scipy
        obspy
        astropy
        astroquery

        scikitlearn
        tensorflowWithCuda
      ]))
  ];
}
