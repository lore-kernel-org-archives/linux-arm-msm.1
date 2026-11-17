Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903871;
	b=oK2yzFhgffBRfBGA34Je0yXqdx8jFZ1v3KyKpX12JtCzZBJmU2dg29G0Cg0oTA71E/v0
	 J06cTEHGWkHB39tyvgyeIfaqRQz/kbXmCCDIyyx8UT+DUMKoq2EBrxoAWvqygi6bxE0h5
	 9epCTPi0c8tD1+YDdS0HLdjxJTKlk+/eVlllt9IqOp3wAism3CXwtJGHDi/xTC8qGbkZp
	 1DAbTdcs7Mu6KxPZ1xIwadjQ0/EdOBBpgTuHxNb5623ETpBa7eheaOkB4tp6jvs/lzsOl
	 FkX9jbd8uBox0yo3PFsr1b/i1dYHBOLL6vetLPShHHsEdbocqFOpg/e+ZBiRO2xFRpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FIAdVkEWa+YKpNqjyEpkUHZm+KoAzH84s76F1+g9tmo=;
	b=rqsYt2N5UfN2hYxObSL5CdZ5v6piZw5RuNP4O3wrHr819H95zUm3skRAC2jBhKMcd9dn
	 S0u+ZyPdV40Am3VBG24IfUibZw7VGCzqn8nv6YoS2C3onPblHtR/55dtWxHFwM99hHKEo
	 eynm673P4y4NI1FAvF+QDro5sqkPvOcdGGR8Fv68cOjFiy2W7hGBuN9N8VX0c2mPe40wg
	 SztdRuD1xs7EW/yZZpDmaUU8h4HSLr4tXYlAZkhhn3cPS1ivrG9XLEjvEwbZPAzoSbBIk
	 s3M2yfk5u17+OzcqM7RsFgrW+yBu/DIs7DJs5MmQ2a7qSMg77tCPspx25QNefLMnZTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="m5rd/aHW";
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5354C60A2626
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5354C60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=m5rd/aHW
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so6724547a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903870; x=1795508670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIAdVkEWa+YKpNqjyEpkUHZm+KoAzH84s76F1+g9tmo=;
        b=m5rd/aHW4x8+LC4Hoff/y+voqA2dzKC/QkkgsLWsQFHr+HtEIpj0YzM8GS/0DT4I4/
         gwV4XFvMdtCFyCncu1foTtxnDag3pLIodRg9GKg4EOvngWrgE7sZf/xsl6V+6Ap5bEyj
         IfqsLVRwRZ3PRMZAO15NX/asAngzwzq9p1KuCe5/mpybyPr7EGhUvziZOlA73MmTyKbC
         C0w+7/iASWvgEdcoZAcQ+u0CcLjvDSlVePv0LRLBtM4mwr3FChD8MUkxDKZFSxIvNkyy
         vVEs8Kiu6GDR0RjpRDwnNpojC2/T6aoCDk0SEKATRH5nXRiR+Xqd4hY0eQczVQSmDFra
         uDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903870; x=1795508670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIAdVkEWa+YKpNqjyEpkUHZm+KoAzH84s76F1+g9tmo=;
        b=Hp316lml2FEW+OLvhQdlDmRv6OvgezQXyu+ZmtKMKNfMhtrwgzbrVk8jdPnnxz2YJ7
         2tWP0TpLqtP/UvcJXFemJEZgQl9qdhldZAV7q/J4PJU5h8azQB5tZz7dZAAIKHYP+Xn8
         oCq56JTx/eat3pE2ugycYATQIZXHJosgcxrBGMr8fNN7X3U+dLed9FkSBnvarUBPNu7k
         EsVpPZYV6uARyD5M2AvwCbyNlSFBp0L9Y7tkSnZX3Msx0g+BbUwuvQ9F6ov5rWz4bdLN
         UCjVY48W2CvdqjeQ5CjjB/sX5kZvGLNo2+ii4LrAHEsPpYRRAjEItsD1+LCpCP1LpLwz
         uFHQ==
X-Forwarded-Encrypted: i=1; AL+hErGuRjQBtJrZSVnb6+XZqoB3swf/NZHodm8PiFlzMXWe80+ybiY0rmP1+BQrt+O5mCxn36uNnTgsTgECfmpb@vger.kernel.org
X-Gm-Message-State: APuU4Z9HM8LYpLPQH770GIojMans1gTj6TJVUWxQXYyQL9tmGgWBViDr
	Ke0qn5RBuApaCO+xLy3OT0gHfl6+NnCcdXkQaPEC1jxXuhaib/yuY+oKeMi7IPsFsXg=
X-Gm-Gg: AYBFou2ALq9WTtxYO+lToZNpgzuUAE5R78kD5q33S0CNEhJ66sboZ+1vrLIx3ktkVoL
	CMn8ZGvGT30c3ZTPSBYszJQpeV3oVUOYFwqwygEErP8apTXjESuYS5qbJuyxejBKiUwIoSBZKQT
	mQfwbNm4ZHg9P9vf7Z+PDKN2jKpKTLcODFJKfzgxpj3LSc5kep+ZwsvEku2inM/a2QIrhsxXSvn
	VQ0rXAyRLjYyVgQLyaXEjMvTWKfZsNSpQOMp9S8PeSPupC+fVQaKqt3iDxQfQuOItj/Z4CsiieX
	HGQ1nYQ/LD7iWOVhiIoXItArqWDUbzw4XAFSuwdEi5mBB4EaJyFcXUfIaqv5U+ZOAHylxc4ndL/
	ZrY3trUdjWCUPALRC34kn6agfInZ8zs164sgPMqNBOcy2Z49hHGrvNk/iB1Jo5a0ycbskA7k4Yl
	Y5DYff6v9pHBgChQttAqA/XaDGIZ9IsstLHOWeJ21gbvaiN0jsHSnku8PBz/ALqG3ikj4xTgJKz
	K3X6OQYMoIyAgdOx37mcZqdNnTZHYsirBaMc4yGM4W12GgCsoCWCyaIdvZbteREme7+AFnP3xl+
	vxv0xRutEVu3cFB4+m9yd7Psq4rjymVBBQ6IZfpUfK2TLvQM/w3S7VeDdLICgoYb1RXzABW8ZyA
	zx4fvh7N/H7lCHPYaGdS4OAhqt2NKYNehpdNU6judGZG08qVc
X-Received: by 2002:a05:6402:4349:b0:6b7:cad6:a020 with SMTP id 4fb4d7f45d1cf-6b7cad6a0cdmr8624241a12.8.1794903869734;
        Tue, 17 Nov 2026 00:24:29 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:29 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:15 +0100
Subject: [PATCH v4 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Add battery
 temperature node
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261117-bat-temp-adc-v4-5-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=2686;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=UM7jmORMPxSdPO1xNc3zcibihjU+NS+ZaaeZNpYbWE8=;
 b=bSCoKLweeKiJ1WF6rrWxDJ5PvVPJnM1jcFj2jNkvwbajxykkdKa/8c/FNqE+qSnRKKtFDBFZe
 6H+h7QU7eoJBq1AUVzYpXMfKx8YKghowLXcfI8OqIxgz9zMVaz1nDYE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a generic-adc-thermal node to convert the voltage (in millivolt)
read by the battery temperature ADC into degree Celsius (in
millicelsius) using the provided lookup table.

This will later be used as input for the fuel gauge node (QGauge on the
PM7250B).

The lookup table is generated using a Python script:
https://codeberg.org/lucaweiss/batt-ntc-calc

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 83 +++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 37aa272019cc..0b8c6f353f96 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -96,6 +96,89 @@ memory@efe01000 {
 		};
 	};
 
+	bat_therm_sensor: thermal-sensor-bat-therm {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		#io-channel-cells = <0>;
+		io-channels = <&pm7250b_adc ADC5_BAT_THERM_30K_PU>;
+		io-channel-names = "sensor-channel";
+		/*
+		 * Voltage to temperature table for 10kΩ (B=3435K) NTC with a
+		 * 1.875V reference and 30kΩ pull-up.
+		 */
+		temperature-lookup-table = <
+			(-40000) 1673
+			(-38000) 1649
+			(-36000) 1623
+			(-34000) 1596
+			(-32000) 1566
+			(-30000) 1535
+			(-28000) 1502
+			(-26000) 1467
+			(-24000) 1430
+			(-22000) 1392
+			(-20000) 1352
+			(-18000) 1311
+			(-16000) 1269
+			(-14000) 1226
+			(-12000) 1182
+			(-10000) 1138
+			 (-8000) 1093
+			 (-6000) 1049
+			 (-4000) 1004
+			 (-2000) 960
+			       0 917
+			    2000 874
+			    4000 832
+			    6000 791
+			    8000 752
+			   10000 713
+			   12000 676
+			   14000 640
+			   16000 606
+			   18000 573
+			   20000 541
+			   22000 511
+			   24000 483
+			   26000 455
+			   28000 430
+			   30000 405
+			   32000 382
+			   34000 360
+			   36000 340
+			   38000 320
+			   40000 302
+			   42000 285
+			   44000 269
+			   46000 253
+			   48000 239
+			   50000 225
+			   52000 213
+			   54000 201
+			   56000 190
+			   58000 179
+			   60000 169
+			   62000 160
+			   64000 152
+			   66000 143
+			   68000 136
+			   70000 128
+			   72000 122
+			   74000 115
+			   76000 109
+			   78000 104
+			   80000 98
+			   82000 93
+			   84000 89
+			   86000 84
+			   88000 80
+			   90000 76
+			   92000 73
+			   94000 69
+			   96000 66
+			   98000 63>;
+	};
+
 	msm_therm_sensor: thermal-sensor-msm {
 		compatible = "generic-adc-thermal";
 		#thermal-sensor-cells = <0>;

-- 
2.56.1

