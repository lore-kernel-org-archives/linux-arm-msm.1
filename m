Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281990;
	b=2g2ZfCfr66C3MbjKxLZsg17bOfaU5S+IAfh1iUquVtCkkOcQRzyCQ8srcJNUGB06iJs/
	 m0FQQoh+Xk4GEK75Fg/ISlwq2qL9Dh68YlXzdy66G4QuWLxArRhlKUOknulGyi33cFBfD
	 9NaVszxZYOSmIA9xQF71LkBFgMS3mJek/isb6dEfU9AaJaFMGB/F1q95ru3PnHWSsJ5QR
	 hT7qjlMfoJ3N1q0NRSSLNVnCNnaYPyqxDncdare1tToPd7rsRN+NJpjhXdipaeXtUocMu
	 up0XJKU4F6IYnGYRnS8zGxhCf3Qr0UaxS3GRxfHDQmBYu6ZaF4z8cSx0IfbK0llpzqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hqI3xUsD2cNMA3OqjFeaiLeXLoIzktOWAoDJXR6bb7g=;
	b=ZyLmmNk5MplHjL22ip1j3vYY+nNUWnuyVYVtgRreYkkxpVfD0SvY/G8DdNMIJbzsJzFm
	 MKxIYEH2rVfM+5JdIW8nqRIoorGIysVtZnEpfQLvXrw5xOPjB6N/2Lv/NNaWXTbC/QxTD
	 sRAC1lHaGWKpYFNtxZB2Tvz7CCMH2LyvWgthjfOMqahzo1h97eAD4UbhocMRanJBgwkLh
	 eTiZZHg0F0CmxN2B4t7sbitbVH7NSZl3M+FkqTTFJchFZIHcPJIt9rdZY8PpQMofqg85p
	 SrL5ybNYlYm53R0ojS15t4XH6eE0tisFMCGOmr1JHYeHvc6KX0x4pGQh3d0gLc+1LOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtMRmSyY;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1E60A3806
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA1E60A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtMRmSyY
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfb76b304so391162f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281989; x=1793886789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqI3xUsD2cNMA3OqjFeaiLeXLoIzktOWAoDJXR6bb7g=;
        b=XtMRmSyY4kIgLF8Gi8D5p63d/yjBO/9fVq1esnLLoU0GJLrVtihKf/btKMZSRPrwl9
         FKqssf9a5GRgYQO2LaNcgQmORqa/vCW0Qx2EVjJxpSXKEY8H4uOTeYG1RifJkBy1REZ6
         pcLHZEbNNKiW7SnzYzSGqGJlgzQfapSugzhS3I5BcsbKTjTdCLuVxMq6ZirmjVpx2io9
         x3w/4xuaoVc0aw8ildU8T5J3fG5NLULebjOWybvdz3GVRfUgTbwW9ubSiKsxOr5hfidd
         Tg6bkZIOqa85wZNVqvxcLxQkChG7rnTY+OOXeNVHSppOGEbUgjxxZdd4LZuUDhP3XKiz
         A1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281989; x=1793886789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqI3xUsD2cNMA3OqjFeaiLeXLoIzktOWAoDJXR6bb7g=;
        b=zCOQukgyFF4KTvwh4PGSgJZZRDuzVCn63TJtpyXOFCXvROh+9ySXIspLRX3ntCs3I6
         3vv8tU0OhRoDl8khgZrTxZbKnXfnC2ry3YML2jEauWCuYFETlZufr5I/YayGsbn9jsEJ
         dGH/ksC+mCreu5W824JbxGY7h2usfW9Q8jFBbBYIDVIeowsRtEYAYWUwpzMrffguaHf2
         5/uSG+Vs4+QFjirycWc5DcViQAmqROCwhwJGVWKzHkh8jyrXMxZJxdzieA6BDzKMDrCF
         qvN1o8n+QtgvNwcVBhsYwvsn1k+VnZOvJ3djZj6386LsViLvdc7bilIKEP19M+027omn
         9AtA==
X-Forwarded-Encrypted: i=1; AKwUvBxSjXCWHriCu9jj2Qfw2sE3ccMMuvb+0qT3cDY+YZSvIvd71kRb7gVu18WkMCaqqdeqlcB7Lwk+Qu200LIk@vger.kernel.org
X-Gm-Message-State: AFq9FYKtAPbOg4gAoKHdNGSr/jmGNmTGS4lYdAFdIWmNF6h3Qjzc2wwh
	1TGaYhE0ZUnnyfN2Lsx/2L54zhZPSmOHyzOC+QCjvCGLx5RU2wc4yl8=
X-Gm-Gg: AYBFou12nRSZ0VuYPWUIGlffIyeeM3m/6uZ5U/wc/OMrf375YtuiY5zEh+QJrDjkMe5
	e6raz5xrJRvhvgklspjr/j/fu4maZrXSxu1hp3HgxGDacEGwYA+woUN4FyrW4kB19ryUkOtAWD4
	yNkMTNIGf/K7hORyyM8Pd09YzAU76WX5tON9MtGXO3Yn7T/IBWoH5uabFC43TQ6c79a5pTsLgNe
	31osjcMjQKydDkf3K47Sj92UlQQC0V0RFFTRS+sv4ttCYmA2WYzW2HATuNHuWXAMzURmb4oVcL6
	WX2pbpf00j6J7trBP+Kj0XmvhykfAtFpwBu2ATXv/h9ZPciWIjcfoPFcLFaCHcuwVDemlryPRU/
	CE4t1dg815pcod4ECbY599hGjz10OXymWC1YfsY0EW45VAm+ioNOVXHVhXwnFuTVS3Q7j1Hfa71
	VSW/wq/cf0uBdjJn0IGtkGWDUHOHFRKPOJuD7Y0WhPu9MGTvhrCn6EsCMDhOVKlZGwpuOQGu5m4
	wOiJ5C64JLH8vZuteMVMO4q1JiJop0oVkidWmBtF8ittrf8GqQp9TBxFruGAMDcb1Z8w5ay2hqE
	YrykOGSqaFTSpCjnIVMD89K5oosJK17AVHc/MQjEF96Mvw==
X-Received: by 2002:a05:6000:2806:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e5d5e237bmr9297013f8f.47.1793281988693;
        Thu, 29 Oct 2026 06:53:08 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:07 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:41 +0100
Subject: [PATCH RFC v2 04/14] arm64: dts: qcom: sm8650: move smmu sid 1 to
 new lpac device
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1186;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=m8LjyZqlFLsxlRip5l3NXkwO7GG8cECPX+LNQd1tpmo=;
 b=ARxR4H9sfFo+nvh8rZ3WMz/5vBOcWptYc4QScQ6BwDzQQ9ZqJR17Rkbis3J/NCOw2T3Y+DXYV
 1uradRrW6R5Bl+J4M4CED5l+9lrrUHdMAtWHma7WA0JnTxjPc/6/H28
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Previously both SID 0 and 1 where associated with the same domain.

When LPAC is not used this is needed so firmware can acces memory when
initializing using the same page table as GFX.

To use LPAC however we need to move SID 1 to a different device.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..f47d1dbd06da 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4144,8 +4144,7 @@ gpu: gpu@3d00000 {
 
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
 
-			iommus = <&adreno_smmu 0 0x0>,
-				 <&adreno_smmu 1 0x0>;
+			iommus = <&adreno_smmu 0 0x0>;
 
 			operating-points-v2 = <&gpu_opp_table>;
 
@@ -4158,6 +4157,12 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
+			lpac: lpac {
+				compatible = "qcom,lpac";
+
+				iommus = <&adreno_smmu 1 0x0>;
+			};
+
 			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};

-- 
2.56.0

