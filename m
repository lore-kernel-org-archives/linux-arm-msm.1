Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702734;
	b=n014xwIWAOozj2jL+Ufw7biAaUEzaC6VQLt571E0A9TkuhAjpGvAbbcZ7e7QNJtfqIfF
	 ixcIvxe7hcOaznfjqGPrEPOTc6ahE5XCaw2y1hmv5VN1o8Pf1u4oH2cCmAUHsP4EdNR1O
	 XX1dwynXcGtaGpQIx2BKKhHBgF47Gfr7m0i7wLQ+9PxHR8NmelwusFVMqjEaVRUsIa97x
	 +xHS0WNGtSi7dZsrYffkcOrmnUuf2RSOhovNJjXrA30uTr4VTuMOwXnjpnoIH2/F4BEGl
	 IcUtG+VLartPqeWkxlbKJY6ZiiWou5n7CM89jYF8F8NmLHm5kaphMn5YVMvBw5fsGnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5BzEzIkh88UF/eFKoP7bFiAZvwEVTm/vwY2OAtRkH6Q=;
	b=nGoUlZLn9wNzrDOCzb6ur7VczekbN12B0JaHoejFDH61alb1c19NjUkg6hTBI3rnUtsb
	 ZBUL8SjwaZ2Y8NoMj6euMRXWVWF1Z16lxSrL7+Lg285sMVB8s9JG41HiJodzsKx0W/NOg
	 fv1gIXdSzuYZrBW3bhoocNYGzifbUyUSRfp+wKKa2mckf1fmqvMWPq3RO6vhWdsYc90FH
	 BQOqSWVlLE4orQ7kphDkTFjM8JPnkvWOxczGe9xobwjCK/7fdBthxZaheQNnYsOlc1Km5
	 LNhkvGOBjIHlqY6c1GmgohYVV7VyxsyLH5R05XPrVUTT++g3rU0V9GnSl56mtgnbn5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NuB+pYQG;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF460606A8AE
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 00:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF460606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NuB+pYQG
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so3819103a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 16:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702732; x=1795307532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BzEzIkh88UF/eFKoP7bFiAZvwEVTm/vwY2OAtRkH6Q=;
        b=NuB+pYQG05P8vQsvSqK8FGXmuv6ceF9SEljR1BuShW+W/8vSijjlGoVxffAOL1Xuit
         FVKS/QagbramNrGHQ7YQcw0KXf5Z1rEHgu8J9YT+7duzmX+5k+DIm70GcYL1Aj0moXUo
         ZbSgnLz7FveQGyQDM9sNm2M8Bu+DDGoSDYyOnUujpQBR5IqA/cb8XvQ35+n2qf68Lwle
         +nPHPawZqGNoYKcpYs4YYZHnqEEt9MeLiKNt34QXOpZLGMndedcl94C89CAAGK2Jc/W8
         mvtkgZtTYqmUa8XMvuu8WvWp8r7vaoHxmm8RsNTnDfAWmDWKMzHpkttLgwVJ1m14oeK1
         TvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702732; x=1795307532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5BzEzIkh88UF/eFKoP7bFiAZvwEVTm/vwY2OAtRkH6Q=;
        b=TP3NhMm8jRO0sY98a7SrPCBplacFtqgeWLnovcmulxBDiiyjJaGnFAzb7biwA7XLFI
         NXTGdVIMeqgJB+v+7CPnzKajJHCChvFVMQPkeGhsLMyQyQX67plEntuhWZ1MaR64oFT8
         vnB7BvrKX49e3jksP+DK+TEX1kNUi1PtXThdo/pMILI73y3wnmbq5vDAvc8Kjf9M5hxv
         MAaBu78bmhmvmBS0qVTLrR7/ltgk78WTCNpJm17HthhTMjcVfC7IvZmmVyaucS2t+URk
         1TNrAyyWpiYY/kH8136HX9ibdAr+cfb/rsjmZZBQH/anVhDD9m28LvL90CarPrXUQPPX
         RWew==
X-Forwarded-Encrypted: i=1; AL+hErH60Z009QJQIIWl4IzxorjZ1WwbAAQkRm6tjH/KAnqpolUh6lmoQXxc8Msz3U0nwGnKKPEY7xbvN+JxnZE3@vger.kernel.org
X-Gm-Message-State: APuU4Z809hPxkbqnU9B4Tarp34t6Xa4DjjQiA5aI92XO1es9qhZCtxSY
	GjC12NZe6B8x17fCntiLZz5b37ewhy8LX6ZDM2AqSXcJOLi9kKduXT5lEvKeReg=
X-Gm-Gg: AYBFou3jUYWxQCPaOXhKGiX8T/06T/usmidHRaAbSUX18p3zsHEzQl3AVS9kIhVRrhz
	UojzNJ3PxRx+En7m+zqNej6cAR16RBOUMVpT9Tggw3IhGfkYMnGDO8fbeK34xrzvWSIbMtb8fLu
	/FSDSzoeiAgJOf0lASd+DDNdRzG3S6VtasykSYqHiucYOxm7xMiBsAuy02kFxvP3svYaj26UROT
	8aUmcN3uqSvCEX6WHwCJXwqP+hDD2B+pu1ZNRm4fmJcy3d4LoozMDmAM9rLA/AVFFnaq3SiVCE3
	DdiqxlPrLS7dW75d79t/YwxjaA9jjzKRYUJCgmMRkO8YaLrD48YlJxeDRncIBk9og7/z4z2nIkt
	sMm2ypZM+6/HUIZ3hbfQG5CZCl02bBfQYZcJ7HidRHmc5r2eks8d2pvHGXUnVcweFSuNG+oi3X+
	PmSC15hM+pCuhG/g8z28i+uhb4gTNSctme/7izjKjpUtHF+k4UPo0xTeTFg8kpBEjjDaHlHtOUB
	CvFauMf+zN+JivYeTBHTRheKoOUvV1KwS2lmbalfoMqI6X/IIJypGyhTSxmq8osQ1LzpGDWnygl
	Mrfr+hJOOm+50PglJh8Nh5fXejj2jpd5HBoFJwoojZM2PXU8QvbvxgGtjliK1BtFTUkWKfpCQJw
	7qI7u4+TwsLlFZId8FDTYNh7hydt8jnfJzew=
X-Received: by 2002:a17:907:3f02:b0:c50:5186:6dc2 with SMTP id a640c23a62f3a-c509636b5f5mr660429766b.24.1794702732209;
        Sat, 14 Nov 2026 16:32:12 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:11 -0800 (PST)
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
Subject: [PATCH 3/3] arm64: dts: qcom: sm6125: Add CPU idle states
Date: Sun, 15 Nov 2026 01:31:58 +0100
Message-ID: <20261115003158.391171-4-majidhhdri@gmail.com>
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

Add per-CPU power collapse states. The downstream "trinket" low power
levels use exactly the SM6115 numbers (silver: entry 290 us, exit
376 us, min residency 1182 us; gold: 297/324/1110 us; PSCI CPU mode 3),
so reuse them in platform-coordinated mode.

Cluster (domain) idle states are left for later; their PSCI parameters
still need to be checked against the downstream levels.

Tested on a Xiaomi Mi A3: WFI and cpu-sleep-N-0 show up in cpuidle and
the usage counters increase.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 1b148e453..c06842c0c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -44,6 +44,7 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -60,6 +61,7 @@ cpu1: cpu@1 {
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -71,6 +73,7 @@ cpu2: cpu@2 {
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -82,6 +85,7 @@ cpu3: cpu@3 {
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -93,6 +97,7 @@ cpu4: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -109,6 +114,7 @@ cpu5: cpu@101 {
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -120,6 +126,7 @@ cpu6: cpu@102 {
 			reg = <0x0 0x102>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -131,6 +138,7 @@ cpu7: cpu@103 {
 			reg = <0x0 0x103>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -173,6 +181,30 @@ core3 {
 				};
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "silver-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <290>;
+				exit-latency-us = <376>;
+				min-residency-us = <1182>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "gold-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <297>;
+				exit-latency-us = <324>;
+				min-residency-us = <1110>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {
-- 
2.56.1

