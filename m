Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215132;
	b=h4lIxjTJ5NOOc8IwGNM0oM+7ZTXurmJis/7sY0LY8RxCXL8BFkmgRo7aZbOrggeQeMav
	 OuiAjDE2gn+zibtQUK1dqnA8Fg73sjqI/CXJ7S0q4YI5zeyQMRwsUX5rlwAtII5272ihS
	 evhZgmGdUewhVgcbUFAIFrV6T9lvzAfb+p8R5vXECLLF9GHL/PcXYHqilroAglsRHFzhD
	 JvGyJ5F8B3HQs4748dqFj2OPgKjHq0Rfpn6oYoGkTNrGXrpnd5ZVYu9ikuaKgI8VuB+NK
	 NETrEhr4DyfdfdrQgQHcHXjca4I4rXpR+fJFN5ZH51HesG+SWlctEg+5D5snMpYK9hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vZ6om9FYtHLuxxt/jURe4tARN2iOgMfaZorU75wv6Q=;
	b=P2CfONa0Wb/wkXD6g24DzvIX+Ng1jt0BOeoQTIVa/m8BG2qF4TIJaOL/ZbGSCLgD29yQ
	 LbjS5oW9J/77v5etMjzt9QBmIZewdj95geDetq/M6vlUTv+uVVV1BDqnOEqsidxw7eesZ
	 mMQIelIpHPcRBWuOth4pmZK6HYemt4CMO55g+Mo9QKd9ePLJqkyTnEdq6/ZP6fj2XWYyP
	 d5qr+ClBQsT8xpmyV0VtgC7DWqWDNeBvCdSfQ1ji708+BynftRAO5con8JDfBvPMsGR2L
	 ToV83o7c1U4inhXGoQ8CB3T1KjSLFsHYiQt6BOlKLeyGNumv/ERAeQiefR4t2FURWQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+RuMQEl;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAF8606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 19:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BAF8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+RuMQEl
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4932b13c4ccso821668fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793215130; x=1793819930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vZ6om9FYtHLuxxt/jURe4tARN2iOgMfaZorU75wv6Q=;
        b=J+RuMQEl+CDTv1rs2v9if+ss4fqRXbOFUOBe2GhOpXnYmU7dtUpjkqOcgPbWfcEwsc
         2xzL4Imz6fjBvp2J477zmWlEOZH6B/DAz+NKXHPQC+Rspn5nAQDRZICCmEmsZ6Pn7Ynr
         cIwMSU1jE926r8CMKTJvIfv9Ga2Y50fEREkdeVEl3pLHRaMjjpflA8cGuFrvoOL75JHh
         xfpk1o0RRm0eMi5kPKOe8qTawIUCfqpA/WT0b6bOKco5C25TzEAfTsfd9ldF62YfiqYk
         7yECTGl5T68dL//nguthVLe5tM02V5NrTOallrtKk6xukvgJvDQ3plPQrdR8nN612JOg
         zC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215130; x=1793819930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vZ6om9FYtHLuxxt/jURe4tARN2iOgMfaZorU75wv6Q=;
        b=hWK0L5pGPfI1dM+8bElymFTv9tA02TIEsbOvKlznWQuzJqUeS0OnB+ay4Ve6KVit+s
         /WNT4jfZuF1LVVxGoZql/i6vz+GtLRyBiJaCw8A76ea9VJxQmLpQcL6qoZsYjU7huzQN
         /OvV47rmCKBxp1j+TjMDYCzXcKiQUmzGscyXoVjajKCtJK4YrD6aQXyEOY6LEj5T6OVG
         FeHLXdP/MGH2UgOcxlTT0JfVZZ64ApGFMrmkANPMFWG50Qzz0V72I0rMl2cuQc7L1Rog
         xGRco2ULs+Ll4pQyOtjVQ+B3K3+kWWurMqB/16CmqFujqhqXMW1kBxS2NmNqR9vCDxp3
         /Whg==
X-Forwarded-Encrypted: i=1; AKwUvBxknmPfSUZmaeBTC0uYeCPcXfhIknW3zo5IIR9IoomlG+W5kOnPB7gL6mt/LSokFwf1uodk9HcB9nhtTFAR@vger.kernel.org
X-Gm-Message-State: AFq9FYJmyy8vUn4oCvriGQmDTy5fxQK4UKUUPBdWZmSx4HbeoDua6zxr
	e1ww/ukF/vH0TrC8+PJvDcxait4Zedo+f9TAl54rrsuQL/EisnWx7CAy
X-Gm-Gg: AYBFou0IYTOIsy7CZn/5CR8qd7Kak67l1/MGyFlQ0tdwfZZDw1FobUVrEBM/6/OBv8f
	Fp+R3GOsnXbzfgEKtXHXI8zov2XajPbr6nJWonhx6iRl1AzrXrgDhEDv9IHwwF/gjtizEjA3msT
	CVrfgRculzvZJrDFhPGEU5UAljo9wEAjGrmlmSAEglGvYtN3PA9KsdjYZfFGPJmv2VIG6jhc4be
	ehfPPrsO8NxRqaR/lF28hmm/NowXdWh1r+GA5aw9GnzlcK8uq/r6CjedBOqJkGe+p1/nxOvLaEC
	2BxnnMCTlpl4eRrfl+RZapnpcKhZJTSf3x6ZQQRBadBcloqOjM0SUfr9QbUJh+RM0L+NLFgFOWX
	7BEEpT131e7wINqg8EcesUnO12BVizdqUNVPJpttEM+YUVwPCEDxJp/jt400moBenRG63i56JeY
	HZbymhjHSzlf9XoN+iGUKGaQJgdcj/OLCNmyoT6ZI9uSycUPBxISXIvanfbTMObN+LAgZYCzdFT
	xoPZMKncnDk3TIaPghq9PYdWkZvhYNnN1jzZpV5VENfpRHlkDn3Vc76cx6V3F483VMo18T7ZX9r
	Zqie9t3bD6zMlB/8MTSaNXyijijURk+F9e9wofrn55i7jRAjdXzljPUz6w==
X-Received: by 2002:a05:6870:f114:b0:49e:7c51:3b19 with SMTP id 586e51a60fabf-4a8bbb059c3mr2712734fac.48.1793215130440;
        Wed, 28 Oct 2026 12:18:50 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:f26:718f:8dc1:b185])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b785d108sm3092916fac.9.2026.10.28.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:18:50 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Wed, 28 Oct 2026 14:17:59 -0500
Message-ID: <20261028191800.27829-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028191800.27829-1-jeff.roach0@gmail.com>
References: <20261028191800.27829-1-jeff.roach0@gmail.com>
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

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..4dd57e8663 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.55.0

