Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864464;
	b=01Sc+E1hk416rNuIoARjmgt3mstiJIp0537Arikl8zSHuyS1uP/e8BNXHYMV7d1CkzPf
	 EqPn72OwVdgl7YqIddLCFEaL131EcAIXDoy90eaP2JmhxYJKxJSRDooPI8hgCRqHJaZDl
	 Ii2CdOPKbRIaKapAz+0kzNesdY/c+gkcjqrrIz6wJFnOvBZ4nEauT0VfAxEHQa6utbVM3
	 ngnmuMOOoErfDP4W6/IDdzMLXOlTLEINNRkNSK/kObt/r0GgYg22ehx3VjnFZr1PVZvsV
	 s5vYxXFcsvsFyjM1tuwA8jS04OwbMAF918qgMNA/jWLH/z5RlI2McenPHEjLlWEnDvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
	b=J0z6VDv/H49B95oF/DD5eSQboVSmNmRW/s1Uyfv7aDUK1XX+DZjt8kEkcv2G+LztAkbG
	 235WZfWwCRchpjXaaAMMB9PmN766QWw20U831y5I7zYley8m+5OSwpkcuUL2AxoGktHL4
	 fyQ7dfcP1BAAOA4CWlKyDVZgG+4JF74P2D+wvOdRCVRHaC2iN4rNnKM1j5EsKCv+/6+UJ
	 RORQoqgdZeJCMMDByVJyrluEYHoJHPZzESB4DELFxVWkxOhlsK26L9QPieuA5MT7zMdxw
	 AAZnaaXmwVgdr6V72crpctz+jjAlXV7qAt4Rzt2W2H7p3leefHCtAOGnDEOctYx2Zxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfokKnjC;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D4B606A331
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D4B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfokKnjC
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso22080f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864463; x=1795469263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=jfokKnjCoBhGXval+BtxxMIEBcJuEILgvyGX7VwyLu6Emt86PG0cHN8zHavEn/go1l
         JnXO60BdmcgsdTFaKXKwOqVgTgnKxvxwuDZdga2JS6GdbOlVDW2WSZOvNyIBuw0tf4Qv
         RAvGWInSs/2O0ObHsKhseNZU76QAiuroYJMR8Mfw6u/mKdWrlCyyVnQXsOqyb/6w+Z0i
         Yg0nO/MHmkz/gLvmULkydyzWvLIWSx2UfOxq9KIjYxFsMAxV32ihPcPbvWf7DuMidRCi
         vSW74NEJbetjLwGeeuNOhALF8E+VDVV0qaT8Cg41pI24K0Mkon/0zMakEo/amjlR1J/B
         S9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864463; x=1795469263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKraDRr1i3pFiLzoYIEWaHhHBRYyhj/gKsvyx4GUpo=;
        b=nj+DiHL19+n8YCJ7Xq0ag+8gmil1fW42yZc1SeW/WxqY2rN5aI301ot7PGaMxMD5b9
         CR6B8e8bFYuarhO0WmAinvclYbpk2DehUpqTR9GWgnxYDlGNwRaTgVJxQ4a0Y1oJSRNC
         kSXQPwulkexWoRNjfGPeHrMUVDoLyV51/0OSrC3U8oRqjlF/tVX4roJOn6sQYoKBa3zw
         yhcgqtPXfF5gR8Y1J43Qv6n+m4TgL42/5fs4FqmsJcXyj7MJ5AbcU9UJJ4uG8paOaUip
         0cCiDLvTUyVrUiD9fdaEkC5bCn52bkIX8wuYE1KFPf/JU8HAa2b4Ab8bGwsfl3P4dqud
         GVKw==
X-Gm-Message-State: APuU4Z9nn8V5XQkav5W0L+k0UbHjRN8lYU2/h5NGqfbS5Qvz7598cEbo
	VOo5/kPL4K2Qlyj7S2jH1zuHHyVxsJ96mSllCBHBLyY4pjyWb6go3wUV
X-Gm-Gg: AZFdTZeJunvV0LZ6eYsbM5uBvSLf+eEt36kuonJCO3HEdGxBTigA90MyGgyRQCm8dTV
	rss44RVuQYK/j5nScy+pSrxR+hhe5FS40IA55OwTjfOzsQu935SnudfGXE2mczh8T7VCOUVyc3O
	QpcObro/9Z2JLXme/6K0RtkdgZjzuGDP8VasTdu6fSIjlI3yPYdcCG0oTzom3pojrx/Q1YTrDRq
	OpENPXT2SeJCkaML0AT7wKE8nWm607ctK3b413c2mIWQ6hAX/2VpJBR1RnWhJe9UkC1sHf1rjav
	r704qXvTmpI1+gJhy9deS5wUNHwScJ6F1pWTXsZoTLbg2kAZQoe5Ht5JrJ1q533v/kIxhA9fygJ
	vcx4HF6iC2yvq8BE3Bq5syEpdtQ7Jvs947RYYgN3XTeoVrt2jIO+16+TaDnwPWxczSroZH8aTM4
	3fZXMWTKMImahNsBrKvTSMD3XRbhKvK83A6BQMywuiBNjG/kjSsIW7NPaPziCAsw+uVWROA3D+b
	e4JKqPc1ER/LRBoEEMoX4pE2ijNQik1C2cUDbnmnYVkNraUzaribmhmv2zJW1vch+fz5a9DzKT2
	GRjzjyxUSIb1Hqfv2frWdnakNDxinZUXTnQbkr/T
X-Received: by 2002:a05:6000:438a:b0:491:36b3:22c with SMTP id ffacd0b85a97d-49c6e68dc41mr30686056f8f.1.1794864462819;
        Mon, 16 Nov 2026 13:27:42 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:27 +0000
Subject: [PATCH v2 11/16] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
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
Message-Id: <20261116-halliday-dts-v2-11-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1106;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=OQO+LwEeY64jVYcmV4r5bBUUpcSQt6/n4JPVT4Z/sxw=;
 b=lNijzEKQlyljkWzaxIS9zrys8uC5qiwJ2YpuyG3Kr+5tC+QMb+R4Db6kOwLBwj0GYnOv/QX+7
 5U/HlbRtrBQBhLGehnhSLzxDVWEhcpke2OLw7yIeYTlC6a6mrQFU5kI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0

