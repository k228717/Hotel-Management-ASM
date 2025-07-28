INCLUDE Irvine32.INC
INCLUDE Macros.INC
.stack 4000
.data
CHOICE DWORD ?
Number DWORD 0
Amount Dword ?
total_price Dword 0
halwa_puri Dword 40
paratha Dword 40
tandoori_roti Dword 20
omellete Dword 40
tea Dword 40
dal_fry Dword 150
chicken_biryani Dword 200
anda_ghotala Dword 150
mixed_vegetables Dword 180
chicken Dword 800
qorma Dword 200
dal_chana Dword 150
chicken_karahi Dword 650
chicken_soup Dword 400
chicken_handi Dword 1000
order Dword 10 DUP(0)
quantity Dword 10 DUP(0)
.code
main PROC

mWrite"                                WELCOME TO OUR HOTEL MANAGEMENT SYSTEM                         "
mov ecx,3
l1:
call crlf
loop l1
mwrite"                                        ENTER 1 FOR BREAKFAST"
call crlf
mwrite"                                        ENTER 2 FOR LUNCH"
call crlf
mwrite"                                        ENTER 3 FOR DINNER: "
call crlf
call readint
mov choice,eax
call clrscr
cmp choice,1
je breakfast
cmp choice,2
je lunch
cmp choice,3
je dinner
mWrite"INVALID INPUT"
jmp Taking_Order




breakfast:
mWrite"                                         BREAKFAST MENU"
call crlf
call crlf
call crlf
mWrite"  ITEMS             PRICE                  CODE"
call crlf
call crlf
mWrite"Halwa Puri          RS 40                   1 "
call crlf
mwrite"Paratha             RS 40                   2 "
call crlf
mWrite"Tandoori Roti       RS 20                   3 "
call crlf
mwrite"Omlette             RS 40                   4 "
call crlf
mWrite"TEA                 RS 40                   5 "
call crlf
mwrite"Dal fried           RS 150                  6 "
jmp Taking_Order

lunch:
mWrite"                                         LUNCH MENU"
call crlf
call crlf
call crlf
mWrite"  ITEMS             PRICE                  CODE"
call crlf
call crlf
mWrite"Chicken Biryani     RS 200                   8 "
call crlf
mwrite"Anda Gotala         RS 150                   9 "
call crlf
mWrite"Tandoori Roti       RS 20                    3 "
call crlf
mwrite"MIX Vegetables      RS 180                  11 "
call crlf
mWrite"Chicken             RS 800                  12 "
call crlf
mwrite"Dal fried           RS 150                   6 "
call crlf
jmp Taking_Order

dinner:
mWrite"                                         DINNER MENU"
call crlf
call crlf
call crlf
mWrite"  ITEMS             PRICE                  CODE"
call crlf
call crlf
mWrite"Qorma               RS 200                   15 "
call crlf
mwrite"Dal Channa          RS 150                   16 "
call crlf
mWrite"Chicken Karahi      RS 650                   17 "
call crlf
mwrite"MIX Vegetables      RS 180                   11 "
call crlf
mWrite"Chicken Soup        RS 400                   19 "
call crlf
mwrite"Chicken Handi       RS 1000                  20 "
call crlf
mWrite"Tandoori Roti       RS 20                    3  "
call crlf
jmp Taking_Order

Taking_Order:
call crlf
call crlf
mWrite"How many Items you want to Order: "
call readint
mov number, eax
mov ecx,number
mov esi,0
mov edx,0
loop_for_Order:
mWrite"What would you like to have(Enter Code): "
call readint
mov order[esi],eax
mWrite"What will be the quantity: "
call readint
mov quantity[esi],eax

call orderr


loop loop_for_order


exit1:
call clrscr
call crlf
call crlf
call crlf
mWrite"              ITEM                QUANTITY                PRICE      "
call crlf
mov esi,0
mov ecx,number
lx:
call crlf

call slip

call crlf
loop lx
call crlf
call crlf
call crlf
mWrite"              X-----------------------------------------------X"
call crlf
call crlf
call crlf
mWrite"              TOTAL PRICE                   "
mov eax,total_price
call writedec
call crlf
call crlf
top:
mWrite"              HOW MUCH AMOUNT YOU WILL GIVE "
call readdec
mov Amount,eax
cmp eax,total_price
jl outt
jmp notout
outt:
call crlf
mWrite"              YOUR AMOUNT IS LESS THAN THE TOTAL PRICE(PLEASE RE-ENTER):"
call crlf
call crlf
jmp top
notout:
call crlf
sub eax,total_price
mWrite"              REMAINING AMOUNT              "
call writedec
call crlf
call crlf
mWrite"              THANKYOU FOR COMING! HAVE A NICE DAY"
mov ecx,12
lz:
call crlf
loop lz
exit
main endp

orderr PROC
cmp order[esi],1
je halwa

cmp order[esi],2
je parathaa

cmp order[esi],3
je roti

cmp order[esi],4
je ommelete

cmp order[esi],5
je teaa

cmp order[esi],6
je dalfry

cmp order[esi],8
je biryani

cmp order[esi],9
je anda

cmp order[esi],11
je vege

cmp order[esi],12
je chickenn

cmp order[esi],15
je korma

cmp order[esi],16
je chana

cmp order[esi],17
je karahi

cmp order[esi],19
je soup

cmp order[esi],20
je handi
jmp loop_exit

halwa:
mov ebx,halwa_puri
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

parathaa:
mov ebx,paratha
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

roti:
mov ebx,tandoori_roti
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

ommelete:
mov ebx,omellete
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

teaa:
mov ebx,tea
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

dalfry:
mov ebx,dal_fry
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

biryani:
mov ebx,chicken_biryani
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

anda:
mov ebx,anda_ghotala
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

vege:
mov ebx,mixed_vegetables
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

chickenn:
mov ebx,chicken
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

korma:
mov ebx,qorma
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

chana:
mov ebx,Dal_chana
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

karahi:
mov ebx,chicken_karahi
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

soup:
mov ebx,chicken_soup
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop

handi:
mov ebx,chicken_handi
mov eax,quantity[esi]
cdq
mul ebx
add total_price,eax
add esi,4
jmp end_loop
loop_exit:
mWrite "SORRY THIS ITEM IS NOT AVAILABLE ENTER ANOTHER ITEM "
call crlf
add ecx,1
end_loop:
ret
orderr ENDP

slip PROC
cmp order[esi],1
je halwa

cmp order[esi],2
je parathaa

cmp order[esi],3
je roti

cmp order[esi],4
je ommelete

cmp order[esi],5
je teaa

cmp order[esi],6
je dalfry

cmp order[esi],8
je biryani

cmp order[esi],9
je anda

cmp order[esi],11
je vege

cmp order[esi],12
je chickenn

cmp order[esi],15
je korma

cmp order[esi],16
je chana

cmp order[esi],17
je karahi

cmp order[esi],19
je soup

cmp order[esi],20
je handi
jmp loop_exit

halwa:
mWrite"              HALWA PURI              "
mov eax,quantity[esi]
call writedec
mov ebx,40
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp loop_exit

parathaa:
mWrite"              PARATHA                 "
mov eax,quantity[esi]
call writedec
mov ebx,40
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp loop_exit

roti:
mWrite"              TANDOORI ROTI           "
mov eax,quantity[esi]
call writedec
mov ebx,20
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp loop_exit

ommelete:
mWrite"              OMELETTE                "
mov eax,quantity[esi]
call writedec
mov ebx,40
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

teaa:
mWrite"              TEA                     "
mov eax,quantity[esi]
call writedec
mov ebx,40
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

dalfry:
mWrite"              DAL FRY                 "
mov eax,quantity[esi]
call writedec
mov ebx,150
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

biryani:
mWrite"              CHICKEN BIRYANI         "
mov eax,quantity[esi]
call writedec
mov ebx,200
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

anda:
mWrite"              ANDA GOTALA             "
mov eax,quantity[esi]
call writedec
mov ebx,150
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

vege:
mWrite"              MIX VEGETABLE           "
mov eax,quantity[esi]
call writedec
mov ebx,180
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

chickenn:
mWrite"              CHICKEN                 "
mov eax,quantity[esi]
call writedec
mov ebx,800
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

korma:
mWrite"              Qorma                   "
mov eax,quantity[esi]
call writedec
mov ebx,200
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

chana:
mWrite"              DAL CHANNA              "
mov eax,quantity[esi]
call writedec
mov ebx,150
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

karahi:
mWrite"              CHICKEN KARAHI          "
mov eax,quantity[esi]
call writedec
mov ebx,650
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

soup:
mWrite"              CHICKEN SOUP            "
mov eax,quantity[esi]
call writedec
mov ebx,400
mul ebx
mWrite"                     "
call writedec
add esi,4
jmp Loop_exit

handi:
mWrite"              CHICKEN HANDI           "
mov eax,quantity[esi]
call writedec
mov ebx,1000
mul ebx
mWrite"                     "
call writedec
add esi,4
loop_exit:
ret
slip endp
end main