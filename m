Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666473B4EB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 18:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830710; cv=none; b=V6GP4ynqdkGOXeMGWfjD/bXQnmU+J8ZuUZENesjinRtc5oJTnKnO9hD+8rqaELF2qXktor/9XlpmjR4uJ7JyGLHNnnxXL77cSltcloAC2oznolvSpBsN8I6c1/kIQpdjrHzcS0CneGskajKyk8Mqj4Jz8msanOsqSYzVMHXLgyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830710; c=relaxed/simple;
	bh=2iwV7kyuakkEDfG5RsSQJj+N3P8k/pN6D4hpRK7eClU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O7lNK6k+DkhgzQasc+FnHscMKhz5ZbXP6aaNn0juR8dPWW5t+/931r2UsbcEt+jzPSZHgLKMZ5a3awOTIrC596wk2q5ljV3IhoH1CF8E3m0MNIKOIz41egCPFSjFtuZrE464v/dQIA3PaNelg+LpQE7U9JOIFBNN1x33Wk+uswY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=aQ/Z54a1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="aQ/Z54a1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954aff6088so8448265e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1784830697; x=1785435497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLtaD2vGvX5YufCFNfLuN9dGFNzANa0Z0dsAvP+eVoU=;
        b=aQ/Z54a1MLiHD0eBnAzQ6k2nwPUpNRWaEXS6FCGxi1AskjIN5E3QeQgb+xgD6GeMOm
         CipWfmuOXgibdcqeR03dprvtQ2KYqeSpJb1K3btpw/lL6/AtWq1JP8w2Gi2DMN318ZRK
         XgPxjDC1KZleXpeXBMD76I0B34XC9f0elc4mcQBxNhxAHJdVcR+htr7gBVOAJxDDaDo6
         6YnpSNq3eiAqQ3Vc7iOnbwcwyWzsauEjEGM61YX1uM2gO6wHuH9meW78MD+DlHnTSzJk
         7b2n17I+mhWlZx05ODCDNrIGgDsXk1UHP7eDwMswS+UdpyQOVJGfc3CfwljprJ6CuPtj
         vQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784830697; x=1785435497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLtaD2vGvX5YufCFNfLuN9dGFNzANa0Z0dsAvP+eVoU=;
        b=HFcuk+S+w7Ko6shjNQGEYexyueQFhjHRHq4d5tnDAmsZd3tcA8QZgueUk/ukuVl7Cn
         P+I1OlnnkJqqIdPEyNqJlqkUVVs9RiXveS9Wt9WIVzSeGI0ljGLl5FgN3QgyQtUlkHau
         d8ov8rpLfoIJyHMmhkJyMMo66Ey/glv8OOfnlfwiulqZ+vejofFFtSiejgIAsMamX2fd
         bWINd9E++O97TxTbkY/iabfMhpM3QyBOc2A0aLv2hbZBzpk979tutPS3YzhL4vPo9uhZ
         5sPwjvi8Rwouzn0EF1FFplILb8I6bXl4DJg1JhBi0RTZwFL+mJPmrIwd14TxXQ9hPjI/
         ezog==
X-Forwarded-Encrypted: i=1; AHgh+RrUamjirDdE33C5QRjzozAZLXMuC1h8CyztraDPfmZfC+Oa5632wBe8uT+FwgK8PL++VCDq4mVGItmBv2T8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0+0HGl06ddkkMtVBHgtqVnBywjKBRVXTMxAbM2DW8X2Tw1QG
	I8ocIJJe6PZplDFGXpIX4pCzsOR4MqmWJ5diauW26IDNRSl3zYE77RclzxMvRtTkzCs=
X-Gm-Gg: AR+sD10bNvrqGwFWWDrLq+vS0VCRAzZFexIFlFHe1mhR0n94tvKS41NoPpPjR+myEGA
	fvVnoONn58CnJM0rR8uB5Nnpjii2tftQ6n2KVmRxLboeyQBU+AdyrOP345x76YwrkFEWISOWoF8
	PgiZ8A37foyZ7NshOS00Irl+AXgTez/LkbP46qCl8vjcm1qVmXqKdZjGtvWMQlCar+YxLkPCOY8
	tn3zJYN/O3okaUqEPYOd6lDbRRfZgPuaMzNcju+n1srv/aYav5HWlrp5m56cHGtXamLoDjXhGFW
	iHMUGT23JAtorft1OzopXHvsH/sNjAR8S6X2S9wDsyhscYW+Z+XUcvz2vvk0nOJPeMn+663wQhe
	rQw9Pk9lAkzfy+CPn++/ThP2GUBAfxVlse2a226+LAuJCvZ1Q1VXFrHdZTKiUMD3ZBJgTHqs6X1
	Cc4o5tfKSFTpjDv++8CJ0syV38ZsoL0Q3KA72BOF5a98Gep6sA/7BI/7hqFzJBJpqWFOzJVFw1o
	j5hF5c1jEW2hujIshQ3w40t3GpUqqLX0+gScCr1bZz3NJJPbeVxcQ==
X-Received: by 2002:a05:600c:4f81:b0:495:4cba:e288 with SMTP id 5b1f17b1804b1-49573c99584mr49269755e9.15.1784830697356;
        Thu, 23 Jul 2026 11:18:17 -0700 (PDT)
Received: from [127.0.1.1] (host86-157-235-39.range86-157.btcentralplus.com. [86.157.235.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af914a9sm10799055e9.15.2026.07.23.11.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:18:17 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 23 Jul 2026 19:18:07 +0100
Subject: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add IMDT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imdt-qcs8550-sbc-rfc-v5-1-2fb988854623@imd-tec.com>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Add IMDT (IMD Technologies Ltd) to the vendor prefixes list.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7b0d79ebf9bd..5c74da791c13 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -791,6 +791,8 @@ patternProperties:
     description: ILI Technology Corporation (ILITEK)
   "^imagis,.*":
     description: Imagis Technologies Co., Ltd.
+  "^imdt,.*":
+    description: IMD Technologies Ltd.
   "^img,.*":
     description: Imagination Technologies Ltd.
   "^imi,.*":

-- 
2.43.0

