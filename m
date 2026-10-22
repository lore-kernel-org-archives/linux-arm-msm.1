Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660763;
	b=aiUQ4THvYX0/criaT1T71pelP38Gqgxyy+WsPwtwIwDVGEf7/14T4VeGHm1Q68bBOQru
	 HbLLXAZP1M0KifIOhYb67Pij7lYcWSVeIPuIaGCmVl1ywRpUijYqIPi2jWCG31iCMaI1b
	 hli4CZvFpDt0FkFvBbkA20Mmwedo/yuev0t3BX0AEgp83+3hQiqbvdNPHzseshW90pBBH
	 6OrPBmQYEharN8+TmoWeznkYA2irHhPSCJxS2ZSRDtmU9+zXBNrS5zYdvJePhhDWHRTeJ
	 rzq7FQyrWg2eOVZU3d4cvq51zgZ8gdr7EC9JuQxpxKWtSAwmABxb32L1IW2U96YHBUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UH4FeDzPCNNR2s+JvuKV7mYVmUzbbIHkggk2wlVeLXo=;
	b=r/+peYBVNWvBwLDby9N+WZC6Sm1M5KlpUTtR21yb4DVhBXaB+SCs270jTU+AeOD8RSI8
	 szqfrFBxTCOTolwmRpwPmA1k+y/FimRroCfxzHOOeu3HRIB+dOxuZd2F7h8t1cdUinAAC
	 nNnNgvZEQ/inFTguhJ6HB6fCJcD0d4akgnpM9WojzDCBAVFpdH1zDwz1sykU1EqnIN214
	 dlQrI0eRhuiMd5C82L8AmEULqZtTUBReOFKrC+nuBNwJclJR9ZPPd0ND0GmBa5Z+Ty3d6
	 XUAuejD/0Td2ROmpcP3QNibIcu5o7G5RHA0Iv/twyqrk8cFFblLttbrHDz9ap5zhf3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=GLqS2jxP;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6203060A2607
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6203060A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=GLqS2jxP
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c418e215671so200449666b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660761; x=1793265561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH4FeDzPCNNR2s+JvuKV7mYVmUzbbIHkggk2wlVeLXo=;
        b=GLqS2jxPj592NSbnpzPb3btzVGgCkLlIqc2/z7sbSOnfobGOCMPB8gzQsJX7Yqfg43
         6Wmitb2SYy20M51IJ2RxNzAyLYyJG8a/inWV2I2vjrxkOfbceXzBKX1tbhGzq4luXZSW
         hkKAHhUplOKV7QXrGiTrKD/HZvQsw0TjMzrk2Nyk2H3fP19rvg2zstpImhy+i42vkxIQ
         maiv4olGWTyT7H4CCb6ExlCxY+W/5GdhZeOsGaSU8N/hRAfBQJf8/pfw/ge2J+f6rAdu
         GP4iBpkz+V4clHyvYWFuqItfblDI4QNEdCR5h6Wm5SiEZPoNUv8vZuR2bMmiqMbY7TUI
         hqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660761; x=1793265561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UH4FeDzPCNNR2s+JvuKV7mYVmUzbbIHkggk2wlVeLXo=;
        b=T8ZiujmBQ0blcWS3EVWBA6sUgDyLrrnJAT+s8o6DdruMzd7CEroIR8LGAi6xSSFWGc
         aVJZSzYGeT++x7+Jp0yuxp3CL4MYKtvuY0Gq2cLdDnXN9jDovhYKNxIcG9TvyqE6HQII
         zR9wQhUaeEWq9cpnwObZ/0H+E2SKOfKm9MI+5bQbqhiGF0qKPJJDbqcFtuDk0bL02lmv
         BibgC5kFtCm2RnT+cKOBj2mqOy3Kjya0zlfU4uTCfmSG3TWUbJHegWfInohBYDOF+n4s
         aNTotxTV6/E4VGE2E/vg3mt10bjDES6aYGRGujl3wxcAd90eZjxEZFj7Clf1PsjVA+s4
         Kwgw==
X-Forwarded-Encrypted: i=1; AKwUvBxVwLwUOnZjQ1FvlBqi2XkeLFAIB1ez3Uxs4dJDcFlh2DkmHmcvDj/mQzK54KMOD5VtzWNeHcA1dfzb/OGr@vger.kernel.org
X-Gm-Message-State: AFq9FYKxwHUIICllo2ryrqhLe8wz/qtcbU71icpTjkPS8nTvC4UjYCJn
	OLNxF0aeXro7q4AZe4P9YPes/88QtOZZSaZKhM/sonI4AwRgW2JZ9Zdqa6UFoQYW9C8ys4TQQLG
	EJjvd/9o=
X-Gm-Gg: AYBFou18lDuaa3UKiLLV5fwCtF1vuYoP1mLpY4hzD+4ShHn2/pgVSkeuqearEdN2E/P
	NknytXNNkCVJoF+AdB2FbvfiE4lhSZP82MRatFdAP1dmSgeid8ibx6pg9FLlfRyBFIOWiMIAk+p
	WPDEyYQ0IDdqrcDVtbpdDomPCzunCa4GxfJli9fRnkIjrCudYuS085vXrhiHg6+bXNzidW9X3hI
	1C6faXG3uzgk4CwMguQTBa0XYJB+pXX2+wF+SLDNNgpdtdMKaUlbdQvmLi4YSBmiR6Voe+n9uRw
	iNUpFDEcSwMhueXmQBfKL/NPRZA/yH3LU6XuF6I/wiglpP6Na/5CmI/gCGlcQOyAiPB5PLpM/Sy
	SY0UdLZgp72xaoX6gQJwem4Emsxi5ze92yH3TLngPPvGC9tZW7rM0Rqj17W2s9K0qf1CM39ivDs
	Q7b8D1emWXB1r4W939CjlWNE0PTTxtqmM+K5aThlgDIHATPUZGGIwFIywsiWKBSK1CAGxPhyRDO
	KMe9jFNcJmr6F/WxLkattl3xEqk34nypD7o2w06g9wlv57+tTvMg7/uCwucnm6GPAjya02rUj0H
	bcbHwoxa2LKEzKouAWWQHX+DxBM8/E3hR45ZlR8lQITHl3SZlsaHEBMecMqncoLhaFKP28lrQCr
	wGLTKECG6OgwwT1JhZRXFWMtv8jhZ5kj7qb6d6sv0RBVsi0C+1HKftqRPcTA3GPnJpSWE
X-Received: by 2002:a17:907:969f:b0:c42:24ea:3220 with SMTP id a640c23a62f3a-c467970e3b6mr441406766b.31.1792660760888;
        Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 22 Oct 2026 11:19:18 +0200
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for AWINIC haptic driver
 family
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-4-ac8c14377e82@fairphone.com>
References: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
In-Reply-To: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=880;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=pi2nL8kvBYr8FUFdGc6j29pfQDAldTc7iyEJBmQFvzs=;
 b=ozZpMWob2iUFdSZSQQRasTmd+MG2lGCrchPwltTq2tgohqewvze837ywdzkHno0JEnexC4HzP
 6KXAChSxZbOCovVdvHsD4hokJQTcLOOgtPYbLKKhap7193bDvVHJyRX
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

There was never an entry added for the AW86927 driver, I will take
responsibility for my creation and maintain it alongside the other
drivers in its family.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c103edaab227e7a21e50f6d9fd733..5b5792bfd58b9b4971bdd8471cb832068f8aec16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4419,6 +4419,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/pci/hws/
 
+AWINIC HAPTIC DRIVERS
+M:	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+F:	drivers/input/misc/aw869*.c
+
 AWINIC AW99706 WLED BACKLIGHT DRIVER
 M:	Junjie Cao <junjie.cao@linux.dev>
 S:	Maintained

-- 
2.43.0

