Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621969;
	b=W+yAtCohXPGbglA9DgeZbHw1yKsjnz6ffX9O6FTe/uxOPHiqeLIXECyY9w/HZ26H0S5N
	 bAAOHJ1Oo2AUpZ7z1WnY6eTAduM/BZatYJzzAPki30cXtcQhJRxaYtUzNrcKnCiTSUpk4
	 tPesC7lMe0N/PDzer1u8Bgq/XwdC5SbeN26m0A7TeWTsEweU3ZMUe3kebxKc8UtWffIgg
	 /dU5Shq8ZShFQqYCKzoio951bBKaXmTsLSsojugtcao3oMp0YYWcq31KTPMNWte44SGSp
	 HmdRFbr/8XboyB4AlbTZaJYXJ9uDw0UYc6jK1uDHmdSUvOjkVgpy4EX7DiVVkLQp2jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
	b=19BQ67Brze7qkWCHqHIg0mi62NC4TEEFN0iuoTpk63j42t37HQog32JyxL80BhyWten0
	 Y/TBawEiwEhLgMJSLnKYG0q+VOGkRtAdYs+mVjBhrzrmOpVuA2ppclQ9ht4EU3JUSrM4F
	 M+mP59VxOq/4ph2rzAEKPDXgmel3f8DmCkovZRpGidUiZu2evHDS+FjAkcZz7/4MuHndz
	 Z7jUAUnM+UaRAbTrnieskuNxQoLDA44a4TtaDx/Yx4jBu2EF+94sBkp/qt/6gZOCXOzdW
	 I4Pfe1TczaPJt3AsO2bAPCcAmMLgoR0gxA0d+2/1gOI9IjZvXj7+82irslTL9MEWBIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TAyfUtT;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513CC606A32D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 513CC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TAyfUtT
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-57148b8ec14so447722b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794621968; x=1795226768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=0TAyfUtThdvqH6Ea5+y8CqCzygO9MSky6knt5TN60Nbo10Q/ilCBpjX6dhsnBSgAkM
         G/wWoT8aCcFk8drGhMjc4gRFT/UJocS659rVt/n08QdmZFGQW3EbfRdhf12BPTWT9tB1
         2ebW7/Sq5JGQpR2+tiZYSLuwYdyz4JvNwg4X7e1pZI2OoexRM+CaGd1dBl69LZpkjA0z
         tmmeu9wncADkaaW8Y/fQq6s/xoRTyEVF4ky6OO+X+HFQJX4HF6ZnQUsQSyMw4KxitfC9
         0XSLU2hyQU145m1Mf7zTMIVYhYr38zLWxFymQMwUfu0HRmWQ4pcyEu0OTXPHkMVYkJuo
         yApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621968; x=1795226768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=2SSfWtoLnLhthhFkg4cI67CAP8gx66+rboUAF2QExxPRLVl5PORWXuqnvku8Jeon8s
         FMIvjfRryU9XqxZBThPWRJxGd2gRhBbVSeFY4g+yRSrSZdonrnQ/ymaJeiQhJzc+Pxf3
         quLu9g+Ua5eJWeZvcT8Tm3D3YjGwZExH3qfY/S/BG/ncrvsSUTWs4Go6+35fx2fLRNWx
         nKoeAUeikUqAA1R/gM7PcWZohBHfXa5eIztsesK9xARKxjZlcd2GAn4t385tTeslo5Lg
         Hyr0XL2sW4GNmEJYC8yMqhMimnGLwdpPo69gthc6DVDDPIwuDRYiF0PlneCNgRrQylj0
         Ljsg==
X-Forwarded-Encrypted: i=1; AL+hErEnrtbF3EBULQ50/Ldhdd1sHoAdkhuvbHyHogxXHsjKOIWxjBqS6LFKobBx+tNm98lSf9RiQP+fVT8rlfvf@vger.kernel.org
X-Gm-Message-State: APuU4Z8Npdk8Fi6Pypy0dfblrifCYeicP2A2rftiIoef1EOLpSiNLsrV
	CXNAPB1g6R6Mv27qyKR37N6fnLy+iDonK/lH8ZQXOVV9eUtTkt0Ghac/
X-Gm-Gg: AYBFou0iBSosB8Wyg/mSKXOBC0FqJr0vTPJUFH5qgNmSOllJnv3R6FgBk1AerLG2/wF
	xyJgXS/MzHepUQL1e+ftPt5bNNx/oyNL358+41L19uAD941c/4MDkA8dn5fLCgH5yg3v+d5ae0S
	+2ULaFDOKBIR8u/3wosWST7iUKH1VCj6v6fUsUgtoVz7KnV8kQH9Eu6eyF/zG7mBhKiChI/+Unf
	SDuGpZzAL9udvttWf4rn+4P+5Vr25XJ1j85qg+5+OI/3ofii7YHnkxCjBmkfMwy36uknDusPOBD
	EOHYrV2oyRfXgOgoNDtOcJG0TdHWr2ugut6roZOsShTAb+zMvxQ4krXQ7WRoBkvhG9Tc7URD/Rg
	gP+wKeUhhdox6LMJV+E0KMWvUPI0s+CfGxULFXMOaAJ+fi4gOvexg0ZWRXHxqcjrHhmjwiagym6
	kzBO23l9p48+lML59xvi9Fg8urZ3vgaKoy1rmz0bvltX9WYKKiQC/rq+IWOV43L2Z1H86hhfLvN
	dnGDI4Ki5ZjWtYhnxA0GJbTB4vncLfTQJP4VKB42jlmDRPdN4sHOCMSBORBy+OQtyp6Ta8QjEHG
	g0aByCZZRV5inRYk6XqkjlbLXUTRX94oT7xz9ewHEOK0DR9cKBXzIw==
X-Received: by 2002:a05:6808:2220:b0:567:e9b5:37b6 with SMTP id 5614622812f47-56e64f005fcmr3240210b6e.41.1794621968203;
        Fri, 13 Nov 2026 18:06:08 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3f179sm3385433b6e.6.2026.11.13.18.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:06:07 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 13 Nov 2026 20:05:07 -0600
Message-ID: <20261114020509.632311-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114020509.632311-1-jeff.roach0@gmail.com>
References: <20261114020509.632311-1-jeff.roach0@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f6998..c3b6014ad6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -212,6 +212,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - microsoft,surface-laptop-8-13p8
               - qcom,mahua-crd
               - qcom,mahua-qcb
-- 
2.55.0

