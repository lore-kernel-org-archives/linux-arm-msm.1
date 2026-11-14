Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645014;
	b=i8yrR91BweyZQ7lfBkvRmInKkVyhBY+1xtlaCKDXjSaoeS/2hfDy6Vx3GnHUv67wYSio
	 ZC3xLfe8gfIx05uSOnKythoYhyaKHIyrAfDgwqWCdYKma8VHWZ6KPrhb4Ho8GfYKIWkmq
	 i4EdYs1eHT9yQJ8FgHJK9+fTw3pwD06n2phyAUape9x9o66OI/eaVTpsk++Os7bV9rdXu
	 ejS7xJeebsiwT0EHZtkzZZMllp7ZxuU6Xz7hYZG7mqnoBQH0PIjlcFHZPgVjZ93kORagx
	 20iy6C9n9o3XapSaImTU2p4/MQtOjF6FZsoBRQ5QUBjveGfQEFKIDBgoGpbVNQmSxkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
	b=mQ95Sfv38Dg68Ge7kR3uFOJzLpJCVUaawf35/I/pSKsopVtHnjtw1goigtJ/MfMEfkTG
	 /Q2dskKbR1EWfLK3O5V3M9pREexzNp+/IK6g5gvNhRCTgSGdp5NJ1OgEA+u3NoYz/mXUJ
	 2V4crLvpDpd9MsQPfx8JVoX9ZGiSWmiO4sf3DhRMhHyZWBmBr8S0qEf38pysnQ5fGhZWO
	 0fTu//HWgKf69u3qxDgO5RbaB2zV+oGbLg8l7sKz82kHcgZbDWjFMTlWKFXBYT2UirllL
	 OxD+1OlM70f4fxcYNkWpkER5qiWngurZRAD82cfZCvvCfEFx19h0kSUIIy8nTkGOASQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1cNDI6m;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9800D606A33E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9800D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1cNDI6m
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so820183f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 00:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645013; x=1795249813; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
        b=l1cNDI6maJQghXoN5Bi3lRgzuojcOPv/fbKoo6wB7B4ANNCwdsmC1uDJGvRWeh+8Or
         RczhXvtEz7U2aEfXDHYHHb100veeL5CTuQgmKX1Ahgpy7/Iy+myvw5N8OG46JM7KQZq/
         6yOBt95prApmoYTfLzMf0TpHbSdwEXR1SSUnEvVJBEUHvkhiezddLe0hYD48Q4w7a+a2
         QlLp35R69SBgrBQd/m7x+VYQdUd3iEwhsiSN/8nMNuxExrvVmAJLutWH8lzjW16BN1YT
         brJ3a0A2uD2PK5qVBbtyqFMYT0yheWw30f2Q9bto0taHAZoJ2qihB1W2jC+IeF9Kd15X
         MtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645013; x=1795249813;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=87OUlDLdiPl8LEjQWIrube4poxJsANmReia1ITL8LaE=;
        b=AwFcHs4VTtxKpHQij4z7B9tlGQbqDS94SB/hr0Xfj0pozv9I9fjB68dhIts/ZNgye9
         ym3p3p01Q3nM4dRsqNiB2LM//KqM4hurq8NiY7fOYm3v14U68HRdPyuIJUOgEf7aOKOL
         29g7WBoCo0EfB4Q3MKxVZJYLAz0iqdprzotcjMIhpOmd3kUuEwRVL93faqHypW1I2+7+
         MMQeF7gdbGwckexVmaNADaOPd/zfHAUZVn1MtAPd70+uX92Yiu4JJHOd5t4WDer6zWR5
         YdXApbhLQu7xzjNqELehE+RmAOnxlSQx5QKy7nKoUgqn1n8KAVlw+aA7kEsQoXZ7XBLr
         P4gg==
X-Forwarded-Encrypted: i=1; AL+hErHlVU7htQBIlxjbAkv2iBuLfQsuMaZquTzIRnDO1eT7hNM1AVSUoD1vdgV/k2A+948go84allapdOrNTfH5@vger.kernel.org
X-Gm-Message-State: APuU4Z8t7xPpXDITsbDbn0Oddi8akZnDU6qIfjSZeVNW7lEoBk+p+g9R
	DMbcv5I/rh7GWF5DVJWeHwenLEwYzh3+nZAjaVdoy2k8/MTEZreTEOMl
X-Gm-Gg: AYBFou09ETPNebXfQQ6gE0Lk9zBTj0zF5qNm8ra02S+hOlkYvFRe1Dc32iJoKeT81P2
	CFxwY94gG7L7eFXvHTFID/UVuj8f02YlBTfwABjqQipWgPAh5WrtcgAjAEgOheS+Zpl35TlVJV9
	RO0WgDNYYQApqeTRMSSYIY58i2zQpOgY6Fl1XQ7lZM3+jqgi8Blu1GT/Wmjt08yawJtad6NWd/j
	LcdYxptNeu0rYTwl5BiNs7aTulqkb/h82gbskh1vy2NnkqSWFMTPxroKTlVsHCNX+K+nUCmDzIw
	QpKXGVuPjX1KjzI1IEwcXI49VPBuzAcQ5VCemkKxwWbO6lZE8iujuqFOuF+32/rLlBD54jHb+Px
	K9mjta2hXUppUiBkvyLgiKrS0H0zpHwjLzNIEBVtfMPdMcDWRSJK7DSf9ui3cw3VesDWNcZdVBv
	f37BX5H6MM0GxOxPmZFMKyt9dqQMAAxVOLm0mkcBSptOXS0g4OemuTSTiDMBd4NdhgwFVx0HwO0
	4pYj40cQTd6TH5EWkD+XVdOREYdz+ivPCc11Uq7eZ1lwkcd66pm
X-Received: by 2002:a5d:64c3:0:b0:490:1358:2265 with SMTP id ffacd0b85a97d-49c72ab09fdmr11144513f8f.34.1794645012869;
        Sat, 14 Nov 2026 00:30:12 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:12 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v4 0/3] arm64: dts: qcom: add device tree for Asus Vivobook 16
 X1607QA
Message-ID: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2NCBvZiB0aGUgc2VyaWVzLCBub3cgc2VudCBhcyBhIGZy
ZXNoIHRocmVhZCAodjMgd2FzIHNlbnQgYXMgcmVwbGllcwppbnNpZGUgdGhlIHYyIHRocmVhZCwg
d2hpY2ggbWFkZSBpdCBlYXN5IHRvIG1pc3MgLSBhcG9sb2dpZXMgZm9yIHRoYXQsCmFuZCBmb3Ig
djIgcmVhY2hpbmcgeW91IHdpdGggdGhlIGNvbW1pdCBkZXNjcmlwdGlvbnMgc3RyaXBwZWQgYnkg
bXkKbWFpbCBzZXR1cDsgdGhlIGNvbW1pdHMgdGhlbXNlbHZlcyB3ZXJlIGFsd2F5cyBjb21wbGV0
ZSkuCgpDaGFuZ2VzIHNpbmNlIHYzOgoKLSBEcm9wcGVkIHRoZSBMUEFTUyBtYWNybyAvIFNvdW5k
V2lyZSBjbG9jay1yZXRyeSBwYXRjaCBmb2xsb3dpbmcKICBNYXJrIEJyb3duJ3MgcmV2aWV3LiBU
aGUgZHJpdmVyIGNvcmUgYWxyZWFkeSByZXRyaWdnZXJzIGRlZmVycmVkCiAgcHJvYmUgd2hlbiBz
dXBwbGllcnMgcmVnaXN0ZXIsIGFuZCBhIGJvdW5kZWQgcmV0cnkgbG9vcCBvcGVuLWNvZGVkCiAg
aW4gZml2ZSBkcml2ZXJzIGlzIG5vdCB0aGUgcmlnaHQgZml4LgotIHNvdW5kd2lyZTogdGhlIGNs
a19wcmVwYXJlX2VuYWJsZSgpIGNoZWNrIG5vdyByZXR1cm5zIElSUV9OT05FIGZyb20KICB0aGUg
aW50ZXJydXB0IGhhbmRsZXIgKHRoZSBzdGF0dXMgaXMgbmVpdGhlciByZWFkIG5vciBjbGVhcmVk
IG9uCiAgdGhhdCBwYXRoKSwgY2FycmllcyBGaXhlczogdGFncywgYW5kIHRoZSBydW50aW1lIHJl
c3VtZSBlcnJvciBwYXRoCiAgcmV0dXJucyB0aGUgZXJyb3Igd2l0aG91dCB1bm1hc2tpbmcgdGhl
IGxldmVsLWhpZ2ggd2FrZSBJUlEuCi0gYXJtNjQvZHRzOiBzdHlsZSBjbGVhbnVwcyAtIHN0YXR1
cyBwcm9wZXJ0aWVzIHBsYWNlZCBsYXN0LAogIGFscGhhYmV0aWNhbCBvcmRlcmluZyBvZiBEQUkt
bGluayBzdWJub2RlcywgY29udGludWF0aW9uIGxpbmVzCiAgYWxpZ25lZCB0byA4LWNvbHVtbiB0
YWJzLCBjaGFzc2lzLXR5cGUgbm8gbG9uZ2VyIGR1cGxpY2F0ZWQgZnJvbQogIHRoZSBzaGFyZWQg
ZHRzaS4KLSBUaGUgYmluZGluZ3MgcGF0Y2ggbm93IHVzZXMgdGhlICJkdC1iaW5kaW5nczogYXJt
OiBxY29tOiIgc3ViamVjdAogIHByZWZpeC4KClNlcmllczoKWzEvM10gZHQtYmluZGluZ3M6IGFy
bTogcWNvbTogZG9jdW1lbnQgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsyLzNdIGFybTY0OiBk
dHM6IHFjb206IGFkZCBkZXZpY2UgdHJlZSBmb3IgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsz
LzNdIHNvdW5kd2lyZTogcWNvbTogY2hlY2sgY2xrX3ByZXBhcmVfZW5hYmxlKCkgcmV0dXJuIHZh
bHVlcwoKQmVzdCByZWdhcmRzLApEYW5pZWwgQ2FydGVyCg==
