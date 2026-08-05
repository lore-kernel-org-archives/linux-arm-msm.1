Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CB0471433
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936107; cv=none; b=GSbdeODaHPIdOE86WLYV5Udslk7mdKDniUMf3krO2wFNOO312fcAQWiH6mNI9+xRUuITXwGK0MGZOIN9mtTUeznHIgddyLFC+EnEK2Ily4OwwMN9kY3ltlFDnwj0Fj5sim7Z8tIqUG7YL4zPWNVpRz230DLsI/+bhhWIazGGfi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936107; c=relaxed/simple;
	bh=qqssz6IAbBbmca9JLdbkbyj96NpcQiOlBuVMR0m1Xzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SS1ok2xTjJb2ilD5MC/XtAbwMNUUCTxxz0KziMvCq+DqrTYmTu3eLVsv4CRkqPYL0NsmyfWRx91O5fzOP4ZEgXiqjipceysZgfy7WIJHIfZ4TjDgX6bsCrKam22IrCWfKL1lHo10IJAfCt/wt96VE5J5XhbH7tyQ5Lp5aNiVF+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmaNVZ10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuikS8VV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmaNVZ10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuikS8VV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DItdb2775045
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 13:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6bSVO5mGpfC
	x4cQJzy/bAyG+VV8bdvhBoSx/CKDEJPQ=; b=pmaNVZ10/NfWj+6ZXvG9/o+gFLB
	BB+M2+u+Alit61RR1zgPveP7na6ubzZAc72nZ2DMO3z4Vc73ZINkSwkJrD9E1HnO
	+oATETM4kk5oA4cBi+2Mi2Qw8b9YY6O33p+XGJ/KHrBYFxBbXxp48ett5Sx6Ueb0
	pAApOTzni5VKOEabfQ9YZzSviBFLICFZ+asWQJDh8pRQHiwZAI6x9BgHdh86K/sA
	bb7OIGddrGv8nKQBoRCArXfzqXhBx/cB0GqvtAzmM8EISBQqax2m+lil4bF5qc5p
	IMd7YTL6tc74Sl87Q0AJE26H9bIlzCfGlRnvibm4LMWFRRcMzu/BNLK0mIg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x9r0nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 13:21:45 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a17dafd042so894527eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785936105; x=1786540905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bSVO5mGpfCx4cQJzy/bAyG+VV8bdvhBoSx/CKDEJPQ=;
        b=LuikS8VV926U5yUjmnibtZUew9hcuVZbI+pdh1LVJFUsbCImFsRJgFD35zYTpJQZBY
         dOQmUOBf/MSlWNy/Av1eCa0RkZMR4JgRFZ8+DoCW6F6ipkAKZrhERK0+/ZFD3ODoLSi8
         US2FEoObFSmkRCQR6OOTq5iLRN1IcFQrA7LH9MYLZpa5W1+QPsLINZ5qxgm8+8GWEzHC
         +B2qvJ7D1xpN3FzJu2NHBmJ+p1pNfsJPmzf0ywqWS2c8m3nygYT71z4k6sy45u2wtOPa
         rgbINOP3wxr8tcWWrF84t3Z9fEfz3tQX/LfYMsgNwZsbB2cYE7lWlUhWiFRtiSUwoNdl
         CDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936105; x=1786540905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bSVO5mGpfCx4cQJzy/bAyG+VV8bdvhBoSx/CKDEJPQ=;
        b=LRYeOuImcKUGr58jJNWE298ZdkL//lgL42Axadf5d9gsyFSbdgg2XTj8tJxHba4NOp
         V2yvHmfFU6D+YOyANw1UI7kzQPXaX6jBs20n4ZOV2o8ASMgKnRy1h9Do29NhPhl3xb0A
         mO+uww7cEJorabz09wOYnKFfcnhTL18sR+sAmF2EvNZ3U6oFNNFjNl/uHNqxz1B+mpme
         /4Z8CpwaC+XMHR9PePewBjvQbZh5ww8I/gLQG89zEyiXwa2ww6GjXRtfYXkuhzKh2t04
         Qjowbf9WuO+JtW/ewqXvbShvr3MVgKoEcajG3xxgE+ikC1snjdteoyhFyDNDQbDKZPrj
         5hsA==
X-Gm-Message-State: AOJu0Yy+O3doAj9ctEc1pthxHBNTEA4b5TXyhRDsrFTIOOnipYZdbf2x
	PXbaaoDycOhZ4CKkOYc9xcTph7Nd5szVN0tJ0vrJVsDQTIYZ5Br01Q8LRH51xs06zKsACDF13Hv
	PbatJIYSpl1RN6sI3Ufe1koeMxyLezODV5AEQEchS2u2KohTFgFIhWOLRlcxbtkj1eMQP
X-Gm-Gg: AR+sD12QHcyhqKZpgVf/i5ha5KunrsygVHTdxCBrs+soCStR3GRBJS6X6mfTmEDFLGe
	jmcEWt9a6UJN3xyfHt250CXxqcpc/fTTfBGxXWE8XlOYUoW82OlaYHq7ZqWG7T9V3tCuymgxM7z
	zUd7Nq/VMazP+v4MMiWUJB+ZJ8lwxwGrZTbzKazewIP4xUndW2bYV7VqCpYTAE8KM4f9jyUG3mn
	ZzXNKZZmgepKNyGgd/3+ich4od4MZnp5A821YH7SURLwxvZi1syJnXql2+9X/slhLE3yOkZHO+u
	k4h0dKjX8/Uepr4q7xqgVy8ole6Dbb1/8NGx0x1wpN2meJjsrAr9YKtgdmcfqeo3QJJnytereyd
	SgOWREyWvBmgDksiWwsTYevQ+krg=
X-Received: by 2002:a4a:e84a:0:b0:6a3:7ee4:11c7 with SMTP id 006d021491bc7-6ae96f9d0e9mr3269018eaf.29.1785936104900;
        Wed, 05 Aug 2026 06:21:44 -0700 (PDT)
X-Received: by 2002:a4a:e84a:0:b0:6a3:7ee4:11c7 with SMTP id 006d021491bc7-6ae96f9d0e9mr3268976eaf.29.1785936104303;
        Wed, 05 Aug 2026 06:21:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e63d64asm2412596fac.13.2026.08.05.06.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:21:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS as SM8650 fallback
Date: Wed,  5 Aug 2026 18:51:27 +0530
Message-ID: <20260805132129.2713174-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX1Th489Ui0iW/
 C/2FP+qzBssMgzt+b8MUpuWUFsIu6nFS41Hd2DmhZqhMc47yOhW2CxfSK8UF6dbtXv2H26nJCdt
 CKOW4/fNMnIzaqbMwe2buV3zEHd6ZoiiUlqanZ9xme7bkD6phEePs4mlRJ1sfJcaOHZifU8pFnO
 ylvgoiPfNqtFLUdODajmXpuWxXKCde2ul1ZpqfyW4pon2Hj43VAcfM3srBzPpO977KbrpLU8O87
 HFhKYWb17Lye0mA5k3GKh7BbecKT1gI+maNkz+uEcbE2qEi8/bHYwndRZ8d6LoGHhx/SIBHoFnJ
 SShK3UDBpKEKcxyQI+ePNg5THPtlQzQlyXv5VOYL9mPqiGnYNVgHALJm/fnTaDhH2n8HzvAs/Hi
 YfOzafZ7N5tSM3ma6+TZAObqKOIygg==
X-Authority-Analysis: v=2.4 cv=BMqDalQG c=1 sm=1 tr=0 ts=6a7338e9 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TCzjUf_GE5tPdZehUmUA:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: gRgRbTsUAu0bc7LGxUPklaUCRjPBmXlP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX6IoUdjo1MFmi
 QCEsxEbaVWMaXq1IWl7prN9oIASqpHwUaQRyXAP4T0zKHDsaRD5/Wuq5xN3dLJlxb2yGSRWfnW/
 RDK0zv+TPI3BIhXAgnIzpTVbTpP7+Kg=
X-Proofpoint-GUID: gRgRbTsUAu0bc7LGxUPklaUCRjPBmXlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608050108

The Hawi and Maili MPSS blocks are fully compatible with the SM8650 MPSS
with identical interrupt, memory-region, and power-domain topologies, so
they should ideally fall back to the SM8650 compatible.

Introduce a fallback items block that pairs qcom,hawi-mpss-pas and
qcom,maili-mpss-pas with qcom,sm8650-mpss-pas. Switch the mpss
memory-region and power-domain allOf blocks from enum: to contains: so the
constraints apply whether the compatible appears in the standalone form or
as part of a fallback array.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index c58e8a6c7fe1..ae74aa4bb6cd 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -47,6 +47,11 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - enum:
+              - qcom,hawi-mpss-pas
+              - qcom,maili-mpss-pas
+          - const: qcom,sm8650-mpss-pas
 
   reg:
     maxItems: 1
@@ -203,9 +208,10 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sdx75-mpss-pas
-            - qcom,sm8650-mpss-pas
+          contains:
+            enum:
+              - qcom,sdx75-mpss-pas
+              - qcom,sm8650-mpss-pas
     then:
       properties:
         interrupts:
@@ -253,11 +259,12 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sdx75-mpss-pas
-            - qcom,sm8550-mpss-pas
-            - qcom,sm8650-mpss-pas
-            - qcom,sm8750-mpss-pas
+          contains:
+            enum:
+              - qcom,sdx75-mpss-pas
+              - qcom,sm8550-mpss-pas
+              - qcom,sm8650-mpss-pas
+              - qcom,sm8750-mpss-pas
     then:
       properties:
         power-domains:
-- 
2.53.0

