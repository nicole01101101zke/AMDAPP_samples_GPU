; ModuleID = '../AMDAPP_samples/cl/StringSearch/StringSearch_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/StringSearch/StringSearch_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@StringSearchNaive.groupSuccessCounter = internal global i32 undef, align 4
@StringSearchLoadBalance.stack1Counter = internal global i32 undef, align 4
@StringSearchLoadBalance.groupSuccessCounter = internal global i32 undef, align 4

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @compare(i8* nocapture readonly %0, i8* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %23, label %5

5:                                                ; preds = %3
  %6 = zext i32 %2 to i64
  br label %9

7:                                                ; preds = %9
  %8 = icmp eq i64 %22, %6
  br i1 %8, label %23, label %9

9:                                                ; preds = %7, %5
  %10 = phi i64 [ 0, %5 ], [ %22, %7 ]
  %11 = getelementptr inbounds i8, i8* %0, i64 %10
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = zext i8 %12 to i32
  %14 = add i8 %12, -65
  %15 = icmp ult i8 %14, 26
  %16 = add nuw nsw i32 %13, 32
  %17 = select i1 %15, i32 %16, i32 %13
  %18 = getelementptr inbounds i8, i8* %1, i64 %10
  %19 = load i8, i8* %18, align 1, !tbaa !3
  %20 = zext i8 %19 to i32
  %21 = icmp eq i32 %17, %20
  %22 = add nuw nsw i64 %10, 1
  br i1 %21, label %7, label %23

23:                                               ; preds = %9, %7, %3
  %24 = phi i32 [ 1, %3 ], [ 1, %7 ], [ 0, %9 ]
  ret i32 %24
}

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @StringSearchNaive(i8* nocapture readonly %0, i32 %1, i8* nocapture readonly %2, i32 %3, i32* nocapture %4, i32* nocapture %5, i32 %6, i8* nocapture %7) local_unnamed_addr #1 !kernel_arg_addr_space !6 !kernel_arg_access_qual !7 !kernel_arg_type !8 !kernel_arg_base_type !8 !kernel_arg_type_qual !9 {
  %9 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %10 = trunc i64 %9 to i32
  %11 = tail call i64 @_Z14get_local_sizej(i32 0) #4
  %12 = trunc i64 %11 to i32
  %13 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %14 = trunc i64 %13 to i32
  %15 = sub i32 %1, %3
  %16 = add i32 %15, 1
  %17 = mul i32 %14, %6
  %18 = add i32 %17, %6
  %19 = icmp ugt i32 %17, %16
  br i1 %19, label %84, label %20

20:                                               ; preds = %8
  %21 = icmp ugt i32 %18, %16
  %22 = select i1 %21, i32 %16, i32 %18
  %23 = icmp ult i32 %10, %3
  br i1 %23, label %24, label %29

24:                                               ; preds = %20
  %25 = shl i64 %9, 32
  %26 = ashr exact i64 %25, 32
  %27 = shl i64 %11, 32
  %28 = ashr exact i64 %27, 32
  br label %31

29:                                               ; preds = %31, %20
  %30 = icmp eq i32 %10, 0
  br i1 %30, label %43, label %44

31:                                               ; preds = %24, %31
  %32 = phi i64 [ %26, %24 ], [ %40, %31 ]
  %33 = getelementptr inbounds i8, i8* %2, i64 %32
  %34 = load i8, i8* %33, align 1, !tbaa !3
  %35 = add i8 %34, -65
  %36 = icmp ult i8 %35, 26
  %37 = add nuw nsw i8 %34, 32
  %38 = select i1 %36, i8 %37, i8 %34
  %39 = getelementptr inbounds i8, i8* %7, i64 %32
  store i8 %38, i8* %39, align 1, !tbaa !3
  %40 = add i64 %32, %28
  %41 = trunc i64 %40 to i32
  %42 = icmp ult i32 %41, %3
  br i1 %42, label %31, label %29

43:                                               ; preds = %29
  store volatile i32 0, i32* @StringSearchNaive.groupSuccessCounter, align 4, !tbaa !10
  br label %44

44:                                               ; preds = %43, %29
  tail call void @_Z7barrierj(i32 1) #5
  %45 = add i32 %17, %10
  %46 = icmp ult i32 %45, %22
  br i1 %46, label %47, label %50

47:                                               ; preds = %44
  %48 = icmp eq i32 %3, 0
  %49 = zext i32 %3 to i64
  br label %51

50:                                               ; preds = %76, %44
  tail call void @_Z7barrierj(i32 1) #5
  br i1 %30, label %79, label %84

51:                                               ; preds = %47, %76
  %52 = phi i32 [ %45, %47 ], [ %77, %76 ]
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %0, i64 %53
  br i1 %48, label %71, label %57

55:                                               ; preds = %57
  %56 = icmp eq i64 %70, %49
  br i1 %56, label %71, label %57

57:                                               ; preds = %51, %55
  %58 = phi i64 [ %70, %55 ], [ 0, %51 ]
  %59 = getelementptr inbounds i8, i8* %54, i64 %58
  %60 = load i8, i8* %59, align 1, !tbaa !3
  %61 = zext i8 %60 to i32
  %62 = add i8 %60, -65
  %63 = icmp ult i8 %62, 26
  %64 = add nuw nsw i32 %61, 32
  %65 = select i1 %63, i32 %64, i32 %61
  %66 = getelementptr inbounds i8, i8* %7, i64 %58
  %67 = load i8, i8* %66, align 1, !tbaa !3
  %68 = zext i8 %67 to i32
  %69 = icmp eq i32 %65, %68
  %70 = add nuw nsw i64 %58, 1
  br i1 %69, label %55, label %76

71:                                               ; preds = %55, %51
  %72 = tail call i32 @_Z10atomic_incPU7CLlocalVj(i32* nonnull @StringSearchNaive.groupSuccessCounter) #5
  %73 = add i32 %72, %17
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32* %4, i64 %74
  store i32 %52, i32* %75, align 4, !tbaa !10
  br label %76

76:                                               ; preds = %57, %71
  %77 = add i32 %52, %12
  %78 = icmp ult i32 %77, %22
  br i1 %78, label %51, label %50

79:                                               ; preds = %50
  %80 = load volatile i32, i32* @StringSearchNaive.groupSuccessCounter, align 4, !tbaa !10
  %81 = shl i64 %13, 32
  %82 = ashr exact i64 %81, 32
  %83 = getelementptr inbounds i32, i32* %5, i64 %82
  store i32 %80, i32* %83, align 4, !tbaa !10
  br label %84

84:                                               ; preds = %50, %79, %8
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #3

; Function Attrs: convergent
declare dso_local i32 @_Z10atomic_incPU7CLlocalVj(i32*) local_unnamed_addr #3

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @StringSearchLoadBalance(i8* nocapture readonly %0, i32 %1, i8* nocapture readonly %2, i32 %3, i32* nocapture %4, i32* nocapture %5, i32 %6, i8* nocapture %7, i32* nocapture %8) local_unnamed_addr #1 !kernel_arg_addr_space !12 !kernel_arg_access_qual !13 !kernel_arg_type !14 !kernel_arg_base_type !14 !kernel_arg_type_qual !15 {
  %10 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %11 = trunc i64 %10 to i32
  %12 = tail call i64 @_Z14get_local_sizej(i32 0) #4
  %13 = trunc i64 %12 to i32
  %14 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %15 = trunc i64 %14 to i32
  %16 = icmp eq i32 %11, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %9
  store i32 0, i32* @StringSearchLoadBalance.groupSuccessCounter, align 4, !tbaa !10
  store i32 0, i32* @StringSearchLoadBalance.stack1Counter, align 4, !tbaa !10
  br label %18

18:                                               ; preds = %17, %9
  %19 = sub i32 %1, %3
  %20 = add i32 %19, 1
  %21 = mul i32 %15, %6
  %22 = add i32 %21, %6
  %23 = icmp ugt i32 %21, %20
  br i1 %23, label %137, label %24

24:                                               ; preds = %18
  %25 = icmp ugt i32 %22, %20
  %26 = select i1 %25, i32 %20, i32 %22
  %27 = sub i32 %26, %21
  %28 = icmp ult i32 %11, %3
  br i1 %28, label %42, label %29

29:                                               ; preds = %42, %24
  tail call void @_Z7barrierj(i32 1) #5
  %30 = load i8, i8* %7, align 1, !tbaa !3
  %31 = getelementptr inbounds i8, i8* %7, i64 1
  %32 = load i8, i8* %31, align 1, !tbaa !3
  %33 = zext i8 %30 to i32
  %34 = zext i8 %32 to i32
  %35 = zext i32 %21 to i64
  %36 = getelementptr inbounds i8, i8* %0, i64 2
  %37 = getelementptr inbounds i8, i8* %36, i64 %35
  %38 = getelementptr inbounds i8, i8* %7, i64 2
  %39 = add i32 %3, -2
  %40 = icmp eq i32 %39, 0
  %41 = zext i32 %39 to i64
  br label %54

42:                                               ; preds = %24, %42
  %43 = phi i32 [ %52, %42 ], [ %11, %24 ]
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8* %2, i64 %44
  %46 = load i8, i8* %45, align 1, !tbaa !3
  %47 = add i8 %46, -65
  %48 = icmp ult i8 %47, 26
  %49 = add nuw nsw i8 %46, 32
  %50 = select i1 %48, i8 %49, i8 %46
  %51 = getelementptr inbounds i8, i8* %7, i64 %44
  store i8 %50, i8* %51, align 1, !tbaa !3
  %52 = add i32 %43, %13
  %53 = icmp ult i32 %52, %3
  br i1 %53, label %42, label %29

54:                                               ; preds = %91, %29
  %55 = phi i32 [ %11, %29 ], [ %84, %91 ]
  %56 = icmp ult i32 %55, %27
  br i1 %56, label %57, label %83

57:                                               ; preds = %54
  %58 = add i32 %55, %21
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8* %0, i64 %59
  %61 = load i8, i8* %60, align 1, !tbaa !3
  %62 = zext i8 %61 to i32
  %63 = add i8 %61, -65
  %64 = icmp ult i8 %63, 26
  %65 = add nuw nsw i32 %62, 32
  %66 = select i1 %64, i32 %65, i32 %62
  %67 = icmp eq i32 %66, %33
  br i1 %67, label %68, label %83

68:                                               ; preds = %57
  %69 = add i32 %58, 1
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %0, i64 %70
  %72 = load i8, i8* %71, align 1, !tbaa !3
  %73 = zext i8 %72 to i32
  %74 = add i8 %72, -65
  %75 = icmp ult i8 %74, 26
  %76 = add nuw nsw i32 %73, 32
  %77 = select i1 %75, i32 %76, i32 %73
  %78 = icmp eq i32 %77, %34
  br i1 %78, label %79, label %83

79:                                               ; preds = %68
  %80 = tail call i32 @_Z10atomic_incPU7CLlocalVj(i32* nonnull @StringSearchLoadBalance.stack1Counter) #5
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32* %8, i64 %81
  store i32 %55, i32* %82, align 4, !tbaa !10
  br label %83

83:                                               ; preds = %57, %68, %79, %54
  %84 = add nsw i32 %55, %13
  tail call void @_Z7barrierj(i32 1) #5
  %85 = load i32, i32* @StringSearchLoadBalance.stack1Counter, align 4, !tbaa !10
  tail call void @_Z7barrierj(i32 1) #5
  %86 = icmp ult i32 %85, %13
  br i1 %86, label %87, label %92

87:                                               ; preds = %83
  %88 = srem i32 %84, %13
  %89 = sub i32 %84, %88
  %90 = icmp ult i32 %89, %27
  br i1 %90, label %91, label %92

91:                                               ; preds = %87, %124
  br label %54

92:                                               ; preds = %87, %83
  %93 = icmp ugt i32 %85, %11
  br i1 %93, label %94, label %124

94:                                               ; preds = %92
  %95 = tail call i32 @_Z10atomic_decPU7CLlocalVj(i32* nonnull @StringSearchLoadBalance.stack1Counter) #5
  %96 = add nsw i32 %95, -1
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32* %8, i64 %97
  %99 = load i32, i32* %98, align 4, !tbaa !10
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8* %37, i64 %100
  br i1 %40, label %118, label %104

102:                                              ; preds = %104
  %103 = icmp eq i64 %117, %41
  br i1 %103, label %118, label %104

104:                                              ; preds = %94, %102
  %105 = phi i64 [ %117, %102 ], [ 0, %94 ]
  %106 = getelementptr inbounds i8, i8* %101, i64 %105
  %107 = load i8, i8* %106, align 1, !tbaa !3
  %108 = zext i8 %107 to i32
  %109 = add i8 %107, -65
  %110 = icmp ult i8 %109, 26
  %111 = add nuw nsw i32 %108, 32
  %112 = select i1 %110, i32 %111, i32 %108
  %113 = getelementptr inbounds i8, i8* %38, i64 %105
  %114 = load i8, i8* %113, align 1, !tbaa !3
  %115 = zext i8 %114 to i32
  %116 = icmp eq i32 %112, %115
  %117 = add nuw nsw i64 %105, 1
  br i1 %116, label %102, label %124

118:                                              ; preds = %102, %94
  %119 = tail call i32 @_Z10atomic_incPU7CLlocalVj(i32* nonnull @StringSearchLoadBalance.groupSuccessCounter) #5
  %120 = add i32 %99, %21
  %121 = add i32 %119, %21
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32* %4, i64 %122
  store i32 %120, i32* %123, align 4, !tbaa !10
  br label %124

124:                                              ; preds = %104, %118, %92
  tail call void @_Z7barrierj(i32 1) #5
  %125 = srem i32 %84, %13
  %126 = sub i32 %84, %125
  %127 = icmp uge i32 %126, %27
  %128 = load i32, i32* @StringSearchLoadBalance.stack1Counter, align 4
  %129 = icmp eq i32 %128, 0
  %130 = and i1 %127, %129
  br i1 %130, label %131, label %91

131:                                              ; preds = %124
  br i1 %16, label %132, label %137

132:                                              ; preds = %131
  %133 = load i32, i32* @StringSearchLoadBalance.groupSuccessCounter, align 4, !tbaa !10
  %134 = shl i64 %14, 32
  %135 = ashr exact i64 %134, 32
  %136 = getelementptr inbounds i32, i32* %5, i64 %135
  store i32 %133, i32* %136, align 4, !tbaa !10
  br label %137

137:                                              ; preds = %131, %132, %18
  ret void
}

; Function Attrs: convergent
declare dso_local i32 @_Z10atomic_decPU7CLlocalVj(i32*) local_unnamed_addr #3

attributes #0 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind readnone }
attributes #5 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i32 1, i32 0, i32 1, i32 0, i32 1, i32 1, i32 0, i32 3}
!7 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!8 = !{!"uchar*", !"uint", !"uchar*", !"uint", !"int*", !"int*", !"uint", !"uchar*"}
!9 = !{!"", !"", !"const", !"", !"", !"", !"", !""}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !4, i64 0}
!12 = !{i32 1, i32 0, i32 1, i32 0, i32 1, i32 1, i32 0, i32 3, i32 3}
!13 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!14 = !{!"uchar*", !"uint", !"uchar*", !"uint", !"int*", !"int*", !"uint", !"uchar*", !"int*"}
!15 = !{!"", !"", !"const", !"", !"", !"", !"", !"", !""}
