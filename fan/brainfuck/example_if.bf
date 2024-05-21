data_block
  ----
    data1: "GTR"
      > letter:07 'G' (xxxxx xxxxx xxxxx xxx++ +++++)
      > letter:20 'T' (xxxxx +++++ +++++ +++++ +++++)
      > letter:18 'R' (xxxxx xx+++ +++++ +++++ +++++)
    > ---
    data2: "EQL"
      > letter:05 'E' (xxxxx xxxxx xxxxx xxxxx +++++)
      > letter:14 'Q' (xxxxx xxx++ +++++ +++++ +++++)
      > letter:12 'L' (xxxxx xxxxx xxx++ +++++ +++++)
    > ---
    data3: "LOW"
      > letter:12 'L' (xxxxx xxxxx xxx++ +++++ +++++)
      > letter:15 'O' (xxxxx xxxxx +++++ +++++ +++++)
      > letter:23 'W' (xx+++ +++++ +++++ +++++ +++++)
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
        add 8 foreach data as cell
          +++[ (+++++) >+++]---
      >++]-->
    ] <

if_block
  get 2 vals
    *IF_A: > ,
    *IF_B: > ,
  set_nulrun
    *IF_NUL: > (xxxxx)
    *IF_RUN: > +
  <<<

  (*IF_A)

  # Вычесть *IF_A из *IF_B в *IF_B отрицательнй результат приравнивать к 255
  init
    [-> (*IF_B) +[->] (*IF_NUL|*IF_B) >[<] (*IF_NUL) < (*IF_B) -< (*IF_A)]

  if not negative
    > (*IF_B) +[-
      if positive
        [
          goto data_block
            ++++[----<++++]---->

          goto data3
            +++[--->+++]--->
            +++[--->+++]--->
          print foreach cell in data3
            +++[---(.)>+++]---

          goto if_block
            ++[-->++]--> (*IF_A)
        ]

      if zero
        (*IF_A|*IF_B) >> (*IF_NUL|*IF_RUN) [
          goto data_block
            ++++[----<++++]---->

          goto data2
            +++[--->+++]--->
          print foreach cell in data2
            +++[---(.)>+++]---

          goto if_block
            ++[-->++]--> (*IF_A)
        ]

      correct_to if_block
        ++[--<++]--> (*IF_A)
    ]
  if negative
    (*IF_A|*IF_B) >> (*IF_NUL|*IF_RUN) [
      goto data_block
        ++++[----<++++]---->

      print foreach cell in data1
        +++[---(.)>+++]---

      goto if_block
        ++[-->++]--> (*IF_A)
    ]

  goto if_block
    ++[--<++]--> (*IF_A)

  clear if_block
    >>>-
    <<[-]<<

