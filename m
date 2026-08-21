Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634553624B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787281417; cv=none; b=l9u2/6LKS1sdxy/rrMuyYW1uc9gK5cUw7yaD4neEJ6I/pPhDuuTJX7VxtU6kqGwVmIPWKHaAHTPLgB4XOKgvdyvWamx38zLbgs7rWQ5uvtb3Gw9BHB3M+n+h0sK76bN2QyV8kFeqpaJ3s8CB5QAIuEQgJCwNjb+AIIkQ/zhr+rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787281417; c=relaxed/simple;
	bh=ONfX4Wfb1971TeDAprFg/ky8Azx+mOBa/NJjy+4EUTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4Xlu/c0McJl1OnQfo6Ru+a4JeEV1bR/+0ckTcfiOmwBEyI2fOH3myU6mpDLQEncz1KxGqLTiUY3EMRNGHWMVeNydcohhZ67/kM01TwKX8AP+sn+OnlBXV4UJ5O79SrQ+XkJE3neHYyywJUfM0mNCuUk2pBiD4qFyhYOjY9Bxn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me; spf=none smtp.mailfrom=mswin.me; dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b=hpeGBF2e; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b="hpeGBF2e"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c169ae1cb26so333449266b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 20:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1787281414; x=1787886214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGYQMxlFuqVDdtl5kyo6xRsi2rXbipb/DXKi83EWaV4=;
        b=hpeGBF2euMgdxT1qoCIoLw0n+JEPqaMT6EwvLFFS1+7DLyWq/ix24cstfa05w+Hh04
         F23j/xboy7omi/BzqyY/t3CafiQNOgftEm5ofskF+VvHoiaG31tmfOH1YM2dRcjO3ZcX
         CXD+uFXHJ532Wi7w1FHBZnUz6+RpCyDzyGNO++sH2iYIdP23HYf1pamme8w8XgclpwPc
         BH6DR7Lfkau0E7OpKhcFdNtPV/0MZEUTf9PDHwKSabJiS/wptLnvZ9zEMqO1YWShRRKs
         AP2kqnxSPWPZSsj+nh/vLWSYGtwZxufDp9sYYqhLBUpKDFUFEenMGORmHI5Fh08EWHLl
         928w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787281414; x=1787886214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGYQMxlFuqVDdtl5kyo6xRsi2rXbipb/DXKi83EWaV4=;
        b=Har1xuMzx8Rpwos4qg9KHJHkLANyqw/7MKCPsTO/O6BpEVNC8tTqweqU8AurodkcCP
         BDZSLJste2TZTu65Oslly6bW4HKylqnmjhpReTG0bxlUP88sy+ErmIe9dBDLU6cIX+iE
         UZuzr9qdMo+6vAXckZ03+CLKp1muZ3NvwFpOUqTiom42swV0Nh9/VtXwscbpEkCA4EUb
         TLprfZgpgKV5tVy5ckTDn6FXX/NSsJaF6GFvq1CVNfBt7jKVGqhPOEDAwvISi3JKXvmd
         vr5xurpNdeZ1rEtJQEy9Km9sIwAITarcttIhSB0F+5+jCtUdqbzU9hWFPEh0IZsMNFOL
         Vb7Q==
X-Gm-Message-State: AOJu0Yw+CCFpskhKub7m1Jrmq8EatpXTc1q84YP08V2lqDPN92us9vUw
	lPNWeAeynu7ckUyoYQccqvUFaRiNDdSPlMJZynjb5BLjXx0EQa4tPaGS2jgeKvQ+M5s=
X-Gm-Gg: AR+sD13dkCRgPlaOrAoaHCITldD4JkIOC/S4x149NJ5O3HoE4yttEr01wfufVgkzkzG
	uOT0n8j0VdSr6gdK0E0Jl6TZP3S1s7itFFuu3ZknbXQG0pv7XdCrL9p+7mjlBPTIVZVBTuKcPOu
	pXLFFI59m2D2tJ6YpLDzE7ESNdk2fXsodPZXuvAb/3OEWl3jq9VM45v6fivSUiRWIoJ7GXJY40i
	LKTm8FB98Jnioy5nhzkZ8A03HcKj97l4cw3NNPYoWcwo5nDHUYmZmmrpGkhrOOEBXYtK1gGgcn4
	PIL3Mdz+PeprT9OLrve+RKDdGFUHGdNpZpZWGI3o/8t8H+K4B2yAmjHKPw56Mm6ssGfMmBCNHZ7
	ZRtBxt8btc1nRTG3lnmgiDvPfYoyHwkxqTm7JAV0gABkF4W3pEaXXjpsBX5TkyfzmPuXTJTRY8w
	CMOr93BQ8c25UOLWcB/rrnYGLPog74tMQRVJGupA10hg/2mADpfNKQJsoFt+9xUkMR+Q==
X-Received: by 2002:a17:907:3e1d:b0:c20:fd32:d9f5 with SMTP id a640c23a62f3a-c244d7d6f49mr766880766b.13.1787281413726;
        Thu, 20 Aug 2026 20:03:33 -0700 (PDT)
Received: from zephyr.int.serkovo.ru ([85.17.200.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df293sm274875866b.45.2026.08.20.20.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:03:33 -0700 (PDT)
From: Roman Linev <admin@mswin.me>
To: Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roman Linev <admin@mswin.me>
Subject: [PATCH 2/2] arm64: dts: qcom: sm6125: add TSENS and thermal zones
Date: Fri, 21 Aug 2026 06:03:25 +0300
Message-ID: <20260821030325.1823829-3-admin@mswin.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821030325.1823829-1-admin@mswin.me>
References: <20260821030325.1823829-1-admin@mswin.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SM6125 has a TSENS v2 controller with 16 sensors, at 0x04411000 (TM) and
0x04410000 (SROT), with SPI 275 as "uplow" and SPI 190 as "critical".
The register and interrupt layout is identical to SM6115's, and being v2
the block self-calibrates, so it needs no qfprom nvmem cells and no new
driver code: it binds through the existing qcom,tsens-v2 fallback.

Add the controller and thermal zones for the 15 sensors that are used.
The sensor-to-zone mapping comes from the downstream device tree for
Xiaomi Mi A3 (laurel_sprout), cross-checked against mainline sm6115.dtsi,
which agrees on sensors 2, 3, 4, 13, 14 and 15. Sensor 5 is not
referenced downstream and is left out.

No cooling devices are wired up: SM6125 has no GPU node upstream yet, so
there is nothing to reference. The zones report temperature and carry
passive and critical trips; cooling maps can be added alongside the
consumers when those land.

Tested on Xiaomi Mi A3 (sm6125): tsens0 binds at 4411000.thermal-sensor
with no dmesg output, the thermal zone count goes from 5 to 20, and the
15 new die zones read 37.7-39.6 degrees Celsius at idle. Under a 660 s
glmark2-es2-drm soak the hottest zone reached 52.2 degrees Celsius, well
below its 85 degrees Celsius passive trip.

Both SM6125 boards still build with no new dtc warnings.

Signed-off-by: Roman Linev <admin@mswin.me>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 299 +++++++++++++++++++++++++++
 1 file changed, 299 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 86de1560b..ed7fb5b75 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -719,6 +719,17 @@ spmi_bus: spmi@1c40000 {
 			#interrupt-cells = <4>;
 		};
 
+		tsens0: thermal-sensor@4411000 {
+			compatible = "qcom,sm6125-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x04411000 0x0 0x1ff>, /* TM */
+			      <0x0 0x04410000 0x0 0x8>; /* SROT */
+			#qcom,sensors = <16>;
+			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
@@ -1634,6 +1645,294 @@ intc: interrupt-controller@f200000 {
 		};
 	};
 
+	thermal-zones {
+		/*
+		 * Sensor-to-zone mapping verified against the downstream
+		 * laurel_sprout device tree (tsens@4410000, sensors 0..15) and
+		 * cross-checked with mainline sm6115.dtsi, which agrees on
+		 * sensors 2, 3, 4, 13, 14 and 15. Sensor 5 is unused by the
+		 * downstream tree and is therefore left out.
+		 * cpu4..cpu7 are the downstream cpu-1-{0..3} (cluster 1) sensors.
+		 */
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cdsp-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		wlan-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss2-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		modem0-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		display-thermal {
+			thermal-sensors = <&tsens0 14>;
+
+			trips {
+				trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens0 15>;
+
+			trips {
+				trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				trip-point2 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
-- 
2.55.0

