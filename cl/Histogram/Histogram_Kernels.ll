; ModuleID = '../AMDAPP_samples/cl/Histogram/Histogram_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/Histogram/Histogram_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @histogram256_vector(<4 x i32>* nocapture readonly %0, i8* nocapture %1, i32* nocapture %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %5 = tail call i64 @_Z14get_local_sizej(i32 0) #3
  %6 = trunc i64 %4 to i32
  %7 = shl i32 %6, 2
  %8 = lshr i64 %4, 5
  %9 = bitcast i8* %1 to <4 x i8>*
  br label %18

10:                                               ; preds = %18
  %11 = tail call i64 @_Z12get_group_idj(i32 0) #3
  %12 = and i32 %7, 124
  %13 = trunc i64 %8 to i32
  tail call void @_Z7barrierj(i32 1) #4
  %14 = shl i64 %5, 5
  %15 = and i64 %14, 2305843009213693920
  %16 = mul i64 %15, %11
  %17 = add i64 %16, %4
  br label %44

18:                                               ; preds = %18, %3
  %19 = phi i64 [ 0, %3 ], [ %35, %18 ]
  %20 = mul i64 %5, %19
  %21 = add i64 %20, %4
  %22 = getelementptr inbounds <4 x i8>, <4 x i8>* %9, i64 %21
  store <4 x i8> zeroinitializer, <4 x i8>* %22, align 4, !tbaa !8
  %23 = or i64 %19, 1
  %24 = mul i64 %5, %23
  %25 = add i64 %24, %4
  %26 = getelementptr inbounds <4 x i8>, <4 x i8>* %9, i64 %25
  store <4 x i8> zeroinitializer, <4 x i8>* %26, align 4, !tbaa !8
  %27 = or i64 %19, 2
  %28 = mul i64 %5, %27
  %29 = add i64 %28, %4
  %30 = getelementptr inbounds <4 x i8>, <4 x i8>* %9, i64 %29
  store <4 x i8> zeroinitializer, <4 x i8>* %30, align 4, !tbaa !8
  %31 = or i64 %19, 3
  %32 = mul i64 %5, %31
  %33 = add i64 %32, %4
  %34 = getelementptr inbounds <4 x i8>, <4 x i8>* %9, i64 %33
  store <4 x i8> zeroinitializer, <4 x i8>* %34, align 4, !tbaa !8
  %35 = add nuw nsw i64 %19, 4
  %36 = icmp eq i64 %35, 64
  br i1 %36, label %10, label %18

37:                                               ; preds = %44
  tail call void @_Z7barrierj(i32 1) #4
  %38 = udiv i64 256, %5
  %39 = icmp ult i64 %5, 257
  br i1 %39, label %40, label %84

40:                                               ; preds = %37
  %41 = shl i32 %6, 5
  %42 = shl i64 %11, 8
  %43 = add i64 %42, %4
  br label %85

44:                                               ; preds = %44, %10
  %45 = phi i64 [ 0, %10 ], [ %82, %44 ]
  %46 = mul i64 %5, %45
  %47 = add i64 %17, %46
  %48 = getelementptr inbounds <4 x i32>, <4 x i32>* %0, i64 %47
  %49 = load <4 x i32>, <4 x i32>* %48, align 16, !tbaa !8
  %50 = extractelement <4 x i32> %49, i64 0
  %51 = shl i32 %50, 7
  %52 = or i32 %51, %12
  %53 = add i32 %52, %13
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8* %1, i64 %54
  %56 = load i8, i8* %55, align 1, !tbaa !8
  %57 = add i8 %56, 1
  store i8 %57, i8* %55, align 1, !tbaa !8
  %58 = extractelement <4 x i32> %49, i64 1
  %59 = shl i32 %58, 7
  %60 = or i32 %59, %12
  %61 = add i32 %60, %13
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %1, i64 %62
  %64 = load i8, i8* %63, align 1, !tbaa !8
  %65 = add i8 %64, 1
  store i8 %65, i8* %63, align 1, !tbaa !8
  %66 = extractelement <4 x i32> %49, i64 2
  %67 = shl i32 %66, 7
  %68 = or i32 %67, %12
  %69 = add i32 %68, %13
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %1, i64 %70
  %72 = load i8, i8* %71, align 1, !tbaa !8
  %73 = add i8 %72, 1
  store i8 %73, i8* %71, align 1, !tbaa !8
  %74 = extractelement <4 x i32> %49, i64 3
  %75 = shl i32 %74, 7
  %76 = or i32 %75, %12
  %77 = add i32 %76, %13
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8* %1, i64 %78
  %80 = load i8, i8* %79, align 1, !tbaa !8
  %81 = add i8 %80, 1
  store i8 %81, i8* %79, align 1, !tbaa !8
  %82 = add nuw nsw i64 %45, 1
  %83 = icmp eq i64 %82, 32
  br i1 %83, label %37, label %44

84:                                               ; preds = %90, %37
  ret void

85:                                               ; preds = %40, %90
  %86 = phi i64 [ 0, %40 ], [ %101, %90 ]
  %87 = trunc i64 %86 to i32
  %88 = shl i32 %87, 12
  %89 = add i32 %88, %41
  br label %103

90:                                               ; preds = %103
  %91 = extractelement <4 x i32> %114, i64 0
  %92 = extractelement <4 x i32> %114, i64 1
  %93 = add i32 %91, %92
  %94 = extractelement <4 x i32> %114, i64 2
  %95 = add i32 %93, %94
  %96 = extractelement <4 x i32> %114, i64 3
  %97 = add i32 %95, %96
  %98 = mul i64 %86, %5
  %99 = add i64 %43, %98
  %100 = getelementptr inbounds i32, i32* %2, i64 %99
  store i32 %97, i32* %100, align 4, !tbaa !11
  %101 = add nuw nsw i64 %86, 1
  %102 = icmp ugt i64 %38, %101
  br i1 %102, label %85, label %84

103:                                              ; preds = %103, %85
  %104 = phi i32 [ 0, %85 ], [ %115, %103 ]
  %105 = phi <4 x i32> [ zeroinitializer, %85 ], [ %114, %103 ]
  %106 = add i32 %104, %6
  %107 = and i32 %106, 31
  %108 = or i32 %107, %89
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds <4 x i8>, <4 x i8>* %9, i64 %109
  %111 = bitcast <4 x i8>* %110 to i32*
  %112 = load i32, i32* %111, align 4, !tbaa !8
  %113 = tail call <4 x i32> @_Z13convert_uint4Dv4_h(i32 %112) #3
  %114 = add <4 x i32> %113, %105
  %115 = add nuw nsw i32 %104, 1
  %116 = icmp eq i32 %115, 32
  br i1 %116, label %90, label %103
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x i32> @_Z13convert_uint4Dv4_h(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @histogram256_scalar(i32* nocapture readonly %0, i8* nocapture %1, i32* nocapture %2) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !13 !kernel_arg_base_type !13 !kernel_arg_type_qual !7 {
  %4 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %5 = tail call i64 @_Z14get_local_sizej(i32 0) #3
  %6 = trunc i64 %4 to i32
  %7 = shl i32 %6, 2
  %8 = lshr i64 %4, 5
  %9 = bitcast i8* %1 to <4 x i8>*
  br label %15

10:                                               ; preds = %15
  %11 = tail call i64 @_Z12get_group_idj(i32 0) #3
  %12 = and i32 %7, 124
  %13 = trunc i64 %8 to i32
  tail call void @_Z7barrierj(i32 1) #4
  %14 = shl i64 %11, 7
  br label %41

15:                                               ; preds = %15, %3
  %16 = phi i64 [ 0, %3 ], [ %32, %15 ]
  %17 = mul i64 %5, %16
  %18 = add i64 %17, %4
  %19 = getelementptr inbounds <4 x i8>, <4 x i8>* %9, i64 %18
  store <4 x i8> zeroinitializer, <4 x i8>* %19, align 4, !tbaa !8
  %20 = or i64 %16, 1
  %21 = mul i64 %5, %20
  %22 = add i64 %21, %4
  %23 = getelementptr inbounds <4 x i8>, <4 x i8>* %9, i64 %22
  store <4 x i8> zeroinitializer, <4 x i8>* %23, align 4, !tbaa !8
  %24 = or i64 %16, 2
  %25 = mul i64 %5, %24
  %26 = add i64 %25, %4
  %27 = getelementptr inbounds <4 x i8>, <4 x i8>* %9, i64 %26
  store <4 x i8> zeroinitializer, <4 x i8>* %27, align 4, !tbaa !8
  %28 = or i64 %16, 3
  %29 = mul i64 %5, %28
  %30 = add i64 %29, %4
  %31 = getelementptr inbounds <4 x i8>, <4 x i8>* %9, i64 %30
  store <4 x i8> zeroinitializer, <4 x i8>* %31, align 4, !tbaa !8
  %32 = add nuw nsw i64 %16, 4
  %33 = icmp eq i64 %32, 64
  br i1 %33, label %10, label %15

34:                                               ; preds = %41
  tail call void @_Z7barrierj(i32 1) #4
  %35 = udiv i64 256, %5
  %36 = icmp ult i64 %5, 257
  br i1 %36, label %37, label %70

37:                                               ; preds = %34
  %38 = shl i32 %6, 5
  %39 = shl i64 %11, 8
  %40 = add i64 %39, %4
  br label %71

41:                                               ; preds = %41, %10
  %42 = phi i64 [ 0, %10 ], [ %68, %41 ]
  %43 = add nuw nsw i64 %14, %42
  %44 = mul i64 %43, %5
  %45 = add i64 %44, %4
  %46 = getelementptr inbounds i32, i32* %0, i64 %45
  %47 = load i32, i32* %46, align 4, !tbaa !11
  %48 = shl i32 %47, 7
  %49 = or i32 %48, %12
  %50 = add i32 %49, %13
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %1, i64 %51
  %53 = load i8, i8* %52, align 1, !tbaa !8
  %54 = add i8 %53, 1
  store i8 %54, i8* %52, align 1, !tbaa !8
  %55 = or i64 %42, 1
  %56 = add nuw nsw i64 %14, %55
  %57 = mul i64 %56, %5
  %58 = add i64 %57, %4
  %59 = getelementptr inbounds i32, i32* %0, i64 %58
  %60 = load i32, i32* %59, align 4, !tbaa !11
  %61 = shl i32 %60, 7
  %62 = or i32 %61, %12
  %63 = add i32 %62, %13
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8* %1, i64 %64
  %66 = load i8, i8* %65, align 1, !tbaa !8
  %67 = add i8 %66, 1
  store i8 %67, i8* %65, align 1, !tbaa !8
  %68 = add nuw nsw i64 %42, 2
  %69 = icmp eq i64 %68, 128
  br i1 %69, label %34, label %41

70:                                               ; preds = %76, %34
  ret void

71:                                               ; preds = %37, %76
  %72 = phi i64 [ 0, %37 ], [ %87, %76 ]
  %73 = trunc i64 %72 to i32
  %74 = shl i32 %73, 12
  %75 = add i32 %74, %38
  br label %89

76:                                               ; preds = %89
  %77 = extractelement <4 x i32> %100, i64 0
  %78 = extractelement <4 x i32> %100, i64 1
  %79 = add i32 %77, %78
  %80 = extractelement <4 x i32> %100, i64 2
  %81 = add i32 %79, %80
  %82 = extractelement <4 x i32> %100, i64 3
  %83 = add i32 %81, %82
  %84 = mul i64 %72, %5
  %85 = add i64 %40, %84
  %86 = getelementptr inbounds i32, i32* %2, i64 %85
  store i32 %83, i32* %86, align 4, !tbaa !11
  %87 = add nuw nsw i64 %72, 1
  %88 = icmp ugt i64 %35, %87
  br i1 %88, label %71, label %70

89:                                               ; preds = %89, %71
  %90 = phi i32 [ 0, %71 ], [ %101, %89 ]
  %91 = phi <4 x i32> [ zeroinitializer, %71 ], [ %100, %89 ]
  %92 = add i32 %90, %6
  %93 = and i32 %92, 31
  %94 = or i32 %93, %75
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds <4 x i8>, <4 x i8>* %9, i64 %95
  %97 = bitcast <4 x i8>* %96 to i32*
  %98 = load i32, i32* %97, align 4, !tbaa !8
  %99 = tail call <4 x i32> @_Z13convert_uint4Dv4_h(i32 %98) #3
  %100 = add <4 x i32> %99, %91
  %101 = add nuw nsw i32 %90, 1
  %102 = icmp eq i32 %101, 32
  br i1 %102, label %76, label %89
}

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!3 = !{i32 1, i32 3, i32 1}
!4 = !{!"none", !"none", !"none"}
!5 = !{!"uint4*", !"uchar*", !"uint*"}
!6 = !{!"uint __attribute__((ext_vector_type(4)))*", !"uchar*", !"uint*"}
!7 = !{!"const", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = !{!"uint*", !"uchar*", !"uint*"}
