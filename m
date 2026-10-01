Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F33382E5
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878265; cv=none; b=En8mm+onXKOb0ONkTU99rLIuhJR4XKtZTVRthm0D0nnux4cc3nLckhSABx3XjogmY8F+rapAGUZDup9G6DpXPTN40dJJd/HGv/NNgW8wm+8k82RDX4+Hx9lKHfpRhBBtvb1SeFGLw3mck3VZ95ZfkK9+EtDUQUGhOtYfqpTZUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878265; c=relaxed/simple;
	bh=hkNmOuZzb13leDsaWOy4t6aUZY65s6W0QPUaxHNPTnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EdiXN76FyLMCt/AsFnT+e1vbiCg0QjlvVR+xVvrGshbkZCTLTAg1BekaQOweyrCGOq8E27HhghI+kKJhfeUKJvFlUKi2xA6WohA4m3A1EXTlUCCQfmZwlgpqVtpM5p5LuAOWWhCkqP0dAYVnHWFCsPSOe/Dz+ASBtGQEic5YBGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk7kqZKF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYdjrnkN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk7kqZKF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYdjrnkN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Fsawg2475377
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 18:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uhlpT6ARTg4Rsq8DjNmYNu
	AhQGWMOdkdMkXTMpfJzPs=; b=lk7kqZKFM/p9vIvMM37bSV+X8lwvx5PT1FWqDZ
	Wf0+NS6YranP1FtLP4LRiSlmRJvN78tTKOz9R+Z0QKXOGbZe4gURUiDsv4IK6B41
	2BdY6ttvdwZGFrjiWmmReqN9EsRVZ5g/v/xmMUc3fJhK6Lj/21oYKZxywotI8d4y
	yfCZ7GPMlgeWIcFoCA+QNRjrWZ25GUK77UCRkxRafYvVb0ND+4rFkjuSYRL0IkBn
	oHnBG0Qwn5Vbwaz6SFDrH2SApR/Zo2MeiiJEBKsO2+gBaZU6syt/VORKxUs3Z1Rz
	70DuFhQoE9bDaonpsEJAbdIIBuCa5GnXhP3yptFP1k1ADHGQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbg8qp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 18:11:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf67e46ae0so354719137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 11:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790878259; x=1791483059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhlpT6ARTg4Rsq8DjNmYNuAhQGWMOdkdMkXTMpfJzPs=;
        b=RYdjrnkNZYjvbQqdqQDBYvepcnTdkxTCA8k0qX3NvTCgfMrP8qoeWHHpSpRVnlkL5/
         5ZelbmEZ6RCR5p4dMTRYmlUeSWhwHSylKsbEije2ctteXYS8M9QeWVth7KQwygoWtMAm
         DPbH4F+44zfzBFSI0VjeoZFsDYrE0fCB5rOl7JIOmKKzffGaZ8ObMYfY3YtVkAm1Lgva
         LJBW5drXvkCYLIaLZBtcK0AaNtpTbnIqB7l+2REE9HqJrsr6WSzQWisTFtf9mpizdqvT
         iuXLw04zb8bcIimdK3RR8BirXMZFzhYMil1ASqbBrPj8M7OSI9vNHN3e7p8Bwikfi239
         VfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878259; x=1791483059;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uhlpT6ARTg4Rsq8DjNmYNuAhQGWMOdkdMkXTMpfJzPs=;
        b=a7ENNTAujQsfp/mMIC6QFTbVpW+h9HCDVRbBjQj/1V+dtRaBHZmhoSbXs+FXSD4tEu
         LsZDuHopgSl7KhiiBVpbD+0W0nj9mKF+FPWVWwgycskHLPO5g0m9ZP10NT0E0FFGYln+
         gAnvrJaf/mE4uGQXg/7W1SPAozh6l+P6l5XpbUCo74DthcyStiDtMA3Vp8cg0Wnj+ReM
         fFL3Fm93mctSxJMwLgQM/YlyYgcfwUMHDkKbjJLV1uz2N6yJuJsiMkjhdNjz/5iRTFkp
         nryEu9HAt4nxqGLWfCu3Osh7qNiaDELD60A5zC1mbQ6dDy3RaQFiJgdZWtttNFBYu2xm
         JLkg==
X-Forwarded-Encrypted: i=1; AKwUvBxNpJD/g0dBt+LoW2jhT2TNONcli47AnshAwUW1AqrRc5osaNDYpY42+kTAy2VS/qlGxsxc96bDf+Q04RaG@vger.kernel.org
X-Gm-Message-State: AFq9FYLw6yCw98WYmi7yIz9vjIkYlYin32nLiO213z5Aqq+a2qcSR9Ft
	tuPzdh3o4qPk/fZhr1C0pvnY+fFOjDhCb5Und2E4xGrzmOpxQxr3J+NIr9g5ibQlE0Jc58f6RcY
	Ma7z58Le4O2haddifrePgHHmj+zeT1fjFL/Bz2FLrzgXkc9YjcCGrimHbjEEegSbFlhrv
X-Gm-Gg: AYBFou0SyAq2rqhM/FrfqZmPH8oflu5ulB7LGZCalOexzOYGjUWmyDpCR7TK8HLBpUl
	iXH3lnY+JEjdx93U/Ap2NKMlnHOQv8W56JrVoVQmqwEVQ5FN2m/OxmngWWOiMWV+4n7wcrnsIZF
	aYj9ZPkMd4gdwuGnnZxaczXl6O+56+IP7tg2PDHuz+unhHF47Xp3qjHk5u35UJATIfIp/jCrwdm
	SisZOHUvLJOBTcwiIEiiT+r42rOiAFRBaJTN/QobHO7d1ia3Kcm9PJxokfrp1gXhDFFBmQ7fDXO
	vmmtqtUkSTx9F7QDyKVH2UTeIr/jcppR97kHoewp0LvLoW4JB3cvhSxr2my36GJ1/z2oq4hN30T
	WAge6h11J1jbwnf5aGRD3lReVbqMlWuTWqw==
X-Received: by 2002:a05:6102:290d:b0:7bd:619c:4a8c with SMTP id ada2fe7eead31-7c0f54a550emr50892137.19.1790878259329;
        Thu, 01 Oct 2026 11:10:59 -0700 (PDT)
X-Received: by 2002:a05:6102:290d:b0:7bd:619c:4a8c with SMTP id ada2fe7eead31-7c0f54a550emr50872137.19.1790878258766;
        Thu, 01 Oct 2026 11:10:58 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:f181:ebcf:f9bc:fbcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4cfsm3208445e9.1.2026.10.01.11.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:10:58 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
        stephan.gerhold@linaro.org
Subject: [PATCH v2] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
Date: Thu,  1 Oct 2026 20:10:55 +0200
Message-ID: <20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA3MiBTYWx0ZWRfXz5BjG2CLohCh
 14wF6eYNKQuijxgjPr28yqh/l7pQJxk0Pj1XyrDf92NbcSWn4EXVcqlCgyqiYV3XHf9z5hauJFY
 TwbuIkTck5d0xtUzGZxLRslLhBuw1u8=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abea234 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=GDTQnYEY10f_UI-1qQQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA3MiBTYWx0ZWRfXw/lx7R1JbGkq
 F1xgiNkf6+vYbZ16PA4jGZKtDIt8138pEqWeGgO3shLUo85EPcxD2XXRQ23T9bHCTx4E+v0uUFb
 TZC4iD8mKhlnOnUzgekXf9h+nr+sgAj2L8QavSdFEol7jetomPGhnwGFr3lTkh2hC58iJwetFeW
 FfKuwhqhYKbiPPiMEYFuK8kNbaNAQtdm9+ZWO9wqaPmmK4o55SIY3vJRM/bnvtjt7zU0BpmfcN6
 XryxBOQ7Fx8uKPMzhVbfNfZ5ZgPnKkg3vAiHCqTjCiagVLascleEClX+wHK87Rm3Z8kHnqH5Edn
 4O7wApzj3JJmZxpwLsn3OAJcFJP4B3tRrlVuDMQH8sD55u82JgKo/XIRzl7b/4b2AKxZYzGLnnS
 coJyBn8P4JPfw4kkFcQO9tfK1lWqL/oDBTdD43QxuRc4s0Z8ey/WVDjXKKDHLfM0cnEiW+E9Gxy
 V8DQJAmu9HK7OiaOEDw==
X-Proofpoint-ORIG-GUID: jm-6GeeyRJPy7tWfj4Qou2mXgENBbYgc
X-Proofpoint-GUID: jm-6GeeyRJPy7tWfj4Qou2mXgENBbYgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010072

Add thermal zones for the ThinkPad T14s and describe the board
temperature sensors exposed through the PMK8550 VADC.

Add a passive thermal zone for the keyboard area, which is the main
thermal constraint under sustained load. The EC reports a thermal alert
at 57.85°C, so use this value as the passive trip point and allow the
thermal framework to throttle all CPUs and the GPU when the threshold is
reached. Use a 1000 m°C hysteresis and a 500 ms passive polling interval.

An earlier approach used staged CPU cluster throttling in an attempt to
start thermal mitigation before reaching the target temperature. Testing
did not show a significant improvement compared to throttling all CPUs at
the EC thermal alert threshold. It also introduced a latency imbalance
between the different CPU clusters, which could negatively affect
workloads depending on where tasks are scheduled.

A more optimal solution would require a significantly more complex,
system-wide approach, accounting for the workload distribution and the
available power and thermal headroom across the CPU clusters and other
devices. Such an approach would also require kernel mechanisms which are
not currently available. Keep the thermal policy simple here and use a
single passive trip, which at least ensures that the system is actively
mitigated before reaching temperatures that could ultimately lead to a
thermal shutdown.

The mitigation temperature is derived from the platform behaviour when
using the balanced power profile available under Windows. A separate
change will adjust this trip point dynamically according to events
reported by the embedded controller. Name the trip
"keyboard-ec-alert" so that the EC driver can identify the corresponding
trip point in the device tree.

Also add a 73°C critical trip to shut the system down if the keyboard
temperature reaches an unsafe level.

Add a thermal zone for the back cover with a 73°C critical shutdown
trip.

Describe the SoC, SMB, SDX, east and west board temperature sensors as
monitoring-only thermal zones.

Thermal camera measurements were also used to compare the reported
temperatures with the physical temperature of the chassis. The measured
values appear to primarily represent temperatures inside the enclosure
rather than the user-contact surface temperature. No unsafe external
surface temperature was observed during these tests, although this should
not be considered a substitute for formal platform thermal qualification.

Finally, enable ADC thermal monitoring on the corresponding PMK8550 VADC
channels used by these thermal zones.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 75ad74bcb042..5d3a0a5ead68 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -20,6 +20,81 @@ / {
 	compatible = "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
 	chassis-type = "laptop";
 
+	thermal-zones {
+		soc-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		keyboard-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <500>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				keyboard_ec_alert: keyboard-ec-alert {
+					temperature = <57850>;
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
+					trip = <&keyboard_ec_alert>;
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
+		backcover-thermal {
+			critical-action = "shutdown";
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				backcover-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
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
+
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -1612,6 +1687,36 @@ wwan_sw_en: wwan-sw-en-state {
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
 &usb_1_ss0_hsphy {
 	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;
-- 
2.53.0

