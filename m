Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578238;
	b=vWt9gpfZjsaawl7xT46CjPtDrLWa0MY8PoJjacnBqHXw6pHekO8arqvBs9Vwm9zFpcJm
	 diTZ7g1TboAxz7BnT2ZqcOeUHnG3IEqo+EMr2Y3K9H4wuj4r7q6Sz413cgmcEDTTk0j5l
	 sP00zAKeX5e8vF9BD/qunJmqPCrReCfgUorBh+5qWU3agOfb1Bd+pcXarmgKFIRIvb2DF
	 Y1D2cU4WRS6UUTXALd6LZkHdTIREzg/j8ctL74l7WTWiYIHJFR8yYMBEtG+DX/oj3YC5n
	 6Qo6ekBR3khojYVFrVncPF046VOOc6J8A0BoIkRC3spsJp4B/pNeKNhs9+dQJYpgNqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
	b=npH1z4zi3U+ff+ScgGmfddXVeq/PRzN0qowWwpPql43lk3LPjoOx4k0bjVdulAeiLp8w
	 1zjQa+DhsQDXKZb3LPzxhfhWDIpHLSSWfD3SokwXLL8rk4XxSFqZ2ca/ZmBWG7wefWXM+
	 lGYNQKN+UW9ETLHGqYCWU5Zyr3m5EL5RScEIkIt7Q5CGnJ/8N34YZ0DVCuLwH5ptzksKj
	 xbBUDmJMVqHd6TC50FXL1TjFlvKBHnhIWvCAlH0eh8+K/RUbb0RYXKqf9xsqPhRCsdptM
	 d+a3Bk6TKaR6OJkdPX3+mVGdnpwlbm0pIxAqvNQCsD04ZAJv4Tw+/c/CAJfr0Epa3Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEBczsA7;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DED606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4DED606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEBczsA7
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so1445585e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578236; x=1796183036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
        b=dEBczsA7Csa4wYdE9zU2ZWCuv3c+lNyP1g6pcCOAtEbnMrJGhamzSdETIVfCY7ZagR
         kX09bl2bERUvo5yj+3/MV0BjBkSARjKlcB2IH+M8y1FiELtNsF7OrcBNCuj9GZ92sJUi
         Ool/Njo35MxX8MCXscU5+lEkX0wMN0iAE1HgqVRhGboodpHuVjgFtUR4qggu1dQycR3d
         L/JwWOYt+d4dZNxOcOHnHLEvjr49y4nklFPyI4Ia30AuczVcHnVqCD+J1JCrA6pb1nSw
         SknxbrCq9BsEdkeakbZLckjVjTdpyHmCg4R6qiYzmIYtSqlHBgi77W5p/Q+PWI0CCX4j
         TS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578236; x=1796183036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXtG7unj8KPVo5ZHcswWaKsEJQuS7Y5YiwYYtQMu/f4=;
        b=uaxb9W9qCPZjAN6u1AZSiMy5zTokgCRZo3TeFe0+ioeVCCBNhEgQzyAdC6yrmIay6u
         mMDXZbbdoB3q47LyUOCm6c15ZjiOzeXc9d2f43k+oLsv9ZVIFZXl9+XOKqTUUDZ3NFgh
         NaV4kejOFkl7RMCuxuN/h3l/f863cv3GXGbx133V4lsfUdfC0lC5MVG+SSoNmPFVGZgq
         zFuzv0Y2u1I+ZvKxUF8xmR2FB3UQOAJOgPuVqP0dxHG89I7Gb2cYgAZ58jjjTOeAfbd5
         aFdmI/8KAObaGF8wmqo4WQtfakgTHR8eCxwGjqU2hpRn23+X7NQ+NPtd5JXF4wW7GjoG
         EFeA==
X-Gm-Message-State: APuU4Z89OrQcRifKZEmcSNfxl5BtIiz6JZTsaW4HNBbdNGyt6J+YDHtV
	mOjPbvKbClcJrkx0h5hQQMh5Y3Ut3W11ZiGQeS5o3xajJFbGTLUTq+eG
X-Gm-Gg: AZFdTZeF6rQs/CosIEjehfjdHm1R+5i3/1S0AHBVgCg8MshdjcxhZbKfpHH7FSm0H0+
	yzb/CWpSq3IAQtOz0pvPXFKHk8J6PmaLozM4CPxDLgVEKHBYx2K54HEJegDr8cpt0RpszaCjJF+
	5HqsYcKbpbSzipIza2fH9sJOdDGtfTk1ah9Umhw5OCW2SELRN5fMl6GtQdYm1qQ31G2puTN1SIX
	vD++U+e4W7HKi9kVBIPJB5unxt4/Odsk5V98U61bgM7/O5F1CFo1geWkkY2j+FpW8WCt4L1+4PM
	+RDWze2r3HAN8tuZzipGipIAMuBgkHWjvMAWZyEQlP60e8qlCyIVDdLO6qVsMRZj55y4D2gQwdn
	7Hcl91w2NlreiDUXnLB05csd1sZt4ZlMDj6Y+6aKiL/dDK6ONWjx2fGMPpUg0s1EfY2OeDXFWrO
	Ph8e1SqYcEkwBJ59eBtczqn3s8hYdk57tuUx1BCXFjxBxVheHTVt/0uFrLoWWJYmLl+90vM5q3q
	aeVPfmk6iRyKeyWgl4qAIQidc8t0g+52GvmkITfuY5HJ3ZomOp82zivU0u+UtGg+qwOkZKHq/Rs
	fJwoJMYBmLGTP1nYxSmWM8wvEXUDbKIfGR7A2g==
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr352610575e9.19.1795578236299;
        Tue, 24 Nov 2026 19:43:56 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:55 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:01 +0000
Subject: [PATCH v3 05/14] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
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
Message-Id: <20261125-halliday-dts-v3-5-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=961;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=vc+yCVm63yJiTEyLJCU/ghFkRJa2TidHkMEEWzw/3Gc=;
 b=Yg/VSr0scUN51i9KpRAWHfU1hj3WxUg4RAt781FW4PuuF2y193VAPyf14yap65FpsWKVde5Xo
 6se4dVNbdKnCzQeUFO8eyXXWtGTKy5TyIr8La1GZjrp2oxL2C8sTpHU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0

