Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061EF3A0E97
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278876; cv=none; b=h6YsE6OM15BV4n9MZ6pQ/oHbnkWC/wQjdALBXv+FqM7OfVemRZV7gO3Zd2gZevqWeN4uEJohHoQkIFRKGO+vM1d4LevJ2FEvusUhjB8yyku8QkXpkGefFdqWgM7F+0v7Gv/DcqEt0QyyLEPdT7UcbxPr+xAVmCDynVmwrgexLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278876; c=relaxed/simple;
	bh=lEQBWGFQsawhS3Z+empPXIW4pjOUFPTBX61IJG+8wpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAoED13rjE8Y6hFVyJjbQPUncEPDPEwKq/Q3abRcz+IXnHFHhQahcW0/clWGKnU6TS4GOXE13yB6fOKMuX9UyJ9w0+zsqc77HLZkdNDS5r+f1MF2nXwHrtbgAInaLOSfoWUplA+rA2wDr4AabD5WfNv/NdMlXI3xWAIpCkMJ7yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyDGPo+0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyDGPo+0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b27c7451so29579485e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278869; x=1783883669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBnb62S3pox4azVRKerhjkKWZjHIp9f0CrUrLIrizHI=;
        b=cyDGPo+03Vartu5Br9y8c62Pm+N9J0GGISQQ73YbCNwdeq0rUksNfb2x7d3dRPtr5j
         Zf/xgklxrL7hNvfuoiibqT45GBSU5FEvzqUDT0VN0GkCJRFiWmltYC0ckkmClIHJeYx0
         JJqA+3NaG/D8QiegSYmxbRsUkfy5k21EMFm+IAoeqMSJeljkLyMf4JeUL4ALR0Nko8cX
         UuusVVdKZVpThFZc9TMvHVwwRVuzRvX8lGtoytrjOFgoNwPnVNXdc1ulKwSazvlzzq+o
         gSsZKka68sbJirFHn+FgG29FcYxzFHklxZa+ETfrhbSN6Ok8xS9t4FNYN8uJeXwFq5vv
         GFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278869; x=1783883669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rBnb62S3pox4azVRKerhjkKWZjHIp9f0CrUrLIrizHI=;
        b=NbELRhwjUDfiNCKAOsKyct7hiIDCFDApDruE5TW8Qw/N++/60CG1obIOywpUG5KoWt
         gQ/jIi6rHFANQabkZvRiwA0liq0RZUwzNPYjIru5OmbXucYkkHgnnRXbGYU52umE5IUg
         3JGcXPJDQJdPdPzl0EceugHpt9tQiOkEeU7kGvdN2BnZYBkGqQOHm2YW5Efa9umEwBcO
         0zUN92kTYTDyUHyfgbB5AjM+mbvzAknxx9mdvf5KNE0ak+3ZX5QohfR4Z5dPUKtvUrtC
         LwlFRydnTKPtzJbvks/cQ71JechDcve9IdjDXgeMqEd6ArvMTfT9ZZf0Tg27dHHMPxuT
         3b3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpNX6/gLv1LHsZStY5QD4lrCl0fcz1Vggb8OTwUuX6E/7B3HF5Dq1ARWsHRDWFUVbQNjsOg8mZRXXzX0019@vger.kernel.org
X-Gm-Message-State: AOJu0YyUVyBilMAzD40hmMI6GJ2ZSSxzGXHQuiFCEqFLDj/l98EDYkjD
	cBxmzXQnKpoNjVrCnPxzcG/FIGkeT2G95xDlNY+HowuYDP1+6/LLdws=
X-Gm-Gg: AfdE7cm4PgH0eAUVmqY678WFAJll/vdqcesNiL8uVwrdwwz2PRr1nEK0g/No4jpJjao
	7JI6Pm6rpxx+wrxBmlOcvc7cub6/GLFO7NPyYh1DEIbDmX04RSdtGTmXB6PukMfheI4Ak0RyEFS
	/v4lRPpMF5jC6h0C9TafhbiOzZZfnERvDOHzDvlSLpFoVd/tZqUMHkJvMc0b/d1CS0BbiCzElaT
	EBZ8oBFpTIyreaPXpQwHk3Dd6dIh+8IAa6p16TuYDi/2wRRjn6+EUZ0mhfQitkf/hJakbaCYBMZ
	7JsH1gsZeBy5/Bd/IDwTCTwapOQxwsVBmF/f1NbQTAWEA9H817dILMH/gqYXGPKXVAqtdtLfNj3
	neTwSe+Ze0ijZRG7HHDTjxLogHj8ab8sEfuIdP5I7Sb96koTAXHdxOzN63HXPQv2RqKJCiBuaYc
	BtlQY0E/eVrYXhooYsOGcuHO2PVeUClA==
X-Received: by 2002:a5d:4530:0:b0:472:28f2:506c with SMTP id ffacd0b85a97d-4793561c1b7mr10294287f8f.13.1783278869284;
        Sun, 05 Jul 2026 12:14:29 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:28 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:42 +0200
Subject: [PATCH RFC 08/13] HACK: use cb1 address in lpac dtb node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-8-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1103;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=lEQBWGFQsawhS3Z+empPXIW4pjOUFPTBX61IJG+8wpQ=;
 b=ghyBtO3mPmOZCBw2AnqYHPShuXdJyTE+gTcOSZ9YU5rU1L9CLwjDKC2Kyv3ZqsOQvXyq+rMJb
 aTedKIXba75Aenv0imb3SDNfjufYxVMYzOkJYRnVags1gnQPFh42M4o
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 44e5f9d4b335..66ea9155e228 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4133,13 +4133,6 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
-		lpac: lpac@3d00000 {
-			compatible = "qcom,lpac";
-			reg = <0x0 0x03d00000 0x0 0x61000>;
-
-			iommus = <&adreno_smmu 1 0x0>;
-		};
-
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
@@ -4254,6 +4247,13 @@ opp-834000000 {
 			};
 		};
 
+		lpac: lpac@3dc1000 {
+			compatible = "qcom,lpac";
+			reg = <0x0 0x03d00000 0x0 0x61000>;
+
+			iommus = <&adreno_smmu 1 0x0>;
+		};
+
 		gmu: gmu@3d6a000 {
 			compatible = "qcom,adreno-gmu-750.1", "qcom,adreno-gmu";
 			reg = <0x0 0x03d6a000 0x0 0x35000>,

-- 
2.54.0

