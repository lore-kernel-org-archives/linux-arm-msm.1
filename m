Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864446;
	b=SBz42iqy4ODuqHygwlfnnbf+Ql6NxcRazkWJlfdQEcCQMeGd/ysT2vqScXlBT/YOf9ci
	 tGbKk2nFXGmhCVL02yah0I9kqsrBPvYgnv7Is8FUIf+yvhe7WkasjlilA3PimPxp9Wi4O
	 BtZem9MwCQx9L8zvbJCcg50OEdbebn6hNXfDcsFoh+67s3DC0XuHW9pk0YS0rybgww8n2
	 5G83s0XbE6HEz8YIW7x8YldP3YkyzV13yhE+GOSgeIUmwpl/mWJrEdJ0byAS6DBSsc9hl
	 meYiZrPLl52tEOPrS/3Gg6TOc7xgili9JCCJyhBX/jVYlq/eRiPHdozKerARaNyF5Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
	b=SJDuUhtUHlL1Vy1t3m3XM/h9dApKyYQZLaZ0VjLbcx9Pfb84oibxhiXz2DhRwgqwMVsc
	 CxuKHYTBJy9Bv0K4czyLQ4ROtiV6guUtusgHg8tNVy/skVC82yajiwwUvAAS1MBw2ACct
	 eKKtq+pgiwA1gG+xbOPhF3HPSK8G60J+ziPl+CZCPQgX1G+avoPWfcwlvQuDZOn4B3XFX
	 wY/SxTeM54gURl67UbXUYNzIZgtfotaukah1oY86CHceQngF15APuIpOogSMsm23AFWCl
	 RqPxxjMFGLInY8OTxwNiyekR2TQPNHhBJ0mmsj4LFxgXfNzE6r2itxI24OR8MH35clg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWmpHX9v;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70441606A339
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70441606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWmpHX9v
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb61185057so16928725e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864445; x=1795469245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=iWmpHX9vy8zy4+SpuLwYiHLB3ln3/7sZipWq17iQxZemFskLqrf+5u0LQFERvFgOg0
         YGm75sawrb5dvvPHQL1E3tnBDx/3Lj9iGKAvXpNm6bZ7XZPo570BE2i9caMiY5IKS48b
         yiBmD1KuJl1DrDWRRsqVTXAG16CMeW5eB5GXQT6VgA4c1+z5l6oZ5HSKUqabtHjZShkT
         48NHibHjglieodvDk4cQu2TecbGkn+qDMwsDpIC4OxFmZTkuOj8+6GxuMUQCtCSsIVCD
         HuGkdrxWUd2eVnv/PV05xdTNl8Q6L1L49LNERTuDgEIO5Ltu94W6gpd+G19oZ0m2OntX
         /SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864445; x=1795469245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=a+kIXc6vagJJvZPbAUEB5P0MdgIEdYAVrYC3qUJbSjXKqB6eLh1XTMd6d2iG/K5XVt
         4LlUrMjJORB+uAX4DBG+65zfpqQCKinmSl81lPZMEP8tCw+p9UC4QuBAZEs0DQlzwF4Y
         3TqlREHol9FWYXw5ZvehJfq2RsYGmOehZMwQWexLshpmPgSmoPr2aVLJ9GSSKueRez2w
         crd92EHWQMbzuRYRpuNNm/OHzaEzLv6Ox/N9BcDPKIaIonJ4DQJjiMSqbgvg6iHe0+/n
         aGyOEH25NuYYZwX5eH7QrJcDFCPZhdsIlYJ4x2qp6+mJALc1rKqSM5Q+AO3FynsRi5+u
         hzmg==
X-Gm-Message-State: APuU4Z/BzLcyGDbVQpTP9FMFB/LQAJPE+v3fFxqN9rPjut/9ydmhNuM0
	SMb72MNryS4Ry7laT9u+7YfsnEHEPU49SlIHqQfebA5XAcTCp/g0oEoN
X-Gm-Gg: AYBFou0CRC3m7RPK1kqmlXmGepg3yZF3nM+02KIO/ikl57W+54K1lT2tlEcE8CYJEXc
	+KPG+9Zye3Tn3LmdXnwyVJ6fXO92nMiwE/p8L4pIYuzSnTBQfanhzPuR+NGpOATvgc3mrSrIgfq
	lWVRtP/j5Olxkeg1szET5CzNSSi50nxQzJ+SskpHy66Gis0pN0Y90bGPCTN7XdaXhWmMG3rqiDx
	yt3DDvL0mAWzB8SstEbEHoJk1CdQME8a75DSTVqfTV5WlDnopDtEX7pqqtjzEkbSSlDm0stq0Xw
	btQxjiRZc16BdVPVNqw7RulqK9BY3AIEHTXo9KUHxjHM2wWPMG+NlU18k+pmDfQqPoWAghkXZWG
	4N55nc+ftqCBNGBgGtAHTopY3Dixhx12U66mIesyTzqpGrGeAvB+r7BiwrKTQ5mD4COmRScp/Qr
	t/wwWoMxTVfNznrK/nRPtsE3JUhmxaXf4pDS+d8lNtxjoJNp5LMD77GvhzV/gGcNxWigtrniRIl
	aP8co/nj0gWgzz0m0K+r2oJP3yCT9oMPOZFtI3XP6eMQg6JVNU3NCLAy2aER3m0acfe1Z+aisHL
	jQ8tjaRFxBqvPG6WlRrYjj8ejUlEd/LrLxpASP7e
X-Received: by 2002:a05:600c:6548:b0:4b0:c1ae:829 with SMTP id 5b1f17b1804b1-4bb55a8d621mr184234605e9.30.1794864444941;
        Mon, 16 Nov 2026 13:27:24 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:24 +0000
Subject: [PATCH v2 08/16] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
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
Message-Id: <20261116-halliday-dts-v2-8-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1028;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=e5+pG0dDXEqC2bp77Ez+oDydvwUzWtL2BPwcLeGQJvE=;
 b=gD8xOm5xZ9FtfmXv7b9AItlwRATNEZobnHQBfav0fJLpw18USQbXaJrBNVYJ8htSmcNjmMoiY
 oIwuZK62UjeA39gKapnqrq7NNerfrM+Hz5ecpQBWUPf7UaNqv3Q7sGR
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the UFS host controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index 3c407426d697..5d1784baddd7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,halliday-ufshc
           - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
@@ -40,6 +41,7 @@ properties:
           - const: qcom,ufshc
       - items:
           - enum:
+              - qcom,halliday-ufshc
               - qcom,milos-ufshc
               - qcom,msm8998-ufshc
               - qcom,qcs8300-ufshc

-- 
2.55.0

