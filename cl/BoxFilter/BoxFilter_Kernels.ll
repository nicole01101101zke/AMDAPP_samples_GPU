; ModuleID = '../AMDAPP_samples/cl/BoxFilter/BoxFilter_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/BoxFilter/BoxFilter_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @box_filter(<4 x i32>* nocapture readonly %0, <4 x i8>* nocapture %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z15get_global_sizej(i32 0) #5
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z15get_global_sizej(i32 1) #5
  %11 = add i32 %2, -1
  %12 = lshr i32 %11, 1
  %13 = icmp sgt i32 %12, %5
  %14 = icmp sgt i32 %12, %7
  %15 = or i1 %13, %14
  br i1 %15, label %24, label %16

16:                                               ; preds = %3
  %17 = trunc i64 %10 to i32
  %18 = xor i32 %12, -1
  %19 = add i32 %9, %18
  %20 = icmp slt i32 %19, %5
  %21 = add i32 %17, %18
  %22 = icmp slt i32 %21, %7
  %23 = or i1 %20, %22
  br i1 %23, label %24, label %30

24:                                               ; preds = %16, %3
  %25 = mul i64 %8, %6
  %26 = add i64 %25, %4
  %27 = shl i64 %26, 32
  %28 = ashr exact i64 %27, 32
  %29 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %28
  store <4 x i8> zeroinitializer, <4 x i8>* %29, align 4, !tbaa !8
  br label %89

30:                                               ; preds = %16
  %31 = mul i32 %2, %2
  %32 = insertelement <4 x i32> undef, i32 %31, i32 0
  %33 = shufflevector <4 x i32> %32, <4 x i32> undef, <4 x i32> zeroinitializer
  %34 = add nsw i32 %12, %5
  %35 = add nsw i32 %12, %7
  %36 = add i32 %5, %18
  %37 = add i32 %7, %18
  %38 = or i32 %37, %36
  %39 = icmp sgt i32 %38, -1
  br i1 %39, label %40, label %47

40:                                               ; preds = %30
  %41 = mul nsw i32 %37, %9
  %42 = add nsw i32 %41, %36
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %43
  %45 = load <4 x i32>, <4 x i32>* %44, align 16, !tbaa !8
  %46 = tail call <4 x i32> @_Z12convert_int4Dv4_j(<4 x i32> %45) #5
  br label %47

47:                                               ; preds = %40, %30
  %48 = phi <4 x i32> [ %46, %40 ], [ zeroinitializer, %30 ]
  %49 = or i32 %37, %34
  %50 = icmp sgt i32 %49, -1
  br i1 %50, label %51, label %59

51:                                               ; preds = %47
  %52 = mul nsw i32 %37, %9
  %53 = add nsw i32 %52, %34
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %54
  %56 = load <4 x i32>, <4 x i32>* %55, align 16, !tbaa !8
  %57 = tail call <4 x i32> @_Z12convert_int4Dv4_j(<4 x i32> %56) #5
  %58 = sub <4 x i32> zeroinitializer, %57
  br label %59

59:                                               ; preds = %51, %47
  %60 = phi <4 x i32> [ %58, %51 ], [ zeroinitializer, %47 ]
  %61 = or i32 %35, %36
  %62 = icmp sgt i32 %61, -1
  %63 = mul nsw i32 %35, %9
  br i1 %62, label %64, label %71

64:                                               ; preds = %59
  %65 = add nsw i32 %63, %36
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %66
  %68 = load <4 x i32>, <4 x i32>* %67, align 16, !tbaa !8
  %69 = tail call <4 x i32> @_Z12convert_int4Dv4_j(<4 x i32> %68) #5
  %70 = sub <4 x i32> zeroinitializer, %69
  br label %71

71:                                               ; preds = %59, %64
  %72 = phi <4 x i32> [ %70, %64 ], [ zeroinitializer, %59 ]
  %73 = add nsw i32 %63, %34
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %74
  %76 = load <4 x i32>, <4 x i32>* %75, align 16, !tbaa !8
  %77 = tail call <4 x i32> @_Z12convert_int4Dv4_j(<4 x i32> %76) #5
  %78 = add <4 x i32> %60, %48
  %79 = add <4 x i32> %78, %72
  %80 = add <4 x i32> %79, %77
  %81 = sdiv <4 x i32> %80, %33
  %82 = tail call i32 @_Z14convert_uchar4Dv4_i(<4 x i32> %81) #5
  %83 = mul i64 %8, %6
  %84 = add i64 %83, %4
  %85 = shl i64 %84, 32
  %86 = ashr exact i64 %85, 32
  %87 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %86
  %88 = bitcast <4 x i8>* %87 to i32*
  store i32 %82, i32* %88, align 4, !tbaa !8
  br label %89

89:                                               ; preds = %71, %24
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x i32> @_Z12convert_int4Dv4_j(<4 x i32>) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i32 @_Z14convert_uchar4Dv4_i(<4 x i32>) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @horizontalSAT0(<4 x i8>* nocapture readonly %0, <4 x i32>* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 !kernel_arg_addr_space !11 !kernel_arg_access_qual !12 !kernel_arg_type !13 !kernel_arg_base_type !14 !kernel_arg_type_qual !15 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %9 = trunc i64 %8 to i32
  %10 = mul nsw i32 %9, %4
  %11 = add nsw i32 %10, %7
  %12 = sitofp i32 %3 to float
  %13 = sitofp i32 %2 to float
  %14 = tail call float @_Z3powff(float %12, float %13) #5
  %15 = icmp sgt i32 %3, 0
  br i1 %15, label %18, label %16

16:                                               ; preds = %5
  %17 = sext i32 %11 to i64
  br label %39

18:                                               ; preds = %5
  %19 = fptosi float %14 to i32
  %20 = sext i32 %19 to i64
  %21 = sext i32 %11 to i64
  %22 = shl i64 %6, 32
  %23 = ashr exact i64 %22, 32
  %24 = zext i32 %3 to i64
  br label %25

25:                                               ; preds = %30, %18
  %26 = phi i64 [ 0, %18 ], [ %37, %30 ]
  %27 = phi <4 x i32> [ zeroinitializer, %18 ], [ %36, %30 ]
  %28 = mul nsw i64 %26, %20
  %29 = icmp sgt i64 %28, %23
  br i1 %29, label %39, label %30

30:                                               ; preds = %25
  %31 = sub nsw i64 %21, %28
  %32 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %31
  %33 = bitcast <4 x i8>* %32 to i32*
  %34 = load i32, i32* %33, align 4, !tbaa !8
  %35 = tail call <4 x i32> @_Z13convert_uint4Dv4_h(i32 %34) #5
  %36 = add <4 x i32> %35, %27
  %37 = add nuw nsw i64 %26, 1
  %38 = icmp eq i64 %37, %24
  br i1 %38, label %39, label %25

39:                                               ; preds = %30, %25, %16
  %40 = phi i64 [ %17, %16 ], [ %21, %25 ], [ %21, %30 ]
  %41 = phi <4 x i32> [ zeroinitializer, %16 ], [ %36, %30 ], [ %27, %25 ]
  %42 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %40
  store <4 x i32> %41, <4 x i32>* %42, align 16, !tbaa !8
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3powff(float, float) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x i32> @_Z13convert_uint4Dv4_h(i32) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @horizontalSAT(<4 x i32>* nocapture readonly %0, <4 x i32>* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #2 !kernel_arg_addr_space !11 !kernel_arg_access_qual !12 !kernel_arg_type !16 !kernel_arg_base_type !17 !kernel_arg_type_qual !15 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %9 = trunc i64 %8 to i32
  %10 = mul nsw i32 %9, %4
  %11 = add nsw i32 %10, %7
  %12 = sitofp i32 %3 to float
  %13 = sitofp i32 %2 to float
  %14 = tail call float @_Z3powff(float %12, float %13) #5
  %15 = icmp sgt i32 %3, 0
  br i1 %15, label %18, label %16

16:                                               ; preds = %5
  %17 = sext i32 %11 to i64
  br label %37

18:                                               ; preds = %5
  %19 = fptosi float %14 to i32
  %20 = sext i32 %19 to i64
  %21 = sext i32 %11 to i64
  %22 = shl i64 %6, 32
  %23 = ashr exact i64 %22, 32
  %24 = zext i32 %3 to i64
  br label %25

25:                                               ; preds = %30, %18
  %26 = phi i64 [ 0, %18 ], [ %35, %30 ]
  %27 = phi <4 x i32> [ zeroinitializer, %18 ], [ %34, %30 ]
  %28 = mul nsw i64 %26, %20
  %29 = icmp sgt i64 %28, %23
  br i1 %29, label %37, label %30

30:                                               ; preds = %25
  %31 = sub nsw i64 %21, %28
  %32 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %31
  %33 = load <4 x i32>, <4 x i32>* %32, align 16, !tbaa !8
  %34 = add <4 x i32> %33, %27
  %35 = add nuw nsw i64 %26, 1
  %36 = icmp eq i64 %35, %24
  br i1 %36, label %37, label %25

37:                                               ; preds = %30, %25, %16
  %38 = phi i64 [ %17, %16 ], [ %21, %25 ], [ %21, %30 ]
  %39 = phi <4 x i32> [ zeroinitializer, %16 ], [ %34, %30 ], [ %27, %25 ]
  %40 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %38
  store <4 x i32> %39, <4 x i32>* %40, align 16, !tbaa !8
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @verticalSAT(<4 x i32>* nocapture readonly %0, <4 x i32>* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #2 !kernel_arg_addr_space !11 !kernel_arg_access_qual !12 !kernel_arg_type !16 !kernel_arg_base_type !17 !kernel_arg_type_qual !15 {
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %3 to float
  %11 = sitofp i32 %2 to float
  %12 = tail call float @_Z3powff(float %10, float %11) #5
  %13 = icmp sgt i32 %3, 0
  br i1 %13, label %14, label %37

14:                                               ; preds = %5
  %15 = fptosi float %12 to i32
  %16 = sext i32 %15 to i64
  %17 = shl i64 %8, 32
  %18 = ashr exact i64 %17, 32
  %19 = sext i32 %4 to i64
  %20 = shl i64 %6, 32
  %21 = ashr exact i64 %20, 32
  %22 = zext i32 %3 to i64
  br label %23

23:                                               ; preds = %29, %14
  %24 = phi i64 [ 0, %14 ], [ %35, %29 ]
  %25 = phi <4 x i32> [ zeroinitializer, %14 ], [ %34, %29 ]
  %26 = mul nsw i64 %24, %16
  %27 = sub nsw i64 %18, %26
  %28 = icmp slt i64 %27, 0
  br i1 %28, label %37, label %29

29:                                               ; preds = %23
  %30 = mul nsw i64 %27, %19
  %31 = add nsw i64 %30, %21
  %32 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %31
  %33 = load <4 x i32>, <4 x i32>* %32, align 16, !tbaa !8
  %34 = add <4 x i32> %33, %25
  %35 = add nuw nsw i64 %24, 1
  %36 = icmp eq i64 %35, %22
  br i1 %36, label %37, label %23

37:                                               ; preds = %29, %23, %5
  %38 = phi <4 x i32> [ zeroinitializer, %5 ], [ %34, %29 ], [ %25, %23 ]
  %39 = mul nsw i32 %9, %4
  %40 = add nsw i32 %39, %7
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds <4 x i32>, <4 x i32>* %1, i64 %41
  store <4 x i32> %38, <4 x i32>* %42, align 16, !tbaa !8
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @box_filter_horizontal(<4 x i8>* nocapture readonly %0, <4 x i8>* nocapture %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !18 !kernel_arg_base_type !19 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z15get_global_sizej(i32 0) #5
  %9 = trunc i64 %8 to i32
  %10 = mul nsw i32 %9, %7
  %11 = add nsw i32 %10, %5
  %12 = add nsw i32 %2, -1
  %13 = sdiv i32 %12, 2
  %14 = icmp sle i32 %13, %5
  %15 = sub nsw i32 %9, %13
  %16 = icmp sgt i32 %15, %5
  %17 = and i1 %14, %16
  br i1 %17, label %21, label %18

18:                                               ; preds = %3
  %19 = sext i32 %11 to i64
  %20 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %19
  store <4 x i8> zeroinitializer, <4 x i8>* %20, align 4, !tbaa !8
  br label %63

21:                                               ; preds = %3
  %22 = insertelement <4 x i32> undef, i32 %2, i32 0
  %23 = shufflevector <4 x i32> %22, <4 x i32> undef, <4 x i32> zeroinitializer
  %24 = sub nsw i32 0, %13
  %25 = icmp sgt i32 %13, %24
  br i1 %25, label %28, label %26

26:                                               ; preds = %21
  %27 = sext i32 %11 to i64
  br label %32

28:                                               ; preds = %21
  %29 = sext i32 %24 to i64
  %30 = sext i32 %11 to i64
  %31 = sext i32 %13 to i64
  br label %46

32:                                               ; preds = %46, %26
  %33 = phi i64 [ %27, %26 ], [ %30, %46 ]
  %34 = phi <4 x i32> [ zeroinitializer, %26 ], [ %60, %46 ]
  %35 = add nsw i32 %11, %13
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %36
  %38 = bitcast <4 x i8>* %37 to i32*
  %39 = load i32, i32* %38, align 4, !tbaa !8
  %40 = tail call <4 x i32> @_Z12convert_int4Dv4_h(i32 %39) #5
  %41 = add <4 x i32> %40, %34
  %42 = sdiv <4 x i32> %41, %23
  %43 = tail call i32 @_Z14convert_uchar4Dv4_i(<4 x i32> %42) #5
  %44 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %33
  %45 = bitcast <4 x i8>* %44 to i32*
  store i32 %43, i32* %45, align 4, !tbaa !8
  br label %63

46:                                               ; preds = %28, %46
  %47 = phi i64 [ %29, %28 ], [ %61, %46 ]
  %48 = phi <4 x i32> [ zeroinitializer, %28 ], [ %60, %46 ]
  %49 = add nsw i64 %47, %30
  %50 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %49
  %51 = bitcast <4 x i8>* %50 to i32*
  %52 = load i32, i32* %51, align 4, !tbaa !8
  %53 = tail call <4 x i32> @_Z12convert_int4Dv4_h(i32 %52) #5
  %54 = add <4 x i32> %53, %48
  %55 = add nsw i64 %49, 1
  %56 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %55
  %57 = bitcast <4 x i8>* %56 to i32*
  %58 = load i32, i32* %57, align 4, !tbaa !8
  %59 = tail call <4 x i32> @_Z12convert_int4Dv4_h(i32 %58) #5
  %60 = add <4 x i32> %54, %59
  %61 = add nsw i64 %47, 2
  %62 = icmp slt i64 %61, %31
  br i1 %62, label %46, label %32

63:                                               ; preds = %32, %18
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x i32> @_Z12convert_int4Dv4_h(i32) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @box_filter_vertical(<4 x i8>* nocapture readonly %0, <4 x i8>* nocapture %1, i32 %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !18 !kernel_arg_base_type !19 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z15get_global_sizej(i32 0) #5
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z15get_global_sizej(i32 1) #5
  %11 = mul nsw i32 %9, %7
  %12 = add nsw i32 %11, %5
  %13 = add nsw i32 %2, -1
  %14 = sdiv i32 %13, 2
  %15 = icmp sgt i32 %14, %7
  br i1 %15, label %20, label %16

16:                                               ; preds = %3
  %17 = trunc i64 %10 to i32
  %18 = sub nsw i32 %17, %14
  %19 = icmp sgt i32 %18, %7
  br i1 %19, label %23, label %20

20:                                               ; preds = %16, %3
  %21 = sext i32 %12 to i64
  %22 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %21
  store <4 x i8> zeroinitializer, <4 x i8>* %22, align 4, !tbaa !8
  br label %71

23:                                               ; preds = %16
  %24 = insertelement <4 x i32> undef, i32 %2, i32 0
  %25 = shufflevector <4 x i32> %24, <4 x i32> undef, <4 x i32> zeroinitializer
  %26 = sub nsw i32 0, %14
  %27 = icmp sgt i32 %14, %26
  br i1 %27, label %30, label %28

28:                                               ; preds = %23
  %29 = sext i32 %12 to i64
  br label %36

30:                                               ; preds = %23
  %31 = sext i32 %26 to i64
  %32 = shl i64 %8, 32
  %33 = ashr exact i64 %32, 32
  %34 = sext i32 %12 to i64
  %35 = sext i32 %14 to i64
  br label %51

36:                                               ; preds = %51, %28
  %37 = phi i64 [ %29, %28 ], [ %34, %51 ]
  %38 = phi <4 x i32> [ zeroinitializer, %28 ], [ %68, %51 ]
  %39 = mul nsw i32 %14, %9
  %40 = add nsw i32 %12, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %41
  %43 = bitcast <4 x i8>* %42 to i32*
  %44 = load i32, i32* %43, align 4, !tbaa !8
  %45 = tail call <4 x i32> @_Z12convert_int4Dv4_h(i32 %44) #5
  %46 = add <4 x i32> %45, %38
  %47 = sdiv <4 x i32> %46, %25
  %48 = tail call i32 @_Z14convert_uchar4Dv4_i(<4 x i32> %47) #5
  %49 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %37
  %50 = bitcast <4 x i8>* %49 to i32*
  store i32 %48, i32* %50, align 4, !tbaa !8
  br label %71

51:                                               ; preds = %30, %51
  %52 = phi i64 [ %31, %30 ], [ %69, %51 ]
  %53 = phi <4 x i32> [ zeroinitializer, %30 ], [ %68, %51 ]
  %54 = mul nsw i64 %52, %33
  %55 = add nsw i64 %54, %34
  %56 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %55
  %57 = bitcast <4 x i8>* %56 to i32*
  %58 = load i32, i32* %57, align 4, !tbaa !8
  %59 = tail call <4 x i32> @_Z12convert_int4Dv4_h(i32 %58) #5
  %60 = add <4 x i32> %59, %53
  %61 = add nsw i64 %52, 1
  %62 = mul nsw i64 %61, %33
  %63 = add nsw i64 %62, %34
  %64 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %63
  %65 = bitcast <4 x i8>* %64 to i32*
  %66 = load i32, i32* %65, align 4, !tbaa !8
  %67 = tail call <4 x i32> @_Z12convert_int4Dv4_h(i32 %66) #5
  %68 = add <4 x i32> %60, %67
  %69 = add nsw i64 %52, 2
  %70 = icmp slt i64 %69, %35
  br i1 %70, label %51, label %36

71:                                               ; preds = %36, %20
  ret void
}

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @box_filter_horizontal_local(<4 x i8>* nocapture readonly %0, <4 x i8>* nocapture %1, i32 %2, <4 x i8>* nocapture %3) local_unnamed_addr #3 !kernel_arg_addr_space !20 !kernel_arg_access_qual !21 !kernel_arg_type !22 !kernel_arg_base_type !23 !kernel_arg_type_qual !24 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %8 = tail call i64 @_Z15get_global_sizej(i32 0) #5
  %9 = trunc i64 %8 to i32
  %10 = mul i64 %8, %7
  %11 = add i64 %10, %5
  %12 = add nsw i32 %2, -1
  %13 = sdiv i32 %12, 2
  %14 = sub nsw i32 0, %13
  %15 = tail call i64 @_Z12get_local_idj(i32 0) #5
  %16 = trunc i64 %15 to i32
  %17 = tail call i64 @_Z12get_group_idj(i32 0) #5
  %18 = trunc i64 %17 to i32
  %19 = tail call i64 @_Z12get_group_idj(i32 1) #5
  %20 = trunc i64 %19 to i32
  %21 = tail call i64 @_Z14get_local_sizej(i32 0) #5
  %22 = trunc i64 %21 to i32
  %23 = tail call i64 @_Z14get_local_sizej(i32 1) #5
  %24 = trunc i64 %23 to i32
  %25 = mul nsw i32 %22, %18
  %26 = mul nsw i32 %20, %9
  %27 = mul nsw i32 %26, %24
  %28 = add nsw i32 %27, %25
  %29 = icmp sgt i32 %13, %16
  %30 = add i32 %28, %16
  br i1 %29, label %33, label %31

31:                                               ; preds = %4
  %32 = add i32 %13, %16
  br label %54

33:                                               ; preds = %4
  %34 = sub i32 %30, %13
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %35
  %37 = bitcast <4 x i8>* %36 to i32*
  %38 = load i32, i32* %37, align 4, !tbaa !8
  %39 = shl i64 %15, 32
  %40 = ashr exact i64 %39, 32
  %41 = getelementptr inbounds <4 x i8>, <4 x i8>* %3, i64 %40
  %42 = bitcast <4 x i8>* %41 to i32*
  store i32 %38, i32* %42, align 4, !tbaa !8
  %43 = add i32 %16, 256
  %44 = add i32 %43, %28
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %45
  %47 = bitcast <4 x i8>* %46 to i32*
  %48 = load i32, i32* %47, align 4, !tbaa !8
  %49 = add i32 %13, %16
  %50 = add i32 %49, 256
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds <4 x i8>, <4 x i8>* %3, i64 %51
  %53 = bitcast <4 x i8>* %52 to i32*
  store i32 %48, i32* %53, align 4, !tbaa !8
  br label %54

54:                                               ; preds = %31, %33
  %55 = phi i32 [ %32, %31 ], [ %49, %33 ]
  %56 = sext i32 %30 to i64
  %57 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %56
  %58 = bitcast <4 x i8>* %57 to i32*
  %59 = load i32, i32* %58, align 4, !tbaa !8
  %60 = sext i32 %55 to i64
  %61 = getelementptr inbounds <4 x i8>, <4 x i8>* %3, i64 %60
  %62 = bitcast <4 x i8>* %61 to i32*
  store i32 %59, i32* %62, align 4, !tbaa !8
  tail call void @_Z7barrierj(i32 1) #6
  %63 = icmp sle i32 %13, %6
  %64 = sub nsw i32 %9, %13
  %65 = icmp sgt i32 %64, %6
  %66 = and i1 %63, %65
  br i1 %66, label %67, label %96

67:                                               ; preds = %54
  %68 = insertelement <4 x i32> undef, i32 %2, i32 0
  %69 = shufflevector <4 x i32> %68, <4 x i32> undef, <4 x i32> zeroinitializer
  %70 = icmp slt i32 %13, %14
  br i1 %70, label %74, label %71

71:                                               ; preds = %67
  %72 = sext i32 %14 to i64
  %73 = add nsw i32 %13, 1
  br label %82

74:                                               ; preds = %82, %67
  %75 = phi <4 x i32> [ zeroinitializer, %67 ], [ %92, %82 ]
  %76 = sdiv <4 x i32> %75, %69
  %77 = tail call i32 @_Z14convert_uchar4Dv4_i(<4 x i32> %76) #5
  %78 = shl i64 %11, 32
  %79 = ashr exact i64 %78, 32
  %80 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %79
  %81 = bitcast <4 x i8>* %80 to i32*
  store i32 %77, i32* %81, align 4, !tbaa !8
  br label %96

82:                                               ; preds = %82, %71
  %83 = phi i64 [ %93, %82 ], [ %72, %71 ]
  %84 = phi <4 x i32> [ %92, %82 ], [ zeroinitializer, %71 ]
  %85 = trunc i64 %83 to i32
  %86 = add i32 %55, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds <4 x i8>, <4 x i8>* %3, i64 %87
  %89 = bitcast <4 x i8>* %88 to i32*
  %90 = load i32, i32* %89, align 4, !tbaa !8
  %91 = tail call <4 x i32> @_Z12convert_int4Dv4_h(i32 %90) #5
  %92 = add <4 x i32> %91, %84
  %93 = add nsw i64 %83, 1
  %94 = trunc i64 %93 to i32
  %95 = icmp eq i32 %73, %94
  br i1 %95, label %74, label %82

96:                                               ; preds = %54, %74
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #4

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { convergent nounwind readnone }
attributes #6 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 0}
!4 = !{!"none", !"none", !"none"}
!5 = !{!"uint4*", !"uchar4*", !"uint"}
!6 = !{!"uint __attribute__((ext_vector_type(4)))*", !"uchar __attribute__((ext_vector_type(4)))*", !"uint"}
!7 = !{!"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i32 1, i32 1, i32 0, i32 0, i32 0}
!12 = !{!"none", !"none", !"none", !"none", !"none"}
!13 = !{!"uchar4*", !"uint4*", !"int", !"int", !"int"}
!14 = !{!"uchar __attribute__((ext_vector_type(4)))*", !"uint __attribute__((ext_vector_type(4)))*", !"int", !"int", !"int"}
!15 = !{!"", !"", !"", !"", !""}
!16 = !{!"uint4*", !"uint4*", !"int", !"int", !"int"}
!17 = !{!"uint __attribute__((ext_vector_type(4)))*", !"uint __attribute__((ext_vector_type(4)))*", !"int", !"int", !"int"}
!18 = !{!"uchar4*", !"uchar4*", !"int"}
!19 = !{!"uchar __attribute__((ext_vector_type(4)))*", !"uchar __attribute__((ext_vector_type(4)))*", !"int"}
!20 = !{i32 1, i32 1, i32 0, i32 3}
!21 = !{!"none", !"none", !"none", !"none"}
!22 = !{!"uchar4*", !"uchar4*", !"int", !"uchar4*"}
!23 = !{!"uchar __attribute__((ext_vector_type(4)))*", !"uchar __attribute__((ext_vector_type(4)))*", !"int", !"uchar __attribute__((ext_vector_type(4)))*"}
!24 = !{!"", !"", !"", !""}
