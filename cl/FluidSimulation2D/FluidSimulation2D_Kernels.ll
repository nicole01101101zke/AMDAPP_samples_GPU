; ModuleID = '../AMDAPP_samples/cl/FluidSimulation2D/FluidSimulation2D_Kernels.cl'
source_filename = "../AMDAPP_samples/cl/FluidSimulation2D/FluidSimulation2D_Kernels.cl"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define dso_local double @computefEq(double %0, double %1, <2 x double> %2, <2 x double> %3) local_unnamed_addr #0 {
  %5 = extractelement <2 x double> %3, i64 0
  %6 = extractelement <2 x double> %3, i64 1
  %7 = fmul double %6, %6
  %8 = tail call double @llvm.fmuladd.f64(double %5, double %5, double %7)
  %9 = extractelement <2 x double> %2, i64 0
  %10 = extractelement <2 x double> %2, i64 1
  %11 = fmul double %10, %6
  %12 = tail call double @llvm.fmuladd.f64(double %9, double %5, double %11)
  %13 = fmul double %0, %1
  %14 = tail call double @llvm.fmuladd.f64(double %12, double 3.000000e+00, double 1.000000e+00)
  %15 = fmul double %12, 4.500000e+00
  %16 = tail call double @llvm.fmuladd.f64(double %15, double %12, double %14)
  %17 = tail call double @llvm.fmuladd.f64(double %8, double -1.500000e+00, double %16)
  %18 = fmul double %13, %17
  ret double %18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @lbm(double* nocapture readonly %0, double* nocapture %1, <4 x double>* nocapture readonly %2, <4 x double>* nocapture %3, <4 x double>* nocapture readonly %4, <4 x double>* nocapture %5, i8* nocapture readonly %6, <8 x double> %7, <8 x double> %8, double* nocapture readonly %9, double %10, <2 x double>* nocapture %11) local_unnamed_addr #2 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 {
  %13 = alloca <4 x double>, align 32
  %14 = alloca <4 x double>, align 32
  %15 = alloca <4 x double>, align 32
  %16 = alloca <4 x double>, align 32
  %17 = alloca <4 x double>, align 32
  %18 = alloca <4 x double>, align 32
  %19 = alloca <4 x double>, align 32
  %20 = alloca <4 x double>, align 32
  %21 = alloca <8 x double>, align 64
  %22 = alloca <8 x double>, align 64
  %23 = tail call i64 @_Z13get_global_idj(i32 0) #5
  %24 = trunc i64 %23 to i32
  %25 = tail call i64 @_Z13get_global_idj(i32 1) #5
  %26 = trunc i64 %25 to i32
  %27 = tail call i64 @_Z15get_global_sizej(i32 0) #5
  %28 = trunc i64 %27 to i32
  %29 = mul i64 %27, %25
  %30 = add i64 %29, %23
  %31 = and i64 %30, 4294967295
  %32 = getelementptr inbounds double, double* %0, i64 %31
  %33 = load double, double* %32, align 8, !tbaa !8
  %34 = getelementptr inbounds <4 x double>, <4 x double>* %2, i64 %31
  %35 = load <4 x double>, <4 x double>* %34, align 32, !tbaa !12
  %36 = getelementptr inbounds <4 x double>, <4 x double>* %4, i64 %31
  %37 = load <4 x double>, <4 x double>* %36, align 32, !tbaa !12
  %38 = getelementptr inbounds i8, i8* %6, i64 %31
  %39 = load i8, i8* %38, align 1, !tbaa !13, !range !15
  %40 = icmp eq i8 %39, 0
  br i1 %40, label %44, label %41

41:                                               ; preds = %12
  %42 = shufflevector <4 x double> %35, <4 x double> undef, <4 x i32> <i32 2, i32 3, i32 0, i32 1>
  %43 = shufflevector <4 x double> %37, <4 x double> undef, <4 x i32> <i32 2, i32 3, i32 0, i32 1>
  br label %193

44:                                               ; preds = %12
  %45 = fadd <4 x double> %35, %37
  %46 = shufflevector <4 x double> %45, <4 x double> undef, <2 x i32> <i32 2, i32 3>
  %47 = shufflevector <4 x double> %45, <4 x double> undef, <2 x i32> <i32 0, i32 1>
  %48 = fadd <2 x double> %47, %46
  %49 = extractelement <2 x double> %48, i32 0
  %50 = extractelement <2 x double> %48, i32 1
  %51 = fadd double %49, %50
  %52 = fadd double %33, %51
  %53 = shufflevector <8 x double> %7, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  store <4 x double> %35, <4 x double>* %13, align 32, !tbaa !12
  store <4 x double> %53, <4 x double>* %14, align 32, !tbaa !12
  %54 = tail call double @_Z3dotDv4_dS_(<4 x double>* nonnull byval(<4 x double>) align 32 %13, <4 x double>* nonnull byval(<4 x double>) align 32 %14) #6
  %55 = shufflevector <8 x double> %7, <8 x double> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  store <4 x double> %37, <4 x double>* %15, align 32, !tbaa !12
  store <4 x double> %55, <4 x double>* %16, align 32, !tbaa !12
  %56 = tail call double @_Z3dotDv4_dS_(<4 x double>* nonnull byval(<4 x double>) align 32 %15, <4 x double>* nonnull byval(<4 x double>) align 32 %16) #6
  %57 = fadd double %54, %56
  %58 = fdiv double %57, %52
  %59 = insertelement <2 x double> undef, double %58, i64 0
  %60 = shufflevector <8 x double> %8, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  store <4 x double> %35, <4 x double>* %17, align 32, !tbaa !12
  store <4 x double> %60, <4 x double>* %18, align 32, !tbaa !12
  %61 = tail call double @_Z3dotDv4_dS_(<4 x double>* nonnull byval(<4 x double>) align 32 %17, <4 x double>* nonnull byval(<4 x double>) align 32 %18) #6
  %62 = shufflevector <8 x double> %8, <8 x double> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  store <4 x double> %37, <4 x double>* %19, align 32, !tbaa !12
  store <4 x double> %62, <4 x double>* %20, align 32, !tbaa !12
  %63 = tail call double @_Z3dotDv4_dS_(<4 x double>* nonnull byval(<4 x double>) align 32 %19, <4 x double>* nonnull byval(<4 x double>) align 32 %20) #6
  %64 = fadd double %61, %63
  %65 = fdiv double %64, %52
  %66 = insertelement <2 x double> %59, double %65, i64 1
  %67 = load double, double* %9, align 8, !tbaa !8
  %68 = fmul double %65, %65
  %69 = tail call double @llvm.fmuladd.f64(double %58, double %58, double %68) #7
  %70 = fmul double %65, 0.000000e+00
  %71 = tail call double @llvm.fmuladd.f64(double %58, double 0.000000e+00, double %70) #7
  %72 = fmul double %52, %67
  %73 = tail call double @llvm.fmuladd.f64(double %71, double 3.000000e+00, double 1.000000e+00) #7
  %74 = fmul double %71, 4.500000e+00
  %75 = tail call double @llvm.fmuladd.f64(double %74, double %71, double %73) #7
  %76 = tail call double @llvm.fmuladd.f64(double %69, double -1.500000e+00, double %75) #7
  %77 = fmul double %72, %76
  %78 = getelementptr inbounds double, double* %9, i64 1
  %79 = load double, double* %78, align 8, !tbaa !8
  %80 = extractelement <8 x double> %7, i32 0
  %81 = extractelement <8 x double> %8, i32 0
  %82 = fmul double %81, %65
  %83 = tail call double @llvm.fmuladd.f64(double %80, double %58, double %82) #7
  %84 = fmul double %52, %79
  %85 = tail call double @llvm.fmuladd.f64(double %83, double 3.000000e+00, double 1.000000e+00) #7
  %86 = fmul double %83, 4.500000e+00
  %87 = tail call double @llvm.fmuladd.f64(double %86, double %83, double %85) #7
  %88 = tail call double @llvm.fmuladd.f64(double %69, double -1.500000e+00, double %87) #7
  %89 = fmul double %84, %88
  %90 = insertelement <4 x double> undef, double %89, i64 0
  %91 = getelementptr inbounds double, double* %9, i64 2
  %92 = load double, double* %91, align 8, !tbaa !8
  %93 = extractelement <8 x double> %7, i32 1
  %94 = extractelement <8 x double> %8, i32 1
  %95 = fmul double %94, %65
  %96 = tail call double @llvm.fmuladd.f64(double %93, double %58, double %95) #7
  %97 = fmul double %52, %92
  %98 = tail call double @llvm.fmuladd.f64(double %96, double 3.000000e+00, double 1.000000e+00) #7
  %99 = fmul double %96, 4.500000e+00
  %100 = tail call double @llvm.fmuladd.f64(double %99, double %96, double %98) #7
  %101 = tail call double @llvm.fmuladd.f64(double %69, double -1.500000e+00, double %100) #7
  %102 = fmul double %97, %101
  %103 = insertelement <4 x double> %90, double %102, i64 1
  %104 = getelementptr inbounds double, double* %9, i64 3
  %105 = load double, double* %104, align 8, !tbaa !8
  %106 = extractelement <8 x double> %7, i32 2
  %107 = extractelement <8 x double> %8, i32 2
  %108 = fmul double %107, %65
  %109 = tail call double @llvm.fmuladd.f64(double %106, double %58, double %108) #7
  %110 = fmul double %52, %105
  %111 = tail call double @llvm.fmuladd.f64(double %109, double 3.000000e+00, double 1.000000e+00) #7
  %112 = fmul double %109, 4.500000e+00
  %113 = tail call double @llvm.fmuladd.f64(double %112, double %109, double %111) #7
  %114 = tail call double @llvm.fmuladd.f64(double %69, double -1.500000e+00, double %113) #7
  %115 = fmul double %110, %114
  %116 = insertelement <4 x double> %103, double %115, i64 2
  %117 = getelementptr inbounds double, double* %9, i64 4
  %118 = load double, double* %117, align 8, !tbaa !8
  %119 = extractelement <8 x double> %7, i32 3
  %120 = extractelement <8 x double> %8, i32 3
  %121 = fmul double %120, %65
  %122 = tail call double @llvm.fmuladd.f64(double %119, double %58, double %121) #7
  %123 = fmul double %52, %118
  %124 = tail call double @llvm.fmuladd.f64(double %122, double 3.000000e+00, double 1.000000e+00) #7
  %125 = fmul double %122, 4.500000e+00
  %126 = tail call double @llvm.fmuladd.f64(double %125, double %122, double %124) #7
  %127 = tail call double @llvm.fmuladd.f64(double %69, double -1.500000e+00, double %126) #7
  %128 = fmul double %123, %127
  %129 = insertelement <4 x double> %116, double %128, i64 3
  %130 = getelementptr inbounds double, double* %9, i64 5
  %131 = load double, double* %130, align 8, !tbaa !8
  %132 = extractelement <8 x double> %7, i32 4
  %133 = extractelement <8 x double> %8, i32 4
  %134 = fmul double %133, %65
  %135 = tail call double @llvm.fmuladd.f64(double %132, double %58, double %134) #7
  %136 = fmul double %52, %131
  %137 = tail call double @llvm.fmuladd.f64(double %135, double 3.000000e+00, double 1.000000e+00) #7
  %138 = fmul double %135, 4.500000e+00
  %139 = tail call double @llvm.fmuladd.f64(double %138, double %135, double %137) #7
  %140 = tail call double @llvm.fmuladd.f64(double %69, double -1.500000e+00, double %139) #7
  %141 = fmul double %136, %140
  %142 = insertelement <4 x double> undef, double %141, i64 0
  %143 = getelementptr inbounds double, double* %9, i64 6
  %144 = load double, double* %143, align 8, !tbaa !8
  %145 = extractelement <8 x double> %7, i32 5
  %146 = extractelement <8 x double> %8, i32 5
  %147 = fmul double %146, %65
  %148 = tail call double @llvm.fmuladd.f64(double %145, double %58, double %147) #7
  %149 = fmul double %52, %144
  %150 = tail call double @llvm.fmuladd.f64(double %148, double 3.000000e+00, double 1.000000e+00) #7
  %151 = fmul double %148, 4.500000e+00
  %152 = tail call double @llvm.fmuladd.f64(double %151, double %148, double %150) #7
  %153 = tail call double @llvm.fmuladd.f64(double %69, double -1.500000e+00, double %152) #7
  %154 = fmul double %153, %149
  %155 = insertelement <4 x double> %142, double %154, i64 1
  %156 = getelementptr inbounds double, double* %9, i64 7
  %157 = load double, double* %156, align 8, !tbaa !8
  %158 = extractelement <8 x double> %7, i32 6
  %159 = extractelement <8 x double> %8, i32 6
  %160 = fmul double %159, %65
  %161 = tail call double @llvm.fmuladd.f64(double %158, double %58, double %160) #7
  %162 = fmul double %52, %157
  %163 = tail call double @llvm.fmuladd.f64(double %161, double 3.000000e+00, double 1.000000e+00) #7
  %164 = fmul double %161, 4.500000e+00
  %165 = tail call double @llvm.fmuladd.f64(double %164, double %161, double %163) #7
  %166 = tail call double @llvm.fmuladd.f64(double %69, double -1.500000e+00, double %165) #7
  %167 = fmul double %166, %162
  %168 = insertelement <4 x double> %155, double %167, i64 2
  %169 = getelementptr inbounds double, double* %9, i64 8
  %170 = load double, double* %169, align 8, !tbaa !8
  %171 = extractelement <8 x double> %7, i32 7
  %172 = extractelement <8 x double> %8, i32 7
  %173 = fmul double %172, %65
  %174 = tail call double @llvm.fmuladd.f64(double %171, double %58, double %173) #7
  %175 = fmul double %52, %170
  %176 = tail call double @llvm.fmuladd.f64(double %174, double 3.000000e+00, double 1.000000e+00) #7
  %177 = fmul double %174, 4.500000e+00
  %178 = tail call double @llvm.fmuladd.f64(double %177, double %174, double %176) #7
  %179 = tail call double @llvm.fmuladd.f64(double %69, double -1.500000e+00, double %178) #7
  %180 = fmul double %179, %175
  %181 = insertelement <4 x double> %168, double %180, i64 3
  %182 = fsub double 1.000000e+00, %10
  %183 = fmul double %77, %10
  %184 = tail call double @llvm.fmuladd.f64(double %182, double %33, double %183)
  %185 = insertelement <4 x double> undef, double %182, i32 0
  %186 = shufflevector <4 x double> %185, <4 x double> undef, <4 x i32> zeroinitializer
  %187 = insertelement <4 x double> undef, double %10, i32 0
  %188 = shufflevector <4 x double> %187, <4 x double> undef, <4 x i32> zeroinitializer
  %189 = fmul <4 x double> %188, %129
  %190 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %186, <4 x double> %35, <4 x double> %189)
  %191 = fmul <4 x double> %188, %181
  %192 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %186, <4 x double> %37, <4 x double> %191)
  br label %193

193:                                              ; preds = %44, %41
  %194 = phi <2 x double> [ zeroinitializer, %41 ], [ %66, %44 ]
  %195 = phi <4 x double> [ %43, %41 ], [ %192, %44 ]
  %196 = phi <4 x double> [ %42, %41 ], [ %190, %44 ]
  %197 = phi double [ %33, %41 ], [ %184, %44 ]
  %198 = getelementptr inbounds <2 x double>, <2 x double>* %11, i64 %31
  store <2 x double> %194, <2 x double>* %198, align 16, !tbaa !12
  %199 = insertelement <8 x i32> undef, i32 %24, i32 0
  %200 = shufflevector <8 x i32> %199, <8 x i32> undef, <8 x i32> zeroinitializer
  store <8 x double> %7, <8 x double>* %21, align 64, !tbaa !12
  %201 = tail call <8 x i32> @_Z12convert_int8Dv8_d(<8 x double>* nonnull byval(<8 x double>) align 64 %21) #6
  %202 = add <8 x i32> %201, %200
  %203 = insertelement <8 x i32> undef, i32 %26, i32 0
  %204 = shufflevector <8 x i32> %203, <8 x i32> undef, <8 x i32> zeroinitializer
  store <8 x double> %8, <8 x double>* %22, align 64, !tbaa !12
  %205 = tail call <8 x i32> @_Z12convert_int8Dv8_d(<8 x double>* nonnull byval(<8 x double>) align 64 %22) #6
  %206 = add <8 x i32> %205, %204
  %207 = insertelement <8 x i32> undef, i32 %28, i32 0
  %208 = shufflevector <8 x i32> %207, <8 x i32> undef, <8 x i32> zeroinitializer
  %209 = mul <8 x i32> %206, %208
  %210 = add <8 x i32> %202, %209
  %211 = getelementptr inbounds double, double* %1, i64 %31
  store double %197, double* %211, align 8, !tbaa !8
  %212 = and i64 %23, 4294967295
  %213 = add i64 %27, -1
  %214 = icmp ult i64 %212, %213
  %215 = icmp ne i32 %26, 0
  %216 = icmp ne i32 %24, 0
  %217 = and i64 %25, 4294967295
  %218 = tail call i64 @_Z15get_global_sizej(i32 1) #5
  %219 = add i64 %218, -1
  %220 = icmp ult i64 %217, %219
  br i1 %214, label %221, label %227

221:                                              ; preds = %193
  %222 = extractelement <8 x i32> %210, i64 0
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds <4 x double>, <4 x double>* %3, i64 %223
  %225 = load <4 x double>, <4 x double>* %224, align 32
  %226 = shufflevector <4 x double> %196, <4 x double> %225, <4 x i32> <i32 0, i32 5, i32 6, i32 7>
  store <4 x double> %226, <4 x double>* %224, align 32
  br label %227

227:                                              ; preds = %221, %193
  br i1 %220, label %228, label %234

228:                                              ; preds = %227
  %229 = extractelement <8 x i32> %210, i64 1
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds <4 x double>, <4 x double>* %3, i64 %230
  %232 = load <4 x double>, <4 x double>* %231, align 32
  %233 = shufflevector <4 x double> %232, <4 x double> %196, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  store <4 x double> %233, <4 x double>* %231, align 32
  br label %234

234:                                              ; preds = %228, %227
  br i1 %216, label %235, label %241

235:                                              ; preds = %234
  %236 = extractelement <8 x i32> %210, i64 2
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds <4 x double>, <4 x double>* %3, i64 %237
  %239 = load <4 x double>, <4 x double>* %238, align 32
  %240 = shufflevector <4 x double> %239, <4 x double> %196, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  store <4 x double> %240, <4 x double>* %238, align 32
  br label %241

241:                                              ; preds = %235, %234
  br i1 %215, label %242, label %248

242:                                              ; preds = %241
  %243 = extractelement <8 x i32> %210, i64 3
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds <4 x double>, <4 x double>* %3, i64 %244
  %246 = load <4 x double>, <4 x double>* %245, align 32
  %247 = shufflevector <4 x double> %246, <4 x double> %196, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  store <4 x double> %247, <4 x double>* %245, align 32
  br label %248

248:                                              ; preds = %242, %241
  %249 = and i1 %214, %220
  br i1 %249, label %250, label %256

250:                                              ; preds = %248
  %251 = extractelement <8 x i32> %210, i64 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds <4 x double>, <4 x double>* %5, i64 %252
  %254 = load <4 x double>, <4 x double>* %253, align 32
  %255 = shufflevector <4 x double> %195, <4 x double> %254, <4 x i32> <i32 0, i32 5, i32 6, i32 7>
  store <4 x double> %255, <4 x double>* %253, align 32
  br label %256

256:                                              ; preds = %250, %248
  %257 = and i1 %216, %220
  br i1 %257, label %258, label %264

258:                                              ; preds = %256
  %259 = extractelement <8 x i32> %210, i64 5
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds <4 x double>, <4 x double>* %5, i64 %260
  %262 = load <4 x double>, <4 x double>* %261, align 32
  %263 = shufflevector <4 x double> %262, <4 x double> %195, <4 x i32> <i32 0, i32 5, i32 2, i32 3>
  store <4 x double> %263, <4 x double>* %261, align 32
  br label %264

264:                                              ; preds = %258, %256
  %265 = and i1 %216, %215
  br i1 %265, label %266, label %272

266:                                              ; preds = %264
  %267 = extractelement <8 x i32> %210, i64 6
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds <4 x double>, <4 x double>* %5, i64 %268
  %270 = load <4 x double>, <4 x double>* %269, align 32
  %271 = shufflevector <4 x double> %270, <4 x double> %195, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  store <4 x double> %271, <4 x double>* %269, align 32
  br label %272

272:                                              ; preds = %266, %264
  %273 = and i1 %215, %214
  br i1 %273, label %274, label %280

274:                                              ; preds = %272
  %275 = extractelement <8 x i32> %210, i64 7
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds <4 x double>, <4 x double>* %5, i64 %276
  %278 = load <4 x double>, <4 x double>* %277, align 32
  %279 = shufflevector <4 x double> %278, <4 x double> %195, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  store <4 x double> %279, <4 x double>* %277, align 32
  br label %280

280:                                              ; preds = %274, %272
  ret void
}

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z13get_global_idj(i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind readnone
declare dso_local i64 @_Z15get_global_sizej(i32) local_unnamed_addr #3

; Function Attrs: convergent nounwind
declare dso_local double @_Z3dotDv4_dS_(<4 x double>* byval(<4 x double>) align 32, <4 x double>* byval(<4 x double>) align 32) local_unnamed_addr #4

; Function Attrs: nounwind readnone speculatable willreturn
declare <4 x double> @llvm.fmuladd.v4f64(<4 x double>, <4 x double>, <4 x double>) #1

; Function Attrs: convergent nounwind
declare dso_local <8 x i32> @_Z12convert_int8Dv8_d(<8 x double>* byval(<8 x double>) align 64) local_unnamed_addr #4

attributes #0 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="512" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { convergent nounwind readnone }
attributes #6 = { convergent nounwind }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 2, i32 0, i32 1}
!4 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!5 = !{!"double*", !"double*", !"double4*", !"double4*", !"double4*", !"double4*", !"bool*", !"double8", !"double8", !"double*", !"double", !"double2*"}
!6 = !{!"double*", !"double*", !"double __attribute__((ext_vector_type(4)))*", !"double __attribute__((ext_vector_type(4)))*", !"double __attribute__((ext_vector_type(4)))*", !"double __attribute__((ext_vector_type(4)))*", !"bool*", !"double __attribute__((ext_vector_type(8)))", !"double __attribute__((ext_vector_type(8)))", !"double*", !"double", !"double __attribute__((ext_vector_type(2)))*"}
!7 = !{!"", !"", !"", !"", !"", !"", !"", !"", !"", !"const", !"", !""}
!8 = !{!9, !9, i64 0}
!9 = !{!"double", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!10, !10, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"bool", !10, i64 0}
!15 = !{i8 0, i8 2}
