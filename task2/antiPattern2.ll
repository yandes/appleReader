; ModuleID = 'antiPattern2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: nounwind uwtable
define i8* @init_array() #0 {
  %array = alloca [10 x i8], align 1
  %p = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata !{[10 x i8]* %array}, metadata !18), !dbg !22
  call void @llvm.dbg.declare(metadata !{i8** %p}, metadata !23), !dbg !24
  %1 = getelementptr inbounds [10 x i8]* %array, i32 0, i32 0, !dbg !24
  store i8* %1, i8** %p, align 8, !dbg !24
  %2 = load i8** %p, align 8, !dbg !25
  ret i8* %2, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i8* @escape_local() #0 {
  %local_char = alloca i8, align 1
  %p = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata !{i8* %local_char}, metadata !26), !dbg !27
  store i8 97, i8* %local_char, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata !{i8** %p}, metadata !28), !dbg !29
  store i8* %local_char, i8** %p, align 8, !dbg !29
  %1 = load i8** %p, align 8, !dbg !30
  ret i8* %1, !dbg !30
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i8*, align 8
  %b = alloca i8*, align 8
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i8** %a}, metadata !31), !dbg !32
  %2 = call i8* @init_array(), !dbg !32
  store i8* %2, i8** %a, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata !{i8** %b}, metadata !33), !dbg !34
  %3 = call i8* @escape_local(), !dbg !34
  store i8* %3, i8** %b, align 8, !dbg !34
  %4 = load i8** %a, align 8, !dbg !35
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i8* %4), !dbg !35
  %6 = load i8** %b, align 8, !dbg !36
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i8* %6), !dbg !36
  ret i32 0, !dbg !37
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/student/antiPattern2.c] [DW_LANG_C99]
!1 = metadata !{metadata !"antiPattern2.c", metadata !"/home/student"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !10, metadata !11}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"init_array", metadata !"init_array", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* ()* @init_array, null, null, metadata !2, i32 3} ; [ DW_TAG_subprogram ] [line 3] [def] [init_array]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/student/antiPattern2.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!9 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"escape_local", metadata !"escape_local", metadata !"", i32 9, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i8* ()* @escape_local, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [line 9] [def] [escape_local]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 15, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 15] [def] [main]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!18 = metadata !{i32 786688, metadata !4, metadata !"array", metadata !5, i32 4, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [array] [line 4]
!19 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 80, i64 8, i32 0, i32 0, metadata !9, metadata !20, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 80, align 8, offset 0] [from char]
!20 = metadata !{metadata !21}
!21 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ] [0, 9]
!22 = metadata !{i32 4, i32 0, metadata !4, null}
!23 = metadata !{i32 786688, metadata !4, metadata !"p", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 5]
!24 = metadata !{i32 5, i32 0, metadata !4, null}
!25 = metadata !{i32 6, i32 0, metadata !4, null}
!26 = metadata !{i32 786688, metadata !10, metadata !"local_char", metadata !5, i32 10, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [local_char] [line 10]
!27 = metadata !{i32 10, i32 0, metadata !10, null}
!28 = metadata !{i32 786688, metadata !10, metadata !"p", metadata !5, i32 11, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 11]
!29 = metadata !{i32 11, i32 0, metadata !10, null}
!30 = metadata !{i32 12, i32 0, metadata !10, null}
!31 = metadata !{i32 786688, metadata !11, metadata !"a", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 16]
!32 = metadata !{i32 16, i32 0, metadata !11, null}
!33 = metadata !{i32 786688, metadata !11, metadata !"b", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 17]
!34 = metadata !{i32 17, i32 0, metadata !11, null}
!35 = metadata !{i32 18, i32 0, metadata !11, null}
!36 = metadata !{i32 19, i32 0, metadata !11, null}
!37 = metadata !{i32 20, i32 0, metadata !11, null}
