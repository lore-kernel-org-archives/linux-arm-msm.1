Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180916;
	b=DZd7c33kovJyc4/YdRGcpXas4n2CwXCwHXwRmqX3boshWfiONbhsN3jrXo3NVfeSMEq/
	 YoQ7QB2x9KgBIGXddVW+O6iAsObNlNZdjdVOseeS+E8QeTYY4nNZN924tKMcX4q1SaStd
	 9agm3sd/bc2BQLtrSRSLeKx49Be2SjSz6XP20TYa975+hWpGGm9+7L6BQAMpEtrfPTRei
	 jpsrhcY2wdOY/gO3sVoso9W+UJt0whRHjuNHk0yDn/0iVBzBWSHSDAq8r9zRzcjxXxqtD
	 ALDX/fkvg1ocHV47rQij987beQhuK3wwl5smYRuu1nv/QURhT1oma+lRAy51eLrVNKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=;
	b=iza57tGERNJPHwg+FFc/cAhX6XTLPWbA6fymO3yuthgsUnxZv/XTEOHqQdxIByi0kkEO
	 QrPLnnDXdUKdfahzfnAw3iFu4PuCrpY0R8WcQitwc0dM1nnD+X1iLKXqgU0Tz+jmlot8J
	 aPh64kqUAMSVTRZpcyDJGvGfT13gUn7sY94ndNOzTrHurHWUXh425qWBudOVNm5v5br/i
	 97jXzt8zmGQKseHMo21GSrH8zTG+7tXyD8tL9igTNNaQNHn0dfF5mJ/tYYDM44zm+UJ0c
	 N/rhOml5Jeg/zvrrJIpDXLhwD/Yc3/ElXlei1Vd86KDLhOH3butTYJq1rHSjoLETZhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OK3l3bOr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e5nNF9W6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E671606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E671606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OK3l3bOr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e5nNF9W6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjsD51681944
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=; b=OK3l3bOrsZu4/llM
	d7vJJWbFoDBJQK0wfpkEKMLb5MUEJYmDEnXXa5Gk+Tu9tOT4PKIBrOxtz717P1fP
	lKCem2UvhQKu+9GBGSPeXLCXHuya8WEjMgAP/W1DD0kHVmTJelNLIrtsDURPeyED
	UzePuZ3InEO/Tuf8KPyUv6Y0VjesZ9IgCanRAA7QM3B+nzMLJqFg3o9qZABvhqvE
	kAfr7767VyLXx6X10bDTZEpHD7Nx0hcjry981XojDl5dU0IbE8MfCqUfzMJ3RBKe
	6nnpeRAectqv9Ggmjcfu1c5KSRHOsFpfEY0ZozH2BPjgyZkNl/XoYmkArjzbNgp2
	OvFLrA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tn6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso1909554eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180915; x=1795785715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=;
        b=e5nNF9W6Cqvx6kpuZhhnFslIQlwunQZ3lMSm6IoxGzd6C73Yc2/df9EkAiHLifbZrs
         cALXr8kEvMMn5Ce6fWSH4gNcVkOlL+97ih9KWQcq2lAZH9bz+8YgopVOJazcPDUlC4rW
         SgGpFpYHL6DAYI+DfVX/jWwunxTlfHBho/e2l6w3kytzTtnwkJ5K0RrSQzctTLeJhGt+
         9HaEgTo3GbVnYtd2SHP/5b3xEIF6xFcclLuzsZxqH3XxuFFpGy9QfAakTRG3DqUG2g9+
         5B6d8cmUwyLnq6qcOFB7XAGxMXdinhx4F8Al1io//BB90+BWd2DG/OKr9oaNtLBtpP69
         dnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180915; x=1795785715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=;
        b=0+b9Sy/RvBz7IEy41/4sC0ZAn4vmRyJJbttCg97B7j24PVPY3Z3vjGAnsPTWnQbzU0
         XJq4kHXHfhEY9T07+jfxJDZtuU+bIzLfO6MkIWfuyMIVzyBEiBIxjHm/5uqNZL9EuviH
         UKKUA9B3Uk887JDBrMyxAdlNIrZxmYMm6BatkD450NwKqWZLXrObaGbfiicbBgdJqWfW
         kFsSx2MF2w2T16n9ohPkOPEI8ZAkCzNCuihDVJbGSHnXs3Hmdw75gMQXnJ624LRMDwd6
         oylwD618yOScO0YJmT3ec7PpGQZBGdTrgyswPRGcpd81TPcDrNPcdBPOCFwi/j5CU4qS
         ej0w==
X-Gm-Message-State: APuU4Z8zDXHqRGUa6MXW6r9882unhO2URItP/glCdu6YwRQLXpQlTr/0
	Cn6nZvylLWKIe2g5atLIOhRKb1E0GKh7hltoqO3Adi511BmyqSIj2ko48eubKcR5DrqJSbyReIz
	yzXgPbMUpMhz83E8nxVQ8wJbMPkRHtv6xDQ1xj1FkP8s3PQl5DySMCLZMQ6H3ItkA26tK
X-Gm-Gg: AYBFou1cv51KpiSHSB0kwmlMKVN1iEa/BJHSNAYJ3oSNGv1k4ZOY2SuBHbZBlzcVCA6
	UcPUWaFHmcEW7KyJszvQa1TffLfQrhjoZ0VR8AMuDhhsc1a/1q63oRsgzZld8uTDTZdFwGsEirl
	MLai8U3uKI2oPPliGvcQchlkHi9+esalFZ9zcFd3KwL6s8vtJYyktMbstCPoJiiT6hZ7szhVJER
	/ddvkTI6KUcnvyw967iGoppDDv6LAnRaB9FmV5iLuegsL6K+7tKg5CzNVaL4Cc4IGUgPspn1rCH
	/VTCmQcklYEpq2RD/2AVU35wgeORQbb3iEOe0BTPdQcT/iBW+bQH4OhhixSxRpS/IC+9h+hbtd1
	F6IEWFvYBMeBLhlsNP6pC0P8qEH38WvPa1uetAYv2VuMcLBNtwv2xDNMKTuMWopTP
X-Received: by 2002:a05:701b:4503:10b0:1b5:1a15:5d18 with SMTP id a92af1059eb24-1b5524d74aamr3859392c88.14.1795180914842;
        Fri, 20 Nov 2026 05:21:54 -0800 (PST)
X-Received: by 2002:a05:701b:4503:10b0:1b5:1a15:5d18 with SMTP id a92af1059eb24-1b5524d74aamr3859374c88.14.1795180914394;
        Fri, 20 Nov 2026 05:21:54 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:54 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:53 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
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
Message-Id: <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=2129;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=q2ude2+7TI0KnKHb6cUpVCoHT8Tjv9x10iiUca9DXas=;
 b=nFGz7/BM08LGEuOAefFpYEpJ2dwJn6Jc1mICAYfqjuG+aLJnoStZeC6Atiw4YHJwS3z8hGIfv
 lC/lmIkg/uICXLyW3zIuWgTrI8s3EkqnDhfR3DmeRsMFbL/4WY8BCQe
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004973 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=r1478T_rJjGiy3RGUEAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: IKBrpXmIsauBBGoeWiWaQwQ3_CJfse16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX9ulS3hjzb+Cd
 pZpOW3W3bAC49QAe1N3Dn4bpNTiZ4dyNdtcQs1Su8d6gB1W1UB/yI1/N0zkx+C4AaapDhPM33W/
 VCDm+TgwdO+9Fx8CAtmM8aJFRnJvgFkbWCpMFHt54FStZ/E9vS5smaHM7nFP2hh5NcRRa4N2ytZ
 d/cLDa6pb09+UsTQzT/w7mGDwCscrglCiCtjR8ZKePxFjI7gcT5UtVS33HjskffkBHjxoNPOW81
 EEuF88nAaE0LUjpex9nA2DEIRJcxz7n7JVKnZc2oYaM+vuxSA3mtGoVe8vgY1mWQV+9upGH6LhU
 lx2qlpWpQbtNcD2WY5z7itj7sVv+RmgzJ7bO4kIav3E4zRlAS+b324V4k2G2Qr9AP4ePgENcw4H
 AXtw5yLoOUC+20c5Y0nsSAtNd8YnnKqpB+5Tu0nmQ4jZf0/X4B+E+sHQFNnwJsbSVQn6u18fuA0
 ISh7/1QkHaUFOyjc2wA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX6aRJnPqzpCn4
 8Fva1qGpnYcpxO3RGMDRWghE6S0gufd+OdTIl47zLWpvLf3soCc5z5Xwf328nJPVSmFaPaIbRD4
 sTt7yEF6gsabtit0pRa/+mkB34s8zCk=
X-Proofpoint-ORIG-GUID: IKBrpXmIsauBBGoeWiWaQwQ3_CJfse16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

SM8750 boards boot Linux under the Gunyah hypervisor, with Linux
running at EL1. Linux can also be booted directly at EL2 on these
devices.

For EL2 boot, describe the IOMMU streams used by the remote processor
firmware in the DeviceTree consumed by Linux. Also disable GPU zap
shader and Iris video codec.

Add an EL2-specific DT overlay and apply it to the SM8750 MTP to
produce sm8750-mtp-el2.dtb alongside the standard DTB.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  4 ++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso | 30 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5c8d179f2792..60f627a469e9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -511,6 +511,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
+
+sm8750-mtp-el2-dtbs	:= sm8750-mtp.dtb sm8750-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750-el2.dtso b/arch/arm64/boot/dts/qcom/sm8750-el2.dtso
new file mode 100644
index 000000000000..3e50c50e82dc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-el2.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+ * Pakala specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&iris {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1000 0x0>,
+		 <&apps_smmu 0x10a0 0x0>,
+		 <&apps_smmu 0x00a5 0x0>,
+		 <&apps_smmu 0x0425 0x0>,
+		 <&apps_smmu 0x0525 0x0>,
+		 <&apps_smmu 0x0125 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0c00 0x0>;
+};

-- 
2.34.1

