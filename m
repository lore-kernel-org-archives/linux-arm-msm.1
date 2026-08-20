Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14CD4028CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218976; cv=none; b=RAl6zFDYcu8czbpqhse0gQ3ClEKPF3KGJhu0Zm2/D13Z17vmawifte1d/Rikd3VUQukhC38Hj6QsB9B/B0jxKmb4iTOni2YMeruv8mMmnazeWe5/bCEDz5nIuwsXaEnLl3cZ1KEsjAKZXeHW3EdqpRcZsmH7SUMFkBdH4d2KtrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218976; c=relaxed/simple;
	bh=240qChyaHcgAIrUoo9v0o8NSZCJsliQZCuzI/589blE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cC6gx7mGclfyyDyhNnylAH5vIj7UzAqnKktFjiXA37SVJiEyobm9LY/fhWNpL5Zs8X0bjZg/EHp9QXYA70fBjMny7UFjTAlGTi2Cb30dAF9si66ZKn2cOvWAPCSmeypiGo4R6Yc+cIPfz9FmQ4uozxsZMMQDl9dTLZfSWIenCgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1BnZDy/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1BnZDy/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f84023916so1929414f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218964; x=1787823764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=F1BnZDy/m6QsJN21F+BsPLH5g2sdxl9F/dRomTXbK7efUQikhc7OQpFvYHRcMQspBr
         mZkHd3ibHRzVnQ0/pwAOj3b1byJoOakKoJZ4Ze1hAAEkTzZrC/l7PXxZrmfTnuhU0jvG
         DM+0KpPfzqtekh1UrxZgNXk0IY945yn8LrMQNmtMoJVsSw6dvRlXy89fjS4muV2fU2PK
         BhGh2wDG38/6j+NTjmDla8J3Z2mVDkdlxt25pJv5y64XB5R3lifMcg4N8bDMt6bZoGsA
         a34/7MmFv8SDJWMEnx0aGVCCFRhUFrF+SvBRk9pQEiR0TcxvTcRaAxcUkDv/ilrQ7k17
         LJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218964; x=1787823764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=neXALKgIPT0rUNWxa1mqzXGbgJQcvVkrR3q/lkeSSa8=;
        b=Mk3u6hAin2w0JqMiZu6+vOG28PEFwaYH+TulrUYX9Mq/1OB3yIiw6PLyfdGiD4BCdH
         Sase1E0DVnQ2gITCvA3fFuRhEhDBJXmnEqCjOviCd2tgUTh1dWSCiS4kqinSrKgbrvti
         xrH7AkddQtffCkU8/Lak3D3eda/oH4hK98QVC8YRjRwTGehxHYPqGHw2jqklIjOPDgYk
         BWNon+v3AS0FYFY3ut8I1Q21rWAl3G3VQqtB7MwcUvuG4+LSizkNdETmB4OsXfhWAD8k
         W1Icl78+goHOqDsn/9YK++Z3wSaT9JSdHdybn7QiFoNMHVOGZOTdsAQee8NC6zXsQF2Q
         FIxg==
X-Gm-Message-State: AFuF++nXgirg4mdmP/irPDQjtVhnAxUak0EMkd6Q8oUOdZ7shghz0Wh3
	9nosm0PE9tMqZWoQoO3tcoVUAOJVDDRWGWElOupa5HlB5A/VETR1DKaQ
X-Gm-Gg: AR+sD11JHND2grrMr0MhO6gu7Fp/Lt23M+xwnoNbOwrCalMleOEhykIHGtYmrpZDs7p
	hjTjKgpSMBex7y26fxskp9ORon1I2zXxZNRbcykI7WdJVRN0dZZqom6yrr8DiI/Jj/RtI7kZazP
	SxHqPJqi61FQ9FMeSo06sw8Ff9qJd5sYC/DzXyGcXw26M/oBDqYTMswDtmvD/ndO73lLhSCCfG6
	ph+HKbd3l7ckMnXFAJ9HpHaKx+81VpgNKr5i3978/RNWx8ybcSgG0ZHIij550N2L1ho/NiF0r1Y
	Fov5Y4tvq+ROuJB4Ia5MshzFHxGGKVDSW64RunWzUi2EYQeCalNL6YF8GfGo3DpIPIuI3jhZjZ7
	dydd7P0sxRC/QnWoenJsKizbK5JcQmmj26WVtEg9rDwLjPooctuynVOIyDv1L68+RHzupHPXGfj
	aw10WfErsxNWujnENscxPnrJcjptXN53NYZgSNdxiEuPWnM0Jq+89AAWEUjK+Pc880k2c4mreHo
	Rp5dtloDoqYouLlHTAu74qt
X-Received: by 2002:a05:6000:715:b0:481:57f7:6015 with SMTP id ffacd0b85a97d-482b1e96130mr22568820f8f.6.1787218964416;
        Thu, 20 Aug 2026 02:42:44 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm11788090f8f.6.2026.08.20.02.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:42:44 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Thu, 20 Aug 2026 11:42:27 +0200
Subject: [PATCH v2 4/7] dt-bindings: arm: qcom: Document LeEco Le2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-next-patches-v2-4-7130d68183d9@gmail.com>
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

