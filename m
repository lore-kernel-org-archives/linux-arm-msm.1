Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A784734D3
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396680; cv=none; b=gGkrUVzo/vzhQnNPuxKSLhEKKLP2+WXe4ITYid0xf9O2nn9kV+i+3Y6V5GbZOyy7IW8aZW/CaIgw/HNdIF8VExZkPPxxhQjDFxOHuShez8XnW7s+sUTfReWnvNm08WisNmwGPWDk92Uxzsxl47AppuuQdjamecGY8BwgDVdOMG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396680; c=relaxed/simple;
	bh=Xii6+5i2RWZ67oguwNdM+TArT/XjMPtr0J/Bo/t/+aM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/v6OCvf73D8Wpap/CNIOpg7E4FzTPqJckcTJGwmkx5M5vm+kcVAYxv08+2fIgnbl+bLAW0BXAnfxs9OvhzuUGa295mDRJ7qGonkpAgRayGbkRtAzju8IpkZ4lgIxrU4teiJ7VE9/XsvTtkRTyx4VaRBkOLYwp8hCXZtbXrGDro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=C4E34uey; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="C4E34uey"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so354178566b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789396677; x=1790001477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmWbIrFCJbcoOz/Ivl18PXQXGPM1nMkA71Dhun2P/WA=;
        b=C4E34ueygueQD2bAjMENdbgz/JdsKfVN6y4eP6zyCaDbg8rw4MmJEGiSvd8BDE+VSd
         a1GbcA1Y68Fp/Rz7fU+1nalqNDbF8OpsJM1DvAzHq88mi7iHeCuaBjQ+0+Q7sx3N/I8X
         qsvpAA8otrvpJmAXdDexEFck/F88J1upu3tCHdHHBqhjYPjPINtWD+1qi8gmf95OyVMH
         oQ4is0YQfEUVA95UK/BbZ3woeq4AkMpxPtRNswcOcMo62hfRXVbGF6OpOg5WyvkI4fls
         D18j2pgAJnM08bP93IUFT5minSI9Gf307NijwytlSCXz+vuRBHlVe5UM6shgRBIw1/yf
         BXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396677; x=1790001477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmWbIrFCJbcoOz/Ivl18PXQXGPM1nMkA71Dhun2P/WA=;
        b=h2dKPoftwBIFnM3eSdt5PGk4xhmPd2rBRzctknVAKgBpnx08mD8aV6OXv2gamwmvhO
         9pzdazzwei8kum8B2Wlv8dKQM1feYiS3L6mZoLxkHAfVAe+xq06hAZ+xO+j7TLBzk7fU
         j0zxFkMEptFuMr//CCy37U28yh3UUTmCowyJlUAoyIRFJ+ke+FKNHl+A4JveEJq80MBQ
         NCB2qMJkWt/cnjmUlDar8wKaiPZQPHlL1gW9pbYfm//ob7DkELI1Yu5p67fiG24HgMri
         o+Vi9mYDjdHR8Kd+gQ9I2VwY2mVxvnSjDAYkIObQGL03xJGEbBPgn+J0c0FJFcNe6r6v
         NThw==
X-Forwarded-Encrypted: i=1; AKwUvBwh54gWPoAspWIxeWH93Lc2kif2U5AO9kwdFfp+SAJV2o5yCJt082TS4H8Ywr9CxpFhV+6OI//Pw02TrLMv@vger.kernel.org
X-Gm-Message-State: AFuF++lWPwfS9ZY/s2Jgrsk1SibEqbNpq2E+E5IFkwPl98HveAFAHhKG
	x/2f5ktVDhZNq9tAj0qFJ8dkZUg/cKx+03hCZQ9VPM7Xb9GG6ncYzGUiNqMRKlpzcQY=
X-Gm-Gg: AYBFou3gp7wR2lvBmrBDt2rJ4T3R2IWPXZEP0HlwlMGAdzIptydwnPMN39QYtcIN6TX
	wQGCd4OPvQNQ4ShJN1fSEQGlsBFhegpETVXqVDaD8qYT789gx2s6vlOmvGmVwqyXPsPuNNXuFBr
	WbYirmpzcPSbR4okPp7hDtiB8AZJ2/iG/B+OwTHUOha+CX2gN0yPvGnA/EwtOs1+a/zX2NoJuLT
	3sdFLzKGhd9ujgaX5K3FRGzd4FvWhszDO4kDLIlUHtZt7aOy5ZC1LwtklqiK2fRZNGgRA1csM12
	1n/W712mqr1tY7HyRzo2u6PhAMTEajz9JOsDirZV/H/ar8b+b80bE1/CHAcUyCqqbacH2TC3Xcb
	zkRKMQXKwMPj+OkDSrAFjDvX1j5iZ+f9+YMczrVMeD03R7+2TSdpbF8cM40wkaWAxrB71vhVimh
	pnffPcPymf32zwH4NFKK94s/y/N3TK/0GZ59JF5qancSCff+OMInoSxufbMVMkkMyLGR/cQUnD3
	Ik0zti2SKsaZMNiS+1tuh0I269M4934voP2o9pfyDC3FAzc0IxJt63pPQ==
X-Received: by 2002:a17:906:6a04:b0:c29:6de8:d143 with SMTP id a640c23a62f3a-c29b865bb71mr184948966b.19.1789396676843;
        Mon, 14 Sep 2026 07:37:56 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660b29a7sm449634266b.43.2026.09.14.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:37:56 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 14 Sep 2026 16:37:47 +0200
Subject: [PATCH 1/3] dt-bindings: input: Add compatibility for Awinic
 AW8695
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-aw8695_haptic_fp4_driver-v1-1-156f7549149a@fairphone.com>
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
In-Reply-To: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789396675; l=987;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=Xii6+5i2RWZ67oguwNdM+TArT/XjMPtr0J/Bo/t/+aM=;
 b=2s+aTG38QL/Spn6daVe9Zasok8uq+7dTkNp9krZfUHNNP+/5qMsAvuyY1kBqrIeztV+2URR38
 7g8kDaxU9xzBWIqs5SScJYV3ShRWxo8+oJ889JkjyAMPq12p3MpXVuh
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the AW8695 haptic driver to the binding documentation for the
AW86927 and AW86938, as this binding needs the same properties.

They are not compatible though, because the chip identification works
differently compared to the 86927/86938

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index bd74b81488f61d72b675b5701b321b30b3430be0..d9da85499cda4d62f14f36f1ce77627e37e348d7 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -17,6 +17,7 @@ properties:
           - enum:
               - awinic,aw86938
           - const: awinic,aw86927
+      - const: awinic,aw8695
 
   reg:
     maxItems: 1

-- 
2.43.0

