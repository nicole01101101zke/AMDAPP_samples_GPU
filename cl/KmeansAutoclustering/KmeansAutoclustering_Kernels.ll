; ModuleID = 'KmeansAutoclustering_Kernels.cl'
source_filename = "KmeansAutoclustering_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local void @atomicAddGlobal(float* %0, float %1) local_unnamed_addr #0 {
  %3 = bitcast float* %0 to i32*
  br label %4

4:                                                ; preds = %4, %2
  %5 = load volatile i32, i32* %3, align 4, !tbaa !3
  %6 = bitcast i32 %5 to float
  %7 = fadd float %6, %1
  %8 = bitcast float %7 to i32
  %9 = tail call i32 @_Z14atomic_cmpxchgPU8CLglobalVjjj(i32* nonnull %3, i32 %5, i32 %8) #6
  %10 = icmp eq i32 %9, %5
  br i1 %10, label %11, label %4

11:                                               ; preds = %4
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: convergent
declare dso_local i32 @_Z14atomic_cmpxchgPU8CLglobalVjjj(i32*, i32, i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: convergent nounwind uwtable
define dso_local void @atomicAddLocal(float* %0, float %1) local_unnamed_addr #0 {
  %3 = bitcast float* %0 to i32*
  br label %4

4:                                                ; preds = %4, %2
  %5 = load volatile i32, i32* %3, align 4, !tbaa !3
  %6 = bitcast i32 %5 to float
  %7 = fadd float %6, %1
  %8 = bitcast float %7 to i32
  %9 = tail call i32 @_Z14atomic_cmpxchgPU7CLlocalVjjj(i32* nonnull %3, i32 %5, i32 %8) #6
  %10 = icmp eq i32 %9, %5
  br i1 %10, label %11, label %4

11:                                               ; preds = %4
  ret void
}

; Function Attrs: convergent
declare dso_local i32 @_Z14atomic_cmpxchgPU7CLlocalVjjj(i32*, i32, i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @assignCentroid(<2 x float>* nocapture readonly %0, i32* nocapture %1, <2 x float>* nocapture readonly %2, <2 x float>* %3, i32* %4, <2 x float>* %5, i32* %6, i32 %7, i32 %8) local_unnamed_addr #3 !kernel_arg_addr_space !7 !kernel_arg_access_qual !8 !kernel_arg_type !9 !kernel_arg_base_type !10 !kernel_arg_type_qual !11 {
  %10 = tail call i64 @_Z13get_global_idj(i32 0) #7
  %11 = tail call i64 @_Z12get_local_idj(i32 0) #7
  %12 = trunc i64 %11 to i32
  %13 = icmp ult i32 %12, %7
  br i1 %13, label %14, label %18

14:                                               ; preds = %9
  %15 = and i64 %11, 4294967295
  %16 = getelementptr inbounds <2 x float>, <2 x float>* %5, i64 %15
  store <2 x float> zeroinitializer, <2 x float>* %16, align 8, !tbaa !12
  %17 = getelementptr inbounds i32, i32* %6, i64 %15
  store i32 0, i32* %17, align 4, !tbaa !3
  br label %18

18:                                               ; preds = %14, %9
  tail call void @_Z7barrierj(i32 1) #6
  %19 = and i64 %10, 4294967295
  %20 = getelementptr inbounds <2 x float>, <2 x float>* %0, i64 %19
  %21 = load <2 x float>, <2 x float>* %20, align 8, !tbaa !12
  %22 = icmp eq i32 %7, 0
  %23 = extractelement <2 x float> %21, i64 0
  br i1 %22, label %27, label %24

24:                                               ; preds = %18
  %25 = extractelement <2 x float> %21, i64 1
  %26 = zext i32 %7 to i64
  br label %58

27:                                               ; preds = %58, %18
  %28 = phi i32 [ 0, %18 ], [ %73, %58 ]
  %29 = getelementptr inbounds i32, i32* %1, i64 %19
  store i32 %28, i32* %29, align 4, !tbaa !3
  %30 = shl i32 %28, 1
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds <2 x float>, <2 x float>* %5, i64 0, i64 %31
  %33 = bitcast float* %32 to i32*
  br label %34

34:                                               ; preds = %34, %27
  %35 = load volatile i32, i32* %33, align 4, !tbaa !3
  %36 = bitcast i32 %35 to float
  %37 = fadd float %23, %36
  %38 = bitcast float %37 to i32
  %39 = tail call i32 @_Z14atomic_cmpxchgPU7CLlocalVjjj(i32* nonnull %33, i32 %35, i32 %38) #6
  %40 = icmp eq i32 %39, %35
  br i1 %40, label %41, label %34

41:                                               ; preds = %34
  %42 = or i32 %30, 1
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds <2 x float>, <2 x float>* %5, i64 0, i64 %43
  %45 = extractelement <2 x float> %21, i64 1
  %46 = bitcast float* %44 to i32*
  br label %47

47:                                               ; preds = %47, %41
  %48 = load volatile i32, i32* %46, align 4, !tbaa !3
  %49 = bitcast i32 %48 to float
  %50 = fadd float %45, %49
  %51 = bitcast float %50 to i32
  %52 = tail call i32 @_Z14atomic_cmpxchgPU7CLlocalVjjj(i32* nonnull %46, i32 %48, i32 %51) #6
  %53 = icmp eq i32 %52, %48
  br i1 %53, label %54, label %47

54:                                               ; preds = %47
  %55 = zext i32 %28 to i64
  %56 = getelementptr inbounds i32, i32* %6, i64 %55
  %57 = tail call i32 @_Z10atomic_incPU7CLlocalVj(i32* %56) #6
  tail call void @_Z7barrierj(i32 1) #6
  br i1 %13, label %76, label %109

58:                                               ; preds = %58, %24
  %59 = phi i64 [ 0, %24 ], [ %74, %58 ]
  %60 = phi float [ 0x47EFFFFFE0000000, %24 ], [ %70, %58 ]
  %61 = phi i32 [ 0, %24 ], [ %73, %58 ]
  %62 = getelementptr inbounds <2 x float>, <2 x float>* %2, i64 %59
  %63 = load <2 x float>, <2 x float>* %62, align 8
  %64 = extractelement <2 x float> %63, i64 0
  %65 = fsub float %23, %64
  %66 = extractelement <2 x float> %63, i64 1
  %67 = fsub float %25, %66
  %68 = fmul float %67, %67
  %69 = tail call float @llvm.fmuladd.f32(float %65, float %65, float %68)
  %70 = tail call float @_Z4fminff(float %60, float %69) #7
  %71 = fcmp oeq float %70, %69
  %72 = trunc i64 %59 to i32
  %73 = select i1 %71, i32 %72, i32 %61
  %74 = add nuw nsw i64 %59, 1
  %75 = icmp eq i64 %74, %26
  br i1 %75, label %27, label %58

76:                                               ; preds = %54
  %77 = shl i64 %11, 1
  %78 = and i64 %77, 4294967294
  %79 = getelementptr inbounds <2 x float>, <2 x float>* %3, i64 0, i64 %78
  %80 = and i64 %11, 4294967295
  %81 = getelementptr inbounds <2 x float>, <2 x float>* %5, i64 %80
  %82 = load <2 x float>, <2 x float>* %81, align 8
  %83 = extractelement <2 x float> %82, i64 0
  %84 = bitcast float* %79 to i32*
  br label %85

85:                                               ; preds = %85, %76
  %86 = load volatile i32, i32* %84, align 4, !tbaa !3
  %87 = bitcast i32 %86 to float
  %88 = fadd float %83, %87
  %89 = bitcast float %88 to i32
  %90 = tail call i32 @_Z14atomic_cmpxchgPU8CLglobalVjjj(i32* nonnull %84, i32 %86, i32 %89) #6
  %91 = icmp eq i32 %90, %86
  br i1 %91, label %92, label %85

92:                                               ; preds = %85
  %93 = getelementptr inbounds float, float* %79, i64 1
  %94 = load <2 x float>, <2 x float>* %81, align 8
  %95 = extractelement <2 x float> %94, i64 1
  %96 = bitcast float* %93 to i32*
  br label %97

97:                                               ; preds = %97, %92
  %98 = load volatile i32, i32* %96, align 4, !tbaa !3
  %99 = bitcast i32 %98 to float
  %100 = fadd float %95, %99
  %101 = bitcast float %100 to i32
  %102 = tail call i32 @_Z14atomic_cmpxchgPU8CLglobalVjjj(i32* nonnull %96, i32 %98, i32 %101) #6
  %103 = icmp eq i32 %102, %98
  br i1 %103, label %104, label %97

104:                                              ; preds = %97
  %105 = getelementptr inbounds i32, i32* %4, i64 %80
  %106 = getelementptr inbounds i32, i32* %6, i64 %80
  %107 = load i32, i32* %106, align 4, !tbaa !3
  %108 = tail call i32 @_Z10atomic_addPU8CLglobalVjj(i32* %105, i32 %107) #6
  br label %109

109:                                              ; preds = %104, %54
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #4

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #4

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #5

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z4fminff(float, float) local_unnamed_addr #4

; Function Attrs: convergent
declare dso_local i32 @_Z10atomic_incPU7CLlocalVj(i32*) local_unnamed_addr #2

; Function Attrs: convergent
declare dso_local i32 @_Z10atomic_addPU8CLglobalVjj(i32*, i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @computeSilhouettes(<2 x float>* nocapture readonly %0, <2 x float>* nocapture readnone %1, i32* nocapture readonly %2, i32* nocapture readonly %3, i32* nocapture %4, i32 %5, i32 %6, float* %7, float* %8) local_unnamed_addr #3 !kernel_arg_addr_space !13 !kernel_arg_access_qual !8 !kernel_arg_type !14 !kernel_arg_base_type !15 !kernel_arg_type_qual !11 {
  %10 = alloca [16 x float], align 16
  %11 = tail call i64 @_Z13get_global_idj(i32 0) #7
  %12 = tail call i64 @_Z12get_local_idj(i32 0) #7
  %13 = trunc i64 %12 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %9
  store float 0.000000e+00, float* %7, align 4, !tbaa !16
  br label %16

16:                                               ; preds = %15, %9
  %17 = icmp slt i32 %13, %5
  br i1 %17, label %18, label %24

18:                                               ; preds = %16
  %19 = shl i64 %12, 32
  %20 = ashr exact i64 %19, 32
  %21 = getelementptr inbounds i32, i32* %3, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !3
  %23 = getelementptr inbounds i32, i32* %4, i64 %20
  store i32 %22, i32* %23, align 4, !tbaa !3
  br label %24

24:                                               ; preds = %18, %16
  tail call void @_Z7barrierj(i32 1) #6
  %25 = bitcast [16 x float]* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %25) #8
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %25, i8 0, i64 64, i1 false)
  %26 = icmp sgt i32 %6, 0
  %27 = shl i64 %11, 32
  %28 = ashr exact i64 %27, 32
  br i1 %26, label %29, label %35

29:                                               ; preds = %24
  %30 = getelementptr inbounds <2 x float>, <2 x float>* %0, i64 %28
  %31 = load <2 x float>, <2 x float>* %30, align 8
  %32 = extractelement <2 x float> %31, i64 0
  %33 = extractelement <2 x float> %31, i64 1
  %34 = zext i32 %6 to i64
  br label %48

35:                                               ; preds = %48, %24
  %36 = getelementptr inbounds i32, i32* %2, i64 %28
  %37 = load i32, i32* %36, align 4, !tbaa !3
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds [16 x float], [16 x float]* %10, i64 0, i64 %38
  %40 = load float, float* %39, align 4, !tbaa !16
  %41 = getelementptr inbounds i32, i32* %4, i64 %38
  %42 = load i32, i32* %41, align 4, !tbaa !3
  %43 = sitofp i32 %42 to float
  %44 = fdiv float %40, %43, !fpmath !18
  %45 = icmp sgt i32 %5, 0
  br i1 %45, label %46, label %68

46:                                               ; preds = %35
  %47 = zext i32 %5 to i64
  br label %82

48:                                               ; preds = %48, %29
  %49 = phi i64 [ 0, %29 ], [ %66, %48 ]
  %50 = getelementptr inbounds <2 x float>, <2 x float>* %0, i64 %49
  %51 = load <2 x float>, <2 x float>* %50, align 8
  %52 = extractelement <2 x float> %51, i64 0
  %53 = fsub float %52, %32
  %54 = tail call float @_Z3powff(float %53, float 2.000000e+00) #7
  %55 = extractelement <2 x float> %51, i64 1
  %56 = fsub float %55, %33
  %57 = tail call float @_Z3powff(float %56, float 2.000000e+00) #7
  %58 = fadd float %54, %57
  %59 = tail call float @_Z4sqrtf(float %58) #7
  %60 = getelementptr inbounds i32, i32* %2, i64 %49
  %61 = load i32, i32* %60, align 4, !tbaa !3
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds [16 x float], [16 x float]* %10, i64 0, i64 %62
  %64 = load float, float* %63, align 4, !tbaa !16
  %65 = fadd float %59, %64
  store float %65, float* %63, align 4, !tbaa !16
  %66 = add nuw nsw i64 %49, 1
  %67 = icmp eq i64 %66, %34
  br i1 %67, label %35, label %48

68:                                               ; preds = %94, %35
  %69 = phi float [ 0x47EFFFFFE0000000, %35 ], [ %95, %94 ]
  %70 = fsub float %69, %44
  %71 = tail call float @_Z3maxff(float %44, float %69) #7
  %72 = fdiv float %70, %71, !fpmath !18
  %73 = bitcast float* %7 to i32*
  br label %74

74:                                               ; preds = %74, %68
  %75 = load volatile i32, i32* %73, align 4, !tbaa !3
  %76 = bitcast i32 %75 to float
  %77 = fadd float %72, %76
  %78 = bitcast float %77 to i32
  %79 = tail call i32 @_Z14atomic_cmpxchgPU7CLlocalVjjj(i32* nonnull %73, i32 %75, i32 %78) #6
  %80 = icmp eq i32 %79, %75
  br i1 %80, label %81, label %74

81:                                               ; preds = %74
  tail call void @_Z7barrierj(i32 1) #6
  br i1 %14, label %98, label %108

82:                                               ; preds = %94, %46
  %83 = phi i64 [ 0, %46 ], [ %96, %94 ]
  %84 = phi float [ 0x47EFFFFFE0000000, %46 ], [ %95, %94 ]
  %85 = icmp eq i64 %83, %38
  br i1 %85, label %94, label %86

86:                                               ; preds = %82
  %87 = getelementptr inbounds [16 x float], [16 x float]* %10, i64 0, i64 %83
  %88 = load float, float* %87, align 4, !tbaa !16
  %89 = getelementptr inbounds i32, i32* %4, i64 %83
  %90 = load i32, i32* %89, align 4, !tbaa !3
  %91 = sitofp i32 %90 to float
  %92 = fdiv float %88, %91, !fpmath !18
  %93 = tail call float @_Z3minff(float %84, float %92) #7
  br label %94

94:                                               ; preds = %82, %86
  %95 = phi float [ %93, %86 ], [ %84, %82 ]
  %96 = add nuw nsw i64 %83, 1
  %97 = icmp eq i64 %96, %47
  br i1 %97, label %68, label %82

98:                                               ; preds = %81
  %99 = load float, float* %7, align 4, !tbaa !16
  %100 = bitcast float* %8 to i32*
  br label %101

101:                                              ; preds = %101, %98
  %102 = load volatile i32, i32* %100, align 4, !tbaa !3
  %103 = bitcast i32 %102 to float
  %104 = fadd float %99, %103
  %105 = bitcast float %104 to i32
  %106 = tail call i32 @_Z14atomic_cmpxchgPU8CLglobalVjjj(i32* nonnull %100, i32 %102, i32 %105) #6
  %107 = icmp eq i32 %106, %102
  br i1 %107, label %108, label %101

108:                                              ; preds = %101, %81
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %25) #8
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z4sqrtf(float) local_unnamed_addr #4

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3powff(float, float) local_unnamed_addr #4

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3minff(float, float) local_unnamed_addr #4

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3maxff(float, float) local_unnamed_addr #4

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { convergent nounwind }
attributes #7 = { convergent nounwind readnone }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i32 1, i32 1, i32 1, i32 1, i32 1, i32 3, i32 3, i32 0, i32 0}
!8 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!9 = !{!"float2*", !"uint*", !"float2*", !"float2*", !"uint*", !"float2*", !"uint*", !"uint", !"uint"}
!10 = !{!"float __attribute__((ext_vector_type(2)))*", !"uint*", !"float __attribute__((ext_vector_type(2)))*", !"float __attribute__((ext_vector_type(2)))*", !"uint*", !"float __attribute__((ext_vector_type(2)))*", !"uint*", !"uint", !"uint"}
!11 = !{!"", !"", !"", !"", !"", !"", !"", !"", !""}
!12 = !{!5, !5, i64 0}
!13 = !{i32 1, i32 1, i32 1, i32 1, i32 3, i32 0, i32 0, i32 3, i32 1}
!14 = !{!"float2*", !"float2*", !"uint*", !"uint*", !"int*", !"int", !"int", !"float*", !"float*"}
!15 = !{!"float __attribute__((ext_vector_type(2)))*", !"float __attribute__((ext_vector_type(2)))*", !"uint*", !"uint*", !"int*", !"int", !"int", !"float*", !"float*"}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !5, i64 0}
!18 = !{float 2.500000e+00}
