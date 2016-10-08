; ModuleID = 'deadfunc3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"y is : %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @notCalled() #0 {
  %z = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %z}, metadata !14), !dbg !15
  store i32 6, i32* %z, align 4, !dbg !15
  %1 = load i32* %z, align 4, !dbg !16
  ret i32 %1, !dbg !16
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @called() #0 {
  %x = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %x}, metadata !17), !dbg !18
  store i32 4, i32* %x, align 4, !dbg !18
  %1 = load i32* %x, align 4, !dbg !19
  ret i32 %1, !dbg !19
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %y = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %y}, metadata !20), !dbg !21
  %1 = call i32 @called(), !dbg !21
  store i32 %1, i32* %y, align 4, !dbg !21
  %2 = load i32* %y, align 4, !dbg !22
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %2), !dbg !22
  ret i32 0, !dbg !23
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12}
!llvm.ident = !{!13}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/student/deadfunc3.c] [DW_LANG_C99]
!1 = metadata !{metadata !"deadfunc3.c", metadata !"/home/student"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9, metadata !10}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"notCalled", metadata !"notCalled", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @notCalled, null, null, metadata !2, i32 3} ; [ DW_TAG_subprogram ] [line 3] [def] [notCalled]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/student/deadfunc3.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"called", metadata !"called", metadata !"", i32 8, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @called, null, null, metadata !2, i32 8} ; [ DW_TAG_subprogram ] [line 8] [def] [called]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [main]
!11 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!12 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!13 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!14 = metadata !{i32 786688, metadata !4, metadata !"z", metadata !5, i32 4, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 4]
!15 = metadata !{i32 4, i32 0, metadata !4, null}
!16 = metadata !{i32 5, i32 0, metadata !4, null}
!17 = metadata !{i32 786688, metadata !9, metadata !"x", metadata !5, i32 9, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 9]
!18 = metadata !{i32 9, i32 0, metadata !9, null}
!19 = metadata !{i32 10, i32 0, metadata !9, null}
!20 = metadata !{i32 786688, metadata !10, metadata !"y", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 14]
!21 = metadata !{i32 14, i32 0, metadata !10, null}
!22 = metadata !{i32 15, i32 0, metadata !10, null}
!23 = metadata !{i32 16, i32 0, metadata !10, null}
