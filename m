Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAED4CA294
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828678; cv=none; b=PtiWl5ngLnV93wFSOEsn2HLWNJTPOX1rsn+LKYsB342HdZY3hCDgMtLuX1hFK9dl5FqaAbhRFr8xtXjOrAUY/NS2UVwK4G3xPhiR8UeHj+UsVJfJ4icuXFm5mWVqIcoz9RTrLnmekFtujszvr5T2EoGd5NOEPKz94OqDn8PSPl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828678; c=relaxed/simple;
	bh=ke74GPjOiVdcLhuz3rtphO6+a7fMHTX5+RkRMzBMbnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdBZb9J/n0RmZB7+SFN7go7BQ1gH25eYq277hl3wsfpwmQXmBNjeYhnSB+uDM332Ma085jo2QJgMZL0ckwl6AKqaB1qMXBTAg0OD1QktdWjuhGxYW+PU59BlfR4p0y4b+YPr7cm1015dqfKRgW4EQ1L9brM9DmTQnA2twTjyPKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=v9fHjtOC; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="v9fHjtOC"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3250185a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791828674; x=1792433474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+lZKGmObmd47/Y9rOiwVSAJPnc99rNMg+8rnP10wQQ=;
        b=v9fHjtOChy4q/9OnQ73899fI/4sfIG/BLv7pBMW/RI5vsbLtIqqPCq/T+lmdVlphrw
         CGKKZYEycK/5zuZlbbTiOcqc+6xNwbLsp4VRxxNXpvSSJfS0akjLAHd6nV99mZN/v9O5
         K/8qz3syslxy8Bm99kGmKmS3rHqbASCcAeKRhLYMrdqfsZgfmSziL0uiuevGbAcZb1c9
         VNjqPvJFve0tq0w2v0Z9g7A9Sebna0BHeM7qcOe2zDDSLsNh3PPMyhRphrBvGkylWsrS
         LYeKfWK55sfmgf06pSShB7lqhIvGxrsmYRBVGaZin1F3BGEriCgmomQSWelIsmrDFN8F
         3DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828674; x=1792433474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+lZKGmObmd47/Y9rOiwVSAJPnc99rNMg+8rnP10wQQ=;
        b=qV7jhvsNkSZihxIPZC8HV25kCilLZalN4fR9THgf0q5Vx2yev7LkecwY1gwcga2AcX
         u/yoWQrsw4QT9+EoQLnYFd6IvAE6i0eHuZusL49JpQ3cPoFec+P3G16oPFatEcEBRD2Z
         ehxBLLy7tdeSSl4UXcbReXpbsUY169FEPiAJDFjz75tK7PlElFLqKz+n1T1Ey9rD2v1i
         Z0YifE7bHHUPs4sKXG5Mo79hs+t7iXatenrIM/QSz32+kzt0pRJLT9jG4lnSrUzUebpv
         YlAfNCHBn0nqu4hzSzNKw3FwmnfRX8W2o2kp+E5zgbUGb+kgJu3AZC1vKY+Tbpb1yVLH
         +GDg==
X-Forwarded-Encrypted: i=1; AKwUvBzXn4rxwXIlovdOJuYbmLxim0X6JIzFvtxotkwZO98SyJm92BdiUbgXvHcCLHTAjPbOhTLnDg0RR8bqvu79@vger.kernel.org
X-Gm-Message-State: AFq9FYJAF3DgPlS/s1hEiI6X5+uExaW8kwuvS5mb54PXNin2zvLPLNdQ
	k1SZ3It7/BRaPVtvBO4BGaSKrxQfCPzbgWAO/94GZkx00PNNFuoQnHlAOUFxsNB0p98=
X-Gm-Gg: AYBFou10rSAwzflyCJY8d+nB1z+PdsllyhF+s71AjYno2ptMIm9Q7ZDwP+MyNVY4nCl
	KgJ2WlihwLDvJvQAMvBhK3Wo3ThU2xuHjJ2oJHgGaGndh2fsh+G1uV0oi4vpn2+PWu4wRHPRQHN
	Zj5rf0+aSl2YIUKDdc4LYACO7I40jY70TcfuClaRzX42nlUZecNHI69H+jHlo1UhFg4y+b7C7hk
	1E1EQMAdhHTR9l0OycC1qhjrIo+zPAoieM+tUT6PF7RXOmXPh2Q4qDkuXG9cX/Q6feYMnrzxvR/
	i4Seef4NB5OWS4Ci7+GSbHSR2VH6ho/LbJ3bsKAmqIwFXKvJzSFVZQpRKWnZf0qIGJNJ2LWBK3Q
	pBCXV8m0eH7eoXuYieAsRUzE9mi0w34fsH7H7DGcGI9Rtkwn0tKL2M1G1xvnLeUzbYc3cpp3U1T
	WQifsQy8dOhTmjFil2L+O6EC5nPfdhHp49bPAKLh5FyiApLt8UdRQ5FBRhjL7Q1rl5JLYw8jTiv
	RR4FmqJcohxoboNH6jBix1KwzwB9cIQWLDcoTsC3vMlBpCKRM/VINxA8mVa5wZ0hXfLOqYINQXM
	2dcSTB3CieFDIxmtFAo=
X-Received: by 2002:a17:907:9690:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c31a9a3361fmr925645566b.6.1791828674339;
        Mon, 12 Oct 2026 11:11:14 -0700 (PDT)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm498415466b.70.2026.10.12.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:11:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Oct 2026 20:11:04 +0200
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add Samsung Galaxy Book2 Go
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-book2go-v1-2-7188e7ea7a15@fairphone.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791828669; l=1131;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DuXzIQSun3W9jTWkn0omnZ8RlHXkIOkrEU0r1GCIViY=;
 b=oxiEWLGe3H8pzO7bcR/tz+NQOoZwruYk7HCL2vpDG8HwyoDuSCTZdpze9SQqgYW2Wkw1J2FDY
 U1pxGlyB9J1DKCDaaTZsaiNK+mo0vI89+6A63YfyKvYFP379CuXN+2U
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Luca Weiss <luca@lucaweiss.eu>

The Samsung Galaxy Book2 Go is a laptop with a Snapdragon 7c+ Gen 3 SoC
(SC7280).

It appears to exist in three variants:

  NP340XNAA-EXP:
    4GB RAM + 128GB UFS, WiFi-only (NP340XNA-KA1UK)

  NP345XNAA-EXP:
    4GB RAM + 128GB UFS, 5G (NP345XNA-KA1UK)
    8GB RAM + 256GB UFS, 5G (NP345XNA-KA2UK)

The internal code name is Hermes2-14.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..5048e878b7ca 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -887,6 +887,11 @@ properties:
           - const: google,zombie-sku514
           - const: qcom,sc7280
 
+      - items:
+          - enum:
+              - samsung,galaxy-book2-go
+          - const: qcom,sc7280
+
       - items:
           - enum:
               - lenovo,flex-5g

-- 
2.56.0

