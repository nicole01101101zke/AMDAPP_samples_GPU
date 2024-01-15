; ModuleID = '../AMDAPP_samples/cl/RadixSort/RadixSort_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/RadixSort/RadixSort_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @histogram(i32* nocapture readonly %0, i32* nocapture %1, i32 %2, i32* %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %5 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %6 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %7 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %8 = tail call i64 @_Z14get_local_sizej(i32 0) #4
  %9 = getelementptr inbounds i32, i32* %3, i64 %5
  store i32 0, i32* %9, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 1) #5
  %10 = getelementptr inbounds i32, i32* %0, i64 %6
  %11 = load i32, i32* %10, align 4, !tbaa !7
  %12 = and i32 %2, 31
  %13 = lshr i32 %11, %12
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %3, i64 %15
  %17 = tail call i32 @_Z10atomic_incPU7CLlocalVj(i32* %16) #5
  tail call void @_Z7barrierj(i32 1) #5
  %18 = mul i64 %8, %7
  %19 = add i64 %18, %5
  %20 = load i32, i32* %9, align 4, !tbaa !7
  %21 = and i64 %19, 4294967295
  %22 = getelementptr inbounds i32, i32* %1, i64 %21
  store i32 %20, i32* %22, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local i32 @_Z10atomic_incPU7CLlocalVj(i32*) local_unnamed_addr #2

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @permute(i32* nocapture readonly %0, i32* nocapture readonly %1, i32 %2, i16* nocapture %3, i32* nocapture %4) local_unnamed_addr #0 !kernel_arg_addr_space !11 !kernel_arg_access_qual !12 !kernel_arg_type !13 !kernel_arg_base_type !13 !kernel_arg_type_qual !14 {
  %6 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %7 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %8 = tail call i64 @_Z14get_local_sizej(i32 0) #4
  %9 = shl i64 %6, 8
  %10 = mul i64 %9, %8
  %11 = shl i64 %7, 8
  %12 = add i64 %10, %11
  %13 = and i64 %12, 4294967040
  br label %18

14:                                               ; preds = %18
  %15 = tail call i64 @_Z13get_global_idj(i32 0) #4
  tail call void @_Z7barrierj(i32 1) #5
  %16 = shl i64 %15, 8
  %17 = and i32 %2, 31
  br label %50

18:                                               ; preds = %18, %5
  %19 = phi i64 [ 0, %5 ], [ %47, %18 ]
  %20 = add nuw nsw i64 %19, %13
  %21 = getelementptr inbounds i32, i32* %1, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !7
  %23 = trunc i32 %22 to i16
  %24 = add nuw nsw i64 %11, %19
  %25 = getelementptr inbounds i16, i16* %3, i64 %24
  store i16 %23, i16* %25, align 2, !tbaa !15
  %26 = or i64 %19, 1
  %27 = add nuw nsw i64 %26, %13
  %28 = getelementptr inbounds i32, i32* %1, i64 %27
  %29 = load i32, i32* %28, align 4, !tbaa !7
  %30 = trunc i32 %29 to i16
  %31 = add nuw nsw i64 %11, %26
  %32 = getelementptr inbounds i16, i16* %3, i64 %31
  store i16 %30, i16* %32, align 2, !tbaa !15
  %33 = or i64 %19, 2
  %34 = add nuw nsw i64 %33, %13
  %35 = getelementptr inbounds i32, i32* %1, i64 %34
  %36 = load i32, i32* %35, align 4, !tbaa !7
  %37 = trunc i32 %36 to i16
  %38 = add nuw nsw i64 %11, %33
  %39 = getelementptr inbounds i16, i16* %3, i64 %38
  store i16 %37, i16* %39, align 2, !tbaa !15
  %40 = or i64 %19, 3
  %41 = add nuw nsw i64 %40, %13
  %42 = getelementptr inbounds i32, i32* %1, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !7
  %44 = trunc i32 %43 to i16
  %45 = add nuw nsw i64 %11, %40
  %46 = getelementptr inbounds i16, i16* %3, i64 %45
  store i16 %44, i16* %46, align 2, !tbaa !15
  %47 = add nuw nsw i64 %19, 4
  %48 = icmp eq i64 %47, 256
  br i1 %48, label %14, label %18

49:                                               ; preds = %50
  ret void

50:                                               ; preds = %50, %14
  %51 = phi i64 [ 0, %14 ], [ %64, %50 ]
  %52 = add nuw nsw i64 %16, %51
  %53 = getelementptr inbounds i32, i32* %0, i64 %52
  %54 = load i32, i32* %53, align 4, !tbaa !7
  %55 = lshr i32 %54, %17
  %56 = and i32 %55, 255
  %57 = zext i32 %56 to i64
  %58 = or i64 %11, %57
  %59 = getelementptr inbounds i16, i16* %3, i64 %58
  %60 = load i16, i16* %59, align 2, !tbaa !15
  %61 = zext i16 %60 to i64
  %62 = getelementptr inbounds i32, i32* %4, i64 %61
  store i32 %54, i32* %62, align 4, !tbaa !7
  %63 = add i16 %60, 1
  store i16 %63, i16* %59, align 2, !tbaa !15
  tail call void @_Z7barrierj(i32 1) #5
  %64 = add nuw nsw i64 %51, 1
  %65 = icmp eq i64 %64, 256
  br i1 %65, label %49, label %50
}

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @ScanArraysdim2(i32* nocapture %0, i32* nocapture readonly %1, i32* nocapture %2, i32 %3, i32 %4, i32* nocapture %5) local_unnamed_addr #0 !kernel_arg_addr_space !17 !kernel_arg_access_qual !18 !kernel_arg_type !19 !kernel_arg_base_type !19 !kernel_arg_type_qual !20 {
  %7 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %8 = trunc i64 %7 to i32
  %9 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %10 = trunc i64 %9 to i32
  %11 = tail call i64 @_Z13get_global_idj(i32 1) #4
  %12 = trunc i64 %11 to i32
  %13 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %14 = tail call i64 @_Z12get_group_idj(i32 1) #4
  %15 = shl i32 %10, 8
  %16 = add nsw i32 %15, %12
  %17 = shl i64 %14, 32
  %18 = ashr exact i64 %17, 32
  %19 = tail call i64 @_Z15get_global_sizej(i32 0) #4
  %20 = zext i32 %3 to i64
  %21 = udiv i64 %19, %20
  %22 = mul i64 %18, %21
  %23 = add i64 %22, %13
  %24 = sext i32 %16 to i64
  %25 = getelementptr inbounds i32, i32* %1, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !7
  %27 = shl i64 %7, 32
  %28 = ashr exact i64 %27, 32
  %29 = getelementptr inbounds i32, i32* %2, i64 %28
  store i32 %26, i32* %29, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 1) #5
  %30 = icmp ugt i32 %3, 1
  br i1 %30, label %31, label %33

31:                                               ; preds = %6
  %32 = load i32, i32* %2, align 4, !tbaa !7
  br label %42

33:                                               ; preds = %53, %6
  %34 = add i32 %3, -1
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32* %2, i64 %35
  %37 = load i32, i32* %36, align 4, !tbaa !7
  %38 = shl i64 %23, 32
  %39 = ashr exact i64 %38, 32
  %40 = getelementptr inbounds i32, i32* %5, i64 %39
  store i32 %37, i32* %40, align 4, !tbaa !7
  %41 = icmp eq i32 %8, 0
  br i1 %41, label %62, label %57

42:                                               ; preds = %31, %53
  %43 = phi i32 [ %55, %53 ], [ 1, %31 ]
  %44 = phi i32 [ %54, %53 ], [ %32, %31 ]
  %45 = icmp sgt i32 %43, %8
  br i1 %45, label %53, label %46

46:                                               ; preds = %42
  %47 = sub nsw i32 %8, %43
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32* %2, i64 %48
  %50 = load i32, i32* %49, align 4, !tbaa !7
  %51 = load i32, i32* %29, align 4, !tbaa !7
  %52 = add i32 %51, %50
  br label %53

53:                                               ; preds = %42, %46
  %54 = phi i32 [ %52, %46 ], [ %44, %42 ]
  tail call void @_Z7barrierj(i32 1) #5
  store i32 %54, i32* %29, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 1) #5
  %55 = shl nsw i32 %43, 1
  %56 = icmp ult i32 %55, %3
  br i1 %56, label %42, label %33

57:                                               ; preds = %33
  %58 = add i64 %27, -4294967296
  %59 = ashr exact i64 %58, 32
  %60 = getelementptr inbounds i32, i32* %2, i64 %59
  %61 = load i32, i32* %60, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %33, %57
  %63 = phi i32 [ %61, %57 ], [ 0, %33 ]
  %64 = getelementptr inbounds i32, i32* %0, i64 %24
  store i32 %63, i32* %64, align 4
  ret void
}

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @ScanArraysdim1(i32* nocapture %0, i32* nocapture readonly %1, i32* nocapture %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !21 !kernel_arg_access_qual !4 !kernel_arg_type !22 !kernel_arg_base_type !22 !kernel_arg_type_qual !23 {
  %5 = tail call i64 @_Z12get_local_idj(i32 0) #4
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %8 = shl i64 %7, 32
  %9 = ashr exact i64 %8, 32
  %10 = getelementptr inbounds i32, i32* %1, i64 %9
  %11 = load i32, i32* %10, align 4, !tbaa !7
  %12 = shl i64 %5, 32
  %13 = ashr exact i64 %12, 32
  %14 = getelementptr inbounds i32, i32* %2, i64 %13
  store i32 %11, i32* %14, align 4, !tbaa !7
  %15 = icmp ugt i32 %3, 1
  br i1 %15, label %16, label %18

16:                                               ; preds = %4
  %17 = load i32, i32* %2, align 4, !tbaa !7
  br label %20

18:                                               ; preds = %31, %4
  %19 = icmp eq i32 %6, 0
  br i1 %19, label %40, label %35

20:                                               ; preds = %16, %31
  %21 = phi i32 [ %33, %31 ], [ 1, %16 ]
  %22 = phi i32 [ %32, %31 ], [ %17, %16 ]
  %23 = icmp sgt i32 %21, %6
  br i1 %23, label %31, label %24

24:                                               ; preds = %20
  %25 = sub nsw i32 %6, %21
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32* %2, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !7
  %29 = load i32, i32* %14, align 4, !tbaa !7
  %30 = add i32 %29, %28
  br label %31

31:                                               ; preds = %20, %24
  %32 = phi i32 [ %30, %24 ], [ %22, %20 ]
  tail call void @_Z7barrierj(i32 1) #5
  store i32 %32, i32* %14, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 1) #5
  %33 = shl nsw i32 %21, 1
  %34 = icmp ult i32 %33, %3
  br i1 %34, label %20, label %18

35:                                               ; preds = %18
  %36 = add i64 %12, -4294967296
  %37 = ashr exact i64 %36, 32
  %38 = getelementptr inbounds i32, i32* %2, i64 %37
  %39 = load i32, i32* %38, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %18, %35
  %41 = phi i32 [ %39, %35 ], [ 0, %18 ]
  %42 = getelementptr inbounds i32, i32* %0, i64 %9
  store i32 %41, i32* %42, align 4
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @prefixSum(i32* nocapture %0, i32* nocapture readonly %1, i32* nocapture %2, i32 %3) local_unnamed_addr #3 !kernel_arg_addr_space !24 !kernel_arg_access_qual !4 !kernel_arg_type !25 !kernel_arg_base_type !25 !kernel_arg_type_qual !23 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %6 = trunc i64 %5 to i32
  %7 = tail call i64 @_Z13get_global_idj(i32 1) #4
  %8 = trunc i64 %7 to i32
  %9 = mul nsw i32 %8, %3
  %10 = add nsw i32 %9, %6
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32* %0, i64 %11
  store i32 0, i32* %12, align 4, !tbaa !7
  %13 = icmp sgt i32 %6, 0
  br i1 %13, label %14, label %64

14:                                               ; preds = %4
  %15 = sext i32 %9 to i64
  %16 = and i64 %5, 4294967295
  %17 = add nsw i64 %16, -1
  %18 = and i64 %5, 3
  %19 = icmp ult i64 %17, 3
  br i1 %19, label %48, label %20

20:                                               ; preds = %14
  %21 = sub nsw i64 %16, %18
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %44, %22 ]
  %24 = phi i64 [ 0, %20 ], [ %45, %22 ]
  %25 = phi i64 [ %21, %20 ], [ %46, %22 ]
  %26 = add nsw i64 %24, %15
  %27 = getelementptr inbounds i32, i32* %1, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !7
  %29 = add i32 %23, %28
  store i32 %29, i32* %12, align 4, !tbaa !7
  %30 = or i64 %24, 1
  %31 = add nsw i64 %30, %15
  %32 = getelementptr inbounds i32, i32* %1, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !7
  %34 = add i32 %29, %33
  store i32 %34, i32* %12, align 4, !tbaa !7
  %35 = or i64 %24, 2
  %36 = add nsw i64 %35, %15
  %37 = getelementptr inbounds i32, i32* %1, i64 %36
  %38 = load i32, i32* %37, align 4, !tbaa !7
  %39 = add i32 %34, %38
  store i32 %39, i32* %12, align 4, !tbaa !7
  %40 = or i64 %24, 3
  %41 = add nsw i64 %40, %15
  %42 = getelementptr inbounds i32, i32* %1, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !7
  %44 = add i32 %39, %43
  store i32 %44, i32* %12, align 4, !tbaa !7
  %45 = add nuw nsw i64 %24, 4
  %46 = add i64 %25, -4
  %47 = icmp eq i64 %46, 0
  br i1 %47, label %48, label %22

48:                                               ; preds = %22, %14
  %49 = phi i32 [ undef, %14 ], [ %44, %22 ]
  %50 = phi i32 [ 0, %14 ], [ %44, %22 ]
  %51 = phi i64 [ 0, %14 ], [ %45, %22 ]
  %52 = icmp eq i64 %18, 0
  br i1 %52, label %64, label %53

53:                                               ; preds = %48, %53
  %54 = phi i32 [ %60, %53 ], [ %50, %48 ]
  %55 = phi i64 [ %61, %53 ], [ %51, %48 ]
  %56 = phi i64 [ %62, %53 ], [ %18, %48 ]
  %57 = add nsw i64 %55, %15
  %58 = getelementptr inbounds i32, i32* %1, i64 %57
  %59 = load i32, i32* %58, align 4, !tbaa !7
  %60 = add i32 %54, %59
  store i32 %60, i32* %12, align 4, !tbaa !7
  %61 = add nuw nsw i64 %55, 1
  %62 = add i64 %56, -1
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %64, label %53, !llvm.loop !26

64:                                               ; preds = %48, %53, %4
  %65 = phi i32 [ 0, %4 ], [ %49, %48 ], [ %60, %53 ]
  %66 = add nsw i32 %3, -1
  %67 = icmp eq i32 %66, %6
  br i1 %67, label %68, label %75

68:                                               ; preds = %64
  %69 = getelementptr inbounds i32, i32* %1, i64 %11
  %70 = load i32, i32* %69, align 4, !tbaa !7
  %71 = add i32 %70, %65
  %72 = shl i64 %7, 32
  %73 = ashr exact i64 %72, 32
  %74 = getelementptr inbounds i32, i32* %2, i64 %73
  store i32 %71, i32* %74, align 4, !tbaa !7
  br label %75

75:                                               ; preds = %68, %64
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @blockAddition(i32* nocapture readonly %0, i32* nocapture %1, i32 %2) local_unnamed_addr #3 !kernel_arg_addr_space !28 !kernel_arg_access_qual !29 !kernel_arg_type !30 !kernel_arg_base_type !30 !kernel_arg_type_qual !31 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %5 = trunc i64 %4 to i32
  %6 = tail call i64 @_Z13get_global_idj(i32 1) #4
  %7 = trunc i64 %6 to i32
  %8 = tail call i64 @_Z12get_group_idj(i32 0) #4
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z12get_group_idj(i32 1) #4
  %11 = trunc i64 %10 to i32
  %12 = shl i32 %5, 8
  %13 = add nsw i32 %12, %7
  %14 = mul i32 %11, %2
  %15 = add i32 %14, %9
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32* %0, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !7
  %19 = sext i32 %13 to i64
  %20 = getelementptr inbounds i32, i32* %1, i64 %19
  %21 = load i32, i32* %20, align 4, !tbaa !7
  %22 = add i32 %21, %18
  store i32 %22, i32* %20, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @FixOffset(i32* nocapture readonly %0, i32* nocapture %1) local_unnamed_addr #3 !kernel_arg_addr_space !32 !kernel_arg_access_qual !33 !kernel_arg_type !34 !kernel_arg_base_type !34 !kernel_arg_type_qual !35 {
  %3 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %4 = trunc i64 %3 to i32
  %5 = tail call i64 @_Z13get_global_idj(i32 1) #4
  %6 = trunc i64 %5 to i32
  %7 = shl i32 %4, 8
  %8 = add nsw i32 %7, %6
  %9 = shl i64 %5, 32
  %10 = ashr exact i64 %9, 32
  %11 = getelementptr inbounds i32, i32* %0, i64 %10
  %12 = load i32, i32* %11, align 4, !tbaa !7
  %13 = sext i32 %8 to i64
  %14 = getelementptr inbounds i32, i32* %1, i64 %13
  %15 = load i32, i32* %14, align 4, !tbaa !7
  %16 = add i32 %15, %12
  store i32 %16, i32* %14, align 4, !tbaa !7
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
!3 = !{i32 1, i32 1, i32 0, i32 3}
!4 = !{!"none", !"none", !"none", !"none"}
!5 = !{!"uint*", !"uint*", !"uint", !"uint*"}
!6 = !{!"const", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{i32 1, i32 1, i32 0, i32 3, i32 1}
!12 = !{!"none", !"none", !"none", !"none", !"none"}
!13 = !{!"uint*", !"uint*", !"uint", !"ushort*", !"uint*"}
!14 = !{!"const", !"const", !"", !"", !""}
!15 = !{!16, !16, i64 0}
!16 = !{!"short", !9, i64 0}
!17 = !{i32 1, i32 1, i32 3, i32 0, i32 0, i32 1}
!18 = !{!"none", !"none", !"none", !"none", !"none", !"none"}
!19 = !{!"uint*", !"uint*", !"uint*", !"uint", !"uint", !"uint*"}
!20 = !{!"", !"", !"", !"", !"", !""}
!21 = !{i32 1, i32 1, i32 3, i32 0}
!22 = !{!"uint*", !"uint*", !"uint*", !"uint"}
!23 = !{!"", !"", !"", !""}
!24 = !{i32 1, i32 1, i32 1, i32 0}
!25 = !{!"uint*", !"uint*", !"uint*", !"int"}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.unroll.disable"}
!28 = !{i32 1, i32 1, i32 0}
!29 = !{!"none", !"none", !"none"}
!30 = !{!"uint*", !"uint*", !"uint"}
!31 = !{!"", !"", !""}
!32 = !{i32 1, i32 1}
!33 = !{!"none", !"none"}
!34 = !{!"uint*", !"uint*"}
!35 = !{!"", !""}
