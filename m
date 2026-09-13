Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9823FC5C4
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325397; cv=none; b=YJEHZMImL5vwk42zdCI5/uR7b2HwoCkxqUu4kxPqkLbxig3rziaO/2CPDDzOweLe5Z968B+HM43ZmffoohDEHPjCFfRM6B0TX7RCxGEBLR2ISeObZAAR+V1FfClhzOWRLyU3Hx9YqfEeW3kt8dKJ86dqizD+SzNr+c6mt2lTgFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325397; c=relaxed/simple;
	bh=AiyWfqplixyHhsYEa6qazzHkZE3xEPK1wk4cmDCQzxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YzXmYi4E7Iw1YCu9Z4x7Q4OnZLa3C9rkAJFhmXs61DqKBkRNDsXiht1U86tsE8QBujKR4Q0QtsyX3+LOmqI7KvlFxlIHFi/buD3WtTA0ug97nCTBOwPTSQs+pJ++tHfKWccr1apXVY+1I7Cfn4PXVQdIKXvaR5YipCVIJN6SUUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpnZospk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzZqzhSK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpnZospk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzZqzhSK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2faN1749458
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/B543lMo2xs5fq0oxi7+gzjq2nnRamJAsArnba3yCk=; b=ZpnZospk0atr1Q4t
	GWeK1YAhSl++J7e+yWGzMdx5FSQ9mE8F+oKDuu8tpg6eXbvJ1bALB1gR29VkOyeZ
	bmGxfwg52pVBsdkZNg6JuSkSnq90jfrbuCy2Y6NABKchbj0Agv1WzQMmhLlKOUX+
	oi738aHpfdNw0lLZxLb2OWN307hEr4aU4/eK/E6xaHAOQzJyp5cX35kcEdbzJt9C
	UoTro1WO+1M4E0rk7h73J7sT2HTIvl4kYORRqXA2IeT1Pn1JbqN44rS1XV6wcVoq
	AZTLEWJnC+/hrT9Kbs0FGn/wJCrRbCwM5QcJ2ijEYCmmdzYVKzeqiH8yPyc5R9qr
	MpX4qQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbw2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:49:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so4566590a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 11:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325393; x=1789930193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/B543lMo2xs5fq0oxi7+gzjq2nnRamJAsArnba3yCk=;
        b=NzZqzhSK8O9w9H+165Uh71KsyssV+xaLJOFXSQ054h74lzthg95r5WpW+Z3GFR+yQB
         4fBDTuJ2rBUHLqBdrpk+fq2DIaCcA8LfziNNeUFwH/FOoKlJJsT4/LniP7GJu4M3qwEg
         3OJPGHjSUe+vGKVvMXVNSXXPoqHt7A6vKyJTK16+bua3Bh/w+qkK2WOKceaicPOasU3b
         scY36t3Bm03mSclVF3YB55abzTLe2jAZODtql2Ce2QZv6ZpcAE8y29IsJCX/60YMHmST
         Uw0+1h3YIIziafqGUJYgv1qtd9/Nlhh3xSGnB6M/DJyjShkLaRqVJ88aHhybaiwc1sjO
         /IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325393; x=1789930193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/B543lMo2xs5fq0oxi7+gzjq2nnRamJAsArnba3yCk=;
        b=Kjmz/yR8gYGEeik3Q9ap0F+w3tjUigFLEJacGoWtWSjh/Rr0M+SZ+JaaQ7Dt3zBKTw
         utnP0S66xjJgn0Xz3QKbhGnonYZnfSEkEjmJkWOcYbDxfpSV/m9lr8jGF9U9K43D+R9Y
         Ikp0ddhqYKp4FKbnTX//fSZFAVfp518FAWC0LWd3hfOKpoUaiQtvGjamPHc2wlaIuAqm
         bAMzKd4fd3B8GfHdAg4AebrmeWDuKe6igiykF1oPdJM6em6nP6PKAR2URvCv2WIpxxIh
         3S7QpKYWlD0injWYVFw5hexOJ3RK20egvqC4sQBvd+h9L7uJxqCHtyRYFg1mv2qsC4kW
         n2eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn01cq5yrfH/A6PIyBWEiwqfaNNgYQ3uhK800Xni44t3BZZWEgPMlKxF07QfRc1urgbyaPcq8685I1e3oC@vger.kernel.org
X-Gm-Message-State: AFuF++mUz7npr3Tgt2LaX06Q9wtv3lT6iFfwFRTgh7lkqbgyXcqRD3Kp
	yvk1gvuGKBRh0zpVfkuPXzM03If9vWQCUl6EaMzS+RBT/hb95jL2QLzTo6HsirT9+WtoOG3jFcz
	QblBeAwhyid2ECBacO/cZ+XUZkvAOFLt/7KnR7MHtCxfQVULrAhq7+TblyV6GhKKkH4fh
X-Gm-Gg: AYBFou0lodTCc5HtvF+4CLr7zBY5C9rLR0rYi1VQOK8l0GHO5IIliXS7gObY2w4m5kg
	F2q32ZnguFqvgmTH4Uot36nwt5FP9jS5Dq50YMvy8qwLGBzTCrcc7ari2KMiuQFD+XkMe0bVVLH
	JQRt9Xhbhfk7InI49rkCojbMNIN3xXXfOtlvvaU3AnQUfuHbiocgxoNmc0+oTx9/yOQdUARO+hD
	b6tTBmE27O8SGwwVWi4BDQytLuUoyyzytUKFni9X5uqY6lg2wV4ng7g355/GdcG1PZduo+MuYXy
	Qascx1V09z/5VlOgcSA/FuKdhZWRUZQ/JZVCrQwIjYMtJyj3A83+ubikUN9pWF52xduf0syJcdF
	d6X4PrSNtxMuAT2JehNwMa+7v/uNkmEB2Y/s=
X-Received: by 2002:a17:90b:3dcd:b0:399:ea1:5a82 with SMTP id 98e67ed59e1d1-39d9bc66ab9mr26784604a91.3.1789325392685;
        Sun, 13 Sep 2026 11:49:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3dcd:b0:399:ea1:5a82 with SMTP id 98e67ed59e1d1-39d9bc66ab9mr26784562a91.3.1789325392257;
        Sun, 13 Sep 2026 11:49:52 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:49:51 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:18 +0530
Subject: [PATCH v4 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-1-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=6062;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=AiyWfqplixyHhsYEa6qazzHkZE3xEPK1wk4cmDCQzxc=;
 b=seUnoj2xKMJ+NXtkcDwdorJnyiOhZ5yI5zE511+9J5owCUGD2ScaOoQdrNvNdU70jaB5Gg3oN
 M3sFFhfxNxEAq+AOdjPKv+18yIpYYKr40BTFC3UFh94ZvCYL9gcO45A
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: P_It5W1W4HKEJ0HuXQc_pwVNc_TU2PbF
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa6f051 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=weiu3rfF03DHpAy_C5IA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX+fB7YLaRS9y3
 w/w85tSdQZ6xo3yiL2gNewD+7OCLsw68U6vNaWqpKxEieg0BC6asD46sbwFXTu95jU/XOqyIvpl
 GL7YlLfc8XANb2BQ9K0AkT+eNXqhFyw=
X-Proofpoint-ORIG-GUID: P_It5W1W4HKEJ0HuXQc_pwVNc_TU2PbF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXz9REyb9vjl25
 0MDg6EXccdJ/vwMiY/tuUcN5MLzyRbnFJZDoJx6rBDQ9KQszY6YaO4VFwCSMdleSpsprDiaGSs7
 pIGCx0/DNGp0sKTsq3tHcPUdgsEBsMiadVEq4R5Pwln/qpmXXQ31RqUgW+ooGtpMw1r9xKEYPac
 pggxfUqkoOIg7dQCa5ZvDUMECJsxwT860/CmM0BW9eVFj3qMibNRbSmw+Pcjq/RnqjQyNIqf6Ty
 S76E1k9OQgTXlrAhEMeUPzd+dUrJFheIL0l1kzTamHZuWT9/4t9fX7P47t9v54r34mbkDLUfrnw
 xNwGSHl55DTwQO8Dx19P6K+nAp5k3f7nDyyIIz4HvpbQ2OUPvMfrgZXLeC2n19105Hiu3unM39v
 FVqp7fXPj2JzBXNXaQIMdk37xU7k+Q07Isi8uiR+vux2xoCv0o2Q9udrJqmbBIMm7vwOQsMDQ3X
 kE+yFkLtWGiCmZzhq9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130267

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

"iommu-ranges" on the subnode describes the *allowed* IOVA range that
stream is allowed to use, so the IOVA is allocated from the specified
range only. Define all the possible subnodes so as to describe all the
VPU hardware iommu interfaces, both secure as well as non secure.

address-cells, size-cells and dma-ranges declares the 1:1 DMA
translation into the parent.

The parent "iommus" is kept as an alternative via "oneOf", so platforms
that have not been converted to subnodes still validate. New platforms
should use the subnode form.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,21 +91,6 @@ properties:
     deprecated: true
     additionalProperties: false
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2196ab1e4588eb396012ba6860712..68d5e592a028c5eecde04ce72cd5ae6815ba5c82 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,6 +47,93 @@ properties:
     minItems: 1
     maxItems: 4
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  dma-ranges:
+    maxItems: 1
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-non-pixel:
+    type: object
+    description:
+      Context bank for VPU secure non-pixel buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  secure-pixel:
+    type: object
+    description:
+      Context bank for VPU secure pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-bitstream:
+    type: object
+    description:
+      Context bank for VPU secure bitstream buffers containing compressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
 required:
   - reg
   - clocks
@@ -55,4 +142,14 @@ required:
   - memory-region
   - power-domains
 
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - '#address-cells'
+      - '#size-cells'
+      - dma-ranges
+      - non-pixel
+      - pixel
+
 additionalProperties: true

-- 
2.34.1

