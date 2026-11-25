Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638112;
	b=eeS6xZP7rZG1YqoQEzLP+4jiK06qC7Ru3RswgJ6uXBRYRX4G+4K1MrucLuDQlI1Cvs9X
	 QPSK4CDA2NsSfKCB14J1HCEKnSRBXvXcd7+HF6p3kPkN5MpV2bBxpBNbh6Av1itHwQilx
	 yPaH1ftH+ZPMcttlha5bl8QgbCiE0LB5y3wo8gHog6slvBkG+FORGFforldBC8NYjUXHu
	 DIC+BwRSBPkpYCH4wV9uPIp6y0pCYf9g3UZWixW/dbvIsN7lTQJz4CyDe42AYUOF4zDmW
	 PQwrW0hiid9Qf8iksdvVdxENGTT8UuXwsne+3l1mZRaFJBu6Zr/9AdG9kkNW0Z+etNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
	b=y9pjqPeYHpmz8dY5G/3Mec48N3P11Oyp94o8Ll3Zm0bCll8eQ+kCi9s5MZYOaGMGrFmW
	 LVjZdIGAG9zUJ6fXkgYVRLOqvnX01eeZdr/BGSDRAg1lSMyCcDUi5bF/zA2RY2tX4uaIl
	 2KMLqiszQJdT3vC0B4632HS3rRdnmt/VSwmoIDqIE/gPerp5Jc5l3C/n+QpePaL1iiyOq
	 1HSQdf7jk/euKo00CMeTBsAfH4F6SP6tYzcaBAn31VkxKuFA1x+fwF32tdLBIibhMnHiC
	 z41rPgjeYdCLGddOYAUg65WyMzIW42eWA6CXNhNikm4tbLZjXpGY4/dDh3TF8livVYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="ThAuWt/q";
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754AD606A69B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754AD606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=ThAuWt/q
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4ad4072943dso2099065fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638110; x=1796242910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
        b=ThAuWt/q3303JtmtGz5/JedklN/MTvEYgYp7PbmfHBsm/uUWPVrFZkzFEE5xCwSVUu
         8p8snvQokctzHJJdaz+nYbjgfQF8Z2EUi4sD5Shs/5PTRJy5X9n6HeJ+4UPE6XVhOIJA
         FysZ6Ik8nASn0+G/AX2uqPZXa9/jxdhvsjEcqhH5IY2XC0TTL6NFPuSFk9w14aJeeA+t
         EaXAQVLwlLiE8NuiAQR4tC8tKaLE6+LRecReFDvWOB2Ggp3NreDim0vpoVNNwMb06llO
         XQgNkfNxmTPLikkLTNsR0RTFnjhnthipY/jMlxpiV8EesX4h/Um8iLcpc3Gswu6yxwuM
         FlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638110; x=1796242910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
        b=honR7zLkAK4i4C8JIOAIHmhgO1xq/n7hn+aFwd73Gap13BDmqEKXAt1NxO8jCPEXTz
         XLHJw0p2IOGoYaVAgU44atCtNSi9WoRXNMN2Kmjx+AdIokymOQYt4wXhYQ3HMMg0B/Lh
         oGgN1tFQktQRxvwpO1wqFVRPyHdhzrHhb1ApSVLjNSvnaAVxjzbwzIR3M34tP2IYi0tV
         VguSwR8O4tJWOwBPMf7M3i9kvh0shItw7N+nD2Ap/cIWFNFmLnBmJpwe8aHv3/VWzeLN
         5yE4NFocUNZJZGsanVRrbgd+zRzH+fxlqdvju5/5s0sT9V/QB6z2HtCVK7A+90XenlF5
         3wKA==
X-Forwarded-Encrypted: i=1; AL+hErGXtt0IBG+JWbmexIpJsQ3w4l2gmP6afsIQls+qlY8GOnQ5OyN4SyUR4f7nTUo/zKWIw53ZJqUUU06SKI9c@vger.kernel.org
X-Gm-Message-State: APuU4Z8iBPI0w1wup9nhAuCWduGz2PpWUs5cg/nGtydJ7Y0JgGoKX9IS
	i7c/WiS9bVCP1nHx+MdlNcOLAs5LuKhlnPyP4ZqCkTq2ZrqSGq0u9Sk+w6KPyiCsqEo=
X-Gm-Gg: AZFdTZeel2IH1esDO4K+vRlZHzETs3J1cSVzLtI7VVoAyO9ikp6mDm/BA6RlNrzfS3o
	zbnlvO4fAkFlPxTnyzWqk0g3nRCeF9WqtZfJh3KviNh/wMwrauo/tk+qE0CUz6aW2kwctyf/+HH
	Q1cotJja3Szz4hzEqX8Nu4I6xDmRw8Sernr4QnbJFPmssuN1MKRyQXkibZuoCSQjNuuNgzSlXnc
	LbnOlEHaR4GcRbA2XclbkGh5Tq+xtyuR+sUQkPGUEZxSa5nqA1uHfP5ibdY3Dpl6i4+6qxHg4k2
	y9lPmA6a5FQZiRyGOZvccj8X1FxW720vZ/a6fvMg3eVlF+bHnQUKeTjWGuBqL9LiPJC+Df4vSui
	mNFmq+u4zfA8liTRHCUrj2yVXh5THPgEaE5GAE7p2khbljenOA61iPOjJAGxWvEZKEBNhxEDyMq
	O7LJVma8auZypb3QFG8dzCjUiaddSzbxVBKgomWZUS4AEw6cODSx/GsXfAL0jViIwr5M8E2NeQn
	LgzTtrZJAvWYZXTWTyiMJmxzQhLA6WU01HR8/Kviayi1yGNsxa+wLRcuCxwGVJGdReLTvWrKsCs
	VKxzTtUWoPav47ZryrS7s4Q4LPcoj0udp3KeC68L92ZOA5PceyiYq1XNeQ==
X-Received: by 2002:a05:6871:e3f0:b0:4a7:df5e:d6ee with SMTP id 586e51a60fabf-4bd07c9aa0fmr14107050fac.45.1795638110360;
        Wed, 25 Nov 2026 12:21:50 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:50 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node
Date: Wed, 25 Nov 2026 14:21:41 -0600
Message-ID: <20261125202141.1288493-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125202141.1288493-1-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
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

Add a node for the clock and reset controller found within the
Toshiba TC9564 SoC.  Also add a node representing the fixed
rate 25 MHz crystal that supplies the chip.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - This patch was previously not included in the series

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 682bcbc0b466b..b327f64885ef2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -890,6 +890,13 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		tc9564_xo_board: clock-25000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;
+			clock-output-names = "tc9564_xo_board";
+		};
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -969,6 +976,14 @@ pci-ep-bus@4 {
 					#size-cells = <1>;
 					/* Map 0x0-0x1fffff to BAR 4 */
 					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+
+					clock-controller@1004 {
+						compatible = "toshiba,tc9564-clock";
+						reg = <0x1004 0x10>;
+						clocks = <&tc9564_xo_board>;
+						#clock-cells = <1>;
+						#reset-cells = <1>;
+					};
 				};
 			};
 
-- 
2.53.0

