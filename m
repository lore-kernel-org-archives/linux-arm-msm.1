Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660761;
	b=KY/agVpd0oHet9fEF5g2lKq1qPG7KOwpaC7ac6uI1V8XkHhO+0ghEF3G7IjLLDEbaSgM
	 phxqoS0dRL1FkLVrY5CmwUzB10wiFa+gCPrBDvmpOr83jitx1BPK9DPbP5F2xtWFQ1wU0
	 EpLYsd6xDsTomTNKdte7449NyuB+mW7tVEj80eJNdiGCRcphskoZkhF8/OZlmGnhmL6VD
	 tTqZ65TAuZ/Mi4G7NqcVZxgrCmPr5Yr+W+5nDpoZpu+Oblqm9RuO/4bz12y1y8OQytaqg
	 izbv6rfoW9X8ft6MLq8FtC/rW6PnqmqjuFqpKerO1Sb1I1xjX1wvUkLANkJ3hYvveNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XmLU67b9anSH351lrdK4RsIBICbIuOZ+JS/MULhXqf8=;
	b=jSYT7kvx+CNgXnWv1Ea1zJMxr63u+zkCINgGMSo3N/RsqYVct6oh0vOSq4OeMlOvriNt
	 BjsVtVHll2FvzjC0ET/gTL6dxAuq0UzRZ9Dxa3LRgTCPzJIQa+jgiPk1GACOz4rZP4CDY
	 6OhL/k2DFYLBMGOR7nuCQbv4hiS/y6yQU9msFUiEWwJRibPJwRxVbpxymDxbvSX7LwBru
	 TxoaVEgITNlpAqm6ic4a1CaG9W4S4AI7bX3mx+YzxKO1ZvFv2TuB/HHXmICXRBxXmfYQk
	 4305D1zj2EdhQqP4/rfEZ3DEMPNxBIM/7D5XOsCW1xTLlzca8RzNV3Irxp9E/gtFgJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=eerU79Dn;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F4606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393F4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=eerU79Dn
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c43373ae89aso240455366b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660759; x=1793265559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmLU67b9anSH351lrdK4RsIBICbIuOZ+JS/MULhXqf8=;
        b=eerU79DnBIXSgkNX9XH5RvEx6v2IJwgHnx6cLavomh9+/x0S0S/nzMd/T8E7dX5dGX
         bbtHQZvIpitzL0W2/wWvPZYaE1stMzV+29nM+scZxGiDqIbP5ct3kZMfLVmGdvgsDGAM
         qTXoO594N5NrexjsKhZU+5ozQ1D0AepRPEgqXRUE0d6jdwLDQjge3ObyOjSciuomQF18
         NLTywnjVXikcxzX/HLHwQNIfxSfEmelm2GR/sVxIWNlqOA+t18EL2+jjjEEblZ+i0g+V
         ec31CyLmK5pVAGSaUmSO0UeJTDfwc7hSoqr19PSe4vB87eSLN8ud7gV8Zm4TIBkK17r4
         imTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660759; x=1793265559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmLU67b9anSH351lrdK4RsIBICbIuOZ+JS/MULhXqf8=;
        b=Y1bctKCdBSqVySD2XM83f8m0pNTnl6RyfrPA2LEH4IQnkMw1f3/gt7ZroUHlJTt8jf
         IoXWuNkkl5WIvK14f8qZG9YD+YrXr/f9X3QgzRQu1OLifGoKlPkUa4EgCj6LwetZxWol
         ZWdWNzbj7VssJtflVeJqwJkxxTD1n0b60YiGAXfSQst3MWOK2zg6HJ3GqbkfO3ccQCYU
         2Rt8Yrw/fZDtfWzdF44LMc2hustJ1n26aGYCtAd/APdPZuYVKIfS8ETjL9vQ/9IM7M31
         m+7eCxL0B3FRoY3JWzGm/TkSbQAdvHesQXYtY0eTxdRyqv3e0lX3DMAXww2OtLqibNS3
         21DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdbelhUN/Z4Btn4xefd57tFVIFmRxC4cJpjkgYTwbPRY8xowKfSAuBXsH4imZAhLr9WZAFef9ORjZJkMTj@vger.kernel.org
X-Gm-Message-State: AFq9FYLGUaH7GfuLHvg31ajZBr+B5O338Q5/jtdj3HkMU0f9lon49It1
	82e1IRgWzB425+U7vi++Zf5XB/5Lfu60V07yw0UbpY7WcOM9w/oR4OyXeVkS/J0omU0=
X-Gm-Gg: AYBFou3QrGkLeoYhchyvZOyNA8t396keHOiczh0sz1+VFx4dew6ZDorgCl5QZ6XTG1f
	rqGmEnKgTBunIN3pi3DQtYa40HBUbW7TwBI241lDuPIbllky7LAHzhCntKI+AzzmrqiLbvzPUpS
	SWFUOco9qs8xtYEEhdieYslSyKUj2dkyBYescdAXsgTvwx41jE+ilqoA4t1FqZnaeLIjCUlsNEd
	Xoqgzf7YSPxJnPS5Sm8yZrncyeTXZ9KJWGYW0Rk9HvbvzLnDZBUyRYkZufKrZooEBgbDV9EooRK
	bw4fEvnFMLgLmaDjLukuLWTkAekHRq9fSHNdhlY8+YwF/TrAXP/AqPGojToNLRRpGLrzBZZGUP2
	sDIPNZw6IypTMEcVa5qFTyn7HkTNs2mar1i/E+zDtE080zV3SzgNSwOKYfUhLrN6oBjUogQQrGX
	SQ188zdcTQ9DQg2rsHZsljL7XNqPR4nEt4hSiN0YFO7sCcC45sa74X8Uez/OfB/j4g5c0Cciy3m
	dNizAQE8VQE1zugR5KrSYvCY/am1ovu96Z1NQD47SUoGIkDYEhF/JOytXRZvTxzEU/syLq7rIUa
	sw6RiSaqtMPo5k/+XNVjUctkV+t4qT5iecY2tci+Lw3ZePuffMkYBht0kg9PJpyZ12h/skYzXt4
	DezMsA8rKTIQu8t00M9TpuB34gk85tuGjSSayMUfWef20sF2hT4+sJPJ5xmiTWtY5Hiq1
X-Received: by 2002:a17:907:9711:b0:c2e:6498:5bb7 with SMTP id a640c23a62f3a-c46796bb426mr444488566b.31.1792660758671;
        Thu, 22 Oct 2026 02:19:18 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:18 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 22 Oct 2026 11:19:15 +0200
Subject: [PATCH v3 1/4] dt-bindings: input: Add compatibility for Awinic
 AW8695
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
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-1-ac8c14377e82@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=1075;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=zMc7fnFtbUBSVjfmEWHaUyV/0ui2OWBr6T8F5VhNG4U=;
 b=VeVZAjOe4nh9A7LEj+L1Elp95Otpjsl/9uITlARbofk85O4zyU4uaNHE2dHFfXgq0BYw4byC4
 4vmCiqOGmW7D8nLkwe/t/3Aex4MoT4fYW6/E2SJVdNGCJp19WAcmA9T
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the AW8695 haptic driver to the binding documentation for the
AW86927 and AW86938, as this binding needs the same properties.

They are not compatible though, because the chip identification works
differently compared to the 86927/86938

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index bd74b81488f61d72b675b5701b321b30b3430be0..58908ac4ca7964f63e392050aff5e15e836983f5 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -12,7 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: awinic,aw86927
+      - enum:
+          - awinic,aw8695
+          - awinic,aw86927
       - items:
           - enum:
               - awinic,aw86938

-- 
2.43.0

