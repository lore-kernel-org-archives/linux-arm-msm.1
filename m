Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525829;
	b=BiEqW4eSBixxvS/JCZkUpaeXuDqViujB6TfUW16QjwZRzzWyvbSIlJad1O5NHgCMXd+f
	 ZIRXkwWJ+hhsZ74n+men+uRFPU8JQcyZlPDYZiuhwNOlc70B5PQ28HsvG+o3LX4ng2/kJ
	 R9YvjMZ2UuRZTBxp7dURs0mFiDFXJzVSvy77YGORN66Xw3idum0C1kgSFVxA7Psd9ChoT
	 o+bHEh4w1gTqFxtL/421qje1unr+PLlbWQIulZQzd6xaFld/iNAGw8lMjwOmTK9L6xQve
	 cW0BVjz8Cm8bxrwd1zOD+gFpJczf81u/hNVL6yCYxFRdeN1C9mMGOvPF6lc70BSj4vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
	b=Xe04XYEsO5wSaz4yCySIVBud91HifCOiaa7KjswH8qKuBOiLwu8wk/YY3gCrkVGdAo+S
	 8oSe+DbNo87No2vfr2cfLnMWxd1mPilbBvA1FY0XjzYjYa1d7NMdIpyNsC61QrhZ/+vyh
	 ccSptXO/PP1TIuS5BIMkjH4sVtVb+YofFtpAxyHD96r115IdQeAMxZWT3aDZMXpv42hVj
	 Ky3bLS3oUgBUGBuxWQlUM/C8tstwRGxi3Kuz9oX7gt9sbfjEbhrbDW9FuKsFlfxmboiKf
	 Qr4cGNFCKioL3R0Q/9oCaM8OnzIW1A0+BDL3rxWjodlszAreJ1V6oqWcux1lkAnDcEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NuIBbCyO;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF8A606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 19:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NuIBbCyO
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso3324667e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792525827; x=1793130627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
        b=NuIBbCyOHLjMgBRgN0U2pccaR1TZLAsQhr1eI7b9dpYjk5TlNnN94DdOAXN19YkR7D
         FAf8nTaWqBcQbkylIxVI5KyXHkXknkDYt7DbtIn1A08do1AD1oVysJRCpy81PHz37BEm
         x014kEN3iJ04lFyi8hElEoVGeEPXX/8cBi5LcFdm5PQXylCE54Y2pr0yKGA4R6VQAHdi
         /HLYIHUAF/4tIGEKKW05bLQEnDiGo1snPRRas0w4qeATPZuUYn9RTZssEOckbbc6bnQ0
         pDMMs1XJUDvJJslhQxV2fG2OAscyUOSOnaNVGwJjLjWHyWx9fVUSKYloowuqwMfn+P9z
         ydRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525827; x=1793130627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
        b=VL2PjVdZOd4OU7qJD1rbvdt0nG5Gq3uNMOTzmVPwpgwCJP1JEJ81+GcIg5AhYAsQff
         7YyayfN3YlF5sukArwU7yNyEhRN9mYJiMxOjLNA9ik4FuVkuxXy9+f9O/cEnSek7gyze
         gIOvxWC2PFydQCYo8aD7GWNrQ0X+q5r6g2yhgfdy/0GPdDIw3lXJC0Zu647whquw8t+P
         yv+fli8mbK0qUB/Ycr2Ctm/7ZwTIIpjX6YqLupl15ld+62RGeFjNHQTTNcxNer+B9ODX
         k73frYjAKd8sFDstBO2Lg2dfvEoRoXLbdy9E5ZVipkloql1LAqfSmk2dN9J2KE6G8iCz
         4+7w==
X-Forwarded-Encrypted: i=1; AKwUvBzpMnBYUzYRn3+J4sNVQxXem5Fqo6KkwrpbnWME2AnWspUOgbQuGajs9iFn9TZY+FJsFKMl45oHeQOe7nBw@vger.kernel.org
X-Gm-Message-State: AFq9FYLj5RwCwkfRcot+Zy5IYwSBVZTQmfagrQTPHgTTHXKWiRqzxsxr
	hrTwLtVKyu4PqSxLPTXbWPWXRrFCQaYS2LoYy8RjPIbADMtJWIHzxwtQ
X-Gm-Gg: AYBFou3x9bp8Gy1Lzr3BEqrN3vW1ZzN4fG6tTmahMyim9zQDu7d4Q7PR6+ZBo6dUUl/
	JPN4mF/ckpuXpMfE+fvCbP8ii7daGn2zPGS41MnKByRYLmVKvvysdXNPIvAzJO3T/sG4sHTmgwV
	qF8UEPlccvtHbs5t47VJBPBVdX4VypwU+7Tw7Hut/Ec8h0gqqr14sSfLt5uMXADwD7jQjKuOpOV
	6fjSm7WbjuTc3nx3KEQ1cbfhsS5fV6fLLTNSi85omFEWH1kxWF9rXxsrIjIDdwg8tIoWeC11q0m
	Zs7GYJoCy1uUuPU2Z74QXnfnBN/31dpbR9+CQda5bbzv/0anfrba5LzOUfQMIyPBP6j5jfOHes0
	A2x5WvOPPlxh+vUL47rRP+u5vdsEaeAMwxgyLEjczCZC8ogUv3VQ6fHPxih4wK5ivEUZjajjeyo
	s792JVqeaFemfrNfnsEUCGTrOs9F66mwjrtx0Fgg+ADAtWrfMMDQhEjdfthk1etl/QWYaWsuFX2
	GOKpgNS3sYrDdHtB1p0KlSW9krPW+UiQTu0o+RWSt9C1Wvv8FsTq4AdTRC99puU/peBotG2RC5l
	RolTxNkMrIkXw/S1uAEKW5CXo7BNTKMPQEJyDtqV32szVEEefJglM6aYtyYySTvviM5NtlxE1Az
	MDw==
X-Received: by 2002:a05:6512:3a8a:b0:5b8:bc5e:b57f with SMTP id 2adb3069b0e04-5bfa1c1fb76mr4379e87.55.1792525826617;
        Tue, 20 Oct 2026 12:50:26 -0700 (PDT)
Received: from kompukter-Systems ([83.142.235.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa11a8caesm75345e87.5.2026.10.20.12.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:50:26 -0700 (PDT)
From: Andrey Derkach <gabin278@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] wifi: ath10k: make in-order rx amsdu buffers persistent
Date: Tue, 20 Oct 2026 22:50:20 +0300
Message-ID: <20261020195021.1133728-1-gabin278@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz>
References: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz>
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

On Tue, 20 Oct 2026 20:52:07 +0200, David Heidelberg wrote:
> The WCN3990 firmware may split an A-MSDU across multiple HTT "in-order"
> indications. Mainline drops these ("failed to extract amsdu: -11",
> rx_confused, recovery), collapsing throughput under load on affected
> devices. Stash the MSDUs of an incomplete MPDU in the driver state so
> it can be completed by the next indication instead of being dropped.

Tested on a Lenovo S5 Pro (SDM636) with a 7.2.3-based tree, on top of
"wifi: ath10k: trigger hardware recovery upon rx failures", replacing
the older out-of-tree version of this patch we carried before.

During TCP downloads the firmware split an A-MSDU across two in-order
indications (once in about 39,000 indications so far, counted with
kprobes on the stash and resume paths). The patch stashed the MSDUs and
the next indication completed the MPDU, with no warning and no
recovery. Throughput is the same as with the old version, about
60 Mbit/s here.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.1.0.1.c2-00455-QCAHLSWMTPLZ-1

Tested-by: Andrey Derkach <gabin278@gmail.com>
