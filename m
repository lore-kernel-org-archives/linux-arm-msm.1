Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A52B489863
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159259; cv=none; b=udZ0/1mBjLVE77611Fb5mDSlWdHMgUd+eoFrA3NnOTX0DLAW0anDiZlxXdC2J/tclVc+DSQT+cSeWZuzPhTXBd3ml/9omtDFUuvPim4T/zzi/lUhXt0DvHQuMAPzYVIEUXyN00b/i3UjL6mBzKOo2YK2JFbPQLBRj6iuhjhnGJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159259; c=relaxed/simple;
	bh=2l0HOP6mPSZOtBbSF3ksRuZxG+DphYWlDRxyeluAzLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uWoUOeeGSOGmFIH4c7+iuFJtPUO11WQSKfBV9F4u665CHVSmsEI3neBmWkQ0QA0VpR4ccXemNVSa573hbW2p+l5QK3604QlalF1jRwpsFBMyXQIhsv9kINNDIPwPtyS4X/ryUTGbcIecX88iJw2yQney7KxOSWvW9r6J3SWriyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYoIN555; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDjf+WUw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYoIN555";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDjf+WUw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2nZl3209005
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgxQRfbRddwBR9e2WGSz/EjVQdtkUcNgTw11zOQWGkA=; b=MYoIN555LywVykI1
	FNl0777F9gPdr+t5MjoOv+P3K4GzSNanLaTai+dsa4bDVEJQuaKYbyskjSA9W5kG
	p+fk5kLHnQns4yQb0wMMdGMgNzAS1A41Lck2cuoYTCmZz3KsAeEGOkeAjm2Y+nb6
	dgqpyp4+kKtNRQo955lfkejAtEzJMYuO3zzevrlzoo8bMlyPT53dDR+sKddmAlGt
	Tv4QZrI02ziDt37r7DgUgIgYFwZLxrvqiRboqTMipgxAPPp58AnzI1Bgq4oef0Pa
	AEmdMfScgXnfefPhn6wldNgdjh65UyREdIxki67GndE2Vjq+7J43alS0s7Q+cukY
	pnVyiw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1gpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1138347eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159245; x=1790764045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgxQRfbRddwBR9e2WGSz/EjVQdtkUcNgTw11zOQWGkA=;
        b=iDjf+WUwc7iCtvQALQltgsH9EDYSDQXjZUZ8A7+8qMvJ7iXALhMMQ66fd1gJLmCjSW
         jOYrp+eqdmzLnU738gtJaCGsGISCyo4huXhXUFSAbpOJyXmt8oICJmcRuZGlAqrs5qre
         SB7KzD2TPkaCE4z0OGlDRZjh8m9CKqVYHpf+SUJ3Sznb8bYFDP4xORGj3EaShFj9IR3l
         HzC8nr1bWcM75pcA90lkRsGTyy0wZHkOjkl7LHnk9vJZcZ4La39LQTTCTeBZD0J43eKe
         N+re5UVrqOvvz50zZLUvVA+nnXY/80Zgkcs0PrOqHGVYfvUKvknYXNzlNUsAaA2qJehi
         ZwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159245; x=1790764045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgxQRfbRddwBR9e2WGSz/EjVQdtkUcNgTw11zOQWGkA=;
        b=shpmBrMIfAo8qCv2lf98eVGceRDmPlnooVvxnUCGDgojabuHb4pkTS6f+NwLlQSJtL
         iYDJ4f8/HL/YtG+f+4vNIz90B+NP60v1oERavAtoJst9XGErWmuQzWap15bIGvHM94Z1
         V+VH808D8Lx/jOLxP71umknWTNpFSzmRKm/eEmBmL/7RS0PqGoeLXVMQiioNfoox3UTX
         spTo0klI3sTvqyFuvIXZBvNcZBC4UMxU4TJkPjyTHPd0688vvT7CCEP2DP3VKTv5pSek
         CdVMC4z0jjBbtDBRbsblBKorQeXMMhDKki5hiUCtTo9vI1H0h5EAcdV+kcdztYa8vLwa
         Py4g==
X-Forwarded-Encrypted: i=1; AKwUvBwAw8YaQqMIIfyT3bKIQ/XVA3ugsU7lkt4aoP+UB9FOV/dLiHIs/Sk5+eY1UGtFonwQwoLgU6bi0OGij+j3@vger.kernel.org
X-Gm-Message-State: AFuF++kTTjlcp1lYYmnigXZzafNPMY7k6ZVARrS4GmheKqao2Kux607c
	WgmcYu+mnEVDOTNRy5xiKOp7sKqYvNqTa59MPCze6JJ7LCl0Rw7qQW5lLwlC53IW5tNadugo0BQ
	RDODgaz4ArfuYsXwbdbKxY3m9YjlRu6T0iTEser/B4z1eTrddSrwoYB/+doEB3SnQGFM/
X-Gm-Gg: AYBFou3DlKt0nFYkAjyVztygZMoMbcXQOpQzL3BZJi1dlKNZE0SFsz/nrkm0tS9iPz+
	PEyiqCm663SZuKXia2prW617EXhaM3feeSz7m7tPHZTUIGY0Hv1+uybljWlzdieXR24j4sRkeO1
	IIGlFtbkPmrf6NdLcyynnn39ax1Xjcvs3fXdOCJFf2SBuWe25VBoCJFTqCo2w/vecQON4SLk2Y9
	Hnlkl5n/gy/phyhEXEfwBw+onGpuLjNnTHo+z4QZPeRgd57WU5IHqgOnCwJ/5lMTYrTSVXsFbyO
	SFL80bbQZuCC9wNliLJUZEW2ZbVBfeM1zqEGj8UT2eusE017bUppJXy1lfISot1jUWdLKCthI49
	7NV5QD3hwtcN2nRINkAG6qMM=
X-Received: by 2002:a05:701a:ca0e:b0:144:eaa7:2915 with SMTP id a92af1059eb24-144f90f8090mr2852419c88.14.1790159245102;
        Wed, 23 Sep 2026 03:27:25 -0700 (PDT)
X-Received: by 2002:a05:701a:ca0e:b0:144:eaa7:2915 with SMTP id a92af1059eb24-144f90f8090mr2852391c88.14.1790159244606;
        Wed, 23 Sep 2026 03:27:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:50 +0530
Subject: [PATCH 10/15] dt-bindings: display/msm: Document A850 GPU and GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-10-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=3397;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2l0HOP6mPSZOtBbSF3ksRuZxG+DphYWlDRxyeluAzLM=;
 b=SFUs5FDbVaozEtr1Ys5yrhoHlAOgul38VUPaf7kTbcdYxKZKqgEpUm43xftFNbo3KxM7TiZvu
 YuOUkWDXIeqAke2d3hs3JVntTErY0j0vyVb516CqT+pexr5DlK8C6e4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX6khQqSe5FTkY
 ffEk9RJXwysTsj6f9dU1MwC9eijT9H9CM4O1eTVsBpKwzzm2XzCkUp0ehAPouHvO960BTg+un0e
 YFkjx+umu6Auqdg4Ia75Hc702QVHTN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX3aBL4T+71uKt
 yEOr1iUBY3xs3e1X8/coA6xQM0UdXiiE5kIBeTzcPtS3aB/I+Xu/swi7ENTgRx9x9u1snIGGjR+
 9d/FRfJE3mBoYw3G1EZEjKDeKS4ESpY8BzUdkvBnxpJRLyal941jeOxjijUuqECBsiMN/T5uFQz
 +/tOt9/GGzL0RBiYR684m5JdkpZ/89dW4Aw+jTFBKk8Dgs30mSg8ZdhlaPZ9HSFvfBJQnIwHex1
 fwqGKoRif8z/cOC6gUwCUqIB/O9xUWrXDam0i+S1BiaDy/p2VQ8faWTnRPMOL+3YR2stzwheNmC
 rPT5FGtwQdFT48MFKSQOXPbWHaT582+xlk/YoqSofCH6MsVMM4VYFIk4D/AYgVw0MEbb3yVLBAD
 tvUbcXUxbf660Ep7eHcp0jC8RLFsw6EgKwWsNoeXNyTv7NUOrHNFqsVgqWtMPTX55gRYvL1qgud
 8AccMXeV/CLo72uvm8Q==
X-Proofpoint-ORIG-GUID: Jk3Z3VFWsLpFcUeYWHsYvwIzblkBw4q5
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3a98e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vA3qWFdfvwbCGvS2NoYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Jk3Z3VFWsLpFcUeYWHsYvwIzblkBw4q5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Adreno A850 GPU found in Hawi SoC belongs to the A8x family and is
the successor to A840. Like A840, its clocks are described in the GMU
node and it has the following power related updates:
  1. GMU is now powered via a dedicated GDSC connected to MxG rail
  2. An additional power rail called Bx

Describe this GPU/GMU along with the new compatible strings.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 44 ++++++++++++++++++++++
 .../devicetree/bindings/display/msm/gpu.yaml       |  2 +
 2 files changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 9e459f12ce3f..875fd1242528 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -55,14 +55,18 @@ properties:
       - const: gmu
 
   power-domains:
+    minItems: 2
     items:
       - description: CX power domain
       - description: GX power domain
+      - description: GMU MX power domain
 
   power-domain-names:
+    minItems: 2
     items:
       - const: cx
       - const: gx
+      - const: gmu_mx
 
   iommus:
     maxItems: 1
@@ -359,6 +363,46 @@ allOf:
             - const: memnoc
             - const: hub
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-850.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU MXG AHB clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: ahb
+            - const: mxg_ahb
+            - const: hub
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: GX power domain
+            - description: GMU MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: gx
+            - const: gmu_mx
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index e5efe2d35ddc..3438eebf2fa4 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -415,6 +415,7 @@ allOf:
             enum:
               - qcom,adreno-44010000
               - qcom,adreno-44050a01
+              - qcom,adreno-44051401
               - qcom,adreno-44070001
     then:
       properties:
@@ -452,6 +453,7 @@ allOf:
               - qcom,adreno-43051401
               - qcom,adreno-44010000
               - qcom,adreno-44050a01
+              - qcom,adreno-44051401
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.55.0

