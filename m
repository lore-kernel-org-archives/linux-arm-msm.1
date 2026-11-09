Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184472;
	b=WzRXLMkfKoaHXJx9F5kQkl4Ou5PUlfJHn7BIMD2dWhtm5CZfvV8KMWyJYNfZBe41N2ME
	 wan6GmYugFmjb2m9JKblyYo1YoU2dAAjtwvHGdJoys/bWS1jvUPTkHXcjyIZmFzZxvHqO
	 BTlxsDNQWWmkaB28ymVlrlMYWNaS8pxHd/bQmvjOmrbJYs6sMWLBcytDiLnHU12I0bxEj
	 uj/0GPfhbRjOOMBQwjcz2aq9zENTZUDR8EsbMoDTnGojbuVuJhXOiWIZGRbzZYWkpH3cW
	 3O1jK1fa6r25ETRRSEjCBAICC1og9+iGY0DbDZG9EAbYp4li46EKwH5nBJ5skG94kdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
	b=2+KQSaVkiNi9ZtEZlf7a4XN2domuyNoIleo62uKvclKtEfsMvmKvgkWL4HpKFYI3pOkg
	 L2n0BsIWSfMzSXyCDvjWW9LnYlq93hZzdbkxmKc0ehyQmfsz+8VGTHaGq3mmetB13I/cq
	 6/34PFVQpFbz/uFXj74BIEfW0Pxws7EDEXQuYxuBtQmI+YioGZo4KV+q5mA7EVk1ii39z
	 GQ3YnOVQUg89xyWwB0RZVQ/FG7xidkXIJ29oyjtTFDj6EtkpoOyDR2mfz8OITklrh06zj
	 0sUC5YYVWaCRztlncq6mU0TnZcJLXLtntoMIRBaUNZMpKI+Zdv/c4qtaPLjKcv18oJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxbEJWOi;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51434606EEA1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51434606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxbEJWOi
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so3570765e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184471; x=1794789271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=WxbEJWOi9QdqpPLO6Ad59r7g0ryBxuqjlkvMlrQfNlNetGvjWt7UZRvYSw+EsMrTpW
         lC9Ie+ZhXXPAOXc/xUS/3xT7VZPYdyIrqbQ4f9+1R+vIuQl6Fyl9S79VIfv31Dbc/jGd
         vGp6btvqST0z/IyGK7MXpRl8Ji5Gqj0cFHFckWgLhahaHcURIkKvM/P6NzmrGrBItv3I
         3zj4CTFNQ6tD4YqUCDb2a3wuovRyO4zKtvVaIcNQHgt8RUQbgVx8yBYj/ZUGL8NsS9F6
         o/Nomd+IFGlBsQVBOxzy5yoHKZeSfZtvQwpc+6rScaPo/xpz5CxWsa8i3RZBbutcR8Iv
         R52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184471; x=1794789271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=C1V8bNyAx9Jt9/+3ARS1p1qxesA1wmdOFH6XHkZPtengz8jQ4InraJFsDanbWBf9du
         ITinLWOVFeaIMCy5bWq23cACKzjbkUi0ZiZcbOYMwDV7/TkjKxRrpuqRAcILcpmXvgvT
         GccxL5lFfrM3FvgRa9Gh3EQR1K+hgL5hFD2o7tTHFCVSwatzq2KAPQh6+x6jFFbaCKIJ
         PI6g5VpAqc56LEXDVfEcTY/iaEbCwUFdlX3mnZSo9LE/aP5ncjg/GiIKPWXcY/I9H5gQ
         CAknlMId1yr6Xiud5tEunfrUULpNNKlz/HI69LwzxThNM7RIn4cK9KIP2nOuQwc/H7at
         i5dw==
X-Gm-Message-State: APuU4Z8is365PgG77+se0ADVptYVfCQUBAeLxIYt9MtSUZXVjdf/Va7l
	z8WeBMvuztXyar44zSUNzKPXVrX1Y87PDAfaMBFrtu3ry9yXXSKnUHx/
X-Gm-Gg: AYBFou2f8j/HlcdUtan3Z532wkHH3ccoX6OVqpvmJ/oauuy71roOc1oIz1SNExNtY7A
	3+ZqjNV+bg8sMB4s8AqggACNfng8/fYKeNyfKiSh3WU8ASGDdT27ev6RMn8m10IaI9oDVQKE90T
	2BluE/FPf4ghy7dnRCqlse5ozwxVWiTGutA9CR3cNQTVqVFvMsKUhMVolgXXEK18zYQu6LioJX2
	jZfeody1rdAwIwzoWM86W9CHV/iiuO7zjUAc5BRz/pRkQP5TIu8A2VMdtivVYa9iGdBrNYLbVu4
	bwZBMR2UrIvm9XqbD7nivkC5xSphR5v1jEZZyWaFzaiigVxt1jFpeRG8LW3g1gMkfCrdyG7ZEZM
	rDWwrepT/CAMn2bmfkoJkjC9nIpXVPvNPwRkfpKPOefmSp7ee5DimbkeY9AgCv3WWLH9UZ3rgRJ
	a9CVDaWsGmFgr3RSEsQ6bkmJRua8QKcGtU9DLpx8StPH8NKy8yjkCKCDPn7khJ9cuNLpLwlgnEq
	3ADwbLcBFcbyJVIANvwyTU+rXTA1alFdD5jcmNVjYBaz86B8Z0gHVD2Vu0/ve/GxZyINdS9LO7s
	EpQ1yxDuEe+/FR90cBh0OvuvTQ/V+N5DGhKBwQWE
X-Received: by 2002:a05:600c:46d2:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4b963c814b4mr45217895e9.27.1794184470772;
        Sun, 08 Nov 2026 16:34:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:24 +0000
Subject: [PATCH 12/17] dt-bindings: cpufreq: qcom-hw: Document Halliday
 CPUFREQ hardware
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
Message-Id: <20261109-halliday-dts-v1-12-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1136;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=/5q7xJNdAtVYNP2eKqnOFRxkwGs69ZAxtJgwpCpPYPc=;
 b=gh19qIBvqo941uuBuTtSY86YfaNCAEdG9vJI0o/4tLOqHDCaja10/kLnOnTQrwdqkmy4TCdF6
 7e+ZDYLm+CcCb5BN2fAjGQTjhEqtQqzl3jdn43oLAWX5E1v6iUbyst4
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the CPUFREQ hardware (EPSS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff172..d6040cd293f9 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -36,6 +36,7 @@ properties:
         items:
           - enum:
               - qcom,eliza-cpufreq-epss
+              - qcom,halliday-cpufreq-epss
               - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
@@ -135,6 +136,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-cpufreq-epss
               - qcom,qcs615-cpufreq-hw
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss

-- 
2.55.0

