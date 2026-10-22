Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700289;
	b=MpgLnuCgZyiFcuiBRv8jQv56KFJx4/Kx0ApNeu8QS93qWq9ypxonROt+vIrSbors8kUs
	 zwd9Orb51NbGyBbPKMFrz+Y9SnOPnWg2aO8nKzNItTHEUCml9+U/qJyyaV6IlNF6JZg8z
	 JVPdAMptYVGropSFIwL2N0IHlHujyE2iWBFRiFPw150twkquxIam3gyU8ki1DqM1+jfOo
	 7Ou6Eib7AXL4mxr0MZlG31P6Q5q0TsW7XOswB9qgo94dpXMpa2U0B113uhkBmiVWe96aO
	 mFdz0/DNcAD5A+hTIZ/Ui/6EvbIsVUOx4VewpzgFiQ9l2Qfm0XFTktZ3VCHwIBmIzPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JiA4JitzQw/4MC5Swl9tbuEHHH6EIhc5VkOsXaDCmnU=;
	b=uxStSZkJ4suYHla6dUtSM3YNqvZhnhhs67APWVNNhlHsy1CdZFBpiP0vzltA5Ro/K0Dd
	 ag0gr/2axqutZusPysr3q6xPFTuqjEopWz/ebaFG+4h04u1hcq+MbN2h06PPGoAq+EW67
	 AxhFcGjjb4FRS82gfpI75NTIluaYcFRu1DwwVolvOoHNxW4LJLDIQ5bGw4WZmmShUt9w2
	 tqrg0uNNu5IEPSNfwjJ3shmNO11ftPTVnU7d+NFZqOctvcZdBQKWucbtO1lZsNAf2GViV
	 lpV4/nES45KurULNqFRXW6ONssbPqG8GZOLH6sftwiVSgSkWwM5TCQ2x0GvwbnTT0Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thinkoid.org;
	spf=none smtp.mailfrom=thinkoid.org;
	dkim=pass header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pO7LUnRQ;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABE3606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 20:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABE3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pO7LUnRQ
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c1f548f87so3842036d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1792700288; x=1793305088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JiA4JitzQw/4MC5Swl9tbuEHHH6EIhc5VkOsXaDCmnU=;
        b=pO7LUnRQ4y0gsifPlHbVeHgo0B2aVNrLqimoypSRAc02oswTWnhI/rV4zy2VmiDoth
         SqTk3b4Yk4rLKWk3abA/o+rNOFwulUIUZDNgWx17LwKGillB2OXUXsmRqbE6hsDZs7cU
         r5eg6rijI+acq80iSsBj82bHRToLvuPr/KI1llQyUZNV03MTjxgxnm6gVzLm4fwoTNXw
         OVSf39/B4FpbstOtrSDH1BemBYs49B0y7TlXXp+oOWNTwUmgcLNStgNBDGh3ehp9yb9I
         nwWZcimMAT7QdKn5e4P9uiSa/+rGX31to8dCgIOor+DbVIdzMZb4MK4KWMn1sUkvwpfM
         70+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700288; x=1793305088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JiA4JitzQw/4MC5Swl9tbuEHHH6EIhc5VkOsXaDCmnU=;
        b=KoSiGJkQ1tkmlWXKCfhS0js0XLU3lYsy62aj9lMEn623qZHERopvoIxWYjlf87ryhK
         7IHyX2N/xiyNG3Udd4/xgWFtF/ADZ2JPLPlFb8ENqi65th1TXjLH4jN31YJ1HKcR0hms
         x3gyE6cpfiejy65JH+Aqcbw6SL2p/2tbpKEHDmRhLgryDFOLURGFuATfHjifE+p2oMGa
         MeVI6OqmoO1vMl++zbYGGgj/EYAu79z139RUkOMtYInzmsMg9Dhmyv0DIGDLZEUKwaVC
         zb25JZwLY0hUdaKFDJT07MFLJh2DS+XOJWKD9ZOcOYMwmOxqOpef8OQLCRVIIDLeTDAT
         6UNA==
X-Forwarded-Encrypted: i=1; AKwUvBynz61gmn1OvUHTVHNSmgma3ApXNa8cWaW0NQAUT6/Jz0lOnCSU+7ZaAzEIZr07+wcMp5qPzKzODyAfPXFb@vger.kernel.org
X-Gm-Message-State: AFq9FYLIY4nSmyK8Wm3p20mKUuFIIbkUevp8fRaswAoTnOq0bRP76YDm
	7XZW9xU5znHxEYZBdDM9S2Nz5CWBWAeV+NYMaBFvhdoMXOyMOrRrKuQcucQu1aq4+nY=
X-Gm-Gg: AYBFou1Vy3SVQfrDswHopKbUedBcR0JuOtMEOMVp7oWgtq15dSxrK1yy4IC058oRIlH
	5fU3JeInNbjKrycVMhRvBM32XO3giCOtDKdSVK/JD3kwdlNPLtgomRPyILEXChbVJzalOfBEk9o
	xuKJ3ZKFrqUJzzAGGeg/aBckLpghogL6fcz+fBDsuIA8AXmpxjL2bq8QclhGUwT7hAvYfVg59XF
	thxRssacumQbz+pQrV2pLOMAjfbmOKA/k/OFo7yPrNHvC+Elw0F1Krl1BIhjKtGBGAg0aOCIFZI
	W1RBZIvnVvgD7IK5pAJexJGFa5D7SpLv3fdEzX9+msbeLavNoTWjQ4C1DKqXrpOarX08Vpt+dZs
	IvfqbBfDFBkX4mT+5l8stI+w6Uyb3IM1F5u7tNNZlmm+t8blL1vV5Yz5j87fw0ZE0gMdFKn/iPw
	DLDe5ypMrokD21qtNTzjF0WWYu21UpHI2ah0XHqzWB9febHsOqhbFKm6SD0UnxkMDZZR4kH2mRl
	NtyweKt9BTua9WC6sHodQqNFLCR/YN0EBf38N3u/ttKgsSnrCuuyA==
X-Received: by 2002:a05:6214:468b:b0:91b:5d39:e127 with SMTP id 6a1803df08f44-91c12f1f445mr103449156d6.48.1792700287610;
        Thu, 22 Oct 2026 13:18:07 -0700 (PDT)
Received: from armok ([2605:a601:9b7d:cc00::8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c39507ff0sm1638386d6.4.2026.10.22.13.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:18:07 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add thermal zones
Date: Thu, 22 Oct 2026 16:18:03 -0400
Message-ID: <20261022201803.22530-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.56.0
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

The XPS 13 9345 has seven board thermistors on the PMK8550 VADC: AMUX1
to AMUX5 THM and AMUX1 and AMUX2 GPIO, each with a 100k pull-up. The
ADC configuration in Dell's Windows driver package lists the same seven
channels as SYS_THERM1 to SYS_THERM7, the two GPIO channels first and
the five THM channels after them. Name the zones after that list: where
each thermistor sits on the board is not established, and a name that
guesses a location misleads whoever reads it next.

The ACPI tables define seven ADC thermal zones, TZ31 to TZ37. Three of
them, TZ32 to TZ34, carry passive trips that throttle all CPUs and the
GPU; the other four sit at 100 C. The tables do not name a zone's
channel. Taken in SYS_THERM order, TZ32 to TZ34 are SYS_THERM2 to
SYS_THERM4. Heating the board supports that order at one point: a
charger on the right USB-C port warms SYS_THERM4 well ahead of every
other channel.

The passive trips follow the thermal mode chosen in the BIOS setup
(Thermal Management: Optimized, Cool, Quiet or Ultra Performance),
which the EC reports and which cannot be read without an EC driver.
Use the values of Optimized, the default: 53.8 C on SYS_THERM2, 62.8 C
on SYS_THERM3, 61.8 C on SYS_THERM4. The critical trips are the tables'
114.8 C. The other four channels get report-only zones, as on the CRD,
and all seven are put in thermal-monitor mode.

Assisted-by: LLM
Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---

Notes:
    v2: name the zones SYS_THERM1 to SYS_THERM7 after the ADC configuration
    instead of guessed board locations, and order them the same way. The
    "left charger" placement of AMUX2 GPIO did not hold up against a second
    owner's ten-second measurements, and the SSD one is uncertain:
    https://lore.kernel.org/all/NCQ5O8k2_GpmJZBjDzgZL67uwdiYmmuSudO9VmdRaFTDq0u7aec6at00VYbzdwwSVvgJnLnGxewwp_TVO9oTjM2pAjP_LoiURf9JCIKXB-w=@vinarskis.com/
    Channels, trips and cooling maps are unchanged; the v1 tags are kept
    for what is a rename.
    
    Tested on v7.2.6 with the ADC_TM driver (7.3-rc1) and aac6b2ca472e
    backported: the seven zones read within 0.01 C of their IIO channels.
    With SYS_THERM2's passive trip moved just above the zone and a
    single-core load, the crossing throttled all three CPU clusters and the
    GPU through the ADC_TM threshold interrupt, and the throttle released
    at the trip less its hysteresis. The v2 rename was built and checked
    with W=1 dtbs_check on qcom arm64-for-7.4; no warnings.

 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index f48e6bc35006..bb7d91ed08ba 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -326,6 +326,145 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-boot-on;
 	};
 
+	thermal-zones {
+		sys-therm1-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		sys-therm2-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <1000>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				sys_therm2_alert0: trip-point0 {
+					temperature = <53800>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				sys-therm2-critical {
+					temperature = <114800>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&sys_therm2_alert0>;
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
+		sys-therm3-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <1000>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				sys_therm3_alert0: trip-point0 {
+					temperature = <62800>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				sys-therm3-critical {
+					temperature = <114800>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&sys_therm3_alert0>;
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
+		/* Warms with a charger on the right USB-C port */
+		sys-therm4-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <1000>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+
+			trips {
+				sys_therm4_alert0: trip-point0 {
+					temperature = <61800>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				sys-therm4-critical {
+					temperature = <114800>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&sys_therm4_alert0>;
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
+		sys-therm5-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
+		sys-therm6-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		sys-therm7-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -1025,6 +1164,36 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
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

base-commit: d053e38e614fb2e383b298ce8fc308a780d7f209
-- 
2.56.0

