; ModuleID = '../AMDAPP_samples/cl/BufferBandwidth/BufferBandwidth_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/BufferBandwidth/BufferBandwidth_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@read_kernel.lcount = internal global i32 undef, align 4

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @read_kernel(<4 x i32>* nocapture readonly %0, i32* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %6 = icmp eq i32 %4, 0
  br i1 %6, label %56, label %7

7:                                                ; preds = %5
  %8 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 0, i32* @read_kernel.lcount, align 4, !tbaa !8
  br label %11

11:                                               ; preds = %7, %10
  tail call void @_Z7barrierj(i32 1) #5
  %12 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %13 = icmp eq i32 %2, 0
  br label %16

14:                                               ; preds = %47
  %15 = tail call i32 @_Z10atomic_addPU7CLlocalVjj(i32* nonnull @read_kernel.lcount, i32 %48) #5
  tail call void @_Z7barrierj(i32 1) #5
  br i1 %9, label %51, label %56

16:                                               ; preds = %11, %47
  %17 = phi i32 [ 0, %11 ], [ %49, %47 ]
  %18 = phi i32 [ 0, %11 ], [ %48, %47 ]
  br i1 %13, label %47, label %19

19:                                               ; preds = %16
  %20 = tail call i64 @_Z15get_global_sizej(i32 0) #4
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i64 [ %12, %19 ], [ %45, %21 ]
  %23 = phi i32 [ 0, %19 ], [ %44, %21 ]
  %24 = phi i32 [ %18, %19 ], [ %43, %21 ]
  %25 = and i64 %22, 4294967295
  %26 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %25
  %27 = load <4 x i32>, <4 x i32>* %26, align 16
  %28 = extractelement <4 x i32> %27, i64 0
  %29 = icmp eq i32 %28, %3
  %30 = zext i1 %29 to i32
  %31 = add i32 %24, %30
  %32 = extractelement <4 x i32> %27, i64 1
  %33 = icmp eq i32 %32, %3
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = extractelement <4 x i32> %27, i64 2
  %37 = icmp eq i32 %36, %3
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = extractelement <4 x i32> %27, i64 3
  %41 = icmp eq i32 %40, %3
  %42 = zext i1 %41 to i32
  %43 = add i32 %39, %42
  %44 = add nuw i32 %23, 1
  %45 = add i64 %20, %25
  %46 = icmp eq i32 %44, %2
  br i1 %46, label %47, label %21

47:                                               ; preds = %21, %16
  %48 = phi i32 [ %18, %16 ], [ %43, %21 ]
  %49 = add nuw nsw i32 %17, 1
  %50 = icmp ult i32 %49, %4
  br i1 %50, label %16, label %14

51:                                               ; preds = %14
  %52 = load i32, i32* @read_kernel.lcount, align 4, !tbaa !8
  %53 = udiv i32 %52, %4
  %54 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %55 = getelementptr inbounds i32, i32* %1, i64 %54
  store i32 %53, i32* %55, align 4, !tbaa !8
  br label %56

56:                                               ; preds = %14, %51, %5
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

; Function Attrs: convergent nofree nounwind uwtable writeonly
define dso_local spir_kernel void @write_kernel(i32* nocapture readnone %0, <4 x i32>* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #3 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !12 !kernel_arg_base_type !13 !kernel_arg_type_qual !7 {
  %6 = icmp eq i32 %4, 0
  br i1 %6, label %51, label %7

7:                                                ; preds = %5
  %8 = insertelement <4 x i32> undef, i32 %3, i32 0
  %9 = shufflevector <4 x i32> %8, <4 x i32> undef, <4 x i32> zeroinitializer
  %10 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %11 = icmp eq i32 %2, 0
  %12 = add i32 %2, -1
  %13 = and i32 %2, 3
  %14 = icmp ult i32 %12, 3
  %15 = sub i32 %2, %13
  %16 = icmp eq i32 %13, 0
  br label %17

17:                                               ; preds = %48, %7
  %18 = phi i32 [ 0, %7 ], [ %49, %48 ]
  br i1 %11, label %48, label %19

19:                                               ; preds = %17
  %20 = tail call i64 @_Z15get_global_sizej(i32 0) #4
  br i1 %14, label %38, label %21

21:                                               ; preds = %19, %21
  %22 = phi i64 [ %35, %21 ], [ %10, %19 ]
  %23 = phi i32 [ %36, %21 ], [ %15, %19 ]
  %24 = and i64 %22, 4294967295
  %25 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %24
  store <4 x i32> %9, <4 x i32>* %25, align 16, !tbaa !14
  %26 = add i64 %20, %22
  %27 = and i64 %26, 4294967295
  %28 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %27
  store <4 x i32> %9, <4 x i32>* %28, align 16, !tbaa !14
  %29 = add i64 %20, %26
  %30 = and i64 %29, 4294967295
  %31 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %30
  store <4 x i32> %9, <4 x i32>* %31, align 16, !tbaa !14
  %32 = add i64 %20, %29
  %33 = and i64 %32, 4294967295
  %34 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %33
  store <4 x i32> %9, <4 x i32>* %34, align 16, !tbaa !14
  %35 = add i64 %20, %33
  %36 = add i32 %23, -4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %21

38:                                               ; preds = %21, %19
  %39 = phi i64 [ %10, %19 ], [ %35, %21 ]
  br i1 %16, label %48, label %40

40:                                               ; preds = %38, %40
  %41 = phi i64 [ %45, %40 ], [ %39, %38 ]
  %42 = phi i32 [ %46, %40 ], [ %13, %38 ]
  %43 = and i64 %41, 4294967295
  %44 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %43
  store <4 x i32> %9, <4 x i32>* %44, align 16, !tbaa !14
  %45 = add i64 %20, %43
  %46 = add i32 %42, -1
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %40, !llvm.loop !15

48:                                               ; preds = %38, %40, %17
  %49 = add nuw nsw i32 %18, 1
  %50 = icmp eq i32 %49, %4
  br i1 %50, label %51, label %17

51:                                               ; preds = %48, %5
  ret void
}

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nofree nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind readnone }
attributes #5 = { convergent nounwind }

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
!7 = !{!"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"uint*", !"uint4*", !"uint", !"uint", !"uint"}
!13 = !{!"uint*", !"uint __attribute__((ext_vector_type(4)))*", !"uint", !"uint", !"uint"}
!14 = !{!10, !10, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
