Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34223446CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215151; cv=none; b=e5gMTYTvuLBSjXgw+WPEzOqAQgS5E14r+Ua3gJgQPuIPCif00qkjaNVFtVTNbEvCZGkAIB3RHsUpssTXY3dROIrTRWNL+xk5xVU/HgVeReCD9RiXSHQVUlQAN9WYWN2H6teBZVgf3I/IQe//F0DdA3Wmand/MXCr3qqwWTBRZhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215151; c=relaxed/simple;
	bh=tlR8ecMcS5JNsMhM+OoOzlsiPwZjNOP61ke0c8v0oBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bxfnHFwGRMTnsMN6sdcvS2wXgVgfral/WZ/VfXPL8ijfyAO7nlGJDtArlLGg5hAw/q+AJbeJZlpLv4mdPmrQtXdtETKNYvN/Hz/xOLFvMDzsLofdf/QU7lPtQO20ZGFQ84eDYQ7YbZfsQCehkEhV2yylTyP1GaGQbac58tCOPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjbrCiJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQUbBkoZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjbrCiJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQUbBkoZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJaGX2946523
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=faEbXiZpLug
	I2WIF/WKwBdPlFd89WzCvjpK22BeDaco=; b=YjbrCiJHYel9f916/GI5NnLo5Tv
	vqXaBX8N0WeruaAy7HzdTssdqitk1owDkY9Kj9RZMJDStB6sI4A9MAQWmyJ6+RvG
	ZTl7JRgPGP48b3zJj7HZTvMjTuxQswm59Xpp2WfIP4NUazfc7kPEtSVEayQWHSBb
	GbRUclhh+o77d7Y27IYDBHcd0UAkEed68FiQF+ATbEs3ue5in0rGahOPzt7+0oRw
	pg8QaZu5nS1kr0Oy9PJEAFGKctCH2LyzRvSAO7jyvYwhB68AsNRv8+eot1d+tgvL
	1u4PasyfMMK2lXPYAawRg2myUn23HPs7z6e6WFadWbhAxy4Gp7vTjUoS6pA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wb6ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:19:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848452dd146so8126472b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784215149; x=1784819949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faEbXiZpLugI2WIF/WKwBdPlFd89WzCvjpK22BeDaco=;
        b=hQUbBkoZ2SdiZ/yV1oH5goVjGcI2eGiadoEI06cOpyecX0e1wI+iiSeSfhEQiR1X01
         b7st6EBZr7/nEl6u+KYBg6O6Uu39O3ENd1kUUoBaDhEbwxEe5WWMFSWAv3z7wRQiuq/s
         vyc52R7te03qDXNHhbh9PFJppDniOkI7bH3cJfHbPtkq03xn24A6le9UGHreKPJvgkUW
         ++ljeSJGr4fUbV6tcQ8YpfImSRMR51HFShN3fJ1neTM1RBW3UdiA9kCFtIJ6stfKcJG0
         XRLtNi9abzjDZPH3GgX2bO8OmesaRiEgIQ5cj2Ul5LaoU0NP0PfhuLhvkwDO2npR+0Fk
         cbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784215149; x=1784819949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=faEbXiZpLugI2WIF/WKwBdPlFd89WzCvjpK22BeDaco=;
        b=pm5dG8Dj/lEixeqf6HZXiMBsgx+V125dmb9OdmwIFlJhDzZeJ9MQNNGChUvMNIZLGH
         CJBjyHWYULUryLgEk5Jig+gVq/Qrcz/DBUrSuEYfE/xhXMp1JEhcVKEhk5/6pAbtTQIn
         BeS8+Yr11qsseTnS+bfoM3MJAvqZ+PHqLjyInmFBQgdib4ibhfF5gGNT6KkWJlyFMxN5
         TiQGdFASzC9RH5jHlM8qu8xbghVLrA/MkqKYQEyAM0R1qURG6nEflkWMZCDYloS8Vbvd
         4cV4KAzIMlw0+xpMKgW6ndXNVVDx9PEBoJN0Ue4QZLv8LXtDKXe5+gu3P6UoKvRBTdOQ
         rt+g==
X-Gm-Message-State: AOJu0YwWXCTrUafEaTDR+Dm+JZUzJ1iZ4IzG9slHd+WuIWyJopPc4vws
	Tzt6AjWKol/sd0fJ9SG1pnTsZMXRUHOaJDhWUU9RirH46PaSpv/rTw35HJCxnVVGEn9upF9/Ied
	dqRGt6ZUfpr0tqh2HdBtRHoZHUmHtEnRmR4Fu29gnj0bR5W4eJfF2xYw7qwSSI5Mtsyx3
X-Gm-Gg: AfdE7cklYzZM0KfhkQK9TJNCsRJoixxZiWk+X18HZS/d5LVgxaSGg8azWwo00q+Zr2z
	3RgRfYT3/7OFXFmBNDBJdV10x27gTVOJF0O4eGYbn/TfgTq/FSONJUobw5+8FfyyFCzxKlBSxpi
	L1w/5bOddK90Ve8maKkc6F44aHQWYVlMmTYf2JfCVBe7khvdUsI0lRz747IIvtcV0r3e0YyMS1v
	c5oX3yiot/CkEmiF55dGEKSqmqalSSs+308jVBU6RXv0vg8E2cB0ps+WSJHm3puZKyGmxpCsIGJ
	gWCbthYYlN9kwH/PTq9L7vtusyoZak8KAenI7IwA3XYi08ngg6hwdTOuVQ1GipeJD8WBaMVVZzg
	e4vw+o9g1LXBuP1yPoUT0o1kIdmN193qPEucw
X-Received: by 2002:a05:6a00:2e06:b0:847:e4c7:8ca1 with SMTP id d2e1a72fcca58-8488970b172mr20422778b3a.43.1784215148445;
        Thu, 16 Jul 2026 08:19:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e06:b0:847:e4c7:8ca1 with SMTP id d2e1a72fcca58-8488970b172mr20422743b3a.43.1784215147907;
        Thu, 16 Jul 2026 08:19:07 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bfc2bsm4941616b3a.37.2026.07.16.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:19:07 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: qcom: lemans: enable audio ML offload memory and SMMU mappings
Date: Thu, 16 Jul 2026 20:48:53 +0530
Message-Id: <20260716151854.3041914-2-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
References: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58f66d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qtuJx3-IUi5I1-Rgc4kA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: s531XDspgcFrqasRjGNJtLhjYETG4tY3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfX8HREghEiruhJ
 gMNUJLubrgK+S1t4dqmv5LNh619WSxEe5+nEM8vxh8MYQtArAbRdTdt00GqyMm51BxnUeYzc3/c
 xGNbptFDftvk9y44VJx7QOWkVVrisSY=
X-Proofpoint-ORIG-GUID: s531XDspgcFrqasRjGNJtLhjYETG4tY3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfX8d9iYmt/Bqg8
 KEmoSSzwsIOEV1ncpYqsTmAk6sCPgZj7Ib2ppi7Xz0TLRkGQoJOf8ukFAv2obJW+K3KW/slxLcW
 cHhW8apySMnT6T2j1OIkjPaXzp+jRnku77pNbDtJaZ1PeZIS2lEBXC2bnrkcRaq0DeR5UY7U1/Q
 Nrj9u4zvYPtnzwRHptvhZcw5n5IjemqwFJZCkUGU9/vg26ZQK6io7vkzuVXp/hfaDZQwh0vySzb
 k8yHY8tygnvsV5EjD/Y37SThdoOoukkTXGt5wa0woZyaBfJ8sCsW4qvLFKTFTC5IINsF6MLKSE1
 wAXdkxzaMQDV9ia+nUYqu38mdk3wWtAZ+//y5RSL+7I0MB0t3aQnRBKq8oTnnXIJ9CtPIoUuFql
 vnrJ3gh6WNQ6DGxieqOWQVXVo3vV9zkXkVSwe4He/161JM+smnm0QxS9bhptdIGkgrPVI6S/gbw
 h/dCA6TbgX7sdafnS0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160156

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

