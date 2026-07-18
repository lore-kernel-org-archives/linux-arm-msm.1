Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190D37DAD4
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376395; cv=none; b=MnCsLx2qg5FoYo71lgQ/1zIPSZbLNDXxQ/z0v0JHSzIcXX7rgz+z41juKAJ+iv9rdyWJchrlXktV9ynWI1IqypsALBXpMLRBe2nW/HiyVFRuMvCVywMyMiR5mueqzx6vQ5ZkKoTsyWjfWrwKs2rpe/40hhNHI0MSbHrTCaLwi/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376395; c=relaxed/simple;
	bh=xSWMZUncT7XcVJn8ZycXc6L+VR1duUYDggVDyKymTus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f79vSnCSMnNgv/kUuaIb36jgRSxz84xon1yuU7OqOK7ucb8GaVwpai7xvp4AWn7qWHsf3lgbG1Kfi874NHFC8AQqkZP0wZad94+NxrKL2Rdh6VWxpccWbaVPJM7S7byvgzCNJPF+90DL6t0u0FUQ943a5MRC2nQMPhmd0t/QG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+3goCA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNR1SpFz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+3goCA6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNR1SpFz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHFk9026781
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pE+abgvX3Y5p22vOFjg0bXapLlvagyW4I7PINjG9CBA=; b=F+3goCA6syNXnbrc
	VEyAMbhYzNPQ+3g0cEPzf25mcXE2t17xMlT9ES8m7P8eU/57OhOB5tuRec/niy1L
	u608weQRZgGOy7UEWl3/UXPG+ljZzddzJX7MQ9mPqPd0lCFM4AzwvYZPBkruVs0C
	k3mjItC4IOF4EJydjterUp4z+O05SuKIZHdvlmfDIfdY6/eCQR3dhEIgVfDnyhPW
	v5MGSV8028T+8A/6EBQeqhRUJlFSPJ0TxC5vqJYYjdSzJXM3wzQBfFTjWZxKH0gw
	jhlFmVpiSP0oyI1pAubenk1APo+yMi0nK+NvMAo9iOFFLMl45WHnEukqeIZ0Fgq1
	mzJUfg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhgncq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso9871224a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376390; x=1784981190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pE+abgvX3Y5p22vOFjg0bXapLlvagyW4I7PINjG9CBA=;
        b=RNR1SpFzd0m1o+ZJkDZRnxprt9JbaBamEnW2W32Ix6LzINV0oNqlUQscNzfqGgl2+T
         uY2fBhjRoCgifQQr0a9jyl87TXJwoPqijAR+E5SFZrlE8DxvzaI1hRlLwSKkL15aZv23
         ICM3UQ8vmQXZ2LZ9RpPJCWTqbogDWdWL996OnmfTFHJLmsCTEFXS/hKvns06pG0NHaRe
         YI5AAhTxDJJggEr4RH1t5UV7TtKLXgZ6DZ4PvWFOaBzohUFzkKdyoe/6f8EKfNfrGmaV
         v3bv5RrdshODGmRCVUiGhd/fESw5Srfse7I1NTvzleokspJQDKWW82ggzu+flPQ4WMTT
         048A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376390; x=1784981190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pE+abgvX3Y5p22vOFjg0bXapLlvagyW4I7PINjG9CBA=;
        b=TOlYkzv4IsN5ZrccP21Nzsba+K4LfqYuIqEUkKUcFZuE41MeurN27WRIptXXXXHEIW
         SwJH+vMMx8tQAXwdUCszGQOZ8GcYk6bpglFWP3FV8CyXsLvPg+bq2A6K4NN9XB4lRjVP
         j+kxZ3xZyq8RaK1jEa7I2s2cJ8CynBNz5prRpfHDe1v5S2LXGAX5/X12CoCBXGHein20
         CjEePLTV5zaeD8kgqHWvDE3bxyKEvcgeMwjl+erBS4tXIHvjkxdFDoy9c6kdfZB+rd9j
         e1my3AhFG7N9nnyic8hyzMk1kcAZhfD9IEF3K7IiY/Fyg5LEmm3778xYGivosrWeqTSO
         BNjA==
X-Forwarded-Encrypted: i=1; AHgh+RrdITLKZ0B1qzXAjF8/9Ict749jzUWebpNpPxfmFiqskYQtDMVXrtRLtxK4fL58pp3p7fJP2PJjLNGaC/9Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzMu0XSGGg804GF7O3vGvz83iCqoLAj95IS5VWuc5Y1WqOyBKHW
	LMouOAvVIJy8IZa9fDnJHkvlfBHHynvtAD1c7ipFGXjkhqyNxYCg9ARLf939x4Tt8YvvAkht065
	QrJjAuJX/If+rO1LNJjM8FzZ3+r0scq1okWpMA/Fhgoaw/85pbnlPK13AHr5sObCBTVVe
X-Gm-Gg: AfdE7cnWbdGp2Rvts70LZmrXGlbFlI9xlQTyEnAbb+x7Cl4xoWbVbXk8wvYA8fjr9hG
	iDdNMClX8TlX8exeYg7GKMR68e909zFiKZzQNnGEYPAoYZgUOuZi6TmRUMOZBqQqen/u13xQv3p
	tRD3feuWyzYlpXzjVuI3b3n0JYCMgD4e+Uc8ljFlM1DoUdHOm4VmP0FuT/g6M1yTs6HQAeSlt3l
	mx/nDtCxSSO5Ei3F47qJQx792NQA3L19UKNyW+BR1gHOv/ZZgCL4ug6O3JQ2k4aKncIrDJJLEX1
	yKZC0rabjwXqKzJjfS0AWlQF9hs61xTjO7T8PdVqvmb+60caWLQTqQSBZCea+xP+AY4XovttFkO
	H5VOGx1LtCy1OcSCfgvPAgGalWENelDHTx1duLPfZvmyBNr2/39syim4nHGz5+wCw
X-Received: by 2002:a17:90b:57ee:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-38e4b454a20mr6958636a91.11.1784376389863;
        Sat, 18 Jul 2026 05:06:29 -0700 (PDT)
X-Received: by 2002:a17:90b:57ee:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-38e4b454a20mr6958502a91.11.1784376388316;
        Sat, 18 Jul 2026 05:06:28 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:27 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 05:06:23 -0700
Subject: [PATCH 3/5] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-b4-kalambo-crd-v1-3-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=1846;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=xSWMZUncT7XcVJn8ZycXc6L+VR1duUYDggVDyKymTus=;
 b=NacEzS+aAM67qR35I7dPmEvYyBox6vyQiFuOgnNVGkcln+sKvE6a6soa5fuozIIy2IJLwxkJl
 a+17GIkisKXCiLSPnxxYInL8KotgbrEdLv/Rw4CflVn5blJt/xVuqrX
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5b6c46 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5d9H2nC8b9pJsYxhbiMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: k0TOhUNV8umBLaCc4s89jpuKDD_prosb
X-Proofpoint-ORIG-GUID: k0TOhUNV8umBLaCc4s89jpuKDD_prosb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX1otMMTtJcnA6
 0Fv9hFD6+TCiITTFer5rIN4OvJ43zJYZSeBrmc5YtjM4mHPBMcBNZ64B00+gZuT6Y0XeDRm7Gvs
 szEKX125XnpO7w6vHaF83vSRsAcH/s1U8aVHQH1OyjFdHCxbktmDhkihVXIe4Ukr2SHcnDZbYyq
 Q+eK8jKP3a6gZl4ZgceiA8sq00f8Xb/6cA1+O3SvXvNYdUfHW+bX6jK6kei4ZyMWEQitlAIAnvq
 wRvVVM8H0fUSFDukh/KZMHUAOpN40G1mlPKMw/LiG1/d/0yfhl4WCVprrm9kA9bAFM+6e39FfHe
 NNnJP6RZRXPFTwHa+QJsUHD/9bG/rB8S+Q4xRFLE+V1obGeL+NG1/RGrIkx2dF5m8Z0zymBnsQt
 BWyjX23H+UzcMaa7GGr61aTtTAdVgm1YRZnQT5B6czZc+43kaVw3W5ukVxj+Q0unR+kbKwVhTKP
 sotIrqbI7R7/+8N3Mlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX3QY+R7MrPkkP
 QzOlN2ygrtIYosTLxLEPhEC5e7rAJQaU0cdpiGIgC+5BmEMsfO3ho0Izctz7jnb6n4bQkp4lOen
 F9aNuyaYFszvd1SUDpVb+b1JpX5L7Ds=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180122

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..0ea4d6696aee 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..b4441807f460
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "kalambo.dtsi"
+#include "glymur-crd.dtsi"
+
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kalambo CRD";
+	compatible = "qcom,kalambo-crd", "qcom,kalambo";
+};

-- 
2.34.1

