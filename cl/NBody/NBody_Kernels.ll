; ModuleID = '../AMDAPP_samples/cl/NBody/NBody_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/NBody/NBody_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: convergent nofree nounwind uwtable
define dso_local spir_kernel void @nbody_sim(<4 x float>* nocapture readonly %0, <4 x float>* nocapture readonly %1, i32 %2, float %3, float %4, <4 x float>* nocapture %5, <4 x float>* nocapture %6) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %8 = tail call i64 @_Z13get_global_idj(i32 0) #3
  %9 = and i64 %8, 4294967295
  %10 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %9
  %11 = load <4 x float>, <4 x float>* %10, align 16, !tbaa !8
  %12 = icmp sgt i32 %2, 8
  br i1 %12, label %13, label %194

13:                                               ; preds = %7, %13
  %14 = phi <4 x float> [ %187, %13 ], [ zeroinitializer, %7 ]
  %15 = phi i64 [ %188, %13 ], [ 0, %7 ]
  %16 = shl i64 %15, 32
  %17 = ashr exact i64 %16, 32
  %18 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %17
  %19 = load <4 x float>, <4 x float>* %18, align 16, !tbaa !8
  %20 = fsub <4 x float> %19, %11
  %21 = shufflevector <4 x float> %20, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %22 = extractelement <4 x float> %20, i32 0
  %23 = extractelement <4 x float> %20, i32 1
  %24 = fmul float %23, %23
  %25 = tail call float @llvm.fmuladd.f32(float %22, float %22, float %24)
  %26 = extractelement <4 x float> %20, i32 2
  %27 = tail call float @llvm.fmuladd.f32(float %26, float %26, float %25)
  %28 = fadd float %27, %4
  %29 = tail call float @_Z4sqrtf(float %28) #3
  %30 = fdiv float 1.000000e+00, %29, !fpmath !11
  %31 = fmul float %30, %30
  %32 = fmul float %30, %31
  %33 = extractelement <4 x float> %19, i64 3
  %34 = fmul float %33, %32
  %35 = insertelement <3 x float> undef, float %34, i32 0
  %36 = shufflevector <3 x float> %35, <3 x float> undef, <3 x i32> zeroinitializer
  %37 = shufflevector <4 x float> %14, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %38 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %36, <3 x float> %21, <3 x float> %37)
  %39 = add nsw i64 %17, 1
  %40 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %39
  %41 = load <4 x float>, <4 x float>* %40, align 16, !tbaa !8
  %42 = fsub <4 x float> %41, %11
  %43 = shufflevector <4 x float> %42, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %44 = extractelement <4 x float> %42, i32 0
  %45 = extractelement <4 x float> %42, i32 1
  %46 = fmul float %45, %45
  %47 = tail call float @llvm.fmuladd.f32(float %44, float %44, float %46)
  %48 = extractelement <4 x float> %42, i32 2
  %49 = tail call float @llvm.fmuladd.f32(float %48, float %48, float %47)
  %50 = fadd float %49, %4
  %51 = tail call float @_Z4sqrtf(float %50) #3
  %52 = fdiv float 1.000000e+00, %51, !fpmath !11
  %53 = fmul float %52, %52
  %54 = fmul float %52, %53
  %55 = extractelement <4 x float> %41, i64 3
  %56 = fmul float %55, %54
  %57 = insertelement <3 x float> undef, float %56, i32 0
  %58 = shufflevector <3 x float> %57, <3 x float> undef, <3 x i32> zeroinitializer
  %59 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %58, <3 x float> %43, <3 x float> %38)
  %60 = add nsw i64 %17, 2
  %61 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %60
  %62 = load <4 x float>, <4 x float>* %61, align 16, !tbaa !8
  %63 = fsub <4 x float> %62, %11
  %64 = shufflevector <4 x float> %63, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %65 = extractelement <4 x float> %63, i32 0
  %66 = extractelement <4 x float> %63, i32 1
  %67 = fmul float %66, %66
  %68 = tail call float @llvm.fmuladd.f32(float %65, float %65, float %67)
  %69 = extractelement <4 x float> %63, i32 2
  %70 = tail call float @llvm.fmuladd.f32(float %69, float %69, float %68)
  %71 = fadd float %70, %4
  %72 = tail call float @_Z4sqrtf(float %71) #3
  %73 = fdiv float 1.000000e+00, %72, !fpmath !11
  %74 = fmul float %73, %73
  %75 = fmul float %73, %74
  %76 = extractelement <4 x float> %62, i64 3
  %77 = fmul float %76, %75
  %78 = insertelement <3 x float> undef, float %77, i32 0
  %79 = shufflevector <3 x float> %78, <3 x float> undef, <3 x i32> zeroinitializer
  %80 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %79, <3 x float> %64, <3 x float> %59)
  %81 = add nsw i64 %17, 3
  %82 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %81
  %83 = load <4 x float>, <4 x float>* %82, align 16, !tbaa !8
  %84 = fsub <4 x float> %83, %11
  %85 = shufflevector <4 x float> %84, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %86 = extractelement <4 x float> %84, i32 0
  %87 = extractelement <4 x float> %84, i32 1
  %88 = fmul float %87, %87
  %89 = tail call float @llvm.fmuladd.f32(float %86, float %86, float %88)
  %90 = extractelement <4 x float> %84, i32 2
  %91 = tail call float @llvm.fmuladd.f32(float %90, float %90, float %89)
  %92 = fadd float %91, %4
  %93 = tail call float @_Z4sqrtf(float %92) #3
  %94 = fdiv float 1.000000e+00, %93, !fpmath !11
  %95 = fmul float %94, %94
  %96 = fmul float %94, %95
  %97 = extractelement <4 x float> %83, i64 3
  %98 = fmul float %97, %96
  %99 = insertelement <3 x float> undef, float %98, i32 0
  %100 = shufflevector <3 x float> %99, <3 x float> undef, <3 x i32> zeroinitializer
  %101 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %100, <3 x float> %85, <3 x float> %80)
  %102 = add nsw i64 %17, 4
  %103 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %102
  %104 = load <4 x float>, <4 x float>* %103, align 16, !tbaa !8
  %105 = fsub <4 x float> %104, %11
  %106 = shufflevector <4 x float> %105, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %107 = extractelement <4 x float> %105, i32 0
  %108 = extractelement <4 x float> %105, i32 1
  %109 = fmul float %108, %108
  %110 = tail call float @llvm.fmuladd.f32(float %107, float %107, float %109)
  %111 = extractelement <4 x float> %105, i32 2
  %112 = tail call float @llvm.fmuladd.f32(float %111, float %111, float %110)
  %113 = fadd float %112, %4
  %114 = tail call float @_Z4sqrtf(float %113) #3
  %115 = fdiv float 1.000000e+00, %114, !fpmath !11
  %116 = fmul float %115, %115
  %117 = fmul float %115, %116
  %118 = extractelement <4 x float> %104, i64 3
  %119 = fmul float %118, %117
  %120 = insertelement <3 x float> undef, float %119, i32 0
  %121 = shufflevector <3 x float> %120, <3 x float> undef, <3 x i32> zeroinitializer
  %122 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %121, <3 x float> %106, <3 x float> %101)
  %123 = add nsw i64 %17, 5
  %124 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %123
  %125 = load <4 x float>, <4 x float>* %124, align 16, !tbaa !8
  %126 = fsub <4 x float> %125, %11
  %127 = shufflevector <4 x float> %126, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %128 = extractelement <4 x float> %126, i32 0
  %129 = extractelement <4 x float> %126, i32 1
  %130 = fmul float %129, %129
  %131 = tail call float @llvm.fmuladd.f32(float %128, float %128, float %130)
  %132 = extractelement <4 x float> %126, i32 2
  %133 = tail call float @llvm.fmuladd.f32(float %132, float %132, float %131)
  %134 = fadd float %133, %4
  %135 = tail call float @_Z4sqrtf(float %134) #3
  %136 = fdiv float 1.000000e+00, %135, !fpmath !11
  %137 = fmul float %136, %136
  %138 = fmul float %136, %137
  %139 = extractelement <4 x float> %125, i64 3
  %140 = fmul float %139, %138
  %141 = insertelement <3 x float> undef, float %140, i32 0
  %142 = shufflevector <3 x float> %141, <3 x float> undef, <3 x i32> zeroinitializer
  %143 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %142, <3 x float> %127, <3 x float> %122)
  %144 = add nsw i64 %17, 6
  %145 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %144
  %146 = load <4 x float>, <4 x float>* %145, align 16, !tbaa !8
  %147 = fsub <4 x float> %146, %11
  %148 = shufflevector <4 x float> %147, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %149 = extractelement <4 x float> %147, i32 0
  %150 = extractelement <4 x float> %147, i32 1
  %151 = fmul float %150, %150
  %152 = tail call float @llvm.fmuladd.f32(float %149, float %149, float %151)
  %153 = extractelement <4 x float> %147, i32 2
  %154 = tail call float @llvm.fmuladd.f32(float %153, float %153, float %152)
  %155 = fadd float %154, %4
  %156 = tail call float @_Z4sqrtf(float %155) #3
  %157 = fdiv float 1.000000e+00, %156, !fpmath !11
  %158 = fmul float %157, %157
  %159 = fmul float %157, %158
  %160 = extractelement <4 x float> %146, i64 3
  %161 = fmul float %160, %159
  %162 = insertelement <3 x float> undef, float %161, i32 0
  %163 = shufflevector <3 x float> %162, <3 x float> undef, <3 x i32> zeroinitializer
  %164 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %163, <3 x float> %148, <3 x float> %143)
  %165 = add nsw i64 %17, 7
  %166 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %165
  %167 = load <4 x float>, <4 x float>* %166, align 16, !tbaa !8
  %168 = fsub <4 x float> %167, %11
  %169 = shufflevector <4 x float> %168, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %170 = extractelement <4 x float> %168, i32 0
  %171 = extractelement <4 x float> %168, i32 1
  %172 = fmul float %171, %171
  %173 = tail call float @llvm.fmuladd.f32(float %170, float %170, float %172)
  %174 = extractelement <4 x float> %168, i32 2
  %175 = tail call float @llvm.fmuladd.f32(float %174, float %174, float %173)
  %176 = fadd float %175, %4
  %177 = tail call float @_Z4sqrtf(float %176) #3
  %178 = fdiv float 1.000000e+00, %177, !fpmath !11
  %179 = fmul float %178, %178
  %180 = fmul float %178, %179
  %181 = extractelement <4 x float> %167, i64 3
  %182 = fmul float %181, %180
  %183 = insertelement <3 x float> undef, float %182, i32 0
  %184 = shufflevector <3 x float> %183, <3 x float> undef, <3 x i32> zeroinitializer
  %185 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %184, <3 x float> %169, <3 x float> %164)
  %186 = shufflevector <3 x float> %185, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %187 = shufflevector <4 x float> %186, <4 x float> %14, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %188 = add nsw i64 %17, 8
  %189 = trunc i64 %17 to i32
  %190 = add i32 %189, 16
  %191 = icmp slt i32 %190, %2
  br i1 %191, label %13, label %192

192:                                              ; preds = %13
  %193 = trunc i64 %188 to i32
  br label %194

194:                                              ; preds = %192, %7
  %195 = phi i32 [ 0, %7 ], [ %193, %192 ]
  %196 = phi <4 x float> [ zeroinitializer, %7 ], [ %187, %192 ]
  %197 = icmp slt i32 %195, %2
  br i1 %197, label %198, label %229

198:                                              ; preds = %194
  %199 = sext i32 %195 to i64
  %200 = sext i32 %2 to i64
  br label %201

201:                                              ; preds = %201, %198
  %202 = phi i64 [ %199, %198 ], [ %227, %201 ]
  %203 = phi <4 x float> [ %196, %198 ], [ %226, %201 ]
  %204 = getelementptr inbounds <4 x float>, <4 x float>* %0, i64 %202
  %205 = load <4 x float>, <4 x float>* %204, align 16, !tbaa !8
  %206 = fsub <4 x float> %205, %11
  %207 = shufflevector <4 x float> %206, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %208 = extractelement <4 x float> %206, i32 0
  %209 = extractelement <4 x float> %206, i32 1
  %210 = fmul float %209, %209
  %211 = tail call float @llvm.fmuladd.f32(float %208, float %208, float %210)
  %212 = extractelement <4 x float> %206, i32 2
  %213 = tail call float @llvm.fmuladd.f32(float %212, float %212, float %211)
  %214 = fadd float %213, %4
  %215 = tail call float @_Z4sqrtf(float %214) #3
  %216 = fdiv float 1.000000e+00, %215, !fpmath !11
  %217 = fmul float %216, %216
  %218 = fmul float %216, %217
  %219 = extractelement <4 x float> %205, i64 3
  %220 = fmul float %219, %218
  %221 = insertelement <3 x float> undef, float %220, i32 0
  %222 = shufflevector <3 x float> %221, <3 x float> undef, <3 x i32> zeroinitializer
  %223 = shufflevector <4 x float> %203, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %224 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %222, <3 x float> %207, <3 x float> %223)
  %225 = shufflevector <3 x float> %224, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %226 = shufflevector <4 x float> %225, <4 x float> %203, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %227 = add nsw i64 %202, 1
  %228 = icmp eq i64 %227, %200
  br i1 %228, label %229, label %201

229:                                              ; preds = %201, %194
  %230 = phi <4 x float> [ %196, %194 ], [ %226, %201 ]
  %231 = getelementptr inbounds <4 x float>, <4 x float>* %1, i64 %9
  %232 = load <4 x float>, <4 x float>* %231, align 16, !tbaa !8
  %233 = shufflevector <4 x float> %11, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %234 = shufflevector <4 x float> %232, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %235 = insertelement <3 x float> undef, float %3, i32 0
  %236 = shufflevector <3 x float> %235, <3 x float> undef, <3 x i32> zeroinitializer
  %237 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %234, <3 x float> %236, <3 x float> %233)
  %238 = shufflevector <4 x float> %230, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %239 = fmul <3 x float> %238, <float 5.000000e-01, float 5.000000e-01, float 5.000000e-01>
  %240 = fmul <3 x float> %236, %239
  %241 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %240, <3 x float> %236, <3 x float> %237)
  %242 = shufflevector <3 x float> %241, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %243 = shufflevector <4 x float> %242, <4 x float> %11, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %244 = tail call <3 x float> @llvm.fmuladd.v3f32(<3 x float> %238, <3 x float> %236, <3 x float> %234)
  %245 = shufflevector <3 x float> %244, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  %246 = shufflevector <4 x float> %245, <4 x float> %232, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %247 = getelementptr inbounds <4 x float>, <4 x float>* %5, i64 %9
  store <4 x float> %243, <4 x float>* %247, align 16, !tbaa !8
  %248 = getelementptr inbounds <4 x float>, <4 x float>* %6, i64 %9
  store <4 x float> %246, <4 x float>* %248, align 16, !tbaa !8
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: convergent nounwind readnone
declare dso_local float @_Z4sqrtf(float) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare <3 x float> @llvm.fmuladd.v3f32(<3 x float>, <3 x float>, <3 x float>) #2

attributes #0 = { convergent nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { convergent nounwind readnone }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 0, i32 0, i32 0, i32 1, i32 1}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"float4*", !"float4*", !"int", !"float", !"float", !"float4*", !"float4*"}
!6 = !{!"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"int", !"float", !"float", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*"}
!7 = !{!"", !"", !"", !"", !"", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{float 2.500000e+00}
