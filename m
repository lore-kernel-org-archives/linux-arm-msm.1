Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A1347DF99
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484188; cv=none; b=KSbeUVAzHpuVzwSIJfjLhQjGHuW/PuP7rnspd56VSgM+OR19bX3KejQSk7i4GihXDdADBY9W20Hxn+mIChz7uI1ABC6cgbhBjRKnhrXdYW5PPQm2Bxn9Xpo6Ckvtvu55z1/UqRHYCtIlxifU3UXRT3LKTP8+JDQ8m4d5UsKti34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484188; c=relaxed/simple;
	bh=r6xGhbQu1ovH5oYLfzS9gsVXYRsCehhXravK0x831Us=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ovj6dWyxIrVOW677E36xcHo5XyWsgzVE1UrCmWp2mDaaLJJzx4Q4icECKvF9g0M2K3c9g/EKp+F1gUKBKPZZdIii+qT6RglTMuNaJLWe3Opq12i1syqUUimTTpe/owED5eJ/rtuQvobKlS5LUGgMWNlOXH7sYe7lw7sYPH+rBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ib0cCCTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/HfYSjF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ib0cCCTv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/HfYSjF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQrmT594472
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VR59FV1dLHf
	FHqsR5yjQUbRalpRs77+LuixHpzH6zTw=; b=Ib0cCCTvc6ibAW6upBNiwNgNWDD
	7o29+KJE6rWARFtBTDPh100wij11QDpqnAUaXPQoiqj0Y+6EtgqXX6398UDx0JsU
	RuU3fbIzlJlYmUB1GKpZguFa5xldma8Tea4aekkWy11zUCBFlkbB9qt07LvhLazn
	bqoqM9RQOFEECpmslLHuUhFf6qr2I8Vt7HpgI6WsB9cq5mWLv0uzcU2LAnqhq/I/
	lHh3SG3HYyP2vublx90ojBCyPdSQKC1paiyUVMylJFweCr+F2tPpt7if4rGeE0qO
	ydwYVGwJCXcdy3cAeepiHy37QWPHXvtRZnUgqX80u2v0leY862VKIqsGt/g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxweufbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedf6e8a42so254980a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484182; x=1787088982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VR59FV1dLHfFHqsR5yjQUbRalpRs77+LuixHpzH6zTw=;
        b=E/HfYSjF7xEW3eaRuDvv+daLD440hxAAaZ5zBD3Lt3Yw4uLI8slqwebyib1Yg1KNDi
         xW/ax3RHlNoOm1JM8D1dfT6KzmOxWgGH0ZYQCOTCtIh6i7E5SMpkthWVqHQzyB16H3gv
         bEgDHFysVOD88lNiKLjdZ7EhkhInVWWFggpyA/R9djJM57DUJvS3clzEbBLWx1o44ilS
         I22uz5ATbecPM1mYWxDxzakDhZ+1l/USw4uPVquXnXPoa4qH7WxplK5G5ep612TYIA/Y
         1Y5zKrEbGRc5c2XMbNeCziGU9ChxWhccY01JLaeJF4+MXIS/DaoV1/XnC1lEtJHB1f1H
         cNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484182; x=1787088982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VR59FV1dLHfFHqsR5yjQUbRalpRs77+LuixHpzH6zTw=;
        b=XtwdrtN5oOyb3eYPC7qvjUmgL1/Fwq35zzTfvh2p9Qt9HA9+WcO8kzzeMeG7YPOISp
         wM8kshOKm/QSRb2PoCEg6YF3h0UyEIuvgxTT6PgDX4wrcyoPadaNyA6/eG+rqV3vIbX7
         i+Or9c8ds83/7aVIiHIYS4goS3oyyxql2pmS7zugD9PLMbE4gFhm5WXh4sUuZBZhdB9P
         4HbOTONYLF9Mul4OUafPxu1QXwe114SUYPbtwbzDC3lwo4lFV3fD4zsOfwDGzHakRY0H
         mf5KArQPVJYeCYyZagTB2WR2J1+44tPBUVWrrmFDb14TGuEE23NzB6vi3XoSGmlqNgoo
         LDHQ==
X-Gm-Message-State: AOJu0YxRnT3fiQdhCHxuX7e0gReQplGf2PDGP1AtsBMbPOWVwbTBobgJ
	8XL6M4dVhc6coFl8LHWfbxSde30dKkv4hexJgtuU4dCuuBrIru4oToAnKq2s53kNw3dV2pOZmyk
	8TWXioKRxfMzEkYiBk/V5rZzkEtjazeLzU5j4+lAo07t2sPaN4GsygH5WZTv+Gu9Gu5ZX
X-Gm-Gg: AR+sD11kjqxeDMBNYAHW2xl2zc7VpEJoO+irohdNbICsE0pcCA5+0mLQ9MO+TkchGNT
	Y1UqiDQdcW4hvY4cnATTt5YMSs4cExyfd8TesHTmB1w6VazsCfB5pW3VFhNMLSXnOcAVYRuEYCV
	T/TTlxBN/v6GGyFxwlGFBi5QQsvdbFmpqzsFpGK6nz6FBYfVTpJAH7fJLBlxxfyVrAHN1L955l0
	fWvv/SXm+mwI4qa3ZQgt3zWCDdyGTUKMjB0fA5UghmMrf4rvUdkEbR6mpbl02GKuwv9LNSR7s9R
	MY6J6p5yCi64/oGuvUC6SZ+FyBZ2Q54Rrl1DEWQrNR4SjfdhlboKich38BN/Dg1MM5RZyrxvcoT
	haF9lVa+V16MVNP4sl71cncGO5cyGZxtnVCKLm5VWyhdC8e1Nr1TE+w==
X-Received: by 2002:a05:6a21:7703:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3cc2bb92df4mr8520566637.37.1786484182336;
        Tue, 11 Aug 2026 14:36:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:7703:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3cc2bb92df4mr8520512637.37.1786484181872;
        Tue, 11 Aug 2026 14:36:21 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:21 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 9/9] arm64: dts: qcom: Map USB connector to EUD on Kodiak boards
Date: Tue, 11 Aug 2026 14:36:10 -0700
Message-Id: <20260811213610.2956147-10-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cig__9nUzWO1gSyAxgpgx2NjryEGUvxN
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b95d7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eWSs2RPQfR8YH2_DaTAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: cig__9nUzWO1gSyAxgpgx2NjryEGUvxN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX7D5la7yLNGW/
 Vs6mvvnKYS0ej1nfzMvz5yG72c3zpx8nNE9bCWa3nKh4aiqhXU88O2GAskYopvlFYcSpX7IZ9Rj
 YGOPN2Xy6PM61BpYooBYe8RJBJ99CU4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX5A5AJuPrzg1W
 FHRz3/ObkbjLlAKwOAZTzgam30/YMhSksUHMGSZ5JkDxycdV9Ia5YnOO4vCv0r220O4VkPWWcOg
 rbGTC829KCam8/977lbG04UQvxE0G79k8K+QrQzEJaM2DMHeok6nnBrGSfWA22+tqbKS6sMeV5n
 LPzoombTUG1fLe5ps5npZPIAT42VgQacgGodhXvMmC+OCiqJFArEY/4cvNS2LPW4dL/ss8qn3sU
 4jneipUZTbIidQfJOWQG6dhDT60CMO5x5P+KUgstExVInQ0mgq6X1fcz4QZ0QyUDgs9oFJ2BMgr
 sWxX6Zg6B3I5YPwEEiAgUpXVJxRMSwYfASs9RF6OVUwYpXhXXr5XlNfH4cIdf9+NH+nNKyLVNGs
 scKYIpsG6JrRtEuKJlXWNv+mnjYrL8yIkSLfPpzUN9O1DrkXBtLA32LAAZasAtk4ZF8xBOeNglA
 unC51qnICApqlWAjccQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110182

On Kodiak-based boards, the primary USB connector is connected through
the EUD on the High-Speed path. Update the board-level descriptions to
map the USB connector endpoint to EUD, reflecting the intended hardware
topology.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts     | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts  | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts       | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts           | 10 +++++-----
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  4 ++--
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 10 +++++-----
 .../boot/dts/qcom/sm7325-motorola-dubai-common.dtsi    |  4 ++--
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts     |  4 ++--
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts   | 10 +++++-----
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts      |  4 ++--
 10 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e..b1f1ff6b99e6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1530,10 +1530,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1573,3 +1569,7 @@ &wifi {
 	qcom,calibration-variant = "Fairphone_5";
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index 5bb33a8a9830..41836afd3acd 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -74,7 +74,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -828,10 +828,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -864,3 +860,7 @@ &usb_2_hsphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index cf74b3664cf5..45b9318ab54e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -84,7 +84,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -951,10 +951,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -985,6 +981,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..6520e920a844 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -211,7 +211,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1402,14 +1402,14 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_dwc3_ss {
 	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51d..4c4afe691d64 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -77,7 +77,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1052,7 +1052,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 13e8e62f6205..b9f92bcf84ab 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -93,7 +93,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1098,10 +1098,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -1135,6 +1131,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l7b_2p952>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
index 3860ab8508a0..2a90de989dad 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
@@ -96,7 +96,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1429,7 +1429,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
index d94571c05a59..7a97a3eedd5f 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1428,7 +1428,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 7db9ae1c3cef..4729779d50a0 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -99,7 +99,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1438,10 +1438,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
@@ -1457,3 +1453,7 @@ &venus {
 &wifi {
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 87f267aaeec0..b0bdbcd47503 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -94,7 +94,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -882,7 +882,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-- 
2.34.1

