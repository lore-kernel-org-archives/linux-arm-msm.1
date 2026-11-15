Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702728;
	b=x7z9bB6TaGTkSsH9QH29rZCMw8HeJ9zV3JvIGcYD1mhyaWxIfVqK6G1Uh8q7YS6k7B7t
	 0E0osriSr2QV6xYUujShp9sHg4xwtj7J032/issgvg+mtDi2bz7NhnAp7dXomxnNiTwfP
	 fsd5GP1PcczPNtqC0RmeohrQs8wvMhl3U9uugXMy+L7LFqNBIGaV1hMzd6sWqUvG1TMDX
	 QRfGsSQDgXTbOxVekOXYoXdulvIUNlTdwQ0Y2gqPVg0xDfXInN5D7XqCOgXiMPgB9kWRV
	 2PlrJG2kkB71kBo7mV7VM6CzDOF77hp1+JUS66kEbsCbLcfshUbzLrYyflIn9oTtQiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GVBi/BtHwXrMR59M0e8R1++dDkkmRGqCyH13CxDS4UI=;
	b=LhwZZ7kDboLusWD/0lhVQEHosM/i1n4Czt8biPJmP66CajZ3WUvSC90ezN55oOpSJeJr
	 5TaOoZdm6+3ZTgxEGtSyWHvBJ+NgVKYOudVimhBLbjEKYaCgIFliVh2FBPYt7yw+o4Xmk
	 B2Ckfp5Gih8JSmH3u4PMF23pp8CeE/Kxs7h506NM0vBrOLyZrus9Kvu5anYHXYG3vpC6G
	 wAeEiVTp5UF1H/KFl8W6AXoDmJ4sdvZo4/D+DLCS2IgytpucA2W8M2M/cmYFEVrF19kU7
	 iMG3AjXuVaSx5o1DKfaHaEq2C/F2sTdT7OhvY9o2G9O9c6sisL0T+x5uRywf6IpzJOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5NY6n4p;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B735F606A332
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 00:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B735F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5NY6n4p
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso370570666b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 16:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702726; x=1795307526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVBi/BtHwXrMR59M0e8R1++dDkkmRGqCyH13CxDS4UI=;
        b=F5NY6n4pA3zJoPJKQRZ8qrnhPh4iiSBXipyS7ZZeZZk1Jhgi5od6w1ljHwxc4TFJP6
         N4RH5tiGrt0q8MU3f86r2HBDR9A6Xb9OViFPa5swY1F7qYvJquKfK1j+NbvGY5tQHQPZ
         Qj+is9aboixvTiNwW4IEIIq7cGKLrD1Xs3/n7mmKxauASaPGQFt3J5v6yzVGHvXvISEI
         n+KcHLw2WdJSS5FneYfKXWFzsDyGgY1I+yGZBgmkzshmKDFGEu/vmKNWG470+G6EE5Cu
         RIK8CCuHbKZLfU1KmA/VpeWOKvFvZAfEzS+jibYRyTkbRMqMKs9sIZ1s9KIcRGVogHH/
         5obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702726; x=1795307526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVBi/BtHwXrMR59M0e8R1++dDkkmRGqCyH13CxDS4UI=;
        b=ZEBxR9Z3kLoArx4eZltvn5djet8LlB+aD06Kcgkk03XYuoAv4j/AZTfLxBoE6hIdK9
         4tKawBIKdSSnVSYdsN+avTaZ9p+AFlzfOZcMPYwZCMxrqHXQK1jn0QI+XHuaS3+EOyRD
         VrbaFTzgqfrVwFqCquKMGilJGS4suHDmcFP3x1X+euxgpcq+gNotRERT0uP2itcsSCov
         Jq3BnEApAHeuPVC6OtuIN8jCbZWr0kFTnNasURiFDu+kEcAnTy15OSxSA/fMQEyU45GE
         dapWXJBqwF/MVLy/gL4fl3MYKjeoK4ICSK1vBVctUH9as4h72CyaDqSmX5b7wXvhV341
         hIBw==
X-Forwarded-Encrypted: i=1; AL+hErGPQKZmXCrumtj/fOqO40i4M+0wV4pQVtZqMjjq1WRrHQqL1izaNLW3inYvLnCKvVxyKHrfnCkROAx93sLQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/pqBpJvC7g8i6U4f03XLVd+zsAdJqHt+NvwYab/yyoc+2g3tKt
	Pl+4kHEHl3vioAeuocg1OEEdkWiy1FFy55eDKYhMvyL6yO30ajmK2xA=
X-Gm-Gg: AYBFou1Q5813Dra4ghJGVxry/14PZpyAhjgybn6zlQBKQs4insAKLRsd3H1oFB6eyQ6
	bNIwGIyEZFvQbSNQffD2ge10ixiA0ZldaOyHGW37Hvo18N8XH/Tq1fjOAPDHacBcaOV/w1HV2mB
	snfXtQ7EZunHMmVcaT3iEbafp4mYJxhhth+FGitr09LZBx9a8vpgWTkYzt/dpMwIKBUCJEjGZy8
	r+qbwKDCsn4IT64ea7yEM5+DT/DPmqiJcWWCBKJ3hhg6vFY+NyoGSWNYOe9/wEi2cI5rdDH3wXf
	cWYhND5w+x/OqDHDi0fXHiVGNgiYJmBuci5WE6r6zb8OzjJY2aZGg4FCslPuk09RFbzGCTHzM/8
	BpAvkoNriKUCaqLLJEcE1vQOU2Ckijqg6chWSpEkEw0BImXWDpwyvcJlwPTwd/ooAoL+xfCdtqR
	BsbWP89U7T3x99rA3nRV+NRsVEyj0R2+OvF22cTcY/MJj1gkZYzDnrnur8uecvXHBF1TvTHSxuO
	MWuvvJy1JKJy2NEUD4+shC6m5yndwktel3XHpOMjWca+bSmPbfMQdziubL09/Bg+06cXYOAWMYT
	OR9sYUuRedGTDYajg3ryx3V+cNyMODwp0CaoQOjzs+25HKYU8L80ZaAuj89LM4OKDJVjZay69Hx
	ltCxMcKRSOdXRVKh9TAip5ojzCquEfar7ER0=
X-Received: by 2002:a17:907:843:b0:c2b:4142:2db1 with SMTP id a640c23a62f3a-c5096387a3dmr518400366b.40.1794702725988;
        Sat, 14 Nov 2026 16:32:05 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:04 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM6125 compatible
Date: Sun, 15 Nov 2026 01:31:56 +0100
Message-ID: <20261115003158.391171-2-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115003158.391171-1-majidhhdri@gmail.com>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq-hw (OSM) block on SM6125. Like SM6115 it has two
frequency domains with one register region each, so add it to both the
compatible list and the two-region constraint.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..8dfe77d08 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sdm670-cpufreq-hw
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
+              - qcom,sm6125-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
@@ -146,6 +147,7 @@ allOf:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm4450-cpufreq-epss
               - qcom,sm6115-cpufreq-hw
+              - qcom,sm6125-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
               - qcom,sm6375-cpufreq-epss
     then:
-- 
2.56.1

