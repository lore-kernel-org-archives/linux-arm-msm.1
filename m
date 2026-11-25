Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578227;
	b=0jagyzUIOIvvWUHjkYmMJg7lUTdS5Xw6bwmUG60moZrQv0ic8jxBQvIfkWKVBTKt9o69
	 SzgTiCgR+qEH0SlXZSP31DJxrEAklVupiVV+8W8lnfDKVutb7NIHPTB9Dx60onnjrFKOE
	 sFSyRs/h9LxK0TC/P9bNufr9KIGWHhwCM3E0IrvVhKT3Bg864qdaVoXGe3OlnGWdMI1m6
	 tvDjIjtuIWWKdfQMSX31joYLlMCU0lUkQM6EEoERw9umXcXfZe2DebRp1rhrxGknLQ+GQ
	 K+SIDR9B0yy1v2IxCS+kKfUkmETDuqu84FnG46qTVmP7vQbiPiyDEQl4t8XSr5Fx4vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
	b=GSOWtcHmiqXs5fu4FkZFpYtgu5pyCf1wF99/tu/zwbyf0R/sqB7wNUkxYnFMm1W7mMjF
	 btSau7xJEb83A0aQTWv9RXhpUKdMHWw0E4TCexeNuUHcDz+lE21CUU2HmdDOFSXzhR5/D
	 OThYrCwVUjun+prtocXQ1uKqsAPpGERlV64QTtskf0PKK6ptyoWxNmUQeucLAKNk7t1X7
	 E4VtVwsZ3iMwFSlJOelGFykXtGRNoxcmHeSg/JypTPC2lyetj50xgt7ssPi+bb5JgkkVK
	 dzqYhTfA9BRYs5a/VkiqjDYvXXw/LOS3jdma0S6JemflinY3JJ3IC6VN564H4bOjktQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aAO2IER;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CEE606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23CEE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aAO2IER
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso50159545e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578225; x=1796183025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=0aAO2IER8kB/PZ8lVTz4ay0gUM3UnHZ/vSUnCLSG1JyAoz5XBu+KK21LecUcxMVVPv
         jsWMrr2ej7wBkGLSf8knbqOSbMCkQdfrO2H4N9ahqoxf9PkhuCMk6yKJ7aDsuw1Sllog
         n2h6BpZ1eYdLP/1TkWg1m7+VsZgy8lsZOcBvobJ1rYYRa+rc165fSgbxd2iwaIWTmohp
         xI8SWD8A92goVkdIoTQEWJCO0+eeww55ZY12t5skqCSUwNhKBJmDg8DwQBPFg/USKm9z
         q3u4ku2M7AyMbCbVEsn4NWbOtiIroMB03dZehtwAeTejOqd33rkDhsXaDj0ZB3S0ZgJ1
         veug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578225; x=1796183025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnAQsJm0J9tjLLptwYNMgJxavVvbhamVp2XrX/3IRso=;
        b=y9AQbTfMEx84mhtxfyZIFXPg5jJ+1PciULfza+wbP1rWvs9aLHjQNDZwrdbUwdNEZz
         t4kVcW6PqH9kQTsyNOqf74rB4uW++nfSHOEG3l4ZYJNyMJeUCt4L17lcwRQOkUoC8TNl
         8mqQ4+aTd1WOCnhfwkYycuLJNpNJdRbEFwMz61xYm9Zk9a1GtH4XZLqE8/ptTyk2UEGy
         USyNbwrmjyrZUDKcd67hbYANPYpMDB1QE1ivfcPTmGCM/2BXx6cGGIezpcvBTOBYmsvv
         rUWGCGznj1mB9PBxmkpOAdy8TZ0RDViMCMGzyCy1YSOEB4USCeeW9J4zfFC/PTc2viT3
         G1ag==
X-Gm-Message-State: APuU4Z8VgjQ7QN6V66cCwpmBSRMIlAEoDYBMxO077hgnqvJB4pHAwInm
	Zb0Ngsk7070odFoD1+XDm76NBMWlFn5ki/Fa5sLqjEnLGV63AqtRfIil
X-Gm-Gg: AZFdTZfsm9Mg99Rss8jeLA2GohaYmxU0a5BjdnsSMtQXTUBwlgx+qF08u6eplroFpJ+
	dcqlP2qTuVrdSGKN3li1cBlsJ5pAESnCnTov038DJmxdBqeL6ximsaBDVCkYmPuEzaTY2H0bNja
	tdR4iALmgbPtJ69lz7vfAx7idGoNmzOwR3pxezL0uudCFMDZB3vvuOiDEHq2sI8CtCCpYarzN72
	Uk+gPwpGa5Kb6UgEQzfUYYyrH7/B8zqT5k4Aq4bAy+FInrUC7lL9u0zdKyXPGlPLhk9+ozF1WfB
	UZOkf0QcBZ+9GHr+FrI79UAigWW3vYASlY3VrCnXzG9erqHNEQLKIdajd59M+zG0K61z3Xnsv6F
	o41sRIZOhS9ACFZIOpwoZwN53IYjNefOrUnaXilMhHgHbWfhQJLPQhaK3M8b/8hAuZCQHiPIpCB
	QKwaNvHeuUWtXPO7S/VfOSxiwaogQ6h+xF3FW6Lhty9TijdKseMZB8D79zXo79XtBaYg4A9R+2N
	p8wFxDAHxvemTEYSPIUNGBxi2x6YC7BsISSasACGfcuAil/7KwcyzuFKM1Gp1mTz1G7eGr927cB
	ahLNklbytxD/98Zv7mqthZkDqHWCKfAVVngMeg==
X-Received: by 2002:a05:600c:a087:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4bb887c9fbamr346060575e9.3.1795578225601;
        Tue, 24 Nov 2026 19:43:45 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:42:59 +0000
Subject: [PATCH v3 03/14] dt-bindings: arm-smmu: Add Halliday SMMU
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
Message-Id: <20261125-halliday-dts-v3-3-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1185;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=48k8tRM2Ds8B2KdX/k6MNHyKgJdAqOSEc8lLmnEqak0=;
 b=xCVPapQpg3IOzKVtAOHGmXsvfGx4fLaMkQfgRrvbjtK325rtMzpV4avhI4qPqmiTdlTgkoLxC
 dBxQBhGhobHDwrnWCUlsJvGEoN9HKps7J2KipZyJFkE2yjFIhJECBv7
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SMMU-500 on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..925afa8cca8d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,halliday-smmu-500
               - qcom,hawi-smmu-500
               - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
@@ -629,6 +630,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,halliday-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.55.0

