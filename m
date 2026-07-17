Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1CB3E7BC9
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282332; cv=none; b=oaGSbRnauXhBTTzGooWtcmkqJ3r4Hu/vGkPVz3+J3qYZC3mURJ4UEKUYzkGLSrqabFxig8kTDUZqYipvXMiAr9GRIsF8Up/zgy3XM7q9X1F3OAIpINOwHEbrqKT5dLc10/L29iRjhHl6VYUAODyLtPra7YeDMzUx+AUO3SD0lqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282332; c=relaxed/simple;
	bh=tlR8ecMcS5JNsMhM+OoOzlsiPwZjNOP61ke0c8v0oBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BW9zPNv81VB6nVTpV9KD2+DN50TeSsRJQ5aY4FmWgx37mwU9Tn+nV90wet/w2/eTjwABtlLOzbVGXkOfuSzHpnToPXf/nAJAeI46Xe6iBItBwwhxGsPPyaiUKEk/Vv0JjaoLhuNwvw5kC/i+hpGD6Hoa/AyFM0lvFLUmmrxVX3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgMh000X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFq470wF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgMh000X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFq470wF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cJnb2098601
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=faEbXiZpLug
	I2WIF/WKwBdPlFd89WzCvjpK22BeDaco=; b=jgMh000XzS6pk8IcELS8OP/8Bpn
	D6kVKh1ZTy1/RZ+hKvAK+mWsSvFpt8C9W0pjDF4W7XSHrEIYdhy6acORkSEDPRmV
	sH9lQ40BlpIeerbiyXfOow58ttoRjPD8s06kQ8Ux47sO5UJbXx0Tf2N7HBA/MoB2
	QK9QBHAFyMuPsDThlZlpQnvmxUl0PgEPkVTiIJrgyjZJwz38s2QwsUv8Gzd8OOxI
	6fTpE32NIs0zCKZBOPLRXCd79ps9dzL5geDH1Qpq6/tJ5gvxYEw7JoZa/BnYwYW8
	2KtnE+gwz3iFWAWKHNouIjCaI15G/GGwZzMhzUXFSIbX15fTApQ2wHG3dug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6k5pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so3991157a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282329; x=1784887129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faEbXiZpLugI2WIF/WKwBdPlFd89WzCvjpK22BeDaco=;
        b=EFq470wF0FyA74ZIAXf2ZPJQwpRvVcFYfQGs5kgJ6IY7HUYP9D7M4JnTIC640TP/SO
         Suc4LueRHYRqpexIE5xKgdYIQefOBVmjBdpFogB6eolLz9NqBvS/J4b0tMwrvin7P38V
         /C3qnsq2GK7ywswfu/0ma0Vr37cDPig6IA6tOaurKgXpFwZ7CJfh1b4dBsUhFLg8l0DH
         kSGKTyGxocxla2ubicQTR0AioOufSmOqliu94KwNGQVqJvdgu4R6P6RaaeR95ZsbmWUc
         dk5DF6mT3wY6WH/ez0vcXaQ66eOwXf/GR7yTL2cXiDKNGZLU80Awgf9PBE8IzgGQMIXc
         YzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282329; x=1784887129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=faEbXiZpLugI2WIF/WKwBdPlFd89WzCvjpK22BeDaco=;
        b=FPQw2ubdFdiBt/YeeRnZvcmoCfEpjk+9GlwoFj2ds++013onV4C6QLJMQDIQ5I6Xpv
         0IB5S23CF7aejlw0h7Kv0JOi4mJZYOWBz1vr8SonF7FMuyYQwpfrtHBzKGu7Va3EplN+
         zi2p/3tglOHr5cZJ1q+2o8ZZ2yXyZQXPrdlEqy2z1J6nk3n34A1THHpSOGCYPiwSIUn7
         5vE9CUqJv8cugPtCaFtl56vyXWF/NfmQo1J+LB7AVJA+2waCHYMDLFJWN1EGY+JXvwfI
         YiKVE/2QPKJryZHK5oKmwanFXxV1NLpeWgSsSqsoqenVNrFUy7PUOaPTAlOpJg26yEhB
         rP9g==
X-Gm-Message-State: AOJu0YzA783ko3Il/xeh6MM8X0SNjSt2OBeHTyuy3Ju8Gydr3Fx2ciaD
	T9m1brwvPcLTSnV824hercVjGuoHKUaprL2Pj75E46lvtMQ++nrsLKR+K66u16oIWNJLWNzjV5j
	poQibXythJq7kaR/6gyMHTs/eEEpmA0qk/nbgwCKBLz4AMV3Fq14UJ36/fNqPKPws/KMD
X-Gm-Gg: AfdE7cn2drjS/w+KVmt6L9KC+iobnlMJ9sOeJPlqn8jSACb0QNUx3IrTInz2UQcVgEH
	7WcJwRV0F+dErtHxn3ZjH3uDc5dj8Q6rlLnzLXynrHpJzuG7ej4eADPVnt3qjw6A0CrFARllyqV
	9F6rlONDjhHJB380wlaxjmU6Esm3tsWpIm0RoPXTLOICCDRPDKunizcXtmIggYDTjwotJjX9Yb1
	TdvawnWXDUPGYVUFlEVvnlLAnagIQdNoza7hf73bwSykerHujlWq5q4QXa/6DXD5M19IA1WtN2d
	HtmJDayihAneEMSzxZGM9bha8j8SpH2i2vYHJLxhxcrdh8Tejq1RGT2Lsa5q+t/B/yy1XwTly33
	ug4vKg2MJi4Zmx/whFXnePol70nBV5hqWz5dU
X-Received: by 2002:a17:90a:d60f:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38e4b51656bmr1714820a91.28.1784282328761;
        Fri, 17 Jul 2026 02:58:48 -0700 (PDT)
X-Received: by 2002:a17:90a:d60f:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38e4b51656bmr1714803a91.28.1784282328347;
        Fri, 17 Jul 2026 02:58:48 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm2661071a91.2.2026.07.17.02.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:47 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: qcom: lemans: enable audio ML offload memory and SMMU mappings
Date: Fri, 17 Jul 2026 15:28:24 +0530
Message-Id: <20260717095825.3962666-3-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX5r7h25mKa9ty
 VdJc2yrgacXd0BjWfW58vU+8kJDmhIOP6SSttFgvb+zpsj4t+27vXXzM4Kubw8JOfFPdgVZseyt
 QAc90OUW/LzsPOmPFJWRUtiUS/tWBgUWAwCcHx7lyn6AVQNc18PIsE9GdVUsumn9rEeS0xEudba
 jCVgcf/eCHz2f+sWFa0mFbsu1t7G8Yawlzc2U3BhrPZbWLDUv1l8G6bQ8NXeJAYr0gylG3G8D3l
 M0cRHx41H96U5dPUUhbiqCtP9a4PvC7ZBbznpI0UJR6ZcPUGUOW2ITXvm83TCuJdqZhzdk4jprr
 wbw8K1EWHYSsGYXR6CgKJiHkoEXYnOD3q60ccRVIJDVa9A4CKc3DkZXNTf9QXzEgl5jMJaV44qX
 4B47V0ScxQlSpKvSRasB4lS39scq/Hz1dp+W3GqFaaBVo37LMbD1a7Ec/ioNS6aaRv7WCNaQDRT
 qzPvJMeeC0zBXbWoizA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX7fXooi5u4DxZ
 VuytuZbTbY7NjMl4DhxUBSYFQcHXrAXukETwUPfaVeelwcKsDXBZq1dLIKe+ji6X0bGVzol9ZaC
 YlG1+OALM3QoLMvzdy2NkHNRGg+IItw=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59fcd9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qtuJx3-IUi5I1-Rgc4kA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: OfFVORdaVI2XR-_S4F05WBFD7IafUdx0
X-Proofpoint-ORIG-GUID: OfFVORdaVI2XR-_S4F05WBFD7IafUdx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170099

The audio ML (machine-learning) offload use case requires a contiguous,
physically addressable buffer shared with the audio DSP/SPF, and issues
DMA transactions through additional SMMU stream IDs that are not
covered by the existing ADSP mapping.

Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
aligned) and wire it to the q6apm DAIs node via memory-region. A
dedicated pool guarantees the alignment and contiguity the DSP expects
and isolates these allocations from the default CMA region.

Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
enforcing, so the ML transactions are otherwise blocked and faulted:

 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x3060
 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x3062

Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
remoteproc_adsp iommus property in the EL2 overlay so these buffers are
translated by the SMMU instead of being rejected.

Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 4 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi     | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
index 621ad930cf54..5b477346ef90 100644
--- a/arch/arm64/boot/dts/qcom/lemans-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -19,7 +19,9 @@ &iris {
 };
 
 &remoteproc_adsp {
-	iommus = <&apps_smmu 0x3000 0x0>;
+	iommus = <&apps_smmu 0x3000 0x0>,
+		<&apps_smmu 0x3060 0x9>,
+		<&apps_smmu 0x3062 0x1>;
 };
 
 &remoteproc_cdsp0 {
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..060565113784 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -624,6 +624,14 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		audio_cma_mem: qcom,audio-ml {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x1000000>;
+		};
+
 		sail_ss_mem: sail-ss@80000000 {
 			reg = <0x0 0x80000000 0x0 0x10000000>;
 			no-map;
@@ -8134,6 +8142,7 @@ q6apmbedai: bedais {
 						q6apmdai: dais {
 							compatible = "qcom,q6apm-dais";
 							iommus = <&apps_smmu 0x3001 0x0>;
+							memory-region = <&audio_cma_mem>;
 						};
 					};
 
-- 
2.34.1

