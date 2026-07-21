Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4376046DFF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655178; cv=none; b=mU2gIZN0B4wEDCugcE1QrEt2YGyzZEJ+N4jqQzSkIO0sj/3ucxBHJyr+FraJrFvePlx9FBavsvy1MFpIXgR+k4vgi9uw2vPpuISjwmmsHIHvp+QO0dSSxlgKLtllMLt/5yFzIPtwzdEVteZPj6x4H2uUaEb28EwvoEmxaxow2c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655178; c=relaxed/simple;
	bh=CggmOQ31MuRitr0vhB2RYDOt0RdlNTJib0BCVSwnUCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tptSyxCFppxdfDYS8//evDAfU5ot8pZYfqBmQcJE/2PoKMpZosjm5wyWvZkehWtW4w/1KBGLR6cqs8wxs8tLny8YE4hYvOQ/YE9wn8EGI925gxWI0ASQ6ehQbbqXeG9LMfqKgdXV6hm2WI8obz5LzdZxb55gtufrSjhYsy+qBl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSkgp2WJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOU05vS/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSkgp2WJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOU05vS/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRRKc2376928
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ZV0byA1dI7N48pHPo0h4yPfRaU6wDmRZ7alAnATw3A=; b=TSkgp2WJp765zYf0
	frysoiWLG8iVPGIsYh3MnG7NxpjXOsGeb33Hu4DCse5SAvDUmS102Le5U9bfw2I4
	n1AamYr83PWJO0v7HqL+CdXkr3Pzgqpd+cR4NRRnq40sNm12h1bOG6WvgGdHH6oh
	xIIQObtMioFNYguYVLP1YSq38Yx8R7d9+wi1DHVEInDGkEiKMxDM7teI2r7z2UZn
	eQ7aTPFuoo8e6RrmbTO2uvfOpbFmT/fxlgKckpxx75u7izEOHduZ1cAbe+mpLRMB
	Sbp5/zQdEhIwsY093TMk67fCixULZIWsce4SWYfq+DP/8cOoyiyHGh3VyQc343O/
	ehYwXg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a8106-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:32:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb733fc5024so3779544a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784655175; x=1785259975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ZV0byA1dI7N48pHPo0h4yPfRaU6wDmRZ7alAnATw3A=;
        b=SOU05vS/ptYqZBFd7pIlJA+JyXxJ5mtwDs0gOCSiERkg+zL2dtaFMrjk8z0YtsXa/d
         oi7/GrItIG2bvy2t06+aqXWtRFdTUnSi7Nj212LhqXLXDlmIItRXO6Mx53Mw393VP4gH
         HtLo8XWj0eC0LeehMfmQFOXQ2JhNAOfgRI1WMDMKI9NQ+eYvm4OWJYNr/5gDodM0riPa
         WOYg75+BNZbBoVTxg5jR7e+Mjmz8V/nlLv8hkh+tEF4cRiliDe38WBzfmvRTQnx4T3qu
         1N4oH4GE4OqAXqCufUbVevvmhJ45Gre52A6S6YpIRT0fThG0uvxbhEsXbkdDA6YAA4dd
         rvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655175; x=1785259975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZV0byA1dI7N48pHPo0h4yPfRaU6wDmRZ7alAnATw3A=;
        b=g2S8rlakP9wWthOtR0NmqLVObnp+5hIZAOP0zb1vZyhN4OkWG3aub/FB6fPAOUe541
         wHGEcgI/aARHOah//+RaGhypuZNMRgU0EM/GjN5wb+cwbo+I5nQxoTlTo96JUY7w3gDy
         8qVIdWZ1hZy4ccHw/nzoYqxjjtn05sKiowohu5EIxfELfGbPdc16/WQ96+Yq2RLMZRj8
         gLHT3hwoO6NvqYTQjqwR7PZ4RY4v14DO8kIo7gCwA7G/asV6Mc0HDc2zEjma4W5NMp/3
         8Gz1fTswYiy+WP0j5Tc2rU1DbOqczx7pwIRJfkyA9tkh75rJorynNsaHpcwPscVmkDQh
         OXlQ==
X-Gm-Message-State: AOJu0YxW1ae128bdZGQyuKCDA8/BCdffNXiCql98mn75PxWj6LLr1TWQ
	zTp5wj2QOMAVjhcW3hlZtXBXjSn/ntx0l0xxWSqmetSTHvEmPmjY2RzwaRQx5VCXFyJJxudauSd
	mZC6zwdHZMj6lT1U8OYWPvqcXtQHu1bqLIRLN/ZuQow1InT8+xUTBs3MGg1BoPNkfPoXz
X-Gm-Gg: AR+sD109CMl5ulNlWE+iwsWTdZkcXoUuq6rGMUcPvtU8rb/dQuYsOxsH389gtwFp6Ni
	DiWddblzfN2pTYZOXeU7p9q9/lOYkNakC5PQdyw6DzoC62B2NJszhpiN+hmJ8PNnVpvEKpe4O0T
	c129+0fWJKG61orXnt34J/k+4IEwR4h1wC6oU9RBvKyO7CSl7kNk2Hm0IF5WcugU5nYQfjftZct
	HLScR6M4cVCgMJ1oGGpmFNaWvQMyktKNhyF1qz79jLvTjxBRv0DesBnnRsJupqZB039/68rdvo8
	z1VFNJbCj1zomKH4BV4jYs2G49bhG8pIAeq95b6nTIdRbPHimasCXw7On2xRP99NeoPEE2z4Qpz
	ykrrpfuFTthWs/pdepHxy/l17jcYVKEJ3du8=
X-Received: by 2002:a05:6a21:9206:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c3ad807e3dmr20042334637.32.1784655174776;
        Tue, 21 Jul 2026 10:32:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c3ad807e3dmr20042309637.32.1784655174241;
        Tue, 21 Jul 2026 10:32:54 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm710881eec.26.2026.07.21.10.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:32:53 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:02:25 +0530
Subject: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784655163; l=3397;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=CggmOQ31MuRitr0vhB2RYDOt0RdlNTJib0BCVSwnUCQ=;
 b=MWCowY1kQ2kxAw0RZGU0Chv54inswuKbhMIKhUN4uZrq6bPkgvij4T2piou9UvSMQVNDYyoK8
 86IPQ1i43GhDcqjYYflMBrqR1PqEgQjRUX5YwF6wPtC2EmxWbS2GhFX
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfX6UjBLueHeRWE
 SlBx1GRWnO1HM8Ya9LZQ2RpIP3PWJC0BcLRcASreCRpa1Z/RNfHbpMTATwAO9G1UPP0dTtHqrNI
 qiyk1ifSL/cBc6dJsDZIzqTMlKvKcXeLeFVjUT+iO5DD6AAqY5xOgA7SLWbZKyD/L6xhMOKrhGe
 Kvh6dP4+4CNazhME0tXG2D7TF94RkNCtDn1O77bSt1DKSS6mG1N3sUCqUT6o0yhgrY/SZlYXA5k
 agBCtoGnsr0Xs6DGQ+xT2eQqD/dBy+cieDxWIA3nk+ZOqhlRnCejuTQLJ74EWgGSfpuGHDa52db
 j++coWTPT5pdYLmm3ARbSQpa8MPq+3h5eGEqFHd1CcuLZzw8tp8rte8kRcX76MNRdjmqupPYLNT
 gR3HqpHw0xVObMoACoFeyeQaOREOOcpNrrX0+FYnZ0KCxCddKXocqvA/bJh8Zu3eLUKov3ZYuEP
 ucGn//HaCB0f6AjnjFg==
X-Proofpoint-GUID: QiQuf2aiqNzYHQBdE8Vv8sYYbCeB4rsR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfXz0z5TClV8cFW
 dgToQu/iYY/6Skdj/O5zosSBnExaBzIw0tfiAgkG7cZwQcFP5CFRaicS8WS6FWTzcvUAHSCOOAt
 Vuc2Ijvw06A0hsqbqO2Yd2IckPHicFY=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5fad48 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qEAlSW1Pjbp0CoYiPpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: QiQuf2aiqNzYHQBdE8Vv8sYYbCeB4rsR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210185

Document the iris video accelerator used on shikra platforms by adding
the qcom,shikra-iris compatible.

Although QCM2290 and shikra share the same video hardware and overall
integration, their SMMU programming differs. QCM2290 exposes separate
stream IDs for the video hardware and the Xtensa path, requiring two
explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
and Xtensa isolation requirements, such SMR masking is not applicable on
QCM2290 platforms.
Since shikra uses the same video hardware as QCM2290 and shares the same
programming model and capabilities, it is added as a fallback compatible
to qcom,qcm2290-venus, with conditional handling to allow either one or
two IOMMU entries.
Common schema is updated to accommodate the iova restriction of 600MB.
VPU restricts usage of 600MB for specific streams, which could otherwise
lead to device crash.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
 .../bindings/media/qcom,venus-common.yaml          |  5 ++++-
 2 files changed, 23 insertions(+), 8 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2196ab1e4588eb396012ba6860712..0be2f9119e78233928d23af86836ac294aa769ee 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -37,7 +37,10 @@ properties:
     maxItems: 20
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
 
   power-domains:
     minItems: 1

-- 
2.34.1

