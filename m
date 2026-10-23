Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778868;
	b=R+18KaKdOH3f7MZ6dcBSwbG0W3b4X4o+cJqQ8avENF+y9alreG15vLc+ZpOpWfQyBkNN
	 hnB6uxSH/aaPqOB3yJrOk1t5YcJKsnoiLK8saBlQVD3rrRU3NY7ApBdUp37oDhHEOF79/
	 wYWveDXB9teXPGM+zCVop2dH2InA7rwfUZ7RO5jZCPLMWmgRw2cmertjZPCU8NKJkJUv8
	 0Rsv6llJJfK6OEj0j9RPUmcHMFK/XGYkbFrOW13fl+uUmpIb/Ikn/BMlTDNA/8NmjvBil
	 ZsiUbRE+//w0hm1+nbH/+xRDOlwS2OElnu2vBCLuo9d1aK0eqeNS8lmyjeaKYjwjAoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
	b=WX3iNg7VmPAQ1ywtmlKDqVLCykVxbVq/VKNhzux6Qp9me+yPd97Q2PDAhj4nninKfOxB
	 pW1s4CTKON9fZ88wD0myFLWplRAoatmS0/UUeQ0vmApEAKbNDenmLcTQFECQZXprnf/5m
	 UJ8CSKwB8EWACrFSOqyaZvXfyKbzuLIFTGalcDgGHdFJfH/iMPEezaAhqMPMFHq6jUb1B
	 ARrTMEB2gDcRMIAWCgn5wsUrXo1FnDtpX4SFCPTHhgpIV73nx+I5Rza/iglFB2K7o9eiD
	 MzZTTV7Z0KQB1P3Mj+28+oi124Mxux810Iehd/nGc3piXvSVzCn++0sgRU6X9P1rwKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IpDukG6E;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B01606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 18:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B01606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IpDukG6E
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-19305bcb72cso753447c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778867; x=1793383667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
        b=IpDukG6Ecza4l9ficU4xJSei12/9cnvu/plig6HIPO8dWMC+GZnHt1DkJrofxFrtf0
         uWXDETdXyZ9+55jsb5mw7KPKyS3tOFjlhQ9LYnD0ekveyEMPIjX+PNeTO7SVtFhAoKac
         Hb5UzcL/1erhWsV4PXGeJ2N1Spqgx156bQ+a8zBCwUh53RQXuMUwUn0dxdCl5eFs3LoY
         RbMlHKg3WUtIg1DMV4Of0xO+7ARSWX69LUFFnZR3WYpYuSMkux0cVwya1e0iNiHI/6wa
         1ntuGPvnyIF73v4zF81e8ndWhUmQSGxov80XK5yZkCTNlfc4j/DhLP4Wn4Z548Gkk0HC
         RG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778867; x=1793383667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
        b=bUsvi9+XPBWEMH2qdePqpoaZlr6ZQzJw4i6MVYN/y7hV+UzgzrLkSHDj8HkguW3K9E
         yUmOOCRB7RC7tY+CdytQp546OaaIj27zhVGOJXvYhTNqj4lTo2jzDOpXz+yuIXkAaaV1
         mi0k74edYrOzXQLjHrbSztaB3SpHnyi0c0PuTSYN3xOvvI97TilG0FDw809ZZ6LC0XUm
         ObiiYWhHnfujf5d+74oHrl7T3FKFZXJw+wvFgMldW4l+noo+UwAML2nNUQRORM6O3LDx
         m0Pj0/2bHsc2ji9/k8FpZyrJYFUuAUXHVp0gi3LpnYbhFOqVjhKVwH8tQLPMiKjk4qnv
         SnkQ==
X-Gm-Message-State: AFq9FYKRdVw56iIB8/67RazdJwsup9KpR6PjryshnQ7XFeDIHGUBQ5hV
	rWZOJ9ZULZI4ulryveVW1ei4+/DVI81BdD/QMQcgFGGLooNrM0ff0YH2
X-Gm-Gg: AYBFou3mGglAYtL0k0h/xwkQ+CklVvb4PcU4kLHCjXA6Rld7usZijGEJ86c9tZuB/eV
	zQrlzrSI57bv2tS6YKoPJju+G1MAuIIHn74gLlKgEusLP9+xH4r/m7q/bH8o5tr6pZoPh/YKR46
	atTKmcRk3uFJs6JzHLN99L3fORv2IoQs4YEwQssVhyyfe8Uw3FbGBE7MX8p+rGDwrsqxUwu+Zmt
	ZOdqfsp8t8cU54ztwSgnT7HR0KjFWyYmdGvB9d59Ot+TqrVfUU7IH8ZWwIUUi/p9IlDMysJTxrD
	w3fspZZuffGmUcEAiNIS9xsEKPcupTXAvEH5OagDPI7pACVpt+yvdUSj5kfh5uTD8TavxipsH7x
	agjLts5olKfKt0C+HA9j/646GHeFUs2jSG2sTIUEngD45GTB1zNc8+fI2MnEEtOghC3ciClGUrY
	7KvyjkSu+fCVkU7+Iuvh1kkCzC+0zgAF0dxJwdI+P0DKeBnEAvXI/SS0NdfVapSUSZozu52q6AJ
	KrUsPnu2Rx+Tm0Pzj1DElsHXFNG2Ao39IwVrSJlj+02xCPH56SiHTxCKRjQCI0=
X-Received: by 2002:a05:7022:250b:b0:13b:3132:6e99 with SMTP id a92af1059eb24-195c5ad17e3mr6055983c88.20.1792778866606;
        Fri, 23 Oct 2026 11:07:46 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19886f790e4sm326318c88.0.2026.10.23.11.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:07:46 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	abelvesa@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Sat, 24 Oct 2026 02:05:12 +0800
Message-ID: <20261023180513.36417-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023180513.36417-1-kaipeng94@gmail.com>
References: <20261023180513.36417-1-kaipeng94@gmail.com>
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

Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
Elite (X1E78100) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..027207758cab 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1240,6 +1240,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-go-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.53.0

