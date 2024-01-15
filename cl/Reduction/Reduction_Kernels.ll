; ModuleID = '../AMDAPP_samples/cl/Reduction/Reduction_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/Reduction/Reduction_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @reduce(<4 x i32>* nocapture readonly %0, <4 x i32>* nocapture %1, <4 x i32>* nocapture %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z12get_group_idj(i32 0) #3
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z14get_local_sizej(i32 0) #3
  %10 = trunc i64 %9 to i32
  %11 = shl i32 %8, 1
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %12
  %14 = load <4 x i32>, <4 x i32>* %13, align 16, !tbaa !8
  %15 = or i32 %11, 1
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %16
  %18 = load <4 x i32>, <4 x i32>* %17, align 16, !tbaa !8
  %19 = add <4 x i32> %18, %14
  %20 = and i64 %4, 4294967295
  %21 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 %20
  store <4 x i32> %19, <4 x i32>* %21, align 16, !tbaa !8
  tail call void @_Z7barrierj(i32 1) #4
  %22 = lshr i32 %10, 1
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %36, %3
  %25 = icmp eq i32 %5, 0
  br i1 %25, label %39, label %43

26:                                               ; preds = %3, %36
  %27 = phi i32 [ %37, %36 ], [ %22, %3 ]
  %28 = icmp ugt i32 %27, %5
  br i1 %28, label %29, label %36

29:                                               ; preds = %26
  %30 = add i32 %27, %5
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds <4 x i32>, <4 x i32>* %2, i64 %31
  %33 = load <4 x i32>, <4 x i32>* %32, align 16, !tbaa !8
  %34 = load <4 x i32>, <4 x i32>* %21, align 16, !tbaa !8
  %35 = add <4 x i32> %34, %33
  store <4 x i32> %35, <4 x i32>* %21, align 16, !tbaa !8
  br label %36

36:                                               ; preds = %29, %26
  tail call void @_Z7barrierj(i32 1) #4
  %37 = lshr i32 %27, 1
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %24, label %26

39:                                               ; preds = %24
  %40 = load <4 x i32>, <4 x i32>* %2, align 16, !tbaa !8
  %41 = and i64 %6, 4294967295
  %42 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %41
  store <4 x i32> %40, <4 x i32>* %42, align 16, !tbaa !8
  br label %43

43:                                               ; preds = %39, %24
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

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
!3 = !{i32 1, i32 1, i32 3}
!4 = !{!"none", !"none", !"none"}
!5 = !{!"uint4*", !"uint4*", !"uint4*"}
!6 = !{!"uint __attribute__((ext_vector_type(4)))*", !"uint __attribute__((ext_vector_type(4)))*", !"uint __attribute__((ext_vector_type(4)))*"}
!7 = !{!"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
