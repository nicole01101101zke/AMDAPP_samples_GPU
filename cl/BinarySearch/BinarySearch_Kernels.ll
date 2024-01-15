; ModuleID = '../AMDAPP_samples/cl/BinarySearch/BinarySearch_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/BinarySearch/BinarySearch_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @binarySearch(<4 x i32>* nocapture %0, <2 x i32>* nocapture readonly %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #2
  %5 = and i64 %4, 4294967295
  %6 = getelementptr inbounds <2 x i32>, <2 x i32>* %1, i64 %5
  %7 = load <2 x i32>, <2 x i32>* %6, align 8, !tbaa !8
  %8 = extractelement <2 x i32> %7, i64 0
  %9 = icmp ugt i32 %8, %2
  %10 = extractelement <2 x i32> %7, i64 1
  %11 = icmp ult i32 %10, %2
  %12 = or i1 %9, %11
  br i1 %12, label %18, label %13

13:                                               ; preds = %3
  %14 = trunc i64 %4 to i32
  %15 = load <4 x i32>, <4 x i32>* %0, align 16
  %16 = insertelement <4 x i32> %15, i32 1, i64 3
  %17 = insertelement <4 x i32> %16, i32 %14, i64 0
  store <4 x i32> %17, <4 x i32>* %0, align 16
  br label %18

18:                                               ; preds = %3, %13
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @binarySearch_mulkeys(i32* nocapture readonly %0, i32* nocapture readonly %1, i32 %2, i32* nocapture %3) local_unnamed_addr #0 !kernel_arg_addr_space !11 !kernel_arg_access_qual !12 !kernel_arg_type !13 !kernel_arg_base_type !13 !kernel_arg_type_qual !14 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #2
  %6 = trunc i64 %5 to i32
  %7 = shl nsw i32 %6, 8
  %8 = icmp eq i32 %2, 0
  br i1 %8, label %33, label %9

9:                                                ; preds = %4
  %10 = or i32 %7, 255
  %11 = sext i32 %7 to i64
  %12 = getelementptr inbounds i32, i32* %1, i64 %11
  %13 = sext i32 %10 to i64
  %14 = getelementptr inbounds i32, i32* %1, i64 %13
  %15 = zext i32 %2 to i64
  %16 = and i64 %15, 1
  %17 = icmp eq i32 %2, 1
  br i1 %17, label %20, label %18

18:                                               ; preds = %9
  %19 = sub nsw i64 %15, %16
  br label %34

20:                                               ; preds = %57, %9
  %21 = phi i64 [ 0, %9 ], [ %58, %57 ]
  %22 = icmp eq i64 %16, 0
  br i1 %22, label %33, label %23

23:                                               ; preds = %20
  %24 = getelementptr inbounds i32, i32* %0, i64 %21
  %25 = load i32, i32* %24, align 4, !tbaa !15
  %26 = load i32, i32* %12, align 4, !tbaa !15
  %27 = icmp ult i32 %25, %26
  br i1 %27, label %33, label %28

28:                                               ; preds = %23
  %29 = load i32, i32* %14, align 4, !tbaa !15
  %30 = icmp ugt i32 %25, %29
  br i1 %30, label %33, label %31

31:                                               ; preds = %28
  %32 = getelementptr inbounds i32, i32* %3, i64 %21
  store i32 %7, i32* %32, align 4, !tbaa !15
  br label %33

33:                                               ; preds = %20, %23, %28, %31, %4
  ret void

34:                                               ; preds = %57, %18
  %35 = phi i64 [ 0, %18 ], [ %58, %57 ]
  %36 = phi i64 [ %19, %18 ], [ %59, %57 ]
  %37 = getelementptr inbounds i32, i32* %0, i64 %35
  %38 = load i32, i32* %37, align 4, !tbaa !15
  %39 = load i32, i32* %12, align 4, !tbaa !15
  %40 = icmp ult i32 %38, %39
  br i1 %40, label %46, label %41

41:                                               ; preds = %34
  %42 = load i32, i32* %14, align 4, !tbaa !15
  %43 = icmp ugt i32 %38, %42
  br i1 %43, label %46, label %44

44:                                               ; preds = %41
  %45 = getelementptr inbounds i32, i32* %3, i64 %35
  store i32 %7, i32* %45, align 4, !tbaa !15
  br label %46

46:                                               ; preds = %41, %34, %44
  %47 = or i64 %35, 1
  %48 = getelementptr inbounds i32, i32* %0, i64 %47
  %49 = load i32, i32* %48, align 4, !tbaa !15
  %50 = load i32, i32* %12, align 4, !tbaa !15
  %51 = icmp ult i32 %49, %50
  br i1 %51, label %57, label %52

52:                                               ; preds = %46
  %53 = load i32, i32* %14, align 4, !tbaa !15
  %54 = icmp ugt i32 %49, %53
  br i1 %54, label %57, label %55

55:                                               ; preds = %52
  %56 = getelementptr inbounds i32, i32* %3, i64 %47
  store i32 %7, i32* %56, align 4, !tbaa !15
  br label %57

57:                                               ; preds = %55, %52, %46
  %58 = add nuw nsw i64 %35, 2
  %59 = add i64 %36, -2
  %60 = icmp eq i64 %59, 0
  br i1 %60, label %20, label %34
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @binarySearch_mulkeysConcurrent(i32* nocapture readonly %0, i32* nocapture readonly %1, i32 %2, i32 %3, i32* nocapture %4) local_unnamed_addr #0 !kernel_arg_addr_space !17 !kernel_arg_access_qual !18 !kernel_arg_type !19 !kernel_arg_base_type !19 !kernel_arg_type_qual !20 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #2
  %7 = zext i32 %3 to i64
  %8 = urem i64 %6, %7
  %9 = udiv i32 %2, %3
  %10 = trunc i64 %8 to i32
  %11 = mul i32 %9, %10
  %12 = add i32 %11, %9
  %13 = udiv i64 %6, %7
  %14 = getelementptr inbounds i32, i32* %0, i64 %13
  %15 = load i32, i32* %14, align 4, !tbaa !15
  %16 = icmp slt i32 %12, %11
  br i1 %16, label %35, label %17

17:                                               ; preds = %5, %28
  %18 = phi i32 [ %33, %28 ], [ %11, %5 ]
  %19 = phi i32 [ %32, %28 ], [ %12, %5 ]
  %20 = add nsw i32 %18, %19
  %21 = sdiv i32 %20, 2
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32* %1, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !15
  %25 = icmp eq i32 %24, %15
  br i1 %25, label %26, label %28

26:                                               ; preds = %17
  %27 = getelementptr inbounds i32, i32* %4, i64 %13
  store i32 %21, i32* %27, align 4, !tbaa !15
  br label %35

28:                                               ; preds = %17
  %29 = icmp ugt i32 %24, %15
  %30 = add nsw i32 %21, -1
  %31 = add nsw i32 %21, 1
  %32 = select i1 %29, i32 %30, i32 %19
  %33 = select i1 %29, i32 %18, i32 %31
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %17

35:                                               ; preds = %28, %5, %26
  ret void
}

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind readnone }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 0}
!4 = !{!"none", !"none", !"none"}
!5 = !{!"uint4*", !"uint2*", !"uint"}
!6 = !{!"uint __attribute__((ext_vector_type(4)))*", !"uint __attribute__((ext_vector_type(2)))*", !"uint"}
!7 = !{!"", !"const", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i32 1, i32 1, i32 0, i32 1}
!12 = !{!"none", !"none", !"none", !"none"}
!13 = !{!"int*", !"uint*", !"uint", !"int*"}
!14 = !{!"", !"", !"", !""}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !9, i64 0}
!17 = !{i32 1, i32 1, i32 0, i32 0, i32 1}
!18 = !{!"none", !"none", !"none", !"none", !"none"}
!19 = !{!"uint*", !"uint*", !"uint", !"uint", !"int*"}
!20 = !{!"", !"", !"", !"", !""}
