Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744721;
	b=Jnc9J8KxM4volTtby0roV7xShCUXTv8OoippZyQuaSf7L9S44Fscxi7brrRUL32gG/6i
	 Y+HFDpfGgcknjcHiStqL7RviWuIBXkDgxl9kqF/El5mGPJJWTTMvenXrZKLQHrek+GYm3
	 GWjiE/8iSqbC7K2B2JQX//DdFz4pBRP50evjXyTC9NTFkpwf7uCzz9M5ZzO5kY4GimHqh
	 gpdPrdFE7F4HaH/Jy6wf7BqA5OllllB/dn1Ygj0rxY9aGFpff6riCFi320juvHjBzgSnp
	 0rrmHIawzVKfhBGm+U513CBBSP5zLD2TP+0ChVX/BUuhehmuVhFKjVdGT4jboR33hVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744721;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gY2fRVnI2zhWXKknMYprw1I6Eo3hbc44HoOJowJu3+w=;
	b=r7Bk37vSXLfYl7KUssBMC0q7PO8AXM2dZSJA9EHQGGSJtSKCa8B4NG04M//IwYJbs2wT
	 V2LspZvx0AmWMLkCzkxERu26RASXSZVPOL4FFW0p43mBaepJNMzk1YeV9XzGN9rMxmCkV
	 JvHllUGLB1Cwgri9w5DDVE0+Jz18FuLhtZ76bZBhsKzU7vTaQ8tbl9y4cVlKG4qk1EVrd
	 ShzF4HJMGgQH71tDVFT5XyeSoVBj7RlZSzku96cLr9r8cX+lK7hlFMb0pB6bcjZix7nNg
	 02ZO2lDlmBSOFg/HCfMmxrLFUNZA5BLdK4D0UpTLCxTJTXAyOC3l7xO3K9b35mnlNcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNMUVd39;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnQYsxxS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266CC606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNMUVd39;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnQYsxxS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FOq01552878
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gY2fRVnI2zhWXKknMYprw1I6Eo3hbc44HoO
	JowJu3+w=; b=XNMUVd39JgTR/WLSU8wyeE6hC9ylNlDv+9Q7myaUl5rphEQQopN
	M85dsZI2ZfrjHqzof3HjQE+iOavWjza4zBWPhr6x2R6IzdSptx/n5p4Eiu0o2u6L
	p65BZPpZZlHV8CuHN6dlYn7eiTMBmf8Qiz0l+UfO2rt+MU9sS7vB4UlYoRGqVdx6
	gcGp0Cv5DKCgB/eJ1k/RjGFLrmuWtpVs+Vl0JQjmgTZSwJwGn44zmFrRTFADxFRb
	gqbicXGuBefzRhLnsPn/lHKf8SVk3uNiEq1hLuyA3yayz5mRU8lHMuq4XderpZ8T
	Pi98M4FUTPkFhrfz4Cgv4FZsce0hre0xpJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttrrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:38:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so151468885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792744719; x=1793349519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gY2fRVnI2zhWXKknMYprw1I6Eo3hbc44HoOJowJu3+w=;
        b=YnQYsxxSJRu637uF74ISuQgpeK41kV5xX030D1YTNq666xrk5zEujYHWmMqpBb+4OR
         7LXbHnFvyGKAAlMmixIc+DzXx5lrDVbDyzVshsrx7kq6UTpGPqqGbEFs4/46qJHFBAP7
         ZLtLComNuCCea6L3NS/qqj4NuLrDpyVTLgL7HY218sAQQITRfKnhli/cG2IVUqYapsr8
         mJ+Yh78TiB/5ET4G+RCtlUXIUAQmUG+g02EA6lhuZsbpT/IrBS/BSVNeStHpw1kueEcj
         TQiO+yYZFsOZg3NhkgFOdkXeusWqIGQfz2gXK2CkB0P0I7OSW5MG6kLW3EsqUTYWGwW+
         1htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744719; x=1793349519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gY2fRVnI2zhWXKknMYprw1I6Eo3hbc44HoOJowJu3+w=;
        b=d4VuhVv54doigkpSXhFccvV5KMVyTAl3R6MxfxX9NnJ+Omg2CThniJwS1217jptsdb
         RJpDGTPsmWlYTzSQlbwb3bcBmaiIBydCGQAOTAb0c5k9vHdU+x1cEeprcxEQia9Nl5+H
         a8faimFcPVs0pmdrFcePFWu7pv3qSjuUov5BHlTp90Y80RSB0mUVj5tKTTWsOR+4kNA9
         un1bFNefU1dbC/L9NLXR6PWveXtZwpQ3s2wMPgOI+J/eGu+Nxkx67o2ERRz3cTa5BYJ7
         4xA3zRBUJsAXTgB0kfj13W8TXFhZ8niSEyfEO+GnvoZRW53BOiB/LVXggThUwWOQUeof
         pc5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxiCiwGOQhDRa8CQsSmHc1Dr0R+y4yKyVIXH3iw+2Io7N7HocbZ+i8gJ04XqqAppdc+f3sDfZDfvoaW4HX/@vger.kernel.org
X-Gm-Message-State: AFq9FYK7Y00pPLfeZo6nmZAa0eXN1xiebi6bIlq3kVesck7e+sW+tknL
	tYB8Sbw0zSVcKcQuFjS6inIhNgXDrZUiZV1qo4TPSNU2/SeP0abdbJoVG/sTm6wKO+Q+KaBurKC
	0l4OnvmkdaVQRGtVRVcCMCoRnexQRhmwIFbteiq3AjRxQHqwY6QuCUnYdqtBxXQHW4dzp
X-Gm-Gg: AYBFou20HVDNVxzj1lg31DRDL9ZDToMvZf7bt207pk8vpTv1qqftwqPxOzq108MMqZC
	SCU+4Tt61T9GjoJHmOrxBfaUp2gkoG5ul9TUwQpC40nr2GGfqXkTyvT9TdaKu8QkCPR+Rq4KHjw
	qufeIdAxpoGRqsUwUKLTjbrULZGdGi0qkov/NANras7DozOaahS/1v9p6rKA5WmS1353/gsl0nM
	tfX1z21UX7yxNxNcC2XQcxth6YLZlXoXvLlb77M/5bRoenXVakTKUA4ZphnnWxnfBOxzqigcnbV
	W7K0LXaZf0qQ5DeA4BtLkGQZApJfe6xYp9UjSXXFu2BRYLAJGx0dMGa2rfK2mVPNEIoCZO7j5tE
	RvPuxdjhkuNOIY2OZrD9Zk91q7xxCng4ntg==
X-Received: by 2002:a05:620a:390c:b0:93e:e175:ee92 with SMTP id af79cd13be357-93f6f7d048cmr287079385a.39.1792744719027;
        Fri, 23 Oct 2026 01:38:39 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93e:e175:ee92 with SMTP id af79cd13be357-93f6f7d048cmr287077085a.39.1792744718559;
        Fri, 23 Oct 2026 01:38:38 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b74b:faa1:2e99:5c8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37eded3fsm3587017f8f.7.2026.10.23.01.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:38:37 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        stephan.gerhold@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
Date: Fri, 23 Oct 2026 10:38:27 +0200
Message-ID: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb1d10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=W5eknlhPjGTqicOx0vkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: PVMwQ2awkoYwbA6yFpNL8pjnqSvqGRTG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfXzoCW83hRyd7q
 GLd5k4I6VZanJmGGW4xYYuU/X/K3tXil2rGkhU+U2F/UMDT68buiiexr8yqXuqzCrLC9e0FOePk
 3wVRQD1IQtd6KEbmiNJM8EISwfvBiO4W0sUKz08KzD/IWkRYuTQaFmFeybiUk/9mh1gfTfJEZFj
 tqY6rfxYcEIdQsVRDHt5s1m7QXTVbncV1oOvhP3QVOLLyc6+UMW75Ja8ZcOtFWhZLJ3v/vdimXq
 cSwODik05lu/z55NZw0+hUU3Dq9p/O5m/HFJLlkxxaQvKQXWgBygWRmfOb1YBpGToKksNKGZCuy
 qgErVNmU4dHR1bSWr6q1WvLgUgB9nAq81w09YOsyv68eWiwx20OXvmkaBMwtPIPiQYSscGh06Uq
 pp3GjxwpxEyRKhhcIh5xYMzRZ7nXo+mCWmVtgdlmjqgf5RhvXbaweCZUL/tz7BTfHuJDoDshQ9Q
 02cpGDtl2G10PTmuN+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfXwlb4jhHvt1ap
 pK73ZfxzyB8Mby4vcvGiBz5RlmtMq86vrElwGJpFUcah3ASIwWAA7TDW1+sR+AlpAPbolDF45vr
 P1TQtV3ruzWoOus5BuOou93m7aYu/qQ=
X-Proofpoint-ORIG-GUID: PVMwQ2awkoYwbA6yFpNL8pjnqSvqGRTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230034

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
Link: https://patch.msgid.link/20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 75ad74bcb042..21f4569068e1 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -502,6 +502,88 @@ platform {
 			};
 		};
 	};
+
+	thermal-zones {
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
+		/* Sensor in the WWAN area. */
+		wwan-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
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
+		/* Sensor near the USB-C ports. */
+		typec-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
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

