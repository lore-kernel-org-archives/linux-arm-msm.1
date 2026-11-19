Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107266;
	b=2HrbzUwfzteCnhjRwTRebWdb7KiZG26Zn+CVTusZ/txVHy10kHUC8UNtLSllz+wjKnLJ
	 xNVDvndn2y3jVj1V+NLuD3Tmquw0KCbzcgQa2mzqCXB7TVsEu1GX1zRaJIZJVFv8UUDoQ
	 VECIO/tl+vgNplBNOQ49ZNIXuGxtxO7X0vPJAscLPPycvco2PdPyhGcG527GYIoAbiYiT
	 UBAIB6/barF36/uyJt6mHIDjfn1gmPHCdOvvYeOJxfOpLHf8IfuUS+gs7aMegmuTcnU7u
	 nFMAWgd2cM4srUHAd+Qr8ho+7+5LHTvmb2TER+5cvxXXTOzD5iVt/LvoLtnGDDhashg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=VWOSqWPXDF0ySAFhAcPKWFyDLq+SKgFchCNiW4ZK5SFgkQqFoVdmsNTEr1mVMglgJr37
	 4C9cQMioPfg9vl43gmLWko9EnQuxiMWh9CdImBpwQJn5WcbM1Q/xUGPJA9oPKrvcTXiEa
	 Iv9g6p/Pt7OvDE4jxb08f7jUjw6KZRBuIiDX3/5QFcnLwx579qKuDUUZ5sObW+tcwN0rX
	 JZO8Ruh0mEEFrUu33sf7EuQZwYo8ySioXEHlGukZ4Qd/qaxhwGY4KiKBbW7oHfoaqi6JN
	 lTT5d41TURXMsOTX/PxPiFbhLkUft+pzZceVX4q66Pu4lxII2K2dB9FtUjUi09fG6gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMU5F7pE;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4334460A2603
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 16:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4334460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMU5F7pE
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4aa5833c263so736189f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107265; x=1795712065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=yMU5F7pEic3WVSBK24VbKUxHb+6uvJTAIVgjWdxbMw4XrPOaSJE7r91tNCsliqQHaC
         qUZ5AZm1wcdjhg5SrKK/Ip3xFQeC4WH3EWfuhKGt2XT4qXNdxGvhP4n4JZToUqxlS8Ow
         I92yF98dqmRTf/ArtA4sBnN+AainR8sDe9FkRY0ZduALSURpwPh14khnTslQ5LzzN2NT
         wgcHnaSFPMaj8w83bxuyS0gTYRA9qb9F8740IOKVqC2JpoJaV55hh+Ddm3gPRJLYGvse
         aP2oDAyuagJ3p7ACBi+M3SSu54fU1v7T73M9/axItnrn/NlR3Y8jwyws5kkRF8YkbAgk
         QDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107265; x=1795712065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=Wzy1zFKsol21wuN4jooRuhBhad10kh8ClyaeEmQx9pBwQfCBxXArhsMlX28PjGHTR/
         kKxwhk89croI2EzaxRievf2qK2GtFvfTSXN9fbeLMjGoteROrbphR7lQh6PgDsYuF0RV
         95/EQnxpHAvSkG8Ua30Te3AKXg1C7yaItDBm8CMq3acvPd1WQ6IwnC8kye9ahzgke/wz
         9lG2iO5K0a1RgMc5onpDD7kjHieK+bqsKMRY1HbFGKXRMRlIJztRgZVbaQRCrPTQDvvC
         kKHvEXWAPT0NxOT3MwYBGGQ53oZ/keK6MevAWYAKAfTQL6/wn0GRfwK0mgbRkLmIYQTM
         8jqw==
X-Gm-Message-State: APuU4Z9gWWHiInxogi7DDTmlhcGkUaf6sCjg8ipbIWB47Lgx5rzuTFM/
	1+A8Tsc2VIUThxtkPVbuKYe2KoH7ySJriasuLAmZUrd5FCMiLy9YF38wIuuU5HBb
X-Gm-Gg: AYBFou2YX6Fhx3Tur7jFQo3yRpk7fovm6WXACw7VntztMKU3wYPZN2S+EGre7XZPlEf
	VxfH0uEu5AK3IftXYDr7HeULb29Jf+RAQZmftddKzUj90Fs1OlEOfS2bevJNNDpZ0PDGKL9MzKj
	fupaZ7OeblXXiz7mw+Sh+MH62N5AUQOBZo2sC94INP/Jy5qmj419GkeSUSlqo2jgVdAlOi1TMlL
	moyEavrrwgpIrN4FaNR6xkfbdKFqeB6kKnCH/h8eDGeTkMIZwY5BL7s7kSw52ewxI849jnIqYKm
	LdmOXLviuk8C/c0bnTo02JFzx8Xpu5Ee5Arg6VmLIzK5t4xsXPp4jzcfneE5DS8rODi4oUJXpFr
	MbFb6de8BjgcZX0II7wqX1bksmRMWgZkNp3oS2KHEG2a1B8TdVitpWCTbfr2GIROM5kzbXuOeTq
	IEgE4bLgyRdYFV4bJyi9tg5zlQ2LP4MWYIyZeN4bzN+fNHQt/umIzPVH1XUIkv7gI2qtafjieBk
	IE9aMM2HC06J/sDSOolvTLHJS74b8sQCuAKlIsLE0UzthLPJBThZiWFqKxNVwAj9XaqiRZuis0G
	LGzbamh31a0391yL/kl6il3Q2qp05u51nvr+MtGCC3NPnAITVEQ+sIFU8mFPx2rxKQ8Z4ZEFdjk
	=
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr1876395e9.25.1795107264467;
        Thu, 19 Nov 2026 08:54:24 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:24 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Thu, 19 Nov 2026 17:54:11 +0100
Message-Id: <20261119165420.24466-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

