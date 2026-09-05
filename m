Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A59123ED5E
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 03:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577519; cv=none; b=bPh+tplDKJk9U8ng6hqYoO/TQGLlifDmEPtQRgIxXNnZ6HdNtCI2Q/ksFpPiCFEDC06xlZ+XIpnXo7X+sNSycMgC/g3nzmgZtSVE0Yjvf3AK11n1XHZKbU4ys6bpOeJm05luSx7mn8H/7DPOJXitz3stZrtjWlTZ3NpHF6Wvp3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577519; c=relaxed/simple;
	bh=ZQjZc3Yd164FWq+0cEPQKZOy5r8cNmCVGbnqycTRXTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8+/m6YBTrnhLkJS1B2y/tJ00tmOIYpPAdL7PGJE9fmlOAq+JEH0ElNc4KNt+dH3NGZKhD7VDz2v15dQSRN9NZ4oBhibX2d69CHJnr317zI8Xv15W98CtAiq1Yj/1L+3fu5V9Xfac0AXs8+MGIyX0aS5aKQVx2Z8th3Pp+embSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2XIU9z5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hONcTU+O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2XIU9z5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hONcTU+O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850vx65335185
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 03:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2n2mSqfowG3zmso1S+E6rBbPtS8gm6QH7ICshAC+zHE=; b=c2XIU9z5kNA4Iqa2
	ucv5eq4MvdvVOq1LatLKmSIGjVbqlw9hpMJJbYCM3oFkIYMyHvP/HfBO+jzPl8BT
	LYMItdwdWskOS/hn8/vR7rJUirxCrm5s3vH8rhGPAsEWTB54o7IKfJl6jEr/T36j
	4p8a0L5Fl/j2aPx/ryuOescNDKtvOmdQqtFLqMw4gG7Y8cT14sCQ0Mz5dq+djfe+
	RQbeoGe0xGBVyuJhR5StaELN97yQ1P+483JqFYRJJGfJWKEKYhCAEJ9IIT0NycvY
	LoeyWvBlQ216b234RnwMaCLr8YMLIVpwtByInTapZ07zPWyFhsuOjxUUnJvf/svZ
	+GS7iQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fn992-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 03:05:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1978305a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 20:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788577515; x=1789182315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2n2mSqfowG3zmso1S+E6rBbPtS8gm6QH7ICshAC+zHE=;
        b=hONcTU+OETEz93+t8giRXUFKsvoU2P16D5ajSyMkVsh0uJ+2+O3BDICMPqUcIQciuH
         fERv24Sj7SYVqoSevvXgavhGivOSOMAWP6Wy2JMADWROWQ7efLO+fX/M3L8VueJlgIK0
         glamQ+GymDNPU3dw6qlc56xWTVRwRa/MFqcQuedLY2rrWP84TmygKfokRgojJZED6GZY
         VrEVjTSydiooVxKxX8kt/dqXBRHNPW0OM/oJipVanemUIZU+h2pHHcfJ3u+xlz4IZLCr
         wTbGXByl4NM9hSl+V6KzAdfvoJqso+gvN70KQ1wkfuOf3YtfZermZOlbh5bqhoEwkax7
         wbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577515; x=1789182315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2n2mSqfowG3zmso1S+E6rBbPtS8gm6QH7ICshAC+zHE=;
        b=aHGstATpzBQPai6nszE+gbcZBGY/vJTefEi21tRT+UrdB4knN2sU2h+0G9PIMAnZ7P
         ls3itk/12Nk/6qFPr7fwrGlgOdshwYzfNLmFH3zVROoI1Z54YaawGdBhcz31N2axsuz6
         izbkfsPmTaVp4NhO7dVjg/6tJl3xYW20WwxZypCFyxSD/bVCwlgXoHT+9FNMpzHjyYSx
         IoHKvuCcunpTX+lZZBdRRk+bZPlrIDm9OOcBlY3zN/eoRwT+f+bdjahtpzDQSMcJTlgv
         UnHc1/u0vBdMtJ5nuIDF9s/sLMiRcXwYb2KtNfWo2XZJumSO0ly4uPqhrVIVzJ+fnade
         UQaw==
X-Gm-Message-State: AFuF++lmjgXsJV+aIW3Pi23dNWCA3NSj7sNq5nTwI9hc2RXzYYKWybBT
	+6MjeoxHKIwyk5grSuM1kb/NyQpBb4MNADzLH5oonCKQdSn4JKPXIOkZguQ2zOYnzEkicBGiZlT
	NoHcdWl61QmSuQoQmpaDVS95C/QyB1XGzXKhHjaLFHbyzZLR/KslxLrkLzMgl/czSzFyT
X-Gm-Gg: AYBFou0XAoOKtN/ePxj0a80xpFYTnL77f3djwcscQqs6za0CLlOhUoBDOAOBwUBeOgt
	TtOl40vjT97JgsxFThW/U/xR+xpB/QR0uCZ1xA0refYd+eVgCVJAr/VIcPWX6a0pbOjj5eVqZ4+
	x+bjB+wc2RpRtRRYTtfjJQzGuNGM1PjYLQ0BOfREyP8bi2VJFqEkhSxHwbQZDLZqkIs1rBVqW28
	MRrm3kNTgCmNwbQ0Jcgm/3Gx8Jqi6eYpAFAjd4gEN/S9O1C7CfY1RmDQiJqbMBIynJdEJGGhfTc
	lr6JyN1MLehisF6alHAIrFSMTyQcOWoTWxquKZrmzGjUOaKDOdg6PPZ2lSAcPs0mR7KbWDXyIV2
	B/QMFuV9p/JgPkCUJUN1mvcqi78s3NYiwYbdvtTs5IA==
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr16261167a91.9.1788577515496;
        Fri, 04 Sep 2026 20:05:15 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr16261098a91.9.1788577515015;
        Fri, 04 Sep 2026 20:05:15 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm10066268eec.14.2026.09.04.20.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:05:14 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 03:05:04 +0000
Subject: [PATCH v2 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-hamoa-sys-therm-v2-2-1cb8c958c981@oss.qualcomm.com>
References: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
In-Reply-To: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788577511; l=4158;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=ZQjZc3Yd164FWq+0cEPQKZOy5r8cNmCVGbnqycTRXTs=;
 b=0Ws+GFNPVWFvp8ROn/+I3wGWcMg1QbQT88Au8xSDssE3TTsUFBdAG/EtW7CS3p0dCQV50EbG6
 MabwBTtl5zDBgf9reURoDFlxfXoPPpUUVK3D2rYIppRFtDMtE+BJZVe
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9b86ec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=o4ELTRGHPdU54oqkCq0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: EeSRlfvWu8uwoN_x-A5cwkconFHOFBnr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfXzj9xoKoNfhjW
 JqbYl1pz/GbBF9NmXMT/EkEgW9WAQzgILlyEQknPw/P6Fql13e9qHDFYe/E+NdF0t/96g5HOZt7
 ZI/is2iPKQCrrEqmtGms7tReS5WtqE0=
X-Proofpoint-GUID: EeSRlfvWu8uwoN_x-A5cwkconFHOFBnr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfX2c+htNgSLdmc
 YvvQBUvpi+L9CzrEKLRote6yjXO6ZVewpW7gBKBBDIXf2KYZtONrv/tziNydy87CAC4oRPfh8EW
 aimHMUiAWDmm8EX8YvlcR5xDCn1ZATfAH/P/xDC5L/96cHln4hWPQtx4c5yTpInSSjSgTl6n0Xh
 HnMgEL8V4PBlHdUjMBzbfQIu2xVZ3f5XfBoYMC3aB4mMsg6Yb1rapf84pr3PFsUDOjzqf5pZXud
 UxZoUCqYDx4glJ5gg2hPyhgFQF8DoJLSDghJVm5KEdn+Ha9Fxwkwq+7lYd9uykGOSsRXsSdASsx
 dTv5gZQoHWZlxooje79BnZUxjcQROPwPCcnasGltGgtro1hEZiLQgjcXjmWHBjaHCovg1z5XaHw
 rxzFNdu8WXnAq3guEDJWN9v8qLf9ecIO4hhW4mZYJELTO2vUXbV4BqOWxsh0ve2tZpSKJ0Nbbkl
 ZKrwd/pcZgU9TE/BS+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050028

The "limits" hardware performs rapid thermal management of the CPU
cores, but during prolonged CPU usage the system's overall temperature
need to be further managed by software.

The reference design provides seven "system thermistors", connected to
the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
thermistor", which is wired up to sys_therm1.

Use this to throttle the CPUs, in the same way that we're throttling
previous generation laptops based on "skin-temp". The trips are chosen
from those existing examples, but are comparable with the ACPI thermal
policy.

While not used for cooling/throttling, also add the other thermal zones
for temperature reporting purposes.

Enable thermal-monitor mode for all 7 channels in the ADC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 119 ++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 429deffcf3e9..29150fe91250 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -11,6 +11,95 @@
 / {
 	model = "Qualcomm Technologies, Inc. X1E80100 CRD";
 	compatible = "qcom,x1e80100-crd", "qcom,x1e80100";
+
+	thermal-zones {
+		soc-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		keyboard-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <1000>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				keyboard_alert0: trip-point0 {
+					temperature = <53000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				keyboard-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&keyboard_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		backcover-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <400>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				backcover_alert0: trip-point0 {
+					temperature = <64000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				backcover-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&backcover_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		smb-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		};
+
+		sdx-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
+		east-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		west-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+	};
 };
 
 &gpu_zap_shader {
@@ -20,3 +109,33 @@ &gpu_zap_shader {
 &iris {
 	status = "okay";
 };
+
+&pmk8550_vadc {
+	channel@144 {
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		qcom,adc-tm;
+	};
+
+	channel@14a {
+		qcom,adc-tm;
+	};
+
+	channel@14b {
+		qcom,adc-tm;
+	};
+};

-- 
2.55.0

