Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793321358;
	b=aNEh4s6DMf4ywRoQvZDwTkRxlIBlMoY1DzTKl+JDMC8ofKahLV8JsFjdmZfDQzlCDJtG
	 kOAOtBThaEmlOFxKF3J6sVPyJ4P5HNqEL4Ansnx0NZk+N5poXA7JXlyr+T8cg7YGSyI6W
	 E5wsmgdJt0jcXZwmxgBVBVxIY3+w0WJnQEpbVX0kA0GmvL0zh7CwheYBJ2NOMCMsSyRcF
	 lOLDwQcLie6mZaBc6r2xdnM+/rsVzd4CeQjJ64KGJTu0n+DcgexcrBTkRTOQRX3r/c524
	 zdAjEQtJUSGvIa0sTE3v1g5KBYRiQikaNFmYHTMHX5gcYVXVD7I6eOUcLNhylkflIAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793321358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
	b=vSMOXukaerduPBXdNEPXbomOjq78p2c1l10zvOSYcntj13R5yc9/h2nf5ulCmhm7NIrJ
	 w67enFfI8jLUYBkFj00Z80t0bFr/fohWRVp3zniggk3aPFMTIs15R4tj2J66zd+ka8o/U
	 mp7HIyYmhP+S+SdXGz9vqxRt3UW6EjSA/XDCNAAJ5fULOMiQZenD4CQR/y/XUxr3A0F7y
	 gX2m0A7gsjQlX28Txw4K9CK6eEaVr4LliuKb00zAJGo7ofYQJrsjhrFHWsxtA4JakqeTA
	 hHDLh08z4+Zurq9hnVRKHfi3vhIvY2bjhc4qJbmBSwuGqaVcyeh1BKVgvvLKvLjFQCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPRZtIN;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D75606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 00:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D75606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPRZtIN
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so562995e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 17:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793321356; x=1793926156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
        b=ZAPRZtINaBu5ACaiUNxrIJuRhA6KMJwNCSPkWmCoxJb5c0gEk2peNiYOZsGK01uWY+
         JK2ZnAiLSAb9wgzwQu7wlc/KNmORiIqCLdKJ3V8rp7OCu2nPXGMI65YfO0UVDSWkwKkp
         hggTvq/kdfxRCvNZXPbWV4c/lNt1Hm1ObLO2YGUQKgYtgcBHu04P9jxnZNCY0PN0oSEQ
         nVwCfT7dBNFZlMs9EANTSKKJlMKgmsmpFutOSXyPi/LG2hHCLJp2KJ+chRrqTAAefj1G
         yfSySWiT44U8rH86j9iyZgk+d494y2/QJjxmmj9c2MmCUSbD2UoszDsaxxy73i5hvuJQ
         NSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793321356; x=1793926156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
        b=De/fET8gSlIfyWJnyj6MoAokDhPa+a6+2XFNpX8TdpsrF0aaHZdsbVIAQ0spIusuwQ
         KTtvwYBvi29UaA/ieFjG0i7PzrdKltJwt1Mqh/TK/+HCDFCXs5ur7P5M3q0/YwKM1J79
         Wmui/GwjCu4kL+7CD4gnGa/cL5oFzoA6VFmXg3V/uAnT/TT5n3XTQTnnh6iVQrPBWE4W
         1PYu4szytN6za4erc0rTfQBNvlHxobfZlQdMsfPBg7q2+Zbm0G9etY7oBFxfWN2waiOc
         gjuAUexkAvFUaY2i3uQ+UBZfGltGUsqJvcHlHM99Yp6tf2eZVqW7nhNw3gJlD5xMVQTr
         nC9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxiGr51T89WGYLuVjr/ipF80ibUa9WQ8Z3tj7ted2rLEJfjZXuRVLCzxzop1f9apX7qskhNQEfrTzaKQAJH@vger.kernel.org
X-Gm-Message-State: AFq9FYISEauQLZPH7TOvDl0a0ODTJ26/3UDhX+TkfSxbpTaM+1/e7pRp
	Nuh61gVdP1aHbb7JmenvHAc5tzUdo3s1zGTeaXE52osTZ0ZcYjsK8fw7
X-Gm-Gg: AYBFou0ZznUnQLk4ncWifulTjj3FwXnD1tJuTtr+JX7ELL8slmLQt1HUFK+P+EHRPao
	zPLCwcu/241hXxsffo0so1ynNmT3K61LtMlay5tD0Rc1pvt6i1i6edZvmA5UQed3HZbA0HoWLao
	oziB0JilaNPEY8TLjT3DzoiosCovSbDhVJOiiPIhoomHMzIOsJ9n2/mjjBl3+Mfr7Pb6nPzUZp8
	doAOEABBR1n5UGdD7K3acDyMvoh/kOI/y+AWIQRllAiTqGMYSEsXo8DVahrmiYpzaPFVujpH+sk
	kGiGtltI7/hdgMwiYeQYkwoKM5YO2Rrd4NwC2vVTFL3wqysWubnSLtw41vOa3R0IpZ97B9jYHYi
	Gj1/UN0p0xW5asoZT8hOa0Lx/hbwzPOZO5ENAYtZX2jzbarUW1p6gFSJtXVz6cyPzE9Xyuiw8Rg
	Hz+BT/vXH4YeXoIobgWD0UvTOhV7LE3woGl823M2Dy0TuoYuMAIZK9H8tZYatq5D99q7mouUBhc
	o8z4t3s5+o33T8ga14EAYjzzfYwBJV1tqyD9mhZKDqtZHWQEi5ao+bMbfOWvkQHJssrtLn9L0H0
	7SvCqbiI0lTt/Hs7XXnKuTQdq9+xXiJlZQcyrktOkGw3x0lGa+BYs+TZISznbKaatuJd146lh5E
	x8EYvSWDEWh5qEVA=
X-Received: by 2002:a5d:5d06:0:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-48e6e2c05e3mr2211332f8f.8.1793321356382;
        Thu, 29 Oct 2026 17:49:16 -0700 (PDT)
Received: from iamyoubutArch (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm158055f8f.9.2026.10.29.17.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:49:15 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: Filippo Falezza <effeffe99@gmail.com>,
	andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v11 0/5] Add initial support for Qualcomm SM7250 SoC
Date: Fri, 30 Oct 2026 00:48:43 +0000
Message-ID: <20261030004903.1068342-1-effeffe99@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
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

Hello Sreeshankar,

I'm bringing up mainline on a Motorola Moto G 5G Plus (XT2075-3,
"nairo", SM7250), and your series is the base of it: I carried v9 and
have now moved to v11, on top of next-20261021. On top of it I have the
rest of what the phone needs at SoC level: TLMM, the apps SMMU, USB 2.0,
UFS, SDHC, the GPU and display, interconnects, IPCC/AOSS, the modem,
Wi-Fi, IPA, TSENS and the ADSP with the LPASS codec macros.

With v11 in place of v9 (only the GCC driver differs), plus the two
sm7250.dtsi changes below, the phone boots with no stuck clocks or GDSC
errors, and the clock messages at boot are the same as with v9. UFS, the
SD card, the USB gadget, the GPU and display, Wi-Fi, the modem with SMS
and calls, and audio all work, and three s2idle cycles resume with USB,
UFS and Wi-Fi intact, as does a wakeup by SMS.

Tested-by: Filippo Falezza <effeffe99@gmail.com> # Motorola Moto G 5G Plus (SM7250)

Two changes to sm7250.dtsi that I carry for the phone:

The cpu-map puts core6 in cluster1 and core7 in cluster2. The kernel
then prints "/cpus/cpu-map/cluster1: empty cluster" and drops the whole
cpu-map, since it looks for core0, core1, ... in each cluster. SM7250
is a single DynamIQ cluster, so I put all eight cores in cluster0, as
sm8250.dtsi does. This is the same thing the review bot raised on 5/5.

The cluster idle states: the downstream lito devicetree uses the modes
0x224 and 0xc24 for the two cluster power-collapse states, which gives
arm,psci-suspend-param = <0x41002244> and <0x4100c244> rather than
<0x41001244> and <0x4100b244>. With those values the RPMh sleep stats
show the SoC reaching CX collapse and AOSS sleep in s2idle. I haven't
checked what the current values do.

I'm happy to send both as patches on top of your series, or you can
fold them into the next version, whichever you prefer.

On 2/5, the bot's point about ftbl_gcc_cpuss_ahb_clk_src looks right to
me: v11 changed its source from P_BI_TCXO to DT_BI_TCXO_AO, but the
table entry needs the parent map's source value, which is P_BI_TCXO.
Nothing sets that rate on the phone, so I can't confirm it at runtime.

Once your series is in, I'd like to send the remaining SoC support and
the board devicetree, so that sm7250.dtsi has a board using it. Are you
working on any of those parts yourself? I'd rather not duplicate your
work, and I can send them as a series that depends on yours in the
meantime.

I did the testing and wrote this note with the help of an AI coding
assistant (Claude Code); the results are from the phone.

Thanks,
Filippo
