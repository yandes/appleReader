; ModuleID = 'deadfunc5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"m is : %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @calledByOtherFunction() #0 {
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !15), !dbg !16
  store i32 12, i32* %j, align 4, !dbg !16
  %1 = load i32* %j, align 4, !dbg !17
  ret i32 %1, !dbg !17
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @called() #0 {
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !18), !dbg !19
  %1 = call i32 @calledByOtherFunction(), !dbg !19
  store i32 %1, i32* %i, align 4, !dbg !19
  %2 = load i32* %i, align 4, !dbg !20
  ret i32 %2, !dbg !20
}

; Function Attrs: nounwind uwtable
define i32 @notCalled() #0 {
  %k = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !21), !dbg !22
  store i32 0, i32* %k, align 4, !dbg !22
  %1 = load i32* %k, align 4, !dbg !23
  ret i32 %1, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %m}, metadata !24), !dbg !25
  %2 = call i32 @called(), !dbg !25
  store i32 %2, i32* %m, align 4, !dbg !25
  %3 = load i32* %m, align 4, !dbg !26
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %3), !dbg !26
  ret i32 0, !dbg !27
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/student/deadfunc5.c] [DW_LANG_C99]
!1 = metadata !{metadata !"deadfunc5.c", metadata !"/home/student"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9, metadata !10, metadata !11}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"calledByOtherFunction", metadata !"calledByOtherFunction", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @calledByOtherFunction, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 4] [def] [calledByOtherFunction]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/student/deadfunc5.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"called", metadata !"called", metadata !"", i32 9, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @called, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [line 9] [def] [called]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"notCalled", metadata !"notCalled", metadata !"", i32 14, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @notCalled, null, null, metadata !2, i32 14} ; [ DW_TAG_subprogram ] [line 14] [def] [notCalled]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 19, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 19] [def] [main]
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!15 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 5]
!16 = metadata !{i32 5, i32 0, metadata !4, null}
!17 = metadata !{i32 6, i32 0, metadata !4, null}
!18 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !5, i32 10, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 10]
!19 = metadata !{i32 10, i32 0, metadata !9, null}
!20 = metadata !{i32 11, i32 0, metadata !9, null}
!21 = metadata !{i32 786688, metadata !10, metadata !"k", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 15]
!22 = metadata !{i32 15, i32 0, metadata !10, null}
!23 = metadata !{i32 16, i32 0, metadata !10, null}
!24 = metadata !{i32 786688, metadata !11, metadata !"m", metadata !5, i32 20, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 20]
!25 = metadata !{i32 20, i32 0, metadata !11, null}
!26 = metadata !{i32 21, i32 0, metadata !11, null}
!27 = metadata !{i32 22, i32 0, metadata !11, null}
