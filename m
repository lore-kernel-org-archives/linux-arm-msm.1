Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E816C472542
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315242; cv=none; b=lmGRqut18Al1DpZsbmvvK7NCE0eJtEW1XkkzGXwwEoc3gL9XjFmK/xm+yicQMr5fYnz+pszgcYEzWtH2s+RmpbSlM1DHFLa1aqJFoXl50Z9/Um83cbcaKIERIK1IvkltpHPtp6ZuBOtAkLthDlgCJtz6XdQ6vFbDs8rsUBIyCBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315242; c=relaxed/simple;
	bh=240qChyaHcgAIrUoo9v0o8NSZCJsliQZCuzI/589blE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjyeOgQ0AnPzd8sirqjL07jKHBcem7vmOYYiKeno6LIBqqCxueDgRO/7RscJyPfOhDj7/nes4pO+cag4RVT09cuRRgJM9+xbIjc3YKurLAJcw6YphSMVgBSKqJvaVzrhzpxC2G8iejwTO7csdOnMzKED+G4BkIN+dtz59IzmqKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XH/9Tvh3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XH/9Tvh3"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so151976866b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315233; x=1787920033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=XH/9Tvh3RWq8sKp5i+CXjg9SrCLI94lPXmaccvma2tqxjlMegRtSo3m/C96kzQ2SPZ
         V3Qs6EsR6zbj4v1OfNq0ZaUB3KFKjITxYzqX5z3KrZeuSh9lEmy0lnVRYGpm1JSvcyWV
         G2qmLWVRHCJDsID7iRbgAMMdZ55kgyjvy6XkhHSNxCwQEemw6PusaJr4gj6XUlmg9Jh0
         Aek1N/0A3itkQt1TOvMihV/x+ZqgLzA7IGCh3/BlvtNNW5wfhT7cwdaKhg9luHIqveJT
         LoCxeehDUiaYOYaTvxNiaiHSbqfDslFDDdajRjV8NInZpRluGiB58Rg53YXTENr/ItBa
         Eb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315233; x=1787920033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=EOG4F6izxGUspuniLFHW7P/dOkIrFz+9Cus9gfZdIyiauW7vDSCKsWBI6VZo4WJM9o
         NpdBlcMTTQtjP5hVWag5sCAc6Pey9053shj1oAiSUCa9U8uVXTC4ZhhqZKmZcwgwlLwj
         AMay+dchQcvW1aSdmk839gfp6XiBV/VYRkPr9MjpLTA/UY2zmIEA41qVnLwiThHeaKtk
         mUmysmsWX4qATmclh5DM/57VVhnSyVCCzOdHFTEal6KtteD3TH8ksy7p491Mafx7UaK1
         rvfiAKkp9IRhTJ4UVH49ZK+PrshDqasG+rnHP0vnbFLa5TsVXIAYYjU5w/M01qMUZXTV
         YHGA==
X-Gm-Message-State: AFuF++m5d2CcFy22JSq1u5/iejWSyLwnu9Rt0HS6EXlNeiuoMm5R6RW5
	Y+i9I0l2tuSsxXLaNiSj9vxOdxRNB5Iib/VRTJxJqIJrSy5K/q6j4D3F
X-Gm-Gg: AR+sD1285F/V88QeC7iXzSFwq5jZv+yADPlDboblW5/+gw2YcKI1RAABYCxeMOEavsQ
	ZMPu0szU0pFgYNusTOGSDL4CHAaKY32eAWKurpYg/8dPYzJuWP+MP2JBzL3PX3I6anu3/yxgoiz
	2bSdO7IWKJBTue83lXLINQu5vU+IHhwNMpoGHNEQWd0KoBJOOp2Dh1yXzy7Ee+g3PPEFlLTeqVM
	3ueqd1FqozJRPWKc2wd636eiy7kxXO6eaaT+BLS52dShQJ27RMSSkHtUP3f2zNzxbrWv1tcrk7a
	yPmUEFizhKFMlr2C/Pj4TXfzaSrvB+tD4vnGDWNkTW5OQt5DLCaPlJ5J1sy1KomwYKX5EM84+XA
	L5WthXsD+Oyfts7nBEiXSyxy0ErTFR5XWJl1viyEqFBMfye91ZBgDo5GWNkgDJIYZ2XWMfGalBx
	Jeyy10EttocevszFQ4W9voKWfgl6TjBFZAgK4MWGt19KMYuNCkbZtA999vlX0G47J6SaX4q10SN
	R44Rmnr/8rca+e/B2HVM9PL96o=
X-Received: by 2002:a17:907:8dcf:b0:c20:2d38:e518 with SMTP id a640c23a62f3a-c246a3080c5mr730710566b.2.1787315232715;
        Fri, 21 Aug 2026 05:27:12 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c315dsm6220262a12.9.2026.08.21.05.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:27:12 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:27:03 +0200
Subject: [PATCH v5 4/7] dt-bindings: arm: qcom: Document LeEco Le2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v5-4-ec81cee63e09@gmail.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
In-Reply-To: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
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

