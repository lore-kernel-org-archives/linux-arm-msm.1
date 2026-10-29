Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281697;
	b=qkUWWBlKknr1lXsrre1ZH6A7Dwnw+NipgAhjsBx7DmAxB2XSGJUD8+VCMzODmIeYSJ2F
	 Zp8lFG3/ekiWvx0hbDEZtBbwlUkpaPr4Y55cogrJJMx/DtmbPqgxzwmv+ayI6KrI3BToN
	 5lF+Qh2w6Qu0Oyarzd8Bq7mbHfUEprrp5TZiVG2u3R3gQX1bEacEDrc8/isQ26zC5WXfK
	 ZsWMGVv0DC6dkOf6atBqeqh6xGaxEia4aoSFGHaR+rUKPX+jXycAcIW080KP/7UaqSlk3
	 GKh/dwryHTTrHDJ27PlPhVawrQSZdPHcfHweeEJ5GlxM45Ddc4gETSkG3+NLq05f5tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jXKeKzN/pilCFN2LzzyvMic+Mh8d2JGYFvLNRqQ7vuE=;
	b=XaGO3OyIJ9uyuaYlLG++ixNIdgSJhuShKiqUZGrsZ2ko89wkweAHo8TOcZkve7rwYKcG
	 z6RqxCFDBlLNdcOqen6v6mAZYmK/82bev5i8H575HMczbGL1aEuv1Xj1sCGUEjsKw+DpZ
	 hY2UKihDEoJjgj7beEhIlG7gk7U1UWAEodFfN+B2X2vqExXTYISHphH5gQ+M/jz5YNeIK
	 GWpadEkfxrIJbKpwSfyz8F1fXEsbo5qcl68yP9W6bOPeQzgZalhL6XhR2b6zmWsc/rkiB
	 Zmc5hEeR2Y6nMC78PFYzfHXy2lFfwavE/NMgNoH6kXmFWbTxHTpw/ALYkx2E1fsjuCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oycURl5b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Myx1cY+l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3B7606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C3B7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oycURl5b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Myx1cY+l
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdwcU3943681
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jXKeKzN/pilCFN2LzzyvMi
	c+Mh8d2JGYFvLNRqQ7vuE=; b=oycURl5bhy8vrp0LwYMC0VvX86k1KmXFh7ECNj
	zY/A9vR0b4wO9B7BT7jg0YrTb8FqSI7DMqANV6iWOeb8HUiX2MZ23pUNp+go42OV
	OgDVXlDJwtjpqf8J8urHa0ospM06cKz9V8CIohg/PWAJElSnf1it0D5XByhJSkKV
	HM3PdYTjfwfBu8oqRMsuwZXlmMGbYlWitseX7DLCYKLhgaKY6zOr3ObbazoX5Aph
	bULLaGbW2C2snLD20Vs1KtgElvXBBbi3bJfTnuD3LPIJXJ9i+ijDU2j3whDIZb4w
	dQwSIAszLhkmiZXsjvc1x5NCSTRs70bR9lZxDgrB0q2iwWfA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fgs9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:48:15 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-82322894f5aso1127687a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793281694; x=1793886494; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jXKeKzN/pilCFN2LzzyvMic+Mh8d2JGYFvLNRqQ7vuE=;
        b=Myx1cY+ligW5/p6Q133YHsCAvS/XsgC96yZqWnqVAB10E72B8J9xSNB3FCAH2QZeng
         BBK8th4zJFyt3iyn4G3fnEc/YozmmfQG0FMlCZMYaVU47bN4gA/Tpzyd4eR5LHo9KXlj
         HvXeM0q3nfVbbwNTYOFf74yATS7eEDnf9jm+2fmsYZoNAF0Fm4dUZpygxlo6Ck4QpvcA
         ufgG1V4B6cssqj8pL0EPl0CWAmWeoU1GrSR56KKIg/+86A4PQAH4MvrKAcuCsy4x0cx/
         hZ+en2p5O3Rlc99x+m8lCRpuOYozQ5jht4Fucaqt6BnbfO9NbvfyKJN1+5Tzbo9QF5Hq
         mr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281694; x=1793886494;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jXKeKzN/pilCFN2LzzyvMic+Mh8d2JGYFvLNRqQ7vuE=;
        b=R0qlR+9YIfYXC7WjfjSlei3cdrN8oMLT5+Qe5hn4nnK952CQHrThLU5+eJIh0JI4T2
         xwSqu4ZZf8ykUBA6r9ipWG9wyl/ki/SdGawQotJmDc5v5MhMaxqcg+KVypftWPeScC9E
         1IGK9LpAQ5+HDGKnyIOL4Biq7+ONSIfhiaACJWw5tfH1GzwRWDXBuEllAOiTkPMNyLoN
         +2o5hYAWChuVFZDOPEdQFkOgDRyqkd4zvlJ6ZlS7Khcgn/uY8ITwCANBz0BSe+0nVA/2
         Z/1gq67/bEaNDwv5EBEq/gF9W+hViGqZ4qCDfJFQ2Hex6WlfrxtVfC00UxkG8AqPZHll
         lpQw==
X-Gm-Message-State: AFq9FYKAIzhbiQrd4R5a/dSZeg28DQeOw6LTj2s2MBxuYLM+rAoE8rFs
	4sU4YJPZNFNqWTkDUX1F8nwibCIOBpV3LHkz3CIBMyNGY3AQReuB9dg3rkZFZJG8I1Ncusb1J/s
	vNmmRzzm/4/rSUJYVVa3tjiAkQmGIaDXdUO4TyWs9qywkIiY+vtPmtQQnx5BvXRxkMnu4OoacVd
	eo7iU=
X-Gm-Gg: AYBFou0Y5dEwtn6dQ85gVhnEwSqh7n2pOy0puBfb2PcE2XAMi44ReBlMIVcir9aDmai
	bdRWdB3CPy7NPiiQWDwrvNmEIDNaS3ddY2u5OmWEbXGMu6QqKqMJe/IxXjfGDyQ93pIjiVXulRR
	7P+YVqPlYpkAfn5ryekvIj99rXMzIuXR5o46oVTfIa1n+6qSpFBiK3wpOeESqj2PFVTYmK8tu4q
	H+0X1QgQbhjwwS7VEc0henpUO5uVFcql8VnbtAW6nPAu39iAAZxIcfFGOgORdciUjFP+GwEwmWv
	2pkueb8QNVyGekt1Hdfw6TV5VQyURgias6Q8llS9M5g+jQWIbCTgFLV0SYbeDerv/K+RLyhl8r5
	glZQvbmc6wjwjDoWldanKk/mQ0BsOciJI2NyLyB5BR8WF9r+09RzmfYwmTnLWGQKcpwHc5bziMA
	==
X-Received: by 2002:a05:6830:6512:b0:85b:895:a015 with SMTP id 46e09a7af769-85c1e2b69d3mr1597846a34.4.1793281694315;
        Thu, 29 Oct 2026 06:48:14 -0700 (PDT)
X-Received: by 2002:a05:6830:6512:b0:85b:895:a015 with SMTP id 46e09a7af769-85c1e2b69d3mr1597804a34.4.1793281693358;
        Thu, 29 Oct 2026 06:48:13 -0700 (PDT)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85bf6e90bddsm2953546a34.0.2026.10.29.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:48:12 -0700 (PDT)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 19:17:59 +0530
Subject: [PATCH v2] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
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
Message-Id: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI5O42oC/22OQY6DMAwAv4Jy3lTYCQntaf+x6sE4zhKplDahq
 FXF35fCdS+WxpLH81ZFcpKiTtVbZZlTSeN1BfyqFPd0/RWdwsoKa3R1C6hvgwVsNAXWUy95oIu
 2XEcPxhsfSa2HtywxPTfpz3nnLPfH6p72peqoiOZxGNJ0qiIQW8sGuaO2peCawMLBEvqjcxDAy
 tG4BtTH1acyjfm19c6wyfY0tP+lzaBBm855iSjMHX6PpRzuD7p8vh/Woc7LsvwBCkPAKgcBAAA
 =
X-Change-ID: 20260812-pm4125-adc-thermal-4c0f713737fa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281688; l=3831;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=1C5I55yGmjLN0Nas8rkFH/+6WHwMlufDhf5bwLLh0pw=;
 b=L6oVrRFstuUcc60XefG7J4e+UX5cMDtxnNg2zlVuZxrahrNxjtAs2IKgge4S35WsEMHvNPs4M
 apONQqoDwArA/0ps7H9vKzmy6M1jSK9KyjBY284qKcReZHeyUN0n0Pb
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfXxYpuy4qrDvbV
 Ull1aT4TPEO5Saqsz4Bon1t0buTTIymFj9tq4/wXhwycUI0iZrvnyaMVJq/J5gl+4kLtarmQzXT
 ObY6uQcTiTeOVqnLXjBonyBTc45bBPSAQOtgA2TlyRE5yNwR5ILxMiSfmgGK6ez/KvcCNBnFIol
 62ehgZ7E8yD06g0EghRpotUNKgwDLAv6kw6bVQVne5sOVThHDLe98HCUeMJUio6iXM6CRrx6KZ4
 jyMoGFZLzIQHWrVnraVIyytN0vx+hMUaA3LeVbeY+UrQsw6QFuWbtGk6NL45L57WlOnWmV66/tM
 weIAObZYPtcnyBtB6Io/eBH7I/s+OaPB29kgYql5GRTuw9L3U5jf3i7VvJ2mVnCd3QjV3KvNCqG
 zXICzRjFyzwUwGqYXKwpv/5y+IsipeteV1eEU0x6Gg6+XuASuJhoBPBROMoLjoPX+1F7xyFEDCD
 Tw71xmFgfmX2RMJJxjg==
X-Proofpoint-GUID: nZTMh5s4YIY--BzZtp1NAJbWfac1qDaY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX2qYoNpZ+Xu+X
 i6Os9g7lmeGbV7fEVQf8hbvpQlZEXGZ4pApuujgBFtg0l7xH3ceRYOa3u9ZTNozPuEF2cYa+uWf
 Z3LfGg5d172u3vL/7udHs8DuqnLbEz4=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae34e9f cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s2S2f7peMjUm9DWXigYA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: nZTMh5s4YIY--BzZtp1NAJbWfac1qDaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290053

Add ADC channels for msm, quiet and xo thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
---
Changes in v2:
- Moved XO channel into pmic DTSI file. 
- Gave meaningful name to thermal zones.
- Updated the prerequisite/dependency.
- Link to v1: https://lore.kernel.org/r/20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi     |  8 +++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 83 ++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 77de9db8c119..bcf777e465b8 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -156,6 +156,14 @@ channel@4b {
 				qcom,pre-scaling = <1 1>;
 			};
 
+			channel@4c {
+				reg = <ADC5_XO_THERM_100K_PU>;
+				label = "xo_therm";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				label = "vph_pwr";
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index bf6fb12ad990..17bc2b984c75 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include "agatti.dtsi"
 #include "pm4125.dtsi"
 
@@ -33,6 +34,68 @@ clk40m: can-clk {
 		};
 	};
 
+	msm_therm_bridge: msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	quiet_therm_bridge: quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	xo_therm_bridge: xo-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_XO_THERM_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		msm-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&msm_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		quiet-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&quiet_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		xo-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&xo_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
@@ -333,6 +396,26 @@ vreg_l7p: ldo7 {
 	};
 };
 
+&pm4125_adc {
+	status = "okay";
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20260812-pm4125-adc-thermal-4c0f713737fa

Best regards,
-- 
Raj Aryan <raj.aryan@oss.qualcomm.com>

