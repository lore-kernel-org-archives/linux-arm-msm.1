Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95703AEB29
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307577; cv=none; b=HAHgZtoFk7vNiYOorQyuDo9Fene13Lz279VYv3b11BtMDXmp3c1zBVG8kD1wtgMRNggmhr+n8WDGV34kGp2S+DIGs97i+k05yaaSb9E1+4yoKtNnjwziy84kAv5gaNbZZWsxup9PQGHyig/uGNk//BLFtLk21yNic97MN/gKxWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307577; c=relaxed/simple;
	bh=DU5hZk2w72UN7XPPKKC0Ei9MPQopHgndGyHLU8P+5b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpnphcuGYC2eMv3QBJcVzXjKILPhN3lKRd4FGqGESK94EHm+xn63DxkMwqlKAwpRgfebH9Tt7aAHcvLmEjsQ5gNucwIDTs4Tisg4tMEcNrVe10DWXrd7IUfghkFkCzcdTZbTrdJbM3v9TkU97IowHJ6fVOJhV8WhZJ+CQYPTEqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2p8c2PP; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2p8c2PP"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca7c1176317so496257a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 23:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785307575; x=1785912375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aZILo0UhPf6mB0ZTQXoidi3QecrcEcdbBPeLfd20Is=;
        b=V2p8c2PPB60B+EinNORlkRwWtHWf+N9kO851CjIZaZ7B7pBP9zmHYmOJxBpI40JXnR
         s5C3b08ZMpWFMNPM3a+aEW5qR+vpc2/PhItZ0xbbBm+8sQzzRrPYwQYLyOIIkCbvJAtH
         YzV5P2os9FfXyZBbkwxIs/gedTNQ/U0OtcEyVsvM+jT9OJW1ydlSdwu4NMcAMTKuXCNR
         2K3o9cLpnd3sk+lk42PnPQEJleGJdk+ehLKWAvlEr8im0VQ9K5PHmVu22f5UY4Pmm0cF
         MSXDsSc0eLxtUJXI3OQyOovoEthiifSdXW0swQTsJ9NzEp7EnnobFPJdKy7NrcChCYUz
         y5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785307575; x=1785912375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3aZILo0UhPf6mB0ZTQXoidi3QecrcEcdbBPeLfd20Is=;
        b=fLY/+Yh2sME5COU6EggeDJQ4YXbwNhExC//iSMycVka2IyS1BAjehdgzGvD/9agL1c
         q83SuyEw6bjyMDUsYRbNu2dsq/O9TFlQc0q7QurjGQ+xueQl/VNzI2JE+SixdpQpMLtU
         udthWszQHtd9m8u1lyZk5vbt21OdmE7Pg9SwoCB5A14cg1nng7a61NPVmlxUv70yC6yt
         zLD3oVxv8roHZv4R6/IRmmu3NLeTnSeYH8ionhmYJr5AEQ4L22f2FlAVbKvs8KXM9qga
         /Un75CkttS6eJGqDubiybjeeToC5iFriJioWrzwX2EUbJaK7J3OFNxmOwwtCwFURGGvn
         2IqQ==
X-Gm-Message-State: AOJu0Yw4WQoNApo13XPNcLPpY2rZoCZ3MCxhkmZxeNfvVpVtLyB5vc35
	l6U2ltP22OQ6sPvQFDu/WQN+W/vi/LAjN+yaKXjYBvZo/wgfYGhgu9wy
X-Gm-Gg: AR+sD11uEJAFCReQT98Gn0m+pRlxII0BfR+WvqJnINHhljHBoksaW37zpAAbvffsjvZ
	CDF9m3lzu6UEaztNFa1XZxeQhJLs3Pe3GLFEbI+A8KtBCCuO+ZewIvAi3wXjMSlhIlXSJ4v4ZNg
	8PMoo0TKHll7R3bFspy7AryhNMlubPs8JpiSb4l2QDtmewVJ7VYAV+45derPq7MbGDgMpW9GP46
	kxexmpO6pOTPGdhJ8d/QcTXx8k1aztse7t0F0rWv4rTI0/A6XEtBOtX4DHAPAGlwFvZbU7CHWHe
	BM5fy1vOccWlpBhXNL5BN8FZ9UjYyEvV38Q9B8wOm3GrfNymXvKsLP56w+rS7gUSyRJdrRsZGVV
	ilIOB44jZfdzamCp6ptIRf4qduzkI4KzkaZHaMAteY8Sk3eGkbv1Uo2cKRm84phjCSVWRVg0H1O
	gT/335D+cq/35dO/nQqmgqi6aOdc1H60dG3sWX+T6Niejn1o1oUdfFQmrFCDoUGIqv5d4=
X-Received: by 2002:a05:6a20:7f9a:b0:3c3:8bab:808 with SMTP id adf61e73a8af0-3c8ba616720mr6668535637.61.1785307575040;
        Tue, 28 Jul 2026 23:46:15 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba35196esm480673a12.17.2026.07.28.23.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:46:14 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Wed, 29 Jul 2026 14:45:37 +0800
Message-ID: <20260729064538.19564-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729064538.19564-1-kaipeng94@gmail.com>
References: <20260729064538.19564-1-kaipeng94@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
Elite (X1E78100) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..da653b787d4d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1180,6 +1180,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-go-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.53.0

