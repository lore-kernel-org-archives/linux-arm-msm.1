Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C61944605D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433444; cv=none; b=iUw8rp6tmPpA+pZjtTXg5SZJQA/MnzgOj4rIxyJiimW7SYkOPiJSQptaKpuebITxg5STqnFXEkSjD2cuwOAchRHnKxLEc3bnMNnxjzkeVYjeNw6AV0Sh4VBlgF+vQl/uif0oIfj3yLRSTC9OcH2lqqSI5cGkzNo+tXmq/Buz0bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433444; c=relaxed/simple;
	bh=xIwj2Le0TpWbMARAcv8JqZtSzDIeB/XmE+9Gn/+ByA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpCCSmXsVg2WTOclZG9VAE75WUb92i1eW8rD6MLWFb3r7FoqNWBcnZeIwbrG2jRa8CJZ3ckTspYgreLFTtMMZ7MK2fCav6QIkYr2DDaY1AXoP1RyvOR7CIkK+yYSPYGyaICHIETEndqJ/ZZdyiRdVbVcF1oXLDwwFkdwsfQu7pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwEVT4nm; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwEVT4nm"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c05dcdf49so490571cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433442; x=1786038242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xuBnm7QqIPf+z6oBGCxObqPUzyYY2G0Zr/94wsQKS4=;
        b=cwEVT4nmUyAB27wodEVJVR+VsUaStiSAP2ys3Smfts8bETYus/qfmXA0eac5FC0HJj
         LpZSkrB2eNfOAT+KwpUyH4A0vMUuyMmZyuS9HSdobV/GEj4dpINONxHd8KTgM5AnXYs5
         DU/cvTtbo6HNSih//Iva1mLBTJf0slHS5XtqxXhimOwLDZBX4l4VNDDoE/2GMfWxnuI+
         Zn0dHgBuSxIn4t95/FyqPKCIMLiRy/3SI9nRlF8lk4UAG4U7hHoWuVC6N5v/0Cr1h3BD
         uvXh/NpBtNSwEEjPgjIqnFWgt8fFXgap/7r2JoVDVlBSNfXudw8yBBtEG9uv3SsWW5/X
         2xDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433442; x=1786038242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xuBnm7QqIPf+z6oBGCxObqPUzyYY2G0Zr/94wsQKS4=;
        b=k6Ad2jaC6TCeNI/EIT5TK/RtXkuLzASBLPCzPtzP8qQ31lSLr50CzTZjqYg3U66KRz
         N6VkHtBmAYFKSEuAOaoZArM3QvWYJ6e97gczis24c0JcG/pBnEjHFKUOApylb+ZCKl5Y
         qs/kufL6AcUzGY3HAHMy2oKjLZk4EM2F/FXKxUMGKETkijNX7SeGDv26qxh9z8EMaogC
         c/LIkdnJjcGxqHVVZSb/vPoEgdQBIQmiYtRw8+nl/24DZCKaUs+p4UzUPm1iWZsYDcT/
         K/XxNFikC3gV/THggOPtypWy7pxnebgdqICSoMZGjbH4MOABMRu7PpQ9xYN53UUZbqCF
         BF9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rof8a7QKU2b4u0k0pxZC23z1WO1s3+1rKaKFSa3eDeYoUq1QiTREnbDizdTlxhy5yjxQfJ9ZOX29aw5bKy5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Pw//vnfhR50wrif5ape9st7FXg8dHt/imjswTdUBQ7ggzKOZ
	FX6Qr1E9S4FUbaHYhNxkxvsqKQWsfmjkSy/oA/Ovey9FNCnoViNO2EPg
X-Gm-Gg: AR+sD11QU2kAD8BdplDRHHf6tpunnTa5dyTG4VrXqsF8cpPAf4AeKByTxzwjJ7n1jFM
	Nzcj3gwfEXQ59xUO3eSpC2oPAK7b9AXcmJfk/Pod4SyW4ptk2dQVoir0wRUKBlHrxbUO2ceEJp/
	JU0Kt3XeDonLCBDYRPdxKLSH2LtTqMM6Rvd8A0dKVphqJVJ5Do0op65+iwm+V1oi4CphlBwyIuB
	hZfJEDUNlEwt8uzeiH2rYwsMKM2tLIzTifA8UlaX+/sh1xOTccZ3BxU/kfj7/5QNyWKDl6b/6Rc
	yxwjqn4D94lJvF1egkiU/BGflVySP9qbaTqCTJICpijEGD5PzHEBHBOVNI4OXcf7kRhdGii5hgq
	YPtT05FKN/2fAS2kLINLReLySgvjoO7KzV/uaCndtQt1L/f8CBeaY0/nB/Pcn5tdJGBrrrA7Mo1
	DtzCfqsE8RftJGDlIUxT3vwJbJa8shqYpXu/PSFxr0Whl1nkvAr9Cs1p/l/AU=
X-Received: by 2002:a05:622a:248f:b0:51c:1590:8e13 with SMTP id d75a77b69052e-52b38387effmr41392961cf.4.1785433442087;
        Thu, 30 Jul 2026 10:44:02 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2d8251asm45437341cf.19.2026.07.30.10.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:01 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Thu, 30 Jul 2026 13:43:39 -0400
Message-ID: <20260730174353.108023-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.55.0

