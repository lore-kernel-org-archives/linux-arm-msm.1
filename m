Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EBC40096A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218971; cv=none; b=suNvNrYqTnGItbX50zIYDY0KR8Rw7W50iK1eF07tspkNmsDlPhSBmfDnX/YMIqqAjFpjJmDCf2aiHpXCpdUh7mYCtBr+62PFnywGgcj1ecmkPLe/v7ZB1/GLwbCR6aIKzLoXbiPvnyLtX3wrTxmuFy9DpsTz1tHms/0H3F7e1cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218971; c=relaxed/simple;
	bh=GtU3BwmWr5r04fdNMr2P/dLekVQQQO6qKHal+CTJ5SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hRmA4GfOUh9lup+4Uxp8Hq0CKndFidRWC48BkspLMVxLBknlDm4X7sqSvg4pur3P8YmtE9YFW7y9T7HkgXgjMIavcgckcIR7m4YsRrU7h3XLu6BEGTceCS3ktQbWRBsBhSq4I1sY6+Yt7jpFeDNhpT75JN9Nf34AxwhEDkWEHvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CM5d9LGB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CM5d9LGB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1143312f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218962; x=1787823762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=CM5d9LGBNnoOLGIelkhbE8DCaEqrbzoXekzeZNmuovnTSzU5eKGG7fU1QrnLyQx8RF
         6awIQQ6L0ly1N7czyIKur5Q/L9Y167uNPqaUVaNHWHtf8as/t47eYRo+cgr6y45jzBn7
         PUCocDwP6bUX92vluTph7926eCdXTSeh/qApGimNuf51TnuVqJ3I07QJYQKActhQfO4T
         1+oT9B26cPpgD42k/CDymak8f2SebW8rKapUtvJOrbP08i8e/B0MvXCHdR+tSkgDiPYA
         cKMxjDJeGlEYdx/xfu93JharKI1I6lMz34qmO3JtpeJTNaxssz+yBTT0T2Sr9pQAYPI7
         Jnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218962; x=1787823762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=M38WyiFpjD+Yn+FSIIUlBG5VqpYr01RaLQ5U/DDtB0msc5KJTA6hCBq3SQ8WTh+IsN
         zGrrfNjUP6imBDF5k5kqLmiN69v/gXGtQmiXFqIS8TpZtplCbWtpZHNgbDaIugWrcomA
         tkmoAd9Rg8scaqGFKxF5ZbPTGkiwvz9AM6Rro/IzCRmKEUkMTDavyztb2m9OC5kxfZuL
         xwNA+jeVZpdulbDVE2GjWSg7DzGsYnCTtxOf32RTS0eTMGS20zt9uSM55WkXrPICoQse
         HYT7lNAJKnJoIJi+/IF3QXCZ1izQPu8uzV4OXvfQD5msSrSbccrHkSC3YSw0c8HAcef9
         yBHw==
X-Gm-Message-State: AFuF++mNf45qrc2NhjY2g4XLZkDe3JNWC9TQ+0spY+/qhuScbx596pQC
	bng3f9vvzcqwabgn8Vgr6rFlyk+5g2eb6CUtlSmNXxhfBvJaPE6VqtHm
X-Gm-Gg: AR+sD10hwWlYg9m93Xc/cO+Wn8frk8IMMY43Hneqv7tvFaiW0ec8eLVQWD7iwpU5vg7
	pYf+svBHFMgP1hdBv1rvGB0pQgOTwtaRz9m/WZk+Z6ZQyy3tz+ZBEBa9oewwWG3nCFWoabRjfWL
	H9LEXZ1o/sjUH6PXegM0mtf+9FxcIycS5lK9fSDSC4dEcYAzvmQXtbcf6WM6nw+5PQZViV8Y60i
	UlUxUhtj8Sdv3TkU602I/nMJYa8pcVvwe3cJOEnPWOBVLSJdIAIuV+bJzGelYIF50ll5DU62KhF
	3ZMFt5SzUdGjEF0jKVDd2Jd2fQZ/jri3DQIm96rVC6ariJ9jpKuX/JUr8Rr+kpNVLVGAgs52Tlc
	1xcDUkDz7eZFCInDuH5Ks8PGa5lGXwMhiPIMadPCco/xVGdYdMlL6WhbwocA1UE8b07Lm7X30cS
	fPerI5/VMM9/4xtl0r4U7kxHDhz4X0+pw58y2rwmwKUgiRZfRQaMTZP4DHmENU9Gs9MeBcwBos2
	P6AxBhlL86XZ/Mq+Ikjw/iiCOe/VkKlQRQ=
X-Received: by 2002:a05:6000:4610:b0:481:5276:e4e3 with SMTP id ffacd0b85a97d-482b1fe2fc1mr21405564f8f.19.1787218962119;
        Thu, 20 Aug 2026 02:42:42 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm11788090f8f.6.2026.08.20.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:42:41 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Thu, 20 Aug 2026 11:42:25 +0200
Subject: [PATCH v2 2/7] dt-bindings: arm: qcom: Document Motorola Moto One
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-next-patches-v2-2-7130d68183d9@gmail.com>
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
In-Reply-To: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
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

