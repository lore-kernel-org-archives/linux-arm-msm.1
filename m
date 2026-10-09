Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686C4CDDEF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545119; cv=none; b=T2WLjLYdwgx8kvwpFNx1Edws+KGKnSqrCFtlqOPReC25CpLTVAzX9srL8jPKxAnhE8xhb2RBUQAGJVMZvx2U98yw0QkAvYD9ibbWnHOSY4SZEOvOHUmjgOgh7EhRiS3L/YIEYJvXVkuvUEiszeGJoDMjATpXvOiFvql3nWkSXqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545119; c=relaxed/simple;
	bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKnfgaviGhS4zA/xJHuS7z2rIHPWHO9MfVMREzRYXyBZA4x+Ao/xxrQCXd2KcX4lZCPOHxKWeLG3ZeYyQwp8gCJn+v8Uv5Es6l64kA+XBKzaWlbTZX8Qz5ws08UEyWPhqt1lYcp25jDZTeBLanJkWVN2s/2lwTqp3af63H/l3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uQDmbYME; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uQDmbYME"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a9e5ba741aso5985530a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791545109; x=1792149909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=uQDmbYMEU7KJd5um3qYuideomb4P60KzbzDnJfX4B594Co19Jj9F5nsokp9I5JoRHC
         MDKHBHRtKS9801fG+wEC6jZAVRUL4J6PyJEocYRgel76iCtY1Htp4d4yREGsj1KIv5sH
         rs6E5Ke1f0Xefw7x0Y1traXYA5uCVkyPQVMUTQlWZ7H/BkFBpeK3kjL4FRQGzmFMjPQn
         LmQs09cx7Uoeph5nZhTLPgCCxzgZ+ji30+1a55KcWKJRR3qVXWinku7JfySUzsykl+na
         8Jqmtx+r1zacazmfTtfBnzJ/SeYL+6JtIYpGtFxkFOHMv1onDHAKp7D+yK2NLB9ExHhI
         pt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545109; x=1792149909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=1AEec8/bcouEgR/pVufYGObJQfJhVAF/ygtGMcme7bD3Y01YJ+twoMndtgiMPjTJKZ
         7B0+7rv/Xrcgo+D4xugh6bcRy2IR/+eHwAOuEvAYLO9e2/hDLJVpNQih0B/NZqvmKC6p
         eN171ZVOwKgaTwarw+//3znf2bipkpW5eEex4rnsOrzyCoutzq94TKZWWXUTqVw0Hb4b
         F0DV7y1RuPE/Gswn3AYCmnWbXQ6kZDjHSaqF78Ihyhru5/g37vQyCBlWzvzgaAJ9nBKf
         uyUC7czMXIKF2EPd+tnHGC5jzXYyvgzgmEc8yrt4VFwbJC/gyoT6pWL/7fDKxnbneYCA
         hImw==
X-Forwarded-Encrypted: i=1; AKwUvByl2konoSDynPK6hQRga4cPDfL3JzcyLakq4kUHM8+FvQ00Z3Cs81q58/jShphm5/P9GGILrchUFkjeRKUe@vger.kernel.org
X-Gm-Message-State: AFq9FYIymWcC/F6+0M3uQZbZMSLf2iezgBLUGoXW8P1V3QzDrbWzK790
	W+J/tmc8vJXABz+TvmmefeZcZgrf2C+9X67xpilJFsQJMIQhpPpTsD8hvkncuRj5a+w=
X-Gm-Gg: AYBFou2DHIyoIWsbAX4+lGdrJknxxaKZbtdY8B1gqwWTPVqIrL2VTh6Dqv+CP6tkdgJ
	NJwOCOJIzMrq5jfr+ECkSDrkrSp0NLT5Wn0l7BuaN3bV9Bw2FSTFv01Kg98HoXZQsC0UqN3hit4
	5YJZUomfragIoKVb8N3h9/47x9Xfh/ZsF2ymNoRhVCInzSGdGjATLKLMKr1vtRIWUW2YKfCFwST
	ldIFPU5i9xPF3/I8MmIhcQt1s9/M8OF60QJh6s0bZXHoz6Vg03I09CxwOvt+wuGfAI0RoIrUSMI
	FZ//M2yus16urkVVhmr/mLH9aelF48Osv7aqoHpoKurTfHpPbkIxryKJEUQ3DwFFaKEGvwGNvCW
	BK27DnfPWyN61scub+w6vPABev0pZgfJmCOXHSHzemlADZVFeFKZ1iW0n5VJJv9nIAgWxRkUCST
	uG1jobfA68AxFXveEUrnF1gKHdHfJOSxFRZbzgUaWHeKQ7lHmykp5cuIwuBq47SjPXZlcBIqJYk
	PZ04rMDnrRiASjHq2Mf9UFvO/VF8/bpICd3dCz4iRZoMTTeSTR5
X-Received: by 2002:a05:6402:274c:b0:6aa:e3f3:c9df with SMTP id 4fb4d7f45d1cf-6b17c252c9amr1447419a12.20.1791545108898;
        Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm985764a12.14.2026.10.09.04.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Oct 2026 13:25:02 +0200
Subject: [PATCH v4 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fp6-panel-v4-3-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791545105; l=791;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
 b=zcZTLYpESs6HkFuhiJJO4ex7iS3OKoMwbYeYOixjFkTwhHKF6/mXLg00Wm2n2nZuJbFx10Srw
 hzYG+p/eC5fClyEBuI4SYS1ZuYA1CMxxotWYaEVsc48KMcsuoKB/Vpe
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..1d4afc733c8a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1023,6 +1023,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.56.0

