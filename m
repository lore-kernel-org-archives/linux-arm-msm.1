Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445197;
	b=D2a2aeUugyamMsVfYNDhPIe+zyHGqT07/dLVxXXjp7TKwAv8kVps3JnonTPpkKi0+fDk
	 Fd3qQp968uHLAdKYSJy/Vx3d2VIAnOV18ST2EV1rPoTcdbthVUakb6rY+QGW5b7sW07ZU
	 qTPvvesKdu4zB3Dy2JHbElxmwqVvrpuKolQzn6NXuGAiwwfn5MUVdSsbpiKtLNyFH0aWH
	 xwU8KLtPC+MgOGVAKmAyHA9LlrVvF4IFTg4LGs05C7lSeXV/G58b0UXwM1jnZSXyPQAlW
	 9p5zNKRD/qGVAkdhHmafR4o7u2SqpwxYtwiyi4wJNwEe6b1/Rl2Xcr9H+I4sskPZW5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=hOiDALbPnrqA6KJcy8uRK3cvX6wgGPZxTJtro65qlmE=;
	b=LVAUlTTZmkoJemhT3u3UiDwpxwHOOubpdVPuFWjmZEyk4O6Psd6HI++XRc44zx9aR0qy
	 BIU4UCusCYYt3KK2Nic5OjhGoZuYrvSThJkecfqlMkxr2k6TNTCFOaVC9/WIxCpS4YOZp
	 1fgIjvYZc5dW0wiP3cSbEUSwrg1WPGNooRx5GIkEW9sjQK19S/UhY6aYVSgnHVB6+xQqF
	 DCISJICRv2Tx7MZiWRL7DLGz97Zt2H6PILxQbuZtTcDzxROmG89ZNdBZfN7/hcP4tmtTy
	 zjxYgw+UVv4E7y4Dvy9QieHQuZRqFGOt/JNrASMiv764TRaXiJxbjpL15OTTAMQS+xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=3V3QAHTF;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0F1606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A0F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=3V3QAHTF
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c516a192844so190724566b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795445194; x=1796049994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hOiDALbPnrqA6KJcy8uRK3cvX6wgGPZxTJtro65qlmE=;
        b=3V3QAHTFqqSatjwHxXfNY2MyCBNCEaglsVdv4D+P4z4D/BvwkEsI8vSHHchijFSBZP
         CQkAL90DBqBijJ+dyzaaTJIDVRHnMDWIlEOyyDOB0TKnatRCThfnpTApYilqeREykpVg
         Ju4SJDaFB+U/7u6W5tJO1P6aazSxvN4ULGDWqZ4qbS0HAnn2bJxysQNIPQjBXaybnEnw
         svDjA2gtJW8rSHq7s77st8D9Ca9UMuucH3PUoVOcaCEMqx+DeaGEbOvx7vBgZmRh7IPh
         rrFG/V436LOAHg87Zg+/7we0YQ8MN8ITEmQrQhjWicixTT0SXVVSYNf8RJnAzz95nmfA
         yA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445194; x=1796049994;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hOiDALbPnrqA6KJcy8uRK3cvX6wgGPZxTJtro65qlmE=;
        b=LUlQY9J+K0/gCLvo6q7xQJAeSbZJA1mJ4iBr/6Cxi+mQ1JtLk+sD88p8whBKdR5Gfy
         Wr7JukhQS8cr8zZB5ycpthYV3Tsm3PpNlRYn2E6RE+cUcWD0C/iwwmklRbcRStelmJQe
         B5jSpfz2tzqmCA6yvXr69Ude5mlhd5jVuCjanPqtifEdHmc8TO9Deu6dP7NKv5qmQrK0
         Hn7DJpVCBDaCcaS7M+H9DNDWSg3Uen80XhLMAgFukKt4WIXAtyjEwUJlYRPoLsUOVuh/
         kVZCK1bMtNQshPF09+IzqfvvRW8g87T686gFrUrS4r9+hfFLBOg7wv9vID6YJRihoprl
         dzdA==
X-Gm-Message-State: APuU4Z8YAPkVsVDUDZWutSqhohhhazUwVTvrSxINrtJs4SD7Qj3AbKp+
	d6FXiSgHIG9sMu5+DYT4MKEKShpVPgWaWKei9uO/fMLogzX44kxTx1pxbKV1sPxRH/0=
X-Gm-Gg: AZFdTZdcaA29XcK/t0kghmP+FRX4xr1vpSFyF6OlVwrkGKU7kU8JvgRRk7iAj/Cg1Rk
	k5cDh6+W4mCyCqjelrVHTjWagmUrgz4w7y+S9BTDPg2YCOFcj6CB9Mn5Ih0uVl8HZLJ2u5+0PUD
	zjPFju3gGtRNZyp6Fi7CpuStJmOtv59q5lqeWnM6VJOluyEyjxdvmaOwY044EyF3DXRdUPf6qNo
	5xmJqF+XeW6VoX8iUSL9eVAjcSyjlkmtyVH0g+a5avZcHlAeBapqeMeEE9rk1JQ05nZwSsobFjr
	307tR3YycJ5EZsOvKVTRohfpcRBqblsmwyvIVAHWQ1grk6Uk85wQVelaO+ftVXFkc7ye+8sqTGh
	KnPMjCqPAujelXPhkVVKLd8HKpTP9X4WLTkbNxh9OmMNG8nQQfqboMUp4ka3qITRFD2buWetoWO
	MJ+jnWLuc+CHoo+fv61SbjFvOCIq0p1HLPIoj7FHOk4T6inbyJRjPD0kXaqquwx1e+eP1M5S3Cr
	LnxSWHqtogTll1iCF91iAaunp/TT0OmsYsC6GfYgsYXW5DDNPh6AAjsR8wDefyK0Pf/UANLklDK
	YinkVIwzkVO38NL0oRnPq66pRyZrHTemrMkSOU/TQ+opkHpa5WHElYNrZUEOR5z7d7RdX7rugmw
	C0WdItrZmAkCY1Sxyx3TI+opWiJhFOw==
X-Received: by 2002:a17:906:7944:b0:c50:564b:c63 with SMTP id a640c23a62f3a-c513a43559cmr1008243866b.6.1795445194534;
        Mon, 23 Nov 2026 06:46:34 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3701sm433004766b.48.2026.11.23.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:46:34 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Use QCOM_ID_* defines for qcom,msm-id for
 SM6350/SM7225 devices
Date: Mon, 23 Nov 2026 15:46:32 +0100
Message-Id: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQ6CMBBEf6XZszVtKTTyK4YDLYuuSUG7hZgQ/
 t0qHl9m5s0GjImQoRUbJFyJaZ4K6JOAcO+nG0oaCoNRptHaVJJjU9VKRo4lkaNT9cVbpYfgoGy
 eCUd6/3zX7mBe/AND/kr+jYSvpRzlowa+Z5RhjpFyK1Z3tjIFC92+fwDr0fVInQAAAA==
X-Change-ID: 20261123-sm6350-msm-id-f7059b401dc7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445193; l=886;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3RPjICq41onO9PV1h2WL8qP92Q0cMNBODW4SHoi0GSs=;
 b=5/2xKAbhxbBuFkNTIhmbRUi5AeNAGLd4bgsiXjxZ6n585j6DzPcOr5S66J3HjFDCU/gSvYXb1
 bcJ8hS3idWICKcCyJVy8VAGSrPcK/poc85ObN5I+Y8Qgheuhcc1gAx/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As noted by Shawn Guo in [0], both the pdx213 and fp4 dts files don't
use the QCOM_ID_* defines for their qcom,msm-id properties.

[0] https://lore.kernel.org/linux-arm-msm/awQ_90R8_uGWm2Sz@QCOM-aGQu4IUr3Y/

Use the defines to make the meaning of the qcom,msm-id properties
clearer.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: sm6350-lena: Use QCOM_ID_SM6350 from qcom,ids,h
      arm64: dts: qcom: sm7225-fairphone-fp4: Use QCOM_ID_SM7225 from qcom,ids,h

 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 3 ++-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts           | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: a4d7daea71be591034445c17d4d81132a1785a12
change-id: 20261123-sm6350-msm-id-f7059b401dc7

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

