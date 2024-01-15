; ModuleID = '../AMDAPP_samples/cl/URNG/URNG_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/URNG/URNG_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@noise_uniform.iv = internal unnamed_addr global [1024 x i32] undef, align 16

; Function Attrs: convergent nofree nounwind uwtable
define dso_local float @ran1(i32 %0, i32* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %4 = tail call i64 @_Z12get_local_idj(i32 1) #3
  %5 = tail call i64 @_Z14get_local_sizej(i32 0) #3
  %6 = mul i64 %5, %4
  %7 = add i64 %6, %3
  %8 = trunc i64 %7 to i32
  %9 = shl i32 %8, 4
  %10 = sext i32 %9 to i64
  br label %11

11:                                               ; preds = %27, %2
  %12 = phi i64 [ 16, %2 ], [ %28, %27 ]
  %13 = phi i32 [ %0, %2 ], [ %22, %27 ]
  %14 = sdiv i32 %13, 127773
  %15 = mul nsw i32 %14, -127773
  %16 = add i32 %15, %13
  %17 = mul nsw i32 %16, 16807
  %18 = mul nsw i32 %14, -2836
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, 0
  %21 = add nsw i32 %19, 2147483647
  %22 = select i1 %20, i32 %21, i32 %19
  %23 = icmp ult i64 %12, 16
  br i1 %23, label %24, label %27

24:                                               ; preds = %11
  %25 = add nsw i64 %12, %10
  %26 = getelementptr inbounds i32, i32* %1, i64 %25
  store i32 %22, i32* %26, align 4, !tbaa !3
  br label %27

27:                                               ; preds = %11, %24
  %28 = add nsw i64 %12, -1
  %29 = icmp eq i64 %12, 0
  br i1 %29, label %30, label %11

30:                                               ; preds = %27
  %31 = getelementptr inbounds i32, i32* %1, i64 %10
  %32 = load i32, i32* %31, align 4, !tbaa !3
  %33 = sdiv i32 %32, 134217728
  %34 = add nsw i32 %33, %9
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32* %1, i64 %35
  %37 = load i32, i32* %36, align 4, !tbaa !3
  %38 = sitofp i32 %37 to float
  %39 = fmul float %38, 0x3E00000000000000
  ret float %39
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z14get_local_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @noise_uniform(<4 x i8>* nocapture readonly %0, <4 x i8>* nocapture %1, i32 %2) local_unnamed_addr #2 !kernel_arg_addr_space !7 !kernel_arg_access_qual !8 !kernel_arg_type !9 !kernel_arg_base_type !10 !kernel_arg_type_qual !11 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %5 = tail call i64 @_Z13get_global_idj(i32 1) #3
  %6 = tail call i64 @_Z15get_global_sizej(i32 0) #3
  %7 = mul i64 %6, %5
  %8 = add i64 %7, %4
  %9 = shl i64 %8, 32
  %10 = ashr exact i64 %9, 32
  %11 = getelementptr inbounds <4 x i8>, <4 x i8>* %0, i64 %10
  %12 = bitcast <4 x i8>* %11 to i32*
  %13 = load i32, i32* %12, align 4, !tbaa !12
  %14 = tail call <4 x float> @_Z14convert_float4Dv4_h(i32 %13) #3
  %15 = extractelement <4 x float> %14, i64 0
  %16 = extractelement <4 x float> %14, i64 1
  %17 = fadd float %15, %16
  %18 = extractelement <4 x float> %14, i64 2
  %19 = fadd float %18, %17
  %20 = fadd float %16, %19
  %21 = fmul float %20, -2.500000e-01
  %22 = fptosi float %21 to i32
  %23 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %24 = tail call i64 @_Z12get_local_idj(i32 1) #3
  %25 = tail call i64 @_Z14get_local_sizej(i32 0) #3
  %26 = mul i64 %25, %24
  %27 = add i64 %26, %23
  %28 = trunc i64 %27 to i32
  %29 = shl i32 %28, 4
  %30 = sext i32 %29 to i64
  br label %31

31:                                               ; preds = %47, %3
  %32 = phi i64 [ 16, %3 ], [ %48, %47 ]
  %33 = phi i32 [ %22, %3 ], [ %42, %47 ]
  %34 = sdiv i32 %33, 127773
  %35 = mul nsw i32 %34, -127773
  %36 = add i32 %35, %33
  %37 = mul nsw i32 %36, 16807
  %38 = mul nsw i32 %34, -2836
  %39 = add i32 %37, %38
  %40 = icmp slt i32 %39, 0
  %41 = add nsw i32 %39, 2147483647
  %42 = select i1 %40, i32 %41, i32 %39
  %43 = icmp ult i64 %32, 16
  br i1 %43, label %44, label %47

44:                                               ; preds = %31
  %45 = add nsw i64 %32, %30
  %46 = getelementptr inbounds [1024 x i32], [1024 x i32]* @noise_uniform.iv, i64 0, i64 %45
  store i32 %42, i32* %46, align 4, !tbaa !3
  br label %47

47:                                               ; preds = %44, %31
  %48 = add nsw i64 %32, -1
  %49 = icmp eq i64 %32, 0
  br i1 %49, label %50, label %31

50:                                               ; preds = %47
  %51 = getelementptr inbounds [1024 x i32], [1024 x i32]* @noise_uniform.iv, i64 0, i64 %30
  %52 = load i32, i32* %51, align 16, !tbaa !3
  %53 = sdiv i32 %52, 134217728
  %54 = add nsw i32 %53, %29
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [1024 x i32], [1024 x i32]* @noise_uniform.iv, i64 0, i64 %55
  %57 = load i32, i32* %56, align 4, !tbaa !3
  %58 = sitofp i32 %57 to float
  %59 = fmul float %58, 0x3E00000000000000
  %60 = fadd float %59, 0xBFE19999A0000000
  %61 = sitofp i32 %2 to float
  %62 = fmul float %60, %61
  %63 = insertelement <4 x float> undef, float %62, i32 0
  %64 = shufflevector <4 x float> %63, <4 x float> undef, <4 x i32> zeroinitializer
  %65 = fadd <4 x float> %14, %64
  %66 = tail call i32 @_Z18convert_uchar4_satDv4_f(<4 x float> %65) #3
  %67 = getelementptr inbounds <4 x i8>, <4 x i8>* %1, i64 %10
  %68 = bitcast <4 x i8>* %67 to i32*
  store i32 %66, i32* %68, align 4, !tbaa !12
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local <4 x float> @_Z14convert_float4Dv4_h(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local i32 @_Z18convert_uchar4_satDv4_f(<4 x float>) local_unnamed_addr #1

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind readnone }

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
!7 = !{i32 1, i32 1, i32 0}
!8 = !{!"none", !"none", !"none"}
!9 = !{!"uchar4*", !"uchar4*", !"int"}
!10 = !{!"uchar __attribute__((ext_vector_type(4)))*", !"uchar __attribute__((ext_vector_type(4)))*", !"int"}
!11 = !{!"", !"", !""}
!12 = !{!5, !5, i64 0}
