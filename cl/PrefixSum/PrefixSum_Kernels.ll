; ModuleID = '../AMDAPP_samples/cl/PrefixSum/PrefixSum_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/PrefixSum/PrefixSum_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @group_prefixSum(float* nocapture %0, float* nocapture readonly %1, float* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %6 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z14get_local_sizej(i32 0) #4
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %11 = trunc i64 %10 to i32
  %12 = mul nsw i32 %11, %9
  %13 = add nsw i32 %12, %7
  %14 = shl nsw i32 %13, 1
  %15 = or i32 %14, 1
  %16 = mul i32 %15, %4
  %17 = add i32 %16, -1
  %18 = icmp ult i32 %17, %3
  br i1 %18, label %19, label %28

19:                                               ; preds = %5
  %20 = sext i32 %17 to i64
  %21 = getelementptr inbounds float, float* %1, i64 %20
  %22 = bitcast float* %21 to i32*
  %23 = load i32, i32* %22, align 4, !tbaa !7
  %24 = shl nsw i32 %7, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float* %2, i64 %25
  %27 = bitcast float* %26 to i32*
  store i32 %23, i32* %27, align 4, !tbaa !7
  br label %28

28:                                               ; preds = %19, %5
  %29 = add i32 %17, %4
  %30 = icmp ult i32 %29, %3
  br i1 %30, label %31, label %41

31:                                               ; preds = %28
  %32 = zext i32 %29 to i64
  %33 = getelementptr inbounds float, float* %1, i64 %32
  %34 = bitcast float* %33 to i32*
  %35 = load i32, i32* %34, align 4, !tbaa !7
  %36 = shl nsw i32 %7, 1
  %37 = or i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float* %2, i64 %38
  %40 = bitcast float* %39 to i32*
  store i32 %35, i32* %40, align 4, !tbaa !7
  br label %41

41:                                               ; preds = %31, %28
  %42 = lshr i32 %3, 1
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %48, label %44

44:                                               ; preds = %41
  %45 = shl nsw i32 %7, 1
  %46 = or i32 %45, 1
  %47 = add nsw i32 %45, 2
  br label %57

48:                                               ; preds = %73, %41
  %49 = phi i32 [ 1, %41 ], [ %74, %73 ]
  %50 = icmp ult i32 %49, %3
  %51 = zext i1 %50 to i32
  %52 = shl i32 %49, %51
  %53 = ashr i32 %52, 1
  %54 = icmp sgt i32 %52, 1
  br i1 %54, label %55, label %77

55:                                               ; preds = %48
  %56 = add nsw i32 %7, 1
  br label %78

57:                                               ; preds = %44, %73
  %58 = phi i32 [ %42, %44 ], [ %75, %73 ]
  %59 = phi i32 [ 1, %44 ], [ %74, %73 ]
  tail call void @_Z7barrierj(i32 1) #5
  %60 = icmp sgt i32 %58, %7
  br i1 %60, label %61, label %73

61:                                               ; preds = %57
  %62 = mul nsw i32 %59, %46
  %63 = add nsw i32 %62, -1
  %64 = mul nsw i32 %59, %47
  %65 = add nsw i32 %64, -1
  %66 = sext i32 %63 to i64
  %67 = getelementptr inbounds float, float* %2, i64 %66
  %68 = load float, float* %67, align 4, !tbaa !7
  %69 = sext i32 %65 to i64
  %70 = getelementptr inbounds float, float* %2, i64 %69
  %71 = load float, float* %70, align 4, !tbaa !7
  %72 = fadd float %68, %71
  store float %72, float* %70, align 4, !tbaa !7
  br label %73

73:                                               ; preds = %61, %57
  %74 = shl i32 %59, 1
  %75 = lshr i32 %58, 1
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %48, label %57

77:                                               ; preds = %96, %48
  tail call void @_Z7barrierj(i32 1) #5
  br i1 %18, label %99, label %108

78:                                               ; preds = %55, %96
  %79 = phi i32 [ %52, %55 ], [ %82, %96 ]
  %80 = phi i32 [ 0, %55 ], [ %97, %96 ]
  %81 = or i32 %80, 1
  %82 = ashr i32 %79, 1
  tail call void @_Z7barrierj(i32 1) #5
  %83 = icmp sgt i32 %81, %7
  br i1 %83, label %84, label %96

84:                                               ; preds = %78
  %85 = mul nsw i32 %82, %56
  %86 = add nsw i32 %85, -1
  %87 = ashr i32 %79, 2
  %88 = add nsw i32 %86, %87
  %89 = sext i32 %86 to i64
  %90 = getelementptr inbounds float, float* %2, i64 %89
  %91 = load float, float* %90, align 4, !tbaa !7
  %92 = sext i32 %88 to i64
  %93 = getelementptr inbounds float, float* %2, i64 %92
  %94 = load float, float* %93, align 4, !tbaa !7
  %95 = fadd float %91, %94
  store float %95, float* %93, align 4, !tbaa !7
  br label %96

96:                                               ; preds = %78, %84
  %97 = shl i32 %81, 1
  %98 = icmp slt i32 %97, %53
  br i1 %98, label %78, label %77

99:                                               ; preds = %77
  %100 = shl nsw i32 %7, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float* %2, i64 %101
  %103 = bitcast float* %102 to i32*
  %104 = load i32, i32* %103, align 4, !tbaa !7
  %105 = sext i32 %17 to i64
  %106 = getelementptr inbounds float, float* %0, i64 %105
  %107 = bitcast float* %106 to i32*
  store i32 %104, i32* %107, align 4, !tbaa !7
  br label %108

108:                                              ; preds = %99, %77
  br i1 %30, label %109, label %119

109:                                              ; preds = %108
  %110 = shl nsw i32 %7, 1
  %111 = or i32 %110, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float* %2, i64 %112
  %114 = bitcast float* %113 to i32*
  %115 = load i32, i32* %114, align 4, !tbaa !7
  %116 = zext i32 %29 to i64
  %117 = getelementptr inbounds float, float* %0, i64 %116
  %118 = bitcast float* %117 to i32*
  store i32 %115, i32* %118, align 4, !tbaa !7
  br label %119

119:                                              ; preds = %109, %108
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @global_prefixSum(float* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #3 !kernel_arg_addr_space !11 !kernel_arg_access_qual !12 !kernel_arg_type !13 !kernel_arg_base_type !13 !kernel_arg_type_qual !14 {
  %4 = tail call i64 @_Z14get_local_sizej(i32 0) #4
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %7 = trunc i64 %6 to i32
  %8 = udiv i32 %1, %5
  %9 = shl i32 %1, 1
  %10 = sub i32 %9, %8
  %11 = udiv i32 %7, %10
  %12 = add i32 %11, 1
  %13 = mul i32 %12, %8
  %14 = add i32 %13, %7
  %15 = mul nsw i32 %14, %5
  %16 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %17 = trunc i64 %16 to i32
  %18 = add i32 %15, %17
  %19 = add nsw i32 %18, 1
  %20 = urem i32 %19, %1
  %21 = icmp ne i32 %20, 0
  %22 = icmp ult i32 %18, %2
  %23 = and i1 %21, %22
  br i1 %23, label %24, label %35

24:                                               ; preds = %3
  %25 = urem i32 %18, %1
  %26 = xor i32 %25, -1
  %27 = add i32 %18, %26
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds float, float* %0, i64 %28
  %30 = load float, float* %29, align 4, !tbaa !7
  %31 = sext i32 %18 to i64
  %32 = getelementptr inbounds float, float* %0, i64 %31
  %33 = load float, float* %32, align 4, !tbaa !7
  %34 = fadd float %30, %33
  store float %34, float* %32, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %3, %24
  ret void
}

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind readnone }
attributes #5 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 3, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none"}
!5 = !{!"float*", !"float*", !"float*", !"uint", !"uint"}
!6 = !{!"", !"", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i32 1, i32 0, i32 0}
!12 = !{!"none", !"none", !"none"}
!13 = !{!"float*", !"uint", !"uint"}
!14 = !{!"", !"", !""}
