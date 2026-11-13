Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557800;
	b=VIXjoYKNJ2wSFMBbmLkkBB3EgqZ4Y0AjaFF/zmEAmZAhwJbBux6s9MZs1pRWnusxdhhT
	 orfwVM/KOMe1mJiTbWX3RPZqJlTv8nc4tgcOxDDB3zF0uSXiSzfbTDPuhqOWrP8B/Yedl
	 mGDhAZqvWYTkZBVdyZeBPqy00WXBlO2ysxRDzt47Mkms9by6SGAkfaKWzvlTSP8A1yMxH
	 fjylE2ZYOf5NCNfKI0QSXUxq/AF4YSgxckdRepPhYxdgksu3WMGIt6E9ioNXc8atCwTYa
	 qD1GEhDaQ72DiukKoSodpESCQA2YPGfACn4WUwOZR3cBVOeRZ0JnsHFDunlq40UWEXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
	b=bPfhC/TtWYMQG3Nx490I0eLIJOAdzOh6uhF8/UKCgCGxJEnIzw5cc0a/ulMBzvjfNH2m
	 O9lZqvMlobRKKPTiifiCSLLsRdoNB3/Imwm3OoHJKg+uuwOOCH1yJhkDhtgWgjRY7Ut+o
	 rC1/1FI+9+18aVIRvyxyzUwZMY5/lKRvfVRkdCSujAUUuX9QuHa+CFTnL8e3H0jVcjNRI
	 nWA8nO7NCuKI2abOKq2QHz86lv+jB/UtUPMOpr3eOZ6YZ+8Wj6k3RQzG/NRq2dyR4ackU
	 5Uq6/NkhmAz3OJmF6KaGrNpMzK0gjeIJETEJ1+TSCk3bz7xVj5PsLYIJw8vJaT+LFmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OZ0TtoaH;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23B606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A23B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OZ0TtoaH
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c49c32650adso115937366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557798; x=1795162598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
        b=OZ0TtoaHRNUCuyN+OfM7Jk1lrmCuCjwTTasUeeUsisIE93qvKbPIny/mIqEc1gBNKa
         tjBiklMLMkNAw6diqZ7UsW089xvDqnIlkgLwio6tCE3z8DlTjDJGhIZ/cU143aO5tAW8
         TlbghxxzGLxLW1js2cmshTxFzzXrLj0zcWHaXhApr+6OWYvYGZexYLpw6AuzIglPmbv+
         TFZEERW6rx65pCsn6OUNVolIE+o3CycNx7qdO2KQWwnr1AC3T52gsff61uYy9IlscfTo
         uUDDJJGbr1iDeegh2e6u2jthx/0HXMiN7vaV8GdRXqGJm3y5caEx8I0/5YCgwnYaZ7H4
         xKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557798; x=1795162598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
        b=OFPixalW3ut/2Om7uexkJGVV0cF6ESMtj7K06kG/vKMzSgZ9HGL2dq6Y3z0Ph8d2YK
         iapmJhig74VfUCCkiFKw5wBydvqzQvFuhem6S6G5brCozWtYTsLm9cbTv1u275voQvpQ
         J2mbTjgdI7TRZYWFbNlN9aO5mtO2io38LnEBbvRpt68OLO/CzII0UUWtU6w5rBuhD3UF
         P9sPBoWInKC0bgBl9WbBBR0thVApW7qdGDByITMP4Z3WhOyoKKVSgN+jE89FjV99cK0V
         ZoKIOMpdVWg6wbSmZfPTDrs6nqqlN/bXk0tFBIvhIAfcMicgHcSd0kpy7DWtGTFd7X9i
         nq0A==
X-Forwarded-Encrypted: i=1; AL+hErFzg5pSvRZ1pKkzJM/Lsi9P41wzt5zWLla7xyp2LP+HbrGDCLSaKVR0gRABCrkZOaDnTEOOuWKqnTePkKi5@vger.kernel.org
X-Gm-Message-State: APuU4Z9u9V7cpoeD/HyMZtRiMxgHErW349cOGHZYZ7dvRbKzcYl4yki6
	jbb6N6B5oB0Hp+YHOqIy3x+hPDS4dOgWSYq7ymqSm0XLs8e1XxBb6B2IkvWEj3d6dpw=
X-Gm-Gg: AYBFou00qldTQ0Y3Rth4NGgaQQBMt5sR8rb/Z8o82O10IUVaPqjfxAKdx+K9+xe4eO3
	f0ElPrhfcpXnWzME7pC+2VeJTU5tmXgDHo3uzpyOJBpAl40sdtiodBE9AOIJMVy5e0yuwW+IcOD
	zxSKcj+BveW04kz0OcPnmZUVW2RY4HqQEJqtE4ervuqZx3Eo9g9zONmIbP/kBYxEVs3HQ3XZhB8
	zWDIrA0LCstWsxg+IKIeOleLxMm3jm2j/aCfiiGhY4pD4tedz394DYLeW7Zi5FqjsXN/4uHlAct
	/5SqNJDFflj6cKnVmwxSEdVTfJXxe1HvFZuvdKA1QBzLp2f4/avEtwP8youjz9hdwuJwojZSHtp
	MwcfHVXFc5sJHR+pFnQ3t9ySkHH96kEhwHr6URKwXGfpqSPoTfNCZpoqO1sLiwb7nmITRXx3eNY
	oep5w+Y5whapeeXrGKOeFExb5apkDhVRyCFQHUhbetza8g6De+/h7KgzX46E5ae/lP08puS3188
	N2o4raHgzgA+GVYbCwv0qWWbGF+DZu4ig35AJwgT0o5uBJeR28EaLLC7mE/R6EUGcC4GuDjZ5Ej
	/4BOfSdDS5/au7RADnDZ4xsTCj2QKiXNAyoRkRIRo+oiGtIOSi16fbWL1djDij7BBfUMcvNmf8o
	Qmr23V0M=
X-Received: by 2002:a17:907:6d06:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c50963dc6aemr131877966b.10.1794557798644;
        Fri, 13 Nov 2026 00:16:38 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:38 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:35 +0100
Subject: [PATCH 1/4] arm64: defconfig: Enable Qualcomm LCDB regulator
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
Message-Id: <20261113-lcdb-enablement-v1-1-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=687;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Cb0jzf5yf7B35q4+LHh6E0ES6V+yP2TAPYPGLiJwWJY=;
 b=lLzlMM1LJlgxpG9XLQ5KkHczWQw96AMoeuDzzlMaFbyaG/5se576a7+MKM21WHa+mdbYWI9NR
 DNnaD8ufsFdAdbbFAk0sCSK/641WYpPGX+6bVv4C6lJUq8Hs3VquxKu
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the Qualcomm LCDB regulator driver as module, as it's used on
some devices like the Fairphone 3 and Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 898f4f1d5952..d0869b08a69e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -910,6 +910,7 @@ CONFIG_REGULATOR_SGM3804=y
 CONFIG_REGULATOR_TPS65132=m
 CONFIG_REGULATOR_TPS65219=y
 CONFIG_REGULATOR_VCTRL=m
+CONFIG_REGULATOR_QCOM_LCDB=m
 CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
 CONFIG_RC_DEVICES=y

-- 
2.56.1

