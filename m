Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83843546E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727710; cv=none; b=Of0FlqiFbrSOY+5IhpWypnmBZLxPgcxqKLASsCS4m9o4j2GtvJ6LSyon6UIlc5z8UOiifiMb5qVsvcXcoiq/KqKRbs8X7EX9aN6UYO9Kvu5kADPcb/1mKSR8XgeNI82zTCg949Nkg0KgwO7uO1NSDGtdLXfNpTAwWtTbJRGplXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727710; c=relaxed/simple;
	bh=0RZ/cmSKSH9U0WD9OpnNl4ffXUKSWrkyYXISWAMieUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AR/SrM8yMvnDgrNTaZXnyPCgOyOGYUdb001Ywo6e8IHgvsQgfVJfaohEPzv1cDNNGV0fnbVLPwD9RH6jyXY7k6BNbZ9QmonseKrwIyc9Do2kKYDYXWNLEescVRy7ClCHPavX+AlXeBOXtYpQNfZvQXCMIi5CRjLDiQcEjaveZgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTb4NSMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXzsRHft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTb4NSMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXzsRHft"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWNQO646343
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pU1maESxsWIi4KN527jr8n19yqSRn7601a0BdQfJzxo=; b=bTb4NSMo10QTThY7
	Nm4FpiNyJjaQLmtsRv6B9sk6NSv7H0mrGcyyu+JJERZrNIfyiGhyoS7x2MjwY/Pm
	1BpRZuf85vd0bsmprxmD+kKiGDFSRaQBzOpBqAaAOsZikam0VdFlr5fxPIl6c27t
	/aPlMhsFC4OckniI0cAHwnBFGHmMD11breY4jUqfS7zGh1N0E+BNcv+TZvomAlXH
	J3JlgYAD1an0WxL8Vmf1lGdR9163DqhIXcMdW5Dav4HC1N8+Jg/W7ZlG1Tbqp26x
	92um45ezjFffMpoJuwhZEu/07tJvffu40g01CoIIyD0uZRcGK3RtktqEg7b9Vscw
	tO4EMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju2292tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:41:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so246946925ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727708; x=1785332508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pU1maESxsWIi4KN527jr8n19yqSRn7601a0BdQfJzxo=;
        b=fXzsRHftsQOQeg51uzdJR7zRTj1R0cnELPkaKgdLu9uIUaEKZRV70v2DRLQLuHjxtl
         W/IFy+rBLemzLn2Wn8bhiaQTdSJE6jFqJjxBUcVMFAQZx8piSFnpjBr6a3JSl+WinPdK
         BtoTpLBnEK0960Ihodx+pwtWh3Q6Dm+1gXwSlx4M8iBu74SNNQd9vxda2nFPwYyOvCPi
         1O3yCdjQ/v5O/p3VLuEe217wzKBZVvPGnZYTYaKfbE2s5YmAx+BX5zf4abbSCDDFvUKu
         mVQcYkik18bh1PisZJN45FZFYTAqYmv4OHsljiP0FBjx5zr9j9R9FKsNOP5cpZ+ZIYtA
         GVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727708; x=1785332508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU1maESxsWIi4KN527jr8n19yqSRn7601a0BdQfJzxo=;
        b=F3MUw6WzFj2gCMMb+2KHW7JJWk2+pEjmK26NxzjaHrXEXNyMIU2k8GPj5c4YRNx/9+
         FBwo2O5bfdLfiqIy98W6SwBlxbqiUHPWWx/gp2xx/JYRdpav9vOzrce6Dn6PIoj8Vjzi
         a5Lo1RLiZ7xkU6yAWHf/ffVWPDC1ou+RcDl1tbybJ5rGy9wE6wrchdg5jYVKYvUKVU5F
         gZnlNzYcE+dIex5ZFchvuw4tlRoRfbr1fC//g9fuRr7HqbQfLP9G3TbDJHlRjNszUgt0
         S7ZvrV8hlRVbFUImLdTf6UbJ19AAUDVV/21Mn+Wx2x0fmoAJHHK4ApKN4N+yE7froXia
         nUJA==
X-Gm-Message-State: AOJu0YzDtIKwBpCeY28re1W077kmTccbeOLpjKOUflXP/Bk1KLV+HK1u
	kja8+kpwmI8y/Yd0j33R1DNF9wXzv3rWYbjqRXopiiOH5NNIFPblrc2FcajWZ1Roy3VXcnGEAP8
	/ZquPHnSqkGuB3qS25Lsjrugt2UCQAt5B/vfl9/sRJ7afe6qJbWoodz8EuN/a9/LCn8yX
X-Gm-Gg: AR+sD12U97gC+zhJZvYsxuuqOYTMOvUEQ+4drkxp87dyJQ5YSkqLjEp3a32TCjw1vNk
	uEy84A6/saVjLj/r4ByVlfH5qwgAYkr8afeAj/2AZ1h0VxCWf2AcJStAOXMkZ5zQj+sWWoXwamY
	e7k1d+dPLPuuS4vHV8jBf/GxvF5h3ehof/qte6R19OmN9Ouhv7IUv1gmP0i5h0AGrmglpwsmI7V
	KYUvCXGLat/KNVPv2aQadwO3HtdMr+rnNuuTTaAr2Wjw5soT/qu0ixWQOT3JMbgcpobfhqG+Hyh
	FxTD9G7rPkbelIfxPx5ccMNIGj5QYuCyw5e0ZzVfRb4kisVgKP8yvGOupU1RtVgO2AJQZ3C7Sls
	mPCOQpQOM4CUP5aD+tyhkkDc3qFFs/tcDc9s=
X-Received: by 2002:a17:903:228b:b0:2ca:e0ff:e696 with SMTP id d9443c01a7336-2cf34836235mr236756125ad.9.1784727707339;
        Wed, 22 Jul 2026 06:41:47 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2ca:e0ff:e696 with SMTP id d9443c01a7336-2cf34836235mr236755735ad.9.1784727706869;
        Wed, 22 Jul 2026 06:41:46 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm15186705ad.80.2026.07.22.06.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:41:46 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:11:19 +0530
Subject: [PATCH v5 2/4] dt-bindings: media: qcom,qcm2290-venus: document
 shikra venus compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-shikra_vpu-v5-2-3d80babd4672@oss.qualcomm.com>
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
In-Reply-To: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784727691; l=2515;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=0RZ/cmSKSH9U0WD9OpnNl4ffXUKSWrkyYXISWAMieUw=;
 b=RYmm4lB6O5bF81ZbrhAreuYXdxtyDlmJ8mXIa6qbwKaxWIguPl1F+B/GIwvnOOnl65lEk3iKd
 xd1D+hlz7SpCsZJh/oeQxum+oen1mdPj7BCyCB1V+gnl+zrhDHdF2xe
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60c89c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vu35gHCjgte05Dde9DgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: WA_7lg7gI1W5xBJbaRtaB3it3wgHzpFV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXylRi7UonRBfM
 zvVYvwv88SolEIdB3OI/vTTyTWuSRJoUK1RZ4SHXCMCo+ZKSVOQC9g/ugnxHhxAB2Ueq5NOuLJ6
 Dm94NQYrTH5g3ML949kf8+jTRDdVPuQ=
X-Proofpoint-ORIG-GUID: WA_7lg7gI1W5xBJbaRtaB3it3wgHzpFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXzLLRmGM2BEau
 SJX4xz0n89TLUwXXhm7yFDHhfZf0MpmVVJko26xefDOyzINj2NRacX1kP3hTAyVGLlE9Jp6+jur
 rGAuZDAYDKbVTrtqqjzTKKodKoczHnywI+hsahmiPfjRVUEw0xnpw70oBoWs3FMhlsHg2C+3Rkp
 U+vsT4IBlawUOZP550mFcBkTBp4qar+av0WS+SZxl4voeVypA5tALhl4J91jK/1sP1wILGCPa7r
 C4ONdNba+W4bgs1HGcwyfqFXHWnGJ0YWBqBKHB2tUGJbAcFWVVY5FMvc/OGJzS7igy1eXVviLha
 T5WoZbkmCW8nU7sCAZX/or3GXbfViQvhAGY9+EXduw626/WaLcPwpcj0SESSRoU2y2YzM3Pfgin
 lmsd2d1IwJ/gzpphOxjFndPVrt6Z23zG4TCybA8MMxKKuA7tcNcqCPlOyoY8f9MckhFMElez0/t
 Nz2irOFq116925cjiUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

Document the venus video accelerator used on shikra platforms by adding
the qcom,shikra-venus compatible.

Although QCM2290 and shikra share the same video hardware and overall
integration, their SMMU programming differs. QCM2290 exposes separate
stream IDs for the video hardware and the Xtensa path, requiring two
explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
equivalent stream IDs into a single mapping. Due to QCM2290's SID layout
and Xtensa isolation requirements, such SMR masking is not applicable on
QCM2290 platforms.
Since shikra uses the same video hardware as QCM2290 and shares the same
programming model and capabilities, it is added as a fallback compatible
to qcom,qcm2290-venus, with conditional handling to allow either one or
two IOMMU entries.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cda50ee30d875e953 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -13,14 +13,13 @@ description:
   The Venus AR50_LITE IP is a video encode and decode accelerator present
   on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sm6115-venus
+          - enum:
+              - qcom,shikra-venus
+              - qcom,sm6115-venus
           - const: qcom,qcm2290-venus
       - const: qcom,qcm2290-venus
 
@@ -45,9 +44,6 @@ properties:
       - const: vcodec0_core
       - const: vcodec0_bus
 
-  iommus:
-    maxItems: 2
-
   interconnects:
     maxItems: 2
 
@@ -65,6 +61,22 @@ required:
   - power-domain-names
   - iommus
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-venus
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+    else:
+      properties:
+        iommus:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

