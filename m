Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864478;
	b=vpxaVQ/E6s6493U+KOy6Hn1UKHigv2ZApNEumrPVVOoOxqnJRNBPqr2AC3KZGy1kyvxf
	 8LNwpQs7bKPJOzYIkAqfZxXRwy8Cwtsm6LVMCZj2c76IwGF3FmlPs/tPJSim0K+LcF1XI
	 evRBF8aSQNuL9kHHIzqFwmXI89PRCx4n9sixCRoqkHZmKpCb4Qat4/ytsmjlm2H4CuI2v
	 XjtagKy0iAz3JnrgQb9Y+NG916KyRoHwIyv9KPyoo+qbi+JvJNGYWzQc1g7F+pIVxfc66
	 zggGkpJ0ibXbTUAQOl4mEf5ECCObNDluQB7c1dbRlSODYPNUDvAmCBF//qbp9CTJ5PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
	b=D3LmOpdaXHHFOXrRalJlpkucoEsC539HSvHoyNpjwX3Vm67qzRKRUF/i2LEZCLVqVFiN
	 A8oSFndyali8U9dpB921ll833ux6vNffS8t9M1C6ooIpToPmhaQlscw0kId9x9gZ27WY9
	 lAsyW+HdB9dpX5nIpnjPzSPg1v7DPxVIZpAqy1lPn3dSq98Yu8XEKFQSPmWBX8U0+IDTW
	 79AhsrJti4vGxuQ9//Pqku7K5OgiLnlniuuPRScr1+Z/kkcyisV/FHuwWReEJtXchK31b
	 DAmmC2nFJl6rH/+iqQP59w6UGTJljUg+SHpi4zvrCoiGlRvWfROME84wB2AXtiKwe7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpD0dIS;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B7606A884
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D7B7606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpD0dIS
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490f38e9688so231030f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864476; x=1795469276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=FPpD0dISyKSAsA/OfXo9aET02c5v7IUiKwrzM7OGBDFvjMvTZoNbDoYV4Ex3Y3uYhp
         Y6vCQ7xir6up1dfUVLJ23VAaalNZ4uISwqpeaXPNkJgGz301zcyyvNP+hYTj/McltQK2
         nHoILFZ40kLf7wxINR1Pp7egTSiFzWLEp0yKng4RRniW+DeMhQ4V0omBbBAyczu0GDB0
         pjCabrcA7S423UTuSJS/0gDXZklx8OB2tDXAufmuhZv6NgJh9UmOymUt4fRkyObYF2WD
         JPvPmLCEPG7sKQ2EBmwHpk+O5gd+zkO28V1bvTe+aAAB0Uos9QSDOxduGncYaIIXzqk2
         6qEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864476; x=1795469276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvVvlwCzdjoOARGkeb2HfQeJVG94oQ2ENGfT6+oUCwc=;
        b=jjZgeE8sWBQksxvBDRI7TUeBzbh2Y2x6M0qmMOhzpuqjAYy1dSbcokXJQZtqZD9pHh
         +8ipP+gqXSvD8mWuZQNhlCoSwXun4XAXrqEzHDC/GDr62xv0bSGf4Z3FFXyPJPlWUstq
         njfLHpmc/JBFYcyta4zO9eD7NPAihzlRj8UuTSat/DYUMVuxOunTs4LsuAYmO3HWTLq8
         0iFCAcCYEslkNGduqguoBfy+2yxDuXwjq013Pu8W8WsmzuV2gwQuFw/B7l4ExGCglTij
         me/BWG/RDnBt8WtKwqG8WCspBnRxh7bIqkXMiyoCp36c5ofoRBFLorKZ7Ba3T2GI304G
         tyzA==
X-Gm-Message-State: APuU4Z8jDuqj2FMjsY7dwwLsKI2TbNAGSL6CfEX4mEWdeLSWKEjYsTTx
	vWk3EqidrP1i4OZH2LxA1+CCMEyegB5wZzqB5anmIkkJrxih3KxCsawL
X-Gm-Gg: AZFdTZfSgeLwtwt6edUyBl3UcnHGtXMH2IlXyxNT1URuYMJJlFBsMp2Q6SaqFohuiyV
	en11VpsHsiRr5yhoWV/Aw/Q6KOAD2gJMrvbsbjp4pQJsGorkfIDqCMd5UwUXHP9bjCWCjy25nBS
	5ghltgcHKmDY9g7cTikqvIMLV0kUR6lYAEUhNtwlV/wVPrQbzqcE1iV2z/C7G3Q+WbYr/1Omk6h
	uswoTkNhh9zBo4wOLKktSuAnxPZFIqe6o/P/I4DV2hOkE9/mzJ6SoEnx2DqwWd0cigy7TiipMh9
	hkbxqGAYyuHnDN6IAgU57sGqR1B49oSJPMEIXVFLeGE9G1Oxet3RqpxLViR/M+71Xnw83qEHvjN
	Ijsf1fBJ4TyKzYwT9C03KWrgT7oxP5MnCu7MDja+SzoyD8D3o0VV8oEBM1TdS7DQCY7ZPGVt0PZ
	8aPGHqxBY0vnjNgucN4++PDUXsEXHOINycGHVVmyjfdc1D4t/vfopytrcZng6FirNDrAd/3jt7U
	o/s0B2bbRrFiHxxT80AxpoxbJLwBjt7NttVfIjWgl3lcBGlFtbOg5GkX34u3aQ9yCMiKUQb9z7A
	rZEgIjk39I/jrd7PPXfIZ/irYkKShws1Hd5I3FGhY8NBzyBqNkK9p80ocL+iEA==
X-Received: by 2002:a05:6000:4706:b0:49d:8ce1:2652 with SMTP id ffacd0b85a97d-4a36bd51c5dmr1648244f8f.1.1794864475624;
        Mon, 16 Nov 2026 13:27:55 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:54 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:29 +0000
Subject: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for
 SXR2250P
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
Message-Id: <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=746;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wp4yEFlEeRirWebvDUNwJG87yvgwIo0fuTVgUjPIFVg=;
 b=c3M0oozAyWICul1zqZyYV4A722e/xl51QI136kZKSBBz/N4l9sptO65yuOtgNCZsSpOrbqAMq
 sRMLJj/ahy6AipZ7ofcwU1aakgIIwxaL8YroDdkKta3ZC/C45UuYvvM
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 135297027580..cbcab632e01c 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SXR2250P		649
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657

-- 
2.55.0

