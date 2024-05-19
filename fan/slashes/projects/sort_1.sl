/
//

/~//
/  //
/@/\\\\/
/#/\\\//

/{input}/3221322123/
/{~main}/^^^^^^^^^^/

/^/(cut)/

/(+sort)/(cut,sort)/
/(cut)(cut,sort)/(cut,sort)(cut,sort)/
/(cut,sort)/(cut)(sort)/
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

{main}(+sort)(post)

(pointer){input},{input}

