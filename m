Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D12E39A04D
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312209; cv=none; b=BTaWg8pUjsKo6kMNyuqd7bHQPjVC2e4TVpSf47ZWbYlgngQod9NVzx0SoAShvgHgpxtzSR72vcJzLg0gZ0Nqpr01EfInrfm78UDSXt24CFprga6zfoc3jUaZK7uwmbiR7fSKhzxI1QbVYWYM2N9mRaw6YtRuOSC/KAKWCedfJ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312209; c=relaxed/simple;
	bh=GtU3BwmWr5r04fdNMr2P/dLekVQQQO6qKHal+CTJ5SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H25J08H57fajxeEGu047ltY17Ez3/fiwzrNGQDaf1r3P8xK7Wto0wGl7p14kExoz3oJkPl3OB1N09T67yISXz2SmESFbWpZJqkVRs/XHAa93JgIdjPBYDmdjDNxcyP4V9DhcuJnko/jxH08XdDFnVlaq5NpAeWe0Sgr4wtFtqSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cY1BR8Ow; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cY1BR8Ow"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1714346a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312206; x=1787917006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=cY1BR8OwL7JRO+eF0OsNMGYgpnT0+gX5pyB49TKjGotM+IcT43LYWnjSWVU2pYXBwl
         +Ykjo867/GzDLZT+L8bOjInFel1BjgH71NRZvBjs8dLXOIEoc5UFx6p+dJlo01wQDn/2
         3zb5ZWP0v6Lrgo+73hhvAaRe0Gnsjr0dzNv27mmRWvSL8xICuePf5DkmgczeHdRGZcPi
         YWOQfXzO8g/eWIMgeMdx8BAcNIDPLo5KMDh/BzAiiTnnFjfVPZ5ztV8FJzUA+aFhPrgD
         fd/Nsi68T85WrDndghAUFyEp0ggVWwbIzQbsxJtGCz2iziajM0H/QMUqnjC13QA32LaB
         QIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312206; x=1787917006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=U86/t5OrqURHaVYlVFgoHpuwqjyQJ8BKHKuk0FumjnqmCOUM5kjSPKfMMZW5csRq5p
         dPooHZr7S5nhQ0qKTV9q+jJGqkggF2TeAsqFqlYKhD6Tt/Ma+OdlMbscfldvj+Hqeeqf
         WyNojH+JDrum8AjBbDWDhcUj2dvif2PSpgllTWFz4lWz/2PPbIVjsEV2ykb3kAzlmJJb
         sDHLGTZ4Tfmt/lmAfALc31tZpN1O8x/xve85we/DMYAqW7hD7y/0hKwRihSym9wGNjof
         wAkhXogufOOkqxkWTg8qb+i6cwqj9ud1Mk8oVrNNZCNRRe0M5m9pU4yaxsNiWoeuwrW2
         cl+A==
X-Gm-Message-State: AFuF++lvYFY7mP/Tn8DCeixpDaumt6FriNvfTtLx20vg+S8n8SXo1D6a
	MMCwr4JvGNRQekWFxBxOVPLv2SNZy0mLax93KQuE/iH9RO4HMxIP5oeE
X-Gm-Gg: AR+sD11yRhJ592XL4R911DnQusuPgpJ3hyVCa1uuSMttXImLfIIDc+p0oUFaXsiCYj4
	NooVQy8cC5XJOAL3fzXACY3zs4RH4qjXWWSKHEIR6NRx9er4f8BVgd3HF3xXJHY9apn4CMaTL1L
	DtLqR0SP9mWCJn2alFX8mLRLKj/AhXRuhgGnk/F+cy2DLUrpBjCjjd6IKUlmlzQUqSq3dSNumLU
	/bRH11QSJpi2FhQJF6dX/F+0InYoHyE6dUZMab4IeWdoSncgnvnVb6GMqw4nf298Q13KUotOALd
	vEXI8rPotbm2GV4PGseZb0QACt9/koQYlUrXwR6kBQVnMU0IlwU4NNjNRC4+DyOEZRFaRuqgjvp
	qJBb+FQq0Fl8ecm+wiQ6cUhVphGokLVjf8pyyyytaI7CRwyIuqQSArwohKRBE61vB1wLbhYXiGj
	2B1qLrLpKfIu8zNPSRlklu1rkXysLgeZbO8MmXBdkJgUxWSoQmT6VakEIwGzIVVIjKEUaIlPQiu
	+Wx8gsgFw+LhaMsUPhziPGBNqUc2rscVJU=
X-Received: by 2002:a05:6402:3818:b0:6a4:cc9:c8f0 with SMTP id 4fb4d7f45d1cf-6a42f16302bmr6103267a12.1.1787312206351;
        Fri, 21 Aug 2026 04:36:46 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c3491sm6204661a12.10.2026.08.21.04.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:36:45 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 13:36:29 +0200
Subject: [PATCH v3 2/7] dt-bindings: arm: qcom: Document Motorola Moto One
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v3-2-cd64bcef6e21@gmail.com>
References: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
In-Reply-To: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for Motorola Moto One(deen) based on Snapdragon 625 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..289a3de1d24b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -292,6 +292,7 @@ properties:
       - items:
           - enum:
               - flipkart,rimob
+              - motorola,deen
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.55.0

