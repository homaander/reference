data_block
  ----
    data1: "GTR"
      > {G = 07}: (xxxxx xxxxx xxxxx xxx++ +++++)
      > {T = 20}: (xxxxx +++++ +++++ +++++ +++++)
      > {R = 18}: (xxxxx xx+++ +++++ +++++ +++++)
    > ---
    data2: "EQL"
      > {E = 05}: (xxxxx xxxxx xxxxx xxxxx +++++)
      > {Q = 14}: (xxxxx xxx++ +++++ +++++ +++++)
      > {L = 12}: (xxxxx xxxxx xxx++ +++++ +++++)
    > ---
    data3: "LOW"
      > {L = 12}: (xxxxx xxxxx xxx++ +++++ +++++)
      > {O = 15}: (xxxxx xxxxx +++++ +++++ +++++)
      > {W = 23}: (xx+++ +++++ +++++ +++++ +++++)
    > ---

any_block
  > --

# Для перевода значения в число добавляется 64
val_to_num
  loop 8
    > (xx+++ +++++) [-
      goto data_block
        ++++[----<++++]---->

      foreach data_block as data
      ++[--
        foreach data as cell
          +++[---
            add 8
              (xx+++ +++++)
          >+++]---
      >++]-->
    ] <

if_block
  get 2 vals
    > {*IF_A}: ,
    > {*IF_B}: ,
  set_nulrun
    > {*IF_NUL}: (xxxxx)
    > {*IF_RUN}: +
  <<<

  # Вычесть *IF_A из *IF_B в *IF_B отрицательнй результат приравнивать к 255
  init
    {*IF_A} [-> {*IF_B} +[->] {*IF_NUL | *IF_B} >[<] {*IF_NUL} < {*IF_B} -< {*IF_A}] {*IF_A}

  if not negative
    {*IF_A} > {*IF_B} +[-
      if positive
        [
          goto data_block
            ++++[----<++++]---->

          goto data3
            +++[--->+++]--->
            +++[--->+++]--->
          print data3
            +++[---(.)>+++]---

          goto if_block
            ++[-->++]--> {*IF_A}
        ]

      if zero
        {*IF_A | *IF_B} >> {*IF_NUL | *IF_RUN} [
          goto data_block
            ++++[----<++++]---->

          goto data2
            +++[--->+++]--->
          print data2
            +++[---(.)>+++]---

          goto if_block
            ++[-->++]--> {*IF_A}
        ]

      correct_to if_block
        ++[--<++]--> {*IF_A}
    ]
  if negative
    {*IF_A | *IF_B} >> {*IF_NUL | *IF_RUN} [
      goto data_block
        ++++[----<++++]---->

      print data1
        +++[---(.)>+++]---

      goto if_block
        ++[-->++]--> {*IF_A}
    ]

  goto if_block
    ++[--<++]--> {*IF_A}

  clear if_block
    >>>-
    <<[-]<<

