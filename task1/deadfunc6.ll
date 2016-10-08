; ModuleID = 'deadfunc6.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"h is : %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @called(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !16), !dbg !17
  store i32 %b, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !18), !dbg !17
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !19), !dbg !20
  %3 = load i32* %1, align 4, !dbg !20
  %4 = load i32* %2, align 4, !dbg !20
  %5 = add nsw i32 %3, %4, !dbg !20
  store i32 %5, i32* %n, align 4, !dbg !20
  %6 = load i32* %n, align 4, !dbg !21
  ret i32 %6, !dbg !21
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @notCalled(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !22), !dbg !23
  store i32 %y, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !24), !dbg !23
  call void @llvm.dbg.declare(metadata !{i32* %m}, metadata !25), !dbg !26
  %3 = load i32* %1, align 4, !dbg !26
  %4 = load i32* %2, align 4, !dbg !26
  %5 = sub nsw i32 %3, %4, !dbg !26
  store i32 %5, i32* %m, align 4, !dbg !26
  %6 = load i32* %m, align 4, !dbg !27
  ret i32 %6, !dbg !27
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca i32, align 4
  %h = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !28), !dbg !29
  store i32 0, i32* %j, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !30), !dbg !31
  store i32 99, i32* %l, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata !{i32* %h}, metadata !32), !dbg !33
  %2 = load i32* %j, align 4, !dbg !33
  %3 = load i32* %l, align 4, !dbg !33
  %4 = call i32 @called(i32 %2, i32 %3), !dbg !33
  store i32 %4, i32* %h, align 4, !dbg !33
  %5 = load i32* %h, align 4, !dbg !34
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %5), !dbg !34
  ret i32 0, !dbg !35
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14}
!llvm.ident = !{!15}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/student/deadfunc6.c] [DW_LANG_C99]
!1 = metadata !{metadata !"deadfunc6.c", metadata !"/home/student"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9, metadata !10}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"called", metadata !"called", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @called, null, null, metadata !2, i32 3} ; [ DW_TAG_subprogram ] [line 3] [def] [called]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/student/deadfunc6.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"notCalled", metadata !"notCalled", metadata !"", i32 8, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @notCalled, null, null, metadata !2, i32 8} ; [ DW_TAG_subprogram ] [line 8] [def] [notCalled]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 13, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [main]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !8}
!13 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!14 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!15 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!16 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777219, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 3]
!17 = metadata !{i32 3, i32 0, metadata !4, null}
!18 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 33554435, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 3]
!19 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 4, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 4]
!20 = metadata !{i32 4, i32 0, metadata !4, null}
!21 = metadata !{i32 5, i32 0, metadata !4, null}
!22 = metadata !{i32 786689, metadata !9, metadata !"x", metadata !5, i32 16777224, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 8]
!23 = metadata !{i32 8, i32 0, metadata !9, null} ; [ DW_TAG_imported_declaration ]
!24 = metadata !{i32 786689, metadata !9, metadata !"y", metadata !5, i32 33554440, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 8]
!25 = metadata !{i32 786688, metadata !9, metadata !"m", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 9]
!26 = metadata !{i32 9, i32 0, metadata !9, null}
!27 = metadata !{i32 10, i32 0, metadata !9, null}
!28 = metadata !{i32 786688, metadata !10, metadata !"j", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 14]
!29 = metadata !{i32 14, i32 0, metadata !10, null}
!30 = metadata !{i32 786688, metadata !10, metadata !"l", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 15]
!31 = metadata !{i32 15, i32 0, metadata !10, null}
!32 = metadata !{i32 786688, metadata !10, metadata !"h", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h] [line 16]
!33 = metadata !{i32 16, i32 0, metadata !10, null}
!34 = metadata !{i32 17, i32 0, metadata !10, null}
!35 = metadata !{i32 18, i32 0, metadata !10, null}
