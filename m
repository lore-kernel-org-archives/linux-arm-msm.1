Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03932EDD6B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162246; cv=none; b=WKtlIIOm9/L5X7RnhjAKrDyVMbKk2Ao8YxejCFHuFgBumugIGoPtO1zByTEfTvelcD5lRKH1/oj8gQAI4DqedlTXAysxoaRyeUc1UxQpJUl789wSx03zDjRY7rYc2PYi5kHh8/IiCKa7squd1jP7/yeHDfe5FLHqzx7W8PAZh0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162246; c=relaxed/simple;
	bh=8vbyF0r7KBo2gx9OMsxuen36V3/WCj3YTuhFogK4cCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Brg4+A48sKQeZO8Axas4dA82/Rv1CdRFdV7YQazzyZB8WKcRzuvMlZ58z1cu3dKgzoCHQuArskrnAfWyPBo8mQTf2zM/JI9K6Uowhij54DEPAS/pg00mAItMIBfoF0Bjy03DCQTEVWdgURMos4N4xFT/VyKes7pP+zGPaKVPtAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPdASP6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZUvsaDl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPdASP6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZUvsaDl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlWlM3895520
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUQPvYlGLcyWJN5orn7GeiG6xhnxWGyq1pRn2g22RaU=; b=SPdASP6NT6Si8Pt3
	g3I2VydKqD665QRpzKe0sn+Cl1BoDBaJU4I2oi8hRk4T8ypeRlv9qXdoaC5KnOBH
	TB1tZc76VxyfDiDGHRhLwWFfOZ96UpGj4w/zEEgaTjNhCpBlSL48sXSdQ0SNJ8wv
	8+yl6Qyf/Vtuz2ex5Nb8NUE1FmZEf/QHmGjh9ekPQx0Ru6cotaGK5h00SwXKH/wr
	mCKEqmBU+Gohil4aoqzfBG6FGIipgCV3sc82zF4jI+wR8MXypQggR6HSf1d0IzAf
	bAx9f38x/eMPZs0zVGZfzr3eKF/sjG6W00wC8EOPGcHK5CkHgGkmKahFN/jVift7
	a4hUXA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs309q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:24:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2caf4173b1cso54386295ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162242; x=1785767042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tUQPvYlGLcyWJN5orn7GeiG6xhnxWGyq1pRn2g22RaU=;
        b=BZUvsaDlq3KjmSWxQVboM6V7scBtfo6c+FZdZuU0okwgG0zCW3xYDiyKdAwCrMSio5
         xhxxyjb7VGuYYhY0qKvO6mNz8/s0glHPRi1tO9PLBKhNiBCX7isDIDcykeXZKKT/Fa/k
         fDvcErAEGAPKn1E1LPNR+ul3dmWhbODdReGFIbTlzE88MdP+fortop2pabKRff73+eSQ
         TEuHEhEGsBVsoRZA1JW6NizT0SUe+KGgoXEbsZn+HWgXsmuFrxXJ8g5zktjdPFr5Kjqz
         L+XSik3N7Tg/b2sWiQe5QFYf4nKYSAl4InaQ+Rlh+x6MOMB3nDx5KVTxZ4i1kz2Xx0rM
         /3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162242; x=1785767042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUQPvYlGLcyWJN5orn7GeiG6xhnxWGyq1pRn2g22RaU=;
        b=AAPhNLvIEtOznKzehiDYIhNIeIJvCpisPyXUQ79Dm4mRUVP+fWDnTKeEx4XAlG0dBY
         dKd0DfS7wmsOKHYkvPmQzgKdaoxgkdl7LdaR+pLNXIsyimNrhlNRxfXGKMJdBJF2zL/j
         p47pfr3VHlHknwNi3mZAnT9/bHof3WqFWHMrIMLRxUDmG2nFgieA2BWF5aAF5DqD6atR
         QC5dtwCwp94eUFLFF+aK0eyr8SicRIGVK7QPi31wFhsX+p2a/zKGwBKuMDJ3pACeQhm1
         k/XhpZ9YRyGBuUuPk+Rj5NV0KgR6LXnLQ8xFMAbCmVaPnG6iSwy+nxepffv1T10nQuE1
         +asA==
X-Gm-Message-State: AOJu0YwuefEkJTVS0SgHJLY1v8W+o0DdpqD5G4tt1xi+SLsVa2/ve6zQ
	jll9Nc4ankGC59+OJiWnls6Wq8JeRFIPb5/e5DuFkjiT49rDKX7Dukhz0hTUiWY7nTZFtPTHUME
	BqGP3mwC3enmJPu3wAbj+yYViP885E6jd53ucgXLpvXBYLi4THN88evRyOkBhV1+2zLcd
X-Gm-Gg: AR+sD11ou9zZ/w6DhvNOkI8VVBqJPwe8Sq+rUeoHtX+SmCY2/Z9Zz84tnfrfm2/815J
	3fIxWae7UocKbyahPh4AauaXTFzC/wxN8msufxUPbKkScZQpDVzR9s8dpCIS7cxdU+CEKO7MXq5
	JIn0gWacxV18aYW/FU+0u15CpVEZQa61wlY/ua4ZAhIu6UeM2q22oLgEvYU6a+EEQJm/DQrGSGQ
	gNQHLl4TPkXY6jWQ//ZWJ1LvyTjU1GdWERDBjXqlH+G5WZMA+GKf96D877Y7otPxeyq54DMYnbW
	/QEcr1Pb1x3ypXtZaGS+INnQ6SkjJ/49nWeHt058FW2Lo2ue88A7godsFkD85G0n3pNOtj8lxJL
	NDqoj6pGKoNCqGGmT7B/u8SIAv0JbFA==
X-Received: by 2002:a17:903:1acb:b0:2cc:77f3:a934 with SMTP id d9443c01a7336-2cfde89bea6mr74094225ad.46.1785162241720;
        Mon, 27 Jul 2026 07:24:01 -0700 (PDT)
X-Received: by 2002:a17:903:1acb:b0:2cc:77f3:a934 with SMTP id d9443c01a7336-2cfde89bea6mr74093995ad.46.1785162241287;
        Mon, 27 Jul 2026 07:24:01 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d7f5sm36608755ad.83.2026.07.27.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:24:00 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:52:25 +0530
Subject: [PATCH v6 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-b4-qmi-tmd-v6-8-973cd3a226af@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
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
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785162177; l=4945;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=8vbyF0r7KBo2gx9OMsxuen36V3/WCj3YTuhFogK4cCc=;
 b=FmZwKD8hmFpFZrioiPTaCE8/fxmpG19yUvJEvODGmNb0YYNoT2s6sqcAM+dxpYZIUZWLaUbb8
 XO6gxdw2gRJBi3XLlbJyD5s/VsleNrq4wwt9ANKeVjI1FDvu5vDkETS
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX5RAjQtgr0pBV
 W/H3+c+6Duzv0H7N0EQQ5/5Z0WtAyrEJROX2Zsvd7WC45fxA1cPfuA5+jJNnWW3pw9TMbTCfJR3
 gRYKfuZ1u6ltFJeLBhMVESryywTwM2sU6cVDU3FJmwNfSbjmrtVWQAn3YsKA+iFd9g3wSkTFiz/
 zL3WU3BPpIXNhKhqEwynftDSuAQiOoXxB5xqGc9AohPuQzTdPCmMO5MVGrRiCX/5HyyzEiQzxPI
 HjIHnbjnj849eZ50R8AJ9JFQp/qdxxh9kBEGZdnLs7tkKW9Mnf+HiP6QO/6akdt4O6uqkgFvLne
 Jn5h3tH6RxyQz0K9m8mPyBK7BroNau8ldOUTHG0RDClLgj/ik0CjZwmbpr+FVmbMaRqPBzp5BAR
 +E0GdhY7uqjiQj7R4QobnQvH0JDb+qqqR953K/epuyysic236cJna2FRc97TZfY7IaYkFVPSEzd
 X+cE3pE8Ih9YT2IqeFQ==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a676a02 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ND7YSEQ52W-Uskv0B9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: oHwkwP837LNwLw0XjxYCqvm6XtRZ45wr
X-Proofpoint-GUID: oHwkwP837LNwLw0XjxYCqvm6XtRZ45wr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX5t3ll1UP/7P3
 NnFif4avNnex5orIBWPIOtv/+8qkeGUedtJOo4ca83jp2FOaF8VkjTlqqMsBEyK2G4dFAgEXsq8
 yPaRmHRpCao27h0LvNfiu41yFyn9ug8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270136

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in monaco.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 115°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..3f388c000fbb 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/qcom,pas.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -7738,6 +7739,8 @@ remoteproc_cdsp: remoteproc@26300000 {
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -8170,39 +8173,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
+				nsp_0_0_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
+				nsp_0_1_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
+				nsp_0_2_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -8290,39 +8341,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
+				nsp_0_0_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
+				nsp_0_1_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
+				nsp_0_2_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {

-- 
2.34.1

