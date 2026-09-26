Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4233D3911D5
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404484; cv=none; b=omILBVnJJvFRX4IPr2TapanXFUogGxJW6drTbsKMXPRxySGpi9qDI/cWuGW3EnBLcIG9EuVokuWcoR5+lSB1dXD9F+v3ieuA1zKN6l7daFsOuO3ckfVRs/fsbUslBynMMUZUpkWhNpNqbC+19Goc1pYFkZYuTjtSayVjRzspNno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404484; c=relaxed/simple;
	bh=BW03Q4XvOkjro2dFuDlm8xAjUIoin9wCEv9Ej26ALtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4z9LcN0mJJaren3tJDMQ9vQVWCa79GECggnoLFc/bJb/OYTIS4y9kDYfz50YD4/ScrXhq7t5ESiHUAA0+7FuE5qFxrtPXcEYbZ/x+VFpQyvV1rqJTARFDzZi/n3ExEim7wBx2jqYgIaJYC+10FW4hhvLgrktlNreLcryYb6FNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmJEdFAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZPK5ob6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmJEdFAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZPK5ob6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6PGsN2570329
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fUCUMRhK9V9IecJSqtrmDpLhKg4IKuiveG0OpwaHrE=; b=WmJEdFAaK6qVxXlb
	FoC5SpdYn0LMOL7s0ufLZAqHxMZ1hI3MTbhCsxrvTNEiS9VFMazfso+WIFAkvQZ4
	PMut7lw5FnuncEwCfsOZt6QgdJoe0O9N0VXELwa/+/SNF1a/+4D4uz3VyBwYqCgz
	Tz9S9nwtvecdXR/JEvGq96A/sUssSXh1oWS2ypwsLxiDolw3qH9t7Ys+xNelGgYD
	4LzTONvl+ikZLDdin+355zEKwh/2WwBYJ6M3rWoTDMcuIB9MXLzHN6MrqvfPExL6
	aQ620XmxNk+oNRMW1fUwqh2aOsmZF4bMbMCj73n9zBrXOS15Re6agAQNb68BoYJp
	rRVXQQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6e808y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:34:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3282d5302ffso2206273eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 23:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404480; x=1791009280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fUCUMRhK9V9IecJSqtrmDpLhKg4IKuiveG0OpwaHrE=;
        b=FZPK5ob6bHZB91+A4aEJig+RN2MFetD+IBe0XquREqqgN9Efzr4Xc0q6a3pPdZM6FE
         EeCbo1trU4MTsrbZVak1hb1b0aWbAWHJ+NwVcvEYfPPEdt8xs/DItY2U/Nr2eMBORnaX
         IsD8RPXFQo2n14lo/xhxilCYJl5vGqAmrTLoBrR1c+X/RRid7yqmsuCWoNgwivmAUJN6
         4wlPeV46l3t8k35kJwoGa8DMy3QtFgk05KNKOY0+rWdfnE2X0tCqDmKlZ3lLeI+ERx+j
         Ub96+wJDzyS9OT7P/YNe0wB/fE2Pyj/VgbB6C8N+fmFoocMJrQ9X0uQiFS8c/+EWxyZr
         df4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404480; x=1791009280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fUCUMRhK9V9IecJSqtrmDpLhKg4IKuiveG0OpwaHrE=;
        b=dIUhCrCaKsB9c1vsaMCA9V0Yat7fnvyI7WpmQycxdMTG0zV2Ceu3CVLTxHpunpigb6
         mB5liw2gjRld+SyjFaFELQ+0JXQXdw8nZzo/jR/9KD1MVVYMMX4M8pZ2v9F+yhMqaMpL
         saApwW5vtvbXfvOfvn46TWoU7nwUY1fknZyTglmdVKQH5yGWVZK/Pu3feEYPAJD6Waik
         RJg9xydvnEgbTJNRO9amyT/MUtPc5BlL1FgcUcvpr+NU+WRsZ62ci7eS2+6r0fGLna40
         Y7KafoAq/suBfKfH9wZLRjLfeQbR9P9Bv99DDEWRNlZ8VMExzECLLgo6yo5R/QZdSrKj
         xjLQ==
X-Forwarded-Encrypted: i=1; AKwUvByuZgVKAAqhJVMH4+CFl6pZTwEKlQar6qzZHVIs2Hbr/pHNidcaH3WD16gd4ihRI78nCE+n3fck3G0fZsgM@vger.kernel.org
X-Gm-Message-State: AFuF++nxdvzB/Vd/WroGvk/Fw8uliznJ7YlFJ01w7o1oWO9JYJLmYYF8
	/7zNPYBDM8iBm/YnwSdCUniNMEepH+lFPjwlF3nZPA89myzPYIdOmSdijOW9iRpywZ/RcjcZXDR
	dgtpM3TQu9f5XtabjbRA42T3KAKh9lRqGzGHuep0p15ZyWWABl1l5tgjxNsaBVAvRqXAG
X-Gm-Gg: AYBFou3pAq9UZX49vB8sCs+dLQHZMLHBLTvy7ugTjPLZ5Ztu1+5VBUuSgceUwVnJyBe
	GdnJN4cFhccNhUp1VALoYaCTB7/euhUtR3yFm82ajrhsJoiUuJ3s60KBpUjMgnRQjfhBeeYlTEO
	gC8UXOAkkpGSX932ajt5Np2be/d6kSDfxOyAUlulP0BNwKg3/lJeZNtf7PLMr+R6iFBDah6qtAz
	zPHvnl1++KKV8hstKtN0M0dx0WeBCDtfsTQndENo1N3h4rpoUyBSsLTNxtJIL/tYYUWXmvFd3oG
	3rd5Z5vkhWDw3W7KzG+1qStWAkcIiiiLSL33WZB0W2h3NjQlOZUwWbU1aErItTF/g3/OBdApVed
	C7aSe4yFgvb3qm8MdxkIxPie1s6EeOttHsA==
X-Received: by 2002:a05:701b:424a:10b0:147:5261:ee2e with SMTP id a92af1059eb24-1475261f39emr930754c88.21.1790404474632;
        Fri, 25 Sep 2026 23:34:34 -0700 (PDT)
X-Received: by 2002:a05:701b:424a:10b0:147:5261:ee2e with SMTP id a92af1059eb24-1475261f39emr930717c88.21.1790404473888;
        Fri, 25 Sep 2026 23:34:33 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:34:33 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:00 +0530
Subject: [PATCH v5 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
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
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=6135;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=BW03Q4XvOkjro2dFuDlm8xAjUIoin9wCEv9Ej26ALtU=;
 b=A2S5PWq3v5NUF4IGC7aGSY5tOMrOuKKeAaeuLJse2Um9pyEP99pm2rjZdInulqjqkOcuo79cR
 iSepREQTIYnCYTaqvPVIutHe5mwWPr8e6yzUsCXXKsfd1zwCqu/uLjL
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: RsFv-Mm0WPjtd1wwkkHoFujYvnK0oLQ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX6sh8L7OkLC1s
 gFptvYJUWMIVS7WEuTxbEPCXY79gs9l3jUAzC/rMkbP3QJeUuLOO+FCWMCA0Y0hphTiTPA8k743
 LRquIH+SZIoT6bFTsa7h/h6tIzfw92AHGTHrcE9OCa3E+cN1m5FLuaQaQ+ndTIoOnS9UomblvI2
 wvhS4u0Ibc2w9ArBwFJRs9aF4/CtXC6fPLtfQ8hDY21cQKzNG3mRhARlQn7WaFD3l18k2hUaBUe
 6NibSiOMZBeBtL2Hkb16QLT/vCeIZiIaJ0lC9AYGjTjOWJfZolHoEFBHO1qQjD5pkcACKfsWIHq
 aSOSWjuE5RsLU/ap58d0a2i+dj2N2FQDp6gaD1P+3qYPOkv5LMBAt7cX7+WgMbbreXJNiLIiCSo
 lUuCEOohBuZkBT7ZNq8dbS6C19/R6X0mhEuNCvlgJ5CTV2B+/nSqDa5gjUvWAoQb7NWZ93d5Fju
 Iu/zem8VRxBxZW1JBKQ==
X-Proofpoint-ORIG-GUID: RsFv-Mm0WPjtd1wwkkHoFujYvnK0oLQ9
X-Authority-Analysis: v=2.4 cv=aIFlOr9m c=1 sm=1 tr=0 ts=6ab76780 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=weiu3rfF03DHpAy_C5IA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX2L/qL/D/cOgo
 Sx/2EvYqPnY8ib+VE3zKv7yHtC9CemwUTo7SQzVGe5r+zpDL5gJ22rhRuXGCfgqSjrVKIj+pMS0
 T95xVFPTV4riWgMtscrPLKxM1fSyhOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

