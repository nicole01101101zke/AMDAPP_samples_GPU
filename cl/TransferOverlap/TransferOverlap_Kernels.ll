; ModuleID = '../AMDAPP_samples/cl/TransferOverlap/TransferOverlap_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/TransferOverlap/TransferOverlap_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@readKernel.lcount = internal global i32 undef, align 4
@writeKernel.lval = internal unnamed_addr global i32 undef, align 4

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @readKernel(<4 x i32>* %0, i32* %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %6 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  store i32 0, i32* @readKernel.lcount, align 4, !tbaa !8
  br label %9

9:                                                ; preds = %8, %5
  tail call void @_Z7barrierj(i32 1) #4
  %10 = icmp eq i32 %4, 0
  br i1 %10, label %14, label %11

11:                                               ; preds = %9
  %12 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %13 = icmp eq i32 %2, 0
  br label %17

14:                                               ; preds = %51, %9
  %15 = phi i32 [ 0, %9 ], [ %52, %51 ]
  %16 = tail call i32 @_Z10atomic_addPU7CLlocalVjj(i32* nonnull @readKernel.lcount, i32 %15) #4
  tail call void @_Z7barrierj(i32 1) #4
  br i1 %7, label %55, label %60

17:                                               ; preds = %51, %11
  %18 = phi i32 [ 0, %11 ], [ %53, %51 ]
  %19 = phi i32 [ 0, %11 ], [ %52, %51 ]
  br i1 %13, label %51, label %20

20:                                               ; preds = %17
  %21 = tail call i64 @_Z15get_global_sizej(i32 0) #3
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i64 [ %12, %20 ], [ %49, %22 ]
  %24 = phi i32 [ 0, %20 ], [ %48, %22 ]
  %25 = phi i32 [ %19, %20 ], [ %47, %22 ]
  %26 = and i64 %23, 4294967295
  %27 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %26
  %28 = load volatile <4 x i32>, <4 x i32>* %27, align 16
  %29 = extractelement <4 x i32> %28, i64 0
  %30 = icmp eq i32 %29, %3
  %31 = zext i1 %30 to i32
  %32 = add i32 %25, %31
  %33 = load volatile <4 x i32>, <4 x i32>* %27, align 16
  %34 = extractelement <4 x i32> %33, i64 1
  %35 = icmp eq i32 %34, %3
  %36 = zext i1 %35 to i32
  %37 = add i32 %32, %36
  %38 = load volatile <4 x i32>, <4 x i32>* %27, align 16
  %39 = extractelement <4 x i32> %38, i64 2
  %40 = icmp eq i32 %39, %3
  %41 = zext i1 %40 to i32
  %42 = add i32 %37, %41
  %43 = load volatile <4 x i32>, <4 x i32>* %27, align 16
  %44 = extractelement <4 x i32> %43, i64 3
  %45 = icmp eq i32 %44, %3
  %46 = zext i1 %45 to i32
  %47 = add i32 %42, %46
  %48 = add nuw i32 %24, 1
  %49 = add i64 %21, %26
  %50 = icmp eq i32 %48, %2
  br i1 %50, label %51, label %22

51:                                               ; preds = %22, %17
  %52 = phi i32 [ %19, %17 ], [ %47, %22 ]
  %53 = add nuw nsw i32 %18, 1
  %54 = icmp eq i32 %53, %4
  br i1 %54, label %14, label %17

55:                                               ; preds = %14
  %56 = load i32, i32* @readKernel.lcount, align 4, !tbaa !8
  %57 = udiv i32 %56, %4
  %58 = tail call i64 @_Z12get_group_idj(i32 0) #3
  %59 = getelementptr inbounds i32, i32* %1, i64 %58
  store volatile i32 %57, i32* %59, align 4, !tbaa !8
  br label %60

60:                                               ; preds = %55, %14
  %61 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %62 = icmp eq i64 %61, 0
  br i1 %62, label %63, label %67

63:                                               ; preds = %60
  %64 = tail call i64 @_Z14get_num_groupsj(i32 0) #3
  %65 = add i64 %64, 1
  %66 = getelementptr inbounds i32, i32* %1, i64 %65
  store volatile i32 %3, i32* %66, align 4, !tbaa !8
  br label %67

67:                                               ; preds = %63, %60
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local i32 @_Z10atomic_addPU7CLlocalVjj(i32*, i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_num_groupsj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @writeKernel(i32* %0, <4 x i32>* %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !12 !kernel_arg_base_type !13 !kernel_arg_type_qual !7 {
  %6 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %13

8:                                                ; preds = %5
  %9 = tail call i64 @_Z14get_num_groupsj(i32 0) #3
  %10 = add i64 %9, 1
  %11 = getelementptr inbounds i32, i32* %0, i64 %10
  %12 = load volatile i32, i32* %11, align 4, !tbaa !8
  store i32 %12, i32* @writeKernel.lval, align 4, !tbaa !8
  br label %13

13:                                               ; preds = %8, %5
  tail call void @_Z7barrierj(i32 1) #4
  %14 = load i32, i32* @writeKernel.lval, align 4, !tbaa !8
  %15 = insertelement <4 x i32> undef, i32 %14, i32 0
  %16 = shufflevector <4 x i32> %15, <4 x i32> undef, <4 x i32> zeroinitializer
  %17 = icmp eq i32 %4, 0
  br i1 %17, label %26, label %18

18:                                               ; preds = %13
  %19 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %20 = icmp eq i32 %2, 0
  %21 = add i32 %2, -1
  %22 = and i32 %2, 3
  %23 = icmp ult i32 %21, 3
  %24 = sub i32 %2, %22
  %25 = icmp eq i32 %22, 0
  br label %27

26:                                               ; preds = %58, %13
  ret void

27:                                               ; preds = %58, %18
  %28 = phi i32 [ 0, %18 ], [ %59, %58 ]
  br i1 %20, label %58, label %29

29:                                               ; preds = %27
  %30 = tail call i64 @_Z15get_global_sizej(i32 0) #3
  br i1 %23, label %48, label %31

31:                                               ; preds = %29, %31
  %32 = phi i64 [ %45, %31 ], [ %19, %29 ]
  %33 = phi i32 [ %46, %31 ], [ %24, %29 ]
  %34 = and i64 %32, 4294967295
  %35 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %34
  store volatile <4 x i32> %16, <4 x i32>* %35, align 16, !tbaa !14
  %36 = add i64 %30, %32
  %37 = and i64 %36, 4294967295
  %38 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %37
  store volatile <4 x i32> %16, <4 x i32>* %38, align 16, !tbaa !14
  %39 = add i64 %30, %36
  %40 = and i64 %39, 4294967295
  %41 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %40
  store volatile <4 x i32> %16, <4 x i32>* %41, align 16, !tbaa !14
  %42 = add i64 %30, %39
  %43 = and i64 %42, 4294967295
  %44 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %43
  store volatile <4 x i32> %16, <4 x i32>* %44, align 16, !tbaa !14
  %45 = add i64 %30, %43
  %46 = add i32 %33, -4
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %31

48:                                               ; preds = %31, %29
  %49 = phi i64 [ %19, %29 ], [ %45, %31 ]
  br i1 %25, label %58, label %50

50:                                               ; preds = %48, %50
  %51 = phi i64 [ %55, %50 ], [ %49, %48 ]
  %52 = phi i32 [ %56, %50 ], [ %22, %48 ]
  %53 = and i64 %51, 4294967295
  %54 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %53
  store volatile <4 x i32> %16, <4 x i32>* %54, align 16, !tbaa !14
  %55 = add i64 %30, %53
  %56 = add i32 %52, -1
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %50, !llvm.loop !15

58:                                               ; preds = %48, %50, %27
  %59 = add nuw nsw i32 %28, 1
  %60 = icmp eq i32 %59, %4
  br i1 %60, label %26, label %27
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
!3 = !{i32 1, i32 1, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none"}
!5 = !{!"uint4*", !"uint*", !"uint", !"uint", !"uint"}
!6 = !{!"uint __attribute__((ext_vector_type(4)))*", !"uint*", !"uint", !"uint", !"uint"}
!7 = !{!"volatile", !"volatile", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"uint*", !"uint4*", !"uint", !"uint", !"uint"}
!13 = !{!"uint*", !"uint __attribute__((ext_vector_type(4)))*", !"uint", !"uint", !"uint"}
!14 = !{!10, !10, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
