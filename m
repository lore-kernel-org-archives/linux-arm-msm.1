Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864441;
	b=ySUk5U/LvIr9UkRRQIoJifTOI6SsVZroMQ4JFKKMbYR21JXYd31Bfc2TKSnlCsbB4qPO
	 i8Pq1zErxBFqOahWhIwkKbjNr90x3MM2iXp9sVqeb4kvHlNnc1tRGXOccWcXTM8Npou06
	 Na0Ef6UxKl3NtT43o9/waHdP+9/mw555u+WJVoGzwaZQCs9IzfT4eFb/7+eaLPyB/f9QW
	 5ZAUuxECdqvY2W7p5pvHxT7vhTa8A2Q0kJuz9oC/9EOw+hk9YIi2ZLHeFcS78WHpXztEo
	 6eFhwT3Wuas7yu2XQhoOXh/Z26GW/oPi7dL4gi2V5PjdyetO4yaQNSDcAEDIHd85sFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
	b=BAoK1HLXVzHA37Lb8eWLZZ9BI9iDtGIEQsFDsNrPWc6tSPIQ0LEeOxlvuAzKwo3G2H9m
	 I/Elxqkw7oHQ7NzmWk5rcEpZWlNJ22uc2H1ueeGwx5WOcBW+dBKiLsQ22rhn279xs4FlX
	 Tb4ry90goyW9tRn0Ul1nCdz1EecpVHE9xlB7+KXDkCzc3xP5QLfLC0d4Gsb/vpNCRpmMm
	 aq5yvBohfaocNG51REowtOm6EvDPHzChTU9Va8fsuhE2pcvdG0hCuW7+PL5/RDEVsbzAt
	 GLDa37vn+wF5rneqKq/gDhs5yzDMZ7f2g9giEan/urfXh944OPcN1JGyXSRApKK42/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG9pfL7W;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E08606A336
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E08606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG9pfL7W
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso27635705e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864439; x=1795469239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=AG9pfL7Wd/r6/98cIDo+nVLfIVZ9Px+zjsXE5kwL5C5mXq0vvRxtAzXqCOjP57c76/
         QDAdB73QojRTusWajXwvXLflOajjTrRtPUzzN2iBmylVD9h5CuWtCva4RFTGQ3WAXdqj
         QUPHfhV8R3R6+D57fWZz5PoRdD7Zh4aEwbeRy6IRy5hp3spzPFQuezFUatlivFZZIhX7
         UvyPXGEihmkcLMT0slqp/7SwQoAyDHmifQcdngvOwon8ytHUPr4DHYsG+dXREzWIOZZf
         o6twMtZmZHhO517aRhzfH+NpS/QusUvv1lm6Ilz7LGycETpzHg6Fbdmdyo/hrzPzp1uj
         QbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864439; x=1795469239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=qrVZBMFRVBuUapyuKDEOqZzol+sRZsdYVuYATVxcVmVGBPBE11jv488BMBKJ5wyJBY
         3peKLMspqhWuNB/suj5BYCdfmsqih6ij0MBBoSamZki6OnDOPZY+BF8Svz1wNoaqZMO1
         5YpzFhP+lxmD5P9VPHPc3Nak2rQFfL4YBL2GqgA1yVCJOXdh/+ws8B1nEsU9zjYkvzr8
         cP0W2fnzveFt6IQfXU78/uOKiogv50gIv+EUqqLJ3VqtIBuOzX06uqRXaxA39HI1XK3x
         0+X0QngDOD3y87+r235WWp6Wx2384us2X7XCnMkEOmZ02TRBW/B/ZfXXB30v6QJhQ4zo
         ckWg==
X-Gm-Message-State: APuU4Z8jhBIaXqaz/cIhP3F3dWYByRzdDzW1BS8rLlpYJikhG/AFVL3L
	a6wA+4BoscnZxgqanABXcO6h8LB1A9TdahdEUhwgY/Ffy6zDcH6cnyMZ
X-Gm-Gg: AYBFou0+H4MlJ13Xbu3fR051Dxm85hPJdEpUM98DBo8xQ2QslLF2DAPZ6+zBjLjviRH
	k8Y3HDuQ5jaNJqAG/Fz0B9iivdD8Sv8clduLWUzvQ9SCl0nQwKJ0l/tdUmhxDlhTv6+7qSpPkRQ
	/ayrkEgy6GIYvw6W3q5cnU+EeMkSMIm/lUhEDtAL6sL7i+us4PfPSqLks+2dNFPcTRCjIur7P88
	+aA6gHsltd2hzK38hK88jNeOqtQiWfB9IrxFSeD0zeB0zxG0+T4794+DtFL4QEbCKtMIVn/yHv3
	X9MXr3MQlfTPJw0D+J1hHIow8n4Da7SIgo7XLsRZUQS/IWJl9fM+Wx40cr2P/9klEBxj07Eitjc
	ditb4/l8noJpqlq1e64vcFuk79jNPHYsZ2NXenEtinKgtQKtmrjuOx23bjsfij0oX1TX8Vl4NBj
	SdaBZTS3LSXHzU7G67bv/is+Bh1R+jAa05LK97CF4UKkw7mA3n+9lkIifxm3eeu6Cevx+aSqkdY
	yV8DXzjb94DtJ/J88jOZRFd8uulv+ZDkb+r/mlp1L/B/TrBdHdzJ3v4xCWJfjZD0xTp7AGbuWHk
	KbxVKrfSr5jVEN9hsGsXLvLB3slOstrDSaki15aC
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr255653315e9.13.1794864439353;
        Mon, 16 Nov 2026 13:27:19 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:18 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:23 +0000
Subject: [PATCH v2 07/16] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
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
Message-Id: <20261116-halliday-dts-v2-7-2c92438c6c46@gmail.com>
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
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=993;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Os3dtyGi4Umq8bQ7AEz34h0NK9e+Ws6GY42XJz6qujA=;
 b=JAnPagjMpge0X10XiR/LbxFcl9vIwvXlY8rdMR3b7TnG2zjS5Ef/3pOUFBSYZcopY2HJ+t+/s
 qtEtnXV/IW3BvhWLgk5yEo8YJikc5cpwNQrDqesXNsRHoPh2k6l5Th3
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0

