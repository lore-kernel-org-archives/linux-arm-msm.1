Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864272;
	b=Zbw4bqQTgwrYKv1CRb/0LIfd4vPBEtZ1RfQzVdO52MtVdfDXaTKKEmF4kEXA9hQPc8Md
	 9C4yJxajtIL9/lwYBQGLkNbVN3xLXq7JK3m0y7hXLonD14OKAwngdscylKczXySvTfVhd
	 fmVRi/9jm1tFY3HvaBRMR7d1O/0d1LPu4ZTHgqWsynDCqrGuclmZ2ojeoh5xd35JT1EiC
	 lVLcmR119oIdSaYkDdCsZXhL1LsWSiM2dveB3Xb+Kedjbqt58w8ON2fP+BG8vw9uMMRMW
	 B9pBzwx9BWzIeFXJ9bi/61sjp58Z8qW6ol70QF8kteP6sladaDCSmOMpROWcZeTjbNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
	b=TjKX6TPr7S/WNv9jXdViM0XcfHeCZOx0vc3mQE6oo//kw1zKzz94dhm/YeFA9CaxJTmy
	 ax88TfRx9FmVVNHRGAUEZGhvC8HYygm0CfBWUiGBa5/8N48aLCnbt2H2sE9GE8xEQBDK8
	 TXQojwN5dLI7V3XzexFQ5/sIpKshXQapRWMrmLv2bdHe1NvK8xIMAw6TucicOiroV3Kv9
	 JffgVcqtrP1M4TKjg78fRZiFduQCiwWTXmKJkOuwR02MtjLO8cr6YXrp4WHZzXmIVYQnW
	 h+p0O35KCWup0kFpDC1Dw8UPkrJdcP+hYduzXRsG6zyugvUDbcD4KjFcfLoYAJbn8Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV5akAzK;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0414606A334
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0414606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV5akAzK
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso21041385e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864270; x=1795469070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
        b=RV5akAzKeEP/HsoNcLz+tuXg/klRUBB6/ajYSY8bldxfs0c2Wg+HpBnTCD/Y8LH9+c
         NNlt8M8zDTRk6x9IMeaNnXYBk2Ukh8FupoMFwapHXDDrsGsCkfnllkxfXzLWS40pizoV
         sauVGsgQDC5bTT8n+BJCAdFB0JvrXevd8l7ESWJ4s0tQwvt0MZM6b6ID1XnDE5Q2dzCO
         agazdYBU5OJ9N6j0YgByNIOIFUyEkYZsIG62Rn/LpoAt2mB02bD6aBzOfZl+yDeHTu7M
         viRJimN2nQmnxbvXfZ+sFPTNDg2v1NTHJIrFyJXRNXveqXZa61J3C0t6dC+tbqF8OwTJ
         EoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864270; x=1795469070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
        b=w7nO6rr/Jw8+oqlVcj/muiLfv2PwrcuKAnQ/D8VzTOOVFqcINGi8tSFPivKMuSAKsd
         yUeA3oe+Zjylvrom4qQndONHETpR/GFSgq6jMbSgo0ZFmJyX9I9NVVtdvSt8jdhuhzc9
         VuYmaHWBHtcojpho6skA2U32/EQeCKxzwYxoh97G6ZTdA887L5A02Qk5ArCVq0yB96KV
         LdYFAUD+e44tJBR+/2cqaN87HpEHak69aNcLSoZImyPGsEBhdPpNHMl0h1NKJ0EoVV5p
         pfZBJz0j3+qwmHCsim2l9GlUXYwfKDT8jFOgI8HhHNjCoXzGhBMA5ifaVj97/YZpaotM
         n+EA==
X-Forwarded-Encrypted: i=1; AL+hErHWSD/kiEYp5DwLPFCW4U00O5fBNCl5kvMIkq08TGmjUB4dbd3aquz9lmpWqbFKVBmN0oDSZm/ddOowuJCT@vger.kernel.org
X-Gm-Message-State: APuU4Z8jMp8XLRgH6mN36tGJu06r98RihJZ85M8IQGq0+W67Ha9EfV3j
	XFTKXvy3+h65OYTEoO87zBMHbHDPDhzeIp0Y0igrrajZrzsXS+wl+f90
X-Gm-Gg: AYBFou3kDnyGmRBPOMoYVU4dQVozrd8oxQrn5GvmuEQuzjrIUBAhnrWBlPtdb0LxIB1
	bersquD7YFaXb+bRVATix8KPD0sFODs6k4Rypjfu6rSc8pUavqcQV1/RSeLHQCamtZCIPhw9dr7
	G2SRS7+6BNf3Scd2ZRzbsw+zRUFCmoVYyGV4XTR/oTHme1oP7amZQtcWS33tlcJNYeLjMxSLyYl
	vUuhDijkgUaPL8vYpR14/xnp2FD+mciHdmC/gXC/IMUCVY/urpXCb8WGvYRYzL8C7Ka4sQkMynB
	czNr/IukdQiW1NG5iZ0IwMj5jOaLJQasy/kdIz4asparYoUoOWY5G03DGl8s4ZVhGK5IdndWKSC
	+skqMUnwWYKym+EMikr6Uh7neaM3muHqAv22cLQ6VocYSDUK9/ZE/QWgUXZUs08GvHqKpf0KTln
	IKaryVozYalUF/7JvC9CmidtP9R9hCgVUxR3NSDCDMD0N2CcZYXfrGZZ3W6S41Yse1GFOm8n3wF
	RCg+hxtC4V0w4P8cCyvSxwdBfGdD3bg2SuJf/4sVyLO+kjzhg4O9OJb1ykCzyVMo0NqLMvtGbjv
	cWxDYNsb8Qmmjz+2YIvO+I3iAFhpy/XQxTP3giNpNg==
X-Received: by 2002:a05:600c:4685:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb55a91e31mr246195125e9.32.1794864270391;
        Mon, 16 Nov 2026 13:24:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:19 +0000
Subject: [PATCH v2 1/5] dt-bindings: clock: qcom: document the Halliday
 RPMh Clock Controller
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
Message-Id: <20261116-halliday-clk-v2-1-28208928da36@gmail.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
In-Reply-To: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=893;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ZdWzIM6bnI4voexzohsmWp0z+avf5ks6mjxw3tb8aUQ=;
 b=9ADXxuWTDwY36Y5okN2pDe1MsHpuUDbA3CsIUSMxe7gUP2WuRMP+n/AfTAr9ogCLf1caA/cG3
 Q3NVDXq40X/B3Zshwa1u8FXTTp0InIEh6gsOU0Rc03SofrH+/GKLLA2
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Clock Controller on the Qualcomm Halliday SoC
(SXR2250P).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa..72223566da1e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - qcom,eliza-rpmh-clk
           - qcom,glymur-rpmh-clk
+          - qcom,halliday-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
           - qcom,kuno-rpmh-clk

-- 
2.55.0

