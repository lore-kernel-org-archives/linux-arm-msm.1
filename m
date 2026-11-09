Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184427;
	b=aeY/OqJqK2r/OesJT/ei1F6jooKeXiBwttsSdF3JwlXle4ma0oGl1mW/htmyM3G4P/17
	 CYp4EEDHnelVTADz/M0yt8r2W9KfPKvOc6qE4wOESp3Wq4TCImAdbnpPQA60V64BzhgcD
	 mQatGmNwmXx2rOc8kxxMM4EvTBQmWj6FXWEhGANFzc0yJOsXOGBaExXzbsZb0U0qUXBne
	 3kGu/l6S+BMps0rajI/Z8VQoPKkmu5lJfnSrSAOHpf486rgD2eBQzP5BivXJAyhVHZRAu
	 X6x44kPsQBgpM/Yrg7UEoeMvNdX1BFQU2KXwqDkzzl0NA4WzyQOxPtjPgE68rp1fmIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
	b=QzaVzSCKzL6p8DRhRCZKK7ARSnwb/JyIrfv0de7LgOaI/0y75gosyk70CmcLgiSpszdh
	 JrHfHPutpiEZRw23FyL2gBc+iHT3c5PVj4nvkQwJ+5ZV0VogibZQDw93agackFc0jAGvZ
	 Z16H8oTW1QEtRFsK/zTuhAqBBkg0lBKVn9QqEpZgC0r1l8NZS22yC6nHjhjnl2WhxWEL5
	 W0hFDVmrn3Vn6iGq/weDbqBwBBSeqtnybjtqTjB/gVkIIWkZbz1Ndwa4gg2TRaJFgDORO
	 cHHqbk2vTGDbgMumCjBQ0gu9HigFp7Zf4GamkBCmpeZNhAy0vAqFLJ2j3+HrSOZyIjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FyDzKlyt;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4085A606D808
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4085A606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FyDzKlyt
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so3725065e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184426; x=1794789226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
        b=FyDzKlytNlxAxLxC2gOdtwF1+dCkfYwbnWO6d6oPLIvthh1fBT5kqIqv3qhAxjwF+S
         PFR8nekUaUaUbx6CeF7ug3qsqKHwR/kTO9V1T4Gh8dASycorY7RcdrnLPeG1D5Txou55
         xgDbR4iPItBw5wvy3bOWz0Iyu/+OIfpLVhUWEPhctXpoFJ8gpgnVrNIaGCrAUOL0ZPyt
         NxOLj8n/xATQtJPIEPyzFjU842UmMjHxhCBNhBfhWuqVNq1zEGFr9t43gIXHmKQ8IbKc
         HMtuRXvOTX5bhQuwRu6FbfL0UoFdw7t7IXKyKMYwATRvVboP24aPvmrx5uB0BcbSe3Hm
         TZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184426; x=1794789226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
        b=y1oEMWmqv1P60fzRQMdbwlQc/eIDgmgZWdJXLxk17jYUzfRIK5siX4D+GjEpx8pr3y
         ab8NOaR7Xoqw7HARWChioxyV+jPSxdfq+hrjOjc8oRShjMK3ZJf/8GABZBrYX8nBB9hZ
         b+3xJdfuWdH7kGsqDLPH0DXNdz2jKwAKRWBh/di+CDEmmB0RqAivteuEp05nMoI8Zmae
         D5xE5DqG+XZi7i5yt2SBCgvIwKtq+J63Vkh1Ef1BWfv5GKQI1J4i1g2iVUPCXP04YNUz
         9tbmB3ZUZEsr8kwOqH+FJ8TXmgBvp4XPf5xTKRDTFzjb72Wr79/zwPSaL0q7mAbff6T7
         Ox3g==
X-Gm-Message-State: APuU4Z+F3SWrs9O6D+lCNdVSpw1ckaYuE4cUqjjKJj0yKK4OdXQVGbTd
	ghjxGY6xv7c7HLm6kgnGBvvHZIGHGMtZACkEdte6yjC3N2g2NlxVV922
X-Gm-Gg: AYBFou3cwVfZ0Nhi17V1obvVkvLDECQMtF9AkhqSTL3WHfxY+rK9dbaeDOtyHl5Y9q/
	u7R9LwaiG599Lx2I2xTGHFkBveH2FPi8STt5hqMVbWixVu4SXvxW6mjiCxDlGgl0oanRx7FuMXR
	tu2Q7Jh1k82uhrxDmijmep3nzYhwLhpJh6w52Lju9vwWgA+BasXO8wY+jxdrzi4cgqLG6V/Sngw
	F5W1ip+M/xGn2H6XzK63d7ZGq1tTDyaAmH+1BmZVR6CZYJxNQ9hcdTXPWziVZWR778An0luzZWg
	n7iVQW8hv/3TUTLCEjTwa7q5ub8ATb2oaSUgH/wzk9vbnCFPSSZVwFTparTX9JPJQpXDlFKH6U+
	Dy87uAYtmYHxpsOb4Q0siZNsvmPmgBS9JUxLMcv3VKImwcvwo+65jq8BVipuPv/fnkhSTJNYwUJ
	8yMYVAX+hDcoHKR772NXTFWr1h0Ml/ai6Hq7qlhrRbAxHd68bTECwyFjffz2tocdeXhb9o0FHN7
	Mi5/aN7iwMl/PYYGeX0hnwy+EOjWNkycGxEJ1DWsZ18v8lLCxGpJVwt07MSsi5ZB/zZBt5TeZWO
	g9F1TBeb/RzhrrgpTH7Q/hOoM8Y8eZD5v1T31Hmu
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr43372595e9.35.1794184425700;
        Sun, 08 Nov 2026 16:33:45 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:16 +0000
Subject: [PATCH 04/17] dt-bindings: power: qcom,rpmpd: document the
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
Message-Id: <20261109-halliday-dts-v1-4-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1003;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=el/mD1li+25cayhCgWCSoEmU7xbrdbDdv2bm0vKCgf0=;
 b=AAbKZuaWziyLaKTlH3TAQLDLLUPJbQQuUGnW2/exeZlWjcPjeJvTUQ3Mzs5Xy0Jsi923+4Jy6
 HYpQrlT+Y7QBXM0fnEs6fk3DZfReSJNsf74HPnCiwzI9V/RMLtbXEW8
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

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

