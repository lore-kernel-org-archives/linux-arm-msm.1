Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267737;
	b=a+9kP6TirEh3id0C63I/NSmgcHD02Z20kWlKLXN5ETmrSvqHvXXfTxdw+MJqkjfZeRxi
	 P0w9MNA22bCG6ay2gRJr7i6RnGKV1SlC4cwwKmq3Af/BuEmOj7AzgvW58kcs8wC0n2qMF
	 LJsjBgfmkK6L+lQFI83840q2QTBUCzwNAMnX1XdDLkfREgHI7dGP1/T0YzciaOYEiU3+y
	 5/0MT5F3ie69Jn6ZT6M0dVSLSzcA3VfwNZqhOTVgY9Egb+i8dFk9Ml+ktelnwlSwpkPnw
	 RDrWa2pCrn0xEZs+THzpRWUg+su62tc+ThqO6xhigRW5paNgP3RyXdgZEVruKSg78Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PrCbcHJkhdjSbNCRqk8yeYIRKNcSPa31zVUyGmEiOBA=;
	b=J8FNwR3i2HhdEytcGAFL8Uhs283278LWR5XO8NSNNJPlhdWeicXlnoNau8nVMy4bx0nk
	 9/HJdXsVNs/CRSwQ92NV/Y7q7sL2eHNw1OqjDDannf3JjwAi95p7g/aOXA6XxM4abwhjm
	 2dCuDquDNKq47rjrfFiV7gcN4RLyBdoLLM20kHXfXr5v5/G5HNqyatGrUevYjbX4C9WuM
	 zL+PdAfBIytEBUGSf9Qho+LjlbyOhb0EL27EaI6KuJs4x0TtiBCrS89kfSUZxBPX+1vwL
	 gNOesKhMnZq3gZppPNMDN9EGjjE0uypyPtGp6lFRnRlc/zhL/KPcsNMe/pYcndPd/qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="w/dWBbx+";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2223360A3839
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2223360A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w/dWBbx+
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1477769f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267735; x=1793872535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrCbcHJkhdjSbNCRqk8yeYIRKNcSPa31zVUyGmEiOBA=;
        b=w/dWBbx+CovOJKWQFEnbdicxeJ5/ehGu7760QZ51KYotDAAc4mtgqCtarSBZH1/oAU
         ip+Xs2ydYAOcGXxMRQFcaxbzxFjOCnQcMQ/xe1UwBBgVdCW1j7UVY9khh2sFENYKRUpm
         +KOPpjGAKTOyLh+LXJEzWQiaeDS1UEAqMntso7a5ZE9TwqgKNer1AjnTtWCvuK9xrwXS
         1bQkFGhFiHY3JOk3jRN5y0CTSqO2HsletEYsx4PwtN5Kafne6vq8FTeq/PBp4BLozZls
         8h4pUao6y7Is+WS7EGHn2PNQtM4LMCZ9uNJAARU27ZlejYNasKJp6odIpME0h/6DdlrQ
         pDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267735; x=1793872535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrCbcHJkhdjSbNCRqk8yeYIRKNcSPa31zVUyGmEiOBA=;
        b=HT3o3dKC2iW410Q4Eev4GjXVaYErQ24/Xhx1cczSZt04TTGQ2jysopNQgWBAHZZXde
         RLQ7PE5WB+BlnEbiqhxLzcXTOJFbZmPvcYZhnanW8hkZ5FeKmCvSwN4b1iY48qofXkJ+
         6qaVJDHcLakw3IzGx5YrXsg/uOPybLg7b0Y6+JdEn3TNlsv3HHj1zjxerZPjaxk7HVCJ
         PQZNfnjXELAGtaGcPolnfHpf3t4ZUhjCRkx0WwrZ9CGDQgbir4kkbJ9AelgfTSiWddan
         Xa0CFrQ6OlHgqKtwI5mmxAABT76B3GfNqhS/xtMhmRfisWSYo4OoKyLC8V0HCJksUn2s
         Jw4g==
X-Forwarded-Encrypted: i=1; AKwUvBwcMuqnuf2O5pMzKG8QablNp+hD/hsPwNNQMTquFOydeyDt7MX1UeZ8GO1uAfTWUuJXZFxLvC+u1O7G9tpK@vger.kernel.org
X-Gm-Message-State: AFq9FYLxeiSKDhcQDkkw/mlQa6M62lEvDb++Ce+qtOv+jL394jdjRAGC
	Nn//+ANsW5EqldgEwUheroSYbYXaqmd/Ff6G0pdxNsL1VTa9MmTuJR1Fq/ePS7MFTh0=
X-Gm-Gg: AYBFou3NPNdtyZRTQWhRDrC6Lpweq1CSQ6trK4TaKet5F6L5ijRzOEvlyTi+YasZ/Qf
	VGeeMhPJO+y2edpPo2eTPQcZBwJa6C9FB4iEHfcPtKtQ30n/8L2miq/+JveJnxqcbYO8WtN0+4c
	u2uT4+J7ZGJJIpdAuwzW9ZDp5dq44ZskLIKFMnYmLV5+a+SSNGhCENZkNOa9+J52IT3bZ1GLjaN
	BJbVNCbZUQTs2XCReQaszpMaTZdy5i5G71VuSLCrg/SQrzvbiSliXe39iH3a7VHI8y2TPr1xsK6
	fSCJ7fEFiy28M8rs8MAQygCX58nZoxb07lcCzzRKM3JRSuzTKKxH6zFM4h76bMbOuzvhedBsgJ4
	M5PCppPl5im2ZbiIzFxDRImODhCfRohEMQEQnDMyt8kxur20+MEKdbhFrAa4CzlJiWJQjsM2xF/
	pGqTrBJuKPL/3ZSQ8x/mp1uiHXksPpEwsS68IVXZojk2I+yZMH4PwmExsyfMnN+fv1KnTUQaIDX
	l+MRHYXS+2cYhNpIHl02JXiAZut5KgAJArqwsvnEqrGl5vN3jhlpE9qV4xrG0PjkdgUiYZIyFD4
	Tqa7rcHyljX6THId+gY=
X-Received: by 2002:a05:6000:4007:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e5d2f1f5fmr12175285f8f.25.1793267735461;
        Thu, 29 Oct 2026 02:55:35 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:35 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:17 +0000
Subject: [PATCH 08/14] media: qcom: camss: csid-680: Enable RDI EOF
 tracking
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
Message-Id: <20261029-v4l2-frame-sync-v1-8-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348; i=bod@kernel.org;
 h=from:subject:message-id; bh=dXv09uQCEs8qUF2K5KWFAC6wPULB4r2M9kbjuOqOpSU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgMmujgVpNlGYSXf65flgvekHI0BhlteX5PA
 vkLV+9gUsWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDAAKCRAicTuzoY3I
 OhGxEADBYyhwfefWhvg1ebub1C1XooYs4mQe53MG7nHMeZa2El09YtafgxMVfqLcF6e6Jrm56ev
 kZi550Ck0+6H9Gka8eUMJes90PUbtu9Sh6RtBWV/gqLGWuF0mgu/NYjVhKIoWnIynXKyxoxI3Gm
 53UrwXcJeQNGl9Ve/f5+gcsl7rjYc55VtK+x1nYTGseFiSlXCsn/VMX2UjCLFzlJdfXhH+SXJG8
 b5oQImi32ku1ZGZfaCWKwoyn83ynhDYih4FPgvjtJwsLCybjc4GU+1mBKsX+VsujWtlE0YcDssf
 EPOseSPFrSBrRbbZeQjPPHLoHZO4oKqQtl2ELE6HcQ+qQ90rwFsmoBkx8fFxjZajQ89cD2eDHE+
 bxJdnj91e2CxfzB/sIRANZWho0Me4JYH/zOTSq4hcmM8SzM6kQp1XhYUtPvFqe5NV8LyR4IhUWp
 KM5EP1cW/R54IWRssFCkJyM6ZUzn6E1z0vaighKba4JZ6BRv4KTzabAZL8xoeKxlrLm9PpKbQem
 kV3gao7gboLykWFoMlLm7DLhmWFvvTJQnuArgtzLNZvpk5XQdoo7zZpTqLi5ynTDWGLqzLXpNwP
 BgbcrpYr0Usw2SHhZyrdX9DYyLjB6bu5yr4J8iu4TzbT4pKU6hu8cWQ7+XnYzT1ljZcqQu8Fn8f
 Na8cQamoqlOZIPw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Enable the EOF interrupt and notify csid_eof_event() to drive the
vb.sequence.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d5..2113ce13eb56f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -303,9 +303,9 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	val = readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 
 	if (enable)
-		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF;
+		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF | CSID_CSI2_RDIN_INFO_INPUT_EOF;
 	else
-		val &= ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
+		val &= ~(CSID_CSI2_RDIN_INFO_INPUT_SOF | CSID_CSI2_RDIN_INFO_INPUT_EOF);
 
 	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 }
@@ -413,6 +413,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
 			csid_sof_event(csid, i);
 
+		if (val & CSID_CSI2_RDIN_INFO_INPUT_EOF)
+			csid_eof_event(csid, i);
+
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
 

-- 
2.56.0

