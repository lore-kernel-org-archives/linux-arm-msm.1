Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578233;
	b=vE+m2obRUqm+JNSc/IuzxlPcISEKG4sLfpXooeRHhvVkyxpOXGYIZYaR3Z4DOZujJfKZ
	 hoYuQrC+gUyGhZiJN7o1KNiYPhB1n85ZRptC3gzrkqbYREN1SeV9w7mRhYEzG8w/B5g+g
	 6YmPaq7zBAbGx7ngUWyce0JKCTKkAyAT7wyw/u4UYap1iKwXmJ9WGwD/8EGH6cIPmG0Fr
	 M7TvSbaORjyQdH61Uuk84zyOhs4i9W9AyGDfmBOsAQhKpV9/kKVnQTe4hemqreUZzsoSh
	 +FKBYy01F+qQzylTou7GjoXHJ1PuQxbXVE7PE8EdqdlGfy8S8+aJGa+7+5T2ZQ80qsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
	b=yjHvr9L6yiHbZ2q/kxEmICicfPYnBLbHSekAv78kFkNFynx3SixD1YxHQFqg9gZ0kUtf
	 BTQ4KNV3YadfjAdaAscrupWTHW9q/oIC7a2FJqKpovrX+79m/JqkOmrzLKQbZ6ikUYGAZ
	 DFc+xrssU1uaxhUKzmqHOP9aHeh3i6Vt1TtoKXe+uJO6hQUupGekaZ9cxcaQd4Y8+53mr
	 UGog/BruQe4MQ+g2mw9tlCcf6I6ysEV0NPw3X7GJKgs4mCZjbdxETM2T0/LGz1AQ+ovbf
	 AlocmSaaCIGNfhyV2d1Nxe7Y22M9n3L3+MynT0P8xskhcGsE7XlPxZlec6kncb+Ffpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk8tnEm8;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B24606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B24606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk8tnEm8
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so41904975e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578231; x=1796183031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
        b=nk8tnEm8F0P2E1eehLNgHEIiXKzmAdnv1GtH/CF8tgRUFnMdxr5LS3wLsOby7S2Q1a
         cu5bhPH6llcMl0Bd4Ml3YCNlc2qzQVZYy64BU5JCXGdyxYTYIWgn76wItDfnowDbq+tj
         mBu/u2AoC4EQMLN4E5+BKngr2RQbPOWFa/jkefPtJmpcw6O8iLS9NHjTaOlxM5gw5aE1
         TTT1BHa+N0e/SyZxRABUIDdmTTKnn6jXzsMzYF1JRXep0cV+iS6lgDbG7uwfsTTzKX8i
         P7xAltyFkuPxXGNxubmztICD+yHtWeFb0K/WzvCEm/RQin7lrSfWUIrr7aelUKKa99i4
         BZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578231; x=1796183031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFgqKxlazYIiygHGpDBq+o3O+fyKWKSRL7cBtsKpS80=;
        b=SNHWFdoMRmQoFEL3Vwe9PbyzhJyLaobrXVDqYVogCY31oJ0Y8d6BmksE71F5xeN+BA
         o8grtTpaUnqDfuLExQ3QNnnb6zfNW8cTUpkk/H8DwzNRHaWP6H1Kr7YHC5rNiOJsXllw
         iT4XLewpbjV/PJ/jKD2jyn2NqIJfpEUCUiP0JlPG1eunhLYV3O6Xx0PcQrhNarnOo2tw
         eYvQOQ+COclTAff3h/z/iGTFsScx3Vu027nQnQy6T2YgNcwzboZNPeHiYHYaSNX330F/
         MbRHweJu8zi1yDMnMN7UrhE2pmKNW1Eh0w/UoWg2jo3ktgA+xCS+u+tkjDxl/x46hivV
         DV/w==
X-Gm-Message-State: APuU4Z8B65Qqg9SNHsjzlJmbGN4cIRzUg4HgH21Jw0XKIXbJftMln11O
	3E5mf2WjvD/7x/qwLylRdCGGrCiBXoNBbHDTPxLYNIkHKyiGbsG6y6vO
X-Gm-Gg: AZFdTZflZeAg3PchvVwgFzBoo9UKBT4YPUXzqqAUTrsEgg3Rc7b8oBmbYXcjIic8/+x
	yTWeXYGchpPjQUb4rIdYTzuQpO54hnFGgMoa8cPc4mo2yR2h7Fzt81/TgOpbp4X8caCp5FWBlXa
	aV+T0goNaGuwVnwJzEB4lDRIVmjM5zmlwoheAChG+nTH4W96Cvb2y9UHEUKWJN/67AXuG99CZyC
	zO1TdXryUDuNz+pJo9wK94jY3kSSAGoINuyLA0GjpUqi46zjHA384LHKBy0aUFmolZoS7/Ecu+J
	Zu8LCnas5pUbL2dLWXYfVA7kpWhuUnvCsesEPCWJKoPYxPFWQclWBfwNudEFrH7h6rbsLWU8EJl
	Atgh89BeslARKUAk0fLoQ5bi8lAUnJN32QyDSJmcsYhGkR7hIlUq1m3vqQ3tsCL7ehBerSn09ff
	+EQ/gi+fOvF7WBlP5VyaLGxDKxXTZminCq5piQs03iX9vZMGQZ7HzKPNPtdq8fuBwHmHJGSBBFf
	JNPBdohuSajcKkq4skFJsIlyHFZD3OHLqxaicAQHNNVJHNOX+u1j5HAP+CZvsR6fA93gUhtFh6B
	LETlqBYXwrzUbzQo5LgUN7N3SnxNNKR5PZvF/A==
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr298467665e9.3.1795578231386;
        Tue, 24 Nov 2026 19:43:51 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:50 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:00 +0000
Subject: [PATCH v3 04/14] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
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
Message-Id: <20261125-halliday-dts-v3-4-5c8311c0b70b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1362;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=rZ5xhc0Wj0SK9I/jsxkVVRd7EbEiuk5dcQZat95a7Og=;
 b=FzPufPd+aRuNJyTsxE9xMnhrwTERQ8Vq2nvn15hQVL6HtktHPs4XaCfbTVnTG1Tm3lVHQREl1
 vEmjvIE2KTICBxf0qc9edU3Nbke7+MDNmTz+aRTaj8sSAc1QRotZJxE
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..7a8b72d2929d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,halliday-dwc3
           - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
@@ -209,6 +210,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
@@ -570,6 +572,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3

-- 
2.55.0

