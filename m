Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCD02367DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615406; cv=none; b=BcVimXv1XaZ16uPRV/qvpyB4f8gXMiFl1wGhkBimtFCoGAIeCir01zBZZIR5DLGOitAn5yT/ayNsays9Z8XCDc1GsmcPxxZ3QXSqwV/1v2Z8j+m/M5ege84SqESvNrgUh4QLMtp48OSi2AIkUckw/Lg+voKXMO2iyKpuCuwBpkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615406; c=relaxed/simple;
	bh=cz7qH0fM/U0F9tsO23qklpcnKFFftVZvMQyY4O75Cu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nw+FEQ9v7uKivOv7A+l3qdEfaMjQUc3nL+omuPMjtRlTcXB1HfsnKryvDoWaQCAjc14sa7x2mvmW2KbYb4Dtqr4YSC6SBi8lINIuystJvaK+m82MumOy9/O6zcyjV2GOS/dQ6ZNVPNJIO5t4rf7KfEvL9X8MbNFEqNagxSXYE00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1sU/Wnm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8jJ6r/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1sU/Wnm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8jJ6r/N"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4T1GU527891
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oddz51t1pYs203ZbkRHzKFa0KfovRfAUEcnmjw58rV8=; b=Q1sU/WnmM32wHkA7
	vPDLrBilBc8hajnPz5zLxYhV8ZgNFZUVIlCR1otSvoN5Rpd33ZHF4DA13Nyy6Wno
	Pl3idXwfCgWqwd7GtKBxSVu0xL92hs5FnZLdGX+Y+hDtKxHzvrYeSAVJXh5Ry+yY
	UEp3toM1H+kkBY1xYjYQVmn8llSO0ePG03S/h4CAQZ6shogqkPB1BsKvHrDL8F8d
	+gZCGe2pZgsp/YQ6SKh0opv0mGxakUvKdw72mTdAeug6zuoUOaCC9qpcYGPCqgK4
	SCQKsG/7vaZVYaAjCwdQwPlTH4EcqI6vbG9zcJzSobtxdzMMBfQufMWi165GeURg
	5X/xMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se0dj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:30:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso230466725ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 23:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784615402; x=1785220202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oddz51t1pYs203ZbkRHzKFa0KfovRfAUEcnmjw58rV8=;
        b=O8jJ6r/NEDZyLdwER+RnRXNrGZGLfnL5qEPqxh3SV0gDsfk5+3ubvI1i+uaHzkCLZn
         93zilCK5uAsu1fe2dj2TEpOW58R/ntR4d9jKSCxIz3f9prNfc7pVlPsA7vgRHTbG+PbB
         XLfx0eqQbsG9ISoiyqZvqEdmZ6Q3u0h0AUP7m5r+D+RFRHJIs4FzJ0VFIqknKEkBUMsB
         DO9SeRsnlUZgTTIcnpmzgtKV5KCJeVrOHYX3/Q4PavpDYeVhUlWf9P6mw9LFjim75Hp3
         jFShnrlHSRXP0EQ7jTH7Pktfb1SiM8KQE4g213r2iQXvAbEvGLIMXok9eJ9UM1uUvxst
         HAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615402; x=1785220202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oddz51t1pYs203ZbkRHzKFa0KfovRfAUEcnmjw58rV8=;
        b=bUtlmBRs1lgtkyUug9E7MKy75aEBJ1V7tgLHzeRaQEGaaPEkiWfobQ1a5tGBIvEXm8
         TSWRrVLdBBtvHxf+DxBI3p7A57nq6gZvR0psZDCoNoDGO76+CbnaQyKBfzYcBZU3+iU7
         M6gSYiFc1757yzubmOtMg3PFWWuUC4P43MvpM20g7fVFC5diw4Yr69txgNGTLtFZ3qva
         UYAv3PiwgY58EKx/8il3mYshFnbBgTUjL1XKO/LgcXieHpeFXYreOHKh7CfEroY6Cads
         rcWOSWMjuxXe5NeiQLDFTsbUrhYPxkkTugthKdR2s8BGH7ffA/6CjXJxrleV5/LqKfsX
         7ApQ==
X-Gm-Message-State: AOJu0YxlekvRokTo6PW6wxu1Oz7RHW08ftNU/vi0kc8VV+Fb8zMbhCxD
	1c/uD5Z5qId4YL14mk38YX6IMZ0xL8nPZbw5sUvRgHSw5NPnRcz0SvNK5+BpCfU0ZIDlHorTCTq
	Ss9//f+t39pb01AfGBffZtw9wCsh4xlcEHldj7A9+Xafm//7vkPQSX3GxaGuqUhk5JSK/
X-Gm-Gg: AR+sD12CXsbNhN/zsconyAnshzRkxnbUM52YescXuE18DdK7Dz+STiQBnXNdTy3l6mN
	2C4gUYzaZHbohNo6fgfsDgDXZfvSuBZ5M+Dd36+4KqL4c8kBbTl1g28Q2fPdsaFrJdTbZx17tRt
	MEU7FSH7BQh7BqlZ2DABSTUF6jNmun5x+yaK+ffqyVy9Ia7+pirRaZSNbpPkuV+Ayg/dGZzJ5Ez
	1C3YADR8u77Bl0HvQ0Qt9h/9DhlJ0oT8GGgXKHxmsNjJ8mB+1ppAzcYNWQkpdf3FeKeookxTcCH
	rp8gJrP6XG8J9g04/Fk9imoChcQogS1LKCSFN0dWQCwHqxxVL2IrPuIf4ROmu7XCQ8vmmyQV94g
	8XHHNe4LpwUhTJYdWRBCeSueCHPTXkg==
X-Received: by 2002:a17:902:e744:b0:2ca:bad4:33a2 with SMTP id d9443c01a7336-2cf348546cdmr202549425ad.11.1784615401532;
        Mon, 20 Jul 2026 23:30:01 -0700 (PDT)
X-Received: by 2002:a17:902:e744:b0:2ca:bad4:33a2 with SMTP id d9443c01a7336-2cf348546cdmr202549065ad.11.1784615401018;
        Mon, 20 Jul 2026 23:30:01 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a1201sm69376505ad.81.2026.07.20.23.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:30:00 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:59:03 +0530
Subject: [PATCH v5 6/9] arm64: dts: qcom: lemans: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-b4-qmi-tmd-v5-6-99620e07f505@oss.qualcomm.com>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
In-Reply-To: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615351; l=7881;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=cz7qH0fM/U0F9tsO23qklpcnKFFftVZvMQyY4O75Cu4=;
 b=zmGMMpy6VwOnDVnUQb3kWoVfvKaU8S9vxK++l6azzET5NXaFC9PJds+gdL/T9sKAehfycVynU
 L+pXz/hI+vjAq51MJHiRQPwDaLo+zOyNhTzODi1ixz8BhxBnCafH//b
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: AIVaPZbvn627xWNsyc7LFNfrE-h2Nwx_
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f11ea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cnwIH0_uZE9cE6M6O2wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX0DVFQ8XikZln
 IyL8tUXjzhuP4LOhfYx84eMgUAck04VVb1QCFU2TKBFpRwLVo0oLirY1RxdkCYPlSW7Iomg3G4X
 34O3lCwgGMQmz9zp41XrhojTW8+cQoU=
X-Proofpoint-GUID: AIVaPZbvn627xWNsyc7LFNfrE-h2Nwx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfXxDLPLcGChGVW
 WakFkM86hCjdmA0wnEDfTiB1/PM+2tEWES4K2qBlt77DgPXC0ARrtSzCenmHNhHG/9Xy2KPNIEt
 AQE07RYUw7gq6YepTrnk2oFkRh29jsO3TtbYAY0UtkiwdynkmLj7BZeJTF+TBiaLqlTW68abB9K
 VkEMWTQe06UQV74YsMNBhSt8WGaBIdOAAFB0ABz+NQpfviTOdi3hZdfghcsR/7Q44jKeYLEpRWj
 YteO5x7/6kf7rmvpUcUJxOOjocmILXJNkrr76jbtvuiX0dyXx0dpPcyFYRX3QlZlSyLAG7+sCoN
 UJt8TTjLJ8izPl2zl3KKyxcycXQVFZ/1XIapN8j/wUppdNyfaRUGch4D6px25OIsSIJ9csbYHuW
 b5I3tTL5UFCOg4tYk4eeJrmXrUdIFVs8T5vRsu3rOJbEtm8HhNSgBTdTyF8+jWB0ZG5YN5RSYaN
 etGwVdm9vfHNjcw19cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210065

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in lemans.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 125 +++++++++++++++++++++++++++++++----
 1 file changed, 113 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..2f7d4b1e4fdd 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/qcom,qmi-tmd.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -7773,6 +7774,8 @@ remoteproc_cdsp0: remoteproc@26300000 {
 			qcom,smem-states = <&smp2p_cdsp0_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -7912,6 +7915,8 @@ remoteproc_cdsp1: remoteproc@2a300000 {
 			qcom,smem-states = <&smp2p_cdsp1_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -8760,7 +8765,7 @@ nsp-0-0-0-thermal {
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
-				trip-point0 {
+				nsp_0_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8772,6 +8777,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
@@ -8780,7 +8793,7 @@ nsp-0-1-0-thermal {
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
-				trip-point0 {
+				nsp_0_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8792,6 +8805,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
@@ -8800,7 +8821,7 @@ nsp-0-2-0-thermal {
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
-				trip-point0 {
+				nsp_0_2_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8812,6 +8833,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-0-0-thermal {
@@ -8820,7 +8849,7 @@ nsp-1-0-0-thermal {
 			thermal-sensors = <&tsens2 8>;
 
 			trips {
-				trip-point0 {
+				nsp_1_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8832,6 +8861,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-1-0-thermal {
@@ -8840,7 +8877,7 @@ nsp-1-1-0-thermal {
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
-				trip-point0 {
+				nsp_1_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8852,6 +8889,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-2-0-thermal {
@@ -8860,7 +8905,7 @@ nsp-1-2-0-thermal {
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
-				trip-point0 {
+				nsp_1_2_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8872,6 +8917,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -9014,7 +9067,7 @@ nsp-0-0-1-thermal {
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
-				trip-point0 {
+				nsp_0_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9026,6 +9079,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
@@ -9034,7 +9095,7 @@ nsp-0-1-1-thermal {
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
-				trip-point0 {
+				nsp_0_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9046,6 +9107,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
@@ -9054,7 +9123,7 @@ nsp-0-2-1-thermal {
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
-				trip-point0 {
+				nsp_0_2_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9066,6 +9135,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-0-1-thermal {
@@ -9074,7 +9151,7 @@ nsp-1-0-1-thermal {
 			thermal-sensors = <&tsens3 8>;
 
 			trips {
-				trip-point0 {
+				nsp_1_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9086,6 +9163,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-1-1-thermal {
@@ -9094,7 +9179,7 @@ nsp-1-1-1-thermal {
 			thermal-sensors = <&tsens3 9>;
 
 			trips {
-				trip-point0 {
+				nsp_1_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9106,6 +9191,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-2-1-thermal {
@@ -9114,7 +9207,7 @@ nsp-1-2-1-thermal {
 			thermal-sensors = <&tsens3 10>;
 
 			trips {
-				trip-point0 {
+				nsp_1_2_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9126,6 +9219,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {

-- 
2.34.1

