Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A1477280
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315244; cv=none; b=r/Ntyn/D0Ruv1vFcdAj+Qbn3Cmxx6yuNs8bUuPPk8Z8yUCvSCHUpZAcksAGrGUIl/GYSr/4MNvPrl5JS7ypY5i/dHABbRYPfjwEHQR/oHamozXH5cmFnjeJvUzlv8mjeza0FdjzAlrqFB/V7uX9xoSx2AqwIdGE5FzaqJxYylZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315244; c=relaxed/simple;
	bh=aRikrKedr8rRD84dJqfsSjKHfSLi0ROhZlN789CUbJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WgVoyjzLKFKeWD0OGC6oHE4q2G0y+9Fi/K24xwgiGFSMx+0Q66X9hIaeYon+AEQNzh6Z0ISmStML8vHPgXP8fUXJiCnBzipytmuzNt0YgMv3PZYVKnMOsRt3otM5sMvo1E0hllbq+N9OcyshQ17CAd8svOXssf/0gAeeGQEDjK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyHo3Q68; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyHo3Q68"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso1315150a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315235; x=1787920035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=QyHo3Q68WhsfgHv6ExsGYFjMBTWH/225oSsPXZNSIGy6HP7JrgxcduIuJwOedH23p+
         U60gRWi1Q9odTZuBfADIApozwglG2DWaopqdiTS3XaRast+KKrg3cu4jwSzdRw/mMtpY
         HadWE/UWOFrLJj2O66pCPXqdR3/oqnvAZz0LAvcUyiHGorkXCaSLvKrHXfsDRvkqNW/E
         QT9YY+3WcYxHLa7IIZc96i8PHzdDwBlBd9JekxjncEC3WkLFLPrSgwY+gOQbdgHUMe1l
         zC0hn6ianheu2qN/BtLagNksR35loz6lbPdWZOHvG7mOKWdIcFMNPsNIcU5dhyV0TA/o
         HfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315235; x=1787920035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=n0jZbNdMQTuhdbVs2rFCnM+LSYtBrRcpqpa4lF6/AtbkpUzJ4gnJFbIT7QAzLNxOcT
         xesyJZ9pqklLwBAEGQj6F4tODrF92ez+4JxJsA7IwMdfvXfNuGSPSXJXM54EU7s4ECF/
         EX7K2+Kvp0M/OZ+0UTBsHsZYUd4I+OjfN3VQGn6E5nsIPxAikcPFcN73esw5MaBe5Maw
         p7KdGSl7ZZc+XDpSh0oSE8A35r9xg4R2tMSjHzdtfTAoATByfxEvcLZS15pYy8Cwu4xF
         7pj+/QtiwwgQXbl9J3Vgvy+OA33Kj2hl3RvBwXwGY6zcYi6rfR5CWDPJQO+vTgtqObx+
         kpuw==
X-Gm-Message-State: AFuF++ls1yen9pQnSpueofZqX9+x8RLhhqiu2BuFkvirDVuU9yiuyEOQ
	+GfapsbNW5ttbtPx64Y5OZjNkzUCV0RmBHOnnsaalU52a0aMZz64RXRv
X-Gm-Gg: AR+sD11Nyv50U9Swo4S8mQH3l0Alq4Z9AD+1hiUDcsFxUaze9YD3nc+03NXNe44rYcb
	GQRa9Zh7Rzx88x7eF7FHtggEBhqMGvhC2Rc8CadWTukidDnlFwhA67Wa0PPOwLEojfQwBL/4xs7
	fSifCZGT3UXkUOzfEpdEorpfgrZu06nUUwhYAXk8NV7tJ2LrIUMB69UPXwhPH/POphXXaN0O2FK
	Oz/SlvSYavtnIU1/LjaIDbHK5XcrkLTbn+DBFvZV6uEYzZGuXqrSBLfsVW2zUkdw0qMjz5LMvVp
	wuOHEgGiEVqQRlnXB5lwnB9OikEapzdaHDq2jDqea9QTu0Uq4ISl3ZHFzSwyQ91uvJ28bvfV+ny
	4gyo5vjNHo5R84EGxi0sS2pAh01iGZtbPajZorufAvZFiMObyGVzGsRcG97FadLih2/z8gjT1DN
	s0K2D5/Bw37xJYf6SSnRv0LIqiuaSntm5OOkdPJ51HfSI1cdkUhbtBujwDBBg5mz09w/jv1Q/Yz
	YcysvXNo+B6om4NiwnIsmX/SRfxQfQUhFLsgw==
X-Received: by 2002:a05:6402:249f:b0:6a3:ebe1:c2c2 with SMTP id 4fb4d7f45d1cf-6a42f14dfacmr7250121a12.2.1787315235036;
        Fri, 21 Aug 2026 05:27:15 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c315dsm6220262a12.9.2026.08.21.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:27:14 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:27:05 +0200
Subject: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v5-6-ec81cee63e09@gmail.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
In-Reply-To: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for Xiaomi Redmi 9T NFC codename lemon which is one
of variants of Xiaomi Citrus lineup based on Snapdragon 662 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 68542f76df30..5363efadd4ee 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,lemon
           - const: qcom,sm6115
 
       - items:

-- 
2.55.0

