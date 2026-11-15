Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702731;
	b=jn44mWkfa05SHMQFQtSRsRwoPi7WPXXvrsePcJdXxky/nBmEL7grSPTXTnxPMU4XADh7
	 ybcFgJgXHhiUwI6CDYdGDKxnNaFAuPJoVY9aX5zSTv03Q8JPu09LAIu/Do0Z9c9AUJQiD
	 MqsrcsMTv/4BS7wgfTnqGLbk2/cDJ/y3UyPs0uRQlAgCpltp+yR2x8RXmMF1zvO2SyFPr
	 BHJtqhKKso3gbdc/kgUI94chwvob8rr24LqstE0evZ5pQrkc3+rK2yudk2f5ZEli6DKV7
	 uqziXuEOaw9XPBOOaG/N4thNqX1PPhBHcoU0nbR1Ig1a2nxoLp1HGbc46Cm/Fb64/yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/V2Llsn9Ob6GsqoLU7bUjN5jzG8A9WYSdTy8aKE0Szk=;
	b=TWqQUHFXhHsvrSwo54eOXMxdrOBcbPYAaFlG0DIdoEOwce1Jo0A8gmjo5ZcPYcEUT70c
	 +EvC6ZxpLJYuCSW4wTVnm2W4PK2GB214HxOW9J66OOihKEw/cJqQdaWgJIdJT7Kcis/n3
	 aFPLM8ZbJ+wjwDfDiJyStZIXMO6WNDdO4M+6AEb161X0j/WgWX+ODtBvy39w/cg4792wZ
	 zQXWSY3sE0R8ZU2MOJWOLY2fHjOGC1HfZGI/yncrKx43lFC9RjG+vjJkC+wqWbVN2Kmtg
	 tKMvQuNNfnnTD6cYnH4ZJijS0N8TlWKhoCi4YoxWyDYhH0dWg+QgliNHAejnSxS65RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+MAAQqn;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B141C606A897
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 00:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B141C606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+MAAQqn
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso434745266b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 16:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702729; x=1795307529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/V2Llsn9Ob6GsqoLU7bUjN5jzG8A9WYSdTy8aKE0Szk=;
        b=I+MAAQqnmdX816Yuya9hYCTG1HjEcrD96aKoQbrYdMjff5KADXulZWqJpg66oJy1zG
         yuagg7rqaGsybkAKhlX15mmm1bEMZFz2D2rNI0rZcYaaPSbRV5cz4taVJ4waTfHc44/3
         XmGc+XX5lLLPBL8jt6DQSVVzK+JqC8njNusX0d29uCM5HJlMtUH5ZIDlubk0x53fqX7D
         aR5ExrfbHMlrTa1s6EIsR54gkUzfSWyX73bZIYnd10l6OERnBkF4GjT64T/DOr5pDCgZ
         p671Mw+++D30ttsUaxYspVeYxl3NbwXYNlveZePNB9EG1ste+MRqEj6qds+Exo9Qh1tO
         mEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702729; x=1795307529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/V2Llsn9Ob6GsqoLU7bUjN5jzG8A9WYSdTy8aKE0Szk=;
        b=ixcUNgTF2aBwt92pFUnSDZ3fn2uvlhJ3zAYPGR7M13dSbR/6FZisYDuFGNZsq/mQAq
         stX1Hhnl/1DkV6tYYatLhbo0FozJohSKA6zzljGQh1egVy1m/LH8HD7jWcl7gBwihlZJ
         XkI537px22nW8OscVqDiLoP0EMRQHdee9eLmrDIgY+6JAif7hmzA5Kik47Sorq9UDntx
         mJp16jumO9M9mcSI3P+nOLxOJCqUKsgeAF7n901yXXii3IOzikG7lORf39kQmilJ+PiT
         osSm+JM2flLl9+8cVhOWBSaryryPt4lfH1r4pUq9TU3V9hE3I4GOJZcVdMwmn713dnc6
         /1gA==
X-Forwarded-Encrypted: i=1; AL+hErEMtovH8vy3hIWCIbLvVTWQ9iI0VI4WQy1Zk744ufhWY4OdcbuGq2KLMMvNEKSAoq7mROcYIXcis8ro8/BZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/vi6FVnyDHHtK8eOPW/RPj7vxV+S78lxe/BxYsAcKUzGlYC8aJ
	483wPaCjrRcyKXW6rNyucJzxnSUwrFq7LAsQG/AC91pu+6hF+JLByYk=
X-Gm-Gg: AYBFou3AzckMiXpZTCGyx/mV25AHqQ1dXpLKEGpQD6ifIdZFI9FC1Cidws7lGIn2zpT
	A+kr/xUXgOOomsIrb/Qjc1FAKUP01huySVYGWZ6ytqFe60UU0IZ0Jw6Na9Dl9br7U4OBots76Kq
	OQMx3ZgfaExLjwZNBvVwRmYEvM6quw6K6nOS5/wE2ktcGgIxTRCsFk2W8838O985iEJk30yjQP5
	6MjXXRMLQzqKE9eay12eynjsnQTHKIWk9qd11EYFeg1pHV79NI8CNl797+Mxi4r7FmiW18+iCRt
	etza8XLCN6yrWNMZ1EbDSMDPK6xep4N0zxXyrPFGmD5BefBHwEsc7o6jsE2MpU/cPFRYY9/VSrJ
	r00l8w+UgnL68lYKzMuqxEQSzGH1fPJedvFhZUy7kgKd0GWXAKP6XR5dSCccE2lINt3/jOljI00
	aVIbHsWTvcoTSYayNLQaTGFlL0wpNxGVnErIslexGeNSKRGKhcTvITbQFV853yAZP+b0kZSDJLO
	JF992W2YxB97RndxpqKsxTVMA/kNO1yIImJbljQIfa7kJ8EtEY0NKwmNB6d7Jn7VNEErhomcBEY
	cPKD7WybDvZi66pK9DN5BLSRT4PvFDlSRA2D3fBlzZJAKiCG0yc48ZrqvQ8tbVO141UP0ixysIS
	+PszIZJQCrMd3Q7zyIV9xjzy+j6fbMXZxYDE=
X-Received: by 2002:a17:906:9f8f:b0:c49:a539:aa45 with SMTP id a640c23a62f3a-c50963cf771mr521124166b.42.1794702729152;
        Sat, 14 Nov 2026 16:32:09 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:07 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sm6125: Add cpufreq-hw node
Date: Sun, 15 Nov 2026 01:31:57 +0100
Message-ID: <20261115003158.391171-3-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115003158.391171-1-majidhhdri@gmail.com>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
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

SM6125 has the same cpufreq-hw (OSM) blocks as SM6115, at 0xf521000
(silver cluster) and 0xf523000 (gold cluster), per the downstream
"trinket" device tree. Describe them and hook up the CPUs so the
frequency can scale instead of staying at the bootloader setting.

GCC on SM6125 has no plain GPLL0 output; GPLL0_OUT_EARLY is the PLL
itself and is used as the alternate source.

Tested on a Xiaomi Mi A3: policy0 300 MHz - 1.80 GHz, policy4
300 MHz - 2.02 GHz, scaling with schedutil; a single gold core holds
1998 MHz under 7-Zip.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 5f558b548..1b148e453 100644
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
+			reg = <0x0 0x0f521000 0x0 0x1000>,
+			      <0x0 0x0f523000 0x0 0x1000>;
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
2.56.1

