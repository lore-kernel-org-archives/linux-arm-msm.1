Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282003;
	b=SEQaCdf0jvO9sZIWQxBZkTZT4dB2z1E8A945T/2hrCJ5ua+OvSe4IKwMYtiIv9gJlLIe
	 5gaoTqtzKrhicv8YekuL6y3GttaVh+NV8Uvi5LCt+ylfxGcmo2EbFhvt6bEVK3H6G9HSQ
	 vg7VdH1SDTdGgHsngT4TUIibvqL/cTNGasdX9qmzwmso6K8gGqIJtfL7cp/DLPM5YK+KQ
	 cTsp33kiJDsEP7sh7I3A1NOjYevc0KjnDxvvq2fZZhnXV8q5XoJDfFHlm3aFrsbibG2qd
	 mEqUqyesmi4D8oKiuY0fTd9p2E0jZs4w4H9Wo0bMfSJ9CxpgR59P58xUHsRbuY0VbSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=F6iyjptvh4HoJM36iNO76ddk9CmJXz5lBV2KpfdHPWQ=;
	b=CNasMYHlW1h7hIqx9Su00suTGY5e852RX3gs7iU7uZCEEVYGWEN2eWRYFXDREQgA4g2Y
	 cP2j919jNV6xV8AH3d/IdmtZ8BiybmKIfoIsvdwcoiX0lT2t3wUZAC3r9kYDftdZ0aJSv
	 g/HD8teIyBDVGF1HPXo3hhjMZ6UBQatJEj4Tp12lRaP57Y5N6JR5U0z4c/jUF+f4ChUnL
	 kG9E9Bo9EePMecTPUvArnnnQ/Mnsl832Zh8lPBS4Vo5Y1s8mReYZYoP65fJpk12kxfQnF
	 nGXAmx77iHjEUTjc3EFm1l0giG0QwSEK7/8Bug7GPpZOV5kEjJYStb4ywHFPVaRgPkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfFtODtI;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F260A5BD5
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283F260A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfFtODtI
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so20351355e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282002; x=1793886802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6iyjptvh4HoJM36iNO76ddk9CmJXz5lBV2KpfdHPWQ=;
        b=UfFtODtI+om2m2VG0IwwyR7Ee3t2Tszhx0rPZbmSS7+GfanhfyAAHbx41uxOjyJOaD
         B977Tjxl82vcQqjpp7OJSJtHz/BUyFtL77KCTVCQoa0ep8TtZmfK2pee8DHorWLJEfxn
         MV/KdNZJrK8mk89XI5+6R0JNgIX21q24FfkWhGzseJ4TRlVXlVT5FcWbsv9arR7SlvBA
         TKOM1bYiHUay11A5D32+YRZMGEfUVUdTifJXzL4DiLkj8fnfnDfWBd+h6/M+DkD7O7Dg
         tBSeYsG2vXoDVCAY+P9UbA04Hzmw0FjvYLo32Sofh4AxszVI08ZAb6Jvl8Mbx5gBrRSz
         IrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282002; x=1793886802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6iyjptvh4HoJM36iNO76ddk9CmJXz5lBV2KpfdHPWQ=;
        b=oR4yD0VuzbYT2IqaMvfzwr0jyV0xc5ZZXLhlqywZE+K2x7MHS9miRHxLrWnD/8ph8+
         9Y3LNWh1U29ndLouiNk/WfWxxLysvgPCCc3O0nNZUKt6zZD5lA7e+9CEMLqgCDQCu0U/
         EIyVouAq7RmStoWVkpGTYlq3kO3IDg0PQNllzAM5Ll+Aezc/kA1MmiWDi5btmUsN3KE8
         MaUtjR8G5yTrCPHltbJQbWCOgoF56sBGn/CNJjbW5mOCLtuYbvAx3Qs4ieOIgJDMwGH3
         IFl1cesj0FP0924TmhI2yvL1VrDI1de0B8EnBLbvcCn04vvgev9zaOoYr28gKaL1fBZL
         hQCw==
X-Forwarded-Encrypted: i=1; AKwUvBxuquNdnOYuyXnDnbuaPB9ovgU1QExi/UOECJ7+PyFu2tIL9/emBYHAI7ra8rz6uljRLF1cnU+zwMzU2lQb@vger.kernel.org
X-Gm-Message-State: AFq9FYKW0SgQpJ97EcK4nrCqGm1MeGi3saeLfeQdJATN40sTEmYdLAkC
	6uTIfz+aERHQtZGDlViE7d+0y8w2NGbreoWkJFu3EqUFrV7IRPprOAk=
X-Gm-Gg: AYBFou0eVVt3NyWTyy6rk/CmWGyhs10ZRodzB3MqsD9yDBOZ4+ufb7+j6JL0kmcckAC
	VzQEAH7Qo1oJ17sYGcGM7sAdVzFKxTN8WdEr5OKqmM00avQiYBuAHi/CKcfMLjm/7Z6bfHXI5/r
	C7byWaMV7lsOOkw2TYSGbJru5rGRaDbzCJHh4CL0ZGzYprFuxXwXBSI8B/dyMp3WyKbxoh54xKX
	dsun6WGUBdlivFxjhcwK/HioqU5HBKo0pMdPpufMqwo42+wNyTGc++/FQEnwG3P6oJq3fSGhbFA
	CDwd1Kl/69tDu7MUnLJBrkOZpkjZzPEQ+iZfuDGtmqf/j9kzDZI3HTW88MG3MHRpyNG395FPZLG
	8aI8h79RjZ4m8iLlPGYwD1Op7wMz+ubBEmpUccZRiFdnc49RK3hqFTb2Vwxmvg4SvN42Fkhla/O
	GngPCdGb1ctzmBETEyYrCLavHZiQxokPkXh03nQ2V/2jR44LlC8XAKBcrtKrrol7vW90dCThwjJ
	7ugg60EjPASxmO7M8PLVT27BREw+haG1FitqtFSHzSIjnY5BsBg6qX7x2ie6KfEEDxfrkIiNhey
	RHJDVPPRhhowj6umAcD+7AAw6Y1yKzrqRU1rHS2VIlZgrw==
X-Received: by 2002:a05:600c:19c8:b0:4a2:150f:160f with SMTP id 5b1f17b1804b1-4a967d96ed4mr130087105e9.25.1793282001580;
        Thu, 29 Oct 2026 06:53:21 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:19 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:45 +0100
Subject: [PATCH RFC v2 08/14] temp: add LPAC regs
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-8-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=3442;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=RZEFtq/LXNa59m6pbHJ662cjcscb6GjQIUaPl2ZCGCY=;
 b=Gg0EOPcUOgQpNZut9lNNaoRdNIuSBEJgfuo2weKWP2BE2uB9+coUCffV36k/9B33kt5L/B+7s
 HpwtMjcdQ9CCbIIPIywq4tqFWNV27VuvFgGbiHV02csNFC4O1QaG7Tn
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39416

should we merged and we should sync to mesa instead

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 3349c01646e1..bb49f6a61a9a 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -276,6 +276,11 @@ by a particular renderpass/blit.
 		<bitfield pos="1" name="ACCESS_FAULT_ON_VIOL_EN" type="boolean"/>
 		<bitfield pos="0" name="ACCESS_PROT_EN" type="boolean"/>
 	</bitset>
+	<reg32 offset="0x0B09" name="CP_LPAC_PROTECT_CNTL">
+		<bitfield pos="3" name="LAST_SPAN_INF_RANGE" type="boolean"/>
+		<bitfield pos="1" name="ACCESS_FAULT_ON_VIOL_EN" type="boolean"/>
+		<bitfield pos="0" name="ACCESS_PROT_EN" type="boolean"/>
+	</reg32>
 
 	<reg32 offset="0x084f" name="CP_PROTECT_CNTL" type="a6xx_cp_protect_cntl" variants="A6XX-A7XX"/>
 	<bitset name="a8xx_cp_protect_cntl" inline="yes">
@@ -333,6 +338,11 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0845" name="CP_CRASH_DUMP_STATUS" variants="A8XX-"/>
 	<reg32 offset="0x0908" name="CP_SQE_STAT_ADDR" variants="A6XX-A7XX"/>
 	<reg32 offset="0x0909" name="CP_SQE_STAT_DATA" variants="A6XX-A7XX"/>
+	<reg64 offset="0x0b00" name="CP_LPAC_RB_BASE" variants="A7XX-"/>
+	<reg32 offset="0x0b02" name="CP_LPAC_RB_CNTL" variants="A7XX-"/>
+	<reg64 offset="0x0b04" name="CP_LPAC_RB_RPTR_ADDR" variants="A7XX-"/>
+	<reg32 offset="0x0b06" name="CP_LPAC_RB_RPTR" variants="A7XX-"/>
+	<reg32 offset="0x0b07" name="CP_LPAC_RB_WPTR" variants="A7XX-"/>
 	<reg32 offset="0x090a" name="CP_DRAW_STATE_ADDR" variants="A6XX-A7XX"/>
 	<reg32 offset="0x090b" name="CP_DRAW_STATE_DATA" variants="A6XX-A7XX"/>
 	<reg32 offset="0x090c" name="CP_ROQ_DBG_ADDR" variants="A6XX-A7XX"/>
@@ -521,6 +531,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0b29" name="CP_SQE_AC_STAT_ADDR" variants="A7XX"/>
 	<reg32 offset="0x0b2a" name="CP_SQE_AC_STAT_DATA" variants="A7XX"/>
 
+	<reg32 offset="0x0b30" name="CP_LPAC_CHICKEN_DBG" variants="A7XX-"/>
 	<reg32 offset="0x0b31" name="CP_LPAC_APRIV_CNTL" variants="A7XX"/>
 	<reg32 offset="0x0b34" name="CP_LPAC_PROG_FIFO_SIZE" variants="A7XX"/>
 	<reg32 offset="0x0b35" name="CP_LPAC_ROQ_DBG_DATA" variants="A7XX"/>
@@ -1207,6 +1218,7 @@ by a particular renderpass/blit.
 	<reg64 offset="0x0E08" name="UCHE_TRAP_BASE" variants="A8XX-"/>
 	<reg64 offset="0x0E0B" name="UCHE_GMEM_RANGE_MIN" variants="A6XX-A7XX"/>
 	<reg64 offset="0x0E0D" name="UCHE_GMEM_RANGE_MAX" variants="A6XX-A7XX"/>
+	<reg32 offset="0x0E12" name="UCHE_DEBUG_CNTL_1" usage="cmd"/>
 	<reg32 offset="0x0e17" name="UCHE_CACHE_WAYS" variants="A6XX-A7XX" usage="init"/>
 	<reg32 offset="0x0e04" name="UCHE_CACHE_WAYS" variants="A8XX-"/>
 	<reg32 offset="0x0E18" name="UCHE_FILTER_CNTL"/>
@@ -4406,6 +4418,8 @@ by a particular renderpass/blit.
 
 	<array offset="0xaec0" name="SP_PERFCTR_HLSQ_SEL_2" stride="1" length="6" variants="A7XX-"/>
 
+	<reg32 offset="0xaf84" name="SP_LPAC_CHICKEN_BITS_2" variants="A7XX-" usage="cmd"/>
+
 	<!--
 	The downstream kernel calls the debug cluster of registers
 	"a6xx_sp_ps_tp_cluster" but this actually specifies the border

-- 
2.56.0

