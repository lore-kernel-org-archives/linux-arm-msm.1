Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98961CD1E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314760; cv=none; b=qQemZa/ZXHEwvG5Vb4oEsDoLPBuvez0F4YRkE2woAeXcEW8IOTQf4W4WaAwtALE9h6VAvlKMP2kufnuMILlySzvI094Za+ocP6VvgTeVL4BzePy+goyCqShwHIIP2HWtCFzjJbKwwENH55KGl77s7GqmKPTd3NmtmIjAZxOX4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314760; c=relaxed/simple;
	bh=240qChyaHcgAIrUoo9v0o8NSZCJsliQZCuzI/589blE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXbfG0cKOGljAZJ1GRA+s2xekcjQ7Ko7me8fOBqCDUroHZVnVzihRnGh0GTirRGQLVewvjMc9zijZShDbCCWVz8DYJsq0yFawsvYwEXBlI7Xptl3UZYZZLI+3G919wD6nb0GbohvId1NJxJhNs5Pfn1Ylq/0A/kLjpXhY8QxIts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i51hH9GB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i51hH9GB"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so112758266b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314750; x=1787919550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=i51hH9GBG06UAbjcFvvZoKxpUF1WLaz0xGL9Xsyb00KffgvLfmJ5ZvT6YO+gXLCcM+
         FZmxAtHq9MTZo+QEje49vThdm01JPhjsFzqiuu1+57EnToI7WX27sYFX6vt21JmN1OEK
         Qc0js+WBkskdM3YXyh04Km7ZkIfgEFVThcNINyX9/RyAaMXBgOBy81X9LhpWTGvYFM4n
         iP2iNtAjGYE95bUDMkiaNHyQ/rr5qktaT9uL9WJo5toYUc6Q5iGSH/fo11Q1SBdPc2HP
         lPz/CmJR4VVUV3D3TZSVARZcD/X6YMRFEYRlsQwqDMpDl6d7OiCb6jO9dZosAfwj0Y4p
         mi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314750; x=1787919550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=RsXgLdxB2jDNZOnQRYNPl38kadGD0WZ3UIi5zTQuA816TRHF165nhh5qMMs33cf3fZ
         6vxUcsHFvJs3SpEsLud/SbGJhG+F1pjqcU+JPPiUi08ItodxRH+bemIhNJMYs3WTwj2x
         P/MH+/iN4tv4LC06stiHDsi98UeGfCzxbsRVnzXT+hJ5+8krEgAk5oBMnGmPgcax4yTm
         k0rLTAklqDZ+CMUqTnoP3bDGqyyQsDcwkwT673E33QVJ/0J7lOaSaBcbf0Rg/gI/lJqL
         3EglCIj2sRPEabX1iv8zqOxjdDqXmCbDAIcXsIJkA6oYLy/t7hvto/lVNvO6Th4og9uT
         GdgA==
X-Gm-Message-State: AFuF++lmo5koKCK5WMVPkvVyFn+Pvpx13HyfpCEy6vjKbPscRvr9oMtn
	6Ifp1YKfVIeiqG1eqnqpEN4l7RKUD1t1fa7VvYXsrk9dBVxCO5CO0XDz
X-Gm-Gg: AR+sD10BzG0nAFA2B3wHYjDq8YVJ823IF/UkYk5402eNsUlZ9aS+ZKJwSWI2W8I5IT6
	EMC2EIYPenBkJkK0SzvLqaaP0s6fh7w1eammROgWv4KL+fSM1L9hZW0wkRxu8xct9hPhEK0Swd7
	Jg7qIx36B3UiVM9Q8jD1VSfdM0w3piefH/mA4BfO38ZJF7D1IxkQsqv2j2YWCQZeRmtlHrmKpC1
	83mwcsNL8CRYg5Jofd3IJNgJ0KlyKY2gMEidRnHiU3icCMLSC++M5T6KQUNQtCr80aYzE9+EWdx
	KQUZ+tl+MLWy+W22eZ1jx2nsVSyCmDvvgrOstWyk5Eczax2QkCZRn51LTnWQPpUuXgF5Mh9iGCB
	ZP+zrhMMsJs6OJRq/1F9F58SiWcBv5K1Nr22WUH5mlx/pL5nIe8YHfKvIF609CXDIgl41mT2Wcp
	aM9QQFURYW6u4YiUrj3J/BJbRGfzdjQAgTZLl+pXaogmARGpoXmhPQRiK5ym9EfbuyJ6vhf9jZK
	KFUu3DyBn+NXu7DiU6zWc7q0DhFq4PeDKp6Xg==
X-Received: by 2002:a17:907:948b:b0:c16:6a42:c7d6 with SMTP id a640c23a62f3a-c246a346d3amr601838866b.9.1787314749730;
        Fri, 21 Aug 2026 05:19:09 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d9df9sm447823866b.1.2026.08.21.05.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:09 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:19:03 +0200
Subject: [PATCH v4 4/7] dt-bindings: arm: qcom: Document LeEco Le2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v4-4-7ab02c0d4eb9@gmail.com>
References: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
In-Reply-To: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
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

Add compatible for LeEco Le2 codename s2 based on Snapdragon 652 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 289a3de1d24b..68542f76df30 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -348,6 +348,7 @@ properties:
 
       - items:
           - enum:
+              - leeco,s2
               - longcheer,l9360
           - const: qcom,msm8976
 

-- 
2.55.0

