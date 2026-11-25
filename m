Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643756;
	b=yRLhCfrey/a91iBtjoSbsF5NLvMEQ3sPgWQUJ5s6Nn+iAiv6zBKoB79iYekcRLDs77xd
	 /sWlYhx+CfcGTYPfx4x3BT0sLzH6M+JFe6/Pv4IJE63C3zb2lW/vNjTCV8QTSb3cwJMO5
	 XCCi+yJ1hURpWOmm5c5YHDlUwYqGYpn3g0ot9tfXxpj7L58JU/MKAd28bqkE8CbnaM4TC
	 II+es69qGjy9QFI/0RwCt0122xia/MdA0HM7kRGZgr4/V+19uTmAFleuSPXwqoSDEYC+Y
	 ncPNmPtSrheOs5H9+x+WgyLPpW4EFADx8Z4U8XHSddQOroi6YQ3soUzjA/p5AVZOgCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wyP7vH2rGlbYhb8q27/m4UJghzd8eGwKK/Q/LPzbUrM=;
	b=NgtLEfZkbWAhxlAcJQsasla0LOVYZb5pv9aqCJl4HXlJcS8fqwN+pUGWUObVWG1PhDgA
	 mJvKgb/TEV5qUNvSJWyrenuCswBWurovNHALuGC8I8uX9d97ZRYhBokv5UnAZotM6RhrG
	 TwGo2P6xMKDUGds5tu/ivkmq+JERx8V6QsDwNROkn0AN72zKXCa8lhuRzaK33M4ZieLb0
	 jDsqQcDOiRL+ouYTXhxMoGDTIql37/jLs2X5/1srlpxZYetqb/FT5BBkULz9tewzx0zpn
	 ERCLSS/HQv6alYn20PBEI3L7WmSuSItzzhUWIjQK68wAwGh5z5omVEmUUE7hmsAcS8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpBzx8g9;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA881606A689
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA881606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpBzx8g9
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso8368416a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643754; x=1796248554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wyP7vH2rGlbYhb8q27/m4UJghzd8eGwKK/Q/LPzbUrM=;
        b=MpBzx8g93Uj8Ruy6RhF/in7IdZprugMOEFUfAZDRaIrjPOdZUZq9XsDQ2SSnsFGOz2
         EQvQuVnTQnPQ23H0ERkowHhW0yTsOv5RR818+V2z1TFdHne1R7OzQf28D/KdNx87Se33
         /3HJNGeIvVtLK9ctktr5ipsu2GPmb5Zzp0yHQjucklNfC1LIo97ZhjBUENwdL45IzXmp
         Lj5ObQ8mhFPlZetzP21vaFRyIpMcxkp2Fjv4zzyvMulQkvMJ+heiSHh+oFEyTThMC6CW
         IhnD13e/mBZO9XUUx6GG8EJehae4Cy/Jcp0x4dClozTx++VvrXyKe1n78BcbFe6bM1l7
         Qyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643754; x=1796248554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyP7vH2rGlbYhb8q27/m4UJghzd8eGwKK/Q/LPzbUrM=;
        b=gFWvNkAjUymxeoc67cL7qjbv36UOWXrBfGqBCPE7pSWZnuFduAiKNIycDQwy/ljh5w
         B0PtLrgRCdlBQhILAJFH5m1RtcwiRC/q2GUa4ZAM8jAn3KtgFrmrgQM55PSfccWdrXTw
         dY5E6qxVln1Rx6EXKXZHGVEh0aG4tVIu7pCfSsaKz7aJaUGF35hwbK5Zb0yV8nRs7NTb
         dz1tIqHAfdnBYwdgKdI71vvBQtE8xZZlm7u9y0qXoH3ljGIvvbzY4HeLcpm+DOd+v/5g
         tcrgsiymz7pGMDWGa/ImyWHD/rCXliWYVgL4xGYcA+ZKhUeCc9cQo4vxb+fnuoh4aca+
         1+5w==
X-Forwarded-Encrypted: i=1; AL+hErEn2U7qgnPiF6Dwf5IscfIFb+SQBVrdLfElrYvMVoorqnyXC4SRMGElxIEGaW0WvtH9NmmtW83tqCGY0pEN@vger.kernel.org
X-Gm-Message-State: APuU4Z+sCFryBK2Gky2m94LIW1WOVKxp5xLvDlzPH2XYyJgedVbo9k67
	Tg98a9MfqqaXybR3pXUL5Qv0l9OFkg2Y/SjvfXPwV+784rzK6NmGOSY=
X-Gm-Gg: AZFdTZfhc3wL20TTSe+F2+t4MCEzXWy/69z1QDAJY6jUzRxfn9y870yCy+oxHVgklHw
	w5w55bKjpS7eJlL0ccetR3rKNNrFtn5KOMoML/n7K/X2lBEigqKe0IFDbK28W3J7yUIx1Toi6Tj
	rAn9e842re167kL1AA0FK2qsxizyzDioOI64CMkVALkSFRt89z48XKshpRDEzh5dk7EsY1+qqBj
	eDPOqLAd9D9B6fVhYIw0PS7wf6b6hLep6H/ihFwxrn2Jda5sXishuMHvFZRFzQ3in+icvkF9LeS
	s/6M3HtTaXdWqEEK3KKDKHlBfmwwTRwpLn3O2v+zAZeKRsUg/Y9erOCY7Tx8GKIFNtfHHdU9Bi4
	9ojkOggSHuXIfsKpq+ShE9ZgXgIvQJDfReNQE5Z6V9+VEerMag6vQvWNUmc5+eFdCsyMZSemCVT
	kDtU9Bz6ABQEHkey+rcd3IfVhbIOUIlpCBOCdso7X59vw3kZwaFPy9fQnl7CVnb/NtuZbb79rCe
	4H2m1OI/lo3I+YbBTZlaUuYlf4kgLa3SXgYRs8KdJIsZaB7QifZqFhtsOKW/oUZGTuHsn5KgOmO
	KyNfl79dHwIZR6LO8NWBHQWTHqvTQGB3/WhMVNb0LyEjv68dXROghYMETJbWswwqFaFtRBSHm5m
	yfDXoV2kOy4GcbBxFuT1bx5Fe
X-Received: by 2002:a05:6402:22e9:b0:6b6:edfb:5885 with SMTP id 4fb4d7f45d1cf-6ba37c75eeemr11786385a12.1.1795643753754;
        Wed, 25 Nov 2026 13:55:53 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm8608871a12.14.2026.11.25.13.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:55:52 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Roman Linev <admin@mswin.me>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm6125: Add cpufreq-hw node
Date: Wed, 25 Nov 2026 22:55:49 +0100
Message-ID: <20261125215550.1834075-2-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125215550.1834075-1-majidhhdri@gmail.com>
References: <20261125215550.1834075-1-majidhhdri@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SM6125 has cpufreq-hw (OSM) blocks at 0xf521000 (silver cluster) and
0xf523000 (gold cluster), each 0x1400 long, per the downstream
"trinket" device tree. Describe them and hook up the CPUs so the
frequency can scale instead of staying at the bootloader setting.

GCC on SM6125 has no plain GPLL0 output; GPLL0_OUT_EARLY is the PLL
itself and is used as the alternate source.

Tested on a Xiaomi Mi A3: policy0 300 MHz - 1.80 GHz, policy4
300 MHz - 2.02 GHz, scaling with schedutil; a single gold core holds
1998 MHz under 7-Zip.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
Changes in v2:
- Region size 0x1400 as in the downstream device tree (Barnabás)

 arch/arm64/boot/dts/qcom/sm6125.dtsi | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 5f558b548..cbc500d69 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -43,6 +43,8 @@ cpu0: cpu@0 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 			l2_0: l2-cache {
@@ -57,6 +59,8 @@ cpu1: cpu@1 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 		};
@@ -66,6 +70,8 @@ cpu2: cpu@2 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 		};
@@ -75,6 +81,8 @@ cpu3: cpu@3 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
 		};
@@ -84,6 +92,8 @@ cpu4: cpu@100 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 			l2_1: l2-cache {
@@ -98,6 +108,8 @@ cpu5: cpu@101 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 		};
@@ -107,6 +119,8 @@ cpu6: cpu@102 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 		};
@@ -116,6 +130,8 @@ cpu7: cpu@103 {
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
 		};
@@ -1633,6 +1649,19 @@ intc: interrupt-controller@f200000 {
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		cpufreq_hw: cpufreq@f521000 {
+			compatible = "qcom,sm6125-cpufreq-hw", "qcom,cpufreq-hw";
+			reg = <0x0 0x0f521000 0x0 0x1400>,
+			      <0x0 0x0f523000 0x0 0x1400>;
+			reg-names = "freq-domain0", "freq-domain1";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0_OUT_EARLY>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {
-- 
2.56.0

