Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013323;
	b=4Kmgo3QcAMQ5wNRV+XreQ4Pm0F++4S8qOd+ZwFudJf0GOi+JP7qTfvvhxDCLmKgT8gDi
	 mK7FewkDc9yit+5ru2hjTHEQn5nBU8foaDFDdwOUkRdce8GQ1pOfqDIOZMAi3MH+fXvz8
	 BJjdwqDCb7maHh1pDzg5dzM3Vt+7tuaADJzVvNMNeytWheUbd8aGxcv5gATuPuMpViyYx
	 RhDbP8O0Q9Qws/BoCZUDWfF9ZIK/ARIzh1X50n8zNj24fhs5B9RUuDLWbXKP8bysKs63w
	 v2Sf44jf5zTVzo7hzK8nFB+SyxteKwtNJU8JSggI2hmoG03pnIpUwg7Exu0rioxeb+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4Xtby2iwtdM7w8huluO87CMAeIwNmFMuDoqn42+0sbY=;
	b=S9mozzVFrGC/fmyLCIiQtFFdpVqc4EL/L473AT76pdwk/+PVIT5VwtOJzHYsIPVlLLNX
	 cfl1FsqYVLgQgUOyBekn3644TTjvjnVDzeH+AclAQ7wBQ7L5I8vZLuc31K61XnwsWGeLv
	 vutiPoP3xFuiNrAIaB6EkLgEkf44O6r4F8Pt9i/IFs2ilpJEsXtFkm89ITsAzEv5J0x4b
	 4nAYWYKNyAZo948wveLlwBmCIAe4t7SmTJhoTEL0dhU8JdClYuOCXsf+vl5cQdWV9GR85
	 go6dpoGDn2CxYRtU0a/AtrG5G2zfGGcctslvVW55zjxJ+pV6Fd2/cgp4LmIimrBxz6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=woUi0yP+;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79471606EE91
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79471606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=woUi0yP+
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so10030385e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013322; x=1794618122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Xtby2iwtdM7w8huluO87CMAeIwNmFMuDoqn42+0sbY=;
        b=woUi0yP+YhA+krjTqBw2atOkgEf9nWG3Y98Yrt/2ObjS+4xl6Z7EBziXR98fvfDRdE
         y+aQMXYyKDZD2bDG1T4g0k+3VOFlBaPSaPOSXwnMgXvXpGo0cnJzoOBVEvqhsvWEtF1n
         P6BE7DM60WmhZt6GvgI0HoDgyzWWp3yeMTVbVRvgrYccC1VKs9588S6O0OMCzeiADCb1
         BBcxXPtJrk99g5Ct/lNNIshY8xYX/2TLhMOvC5IFmD1Sq3HTT8h1+0GhoGHJYr2FOsyL
         dazxRd93pgSCvlKLwiO+YzUJmK4Si16h8dNBlvwEjyfDZeoLSnfajMu/scFyXMs1rS1l
         Ekiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013322; x=1794618122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Xtby2iwtdM7w8huluO87CMAeIwNmFMuDoqn42+0sbY=;
        b=m2n53O5xtpfWmYs6V41kBxa00BV6RKFY1anIydfAesMRpKr8AH7ornVjs5hvAPDjvt
         XHEld0Gp6SzdR3/hZ8NzsANRJBRTy9/h0ZJz/J0/43zIs5nRFJtILoa9VHpXOsctATvE
         yqOpoaYW7jqub4IqejlBQKU/F0pO5tH2C23a0B0XOk96l6jLT+CJkkK5IzGpHaE9wHMS
         7qy0txy67KxOT10zfaBtiVryCDJrKeg+tPRlLObCc94oM165X83B+iwa2/zHwUteP1lB
         3EQsLk6ZxKZz7h3ThQqW8bX6O13MZp5600PP6RrN90AwBVHUA1aMOxpD+t54Z/PIQ2pX
         mktA==
X-Forwarded-Encrypted: i=1; AKwUvByymQWL2LgqmdR0fXrO61w/HsqXrw39h9LwuX57dUKCbDnq1giTX6SfW3fZUCEaCHDfM3H8PnkfEfKkuLk/@vger.kernel.org
X-Gm-Message-State: APuU4Z+Fjg6Wlxv4HsT758KXVCWJfNKprhJEaQaFxyx2HynFMr9v4/yp
	LFt0acAsv74e0fztavjCATJB/0bPlQFdsxSUAeZEbxQoc9uGj3jRFP/dpJF8sTaD7Kc=
X-Gm-Gg: AYBFou3o4NGuwsyAly1D7afc1Qc3oAnygUVF7DyZTEYYk7jI6laM8Gl3aO3rVgfCvfx
	ZLOGbRWX62pBxZVGVlE78ihwemTw4R+GHqKjdKDGLreslnxnfl6VJ/RKOiJkf9IZFRKQCal4z+v
	AkAoazlhDgCxGMzdz+19RxuBIFD3tkBphg8IV/jC2Z4gChhextS/S9a6bWoe1LKW2fm1arWvpaz
	Nwiww74hPdTWjbu4xJnijZX1xDo3pbZTFMgXoJT5LSv24b5FCVvy4Pn6adzgjx/L4ftHx7IE+5m
	EKT6/f5fuVglDNcZ5M2qkgnwGlqb9v5CW3AHZU9kFNGh1rWq1OOdl24ZqBrD/erQ9Iz2voX9yVO
	xQJwds5BFKw76q6ohfV+dDqKzArL8dBRl1pWcuVBD2ziT6g/x+SIXOSkG9ApBXYXwLChH10ujGJ
	YlSr7VSWU3fGQltuVNnz81kGLPs7TCaouL2XVwuL8Xy5jEpDHBUgJHjrLuIbbysIecOMX04w0GB
	0fnzJHDJflK+Jz3PXRAMqwkwpCycmtolWp+pLMDlBzaeDFa8wBMHv9hYJmuknEJBZCt3nH+rRAM
	UfVlBI7N8UV6LNfqcvlO+g==
X-Received: by 2002:a05:600c:a104:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4b769423bc1mr40187265e9.26.1794013321862;
        Fri, 06 Nov 2026 17:02:01 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:01 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:49 +0000
Subject: [PATCH v3 06/11] media: qcom: camss: csid-gen2: Enable RDI SOF
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
Message-Id: <20261107-v4l2-frame-sync-v3-6-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2397; i=bod@kernel.org;
 h=from:subject:message-id; bh=zXHpn97qDAAuDWkXYIdAKJudy7uZdWNvtHMg7SVpKBw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh+Gp+vh9EWng+buQdn9NyX2osN5RB43FptE
 s8x6xyve66JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fgAKCRAicTuzoY3I
 Osm3D/sFXj8UIGTzDkTA/uhNIGoBSS30rpxWP6NDKp876nleKk2SPja1SLI1l0bw5yb0+kCDFMn
 4FFt+BT7GZ5GOYxTCscLBaiix/b2hUsfJUABms5yX9svEG4pGFl7uyS5TedtbkWhE+4qijut8+j
 cz69hPrEwLuexzax5gadT+khXWokt3yZBd+w5jOtBPLpUTdXhBPDCF/nYDln+ua+0WdvMggdzCZ
 h5I+2nCoVg/aUcTzTwhjxaTRZd4+wHZn3xC8c8IP1farTVHegcjOsB9wJyTnBcXP4EY8apuBDqQ
 webYWONamWqr7mvuqYemhjQZS1X/fM97YuisTMjZugsaVUfKWxKRLPusK8WyRd+oiwtNQjV+9rD
 bp6pDD9Ifai4KDz79SwyOh84qfulL+fC5a0Caq2h2updKcNllS+gDaRPU8tMPE9qCFOFGIxazBT
 KJS6krcPBRorY3xS4K7JOknCQApHjUkooM2iN9lmdRWDnPDU7NscS1a9jaA02tYL1Lch89NjF/C
 NUoSTqy0qRVRUIhnVUVq93mF2XX35NYvdsOkIXT7IHQuC4RMHwgY+IkuMbRtCl1tX88OGkoHbOz
 iUlCv0xiURMwD6z7LUnaa88QEG5jpuNijomApkwIdRX7fZOGTw2AuVKQzFuRityhUivv6B5BgdK
 3WRk4iplzEQGhOQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add silicon specific changes to get SOF triggering V4L2_EVENT_FRAME_SYNC
'gen2' CSID. Covers SDM845, SDM670, SM6150, SM6350, SC7280, SC8280XP,
SM8250.

Tested thoroughly on sm8250 only for now. An additional patch is required
in camss.c to enable this functionality on a per-SoC basis.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8250
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f7e3aaa..a351ac4b91728 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -38,6 +38,8 @@
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)		((csid_is_lite(csid) ? 0x3C : 0x4C) \
 						 + 0x10 * (rdi))
 
+#define		RDIN_IRQ_INFO_INPUT_SOF		BIT(12)
+
 #define CSID_TOP_IRQ_STATUS	0x70
 #define		TOP_IRQ_STATUS_RESET_DONE 0
 #define CSID_TOP_IRQ_MASK	0x74
@@ -322,6 +324,16 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = RDIN_IRQ_INFO_INPUT_SOF;
+
+	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
@@ -335,6 +347,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
@@ -373,6 +386,8 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (csid->phy.en_vc & BIT(i)) {
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+			if (val & RDIN_IRQ_INFO_INPUT_SOF)
+				csid_sof_event(csid, i);
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;

-- 
2.56.0

