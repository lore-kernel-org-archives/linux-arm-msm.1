Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233FC2EEE92
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314759; cv=none; b=Z3Om+/fYEW5YS8RSE8ZStNiRBwwN77OkZ2ZhrMrlyCtanyZDICeAxeNM5vWcX88O5FLjR1pdKjVkBglqcZ+R3irau7s+7fHRRlgYCw9dMlw3VnOM9vtRedsGjxPoqqAVaaV0bxx+GkDX//9W69duHCZr+d5u6o61QbQT3znCnNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314759; c=relaxed/simple;
	bh=aRikrKedr8rRD84dJqfsSjKHfSLi0ROhZlN789CUbJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9qhSBjwH+5A2JdZ8AY32kNwwuyMDLylLIpn2upvS9ukVWuVB+j8+t0X7bczSMorlwcZsmaCgq9+jIGoWAlJHZSoTiXnI6TM2xocNiaqJimL4o3Lvl8El27grTkiuejYpQ57XulLPHLhfLx5hJ368LE1LYQIABx1OQE1IRZ4iKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzsFfPsS; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzsFfPsS"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso1667933a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314752; x=1787919552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=LzsFfPsSDbh9w2TUgMQkuyXX8Qp5waeEoHCYLzSeyQYzycvE9cFrkuq1xwFub7iMRT
         Nkl34CsP9HgorxIsHBxUYVN56dN7jCmrrQ1n7+xS3Sfy4gP/HdUeV3MEElZw1p1uhzZx
         j0TlzIpXE9TiOsUhAesneh5p/ammSDCyu7qdYOyufZA0Syk2DWEQKhl28g4010DuuYte
         Hj9nlEnjTlPoK3Y9kf2/Obv9VBDD9YOlMwWKu8kDfJhrCZYUZqzDIrpHYobhGC4WMxgf
         InwrgiS7ZtHMxDcof0cUdy3wJOeN0DwL+eHuNcXC6PuEAOvDHY6bkZEnazR6VnS1yKmY
         Zu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314752; x=1787919552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=hcXWeW2HvYTiq0VbNmt7K5hGigaBhqT7UVJug5lLEXAlTygip9cEIQIMgwTAhDLlkh
         2YSqor/erfPcmWOs/aECGo6jTS8qVaAA/b/oal3ygUggdZrKvMabLoX4mxAiH1eKINlr
         rH+aeXPhoc3NgTO9sF2+X9NabW07xB9tVEF0qKiOCSZTP6VVC1tEu53L9UDa5ZByBp2h
         DTkh7tZ4qcuowaWhTExBuVVvcKF3h4YL79RsPrA9ohM/AwcflAK0uGxmZ5YfyPTPd/4n
         kOqTDHZOzEF8bD9wKf7OR6aWOfrPC9bZ7hAPJkT8QU76h39dSeJpiTlIXRlbtRCiFpgD
         oV4A==
X-Gm-Message-State: AFuF++lg/LkUkTtTZYP4S6Ld7IfNsqpzCBCX1SqC4atqAXdG1XDUfJo7
	kmlYdqLcUE9oL7skIGfSzjTVrIb6TOtUqHw8FctXh25dxKAR2mNhiuGv
X-Gm-Gg: AR+sD13znIEhTuWKruFcX94+NV1o2zrXzKPODeulgrjkSLYJ+96Fxi6ZbMNcOLxLspq
	rUA0vkCM1RHduAlkyce58Zj76dHcSg0/EqEej29Y2+glEk+85SJZ7Sb5y7CqdGRdULxOww8LRqM
	GebcQ5XJUEgm0K21MnOzYQ3kRHrlBh3pbLCmKM9MjlbkAh8i/omxjm1ABjPGRaiv1+mNblSaOlT
	9wEVkYhpe3Qi0uKx15WTwLAsrSRlIUze9MPbmur6l+62tcfG9WpCw81dha2l0b7daP9dIKPLjfj
	+mNt78Wibp3VZ2Yuqopw7v7fZtEQfE6lBawiOoXHm6Ail8FOsWa77uvpPd8wif/SdWA7WqQYFAp
	Jaa9P5yEXV4sIUvQjgjPmyDgQ73EJqJFzY6JklfdeSa7HuBxc5KOW6bDOvbTGva9uwBdv+ciNVO
	OIz95qZ8IyaI243Y1m/otrCFanJcsdRkFNntBUrqWQR8obCvAYk7uW/wlziipGMg9uftA8Kt4n/
	YdrtW9rXpwcEb9nuQqZFNFP5Ys=
X-Received: by 2002:a05:6938:a090:20b0:c21:2c32:e2e6 with SMTP id a640c23a62f3a-c246a60cfe4mr460289966b.10.1787314752276;
        Fri, 21 Aug 2026 05:19:12 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d9df9sm447823866b.1.2026.08.21.05.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:11 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:19:05 +0200
Subject: [PATCH v4 6/7] dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v4-6-7ab02c0d4eb9@gmail.com>
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

Add compatible for Xiaomi Redmi 9T NFC codename lemon which is one
of variants of Xiaomi Citrus lineup based on Snapdragon 662 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 68542f76df30..5363efadd4ee 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,lemon
           - const: qcom,sm6115
 
       - items:

-- 
2.55.0

