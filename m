Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD6E411672
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228416; cv=none; b=TqrXggZ9azyG6k8myy+F15/rDQdOYFKpenzMqU4RGcv6G6uSVtcXh3kXA3pVyL/u34wa5u3CHIXPOuSs/S+xBx1UBjjDeWXs1dN9Ud3O8SGxzyJOldWQ71L1+5PqNkc4dpjWY1fOwaQu6dW+LV5/bY2m1ARwb4JnRpmig976KJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228416; c=relaxed/simple;
	bh=64LksHE57zQ59yaAnFWACzwMnsWqJv/u11tLSoS5Bmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsko7A/F1dlU3WunaUVWMxcMiaRnIkIXUZ1+Gl5isbyru7oN/4kurVaxYRfORkds3mw7kex0BbkzpCn8BMl7apcm7g8c97O9hnUviPY3glHYnslWUssf0Qm1FT+D3ataDV+Y4SdmELyqim7rGUJ7PBR/f5Wg2pOrmAIXny7GFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rogeywlz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rogeywlz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954d29264cso17852985e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228413; x=1785833213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2ehHA2W929S4EjVW2VVMOxqZvmr0eF0aGzWm5jM38A=;
        b=Rogeywlzm9+7qBioS/5NqPBEOLrTY7V7QSDFzc4wsfdxKoWDE4s4W/8/mJnUzqsZ4E
         zfWYz8i4MvMslP47ldwsj3p8oZJS/5iZ8dKJ8GfSeCxcBhl7/YAWN8EIQiOi9DmcVgKC
         ASanP2OX8M7ov+rWcmSr8Y8J6GQ2QEWRA1J2z2IdIE3OY0146rmN44H2KQ89JACV0zhH
         zOczqP6sAKh+7fIyq5pStKF14hlBHMRy2KLVT1qOtGHO1jKKTRtXjiYEeVqV/hRvl5+o
         /a/Lhg2R/VXN9rZbbtj4qrvBhhiYdOy+SxmtjVm5nciFLEF5hfzd/qA+s9/xfu1GbSz1
         7jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228413; x=1785833213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2ehHA2W929S4EjVW2VVMOxqZvmr0eF0aGzWm5jM38A=;
        b=cMALh9LNMUnglGwBtui8u2ebpX7PfE5Cop8zTCyyyI06lcMxKw6OtbApmRioYlIx04
         Zgwf8X3GOnHGzLVmgIJZZCmSR16SeCEHoucYWvSz7HOiGubznCvovcxQ9eU7MiD5UINH
         TAjPrZpF/e/IeYeV94LK6QTsf0kbUaXugzGMt+8+d3RwAdlVuRKwRAw5lu3/CSkqXHYO
         2VgG62dTA7xvtlSQT/wA26i5quIezBnvRIXtDprym/cmmLrEUqcs4pY6wt6CPYJrKoF4
         ohwvIaJaQOmZf5KAijFE7Jl6obWOkYN+Uhwc0tKYs+qQ+V6J44fhOo+kPb3w8ler+SUn
         pFow==
X-Forwarded-Encrypted: i=1; AHgh+Rrbns1kfleiqipcwuucC5DApPHRcEbYJZs1JrSZ49ZT1xNsTjbOLkNc6usQ5Yed+lZ6Pmznfg22i/LkI9+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyAGGAlUiG/7rX89R19AvHbL21uBaA7qp2SX6bv+hsF00YS68jo
	lGt+aE7uDJrI8AoTvmkIqCgdkI6Xnfaba8aKBAj6KizdUaFhRJnvxYAhc/RZ+Tcoefs=
X-Gm-Gg: AR+sD11sfz+sBHE72x372GqEq01GajAuz0bY5eW4bBnpyE5KEtR19EctEWK/wwIXD7t
	UOMS0AgnsgZYIcfK2Gy1GUVVUVzZLw700hPUQN/m7e/BIbWMrJBD2u3v8W8b5rPys3IGxCbyYRW
	GGJ3XvNhZExFcL/FWSu3DjanRR8kOJk7GqRajHXwtbif/sMjyuiEjtdbwMU0na51UbQ9jYAp3o5
	uGqMZIV0RfNLkNtTgx388Xj+32vHRw+lBtnDPzsexCj6kx6buXtDHbr6aETLnqAIJkET2Ya27Og
	DyvKDwYMZEIvy9SUnPUyZIXgb9vSuNBwDxCBG7QbAAQaTCo8AsZSRfN5puAB9shNhRhjWRjEbww
	HEHynGO/AO9pltsOTil1WBqMZJYyrbeZtCzJm+psOHtqtwIA6q55mllNIegRslmWOfmPPik4s2U
	7SElBYP+z2uwGEB/rQH0UprlM=
X-Received: by 2002:a05:600c:5291:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-496c6592c7amr12910135e9.36.1785228412564;
        Tue, 28 Jul 2026 01:46:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm64658175e9.15.2026.07.28.01.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:46:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 10:46:44 +0200
Subject: [PATCH v3 2/3] ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket
 S2 sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-2-b29f44720178@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=981;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=64LksHE57zQ59yaAnFWACzwMnsWqJv/u11tLSoS5Bmg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaGx5ehiYh97tVm5Fwv2QY2xNcVdo5ILxbrrf3SIS
 JMPdb1OJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhseQAKCRB33NvayMhJ0fQVD/
 95C0r7mQ0bv57c+6QnN6rXOUVGcQEY4SSxriI+0LmAk0RB5L0JMyNa/bZajH1ou5lZ29xbpo8EVadu
 WQCphUOYviRlZsEEwkDKYAkTK8n7XCyGudoCOdhR/zjyAF3Ag/WM4rTQLL+k/DMxALQhwhyU1euTcL
 s6YDGjslSelgDww9+y8vzFqfl1Jo8nTKLYrN3zcyEU1kylrBkWn93falxazC0rvWb90yxco7rNJX7+
 xbS21bb/E1Ry9L6ip+EfTRYgu/+gLMQMF2V+1oegzU9wiH75VywB3zSVc0OMBlORtqo1Fd72dSYG2v
 qbemi1W26Euwo34ala7qreAgWXu8qlNWhV7g3l4EujVT58+FVmUrmFaUf73TLlY1Db8ekPc4VV5K1N
 l1kP1IvXec39kOv17pvb5oOUDnmk3oEB/YQ2pTaSkAQ/L/dVJAf6OyzPSiU424aHT0bP+F3BCAzWXT
 PJOZFDF538+Beug3rRCzG0zEgBM3+Drq+k7g9xVjV8EXiuKx+EWp0+h9D+eyzInplbDqdSlICZjuAh
 qjCcG+ZybIkRlvSAASUCpY1FxazUDewbo2kiKq0NjI8qtVltSmKfgFU1ZCyPaQyAP3GgIijy75FZ05
 qrfzHdWOFnMWXdgR77DhCEsIDkAmFuUqBvfmpt4v9D0c5blWMOFqDmspyN7w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the bindings for the sound card on the Ayaneo Pocket S2
which uses the special speaker connection incompatible with
the default SM8650 sound card.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index bd5f5a6268a3..0998b2abd8bb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - ayaneo,pocket-s2-sndcard
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard

-- 
2.34.1

