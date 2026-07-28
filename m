Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A3C41F360
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231354; cv=none; b=mhbBe71Q79cnMIcdz4sakPXVIDoUxp1v7fMdK+dRE/DJgLME4JQfv+PNadh3Cu6ndLUAAVUJDrRI65uR2hyIaYqBnhYXbXGtz/A59PiI2f484MpVqioSdaMPPayzmTV2vgrJle/+KM1HsZ5eJpyqC12PmW9uKkWHQMMAt6h1HGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231354; c=relaxed/simple;
	bh=e5G/1gpd6w5RUemT1hHxSrPtt8y2TvG6ssB05XjEsgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqj/SbQLBGZ7LCZbliLH7PAMzdHajvgVuCtuNnSL2rWRjZ0IcZkp56gwPMIYIQWr4hPoOpW2AwW88SQMBjstbKy2xG8JjKZu3cyXbp83TB0G7jpZVnMjSHxhcEyG/dQw5iJNOt0yzjxVuHVErz0l24bs/x5Prj4jzpreO/7jdP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xVOlw11E; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xVOlw11E"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956242332dso31820925e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231350; x=1785836150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJniRco96ZhJUJ+Yk+f3eF2otMHPdpjSj7bXg2cOCuQ=;
        b=xVOlw11ErliUSnKVuVx2OVIln8wXamevyk/z7V27P50oah1oGjo6vpMum96u4HF3dt
         KlUMShMMZnCMZEdeLP50Aov7HYsGFOz6upt3e9sqe4oZakp1iObTQrGCiNIuhL689Jgm
         oMzh37jcxeDiz5dkIKT5MglG+iLAZ+65ESKKumDTsw/IIMGiDIKBmNXalYA3c+jUpzzW
         /VGhiLBvxVDvxCwK+Z6GXEW1WrP35oWzqvMK74hOfSwG7R5rRdNVxr6nZVQQJoIC9ZIw
         OGMFps2We000+Vj3uah2xShfTRJvv5IoimfEVI2RwXn8h/OGQfAy7Svc/64e3l44Dmz9
         9obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231350; x=1785836150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJniRco96ZhJUJ+Yk+f3eF2otMHPdpjSj7bXg2cOCuQ=;
        b=clZQ5D4NEBIPnjkvTo7zJEFc3LR9UMaRD+9mL3OqPJB9xiioI3xv5+uc+P88hGyad4
         hhViL6Ui2kdR2Ma7oe0WbKt9DGf6GWYVkbxAQ9cGaHsQtzFRyJA6/h3aci+DDFzRAnlb
         1SPmPsztK1KCKgvt+o0hBqEJASiZhPQotAQo72EgWRhkKXxn7hvJH0WuhkokDa21+9ft
         MLHjIgykskxgYga9PxMW+PEpVoEvrjN6k1nqY5TlFdwmNMRWdJFQIVI5AbU/DRd02SYU
         gV12QHshLjFtKD2ndBy2AOtbvFONyb8nkOSwOrpziH/5lUnb23cqj/+Pgo/P9gcIyG5s
         eaKw==
X-Gm-Message-State: AOJu0YwP9HvRwq4yveKEhx3Q3EmOnqkEmFL9ZmEkS7TmD9m9wD5XlRLe
	XqMHkZfzcequPLNWD3HeyMUaijHEq2okB/VRJT4L2yUl8N4u2NjzPuCGHEDhPsi/K/g=
X-Gm-Gg: AR+sD138z0gGcpnaYchd5kC4WJb8C4SEYUJcMuCX00v6w4vU88dmv4NNhGdQv/30avF
	Ou0M6Fgm+eXSV1TQ3Uu0boOfC8bdhJqjUuZs/ZhB7YQurG/u8F9KgTvuFwkcyhBGtnzs/TSTBf6
	NOEnZx+IuSIVJjoXVgYb7gme4q7uJtBk0kRVi0EfxINhGe3WxJXwTVnIk5yVsQGWTxoxqxx2dfl
	B3VulGc0I4lmo3TjwcKnhucBDoFzXlR/zdYJZw1gCeRCs1eJs+6FrCA019Syg8+8MuEZPsO/uDg
	oYKQQyvsIDwSKEmjt2z2meKNSbZeADnKCtm3r6fyQIJ8r5f+ejX0U903kaeci+AK+C551z1AmXv
	0oyHeIc8CZW/0vJ+thQxtQIlza6j4jLzNGY/oIa7ci2stHILVzrHK2rLBkQMDRcmqFJZdUByC6c
	CPCM7mvyA3nSyL
X-Received: by 2002:a05:600c:5494:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-496c60bede5mr17438645e9.0.1785231350341;
        Tue, 28 Jul 2026 02:35:50 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm68190825e9.15.2026.07.28.02.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:35:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 28 Jul 2026 10:35:36 +0100
Subject: [PATCH v13 5/5] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-5-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=e5G/1gpd6w5RUemT1hHxSrPtt8y2TvG6ssB05XjEsgM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqaHft0cPUUgit905GNCZrjqlTZe3rJ37IFM1ZU
 h/qDA6xynmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCamh37QAKCRAicTuzoY3I
 Ost9D/9u3lYofi4F2s61/n/+5ucihnSYHuKfssGjxGNKFnR9qBCXN3za6mfLa6MHXNOd5ZQYl5i
 lh0dZXBbZFsaqajrCxaVd9d43+Q2xl4pOndOdFPIi4PJb9VBUNh1F+l/Y9SzaN4wTF5S00yFvBy
 7t2HwD4Me0e7LsjbzObuQTH+jCgoBpFdSaVshQaacDyGM60vQRLjALYuhX82kjprBKtWxciay3e
 k10p9rpTyX10Y2ar4NP8ROMwgb2WL1ARBsssY4qApZ4Dm9YacTZ7rqDZRE58SZDXYiJi+awGdnI
 mOPTSkyimLYcV9VxEQsaSlOYXx1pL03cD874zDNEfUDFQcpO/Wm8fVWbssd6t05hNtSJ3gNSrE8
 RC5q8Lwp4YFCcYwiRZ9JDoJwmXd1PQcdpb3RXx//xPRUoOp26jcmZkBapcSoxdHwjp/D/vosKdG
 8S7ybhQKBkZe9iNEAhKAT+6qUv1OkLwyTqR8nPvJraAjS6zboq/3saaUF3uwxUdWHdqZKY8syVd
 EoN0x4Hf3JJQ3yppVLD/O3VvFwDv6mkYb/+8br6X0VsP3ee176ovIi3sLBcuu4RprdSt65MoJ+G
 VSxaVjCDF95SwwZcNWkkaJ9IJJd1ZROe5336kXh7Gxh0lvay6y9dEFYOfMcWZHSZOfKDQ2UIyrs
 Gp3dhA7FPSIhK2A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Moving the csiphy to peer nodes means making the current supplies optional.
Optional since we still need to support the old way but, at the same time
separate nodes means having rails per phy which is a key benefit of having
separate nodes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 126400772d028..57a838fe2d229 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -186,8 +186,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false

-- 
2.54.0

