/=  /= //
= //
= / -> //
= 
= /[]/
=   \\ -> \/
=   /
= /<>/
=   \\ -> \\ -> \\ -> \/
=   /
= 
= /.~/\\ -> \\/
= 
= 
= /[print]//
= 
= /# CONSTANTS //
=   /{input}/abccba my just hello world/
=       /{C}/^^^^^^^^^^^^^^^^^^^^^^^^^^/
= 
=     /{1}/^/
=     /{2}/^^/
=     /{3}/^^^/
=     /{4}/^^^^/
=     /{5}/^^^^^/
=     /{6}/^^^^^^/
=     /{7}/^^^^^^^/
=     /{8}/^^^^^^^^/
=     /{9}/^^^^^^^^^/
= 
= /# INTERFACES //
=   /<just_tpl>/
=     <>jus.~.~t<>no<>
=     /
= 
=   /<i>/
=     <>{i:a.~}<>from_i<>
=     /
= 
=   /<repl>/
=     <>{repl:a.~}<>{repl:b.~}<>
=     /
= 
= /# FUNCTIONS //
=   /# Объявление счётчика //
=   /[sort^/[sort][sort/
=   /[sort]/
=     []b.~a[]ab[]
=     []c.~b[]bc[]
=     []c.~a[]ac[]
=     /
= 
=   /# Использование указателей //
=   /[upper^/[+upper][upper/
=   /[+upper]/
=     []#upper.~>a[]A#upper>[]
=     []#upper.~>b[]B#upper>[]
=     []#upper.~>c[]C#upper>[]
=     /
= 
=   /# Удаление указателя //
=   /[upper]/
=     []#upper.~>[][]
=     /
= 
=   /# Одноразовая функция //
=   /[i:fst]/<i>/
=     /{i:a\}/hello/
=   /[i:snd]/<i>/
=     /{i:a\}/world/
=   
=   /[test]/
=     []{test:val\}[]test[]
=     <just_tpl>
=     /
=       /{test:val\}/my/
= 
= /# APP //
=   [i:fst]
=   [i:snd]
=   [test]
=   [sort{5}]
=   [upper{2}]
= 
=   /{result}/#upper>{input}/
= 
= 
=   [print] -> {result}