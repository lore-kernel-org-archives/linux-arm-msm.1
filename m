Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62247D92F
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146635; cv=none; b=MDylZurSMzmm0/+P71MfBE3zxYdKBFk7IiNC9JzGa0okqG4JY1jdXLwAoKSdgPJoGXyjoRRqBnjP6iGafzvm6mw54wyrX1LeonpEiaYP1fucU+EqSiXgVehzyBpMqPR/HwSkYuMlFVVQINVRdW0ltxv8LOVngxUCvWLOwW0EmwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146635; c=relaxed/simple;
	bh=si8QSJxibLkoMYhbUqb6F1+7r4KuaoDTBhnfzOqCBps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaS1aC+hT9j86IkyaAYVQM/yre58jT+nHvjr48P+AE8vZrQEG1RIESOuP8QoEn4oPHcIFetA6ASHOLiT8PqxMNfe6m8DcTlQIYyem4FFOQgmmgaJE8ydVJkL6d3KtZQWgYRD0yG+nCHmJ2NGA4VYTCONmTtgfBF+Je8nWE8HHTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRc5ri28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEfB0kyE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRc5ri28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEfB0kyE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAVsG1647989
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/7bD1HrVAtwty8rnLXjEndNniosGGkCaE/lAYisayJM=; b=gRc5ri28QoWQQJGu
	ou0Y/npPfpQTeBbuMs46kePtu+6oXXal8wdXsnSLgTMukJPW6NdbglBNu8z+IGrQ
	LI7SzKXmxyPbb4vqlPq02HktKFhXfmDWojsp2eueub0QYbYpYtQe+3uBnaLm8048
	5VUIzYdCHxEnrq02EEgvXPZo3RzWGNlGc/LF739/sEpV66MQgw0ZsxtM2S5GM9QK
	IBhyY0Httf+nWA/VdqFRj7jZnGb7/frEjVd/XCBrcqFlzF7G9PU28F45i7PjPBwL
	pWB6PeBj4rWaMUppZdWjZL55z8Bc8N7M9PhozJPfAZcT8iPSrh/dscbR81j+NGkQ
	DwS98g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumr350-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:30:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so4116970a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146631; x=1792751431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7bD1HrVAtwty8rnLXjEndNniosGGkCaE/lAYisayJM=;
        b=KEfB0kyEpxDlYkAkkaFGnMWWRodV4p+VhIwiJH56u+azG73mb1mvh9+g2FgBy+eP9U
         qPtMyEhS7HF8sZTXpuKzsGuKnQkUtLNf3TUTlB4FHOiPnuzqrlk5jSV/0Xw0Nz97Iznp
         f67qwvNbPH6OzUb+CK716MWJ7g5PtDMnPCjkou6PITKdtmhlrhZr0u06htAa7ezqAyaJ
         Yk72VeoypGbvqmycwLwZXE7aZleTt82XCPiqAsMGPWsnkLG/nH4B37FlMKLOeWERUFf5
         38mI+7lOQq2gXgVWAcgiTujHq/5SDBhu4Tqdqt9QVGXZ1wnLbQ2ZCXi5eTWV4x5t4Xjt
         PkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146631; x=1792751431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7bD1HrVAtwty8rnLXjEndNniosGGkCaE/lAYisayJM=;
        b=OZzgRi5F/qdLZoo3ZxsSxjsUYWYF39O/TPE9CN+333bzUq/x690Znz+rAfRnInKI/X
         X7iVQoGbVq8YgIebP1cs/QVM041g98oLcaEkOFSBo5HrlS32uB2OOPqepaItKn1EoCR+
         zPEAnDh5hrq05d63lAhQgzyzohnRGbS7Y/LjYC2SavbkopEt0DZP6ETwGZZ/+eMt59CK
         7wLPyzAL1Xk+IQJx2p/SinswzySNrVvhw3dnORxtSxxH/NS8gYerBX5qF/0w8A0Zol59
         6UutUyG32oML09qSkFeegBVb6LYg5ZWQ2KE/12Zr1p0/OUsJtG+tNODUEVazQUTMq8be
         SRWw==
X-Forwarded-Encrypted: i=1; AKwUvByKpZvo4UUn9nJsbzTEfk3MYPyKH77CW7KjDIvcQx051e0LFW/DZ8sHkln0g4SQG0NDo/U1Tjs3tjHk4TeS@vger.kernel.org
X-Gm-Message-State: AFq9FYI0RV3/TopGc4ZibjWY7ivLGTNeLZbYkSn2SeakHCjozm4Sil3A
	odbPJ52W5aCiyCYBLM9coTkgsVQXsBWsTJ/Jk/VDFH3WQoyumWAANBahDJUQYuuTYLUleEidcpJ
	X0do9qHTvyUNdlqhnr14B9CrV4Oh/doSqfruvPVc+eICQJtl8lCjexDaDwNIIt/JzJeuI
X-Gm-Gg: AYBFou1et28eI5NKvrq4l+WuQo/LUVhw1PzDw3TFrNX6rnwjG+Wkhlm8Qlt7Vz/VEV8
	mY0fhvhDSTWI32FouHtmIXlyXCz5DMEHeBvZwUrAEdSfBZRCoKtjcTaUm16yXI7bODEIQq+4SkP
	S758KE4CHPhK+DBLGRfp056lmqeb85bPuiMRdr4oJx3WBZVv52Qb9apONN7+LyhTVcq5QBAZSPt
	BRM+ilaWNXwdNxSMXRgl44TXiH9vV7XofFX6oTbG9f7qdHutGGEsUXPwY0XJc7TywyvI+tXhTa2
	i0VqKc/niGyOxzaAodDlKlxa7tBTqstSCMXViLAGFMYB40ZlRDajZPyEZ49HINrYoeUtBrV7AXS
	4ggEMVxt4PFqkLUJGwe8cVsKL+LzcUJSElQNR2MfQcFRi6VaoIYT48LyQejUmQVs=
X-Received: by 2002:a17:90b:1f91:b0:3ac:53e0:4ed5 with SMTP id 98e67ed59e1d1-3ac53e0532fmr7851723a91.39.1792146631003;
        Fri, 16 Oct 2026 03:30:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1f91:b0:3ac:53e0:4ed5 with SMTP id 98e67ed59e1d1-3ac53e0532fmr7851695a91.39.1792146630491;
        Fri, 16 Oct 2026 03:30:30 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm961696a91.4.2026.10.16.03.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:30 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 03:30:23 -0700
Subject: [PATCH v9 2/2] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-kalambo-crd-v9-2-11e6a40b68e2@oss.qualcomm.com>
References: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
In-Reply-To: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146626; l=2954;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=si8QSJxibLkoMYhbUqb6F1+7r4KuaoDTBhnfzOqCBps=;
 b=Vt0UJNTTtQe85tZr9sbs0fxOqexR0jhjI5S+HZ/kepOTJPF3A+xA8d6O3q/8AG1eU4fhNRtMU
 yRVslD4hHQ/BR0bmVIjLDMqvonD41DzxXqjrU2/KJ96wYXWdx0x7lAa
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX7hbkUDv89OrV
 YjIMTaa8TJdDO4/nhvnXAmQnu2yYoMz84yz+2O70sitY1rgzbaVWaSvuiQEfBL2Ab/bbaIxKWoI
 XJcT0my14g1EKlCMUCEZYqq3kEfnCUY=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad1fcc8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mCez9LKK-YWkVuwSxDUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 71AWL7QKYlON5d2eG-exlS5jqIjKAnOG
X-Proofpoint-ORIG-GUID: 71AWL7QKYlON5d2eG-exlS5jqIjKAnOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfXzT2Pd97GVNQu
 ftH8R1hU2ZGk5byPJot3aLFBTuOm7MTCUktk4//XDGpUbmEgH8WjiUgQkUwicKKkjryoQgjhTyN
 6dhL7Rlp48H/g3+clMF1jeFiGHLMOKie8bxYMQ33nN9krncwU94btwOXTFP5/GhW5RIZKF6cnXm
 XgRe6HHB3BGXJmk84gTuAvYShTGy2g6INGlUHchxL/pfdQCul8dfPUY/zbu/2KS3mueZEHQgeUv
 /BP34qzkn7HyaBjB1v8+V6tgJ+4Ay8EM2VagWvxs8DpP0xbBnlV5k3gdhBXakbKbepozTWk8Ixg
 wRPmPgHe33mPcFyYbtBczX623tdDhG36kZkwRXyJLyqsQrnr6baNNhSHv77fWgJKxQ/pilmxI/C
 ncjzQy7qIi13r68JDzcYoxFUeGEItpv4FUdPECAuBnPvKrNWGVEPCulpFhjxOv5NLTdrHPD3w7W
 c9xzZBBpN2NmBNuZoxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Kalambo uses the same QREF topology as Mahua through the qcom,mahua-tcsr
compatible TCSR block. Connect the QREF and refgen supply inputs to the
corresponding CRD LDOs so that the reference clocks for the PCIe and USB
PHYs can operate.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 37 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..b7f1e543a248 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -50,6 +50,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..9149cf6ad94b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,37 @@
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
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1

