; ModuleID = '../AMDAPP_samples/cl/ScanLargeArrays/ScanLargeArrays_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/ScanLargeArrays/ScanLargeArrays_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@blockAddition.value.0 = internal unnamed_addr global float undef, align 4

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @blockAddition(float* nocapture readonly %0, float* nocapture %1) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %3 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %4 = tail call i64 @_Z12get_group_idj(i32 0) #3
  %5 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %14

8:                                                ; preds = %2
  %9 = shl i64 %4, 32
  %10 = ashr exact i64 %9, 32
  %11 = getelementptr inbounds float, float* %0, i64 %10
  %12 = bitcast float* %11 to i32*
  %13 = load i32, i32* %12, align 4, !tbaa !7
  store i32 %13, i32* bitcast (float* @blockAddition.value.0 to i32*), align 4, !tbaa !7
  br label %14

14:                                               ; preds = %8, %2
  tail call void @_Z7barrierj(i32 1) #4
  %15 = load float, float* @blockAddition.value.0, align 4, !tbaa !7
  %16 = shl i64 %3, 32
  %17 = ashr exact i64 %16, 32
  %18 = getelementptr inbounds float, float* %1, i64 %17
  %19 = load float, float* %18, align 4, !tbaa !7
  %20 = fadd float %15, %19
  store float %20, float* %18, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @ScanLargeArrays(float* nocapture %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, float* nocapture %4) local_unnamed_addr #0 !kernel_arg_addr_space !11 !kernel_arg_access_qual !12 !kernel_arg_type !13 !kernel_arg_base_type !13 !kernel_arg_type_qual !14 {
  %6 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z12get_group_idj(i32 0) #3
  %11 = shl nsw i32 %9, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float* %1, i64 %12
  %14 = bitcast float* %13 to i32*
  %15 = load i32, i32* %14, align 4, !tbaa !7
  %16 = shl nsw i32 %7, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float* %2, i64 %17
  %19 = bitcast float* %18 to i32*
  store i32 %15, i32* %19, align 4, !tbaa !7
  %20 = or i32 %11, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float* %1, i64 %21
  %23 = bitcast float* %22 to i32*
  %24 = load i32, i32* %23, align 4, !tbaa !7
  %25 = or i32 %16, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float* %2, i64 %26
  %28 = bitcast float* %27 to i32*
  store i32 %24, i32* %28, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 1) #4
  %29 = load float, float* %2, align 4, !tbaa !7
  %30 = icmp ugt i32 %3, 1
  br i1 %30, label %31, label %35

31:                                               ; preds = %5
  %32 = getelementptr inbounds float, float* %2, i64 1
  %33 = load float, float* %32, align 4, !tbaa !7
  %34 = fadd float %29, %33
  br label %46

35:                                               ; preds = %64, %5
  %36 = add i32 %3, -1
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float* %2, i64 %37
  %39 = bitcast float* %38 to i32*
  %40 = load i32, i32* %39, align 4, !tbaa !7
  %41 = shl i64 %10, 32
  %42 = ashr exact i64 %41, 32
  %43 = getelementptr inbounds float, float* %4, i64 %42
  %44 = bitcast float* %43 to i32*
  store i32 %40, i32* %44, align 4, !tbaa !7
  %45 = icmp eq i32 %7, 0
  br i1 %45, label %69, label %71

46:                                               ; preds = %31, %64
  %47 = phi i32 [ %67, %64 ], [ 1, %31 ]
  %48 = phi float [ %66, %64 ], [ %34, %31 ]
  %49 = phi float [ %65, %64 ], [ %29, %31 ]
  %50 = icmp slt i32 %16, %47
  br i1 %50, label %64, label %51

51:                                               ; preds = %46
  %52 = sub nsw i32 %16, %47
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float* %2, i64 %53
  %55 = load float, float* %54, align 4, !tbaa !7
  %56 = load float, float* %18, align 4, !tbaa !7
  %57 = fadd float %55, %56
  %58 = sub nsw i32 %25, %47
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float* %2, i64 %59
  %61 = load float, float* %60, align 4, !tbaa !7
  %62 = load float, float* %27, align 4, !tbaa !7
  %63 = fadd float %61, %62
  br label %64

64:                                               ; preds = %46, %51
  %65 = phi float [ %57, %51 ], [ %49, %46 ]
  %66 = phi float [ %63, %51 ], [ %48, %46 ]
  tail call void @_Z7barrierj(i32 1) #4
  store float %65, float* %18, align 4, !tbaa !7
  store float %66, float* %27, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 1) #4
  %67 = shl nsw i32 %47, 1
  %68 = icmp ult i32 %67, %3
  br i1 %68, label %46, label %35

69:                                               ; preds = %35
  %70 = getelementptr inbounds float, float* %0, i64 %12
  store float 0.000000e+00, float* %70, align 4, !tbaa !7
  br label %79

71:                                               ; preds = %35
  %72 = add nsw i32 %16, -1
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float* %2, i64 %73
  %75 = bitcast float* %74 to i32*
  %76 = load i32, i32* %75, align 4, !tbaa !7
  %77 = getelementptr inbounds float, float* %0, i64 %12
  %78 = bitcast float* %77 to i32*
  store i32 %76, i32* %78, align 4, !tbaa !7
  br label %79

79:                                               ; preds = %71, %69
  %80 = load i32, i32* %19, align 4, !tbaa !7
  %81 = getelementptr inbounds float, float* %0, i64 %21
  %82 = bitcast float* %81 to i32*
  store i32 %80, i32* %82, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @prefixSum(float* nocapture %0, float* nocapture readonly %1, float* nocapture %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !15 !kernel_arg_access_qual !16 !kernel_arg_type !17 !kernel_arg_base_type !17 !kernel_arg_type_qual !18 {
  %5 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = shl nsw i32 %8, 1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds float, float* %1, i64 %10
  %12 = bitcast float* %11 to i32*
  %13 = load i32, i32* %12, align 4, !tbaa !7
  %14 = shl nsw i32 %6, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float* %2, i64 %15
  %17 = bitcast float* %16 to i32*
  store i32 %13, i32* %17, align 4, !tbaa !7
  %18 = or i32 %9, 1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %1, i64 %19
  %21 = bitcast float* %20 to i32*
  %22 = load i32, i32* %21, align 4, !tbaa !7
  %23 = or i32 %14, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float* %2, i64 %24
  %26 = bitcast float* %25 to i32*
  store i32 %22, i32* %26, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 1) #4
  %27 = load float, float* %2, align 4, !tbaa !7
  %28 = icmp ugt i32 %3, 1
  br i1 %28, label %29, label %33

29:                                               ; preds = %4
  %30 = getelementptr inbounds float, float* %2, i64 1
  %31 = load float, float* %30, align 4, !tbaa !7
  %32 = fadd float %27, %31
  br label %35

33:                                               ; preds = %53, %4
  %34 = icmp eq i32 %6, 0
  br i1 %34, label %58, label %60

35:                                               ; preds = %29, %53
  %36 = phi i32 [ %56, %53 ], [ 1, %29 ]
  %37 = phi float [ %55, %53 ], [ %32, %29 ]
  %38 = phi float [ %54, %53 ], [ %27, %29 ]
  %39 = icmp slt i32 %14, %36
  br i1 %39, label %53, label %40

40:                                               ; preds = %35
  %41 = sub nsw i32 %14, %36
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float* %2, i64 %42
  %44 = load float, float* %43, align 4, !tbaa !7
  %45 = load float, float* %16, align 4, !tbaa !7
  %46 = fadd float %44, %45
  %47 = sub nsw i32 %23, %36
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float* %2, i64 %48
  %50 = load float, float* %49, align 4, !tbaa !7
  %51 = load float, float* %25, align 4, !tbaa !7
  %52 = fadd float %50, %51
  br label %53

53:                                               ; preds = %35, %40
  %54 = phi float [ %46, %40 ], [ %38, %35 ]
  %55 = phi float [ %52, %40 ], [ %37, %35 ]
  tail call void @_Z7barrierj(i32 1) #4
  store float %54, float* %16, align 4, !tbaa !7
  store float %55, float* %25, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 1) #4
  %56 = shl nsw i32 %36, 1
  %57 = icmp ult i32 %56, %3
  br i1 %57, label %35, label %33

58:                                               ; preds = %33
  %59 = getelementptr inbounds float, float* %0, i64 %10
  store float 0.000000e+00, float* %59, align 4, !tbaa !7
  br label %68

60:                                               ; preds = %33
  %61 = add nsw i32 %14, -1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float* %2, i64 %62
  %64 = bitcast float* %63 to i32*
  %65 = load i32, i32* %64, align 4, !tbaa !7
  %66 = getelementptr inbounds float, float* %0, i64 %10
  %67 = bitcast float* %66 to i32*
  store i32 %65, i32* %67, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %60, %58
  %69 = load i32, i32* %17, align 4, !tbaa !7
  %70 = getelementptr inbounds float, float* %0, i64 %19
  %71 = bitcast float* %70 to i32*
  store i32 %69, i32* %71, align 4, !tbaa !7
  ret void
}

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind readnone }
attributes #4 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1}
!4 = !{!"none", !"none"}
!5 = !{!"float*", !"float*"}
!6 = !{!"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i32 1, i32 1, i32 3, i32 0, i32 1}
!12 = !{!"none", !"none", !"none", !"none", !"none"}
!13 = !{!"float*", !"float*", !"float*", !"uint", !"float*"}
!14 = !{!"", !"", !"", !"", !""}
!15 = !{i32 1, i32 1, i32 3, i32 0}
!16 = !{!"none", !"none", !"none", !"none"}
!17 = !{!"float*", !"float*", !"float*", !"uint"}
!18 = !{!"", !"", !"", !""}
