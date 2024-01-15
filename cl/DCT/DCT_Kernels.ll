; ModuleID = '../AMDAPP_samples/cl/DCT/DCT_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/DCT/DCT_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @getIdx(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = mul i32 %4, %0
  %8 = add i32 %7, %2
  %9 = mul i32 %4, %1
  %10 = add i32 %9, %3
  %11 = mul i32 %10, %5
  %12 = add i32 %8, %11
  ret i32 %12
}

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @DCT(float* nocapture %0, float* nocapture readonly %1, float* nocapture readonly %2, float* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #1 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %9 = trunc i64 %8 to i32
  %10 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %11 = trunc i64 %10 to i32
  %12 = tail call i64 @_Z12get_group_idj(i32 0) #5
  %13 = tail call i64 @_Z12get_group_idj(i32 1) #5
  %14 = tail call i64 @_Z12get_local_idj(i32 0) #5
  %15 = trunc i64 %14 to i32
  %16 = tail call i64 @_Z12get_local_idj(i32 1) #5
  %17 = trunc i64 %16 to i32
  %18 = mul i32 %11, %4
  %19 = add i32 %18, %9
  %20 = icmp eq i32 %5, 0
  br i1 %20, label %56, label %21

21:                                               ; preds = %7
  %22 = trunc i64 %13 to i32
  %23 = trunc i64 %12 to i32
  %24 = icmp eq i32 %6, 0
  %25 = mul i32 %15, %5
  %26 = mul i32 %23, %5
  %27 = add i32 %26, %17
  %28 = mul i32 %22, %5
  %29 = zext i32 %5 to i64
  %30 = and i64 %29, 1
  %31 = icmp eq i32 %5, 1
  br i1 %31, label %36, label %32

32:                                               ; preds = %21
  %33 = sub nsw i64 %29, %30
  br label %70

34:                                               ; preds = %70
  %35 = trunc i64 %105 to i32
  br label %36

36:                                               ; preds = %34, %21
  %37 = phi float [ undef, %21 ], [ %104, %34 ]
  %38 = phi i32 [ 0, %21 ], [ %35, %34 ]
  %39 = phi float [ 0.000000e+00, %21 ], [ %104, %34 ]
  %40 = icmp eq i64 %30, 0
  br i1 %40, label %56, label %41

41:                                               ; preds = %36
  %42 = mul i32 %38, %5
  %43 = add i32 %42, %15
  %44 = add i32 %25, %38
  %45 = select i1 %24, i32 %43, i32 %44
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float* %2, i64 %46
  %48 = load float, float* %47, align 4, !tbaa !7
  %49 = add i32 %28, %38
  %50 = mul i32 %49, %4
  %51 = add i32 %27, %50
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float* %1, i64 %52
  %54 = load float, float* %53, align 4, !tbaa !7
  %55 = tail call float @llvm.fmuladd.f32(float %48, float %54, float %39)
  br label %56

56:                                               ; preds = %41, %36, %7
  %57 = phi float [ 0.000000e+00, %7 ], [ %37, %36 ], [ %55, %41 ]
  %58 = mul i32 %17, %5
  %59 = add i32 %58, %15
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float* %3, i64 %60
  store float %57, float* %61, align 4, !tbaa !7
  tail call void @_Z7barrierj(i32 1) #6
  br i1 %20, label %128, label %62

62:                                               ; preds = %56
  %63 = mul i32 %15, %5
  %64 = icmp eq i32 %6, 0
  %65 = zext i32 %5 to i64
  %66 = and i64 %65, 1
  %67 = icmp eq i32 %5, 1
  br i1 %67, label %110, label %68

68:                                               ; preds = %62
  %69 = sub nsw i64 %65, %66
  br label %132

70:                                               ; preds = %70, %32
  %71 = phi i64 [ 0, %32 ], [ %105, %70 ]
  %72 = phi float [ 0.000000e+00, %32 ], [ %104, %70 ]
  %73 = phi i64 [ %33, %32 ], [ %106, %70 ]
  %74 = trunc i64 %71 to i32
  %75 = add i32 %25, %74
  %76 = mul i32 %74, %5
  %77 = add i32 %76, %15
  %78 = select i1 %24, i32 %77, i32 %75
  %79 = add i32 %28, %74
  %80 = mul i32 %79, %4
  %81 = add i32 %27, %80
  %82 = zext i32 %78 to i64
  %83 = getelementptr inbounds float, float* %2, i64 %82
  %84 = load float, float* %83, align 4, !tbaa !7
  %85 = zext i32 %81 to i64
  %86 = getelementptr inbounds float, float* %1, i64 %85
  %87 = load float, float* %86, align 4, !tbaa !7
  %88 = tail call float @llvm.fmuladd.f32(float %84, float %87, float %72)
  %89 = trunc i64 %71 to i32
  %90 = or i32 %89, 1
  %91 = add i32 %25, %90
  %92 = mul i32 %90, %5
  %93 = add i32 %92, %15
  %94 = select i1 %24, i32 %93, i32 %91
  %95 = add i32 %28, %90
  %96 = mul i32 %95, %4
  %97 = add i32 %27, %96
  %98 = zext i32 %94 to i64
  %99 = getelementptr inbounds float, float* %2, i64 %98
  %100 = load float, float* %99, align 4, !tbaa !7
  %101 = zext i32 %97 to i64
  %102 = getelementptr inbounds float, float* %1, i64 %101
  %103 = load float, float* %102, align 4, !tbaa !7
  %104 = tail call float @llvm.fmuladd.f32(float %100, float %103, float %88)
  %105 = add nuw nsw i64 %71, 2
  %106 = add i64 %73, -2
  %107 = icmp eq i64 %106, 0
  br i1 %107, label %34, label %70

108:                                              ; preds = %132
  %109 = trunc i64 %163 to i32
  br label %110

110:                                              ; preds = %108, %62
  %111 = phi float [ undef, %62 ], [ %162, %108 ]
  %112 = phi i32 [ 0, %62 ], [ %109, %108 ]
  %113 = phi float [ 0.000000e+00, %62 ], [ %162, %108 ]
  %114 = icmp eq i64 %66, 0
  br i1 %114, label %128, label %115

115:                                              ; preds = %110
  %116 = add i32 %63, %112
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float* %3, i64 %117
  %119 = load float, float* %118, align 4, !tbaa !7
  %120 = mul i32 %112, %5
  %121 = add i32 %120, %17
  %122 = add i32 %58, %112
  %123 = select i1 %64, i32 %121, i32 %122
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float* %2, i64 %124
  %126 = load float, float* %125, align 4, !tbaa !7
  %127 = tail call float @llvm.fmuladd.f32(float %119, float %126, float %113)
  br label %128

128:                                              ; preds = %115, %110, %56
  %129 = phi float [ 0.000000e+00, %56 ], [ %111, %110 ], [ %127, %115 ]
  %130 = zext i32 %19 to i64
  %131 = getelementptr inbounds float, float* %0, i64 %130
  store float %129, float* %131, align 4, !tbaa !7
  ret void

132:                                              ; preds = %132, %68
  %133 = phi i64 [ 0, %68 ], [ %163, %132 ]
  %134 = phi float [ 0.000000e+00, %68 ], [ %162, %132 ]
  %135 = phi i64 [ %69, %68 ], [ %164, %132 ]
  %136 = trunc i64 %133 to i32
  %137 = add i32 %63, %136
  %138 = add i32 %58, %136
  %139 = mul i32 %136, %5
  %140 = add i32 %139, %17
  %141 = select i1 %64, i32 %140, i32 %138
  %142 = zext i32 %137 to i64
  %143 = getelementptr inbounds float, float* %3, i64 %142
  %144 = load float, float* %143, align 4, !tbaa !7
  %145 = zext i32 %141 to i64
  %146 = getelementptr inbounds float, float* %2, i64 %145
  %147 = load float, float* %146, align 4, !tbaa !7
  %148 = tail call float @llvm.fmuladd.f32(float %144, float %147, float %134)
  %149 = trunc i64 %133 to i32
  %150 = or i32 %149, 1
  %151 = add i32 %63, %150
  %152 = add i32 %58, %150
  %153 = mul i32 %150, %5
  %154 = add i32 %153, %17
  %155 = select i1 %64, i32 %154, i32 %152
  %156 = zext i32 %151 to i64
  %157 = getelementptr inbounds float, float* %3, i64 %156
  %158 = load float, float* %157, align 4, !tbaa !7
  %159 = zext i32 %155 to i64
  %160 = getelementptr inbounds float, float* %2, i64 %159
  %161 = load float, float* %160, align 4, !tbaa !7
  %162 = tail call float @llvm.fmuladd.f32(float %158, float %161, float %148)
  %163 = add nuw nsw i64 %133, 2
  %164 = add i64 %135, -2
  %165 = icmp eq i64 %164, 0
  br i1 %165, label %108, label %132
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_group_idj(i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z12get_local_idj(i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: convergent
declare dso_local void @_Z7barrierj(i32) local_unnamed_addr #4

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { convergent nounwind readnone }
attributes #6 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 1, i32 3, i32 0, i32 0, i32 0}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"float*", !"float*", !"float*", !"float*", !"uint", !"uint", !"uint"}
!6 = !{!"", !"", !"", !"", !"", !"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
