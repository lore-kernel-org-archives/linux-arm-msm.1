Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F95351C31
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727706; cv=none; b=Y3rlZh0uvYescO9CNOELQtx0qj6vjckvqUBUqKvHvkX2m5DHH1fe8f7tR4i4CuqrYCDkHkUpoXhKfDyYHVbTJ8L0g4fV37GrCjRnxC3xPGNw0Kb+rizvDGCghyAtYzc92RJRuZXv9bmQ7QRwPSQQi100Q0WAc/oDjrArxYkhOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727706; c=relaxed/simple;
	bh=880I6kkvald6GYQJEUTfGWnpm2Vfyc5w00rxTp0gb3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvhJxQY4USl7u1mGqDZk86aF3R9xyA3g4JYT/Pwo/SXT6yOPDxhYN63mYbuxFSnUMH5CtUgsfz4ic0C9lFwvhGo0HlTSB2H9BIOB/q0LeF+YZ21R3xPwwgzl6v8UZ/1iyjJ5gK8ovnnXlojJOdwrrzLeOOqch9j/JdWukbIrCFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kc4rU5/O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqS7rbRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kc4rU5/O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqS7rbRa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWk4C1033913
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLBod93ihysPhki4xHh4mxJwO4eNzBO4gKvE7XlDa8g=; b=kc4rU5/OMxpmu/vZ
	z9x40mwG5UxRF2SrN8B3wmoPSbKzfLPAsSSw8j5gaVt4+mYkmHv6WjaYFK5gdw4b
	zeD0itsdjT/9BfebuSNS+n5HnkAPgryG3hT4+5DYjrRQLW9HGrloYNYHUTyD4rUc
	+VraaLW3My6Rtq9l31HuxpqE3do3/tUPO68qpwA7rURhD1/SKaC3lyhVBCQ7LC+t
	pQvhowsD/Lj5EFuuWPldKFHh6pw5VNCG75jW58CtNuBBaw7T0PQGBMtpo0SXLeCh
	oMUa4786sO1RrNK0tcJWr3FszjJC9RZAgo/q9JZKvZlWOtsdIUQXBk8KInxw8SHq
	JKiPQg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdj3ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:41:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso8480831a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727702; x=1785332502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLBod93ihysPhki4xHh4mxJwO4eNzBO4gKvE7XlDa8g=;
        b=OqS7rbRaFzKc6Beq0oZbQawwI6fTVL/k59e6Emd3DKO52isgAI95OfmqZavLNvjkmf
         fPCxSoOE2eoKeB0D4GIicLM7kvTshHgvsUfXdd0upSTRHbjtlmypIKt0OzfRzeuW5c0k
         Wa69YbmH7ste1CVBt5nMNrHOcz78s7PWJyGxcpNMdC6EyH+m4vir+VREW9OgUhHw8Yu8
         QO09OPzTcsrOYJXPfdW1TT07rEt4LkiupopnutsjDRvoOSmEZmBc3ER/e78ipXhTNrKm
         2iKMYZWZDMuIDc1cICi1jqG33A44rhvH4v/144ZUsN4M77WSUszqU8VBZjQFDA9qcazF
         U0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727702; x=1785332502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLBod93ihysPhki4xHh4mxJwO4eNzBO4gKvE7XlDa8g=;
        b=VTjZqhRtBPZg61/9ziVqMJNnaYkh4j4LJV8b7Aoyss02X5fa0JF/74rNZBpDqinODE
         XHDsTzYGExscsFgKqk0YVWomqvCwdcgMZy0dp4mzKKR7iyk+lq6actd9meFPPkFZhNpc
         8Qr24ZplTZKZ94Olob3D+LP2RHA8ARP/I7gnCnc4NC8pAeXtOgJyfrbL0teNgJse8Nl9
         /QraO+D4LdJqtAYlBz6VLPqTbzYBFZNrjXbeTx1/h6DeaHchdRMBNb7kSvPkE2yNVAN3
         pFSexgflF4BxSHbzP05YoCV8oZ1PsDi7d0WlpCZa2q6zuyf2pe5fjc5MZxGJXVKrn1X1
         855w==
X-Gm-Message-State: AOJu0YxbP8izcpnhjmyiiQeDDBH+MoU9iUb3oSmG/zWQe/u8m9/9IwnG
	+Z/WQDgQ6ohxc3x54thGKC5eD2Sa0MzXppBd+q/iuwIJSzgaLGaqVbg2JFgT/IgR81iG1pZVOAI
	Y4Y5zfA5UecH3ksHgwJisPTn/mIhLWyJVYIef3bR2LesIAWMOEhbpvxaCuDLoX6RlR1kW
X-Gm-Gg: AR+sD13psv2kugmXUVprZogyyl5OFiyk01VCLY9YxnTm43FHDmqtmi9rh5HZwdg+SLg
	3IIMbkxwzAgEpXkGeJiruCxGASMd9Dclxh+nXya9xkSr0WoeISGaFqJcLep4UzzkKXmrNyqJ+6h
	iDjFb4n/MKe4ch4xGrDTtkuFAOYmX6mG0IHnzrXOm9n8/fG+K04FhNYWnTHw+onQsh5AUqAo01D
	YV/2itDP8bMmVC0/19fZE0zuk8RJA/xKqRRONAk+lR3+ahthc8x4T3ZSkDXBueS3M7WwM845Dme
	V6jSEmkwGy/wAEk3nRtFuAo9uC8pUpXrp3Z+LFJf2V6M+psqbQUmiw8hXj8hOIEfodT7SnWCmex
	izl47OzL8Yh2PRmE0HQdVDe+DGrnKNFGVqik=
X-Received: by 2002:a17:902:fc4e:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2cf34836892mr270052435ad.9.1784727702337;
        Wed, 22 Jul 2026 06:41:42 -0700 (PDT)
X-Received: by 2002:a17:902:fc4e:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2cf34836892mr270052165ad.9.1784727701906;
        Wed, 22 Jul 2026 06:41:41 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm15186705ad.80.2026.07.22.06.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:41:41 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:11:18 +0530
Subject: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
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
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784727691; l=1465;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=880I6kkvald6GYQJEUTfGWnpm2Vfyc5w00rxTp0gb3o=;
 b=D3dSr+vEk2SBMjy4t33fQE+ygVPSAyZFYzH8KqCAPmlo/VRWNVY03rNtDmPnc0qmrkdpSSJaB
 i7+drBUWsJfCwrqA0TShe4qIzsFutormuWZ9zK95FWWV5A+PqjkZpfv
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX8/Ghb7bxDL8R
 4PvKFAaTst5NXV5hiYf0x6Y9E1Pj5Euy/kkiGdbVkOUCxStDnZF71iI2wk4stlJ4zGQnGVLTqbE
 sgnJjWFQC8nS7BsxEYRYoXbpuE0JQVduNgDDXwrO54cbZK/LT80IgGSOmSFmtEghaBJdMCZTRJ0
 8HPx4DF7THwJrTLkj28noMPnEwtNkBSt/K/8Ev8WBQd+myg3j6Q0Lx4REsg+Yaj/mgiynp1+/Kq
 uST7cH/LY5EpUXJEj1wV8tBjeHyQphu9M7B5NA38blVlJCXQ0MiiaVomxZcYNU0cn/1aLShknzw
 so5UuHQk2Yt8k0RHCLivXwgHyquLVNbAfsD8IeM9vrOID8Ok+p822jfczmzeHw83fE7UlacwltB
 GnmCZ9sdB24BELSYP1qbrIrCx9j8XZMd9gWeduX9ouKxxluB1lbyKge8B7bnq/CfDmg+3N9r2em
 e4UYY6jPvKSp9unvSBw==
X-Proofpoint-GUID: gANZy0ozkogMFHrYH4spK1V-S29-xA3U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX//1pZGufuioP
 IbSEglwtCwKtKEYLD+/WryEW0uX0tSRvCfOYscfktsJaq39WvTqcsdMAxBo9t9CRuS/qBaR7PVg
 r19S0oT+XA9MdRpUK0weAKMcydcQhcw=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a60c897 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aV_bNlsvZ_0e67_Frr8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: gANZy0ozkogMFHrYH4spK1V-S29-xA3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220134

Update the memory-region property to support two regions:
1. Firmware-loaded codec carveout (existing)
2. IOMMU IOVA reservation region (new)

The IOMMU IOVA reservation region is required to restrict usage of
specific IOVA memory range. For example, VPU restricts usage of 600MB
for specific streams, which could otherwise lead to device crash. This
change allows platforms to define separate memory regions for codec
carveout and IOVA restrictions.
This schema update supports existing DTS having single memory-region,
thereby allowing gradual migration of DTS to support two memory region.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,venus-common.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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

