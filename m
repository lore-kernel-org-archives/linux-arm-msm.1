Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715EC5581F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089296; cv=none; b=Ijr2yof18p0xhyLwn1FzR9N6PJ7jCLRVtlJYDDBZgA5urgLPBj52fSr1BGSC26dG6CV40RFT32PLwXZPB+i6rC6L2SGeLbMqkjPRxXOk09Q0G42PUhV9sNCcY5Eutog9RF9CT86jRbQFClGNxgrqy2U7mDkmciG7uYaoKLwE2Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089296; c=relaxed/simple;
	bh=ryg85ObrTJOAyfSo30gmnDwUUGRxahMFV5OJfmrABuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t95qUO+TbNOTadoE7MFpV79kUB9QKdxahRYGK2WsKE1R8DM75t+hbRymi7WpIkWqtxKEWW7IUYxiUINpY2tvZlGvB5lXY/u7f4IX9KTvhzlMDWAvC1H/csWm0r7cYWWAy9R/qFL4mtN45oYSLfNd03cs+CvAnjzWzOEPsO+bVGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqNKNffW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYjqFbMa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqNKNffW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYjqFbMa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEikqI3924145
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tU3Bdg6TWqn6w8wy9nbrOLNYOseegQA2LbNaQyxSzks=; b=CqNKNffWaYZg9pbC
	zQLyDDVaQYnjT4Gfmb+uSiYIeg9nQq2upgbf1GuXRTCyHoUA3kYWZixsuJyZ83KV
	xF4Ftc1dSRLHzHMfOG9ZGwEAJGJERdL/ptS+eRPOzmVN5sejl/+EqsA6LxU7qPbE
	EsMFf/dydUs7wH++vKJ3NjMd/qnAsV66JvQKP0snB0LZ1fclkIyTIZ+nRQrxEjsR
	22vykOec+zBU7bpXnDnNYVMKYJIGh+KiI5SJFvyPLGn+MUmiP/FVQ0e2H5v/uw5V
	4kUhCoveq/AUWfOMVsgkzYvoypg62efLbItICiqWVGf32bvKCQHUUvSn4hzKZNS5
	SzV4Zg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec05ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:01:31 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c98fd65daaso4464683e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790089290; x=1790694090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tU3Bdg6TWqn6w8wy9nbrOLNYOseegQA2LbNaQyxSzks=;
        b=SYjqFbMavl2BOiqpqNCD74RDHIpEsyZDZ32Zod4kLQJFWjfu7jImjKM8Doj+m3H2Hw
         7boj2yR7y455MzwmpdZUKQg4mtJtYbngE8cc7lvyOjMLY2i5+7L3hJ6GBdkRhrazM7Wp
         f98ersrH1xnSaoOZEDBBa9aefWkBbCrre97/OedJa0lHex1fvGEntmY/S6gJH2iZl1ua
         RSl6PZuGslSHiXMhTn5KjTUs7NmSyYiRqOnbXvpw8u4cOnseWcW/p0dKQ5U8lxSj0aBe
         mFLJ/IbuBfdqZMRjMgXLD7A7Fa77oAuJFedVs+1JFinTBo1ZyzkgX6NVc1/nRZqWQ/zF
         2rUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089290; x=1790694090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tU3Bdg6TWqn6w8wy9nbrOLNYOseegQA2LbNaQyxSzks=;
        b=S7ZcDBJRZ9ldj89R6UzHqJqKOqF6hYCscuZnjbbpt3+MSe8vBik67CDUPCEtfFxMoz
         1kvTAEo0wO1k6Tzb44hiX80Agkn2uqcJ7jQqv/rK7qSjLbk+S8O4vAAMvq0zft6W3lI5
         nB1lU64dvjfodRoW9JZmO/GElxULQcq1bCUTlr/mE+VTswWRLi0cU5cYYdfvCiyKtAno
         A3RnAV7uPUwuqB3Pel9lwpVGViWLtuo96nWOgLa7huccc14OP9CSUoVxkxZkZyn5AEaI
         Vduo5AMU35gKHxRdc0nA/CxmSHFqAO/l929jZlgNByLHxjMyQY8JFSkZGjrmD5m41sV1
         q8/w==
X-Gm-Message-State: AFuF++l6+C1h5eZjgE6ifWSxp/QaDUITZse6xrbDYyIzeZn8DQIs4vbd
	CVrGkYbQ/94RIFF5iMmw7A17exgVhNMeqDkpBB/VblDfNhzRBfdY0HUBhXuW3/PEGsUYjW2Z1JC
	jajddE9Rv2eptFmQFUMZyXI5zA9oafYdRpUBBcER5mllf1jaK8F3124V3shMvwc9imqXa
X-Gm-Gg: AYBFou0viXkRxT4kqsSpeZ2Q04RYKOMWfOj8ED2HlvpCh8vQruWolO8qzJxzJU2tTLk
	Qdl63pvP5kjThz9plLtuvdFTBs9+lKFbh06j7lJ4xMb50AP9e0KBNfSZyL9il127Ukfm+UkxTYq
	9sPhNZ9UMbvPU//rs1ugqsWXFmcataQ88rUjMi8ldfnmuBn4q9thRKNxJihDRSIU02GezHzfE8c
	kel5sLJW1Lq0E+KSpd8K6y8B5uNKeA9w9TuxIs04OlNJQTNEkf00OGxQQpmfjMAA4oJUlJe+nBp
	V9OktR5Tt1At+nledTZyrlyP9xOivti7tWJudt3AkKzdNV3iqtfdXRsdGJyJeZSxLVVZRYgJ8Nm
	7fKyB/YK2wII2ZtIQDYFha2XsU9o=
X-Received: by 2002:a05:6122:3116:b0:5c9:a60b:e5b1 with SMTP id 71dfb90a1353d-5c9b5934364mr9606680e0c.10.1790089290230;
        Tue, 22 Sep 2026 08:01:30 -0700 (PDT)
X-Received: by 2002:a05:6122:3116:b0:5c9:a60b:e5b1 with SMTP id 71dfb90a1353d-5c9b5934364mr9606580e0c.10.1790089289382;
        Tue, 22 Sep 2026 08:01:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4504298f8f.35.2026.09.22.08.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:01:08 +0200
Subject: [PATCH v2 2/4] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-nord-usb-dwc-dts-v2-2-ba2b39f1a843@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9585;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ryg85ObrTJOAyfSo30gmnDwUUGRxahMFV5OJfmrABuQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqspg+fs/gF5EOYe4dwJcAdW1I/2F97liSt0tER
 mAZxaucwzaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarKYPgAKCRAFnS7L/zaE
 w5fnD/9pgTFRhWTjf+UID3uHsIMWT8+LxZY4vmKXqJzaZBOvRyqDNf7gGGTAFdWamSbHwxUsmaG
 MixINeAtmlUJnx/k453cc7nPUVJe0AYSbteAltpaYgR8DrS88MTme5l0NqODS9NGZ6a8hyoZ/xP
 Fowoewh3PghQDeSHlRNjSX1XQV+QZR9MPy9Hk3zQ+VZuZVXZEmI7kQmH5t4kJFK2FBg+bl2y75j
 1JnYng0hptniqZQ6GahktdazHLFjXwmDRynuMXg5gddsHYM35cIkTVQSsCgeaST9ayQEBuBj8Rr
 AIPtjsQ3PQXBGe76Br09nkgZenfj5KXmAKOm8mrrMwL/MJC3bv05z8fcM9LSh0a/2h5F9/MYfNq
 wt3ENnrtyMWwYWbxfaNllpE3UR1AGm5/I5ihXN6Uu03K+sdsQyNoN6HvsiOlMQQq9EdO7UKZ93E
 8vac5LulJ2I3msL7xbPYFCvEqbgLrZWMqi4yqVq9rauF8N08e3AtuojT6Uvj7CsPGb6Dgw97xOt
 CCQB10oBAMG0tBp33ssQCkJqE7llV6x/O7kPrREzFMCbHEISO0QRFWJ8nwiU/52Jd/Hwi0B18ue
 rkZNVz3THFI33pSb9S1nUX5Q4BNAmj78uRl0SHjBj3OC5eqnOKne6ZAlEr4mrKOlqViV5JIFylF
 ZMK/5fco4W0z7kw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX5f2GYhO8yTZh
 sVuBmLZ6S1XnhRqV/i1TfaxAusq19lvKL/OpQoY4m+qW5OuLhDWzZPFFr7FTfarsn24dRRkHp21
 Hh44V4jui0eSi8T54QYKPBw7nkMg4Nki2XhcHNOmFZDmj2MO/lJlqDdGhWvCe/P1WMiicY80Hlq
 hKgqaYceKtYZKxAhfmnYiqUGwdL8ulifVRzKlsn899OveuBS3uNZfGPkry+xRgE6O7/5m6d06a3
 w2ahfRKpLp5ubas5gAE/zUIcP+l3vE0XNs5f5rfnESw/LJTx8S0HDamZm1YaJq54udQoU0OST/N
 Yr2LcjK0gS4Xu8w5ZYPwrVLS7qz86GX83ZjFXhRQMwRzgkTJWHa9reLmk5WSyyWkByICOwELms6
 S7DFmzKXx50rQOT2VgIL846AwP9s4Q==
X-Proofpoint-ORIG-GUID: lv_I5AIoC6gxwMEv4L5eSxGU_4Nf7LP4
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2984b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=NOSK86ayaCRT3GQFxdkA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: lv_I5AIoC6gxwMEv4L5eSxGU_4Nf7LP4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX3A1+N2IIX7GE
 HtmtolLLPntw0sZJV5xg0BGmKbiksRLo67tcZBrBF8DziLEWM2EME4sLY8prnW++fJNwezww5Qc
 c9M1QBaEV5Du/g2gm+1z82gqCKphteg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609220219

Add the platform resources for the three USB controllers on the embedded
Nord variant: clocks, resets, power domains and interconnect paths.

Add the eUSB2 PHY for each of the three controllers, plus the QMP combo
PHYs for USB_0 and USB_1, and feed the two QMP USB3 pipe clocks back
into negcc, which so far carried placeholder zeros in their place.

The eUSB2 PHY of instance 2 gets no 'resets': the SoC provides only two
QUSB2PHY block resets, belonging to instances 0 and 1. Instance 2 comes
out of reset with the rest of the USB20 tile, driven by the controller.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 311 +++++++++++++++++++++++++++-
 1 file changed, 309 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index c7ac2e66632e57852f6dd88d8070d5c28cf70d2f..e7ff8c420300f34a2ad4063ecad8a31f08b8d80b 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -842,6 +843,161 @@ hpass_ag_noc: interconnect@5fc0000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	usb_2_hsphy: phy@88e0000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088e0000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
+		clock-names = "ref";
+
+		/*
+		 * The SoC has three eUSB2 PHYs but only two QUSB2PHY block
+		 * resets, which belong to instances 0 and 1 (usb_0 and usb_1).
+		 * This PHY, instance 2, has none of its own: it is taken out of
+		 * reset together with the rest of the USB20 tile by
+		 * NE_GCC_USB20_PRIM_BCR, which the controller owns and pulses
+		 * before touching any register. So no 'resets' here - both
+		 * consumers would need that single reset exclusively.
+		 */
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_0_qmpphy: phy@88e1000 {
+		compatible = "qcom,nord-qmp-usb3-dp-phy";
+		reg = <0x0 0x088e1000 0x0 0x3000>;
+
+		clocks = <&negcc NE_GCC_USB3_PRIM_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_USB3_0_CLKREF_EN>,
+			 <&negcc NE_GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+			 <&negcc NE_GCC_USB3_PRIM_PHY_PIPE_CLK>;
+		clock-names = "aux",
+			      "ref",
+			      "com_aux",
+			      "usb3_pipe";
+
+		power-domains = <&negcc NE_GCC_USB3_PHY_GDSC>;
+
+		resets = <&negcc NE_GCC_USB3_PHY_PRIM_BCR>,
+			 <&negcc NE_GCC_USB3_DP_PHY_PRIM_BCR>;
+		reset-names = "phy",
+			      "common";
+
+		#clock-cells = <1>;
+		#phy-cells = <1>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb_0_qmpphy_usb_ss_out: endpoint@1 {
+					reg = <1>;
+					data-lanes = <1 0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_0_qmpphy_usb_ss_in: endpoint {
+					remote-endpoint = <&usb_0_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	usb_1_qmpphy: phy@88e4000 {
+		compatible = "qcom,nord-qmp-usb3-dp-phy";
+		reg = <0x0 0x088e4000 0x0 0x3000>;
+
+		clocks = <&negcc NE_GCC_USB3_SEC_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_USB3_1_CLKREF_EN>,
+			 <&negcc NE_GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+			 <&negcc NE_GCC_USB3_SEC_PHY_PIPE_CLK>;
+		clock-names = "aux",
+			      "ref",
+			      "com_aux",
+			      "usb3_pipe";
+
+		power-domains = <&negcc NE_GCC_USB3_SEC_PHY_GDSC>;
+
+		resets = <&negcc NE_GCC_USB3_PHY_SEC_BCR>,
+			 <&negcc NE_GCC_USB3_DP_PHY_SEC_BCR>;
+		reset-names = "phy",
+			      "common";
+
+		#clock-cells = <1>;
+		#phy-cells = <1>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb_1_qmpphy_usb_ss_out: endpoint@1 {
+					reg = <1>;
+					data-lanes = <1 0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_1_qmpphy_usb_ss_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	usb_0_hsphy: phy@88ea000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088ea000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_0_CLKREF_EN>;
+		clock-names = "ref";
+
+		resets = <&negcc NE_GCC_QUSB2PHY_PRIM_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_1_hsphy: phy@88eb000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088eb000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_1_CLKREF_EN>;
+		clock-names = "ref";
+
+		resets = <&negcc NE_GCC_QUSB2PHY_SEC_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
 	negcc: clock-controller@8900000 {
 		compatible = "qcom,nord-negcc";
 		reg = <0x0 0x08900000 0x0 0xf4200>;
@@ -850,8 +1006,8 @@ negcc: clock-controller@8900000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>;
+			 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+			 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
@@ -1881,3 +2037,154 @@ opp-403000000 {
 		};
 	};
 };
+
+&usb_0 {
+	clocks = <&negcc NE_GCC_CNOC_USB3_PRIM_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB3_0_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB31_PRIM_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB31_PRIM_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&negcc NE_GCC_USB31_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB31_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_0_hsphy>,
+	       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy",
+		    "usb3-phy";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_0_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_0_dwc3_ss: endpoint {
+				remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_1 {
+	clocks = <&negcc NE_GCC_CNOC_USB3_SEC_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB3_1_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB31_SEC_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB31_SEC_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&negcc NE_GCC_USB31_SEC_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB31_SEC_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_1_hsphy>,
+	       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy",
+		    "usb3-phy";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_1_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_1_dwc3_ss: endpoint {
+				remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_2 {
+	clocks = <&negcc NE_GCC_CNOC_USB2_AXI_CLK>,
+		 <&negcc NE_GCC_USB20_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB2_AXI_CLK>,
+		 <&negcc NE_GCC_USB20_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB20_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB20_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB20_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <120000000>;
+
+	power-domains = <&negcc NE_GCC_USB20_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB20_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_2_hsphy>;
+	phy-names = "usb2-phy";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+		};
+	};
+};

-- 
2.47.3

