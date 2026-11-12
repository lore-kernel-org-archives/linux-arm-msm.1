Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474838;
	b=40ioukF5ABe55qCAgFYilrxsCVn6NdyBYywJqOnfAjh0nqHdawtjWtWdMGqh85DhGyne
	 8IaKt1T4x1/K+XLRp+Pwyd6Qilc8DVh2YBBbCq5FHc4G6Mrb+/lQv9qRyTpWI71vAiUgu
	 OdAyKaKZs4rGTJK/cXpiq9mFTNDaSBVTFi4XrhCfngV0tVC+S9M4CbiNe9mB28SHesN7D
	 VabsnYwNna3CtGMeu9hzL5qzFTkT3pM6eQIC9rYeo53wV/eRhr1Chn4JmGNqH9+JPhdZs
	 q9Xj5zv2XGRSVv4Uk+Lr2ytWRfIdnD9Phcz/F2LmlC1x0RD0wkNa+P4F/u6l2/ng8vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
	b=zoe2Pr1PGD1GLhYsZI6cDZpoQiPMlCjVAii7YgT42YrsH6FSSvEME4r4BYAhhnGAX7ZC
	 FR6Zf8QQqO7xdkg3YW5WUvEYuEbMvjYV3Xvh/Cc39egVR2wtYhD9g/9vokvvSKjDnXVt8
	 bLCSVWzsVAOoC9BV+VWXf7EGhL9yB4/9Z4X/MevGu0nJlkuyIqxpZ0MRs9OBfW50koIUN
	 Dnm4if+petj4oJuS5enyVdXXjJel8Nz8pOK4Xx/bRWVwykJ7E0At2l5c4kL/0gRfi+exD
	 aCFm8RSBZS+0khdY8IAS1+ZjUsXUiJpLb4JrUuls98Pnt4TEcwv4eYFW0o+8A4rNRLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5yHE4Mo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnw1Ajtm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14156606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14156606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5yHE4Mo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnw1Ajtm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oWYx2818579
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=; b=U5yHE4MoSrOFQ8dG
	+RXiacuPCJDYVz2lOhHXDsZOSK8Yyqp0SfKoTibM4PUZiyLaMnwW1Ulx85p2U63p
	kBTkcpzDAdP8dBt+B2Zy8mhdCPS8ogTwIdD7izHeYHlkQOjePeRVfUozxzvKARbs
	U1AsGtnrNlj6wTcrxVhNcajS7P6KSOH4O5j50mlarv0odsJyTr6GMgYhQzSBcnp+
	gUyuGYgisBub2hEfvVqMxN3x/5sE9R+ntr7RHvQy2d+BJZxi2sK4lyo8zKrMlfTF
	KOpHPtx3zpgYxYDdL+dTakjHBsCCWzsYiVFKJHIh68vrlzWf+mmno80hzOtQDcFm
	inZdYg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e18ab1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:13:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so3428087a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794474836; x=1795079636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=dnw1AjtmU6oWyQrLag7p/C8RuZR24ZbhLPbyGpJCLMD9+/0hWmj8kbp4lMi7YzRYro
         dZiLUDHxF+Ji0JzncfIvSN3s7P7UaalxS+KUG0q4t11OYDLNQnfq9Y82a6onsYrCsR2+
         ZKreWcPdIClhSS/KnB8nCu79Vq0FFCuBupf8Ze4Fq23mlffOKQUz6XCKquG+K9Zo1WUR
         FCSLrVl3B7jd7oZ26d06W55vms3k72/FCUuoArOab7/WkyPQ5tSq+fmqSxiZ/MBmqbRr
         BJGw2T//yh2fCWcsfOD13r1wWiulb0Ri5Sup5ZKbUB8Cc2gOv1NoZDaSW26l9GOQ/rDF
         TNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474836; x=1795079636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=uzb7sf5OX2HSn4trRp0Mcb2P5zw2IMiWFTWOyEM2wkHJI3Lh4qjdsDOzeekRECDBLk
         NjXm26vfVRc4uIEq+DKSxRTx/hge1rgWYnn0SL3wdR6+1N4/tR2WUtc5xMzC1Os1Wz6K
         jldMIm5pjnJ12iBe/Tj3m5a55601XAqS0qb13+diKGmWe92DCJb3C2vT2eAKRYiNs+rj
         iWIR7tCyqFOHBA8wMM+vz/tC6wb1SbS1fcNbjAQSIkWKUK+pJUX46s2+Q6yILm12EXXL
         62JCXve0KwDhg8m9yXzg8WGcjAuEtCpm0CWMb3JX2C94Lzrtayt7zV+4yf++nDwSwJJz
         Zuig==
X-Gm-Message-State: APuU4Z+arDAsT4s8lE5vlV2EKB7EppHdSfe+8qsIHH/GWcN+fNsiLY6s
	UCYJv955l6++LTbE2zNxhSpkGLPfHICqv9vq7rFQ/lpzq2Snvrg4uJSz8nNi/c6a1UrDdP+lxjR
	BqcURf0GBjZ1wL2GsvBJOc7q0G7YxzqcgwXMIIgh9ioOUSl/0BNlEDiix3LYECmbiruod
X-Gm-Gg: AYBFou0vq3MOg52544WDGG1U+wnWd5fkSRyaLZGdh2XbtqonSRD+YF5kYzlZliCy4fV
	yRezPCvZ3SeBs+dNhDVRim8ir5rTbuYzVq7JZ50/PfM2+ZgSIUV2Zg4vWwvf4gx+n0Y5KBOMKzg
	51KBF2D1BqJfi+sQ+qTx17V8LD2OJL9eeDLq2xNhGFd+jQUcNzpa3HxangOh3Y/tELs4rMW/BkP
	d8OoXPx7X0invn+e6H3GteQ9fBbvl2L2Al1hd3le7yacUuURuQ8PyBK1kpcZR+w0IIPqltUvhDh
	fIPuqn9M1sSj97LMwzShZAJW0mqrMZqHC97QPmQ2YH7v5HrEiZCmYBBN/zM6ikTRE4HhdczX3ly
	YhmvJJLGDlNrDuQsjxFvhI6cljZJ4IEbYxXLAep3nu/dhciOWtedjChrziwfc7ZH1hf8zaOWd+J
	9i+my5+qbP
X-Received: by 2002:a17:90b:2688:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b182d4462bmr4668300a91.0.1794474835839;
        Thu, 12 Nov 2026 01:13:55 -0800 (PST)
X-Received: by 2002:a17:90b:2688:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b182d4462bmr4668271a91.0.1794474835323;
        Thu, 12 Nov 2026 01:13:55 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b19b533540sm3019826a91.8.2026.11.12.01.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:13:53 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:43:31 +0530
Subject: [PATCH net-next v6 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-qcom-bam-dmux-vmid-ext-v6-1-7a16bd3dff18@oss.qualcomm.com>
References: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794474821; l=2657;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=wycrMmj1886KQq8u+EMdY4E91b1IT2gBezsXLoyMxGA=;
 b=B6KFCbpONrzKHQyrEE5pvoEsRxyBgXHPOeZ/QAFWpNbEkxjGPsOfehvl2JQ8MJmARH1yJvFB2
 Zr4yhqBM7t9Acpk35wRgv/AnRqZtrIc9hAxHdmg1ejmssFHMZnk3hj7
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfXyzT3GCLYNW3q
 7+jvn4DuRRnqCD49AdtJBQdJg1BdNExADsarZBVI37o2xUD0ERCPQrmazTmjCrmZ55noClS7cqO
 jdXZygzvIiOJ7pd4noBoDJO8gJy8wIWTS82DvJzAtudCf+7VoRlPRCw7gLExEdwReZ8dBMnHSPQ
 72DF1LjgzKSEp8DbZRCnTsD6k5kKuCsE61lrD421HDWOIsOCbEIw8StVVbUxPiW/NoSjbNRIo+3
 FNHm2GSTrNUTLknPDt9jN3JvGyPpC2riFIAI5y8hE1F9rwvUdESg9uAEjdUKSxMWPTQMXNl+b0l
 kvCrCpZOMuXGqAdLc0brVkU/c8zg0XhYIs46K6z4tQt0WSpOzPLppY3WW0F6t7S23limXt8WeRT
 BvGl149tdmNikyKl+0NUYMLPQ3oAMwuad0h8FymaNmrUrLw+imQDH1vXqZxlOJkqjru5CxR9ety
 gHBfNLPIMZx9g4pBggA==
X-Proofpoint-GUID: CF-ggLi03nSnXQwsJs-2lIz2hb7L7uMe
X-Proofpoint-ORIG-GUID: CF-ggLi03nSnXQwsJs-2lIz2hb7L7uMe
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af58355 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX9UAPt6Cr+BAY
 lI+YoVayMLYnUxlxzEkeYZyHtUsV2tw5QR0pP5/UueCWk9pG1X7rs63ZWBNsvTyJWPQef8SEZaj
 drSa4ku1lxdFisE6gPJWUfMiu8RfLgc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120036

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
must therefore be constrained to a designated region that can be shared
with the modem.

Add an optional memory-region property to reference a restricted DMA
pool used for BAM-DMUX mappings, and a qcom,vmid property to identify the
remote execution environment that is granted access to the pool through
SCM.

Require memory-region whenever qcom,vmid is specified.

Add the qcom,shikra-bam-dmux compatible, with qcom,bam-dmux as fallback,
and require both properties for it.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
index 33746c238513d72366bc52359fb10f275475b331..f7388d24c8612b5a99d5d0e66cfbe2de3b1c9e0d 100644
--- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
@@ -22,7 +22,11 @@ description: |
 
 properties:
   compatible:
-    const: qcom,bam-dmux
+    oneOf:
+      - const: qcom,bam-dmux
+      - items:
+          - const: qcom,shikra-bam-dmux
+          - const: qcom,bam-dmux
 
   interrupts:
     description:
@@ -72,6 +76,22 @@ properties:
       - const: tx
       - const: rx
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved-memory node compatible with restricted-dma-pool.
+      The BAM-DMUX device uses the pool for DMA mappings.
+
+  qcom,vmid:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 1
+    items:
+      minimum: 1
+      maximum: 63
+    description:
+      VMID of the remote execution environment that is granted access to the
+      restricted DMA pool through SCM.
+
 required:
   - compatible
   - interrupts
@@ -81,6 +101,20 @@ required:
   - dmas
   - dma-names
 
+dependencies:
+  qcom,vmid: [ memory-region ]
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-bam-dmux
+    then:
+      required:
+        - memory-region
+        - qcom,vmid
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

