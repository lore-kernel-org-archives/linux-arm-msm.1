Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578254;
	b=1ciPgwtAUM9XfJ6KWyn6y9Ff5uI54Me7we0L8sQh7kqEw54kkGJ5FKJh4Nzc+IeKI+2h
	 zbg8CWXi5hOV3AVn+4A3EQWgRswVbc12Ol1Focc5e/YSOJPl9ynpcz+7QtZo4i+n3KSmG
	 9m845Z0mtxu/dIP8Pzo60aniRVgsWAr1U0G1Kb8TvWUBOqs23C0VcRWfptWtJB3e4Khia
	 89rKSxxBmuDOr7gf6mEJVoIJVgIEOzq1XR4Kwhfiza1y1FQOpBa2c6UW3EX/n6nZt0I10
	 ICkmTq/6SCcSG6JcW68GLj2cjaR+H4N3RVJxXzTWGJqvEmbkANXuYSRKkH+o2RdJt6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
	b=Oh29F/gir1Oig5MXqYuxrlXYSS5IfqaSDomfOg0s87NP34A/O3Hhve+scsg+K8O7QRaG
	 TE4hJ5vNxK064yz+hkQR6GphPJih+lRQxmfMY5uTqFxrlfOEcfpmwBqAe3b7nIYmedG6/
	 4Y8AyTCk7onobqjYVQR+khf3StX9qVwJ9pJtAqtbBEzLDl7d3LRACRGlH0Ju17X2wcVwm
	 4Bjg0KDAZlBd3i9hP82R5WE6fscdTNf2aphgT8ne5EdPwN6gqFaih20QbW5bTPw6+lnJA
	 A9k0Tdio3e7FRpP+ukUQgQ/PKi6c3CwI18ZBwliZ9ht3fV5nPwqBrS9BFrPxhOwxUAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEdBuKcF;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A27606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A27606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEdBuKcF
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so51567455e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578252; x=1796183052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
        b=lEdBuKcF0JncIpcutUemWRCVLwcBptVk45nftYoXdUPaaPEMjOXhRvlDgUBMqszRSi
         GjVW7ES9OlK67a/2KLB5I65GkIV14Ylzo/LfhicqUla0tHCcqXUHFVnVhyXZGsWk1GYi
         30KWFrA88HI/8R90LcNab9RdDuPnarcq6aW8IuA8Dbg3UasrVz81iXsAmAz52FFpSxkl
         kwCNrdjoDvsHBIUIV7L7pGx49IZu2fqgEP7oIu858HUHqjSUGsKRfpJS4Xm/DgASvkCY
         ohconOG9BXS7zsTTxG601/wjTYdl90IpxPDLaEEQRmhw8dfhpInmpWHAFkRnignmsUL1
         jNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578252; x=1796183052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
        b=cvQ2ObexQPm/fwdSMJeYNvq2Gv7ZSgU+WdzzTkx03wsGa9KdlCtB6jrVFblw9ZSBDg
         3SX4jtU47bhR59iazXJuONK9XgmOSLjM1W0fdaTTrEHKU+kamuu05OHcWKq4YIf3/nl8
         SpantApifkpjH+aa+tVZn7LfEutPA5aF70kYK+RAdewYs+o6bUL7C1TiuJQ2rW5azuwD
         pfgv2ikkIQejTnhn5E5+tucO/dCDGvWaAgwZaHiBYCvBG7lsVnKfMCeYtljFjhcMfGhV
         p4inwObpelZU/fISvzrQEr0qPTBftUFA7Ob7BqKP9Yu/ETp8XH8+Q0Ok+8en+1xXpmU2
         YP7w==
X-Gm-Message-State: APuU4Z+rwU047GnNfceb4L8ij0jQoyHMM3FEZRcAfyZbliyXwHBFFHPS
	7cpsUM23nJSo1aUzALBQnkb+S+xlUdDVbWcQ1kE3YN1KVTvhwVSIjGR8
X-Gm-Gg: AZFdTZfCKv/R1jyalZTT97l+RSQzJOOAqJgul+4DoOWi1LrWs+Q3EYU5XkN3quyqHCA
	QIBfFPhHWl1QLFmHK9SeCyerSAqB9CJDuV1r0/0U4yW4nKVD1ueQNXqT6cldYWQoDpAzw+Kt++U
	6CRZCuseolZ1+kylkPqrIbDLgI38Hc7+oolBZoVA7X8/PFqeoyORO0LUO6iMs0YDOF4RUbxfaza
	aPR/XrDwPH2ikyfUpGdKhRjsOVBkdUeJvSNESKHh9X2dPGGM+sUf1LN7tHlIhJzuPx12cLiA6Nh
	6R4ox14H4OHIrhXscDgdMpZtd1JK/I0wfbJrVD6gqFp7wX7+Nmv2HwpGXAaTLmIj4uNjVh5JxUR
	+BJm2QEbyu2u9qs8+U9xacAKqHRlCpcz0wzEgMluCLq5HcgSiHxt/TsmS6mktMGsQjCsqq95k4b
	uQ3ceyfzO5TmN5n9oCj1EKOVrdB8vsikHOQKFDsNx36tTQ9h3lsxHx9qsWfgt9llEs+vsKHopE8
	MPX6+i35TIM6vlcuOyprek3dz3Us5l2MXuWstHhJYlqKjIRTxCF7VY/NkZcIdUOfqML2diR0F4h
	rYA3ip4HHu2WCZVqTH62bbkwmiErDjtkumD5clrgwlCZWF+iMY7NX7u/d4A=
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr399963545e9.12.1795578252392;
        Tue, 24 Nov 2026 19:44:12 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:10 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:04 +0000
Subject: [PATCH v3 08/14] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
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
Message-Id: <20261125-halliday-dts-v3-8-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=991;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iODhhsd3yfvGtcciUvxgx8qkDXgsEtkBlczLh6ZRfrQ=;
 b=lvcDevXHoUjfOVIKmGcAADmxVZULBy9zMoHqx2H32a0E3wUM2ikLAFlGNM8+8Y16B1yXdXwzE
 0y99BcDJDu0At3F9ibFbmmvIZEbRo82dQ3K+iKDoR8DVQfXtRsOln6S
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

