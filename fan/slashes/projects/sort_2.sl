/
//

/~//
/  //
/@/\\\\/
/#/\\\//

/{input}/32213223312123/

/{var_a}/{input}(end)/

/(end)/(@nope)/

/A/@@{_a}/  /B/@@{_b}/  /C/@@{_c}/

/11/AA/  /12/AB/  /13/AC/  /1A/AA/  /1B/AB/  /1C/AC/
/21/BA/  /22/BB/  /23/BC/  /2A/BA/  /2B/BB/  /2C/BC/
/31/CA/  /32/CB/  /33/CC/  /3A/CA/  /3B/CB/  /3C/CC/

/A1/AA/  /A2/AB/  /A3/AC/
/B1/BA/  /B2/BB/  /B3/BC/
/C1/CA/  /C2/CB/  /B3/BC/

/{save}/{var_a}/

/A/(com)//B/(com)//C/(com)/

/{var_a}/{var_a}/

/(@nope)//
/(nope)//
/{_a}/1//{_b}/2//{_c}/3/

      /(com)/(cut)(sort)/
/(sort)(cut)/(cut)(sort)/

/(sort)/
  #(@marker)2(@marker)1#(@marker)1(@marker)2#
  #(@marker)3(@marker)1#(@marker)1(@marker)3#
  #(@marker)3(@marker)2#(@marker)2(@marker)3#
/

/(cut)/
  #(@pointer)1#1(@pointer)(@br)#
  #(@pointer)2#2(@pointer)(@br)#
  #(@pointer)3#3(@pointer)(@br)#

  #1(@pointer)(@br)#(@marker)1(@br)(@pointer)(@br)#
  #2(@pointer)(@br)#(@marker)2(@br)(@pointer)(@br)#
  #3(@pointer)(@br)#(@marker)3(@br)(@pointer)(@br)#
  #(@br)##
/

/(post)/
  #(@pointer)##
  #(@marker)##
/

{var_a}(post)(pointer){save},{save}