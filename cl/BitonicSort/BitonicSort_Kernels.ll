; ModuleID = '../AMDAPP_samples/cl/BitonicSort/BitonicSort_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/BitonicSort/BitonicSort_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @bitonicSort(i32* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %5 = tail call i64 @_Z13get_global_idj(i32 0) #2
  %6 = trunc i64 %5 to i32
  %7 = sub i32 %1, %2
  %8 = and i32 %7, 31
  %9 = shl nuw i32 1, %8
  %10 = shl i32 %9, 1
  %11 = add i32 %9, -1
  %12 = and i32 %11, %6
  %13 = lshr i32 %6, %8
  %14 = mul i32 %10, %13
  %15 = add i32 %14, %12
  %16 = add i32 %15, %9
  %17 = zext i32 %15 to i64
  %18 = getelementptr inbounds i32, i32* %0, i64 %17
  %19 = load i32, i32* %18, align 4, !tbaa !7
  %20 = zext i32 %16 to i64
  %21 = getelementptr inbounds i32, i32* %0, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !7
  %23 = and i32 %1, 31
  %24 = shl nuw i32 1, %23
  %25 = and i32 %24, %6
  %26 = icmp eq i32 %25, 0
  %27 = sub i32 1, %3
  %28 = select i1 %26, i32 %3, i32 %27
  %29 = icmp ugt i32 %19, %22
  %30 = select i1 %29, i32 %19, i32 %22
  %31 = select i1 %29, i32 %22, i32 %19
  %32 = icmp eq i32 %28, 0
  %33 = select i1 %32, i32 %30, i32 %31
  %34 = select i1 %32, i32 %31, i32 %30
  store i32 %33, i32* %18, align 4, !tbaa !7
  store i32 %34, i32* %21, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind readnone }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none"}
!5 = !{!"uint*", !"uint", !"uint", !"uint"}
!6 = !{!"", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
