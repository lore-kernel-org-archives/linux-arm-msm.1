Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096492;
	b=pMar9mmqDJzq0DO7lOyqif++RXc0lYkF0JcTUb5I2wjsN1J7ZGYhhi9hzul9oXfGh2GQ
	 WNJ0tJ6puCJ2JAi7ZqqiKq5FQ17jiRvCycVxx5MbWd+R2l6CYtBzUvIruc9s7wVvOAJZ6
	 1jFxKYSqsNZLBDK83uqHvwYQ3k7GZvoTwowzSRjQY6A0G5fxZv807CxMg4tsZiKCvDpO6
	 iQADFsc6vliAVuvl+VWvQJho/58BgFoCXhXjlvLR5NA20KdbRj71cZsUStQ1ok+r24j2f
	 AXrUTXwgvXWiyrd2U2SoImzGlyq+McTgdEp80JBpdB1itPu1WmLiDX8dJo7Zl5AyBZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fppy/ckcexGy49EMxxyWk/oBKj2HMd7yOzhiBjOklOQ=;
	b=e+NvqgVtLWtce5pIlJnhJODOjLouteV7ONgYM2E4h2bBDkaaI3ph2T8r636nEM0sQCYB
	 33rz1KyobBnwajR5C3UwRHYWOrFPThdL4fGHYYyVUE6HCGz4iI33Su9jQN88E1/7hva5F
	 Pbir87B+EHBvRa2Y2IBlAM4mGJe5TV/qwfQT04NSBXufAKucCL2fbyX0+0ngvCyqS25Zx
	 GszfH2XcmTq410DcanUy7yq57BeVcOGhkMuub8av1GScYWdxDiDsV2+YTKwDXKHn5cDBf
	 kBzN8OmCjzzI+W0HH74er0i0mZ388iizgMLEkshNCpM8yUPbvjYa6C8FCI/OkWcWYmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=w3utJXtL;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341D4606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 13:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341D4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=w3utJXtL
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso305701966b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795096490; x=1795701290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fppy/ckcexGy49EMxxyWk/oBKj2HMd7yOzhiBjOklOQ=;
        b=w3utJXtLjz8WlviGNw3pKMT/CGBNJtTtd3syRAvsHEgRWi+Ay4c1Ka+9b6f+wbiEJx
         7IpjqMsocZCGnSjjoqSBYrwD9Yffb9b55gQQDz0ihTZxWkwIwJfZjEDWOzkuaDjHdT4S
         Jco1rvwu9lQHIC+W2qA84dhIdpKsMJ44GhKrMAzlY3ztooZndFXS3SaPE/w3kXMA0kID
         RR7xHoJWUQmpqX89CMDEoH2k6f+kmA0h2XC1G1vNuPxcjd9aV6swEG1BgvDyqOax+gsH
         9RbQRwM5ccTGbAGBNAMq3FC4bTa74zbqy022X0IW5gKuJUGr1hL58PJlRJgXWQh6+PYF
         RU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096490; x=1795701290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fppy/ckcexGy49EMxxyWk/oBKj2HMd7yOzhiBjOklOQ=;
        b=2RUPaHGcCLutJ0TS6iWUGpwJJ/BWipxCM2rlsX4gJqOZzIw1wEGDViD08ItSohym0F
         BU9im7odPU5F7GPAe/xzRbo6CSkXFddLV64XGSjHave2tkKPXRnNpv/PMoOf7tnW6B6/
         l15KxjJVv7bUUsXcBDJ9OLOsNPRvmZ2l0jKeKxycIbS9oHAaV+3HuYfdELIn2Au7g96o
         zDY6Og1dF5+Y5BzljpE2RJL9ZgTHXIDJG5jnE/H1j2UVdu+8EVbo0fDiG3F6cWCcgFEM
         J2b+Qxm7Hu8hBmEo8SN52aux286neW3xsYaVDHx5YWVCQj0KZEKHZC5+3P+7D/6rypTe
         blWw==
X-Forwarded-Encrypted: i=1; AL+hErGpaeiGFSuuudULwO7ocuJImTy6hqLGRAiWv4Z43QMTHbqoBLAbDanNSvb/Lh59BvWmtxW64dFoFHVg03Ox@vger.kernel.org
X-Gm-Message-State: APuU4Z9tVrpOydK4PgiB7QVsdKlWtIwhItT+yzC2yTMnGX5vaFkJiPqq
	EfEcDuvKAdf4SuhCc9pR1p0et7v00akqOy5xVg45a1A0jqpXiMi9Hhy9+91QbkxXuEE=
X-Gm-Gg: AYBFou2rohrx94CrM1hXlPg2JKpEMfZ+4TqQulIV74z7XbWVI2gBbwee9c9VC2TZupv
	qznfA4FhOURHoffrCBuUgi+oJVaEoQGVoltE/ezxaruUqie/fTetaOUQlPja5m/0pEaO/Trbr0t
	Z7rQBHei2+F5+kjaij764XJ/lgd5+uckAOPv7PxZwifz6VbuVyQfRveLCbfjXMJZOr031lqGwtK
	ZGbK5XSvwYKpZvdfVVmbqlP5a1lFfjWBQZTBeUjHG6LMXdRBo7Esi0IoKrKFGkwLFo/3oUXRhxU
	LqThGKaMvvEEOnsZvP3t/bgl6DKyWE+0/XzTQ313SCXtOkDPJevIp0O0O52aoDFyZKBM+S3rV5w
	8/T3E6jv1BJo4FwG55ssf8cEDT/B/nv4bnZ1fDx2gNjn0N0cfrU9Yok246n8AUQSsdIu9izYDrh
	oG8gHaUYqBxm5GI2YYlusUGml1fiCi4fepwF4gXLEU2+CjwKDrcdO1ShyC9LvUeQyxNCPgZCYpW
	ynFIywnOkVVJOA+kz5+ZfU58KQh95LWOGm/jD4BIhGQJc2hTRJMB+N/T3zdQYqkweBKrhKULGBd
	elH+pxskMpRjvKt5JKRzq85m12QfWlNPzcoOxuYIu2deuqbOhM15vbxLErhzwgnbTkO7HjoKQ0T
	QAx6nuvv6MMNK7Q2/NwKK3+UQP/+ONe107Q==
X-Received: by 2002:a17:907:3d8b:b0:c50:5005:8ecf with SMTP id a640c23a62f3a-c510e0e8be4mr548781466b.8.1795096490646;
        Thu, 19 Nov 2026 05:54:50 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm106820266b.21.2026.11.19.05.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:54:50 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 14:54:48 +0100
Subject: [PATCH v4 4/4] MAINTAINERS: add entry for AWINIC haptic driver
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
Message-Id: <20261119-aw8695_haptic_fp4_driver-v4-4-9d107334bdb2@fairphone.com>
References: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
In-Reply-To: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795096488; l=946;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=vimJ88gDAgrMbKiMPhlbLbM+XfYfImQrayboZz/gmXs=;
 b=4iAQ8jRN9EaanqlLNr+Mw6FTdAkGkFADKZfYNJu5jVU+OembBmy98dT8T5qtsaAlN2MVt79oH
 Bp09DN3IME5BvmwdcoH622KkaqIrLWbMaEzyCRu7Tl61FprnnvWFwBt
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
index ca1c59e1fc5928b361a63e0b7fca6e95308ab8b4..f138ef76fc5cb611fd56bf1d2bd808985a4567e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4541,6 +4541,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
 F:	drivers/video/backlight/aw99706.c
 
+AWINIC HAPTIC DRIVERS
+M:	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+F:	drivers/input/misc/aw869*.c
+
 AXENTIA ARM DEVICES
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Orphan

-- 
2.43.0

