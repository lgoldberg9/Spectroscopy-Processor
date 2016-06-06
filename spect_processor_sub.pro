PRO spect_processor_sub, image, dark, lamp, bias, percentage, outfile, center, right_limit, left_limit, right_sky
  
  columns = fltarr(512)
  image = float(image)

  for i = 0, 511 do begin
     for j = 0, 511 do columns(i)+columns(i)+image(i,j)
  endfor

  plot, columns, xtitle='Column Number', ytitle='Total Brightness'
  
  
  
end
