Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774797;
	b=U4ah/4ROGkDXC6LrLNFra5pC/tYicyyOq0JGVtCrKj49PfPpuDd5GI8B3SGNbQin9uoK
	 jL+4lrO32nj9f53zwjn0xXRJS8GIew6EjV71F+t7d7JXv8Cva2SbERv5i9+4FfcNCl4jd
	 2/4F1mcn5ayzJlLxW1oPOyylSVFtePa6HKyhvNTQGwwD9WEOhHwOhT+6zsh4vEPmQnlGw
	 p0hzuqc7YcfSjnEZ2d9618Vg9cI+wwBPBY4kIYinaHwrQQaGHoFU4rA0v06ISB91XPDuG
	 1Krl17GBkh7ozyiYzyLTcU1zxdXyEW/o2+HA0BzpdHm7OkeBT5rLxqQf0SkvQyWFuLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JD/8S1hfnM9Z/Fu9PrdvyUkvMuukiV7OkczTcOPnYA0=;
	b=bk/ET+fZ3oJkOTF0ywsX0m6G91IFY5YBIr3DYe6R40Bh0FmavmfX5bizEnvfHYQo1FRb
	 hKy3IerY2IL0WnImgdAGyfLRnho8K9M5b57MmS5fIizNfoSbBZH3Dnovb0mzGTXmkDo1E
	 06s1FPFiB1lz0/u3PFUXKfJPXolu/vwrWo/lx5AR2X2YXDDb2sEHpPDUL0/CqhEd6soSt
	 SMa2C0MoFU2xPoPm7Vs8X3zz10MB+q9svX9meVSGrRBX1WK6DlMbwrQqEm28KmgqwwZ88
	 9yhpa6iI207qY2yajlcvkvRwgHLA0zofg4IWR2hRkZZppWNIQhOUiQBHeU8Hotdv5Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvA85MNq;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46678606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46678606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvA85MNq
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdeaea71717so138542a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774796; x=1796379596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JD/8S1hfnM9Z/Fu9PrdvyUkvMuukiV7OkczTcOPnYA0=;
        b=NvA85MNqgC+85EtwyYvCDH4OGd/uwaZ8MUbQWKXarQyjTM947h49ZWERDozg20HM0m
         MhPckKt2TdDDDheJlyIsbhfI2vhUzTb90mxBVCRrK1cU9c3u8BLfs6sfXuXmkj1aN8cO
         Ic2MLr+UOkCHwdkumSVphgICYVVDFk+6iLN5Ry7w2aJTdwA8cQn4Q6MJnJon6AyFo9tQ
         B2qpN38mfsEa6wp9k5jPexM9UDU2Vj1DCquolnvoV55uQ/CVnv0HpdvJOxEt7LUR1iop
         GaimAVWh8pqIdB/r5k+a+yS7KA8yK6LJKksMEPUVlEQXLV4gZiFxki2GPgt1hoSsRnt7
         A3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774796; x=1796379596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JD/8S1hfnM9Z/Fu9PrdvyUkvMuukiV7OkczTcOPnYA0=;
        b=OHoB+e33hs58i1JWOkOlpttGt2K++QOBxxxQHicwGc1liL939tCLvecjpDnLKCQK3h
         qb+bZf/P6TA7r8Nf2Ngi8cLM7T+mI5lCFettRwjweSRIsnTdZS4nycFS8uN0yianLwAT
         VQi3/vKVdlGnNtotmdPJP30NeaNQtVoSdDqCRoSoVccZ3HeRlkUuhGquQCTbhiXNzYyr
         l3BFjYvfsoqFGRIy3/m1j2ywCwazR0b2OEn9/Vl8FtysrsZnwq1Ks0fO7mBKcKMvxyhM
         zjJe8GuCP5+9TIjHw9vJTfffG4xxT9hdWDBUG3As6Pn2HQgDJ96DrbFsm93PqvtW5DK4
         Ce8w==
X-Forwarded-Encrypted: i=1; AL+hErFdRIZ9lBNmOsu94Cdl19Jz04cQtDdh7BVCqmfxUf0q3UFTIQY7kxCTZ/75rPSsw+gYKfLFPiLNJflA4zsI@vger.kernel.org
X-Gm-Message-State: APuU4Z87A9HCPsVFVU+BZJs0BJsmdPaq6cHSUHu3og1xFkcwIf+6lRzL
	iiU4wYTsNT0xzVPZqdxCu8YffebLv8AiVCQi6Ssd1rFdDOTf7L/tnjdf
X-Gm-Gg: AZFdTZcdFmYCaQTZUzYDkZEOg9D4YlBu51frvYDELejNAr6wi2bP5I2vJDf4Y9HV3R5
	fTzcnmQatUR0cdleIQUca/mcF0prcTz9SnZKo9zULH2oEK4LqHXnV4P964LnwmtiHBQejfNtcPg
	jMznqtWUBHO2GwZlSNZyPRv/a+DurKJ6sDG2huiW26vtwm2KEzDaoZvIGKBYL9zEPtwPdtBEd5D
	EiFN43TWkEb+hl8RDvbrHkGpM0M+7fXAYXX/8Pc0zf198MmCUOCMIi6zMXE2UyWKi8NVIb5V5ih
	DcPs3TKKvyYYNNfyGStIcKLMDcvY2PKVYaF5htwzYMjIWiO8ph6W32jg2JxPIkGfIq0RANH17N7
	+aiTGQ/DcR38Wu9k3L0XRVvaPr3J4wFk/zpBdH6s+b61LHk5S2QIi7BjLOTDe2kKOIzbU5xj6SS
	OKl8GqQdYnmXUFC3Fi6XAq1Wa7w6bC0cptgn6kkT8fAcpS28ncC+hfe+w4wyS//tI6HYhChcioO
	DnheKmbPYrnVqUkm7mpvun+uIVRzYfSgIZzxSRRIJuUHCjvI4jkgohydQgSV8YhL94lAKlso698
	uTLPXBtm9ON02nm2Vx1drcTB2G4YiLvCZA==
X-Received: by 2002:a17:903:4586:b0:2f0:3cbf:743d with SMTP id d9443c01a7336-2f03f16db29mr376499135ad.4.1795774796573;
        Fri, 27 Nov 2026 02:19:56 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm107807105ad.39.2026.11.27.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:19:56 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianhua Lu <lujianhua000@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi elish panel variants
Date: Fri, 27 Nov 2026 18:19:19 +0800
Message-ID: <20261127101942.3215633-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
References: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
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

The Xiaomi Mi Pad 5 Pro (elish) is available with either a BOE or a CSOT
display panel. Document a board compatible for each variant so firmware
can distinguish the corresponding device trees.

Keep xiaomi,elish as a fallback in the panel-specific compatible lists
and replace the generic-only entry with the two panel variants.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

Changes in v2:
- Remove xiaomi,elish from the generic SM8250 enum, as suggested by
  Jianhua Lu.
- Add a Xiaomi Mi Pad 5 Pro description to the Elish entry, as suggested
  by Jianhua Lu.

 Documentation/devicetree/bindings/arm/qcom.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a7157795870cd..badf99e92d321 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1188,10 +1188,17 @@ properties:
               - samsung,x1q
               - sony,pdx203-generic
               - sony,pdx206-generic
-              - xiaomi,elish
               - xiaomi,pipa
           - const: qcom,sm8250
 
+      - description: Xiaomi Mi Pad 5 Pro
+        items:
+          - enum:
+              - xiaomi,elish-boe
+              - xiaomi,elish-csot
+          - const: xiaomi,elish
+          - const: qcom,sm8250
+
       - items:
           - enum:
               - microsoft,surface-duo2
-- 
2.47.3

