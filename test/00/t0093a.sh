#!/bin/sh
#
#       srecord - manipulate eprom load files
#       Copyright (C) 2004, 2006-2008 Peter Miller
#       Copyright (C) 2014 Scott Finneran
#
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 3 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program. If not, see
#       <http://www.gnu.org/licenses/>.
#

TEST_SUBJECT="AOMF format"
. test_prelude

cat > test.in.srec << 'fubar'
S0220000687474703A2F2F737265636F72642E736F75726365666F7267652E6E65742F1D
S1230000020C00085352454354455354FF007E100B000008535245435445535470123A0090
S1230020010040F00F00094352435F53544152540040F20F00074352435F4C454E0040F41C
S12300400F000543524331360040BC00000B43524331365F5441424C45B4120C000000006A
S12300607F0000044D41494E3A100D00020A43524331365F464153540B065200003100AA67
S123008082AB83AC08AD09AE0AAF0B8E008F011EBEFF011FE84960308B0079008C828D83D4
S12300A0E493F9A3AC82AD83E96825E0F5F09000BC5002058393F8E5F00493F98A037A0073
S12300C0E86202E9620380C38A828B832263121B000300310030000035003200004A00342A
S12300E000007A003600007E00370025100D00050A43524331365F46415354081007000259
S1230100044D41494EBE064100007F00900FF0E493FA740193FB8A088B09900FF2E493F508
S12301200A740193F50B900000120031AA82AB83900FF4E493FC740193FDEAB50406EBB528
S12301400502800280FE80FE22DA120B00000042FF00000353554DAA12200003007F00392D
S123016000007F003D0000A3003F0000B700410000B700440000BB00450082100700050448
S12301804D41494EBB100B00030853524543544553546D101200000F4F544845525F5344D2
S12301A043435F53545546300635000000000202C032FFFFFFFFFFFFFF32FFFFFFFFFFFF8E
S12301C0FF32FFFFFFFFFFFFFF32FFFFFFFFFFFFFF32FFFFFFFFFFFFFF3212007F80FEE971
S12301E006500200BC0000002110422063308440A550C660E770088129914AA16BB18CC1F4
S1230200ADD1CEE1EFF13112100273325222B5529442F772D662399318837BB35AA3BDD3BF
S12302209CC3FFF3DEE36224433420040114E664C774A44485546AA54BB528850995EEE5FF
S1230240CFF5ACC58DD55336722611163006D776F6669556B4465BB77AA719973887DFF77F
S1230260FEE79DD7BCC7C448E5588668A7784008611802282338CCC9EDD98EE9AFF94889B7
S123028069990AA92BB9F55AD44AB77A966A711A500A333A122AFDDBDCCBBFFB9EEB799BBF
S12302A0588B3BBB1AABA66C877CE44CC55C222C033C600C411CAEED8FFDECCDCDDD2AAD7F
S12302C00BBD688D499D977EB66ED55EF44E133E322E511E700E9FFFBEEFDDDFFCCF1BBF7F
S12302E03AAF599F788F8891A981CAB1EBA10CD12DC14EF16FE18010A100C230E3200450F4
S1230300254046706760B9839893FBA3DAB33DC31CD37FE35EF3B1029012F322D2323542DE
S1230320145277625672EAB5CBA5A89589856EF54FE52CD50DC5E234C324A01481046674DE
S1230340476424540544DBA7FAB79987B8975FE77EF71DC73CD7D326F2369106B01657669E
S12303607676154634564CD96DC90EF92FE9C899E9898AB9ABA94458654806782768C01896
S1230380E1088238A3287DCB5CDB3FEB1EFBF98BD89BBBAB9ABB754A545A376A167AF10ADE
S12303A0D01AB32A923A2EFD0FED6CDD4DCDAABD8BADE89DC98D267C076C645C454CA23C5E
S12303C0832CE01CC10C1FEF3EFF5DCF7CDF9BAFBABFD98FF89F176E367E554E745E932E9E
S12303E0B23ED10EF01E7582002275810B1202BCE582600302002C7900E94400601B7A009F
S1230400900308780075A000E493F2A308B8000205A0D9F4DAF275A0FF7800E84400600C80
S12304207900900000E4F0A3D8FCD9FAF6D8FD02002CF7101200030F4F544845525F5344F5
S11C044043435F535455462D040E0008535245435445535400000F006A4B
S5030023D9
S9030000FC
fubar
if test $? -ne 0; then no_result; fi

srec_cat test.in.srec -o test.in -bin
if test $? -ne 0; then no_result; fi

cat > test.ok << 'fubar'
S00B0000535245435445535487
S12300000202C032FFFFFFFFFFFFFF32FFFFFFFFFFFFFF32FFFFFFFFFFFFFF32FFFFFFFF69
S1230020FFFFFF32FFFFFFFFFFFFFF3212007F80FEAA82AB83AC08AD09AE0AAF0B8E008F00
S1230040011EBEFF011FE84960308B0079008C828D83E493F9A3AC82AD83E96825E0F5F011
S12300609000BC5002058393F8E5F00493F98A037A00E86202E9620380C38A828B832290B6
S12300800FF0E493FA740193FB8A088B09900FF2E493F50A740193F50B900000120031AA37
S12300A082AB83900FF4E493FC740193FDEAB50406EBB50502800280FE80FE220000211060
S12300C0422063308440A550C660E770088129914AA16BB18CC1ADD1CEE1EFF131121002F8
S12300E073325222B5529442F772D662399318837BB35AA3BDD39CC3FFF3DEE36224433434
S123010020040114E664C774A44485546AA54BB528850995EEE5CFF5ACC58DD55336722677
S123012011163006D776F6669556B4465BB77AA719973887DFF7FEE79DD7BCC7C448E55833
S12301408668A7784008611802282338CCC9EDD98EE9AFF9488969990AA92BB9F55AD44AF7
S1230160B77A966A711A500A333A122AFDDBDCCBBFFB9EEB799B588B3BBB1AABA66C877C33
S1230180E44CC55C222C033C600C411CAEED8FFDECCDCDDD2AAD0BBD688D499D977EB66E77
S12301A0D55EF44E133E322E511E700E9FFFBEEFDDDFFCCF1BBF3AAF599F788F8891A98151
S12301C0CAB1EBA10CD12DC14EF16FE18010A100C230E3200450254046706760B9839893F7
S12301E0FBA3DAB33DC31CD37FE35EF3B1029012F322D2323542145277625672EAB5CBA533
S1230200A89589856EF54FE52CD50DC5E234C324A01481046674476424540544DBA7FAB776
S12302209987B8975FE77EF71DC73CD7D326F2369106B01657667676154634564CD96DC932
S12302400EF92FE9C899E9898AB9ABA94458654806782768C018E1088238A3287DCB5CDBF6
S12302603FEB1EFBF98BD89BBBAB9ABB754A545A376A167AF10AD01AB32A923A2EFD0FED32
S12302806CDD4DCDAABD8BADE89DC98D267C076C645C454CA23C832CE01CC10C1FEF3EFF76
S12302A05DCF7CDF9BAFBABFD98FF89F176E367E554E745E932EB23ED10EF01E758200228C
S12302C075810B1202BCE582600302002C7900E94400601B7A00900308780075A000E49317
S12302E0F2A308B8000205A0D9F4DAF275A0FF7800E84400600C7900900000E4F0A3D8FCED
S10B0300D9FAF6D8FD02002C25
S5030019E3
fubar
if test $? -ne 0; then no_result; fi

srec_cat -dsw test.in -aomf -o test.out
if test $? -ne 0; then fail; fi

diff test.ok test.out
if test $? -ne 0; then fail; fi

#
# The things tested here, worked.
# No other guarantees are made.
#
pass

# vim: set ts=8 sw=4 et :
