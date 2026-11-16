Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864452;
	b=As0VzflRd38RC0LRhPPkWVbiT74II61RdRAsLmo0KtiRTCzCN2h0EQPl72PMnrDAUdjk
	 kWNlu9z37UG6abDtfKYF+nNKgfClW5ZnbdgsThf2vAqapvMlJ0Bz/KmGLXP2Oy2qr/1Zg
	 3nwozaLar0RZQ00a8BGCwuCCU6XgUrQlvKc+AfFqc0y82JKXupRZF4HvKQvHjFuTmIcTm
	 Usehb1u+u2PgShVbxuOeItNbZxwo91i0Be+MsvJrwOlMt4Oo6/t9sLymGYQUJ1Tf/m9u8
	 iq+ntmmsTqKWJ+uqVI3ZblyZuyCkJP4E+hDns2ZfnRJzMDP0vQyD9bdzCrtrvqL0MVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
	b=zEhQPL1JsXMU6fxKGU30xBsZadyw6TVFk65dA1B2uPgsptzIIkjibFs4seDYDq/T5fg8
	 Aq84wlldSI8SUMtJk0PqYDgN40hmKDoVhdx9HdVPCzsPaIMSXnrJUcKHPS2zlVpQX408e
	 6AHQqnsZnF4C+9yQqkdwdHolo3nbsAe2yXi4r1ToFRwMmUAa9w6knWBW/lgWpi5Htht1z
	 jW+jQ9JJ3qj64MSkPqDhEJW8LaaRSndehVcDfJkeUZeyAP6Cqs7V/8Kiag0IqKCFRAwxA
	 EzVLT30nlEW3hgPIDLTUY6+P3bidy5D6wfdwJyKsZL7CUo2kf42DxVegYISys9bZH1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pe94GAJI;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD153606A338
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD153606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pe94GAJI
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so21284705e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864450; x=1795469250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=Pe94GAJIWEr/y+mRBwb7Iog7Ajds3LL8wRIVBH/8xPQNrjbBDNlEcQCn+p1QOcbrOV
         bH70aW245d90T1wUfTfa0Sb1xipFO0e3BL/QPMT4jfWcMzOuboVOx66DzI97tdUkpVn8
         em63v1WpvLz1xDjpzkqtc09ikGmguqMkXF/iBCSCrH/7rvMJVikSjBvdeaH+nfm2b/iW
         Hjkp5FslDnjSyufprS3LahKBu44fJFSHmzAIkvAgbVTvZCwJLs5vDW8WjGCFxFP3mws8
         5H88Pj/ByqUxoJReDfmjknbzv2qH6Xj3kHe//wfRUbrzreMGjXoGLArpiGQAfFxpX0lR
         wpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864450; x=1795469250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=qGSRVXCAMQGJkvukooNqQ9LmwB3I92uZpQq2i17jDtWC/tJVKzyWZVR/t4ke68/5rN
         Ipw2NBJn4HTvQtVeeQVEwGRQHwMTBuMCYe0xu4Tgcw4LvHSjq2p9CbqI1OLczOQRy1q0
         BsnzEo42GvdLqb/3HH0Z5o7A8mL09ttJ9+9IBQC29kybYXtIk7GBhF6lL0QAaNRoM529
         5Ioa6869MyAhoHGug0bOGE+nSSLno+rjjDwg+5XGTlPtIYnH62k6palp5n5S4jnT64E5
         VonaY9Xhj4+90tZGVo29dcvBsh7zn4NC8bbpSauwLBAbSn0xUOgu4bEu5RUmgw89HUDi
         YM3w==
X-Gm-Message-State: APuU4Z81d6gABg57LONf3paKJWAKloMHiPDxEQQ54upKFwYlUSIKSlrk
	v9DOHMEJz7N/IgJJbX9eEkbUMAIwlGQPjJP4Blb2A34SAu6R7pGxxRr1
X-Gm-Gg: AZFdTZeROxn57wXta6U/WBJSsJoNsMwx/IQWUuu8JOqbv9/fM9mhrioYFjRz2kzBgVf
	oH4PNzC96+jA/IgBX1O0maoQOCTndfqkuHmIno/+e3oP5vCtiAYuTSRMHN8Nuq45mgVfpiirbcF
	7Hb0bsRVi/+ufIX2QtsFTN9Ao/DTTnClsM6gqysOM9G79k36G1uWW29znd0gjBmcyuluWyz4E2G
	dFHNTKeSHJ4o8qJEpy1mRKvj2kKMviBDpl3F7YEgtY2Hjmai7jPkyNcXE8aXRIKHlILaiNAGD8m
	GYcm3gScof0N5xl8bwAU3pSfX7orzkyjBkFkBLUDRNHKyLxUPJwIWUEMRzu7RO9fX5tn04Svnk3
	92w9yBPT6WvGCioDUjsZ8oJWkBTMO6+M03bCxBPMX/tvczAv1fdB3JUKL6xJzahngQClCFDDOzW
	D07B+l3sM5mpUpxDR3FoAPgq9kRbz909tis7pRH7Kf4/fu366YGi53+vcu5OejXyFYSbjCyOkhl
	hfzbowijvJoC3j4PXJnvcn6IzocFhqNTK11YLr8sPvH5KPDu4OyTODH1fVVD0Z3bJQQbApUwmrO
	yPn80MniBFgLOlUj2OyAdPEs+/6tQTr2fwO+WQa0
X-Received: by 2002:a05:6000:1a8f:b0:4a3:8b21:51c1 with SMTP id ffacd0b85a97d-4a38b2152c6mr1214677f8f.53.1794864450317;
        Mon, 16 Nov 2026 13:27:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:25 +0000
Subject: [PATCH v2 09/16] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
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
Message-Id: <20261116-halliday-dts-v2-9-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=Oo5JC5eiOukaaqszf2JD96qfK1gjo4Z88L7lhFkJnmKZtf8EiRQqPApokWBgoFrRDRq84oEys
 dN0aV0Wol0LDOOw0PtPKsKDeYZp8RCTw6bkJAf6hQZCCV8VanxNS3ZJ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

