pro spect_processor, file, file_dark, file_lamp, file_bias, percent
  
  ;****************************************************
  ; NAME: spect_processor
  ;
  ; CALLING SEQUENCE: spect_processor, 'file', 'file_dark', 'file_lamp', percent
  ;
  ; DESCRIPTION: processes cdd spectrum via the following steps:
  ; 1. Determien the channels to extra for sky and object in CCD
  ;      spectrum. (using spect_processor_sub.pro)
  ; 2. Extra object, sky ,dark, and lamp spectra into files.
  ;      (using spect_processor_sub.pro)
  ; 3. Process the object spectra using sky, dark, and lamp spectra. 
  ;      (using spect_sdl.pro)
  ; INPUTS: file- file containing object spectrum (all files are assumed to be in
  ;               /home/cadmus/images)
  ;         file_dark- file containing dark spectra
  ;         file_lamp- file containing lamp spectra
  ;         percentage- the percentage of the brightness of the center pixel
  ;                     that you want to use as the boundary brightness.
  ; 
  ; CREATED: 11/12/13 by M. Gallagher
  ;
  ; LAST EDITED: 06/05/16 by L. Goldberg
  ;
  ;****************************************************

  main_dir = '/home/cadmus/images'

  filename_image = main_dir + file
  load_ccd, filename_image, image

  filename_dark = main_dir + file_dark
  load_ccd, filename_dark, dark

  filename_lamp = main_dir + file_lamp
  load_ccd, filename_lamp, lamp

  filename_bias = main_dir + file_bias
  load_ccd, filename_bias, bias

  spect_processor_sub, image, dark, lamp, bias percentage, file, center, right_limit, left_limit, right_sky

end

  
