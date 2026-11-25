Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643757;
	b=g4Bs5roSC4yMMeqB4fitnQlx0EDBE8XJ8lLm5LWhpN4BXQ0jT85z+hEfhSQqgMepoBKs
	 pKV66dpVjIA62cIibY9mG/bawzk4hgFcY90UuHr2tXXTfJDJ57yaowLXhiTjRgh+RySSI
	 OTkvEsfwfJJso/nanTzVySFtFre3xZgSvK+xrrCwaBjsD5fkrE0sJE5GOhm8Bzmc6sK2J
	 qkuBfGPfSZYE81AkZMCFi1LH7tqHAMJUUhp3MZRnNGrpjbb9xo51TiwA1Rx2Ux8X2B1HT
	 mFSdHF0ZOB3FTveD2/IPEhKggectjO1vfA91Z28cfU9hFFO0OOhPpF1Rkz2NePfDKcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uAN+qnezUmFhxXGPo6XpLvUj0u7gFP0sdPzMCnlyKSE=;
	b=kDLHZj5umiF1OjYx9OHZpJtXjNJ1jlxCY/cZsJyzZSB1zbuzOnrXoTXD8zweOf9ITyqZ
	 WxDYnK3KipO/4RP/BekFWH8gF9rDEFOC/ojmERvlL5SCnrKZr2JezdXktQedZJLE2CLLj
	 EIzl9JO08AMnZGFVZT9/BEy7CaJveKMgM+k12axFtivU/pJLtLNYuc99zOdqshqiNqb+F
	 Md0VlueqjKAIGkFl+G9aP4Yb7R6qM+7FmtjwrBW+0r5wyOq7WIr6TijLTMAmv5zRHiFEN
	 1V5CusYjrqGrmLxx3gTAvX0HXEu+QCE8RgvGCNPBk0kyMmEYiVSopUgWPl5UdHFnD7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gXo0hC/n";
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D97606A6A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11D97606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXo0hC/n
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so7006599a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643755; x=1796248555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAN+qnezUmFhxXGPo6XpLvUj0u7gFP0sdPzMCnlyKSE=;
        b=gXo0hC/nffijD3GTgiFu30p6FztE0NaPZrXRVSn1ssm2VPg7P920slYHTUXtguI0No
         5i+BcgE+yT5GypKmCQQFCpAbaggDi3hsLNzZBrTcOL76nYozB8FhrVWIj/+hqvxzo93E
         KYynxwNIPylitInk/wGonjKpwwwx9BOYMeuExwO17P+R54k3196WCj4hpHdRVcrvDaev
         tyqoZvmB3M0VH1vZxvjah0/V/ysq5jLnWS6Z3GUK7uBKuHytklNS6EuK+C4+OZSYb0L0
         N4c6PJGLC149Lun7XUW+wp29maw6rYjdf4jd61rKuSnovs4pd79yuETKfLzgMgEoUoAt
         pWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643755; x=1796248555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAN+qnezUmFhxXGPo6XpLvUj0u7gFP0sdPzMCnlyKSE=;
        b=p3NwWJE5eUY4rRgHI/iWeMDW9mMfG+yKA9MVOasgeKEbFrok2fTr4nlscSDcH8KTut
         UL/kyltkJw5PtKGDyoyGIIaf6YNFhjG1jAZtNeFFuLN0wjaRysHgwdFOwML8yqpxa4Rq
         eqNKcYk2LQs8tbp3aeEVC8JSVLmnXh2QtA5ALitr3NU9r+FQlgnQl5Z4MMT/rzIYzttZ
         wmH3IyfmfHU2UXAu0fDhr1lgtOtJ7/RJf8yKKCcfHYHRa3kFOtnxOaaSKF5rKkmJ6gIA
         cAQsW2Bw1eL8vIdGOK6xIpTdsFZRsNupaiSNzpxv4i4j8B9i8WFKtirEf8AlXbcyUdKg
         n8MA==
X-Forwarded-Encrypted: i=1; AL+hErGa3Ude72p2TSouFr5EGQMbpY8VlxvLPXMncV2bfKtSHF/kPJ+KcbdCWsKotLAzfVU3tP0ZX1pmj2pbzTZ9@vger.kernel.org
X-Gm-Message-State: APuU4Z/BbYdsqUOr1xgWuZGPpWPiKG+PuMsscPFvJx4pB6laIbxUmmv7
	D83LEhv+IVrACDzvkL/twDByzoysS8cH2NFW6uAgWdmgF7bNuHSWl44=
X-Gm-Gg: AZFdTZfcvZFWTOXcuIYV5JS3pYV+2X7lKEnout3Pn8a+WfCfFDxg2RBBIFYLOj/TrIs
	X0jCfAEEYeUWNMq9Gr/5bjakUTjkJZ50lzhaE2rvRNNsEILJZFu4m2sHmibNVHgjWOtBHtQKWyD
	1HwwCswt3q1YrRIwEXTzeXtfQ1SzOhw/ZmJRg2nA7j79/dl05q66a+t+nT7qqJKg5jHXzMQAFum
	536c1gskOEf3vn1v3iupFYD8KoB2uxqVJiYySWHj4wlIUBVKFygvWxLMTyIWQaRo6S+TopitYmc
	fDxryG1yQ8Yi8yBddeRGfEZLZIS2W2ExxMmNK4fOrfWekSyhWe1PzcHAyM0wMhCPUXlaDeI6v2N
	znnAR5Dme6a6Bi0ykG7MsXZk0VpjHnENykWcbV4DbE6AKmgADRiXwylVmEf9gbTB465BIEfAa2v
	dlebqBPCCiYwsDYLSF5zkvhj4kTsmTYsvPHzYC1RAF9SOS1FFkM4JWQlvo6i/Kte5hIj8p0vHTf
	pOleMSA6cy7Q0epm/3CWnu25i9t1GFU5kSoFYAmZhUXZLyv8XUdAnN/SqJShuUazGwUnzmtbc5o
	wjRjzVtkDtppixr6Y/4maEIhrAeTRlTeT1oucPZH7OcoZMN4k6Md7cFuOIaQkviB+ha1uZnVhie
	LwcS5/z6+vhu3MjkQCatez4hy
X-Received: by 2002:a05:6402:280e:b0:6b7:d55:87d3 with SMTP id 4fb4d7f45d1cf-6ba37ea7696mr12598729a12.36.1795643755329;
        Wed, 25 Nov 2026 13:55:55 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm8608871a12.14.2026.11.25.13.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:55:54 -0800 (PST)
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
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm6125: Add CPU idle states
Date: Wed, 25 Nov 2026 22:55:50 +0100
Message-ID: <20261125215550.1834075-3-majidhhdri@gmail.com>
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
index cbc500d69..f30f7b16d 100644
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
2.56.0

