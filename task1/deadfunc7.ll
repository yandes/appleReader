; ModuleID = 'deadfunc7.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"Yay\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @called(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !16), !dbg !17
  store i32 %y, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !18), !dbg !17
  %3 = load i32* %1, align 4, !dbg !19
  %4 = load i32* %2, align 4, !dbg !19
  %5 = add nsw i32 %3, %4, !dbg !19
  ret i32 %5, !dbg !19
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @notCalled(i32 %q, i32 %w) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %q, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !20), !dbg !21
  store i32 %w, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !22), !dbg !21
  %3 = load i32* %1, align 4, !dbg !23
  %4 = load i32* %2, align 4, !dbg !23
  %5 = sub nsw i32 %3, %4, !dbg !23
  ret i32 %5, !dbg !23
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @called(i32 2, i32 3), !dbg !24
  %3 = icmp ne i32 %2, 0, !dbg !24
  br i1 %3, label %4, label %6, !dbg !24

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0)), !dbg !26
  br label %6, !dbg !28

; <label>:6                                       ; preds = %4, %0
  ret i32 0, !dbg !29
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14}
!llvm.ident = !{!15}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/student/deadfunc7.c] [DW_LANG_C99]
!1 = metadata !{metadata !"deadfunc7.c", metadata !"/home/student"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9, metadata !10}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"called", metadata !"called", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @called, null, null, metadata !2, i32 3} ; [ DW_TAG_subprogram ] [line 3] [def] [called]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/student/deadfunc7.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"notCalled", metadata !"notCalled", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @notCalled, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] [line 7] [def] [notCalled]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 11, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 11} ; [ DW_TAG_subprogram ] [line 11] [def] [main]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !8}
!13 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!14 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!15 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!16 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777219, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 3]
!17 = metadata !{i32 3, i32 0, metadata !4, null}
!18 = metadata !{i32 786689, metadata !4, metadata !"y", metadata !5, i32 33554435, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 3]
!19 = metadata !{i32 4, i32 0, metadata !4, null}
!20 = metadata !{i32 786689, metadata !9, metadata !"q", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [q] [line 7]
!21 = metadata !{i32 7, i32 0, metadata !9, null}
!22 = metadata !{i32 786689, metadata !9, metadata !"w", metadata !5, i32 33554439, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 7]
!23 = metadata !{i32 8, i32 0, metadata !9, null} ; [ DW_TAG_imported_declaration ]
!24 = metadata !{i32 12, i32 0, metadata !25, null}
!25 = metadata !{i32 786443, metadata !1, metadata !10, i32 12, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/student/deadfunc7.c]
!26 = metadata !{i32 13, i32 0, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !25, i32 12, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/student/deadfunc7.c]
!28 = metadata !{i32 14, i32 0, metadata !27, null}
!29 = metadata !{i32 15, i32 0, metadata !10, null}
