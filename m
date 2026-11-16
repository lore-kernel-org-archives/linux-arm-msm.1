Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864406;
	b=HakSvOhit+Oc+z1fYinx7VjTtWdHH8/uOmb+Y3JiFcZf6ZPkD6yK8qN0NYhbA01Ygi9h
	 3UtOb5RXxQJ92eCF9a+eIbf4gmHRILIsuqCM5QnS3gU2TajPT8g7r7HDF5Q1yKMg3sMvf
	 hDX0E89DhWUyH8R2p5RBwFGPyctaLpgG1pXtkiv4cY7aTdWt8kIWUnwzsi2SEAa4wFh2S
	 gZ64E9iF9IAFAtMVBXepBqN/g09BjBKbxwgHDBlp4uOEh5h98UmjlPYiaoB/Ae/Y+vFAS
	 5f1JFYuJANY4mu1JsUWDWuorZVRyYb7QqG1utj49pcifrr1HENbgadI5EICkHmk1TJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
	b=QcKoPrbH91j/ONB/gKfa8hu8fo7waoZYpFjUeNbFX1hjYRQeyN+Ay3aqtYwDQEAeOXFS
	 063CS/Gp3tSZmfRBmrrZpXViIhiq+8S8XpoPX3PTbk25YMxlDPEyIpEQwLvhNm4r2SdTq
	 9TybTC2cnLNnDkEdBYFIbgNSlHg0mjmmOBmUIt5ves87RiGJdZ8FP61fOO7gqbqFP89r+
	 Z+cEJp1RBxOr4zXA8JOzJJwYrCNePx3FZXZzwPnNaLg+CeTEhT8tK2nMn/k1JavIKbKkm
	 uHjO+Z2RpUUGoQxuqWQvPLHZk14EsJJviycTkQ9np7d4KRYXG3a3RVpi7ZI9orTF8oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8xDJoNf;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BF2606A33F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16BF2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8xDJoNf
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so15977085e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864404; x=1795469204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=I8xDJoNfZaRem9zplTnlWWkiwNtJLWG+95Fkcj3/f/c0VDhRKNKMbw9CXBZAkIBDQu
         KDi7/92PC3BzuvcqK70i6KVaw5/vQRoUZV88eKUrBui/wN6PXFES7rCc1jTGUFM2zsx0
         Ym/aViCUG/uj7Th3xExXkYUMx4rwKh1Gt8dwbBMciok2YHaViaONWVDgji4ZkirXtbkF
         r7M5mJAf0zQmkErxe4iAIG+Y5CG2v0otB+0lyKfhR9hiBplgFEKH6QXgv33zgqv91kCN
         1ltycZwiQftZ4czJXOw725iSoIdwqdftqpGJ4iR8nG1Yk1waUYBsFZ6LFBD0taF0zsRF
         iJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864404; x=1795469204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=OD5QUXDRn/63MdjeTfsxT5fO2/bTm5l2mhJ7J6PyysqJ2fySuvYtzWjaTvCOlU/0RT
         cECgUg6CL6RtqWavmISfZtevpWMOyQsSVe9W8NYzayrU5UkOizr/ORiINZdPPpjv2keX
         HFKPhH0F7jGI4Z9aAOJeUy45+ZVju57oLMP83jN1YiW0C0ji1aWyY0Qb/FdJDT74qBqz
         Bgy1YSM2nsnKCA1OJL35uSFYUJ4a6kOqoANf27D2s30L5vS33RqBPKJkpUoZNmLrTud0
         bYLVkpLHVVNnLAt5LE2456xF3dE2ulOmf+M4+Do/rKgaEYMWO7EQvACdq1gAXruxB4Jm
         sZEQ==
X-Gm-Message-State: APuU4Z/Py0qtr3/ileKEmFH2v/36cF0/1jSwwK7BVYOqB4pa0SFHwXqd
	fEQsV/IYcOsfNLwsp8cfP5gF0BIlQ82x6bVsBTyGqvSZ4E69GyBGc4dD
X-Gm-Gg: AYBFou0KSp35VfAz9HF0aU279oe4gaNdoehuKb76yqCe4TDRKH8qWHmkym9BKeQGVnO
	tDvOEWByAl5/m8e4QjXjnJtqsiT1m8QdxLr8MUGFldhU0HS4yvF8zi2R2VAKIK9610e+apx3MMx
	f3iy8GU6eya8OCkczq3ggLMOCpffmHuCpZMFjyGpEQ5yaRdLW1xIU7/O0WTH3uWaBh8umBydLne
	g4XxsaXK/sn34QT9zuaH0Lw3+Iz23hSUVol6qT3VOxBToyYs2oor6HNBYJKIBjEYMvwEAe5weRa
	Ac+eyIKL8DSdWT/mWCrRX166yM/QrR/KiXc7fra7V0UsbW6cZcXcdtPb2X28i6P49J0iMX7/Gi3
	7+OWeA/WCYmg80P1wrPQAAPiyhF4zZDE2Yw2071gGNfr/1DXRZq+Ic71oAcgTtwRCjCsWna/j9v
	EXoZG9WcQ2BrDTOoTs/tpQ2VNocOsK/XCL0ndJ+YCVsmfUsitWcS6Fm21LQFoJRBze7pLm3zS3F
	kOrdzpgCX3wFyBMvuWi1IDYr5XyMAFBQcWFuo7NKDXse+toAaqqKPhNYejjb5Id4no6/l7edYF/
	HOqFx5ZD3MIgWcqTF8X6tHw5yTAOwUrYDy1YUUpp
X-Received: by 2002:a05:600c:6994:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb647ddc1bmr178719475e9.3.1794864404416;
        Mon, 16 Nov 2026 13:26:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:43 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:18 +0000
Subject: [PATCH v2 02/16] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
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
Message-Id: <20261116-halliday-dts-v2-2-2c92438c6c46@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1076;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=2tteAd38AfHrvk8Awl3RAniXNSdGBzL0LwEwE8e7LoI=;
 b=zXzEFbpmrw7cpK4pILHkAa2JAONx4e/NBSRGU4M7PF0mG2S7il3dQ8oQ1GaRjzlC45Rh8Rzj2
 +R95I7vK6fnC+0EXJojPOiNt/4zRdqb4EXf75+xmDMH2zxxqkWubFgC
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8ee1c25a7c9d..663baae9cc64 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - qcom,maili-rpmhpd
           - const: qcom,hawi-rpmhpd
+      - items:
+          - enum:
+              - qcom,halliday-rpmhpd
+          - const: qcom,sm8450-rpmhpd
 
   '#power-domain-cells':
     const: 1

-- 
2.55.0

