Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792759177;
	b=Z6+LzzidJGd8PKIe2Jn4tfpSMRLmJSiPZOWV9TrkljD6OhcxqBMVNCskl1XQw0ntUUkK
	 miuHbbga13AseQJnachp/X4DFc+2dcy3y7GODvchPHUq2XJXKTHIpQ+f6eaQBWcKio4SI
	 4vxGe+1Q6i+geabUgC3S3/CahvJLLXcYDPfeyxcBNGlmwwFUD5UEn1F2B9l1J7AYrABXE
	 /aM9Pe9X7t/RnRQJlQTq0tRqREANfziwvQjSyRrmebuVy9RM/DBE5qAQIkP6g9Ck2FgRf
	 AON+l3QNn5oDZ2+Wpl0iM2oKHMmXAfRKX20YIM7MlDsycqbtoVG2tNK37N+9tl9e1iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0kupNfIcP4=;
	b=AGDhsLCIwazJFfoF4Fl2+wSSVyD2aK+nDf9sb6EIjT/k5fA1BhsUZK2xfIcX1Flol0P/
	 TUTXRizAeZEX96hWWXaefzkmGPfTZYnd0E+G6ubJnoZ8c9Z78HSYtlfqdKB63d7UBHD+R
	 OS1hgLyOo3fVMt6ygPPWA/5cWiFei5feiJbJlQtuV8+3O0p9lQw+6J3xFh3/QGhJIVHR8
	 UgkMTbgfJjryWLzRNrXY7q0SYYIxkTSILLcZln9Y+cmEWbdwhl3i4Bs/yPyDJBTQ6/6AX
	 gGISrpU2fMHSad0KFeVBEhmAykqhqug1eCSm+gd0qgCgKVg7PIlT3E7pUjjXzhLDI+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDjc0So0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSr8HrdR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9444D606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9444D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDjc0So0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSr8HrdR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NCAbMN3822360
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0k
	upNfIcP4=; b=NDjc0So0HCHmLJaYIPm1SoH/WFgNf/QUmcVPxY3UTo0VvaKig0x
	ga2w1tqw+0Ei6O7Qx5PYy2dc08fO355CWRRDauyXzE4Esfg3cKGK9IsGcEELINBz
	Nikoobc8DUVGmW45UVA4UeAoI7/QjgwXZ2pdZNz1/jvgFz0kXvqMG+FzxLhP+d77
	qeJXYXmIVqqmOTOYA33EselHlLrW11UbJTkPgDu3op07dWGm+9qXhTAMJLf0co8v
	YyfYUCIo1StPihX2Esfyb81sAhyBuJEGaZvuV+absc/3+PJrKUOXLi3QVI9VeFx6
	Bbm0b0/wzcU9Y7yTtF4rSV2rOul3DWnlPxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw036j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:39:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so169999885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792759175; x=1793363975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0kupNfIcP4=;
        b=hSr8HrdRvdsR2dvF7o0nC9OaYMO8dFDX4KSppKxZYjYXuRS0EA0J28HjINs6zGwiIA
         WGbDUIB22gIFrnfjj9H1ydAAksw4FivDvQmNSjkFdDgRw3J+4kpGRRGq5Tut4HnfBlmZ
         2QOqzH4tP7XnK79yLH3yhPpBY/QKQNBJayE7XT7YFwYmXqCryOmEDJcriEV0zBN9DWoY
         WFb8vehCPXiUWmAuXUdAYFIX9h5Q4tEr7yLRl1Y+JQJ1b7LAhKnDLAKm+ImqcQkudVYH
         cI1rL9Sps+lgUgBicB4CwA0A7jtmTZ2ukTz0n2lyMjkfIwMVIBZtW5/+97jzr0CkFicu
         nsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759175; x=1793363975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0kupNfIcP4=;
        b=mNZBkAPAaRS0OWdcviD+e6THj+pVqfZxWyng/N8KlFy+ffkRifGmm4J3wgnUghX878
         obF+uEYsdgA9RAprMwo0KS5NFmCozOIyPtdWDJgFmmXL6tSXp5/pn9fWU2oKfni23EYo
         A4dNRMpmTgVd9zHA4jtoLpC/MX37tQFbpXuzs92qMa5imxD/eWrhYYPP1weT++IbOLTg
         Q36ykul9M8LQvWIV478/oFx/Es2vKE7qkV4zhRqwS56QBTAzt6OJPbPabY4qJvbdA6J/
         LIwKsb6IOgoNtLloqmRIZ3/whfEA4fmeEnTSIfh3ed7GsNt7CP7fIMlw8w17J7jNZB5P
         4Cig==
X-Forwarded-Encrypted: i=1; AKwUvBy3w/Sbgez+wLYl6wjhx2f29j7gqfIk/H6zBuN5rp3IB2X6wWkSSbmf3t7Cz4Izwj8r/rGggVC3HWAyZrIT@vger.kernel.org
X-Gm-Message-State: AFq9FYL/eH9XW7q2UHntWDoSTmjHlAGmmUSMrOqruqYNBiTM57DCRXKf
	V4Z+uoSIpQDHtBpBj3zdd85TVHJGtm3mQG392rXY2La7yyhb8ep5Dlsbp+2pKUuapANxUOfZ283
	pW8dZH4NMa4+yy4j31RATp8jhW/OT7FkFJ9991Tz52R/7Jn8xotCHnpMYeq3Omo9bWSpx
X-Gm-Gg: AYBFou34auwc1QCbj2OtabOcnGm5Pc0a5PrZmtV5vspHrdN0gHzLC6vTgN3+6vJgYme
	a/HBFDYpFjKOdtMmYu/GeJBqI/izq8jpO6q19st0WBqN3RztKGfWkUiTabn3IsKH4j7fB9PLeyS
	9+Vb7sLDCe0mmlluMZBfE/EBLuDj/1bvwGGNAN+B3qt8bqH3BZDO+eNzgF8I3tP0Gvj9moWxewt
	v1NVHMukM0nA2FEet5VEb3JeeaGNnbMddaFedjHc5BH5rdj0d51gQTidW5wgyK+pL1eZk6JPus/
	26Rxowaj+/s9pAQHsLuwIxG0DB/gcC2heEWuFOliD0btuETGkuy5MWGkqrJ0KL+E4osRYe2bCQM
	AQxwqH1/3d3uHHQNMy/1K7CUlDZmDAov9Ew==
X-Received: by 2002:a05:620a:1786:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f627549fcmr851063685a.24.1792759174369;
        Fri, 23 Oct 2026 05:39:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f627549fcmr851057385a.24.1792759173411;
        Fri, 23 Oct 2026 05:39:33 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b74b:faa1:2e99:5c8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3805761fsm4935816f8f.47.2026.10.23.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:39:32 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        stephan.gerhold@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
Date: Fri, 23 Oct 2026 14:39:14 +0200
Message-ID: <20261023123914.8641-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _Hq22qm8jYgf-peoVzE4W7cApTYwZ2vC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfX3vfYVAOM5xZz
 vfaOT2C9gOXZFJ9IcfqkrOoBH2OaJMdj/32+/Kb8PYEQT+t65XPq6TNsmUZXvR4/Bt0dWYlTlbo
 EoZpTu/d8M6qvDMlCQS5dR4rwB8YJiw=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb5587 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=W5eknlhPjGTqicOx0vkA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _Hq22qm8jYgf-peoVzE4W7cApTYwZ2vC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfX+g+kmRk/QmtU
 HBwq98k0sGfWsKS3DOh66/Zu2yBzT0BwjjwN4gkaa3wDqDVx/gbvJSCcE+NK6EALzsIA+eSUIqe
 p2MIp+0UUzSLX/dY+7jAY1gM1rxCp/NRH63rOW+8qEvrXr6pKBd67Po7rqdNINkgh6tK2C8o8Yi
 CAgp8hvIiSBNv9KKGKAhb6TTTbMjN7zGtSxvHvq/HegunkLgyLypdhY0/DUJ4ESIXfOo4Zrerip
 iMDcmogpJbj6ObkQbK45M67c+zJ/6yLRZYU32chf6D05ifPVS4YaQll/mk/jdU9q630NyCzfLOu
 msJ5Uu/hFUW4Ph6stK9ERLYcyYmWkwrvy5b0UUKNl8uWNcMGjaqjD3gr6WP37ZNwPimmwlOOl5Z
 RT8l/naohWXuQ9R3naRQPZTkXNpn1YanTwsWeohiYemUU+4+Ara6OLfSratLNp2M+fYphyBMwKT
 p/EbGxDZ3qL39c8wYjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230049

The ThinkPad T14s needs thermal mitigation under sustained workloads to
limit temperature rise before thermal shutdown. EC interrupt-driven thermal
monitoring is not yet supported, so use the board temperature sensors
exposed through the PMK8550 VADC to provide mitigation now.

Describe the sensors near DRAM, the fan/heatpipe, the GPU and CPU PMICs,
the charger, the WWAN area and the USB-C ports. The DRAM-area sensor faces
the keyboard, while the fan/heatpipe-area sensor faces the back cover.
These are internal board measurements rather than direct measurements of
the user-contact surfaces.

Use the heatpipe-area sensor for passive mitigation at 57.85 degrees
Celsius, derived from observed platform behaviour with the Windows
balanced power profile. Map the passive trip to all CPUs and the GPU,
with 1 degree Celsius hysteresis and a 500 ms passive polling interval.
Name the trip "backcover-ec-alert" so that the planned EC support can
locate and adjust it.

An earlier approach using staged CPU-cluster throttling did not show a
significant improvement and introduced a latency imbalance between CPU
clusters. Keep a single passive trip to provide timely mitigation.

Add 73 degree Celsius critical shutdown trips for the DRAM-area and
heatpipe-area sensors. Retain these baseline thresholds pending
sensor-specific hardware validation. The reported Windows DRAM threshold
of 115 degrees Celsius has not been established to apply to these VADC
measurements and does not justify changing the shutdown thresholds.

Thermal camera measurements indicate that the readings primarily reflect
internal temperatures rather than chassis surface temperatures. No unsafe
external surface temperature was observed during those tests, but they do
not establish qualified critical limits for the internal sensors.

Expose the remaining sensors as monitoring-only zones and enable ADC
threshold monitoring on the corresponding PMK8550 VADC channels.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 75ad74bcb042..6909458c0996 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -502,6 +502,88 @@ platform {
 			};
 		};
 	};
+
+	thermal-zones {
+		/* Sensor in the charger area. */
+		charger-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		};
+
+		/* Sensor near the CPU PMICs. */
+		cpu-pmic-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		/* Sensor near DRAM, facing the keyboard. */
+		dram-thermal {
+			critical-action = "shutdown";
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				dram-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		/* Sensor near the GPU PMICs. */
+		gpu-pmic-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		/* Sensor near the fan/heatpipe, facing the back cover. */
+		heatpipe-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <500>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				backcover_ec_alert: backcover-ec-alert {
+					temperature = <57850>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				heatpipe-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&backcover_ec_alert>;
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
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		/* Sensor near the USB-C ports. */
+		typec-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+
+		/* Sensor in the WWAN area. */
+		wwan-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+	};
 };
 
 &apps_rsc {
@@ -1285,6 +1367,36 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
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
+
 &qupv3_0 {
 	status = "okay";
 };
-- 
2.53.0

