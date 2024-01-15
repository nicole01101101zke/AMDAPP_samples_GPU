; ModuleID = '../AMDAPP_samples/cl/GaussianNoiseGL/GaussianNoiseGL_Kernels2.cl'
source_filename = "../AMDAPP_samples/cl/GaussianNoiseGL/GaussianNoiseGL_Kernels2.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local float @ran1(i32 %0, i32* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i64 @_Z12get_local_idj(i32 0) #3
  %4 = trunc i64 %3 to i32
  %5 = shl i32 %4, 2
  %6 = sext i32 %5 to i64
  %7 = sdiv i32 %0, 127773
  %8 = mul nsw i32 %7, -127773
  %9 = add i32 %8, %0
  %10 = mul nsw i32 %9, 16807
  %11 = mul nsw i32 %7, -2836
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, 0
  %14 = add nsw i32 %12, 2147483647
  %15 = select i1 %13, i32 %14, i32 %12
  %16 = sdiv i32 %15, 127773
  %17 = mul nsw i32 %16, -127773
  %18 = add nsw i32 %17, %15
  %19 = mul nsw i32 %18, 16807
  %20 = mul nsw i32 %16, -2836
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, 0
  %23 = add nsw i32 %21, 2147483647
  %24 = select i1 %22, i32 %23, i32 %21
  %25 = or i64 %6, 3
  %26 = getelementptr inbounds i32, i32* %1, i64 %25
  store i32 %24, i32* %26, align 4, !tbaa !3
  %27 = sdiv i32 %24, 127773
  %28 = mul nsw i32 %27, -127773
  %29 = add nsw i32 %28, %24
  %30 = mul nsw i32 %29, 16807
  %31 = mul nsw i32 %27, -2836
  %32 = add i32 %30, %31
  %33 = icmp slt i32 %32, 0
  %34 = add nsw i32 %32, 2147483647
  %35 = select i1 %33, i32 %34, i32 %32
  %36 = or i64 %6, 2
  %37 = getelementptr inbounds i32, i32* %1, i64 %36
  store i32 %35, i32* %37, align 4, !tbaa !3
  %38 = sdiv i32 %35, 127773
  %39 = mul nsw i32 %38, -127773
  %40 = add nsw i32 %39, %35
  %41 = mul nsw i32 %40, 16807
  %42 = mul nsw i32 %38, -2836
  %43 = add i32 %41, %42
  %44 = icmp slt i32 %43, 0
  %45 = add nsw i32 %43, 2147483647
  %46 = select i1 %44, i32 %45, i32 %43
  %47 = or i64 %6, 1
  %48 = getelementptr inbounds i32, i32* %1, i64 %47
  store i32 %46, i32* %48, align 4, !tbaa !3
  %49 = sdiv i32 %46, 127773
  %50 = mul nsw i32 %49, -127773
  %51 = add nsw i32 %50, %46
  %52 = mul nsw i32 %51, 16807
  %53 = mul nsw i32 %49, -2836
  %54 = add i32 %52, %53
  %55 = icmp slt i32 %54, 0
  %56 = add nsw i32 %54, 2147483647
  %57 = select i1 %55, i32 %56, i32 %54
  %58 = getelementptr inbounds i32, i32* %1, i64 %6
  store i32 %57, i32* %58, align 4, !tbaa !3
  %59 = load i32, i32* %1, align 4, !tbaa !3
  %60 = sdiv i32 %59, 536870912
  %61 = add nsw i32 %60, %5
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32* %1, i64 %62
  %64 = load i32, i32* %63, align 4, !tbaa !3
  %65 = sitofp i32 %64 to double
  %66 = fmul double %65, 0x3E00000000200000
  %67 = fptrunc double %66 to float
  ret float %67
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone uwtable
define dso_local double @BoxMuller(double %0) local_unnamed_addr #2 {
  %2 = bitcast double %0 to <2 x float>
  %3 = extractelement <2 x float> %2, i64 0
  %4 = tail call float @_Z3logf(float %3) #3
  %5 = fmul float %4, -2.000000e+00
  %6 = tail call float @_Z4sqrtf(float %5) #3
  %7 = extractelement <2 x float> %2, i64 1
  %8 = fpext float %7 to double
  %9 = fmul double %8, 6.280000e+00
  %10 = fptrunc double %9 to float
  %11 = tail call float @_Z3sinf(float %10) #3
  %12 = fmul float %6, %11
  %13 = insertelement <2 x float> undef, float %12, i32 0
  %14 = tail call float @_Z3cosf(float %10) #3
  %15 = fmul float %6, %14
  %16 = insertelement <2 x float> %13, float %15, i32 1
  %17 = bitcast <2 x float> %16 to double
  ret double %17
}

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z4sqrtf(float) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3logf(float) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3sinf(float) local_unnamed_addr #1

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z3cosf(float) local_unnamed_addr #1

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
