Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072257;
	b=IwZu886Wt0VrEiKrw6AQPrKVgRTpXPv9eN0kGnvIpYOhOS57xbtJxrTTIigEb+hK1JfD
	 hoGap2uJMphgiK3jlpHqkOR8gyOlKAPtH9wD5d1eMbs7ofcDudgpg4qAmvaTKT6KzopIw
	 p+78r63G+ANgVxby89wu1LPu6i+HXgnyVpT/J5HU3rCjNrAOrXSHwQUASuyHhjoVALtrH
	 irGdYbBrFSwK5IyuM2kbbmaTK75s88b6jm8GCpLVMLmmzvjQTXD9qyFZlCQde7XwxzV7S
	 1ZJyhfSBjHNp/SXvCkWcJv3n5eKsLM/hDBviPPPqCEdNCJmNdMGG3sCmCGHZW5R2Rkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rqWmSxW2+RkKPy5DIvxRON+6b5SomRLLEfeYUte4pWw=;
	b=cME6zDt/LTWYnXUn9J+/JVaibVYfAzQWq1XONJoCWvRDM53lJpZZtzfQyflNaAF0hsCF
	 p21pLsKHHayy3AlKiICQFtf4I41YRiIh5O4EjBQiOrBBWfPcg01br4ORx0+Tat3AONW8J
	 3QTSPedq8+pAqL+XR2Sw66Onnx/jmPJ0iCnFjc1i2g/CRUaN2l3Fue0X/9arsZrafspN7
	 thDLgVNpinhgmCeC5CSFRgF/9SENvYvDWHRyXWIUcLBuzGJs5OLSnsqfSZY1AmaLjtmSN
	 h9Z+iNMQk9OHwE/j0+5lyFtYrU6okzJMzIYZZemzCkwbTgT0iDcsJvuxgxbd6ezbFKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mt9ZoDkx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pkiy2dh+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6548606A33F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6548606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mt9ZoDkx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pkiy2dh+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v4YZ1962358
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rqWmSxW2+RkKPy5DIvxRON+6b5SomRLLEfeYUte4pWw=; b=mt9ZoDkx4vFBW8V0
	6yuDPE3LQRnhdW57rQFGsJB47xp3nnawydyhQPqHIFYTg1IxMxyJcGcYq2ElSbKE
	wetoe56GwuJSg3SGT08cI16gI0xndzBbsdaGTyJzyZh1MGBko5uJgy/Pv04QNeuF
	CWUmLrNbX3AxFZ5s6RlsQLdMdQwiVO1pelbfCpDKbZ0wG2sqi3fhxR9Oz8GzIfpl
	qEZUGcNg2OxU6zStVNWdpvHo/2W4vHNRVHisjbr66nXwq4KyMSIYazZs8uyvi06D
	0IzvjWXffXIA6GMTFJQ8nBF9sSdJtWv+izw2X4rvMRBLy6vMs1W6Fz2RKd0Wr6Lt
	kQAMVw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxctw2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:10:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso1740281a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 23:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072255; x=1795677055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqWmSxW2+RkKPy5DIvxRON+6b5SomRLLEfeYUte4pWw=;
        b=Pkiy2dh+mwdQVD/7ljvkL9TkXx9Vo82KmGPaXx0onYeyJbTujRl4tijRam/Jh8kMbK
         ah/0yamSwZtxKNrG4Aehriq3+qU3nz5zGqw7KXIyN97G+JrSIda1NiHsW6Swl0A4xxWQ
         ezDwIkC4k/m9xOkq6p2+4tV3IW5TxlPVX/hj4xj3V6ssxoPMoqrb/H7mDtjNjtswlkWp
         Fd0NkqxBZvWYdcWhDKS+3+TFfwDdQTnR0NLiJR/oFq7FZiQzrV9nQ/JFDPDHXqhcZv+w
         vRKl4nv0FOWZsowAXrWbJVqYaXFJbuUeaBkPxtM/fSM7SXmqHa09IGHrGtWbS6RQTZAg
         cK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072255; x=1795677055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rqWmSxW2+RkKPy5DIvxRON+6b5SomRLLEfeYUte4pWw=;
        b=ZMWce/YY3fT1gc02OFC0WAinEMXqJYufM1tar7XaKHRyW9eSm8iW+0lKUXRB3Hj22P
         KmLYoQvyH0t5yRSX497DiqKGQfmZLWs/XSvwXpiTKh+um7ijXZkraHFhdufBErq/zjF0
         WPBHPhBppmf0Z4zUhhCY6nVg6NHz5H2KZktcjKBwylB8FlN5UqYiXq++pZu2Z9Fi6tgV
         CkGgVnH8HMxfyQHTZv+HxV0kYfmVoe1I142mnDyPJMpZjBK+Amyc6Cdh3bmcnLKQnDgg
         4kJcsWjDu5AB0eiZGzv4vTLysanoYNysWfDiBBMffyt8zQFniBfx4kTafq1OQz6IBm7a
         IY/Q==
X-Forwarded-Encrypted: i=1; AL+hErEnOKyW2oRD+ocb8CHSgV4/8BPivnAW90mZAW3pindiAms5BDqvW7oy0XU0Uiet/2UkS2/OmksCzMVLyHPA@vger.kernel.org
X-Gm-Message-State: APuU4Z8jJSwAC4R60fVha0niZDkgglpLe2y8h61UA42s2v7dkvXbMTAi
	JU1/+f0s+K0b/Qx7tx7aeq7aDk5QqwIYcyhchnl/g7SHBKX0jfrWjkMW9pRqogIg2hQW4LVOuNn
	uhY3sXSl+13q6V2mqs52fJT5y68de5/VA6U3u4gX67Ub/jMmeWResagqNMj0DiS9pBQOe
X-Gm-Gg: AZFdTZfC8irpzrQC2QdVswFFLLTq/US5ZuBrmSEss3VmcKo43Ysat7Ar6mXaBWB/DmI
	RPVFmcPhiF22QP87vfGYwcAX4uT2MlAToSoN18kVa2R5kxapwEYVE44rTmtRtmbj1YEB4fUAfRJ
	WwWLdYqKfCrVMlRrgchNOhHjcyTAuqfZyskDBm3NbT28Kp5gaUIoDmrjvkb1dXwjYWsrkGATY9T
	b9BLuzneXagbd57NPmNTrWH7+lVTR3TP1xLfr0V51P72G/wzmD73N1QcPGYh9D/wgesH4PgLZLI
	ARHVtBuqrkUStMQOz70oeSCMnGJ92rygX6IrTQpck7j0q9bV87UJ/gsCh50rQaIwBMQxGadsYnq
	ovOxLiGWYl++rOnj7DNlXT7XXncz/wFqDl6938+gxhVDGIZlf6aomRxPCHxOmACm8NlYhVwD9n8
	Sy4bPj+iOmUw==
X-Received: by 2002:a17:90b:2fc5:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3b3d07aa7b5mr5078139a91.46.1795072255004;
        Wed, 18 Nov 2026 23:10:55 -0800 (PST)
X-Received: by 2002:a17:90b:2fc5:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3b3d07aa7b5mr5078127a91.46.1795072254351;
        Wed, 18 Nov 2026 23:10:54 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm746348a91.7.2026.11.18.23.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:10:54 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 12:40:13 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM
 platform
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
Message-Id: <20261119-lemans-draco-final-changes-bringup-v3-2-db08f12f0cd5@oss.qualcomm.com>
References: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
In-Reply-To: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Kishor Buchi <kbuchi@qti.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072239; l=12041;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=7CMwlDa76MqHRc5vzAm3rhTK08+kxnhgUqfmJ9uDCXE=;
 b=NQzVSoaiNNplJAT+DQwuvCS3UNouCT4tPxiaws3eR54zwQBEJ/zDKFiIrNL9fe7vAikJqMDl+
 1WL1eEC3v8vD/rE/UgB7KaCQ3ORnsbDoqSvy9LI8gBWk9cGOPTuzA6g
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afea0ff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DPbrpyM9rVPZFICIiCMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: mrF2MJt_e-RthzcrZ4pQv3uIOYJdhfSG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX3JiruPWr5pAt
 Tg3UDjMpWv6xlwIXeVjBV9gId1AGg9AcT2UbV69m0UuGeK/AFYVeTsyoVamHIJ10GU0+60gz/zw
 0lk3th6DVdpWX7ykhJmQGSbUlEEQqHW5UzNaYngD90n/nkrMTZ0r4lwLZq/O2iIrm+/bfWTkTAt
 cg4trVu5+PyC3HpYF7IKYv52+5RCN9yt3L6eoKX4hWac+TQseJHtCjQIQOvG12lq4+O3IE6NwlR
 5D+6gkmMYzU0Xb/FS0CglK4qwoSmeI/Th95TIGTfD3P7/TGA/SmRdDNrXQZfCPUIOEJO+FxC/dq
 nM9McXFPvQPu+0pf6sV0iqVl+Oua2in1Wq+oWTozAixJ/LqpR5ou0zS1p2VLdBf97fBotlISI5K
 k/kmvnySKSk7/ayYUz+yxPTiEYCAnVBiZdrpksyj3ZQli8n0Z+c5I72egOj1FZMM1QWW+MFIqMX
 yoXOt2GP5GfFbK4Zedg==
X-Proofpoint-GUID: mrF2MJt_e-RthzcrZ4pQv3uIOYJdhfSG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX88sehZQlTrSh
 uDVQGYUPLrQE1s1SHlJzF3fag3A0VPRa9bKhxo7Fz1/H7r9o2rw9S15dFdUl6A5hjnqF010KfLY
 nANI40CP0y6paMFvlXYKTx9OMT4SfAw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190028

Introduce the device tree for the SA8775P/QCS9100-based LeMans Draco
EVK SoM. The LeMans Draco SoM is a compact compute module integrating
the SA8775P SoC, three PMM8654AU PMICs, and essential connectivity,
designed to mount on carrier boards.

The initial SoM device tree includes basic support for:

- RPMH regulators for three PMM8654AU PMICs
- QUP firmware paths (qupv3_id_0/1/2)
- Remoteproc instances (ADSP, CDSP0/1, GPDSP0/1) with firmware paths
- Debug UART (uart10) and board clocks
- UFS storage
- USB 0, USB 1 (host mode) and USB 2 with HSPHY and QMP PHY supplies
- GPU (Adreno 663) with ZAP shader firmware
- Video processing unit (iris)

The SoM device tree includes lemans-embedded.dtsi rather than lemans.dtsi
directly, as platform resources (clocks, regulators, interconnects, PHYs
and pinctrls) were moved from lemans.dtsi into lemans-embedded.dtsi to
allow lemans.dtsi to serve the GearVM variant [1].

[1] https://lore.kernel.org/all/20261031131042.1200862-4-shengchao.guo@oss.qualcomm.com/

Co-developed-by: Kishor Buchi <kbuchi@qti.qualcomm.com>
Signed-off-by: Kishor Buchi <kbuchi@qti.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi | 421 +++++++++++++++++++++++++
 1 file changed, 421 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
new file mode 100644
index 000000000000..1001b6b81c31
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "lemans-embedded.dtsi"
+#include "lemans-pmics.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart10;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1816000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a: smps5 {
+			regulator-name = "vreg_s5a";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1996000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c: ldo3 {
+			regulator-name = "vreg_l3c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c: ldo5 {
+			regulator-name = "vreg_l5c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c: ldo6 {
+			regulator-name = "vreg_l6c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_s4e: smps4 {
+			regulator-name = "vreg_s4e";
+			regulator-min-microvolt = <970000>;
+			regulator-max-microvolt = <1520000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7e: smps7 {
+			regulator-name = "vreg_s7e";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9e: smps9 {
+			regulator-name = "vreg_s9e";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6e: ldo6 {
+			regulator-name = "vreg_l6e";
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <1450000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8e: ldo8 {
+			regulator-name = "vreg_l8e";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6_16mb.mbn";
+
+	status = "okay";
+};
+
+&mdss0_dp0_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&mdss0_dp1_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&mdss1_dp0_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&mdss1_dp1_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&pmm8654au_0_pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32768>;
+};
+
+&uart10 {
+	compatible = "qcom,geni-debug-uart";
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};

-- 
2.43.0

