Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578260;
	b=lG4GUX1qOpWQD2vMLqHUCViDbmx+0PhrdUWVrQgcz71NE4s4aK1QyeCqhHKyaWr2sEzJ
	 n52E+8kvzwvIowX5orMBH+Ga2lYU5v06bIFqmLyuL4dStWJln5i5vcdYUKc83gYYmxiqg
	 GiEVLJxZ2IofK48yptFTSf1S3glvwOLvfsYDfpB2ms4YJaFAWuV8G8qP0Brd9C0D0qtps
	 gCk4eiMph1fdVoONMyZdZMw+4hdq8JbzTq2RsLvJUo/fpzbsLAIwy7rbILHw7tXN7oC0b
	 YRPYXRflontRoghhpLe4ZIqTWBh9jb0O9shqByidtH4m+g10swaJLSjh7+kgnqTRtBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
	b=f0SFrld6stImd1xhguWgAruZG2NeDqeJ6vFEZ4OKd86AwyBPrx5PLzqkYxi6C7plCwvA
	 /K+k2scX3Sek+QSZtNV/Vqjjj07aEMDsFrmzVF8KI9VqzPgHBtAVFh11m/Nkc9iZxaNy4
	 WgJdJlZ85boEjMd9pDWF3G6ZPsz2bPlIByyNaep6QKMup68eHiZErOMEgdzA/Wjg9l/qY
	 1bVbz3ukG4Jro402gkz6dA2idSxJ2HbJSHv3teb8+cBgSDVGpUZlG1b3FVpDRy7h7CiIV
	 HbZBcTI8UR44I50ekQlJ48jcTKyPuu4ZmzBPAY+h+kX6JnAmPoUO3Llz0OBCX4MQr3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laYSzHNN;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9F606A335
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB9F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laYSzHNN
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so48473795e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578259; x=1796183059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
        b=laYSzHNNApvR6hkCfW91e7FyeGAkAKidR4abU+y7ghA8I/ig+rBp4IhezAN7BpYWH3
         f5Y7CPtN4xV7uJPIaE56Gva0Rp5GUYs5GwSqRjsJcJVv2f1+wmo29KWJzeu7eCxi6m3c
         9Au+o4hVYVaxhe0/Cel8skNSDR0POHCdew23VxzftD2vmyoJQvIikRA1VdEp4QXuCv/m
         hlsnWVQEES+Dp5ga9WZt8jZfea89OqfZ6LI28tB1H92eEcyOEQQHudx52eC5tBgRnRjh
         wIhDoX2puuAC+T+JmQLUJsdgugRJfZMB50IIm48HMGcA99AvePM/gHhJt3ufW5ZrcdLd
         r9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578259; x=1796183059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2b0VXMdCxwEqSCTP3OlO/X4AxL36r2Zoj510JVt9mk=;
        b=bey5XnDc0N+h2nXj5Wm8pkF8f81Sggtabntwbd/L8YRP4PMX7vnkIt5bLJz3jSeL1l
         KL1kWsdZ7NozLT3D5WcMXBSy+MR4VItN8g3o7eZG5u+k38/GWkWa8XOGifvtXQNI9CJU
         LcntkKrWjpPCPOtZg/puKdKbDbcGYXKHr/EyWzaZYXhFWudUKQrFdQ7T76DWVBJYgOpZ
         +PE+e8fQdWlGvjkQMt6hqwex0OJXDE3fZj+dEhZKjlLFjGvRGEO8o7WMUDkQgVcDXX6C
         cgr4zq9eiZYbQu9zh0GXshzuHAF89s6xfjcthnjQezPKnc05Yog1FDOSHL/ENa7geHuc
         AsTw==
X-Gm-Message-State: APuU4Z9E90Qt7oV+sPbYQcgphg5z/my4Nk7B0XcnA52fk8O72rG9c7w3
	pg9wT13PA6/4XDCW+nhcQmWX4MekQHLCufkY7zZILo0kdZMsRLBXYw9j
X-Gm-Gg: AZFdTZeQNT0CcBRnv7M76HPym1lqYoLumKm36wTsZc6Z8ZPjFqrZ9fq3HiAfs4eVtoG
	PAWwuk696D/Ghqs3gOjgX6XujD77ZgNrOyyH/Mf6tYPNON9RrwN9WsnrPgS1TPcMem8tacVPbKs
	jknrCfOAdhvwqnA5YTlhQ0dqJHLn1cb7KIroiUI89SQDqRhyMKhLpQhHqUDRnKwEh2nFL8jChRW
	YJzGvY+qJTLIK9m8XMMto/q8noiLebACgaXbNpRMLocg3/gnP0EmnIXtzm8mVkTNL+sB3OpadhR
	1NNCq/gPIGDwJZGwC370xMzy0V9gFwoGNktBI86rqM7JfUryX+bR2xpoR/DoraXE9G4davFB23r
	U9Z/dPXXj+wVqS5/0NewtIcpgURREwJnimEdOY3B3AfxINcTlpwqNZYMRR+JaYET8/kLRmnbKeA
	gRWmS3mzTDoINmMIdXciNxZNj8oCa/A3+oK4wUEcysWYY0WMODSpHj/xhPYx4kry33qpDjAruCB
	zzcjhqOTzMaSwlmVR/AgzyGA5GmnZrxBqh9ijTJRv6slIuyHE1JgY87Wbk8lgjv52xGQWZX7D0l
	cOllVfMODCN6b57KI4PIuoQbKW6kW52w1sDb1w==
X-Received: by 2002:a05:600c:b85:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb8892ca5amr333720795e9.24.1795578258707;
        Tue, 24 Nov 2026 19:44:18 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:18 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:05 +0000
Subject: [PATCH v3 09/14] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261125-halliday-dts-v3-9-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=899;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Gu7LEPVBsHDlbEA7f0+bCh3HrNIpvCrq8874bMnEMyI=;
 b=LwuvM0V2lFpMa4PY9K99qzfFeTZgXvTT9zRsWf5xnLCKTkxZox/BBQLcveRV+2SwtDIXcUnAz
 dTyT3erZvMTCCtObEN8DKkAXoSDLM9Igo6aZR3InSklVdITD6tCjFp8
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

