Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184492;
	b=UpNtJSKlxTWuqcSmOiAXlXKFNk0M7dsGbgkM6X5HKFh2naOsCSVv757IhlmFgUiGmD0C
	 +V3ufa1G0LOuo3Joy4aMA0Ilw8bWeaPvY/MiZW/kP0ZS7Wm5/R9tczqiFFiWZXRuHCRu5
	 ZefVG9YOQyzW1TJMZ321QaA0qGqIhxCMS6LPn22oXMM6d0x9WFEL12qwUOBcI4JauhDDb
	 5osE2tcGUJ8xDGe0fBN9j+yJYfZiW98879UNFcOax+5tlkTiAXWGX/525V7+xij7nrAk4
	 zYhpS5oHsFGZarnTgw8dlTBVmJhWu0YtAKMncTzIqh8wyv6mHG/dbM9K9SE5tIPULcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
	b=zBzSlfww1z2cYkPIIlEsz/Rwx5NhvmsSV8BL6HhPos83n3pkPdrqUqvl3Iqv4NcsLpLm
	 8HVyIXWMLm0GbjlJz5maHJbxMFQDK+s35Xm8AuFvf9GqqOHbQxmdIkujIPzIGmm2+KQWp
	 xLhC+QO+APczjDDEiiHbAhAbwwTiNZPSumwZNH2PTkRmOqoSwdZ0yJkRD3SQkRzu3PI+L
	 45Anb71LVyoV/xALD3DOqnv/HsCJGYqhd+jjZhycCKtVZYm/nb/b1xZJ2jcEb9/UhX1t3
	 K90NTI8t7cueX68UljXajjcrIeGYIWtFBBFpM+how/YqsNeKBFvmU3UN58zgVRETjUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4mD95aN;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD260A263F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADCD260A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4mD95aN
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so2796485e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184490; x=1794789290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=E4mD95aN6utgtguVmche9wruQufBYUmPr7se0FjMNh58DsSqVSMujoYr0keBmRpW8v
         uWQWheuyiSWXxKez1vN9DHsvkz3dIxygT3PejUT5UR97F27EKdO7WTr8MwR/DYX5j7If
         J5n5+NU+o62GTMTKrKJF4U0oIX+yriKVSodOXqH3bAcyiqaL4rHDO9eNXyjje0tgioF3
         kJjFsybCFmRigW6JjznYVc4hYOd89F4ZaDco6gDgRFm/z6xDqoQPjP4mGVKFK2BAHaN1
         NUR9o08rR/2JzDfKTWO51s5/9EiaI8Jvltmy1OQJ6WmNNyfpZkFqT0xbMVSgVs34YbYY
         WCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184490; x=1794789290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqalaJtZ5/g9y9/6SBPqjpN1E4M1h8fqL8PuTjv/KSk=;
        b=hXFU3Asz4umY5hzEZ9LyX+LASogjdBIOwBNEg0zmbl/9hi6nU5GNzd/YhYJVaI+Iqh
         5iEnX5TOau6HHLClKHpaylp6Fxc4Cj2RxjqyQzKk33s2k9fulNbY6wgOYcobBAWOdiIv
         BwJ884HjC8NXskjOSsaZrkwojKYa8sgYevbomfQ0VmWmpuJCx9RO0JzDOgLOCxXZHWe4
         X/n3EsofRFRYCGMsLc3UaFb+FSADBsRWkeY3EO9Z9JsF6nQ+3Nnfj6Az1WAqRaYme/nn
         whQ6Gi+0CDSbyOVD1Xou+kOhNxu9o0LBPJXCGW176W98mhMLPrn7yfjWMKsKzhTzx84K
         e3qw==
X-Gm-Message-State: APuU4Z/I6TZdyoa+Y63HodmqruWxY+9NIIxL8aVmltJNo+HRwf1CnXhQ
	VMM/ul0+XI6gIiHosO2rcRqib7BJrPmTWT8qywYEPib5iejO8zZQAt6s
X-Gm-Gg: AYBFou2NJ4+s8n9HyNau0xQOQ3oTFp7czpSHJf4U8JjvnR/TN/h8vz+Bj1MN7LQ34lk
	LIRbMvLxVqVaFaKbuVcBp96MWf61ZTHskznJ0OHkkvris0YQGxkH6xMErvJL5/F+CXRx/T1fmkv
	2v/bNLY3nyDbFxeqwY25Q42cDQlUJd7zFDO6hlj/PRvEiF0O2uG4Lqw75axWntMH+zQPdelJPeA
	im5skbqdBcb4PQYKfEplSdkoT32J2oETq7Q/5SBA5XzfaiVk5dDoCwfvcc/a3hhfRqTb2d9nG1g
	xKgeo2qemltvpDUrosMIHm/Z4BueQCsLgIb0Gaei1iwHQxKzIcNaAqhX4IKpqrhgpQeLwYNQ55i
	nky1GKPtbvhbJI+ScwJ8yk9gWBJyFjRXVQkedAidzQ4jxg1zo7Vs/IHvsA5Ius6EdGWObllSt55
	9WTnC0YrZvqjgodY8AipNLBhhrxlSoRaC7TQsMstmdS56Ymqh4FHnrQgE/MHNeHwrpsNExjN7HJ
	ocwFB1S/Dbyv+0b+U7J0iy5j4xPHmAGf4tUV/H7D6WreBrsFoHL2OAzdivg3hfgY1YhuT9neZAk
	P7YdT7LWy3brTu13uEdwU5jC3c1xmdBnMSGKYtr3
X-Received: by 2002:a05:600c:6218:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4b8205955e1mr111833455e9.7.1794184490117;
        Sun, 08 Nov 2026 16:34:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:27 +0000
Subject: [PATCH 15/17] dt-bindings: arm: qcom: Add Samsung Galaxy XR
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
Message-Id: <20261109-halliday-dts-v1-15-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=822;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=GR/L35KkjRTQHIwoej6N0ZVQiPJDeokJdA0dH1/xcVk=;
 b=+pMC0hU92qIlScFgbvyLG0yeciXJR70jYMcQsgbMkAruvtq441EcqoAR24w8+H8PddfDvxdW7
 NeEMu0FiaHdAmbbpArcsFtCmr29OynUnIXhIC1Struq0XQSLzW/yMcu
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Samsung Galaxy XR headset, which is based on the Qualcomm
Halliday SoC (SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..b96ee339956d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -94,6 +94,11 @@ properties:
               - qcom,glymur-qcb
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - samsung,xrvst2
+          - const: qcom,halliday
+
       - items:
           - enum:
               - 8dev,jalapeno

-- 
2.55.0

