Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE42F3A1683
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320949; cv=none; b=OHAoZJ+5gmH9CxlqCEoTc+ADoQ+bDcAG12uJUKKWA7uGidK0efVsA2sPWNSC8V6fxLxhICdnMel5XVhDo4efhiPqeufoK+lL1og97lueLrItCX9IFaCJArMQh6QobLSgORC+kfBj+9eQLHI9Fpoju8H5km75hOFeq2hTD1yZgF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320949; c=relaxed/simple;
	bh=A2VsonGAk/WOFU4rW5YOJ3BUlJlJl5QyL5jYHngu07I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVaYKz1I2d+SprmJx4ffIo6XwLrzMZeh2QB4EiGlJhb2oWLsDNdlcgyjTc1mOUM6MAlsFCRIqJZGqnCrHzWV486YYMUr0noNTx8ZtkCUkVZmEvxTagTT2faV9xFQohTzWaDfNQj67QTdxJRCCZhYqbieXY2l4kdTf9xdNwRkVkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g++Cc5C0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ql31fQJY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g++Cc5C0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ql31fQJY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtL3h2906068
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhtEkaAJenJ0hU5bVGOGxpv27XZDgT+ujwuT8/gsZBo=; b=g++Cc5C0YYJJ8Dk/
	LGGXvFZII+10CKTxAg7HF5JIbEdKqq3swihLsV4xu75qj91gk24AjmkNlMAn1T46
	bKHViNP5g+EgJfvw4HQ1Yj6S5B7PgNsc9MXj0nMUMawOTNXcLHN9NjGYYK9sB03I
	jVpxCcYB2HE7oW/VC2M/v+n7bqZAnLMLLMxBfXh0bRSOo9HWNbmH8fKe7BFpyVPF
	reeNtbuuZSEuDFa6IoC0ps+qDgUfO/hMOfYiDLQmGlLpRcGf7StQ+eXTkkeQ90he
	LaqVIZsYu1Z7UWm2FUq0fGUDMsQu30VBdhmw7LEQDizPgwI1hrIgt3Oajs9+JBVm
	XJOrVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq8qj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so5562626a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320945; x=1784925745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhtEkaAJenJ0hU5bVGOGxpv27XZDgT+ujwuT8/gsZBo=;
        b=Ql31fQJYCGHH7BykwxT1H+zhaGnhF1Cgy6oCBN2gDRBvVxw0rCle2GvV1iLELMHtDo
         BL70soPge16IoIdz/bAZhMg8MG+WN02ntidvZL4rs4g0jy/qnCnnRdR3VY/i19jvA0ya
         +gc92VTkIR4GQKBsrqCCr7BG1GVzxSxDonLoak8SimQV0E/edKiBmmcptfvZEuWppwJQ
         8NVkNV3vqEhvSitdvWOQQgat9t0gtIyxAAwnSH8mpGLRIPLS0FSeuVW7sv7lcZbpK6rD
         F6l2TISW1DquxodVi/oAY/ghr98a0W3AY7wd0QR1e3c8Bq37wzHVeA9lAM0wbNU7MYpy
         khaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320945; x=1784925745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhtEkaAJenJ0hU5bVGOGxpv27XZDgT+ujwuT8/gsZBo=;
        b=k0BFGAcB4ihl+dhPFjID4X6SwQdFiwEERhr3jBXDIT0Te76mkrNvlgPWPEtAXaTolJ
         2wBdguDJ5P11tqLfExMxiFnj1Prd7ecrhbxMkbCgqaAIg4q094Bd5ZpKKLFycJ5am5oV
         O7/p/bY+TTzo8yHXtqFoZe3MoYQo4cBvJAauH4FLDIjyTz8r5XCu0I2A7kMagWso+7fn
         9F594uBtBSswIDaNkDwFJ3dF7X7VcU29xvlZ4rHLtjFwhtERbg5o+uj3TCEmBs2SteGH
         zvn6SLH53qfkVhVCu8blWpVejlLMC/hmRb8LFBTPVhgwG4XHOEq4FRlsJaKEKvcpneEN
         k9TQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUAfWY+wvBKpwker49ofI+3+vwDamyPyiJjdy9iUuTPQWc7uKEWWG/L0+UqcGYfMkbkDEXisKiecvFOred@vger.kernel.org
X-Gm-Message-State: AOJu0YyJzHEiTYHfwCzIWBt6jYY3DmFQQ+TDayRJDx4TVBrzneP7WU6y
	EoojXhqPV/zauSPf9quLYtFR0TXTuZl1xAAhZUJW4nDBRyE2Odnqy+Yjtuh4IotAFr7v+C41W9y
	ktYQqvULT/DiUfnPdUtooRs89DVKEIz+MiRNCqL8TLoCOUuh1Yq60XD+SNvBAhSSjyS4H
X-Gm-Gg: AfdE7cnzWWl2rf4PeMZRy+ABgN0Z1Yf8y0zOeWTC3hsCR/rJ0f4acl+Y7vHVTmBFAEr
	a7WmKzSdzh9y3gxctf0f4J0OGtxsDt3myRWCYDJlfqLIsooxAoBYsE2dNEqpMh8ZHw8Kax2a9Qm
	BbrNURzWqHAXDUTDylqVGhcOXrd4Kgmc0Az02scWbzTy4dVpIzE0EItZ0aQwaeFnfO9O+6z4fHt
	rtgNY3y/rUjCy0Or8wcA/+0SwvO2IECnZgF85mzyEkTdu9U1efGc+TcYBArcGLcrYk9Fg4QLBBa
	YMRNbIep+8J9WxWSFzE1lqbThmfNlaZDg1hviWTT+hLmNUZQCTQE0BMLGXsWYwOt3IkmpJQv7wC
	rKAjYi2frGDgq91YV1zlS5BIr
X-Received: by 2002:a17:90b:3f85:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-38e4b3dc094mr4230464a91.1.1784320945463;
        Fri, 17 Jul 2026 13:42:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-38e4b3dc094mr4230426a91.1.1784320945021;
        Fri, 17 Jul 2026 13:42:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:29 +0530
Subject: [PATCH v2 4/9] dt-bindings: arm-smmu: Document GPU SMMU for Eliza
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-4-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1190;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=A2VsonGAk/WOFU4rW5YOJ3BUlJlJl5QyL5jYHngu07I=;
 b=zrhPOCHooo2chb6Nfl5XD3FoSGfFuqiqKsCyL8WnuhUoa9KSgaCthbOm2ZQw1aKW/dQRH6TOg
 Li2Lbjrd7/DAd//jYP+/4uSrdQB0BTkMd/1iEzhPHbwlXmqJKEUSKvp
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX0yRL2gskGMis
 6R/uJIo2fUw392mUQ6E9L+lpoFOcEzFH99PPSfSZScVotowm2thT+xeFMTR31vJvDSIPnM1J59w
 +LIuUJ5SuRglWQ2TMXrb3RdVqunDt84=
X-Proofpoint-ORIG-GUID: fRtrwYgMX8MdTdA0c-9OkzEdLlAQo5i-
X-Proofpoint-GUID: fRtrwYgMX8MdTdA0c-9OkzEdLlAQo5i-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfXyPYYVPaQ//cy
 WdP9wjosPaZ//uGYOx0Na+QcdDq1JtMODZbJkgnAl2c1XDj/8ouHhubIEfwaebj/QuKB4V3Ox28
 AnU8RUW3HSQ2dgyN1yvBn9S7vyZzlf4tt+ERFFmvr5jPqps3bZQJwWtkzL8zyRxD3gbXKZ7IqKT
 Ar4WOVEV2XS1MuTfQAYXncvgjgPUdJKNz5MEMOJ/I6Qj2YTJu3qhRNme8rhuEC1TFn6e2pgBMpw
 PkNhIzMmplGCQfESUL0jAcq/Hq9SHG7pPHO5UUCOhuLpJek8zkNspHhN1iFvqP5e7CdX8E22lrp
 PoJ1JJczybz15K8SPIy3fTz6KT+HQlZiInrl+++pO4jS8a+uHttFV/d/PDRdHs5XWlJ3K/xMed3
 raAdsuXAlxVYy9tkrB7BL/Nh7jzoOpkS2nbSqdnK7z8XeTHG0Z9JDvFXdOSvMlO26ua2vTS74Uy
 RqY/63XaBpXpt8EjgFQ==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5a93b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170212

Add specific compatible strings to document the GPU SMMU present
in the Eliza SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ed556683817c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -95,6 +95,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
@@ -570,6 +571,7 @@ allOf:
         compatible:
           items:
             - enum:
+                - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.54.0

