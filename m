Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096491;
	b=WrVHOBoaCW9FtoFUI4Ji0WyoSvHwY7Dfye1eJzIjcLYHjpDtsCpUDk29nWBIBKFz/PC8
	 jHo/RkoLUrGzipm/DPnUaxVtd+PjFOEiV8ykbFj/jpI7cORjmE+MHBheSUQH/8jefI8zH
	 palb89uCOUcu44zc2w6klwiBFjqDKkOvjdiGdBiv/W55HRg2OUNFrXFwpmp4Dag8jI1aM
	 snvsIH43Ws81OJNSAN8mgSdEtUN440Un/tWzF42p8ruAjC5Gw8rGCeljTc2E1YilC1tzJ
	 S6eSKbg4lDCHovC12n7D1qnRyRDM6pXpLbEtAo7RpIb+7a8/nfXtAyiu2cLUELD10KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kcyC89VcgJaq9jLzeow2xIThvgwDvibG6R9ei49uqAE=;
	b=ZJCZ+Vz8Il3FwCzb18vmDIssDtgwpLCo9Fh0LMNoD3rBHDreqUovxP1etcLPym+KMgVb
	 ezzX33aandotT5bgJ9ofUEno0MNl/wAl2MN55RgS+LQ63b+SXqOVhDnnCIrcnh1ukXLdk
	 uOlXIRVtNypudbXp64aYh586xBkznbkZqPWBvxQDPxX4pDraBaANSpCrOvWzLsE77V2TV
	 PwOucIPWFPiMnSBgHEowZKHEZtdl20pfvOpQzLz4/Gf2s5gYLO7LUfbqSjrNpnIVb78g4
	 gj7CEvZS06eo4GRI2LPlXMjtAV6f+GYPuFnJMjaRDNySASoqKwGtNjVYH4lIuHmmoYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CzkbAfVf;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB85606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 13:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB85606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CzkbAfVf
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c247f6687dcso346215966b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795096489; x=1795701289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcyC89VcgJaq9jLzeow2xIThvgwDvibG6R9ei49uqAE=;
        b=CzkbAfVfuTMH9DbWALI6+24aNSL410vewuZjg8g/iiflXbhSEOsVBZYEhDMPItk+cF
         m3qogGz44+uj4Xy3jSTD6cw8uBwULZd4ff/DR0Qq8erSuGAbphuU22CTgfppDb7poxMa
         kcZWvHoUCZwSeBoisZR8IiLmlrnlnaj22Q8uaLQl39qcOJS/DnsiqPlSUwG7O+g3MHTG
         jp5rmeHGevcqBDtP6/0teWStMtqH65EV4WAG8de2HgbHJfKYIwiOR3cLu+bF9byANmrm
         PbiZvMMBm9Z5DSfKlMCvzmKlN6DUZIUS0aJ3zrqKbe7G4NpPfW9cAVvuTmDZUwaT6GiW
         hGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096489; x=1795701289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcyC89VcgJaq9jLzeow2xIThvgwDvibG6R9ei49uqAE=;
        b=EimErnNJu8fCydHvGu2yB17Z2gfr1gkiMb4S6hZXH+W1C5hJNJv9ISG+TFIEcbC6nG
         6H59wnhbp8aX82OR73kvYzmbKNleGmFBdLFlD27rhJPTgyvm2pu1Dm5ehqGwcZiCs6J+
         gGzkEHfvK8dkjhaCLYQC8twrJIfeDK6+2tFsGVbGRqGI608mvRHnZNlEUn3s3Ga5VWQ/
         RUfYThPCSYUlXmqnxjEhLuMNNBgQircXSquX3Iaa3epys39dBEsq/WxN5TQh/H2FVPeR
         fANKmfVE4h35UraFhGCxYckXUAUweiBx+tS0DEjk0RvDoX6+VYP5ceMZfbwIDnegHZpg
         cYJg==
X-Forwarded-Encrypted: i=1; AL+hErEAsaIIYSlz8fELthE5ucjp8g0HF90lV3XqGehGsjQkUgfos94HHDJpfKRCI8YvAM524RwZwkhP+nu7cxq+@vger.kernel.org
X-Gm-Message-State: APuU4Z/l61flW531bhRsqZ1y7TuMDF67bYIa6E5vZANDZYxFhRNeus2+
	zLGiF1bwj1gY9Xx4TlKf6RQEJCZ31Aq8G82i1AmBH5EYoi/2xSEXXLKQkMfW5GT7JH+t85ZCz5y
	mX1W53JA=
X-Gm-Gg: AYBFou25xybXvUusv2P91OMDg4Lh6SpwuokZbrJ6wqzOX6Ya5VPmmYUlhAxrgW2LEG5
	jS6Yx8z5MxfRpGvZB6G41fcnmG6yM/SGSikb1J64YExX3QtTW1kRw0HD2FBvVy2Y0eQh2Bm6Tb+
	fSJ9Tn8/R9UVm+9YpfqYbAEkhSWmsKMw65RL7BOl5kVo0ZdwDWNU6I3qCqHYpZWlou9POPFQo3s
	wcY167FKt3PNClwGkh/Ly7prJPy9DQ3riyzMiWEMS3nkMZ5nhIXtLFmfceVwjumJwUIxmXbrI2T
	1QQd3oIYT3/uHorKEO0xQ0cUEen1toIdHvuWrKMdKzn/SbUTJm7b6LW5du/nCs0U4k8ptoaJZ6L
	CmwyxDvoj8xozLl5w3Gv/MBXdy6SBg3dGAlISj7ROJwvhS17Z22ezfr/LD/FpDTsiJzMlhypDGC
	dgUEDIbQjjkKPu+5mQuPJGPVcaAO74RlPprdLTBp2VKpd4WjAvSiKL+GQ7jqztqp37fMkm/5MhQ
	uExoQl3kUyS/WIsVDGM/kBayeKlg75dik+T3u7BrNMwmdYqfKLCJ3HPHsL2+Rz8ygmZPTNEunJ4
	j2g6TDusLcvnmwHHD328FhTYmgKyZtQ/PNvAKR4itJCffoW76f5UB1U5/mAeqT7jys51lpB0N0f
	CGxBJlOni1m0=
X-Received: by 2002:a17:907:7ba8:b0:c51:638:7838 with SMTP id a640c23a62f3a-c510e4c7dd1mr563619266b.33.1795096489051;
        Thu, 19 Nov 2026 05:54:49 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm106820266b.21.2026.11.19.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:54:48 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 14:54:45 +0100
Subject: [PATCH v4 1/4] dt-bindings: input: Add compatibility for Awinic
 AW8695
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
Message-Id: <20261119-aw8695_haptic_fp4_driver-v4-1-9d107334bdb2@fairphone.com>
References: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
In-Reply-To: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795096488; l=1122;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=GrcvT5TdUs1hjWk2qQFIg31PeZXjjwY6F+gMZ6FifVI=;
 b=9iEGoh/iygzIfheMi0lAKt+cW6CY3GzwX02Jl0W5iSz4VROo5+c+FVG8va0LjQyfCO9k2Un/w
 1U9q7pnUdn2Ba8uA+xMr5SfcxXZ/wZoV0chaBuxb1PqjQEMKMTECuml
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the AW8695 haptic driver to the binding documentation for the
AW86927 and AW86938, as this binding needs the same properties.

They are not compatible though, because the chip identification works
differently compared to the 86927/86938

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index bd74b81488f61d72b675b5701b321b30b3430be0..58908ac4ca7964f63e392050aff5e15e836983f5 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -12,7 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: awinic,aw86927
+      - enum:
+          - awinic,aw8695
+          - awinic,aw86927
       - items:
           - enum:
               - awinic,aw86938

-- 
2.43.0

