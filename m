Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013321;
	b=m45fmDdUWA2I/OqECY0Lkni7LFtRTaDPU+mADdj7Nv1Xp4LlulZMXviCZQx+A/bOKjbp
	 PQPPSM4/UsnAvYfBuf2wFkXlOqW/AOIiCTtS91Nc2qndRH6669ADPR8t11GVgAQeNj+xp
	 RmskHI4ueaDCOMPo3w8DZ5++8Db2X2dq/A89PO0PxYABzPkOlkVj/Nmv2jI8X0bLf0Gxj
	 4NGgYY41xeSltfSczLDPfxzG1uCEeig+aXaK43NfMeXwuv6wEBUw50nbpxP2Rah6RuUIi
	 D/cn9lXOQllWOVXaaviZefWeSzvqKSvMlzBqrcsCb3AyM3yBwiTv0O9A7sVsROyeZnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=h5cClEZ8YHxPTxgdJHm5HGcyNkbNZ/BnVXKmclhqFhM=;
	b=pAGb3Z8GAqfO/04XL6+H2jmkUQgk7X+CKpNJyHG6Cbt3gNxKH+rlL6tjt6rCEcRFGtOd
	 5kVHwg4E0Jb6vopnHlFsxSwLnHqv72kJ7Bc/6/E8kYlRblCW7AGAU5N0G48i1oZhYiYrL
	 5vRo3zpTpuuaoPGTItRUuP6Tg/FpDtZi+diVu8DEJ5NygWAfUzhgVOumwF/MgcVc4tQAV
	 Y1v1RVXrGJz9y4PtEeOiNjVuB5ywNiI/4soH3TupCEGW1rT72p4fpkM1VblotkWK8lEeD
	 Ldgx8fNt8t2fn5YPt7zs+N01anEdHTmNYMgRqY70l6z2jFyHhzhign8RFu91MjRmccw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qMqWAoz8;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C3606D82C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862C3606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qMqWAoz8
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so10030245e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013320; x=1794618120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5cClEZ8YHxPTxgdJHm5HGcyNkbNZ/BnVXKmclhqFhM=;
        b=qMqWAoz8qjktZHehFwf+GXFohjzE+4FVAvpB/9nPmfFGZbmN9yVUpBRUDBQRvqNPAk
         zjdniukz6G5l6DkgTHvkm3grPIPY5Hd1w55T9k7HA+k9nPSDbtqNOk1Cw/4UqueUR/ku
         PF/9GC7PhEYVlRX5Q0h8OkxcX1DmtYEtwLFnlyF38KkCEW3tWLByC/1nVbgNLOmHDmON
         ncg9thMI7KGBPEhx85v6GI3e460vyrEWjO4o8+cUcLbkbFPXxKYnwRwA94O04KTy9NNC
         bcOqjnJOj+Sr3u/gjZCKXdNjVFJgW4GZfcAacS8b6lvCPtPwkaEHNNAGLyxMN9otbuBO
         nORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013320; x=1794618120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5cClEZ8YHxPTxgdJHm5HGcyNkbNZ/BnVXKmclhqFhM=;
        b=mCljVwEnLIInvgutlWKbhITJUFi3ASbXUT0MXVOE2WCyWWvuhAlC6dVMsYTMby+6xT
         1O5K5mh8QF137lttWzzObAybI1SZM8o3wHH4SiDw1HPKiX4CBPB2Y51+LBk4C5z/VsAr
         Ea5otHmdBC8iM7oqe6XKqoMSrtuttIZKFsxnKZI19ESpoyK8Y89vMzt+r2/to72Rg9qg
         F4OHHEzVbh401PEwa4PjoZw7+Q1xmY5kvteGzyNy33lVheOvnBb25l/FIdSZj+zLbpEe
         sNCzgJh0OaWs4UDYY2c9hKpPJmA0LRmGKgoptIMXrkDjCK5VEwFzTX8r6l9qAR5j27kz
         5/3g==
X-Forwarded-Encrypted: i=1; AKwUvByIZApmwHGJ4eoqK63D2hc/QGbfp4KKcgKRAdJRbJDesfv2oh3PG+U4eEbvX9T51ZG5ppMRlCY2YNS/iBVQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9ymw+gQMfaM9OIz0Tup5Hs6u11T/209wxBAQr8hMG36NHphgAp
	T2aYxhnXKpJ7GhF2aJrjQ78leKniSeHELa4WlTPFWYRWHS/j8xgt+4R3bOC0xcF4OCMoReYZq1K
	FsPGm
X-Gm-Gg: AYBFou04D8yi7u+1bR+LgCx7EH2243cSgjJiz4tzQikJZFLoENT6BH2DD6Sl8cYzHI1
	KWgV6RgfjRk916r0Cun2g4lrjj6YTDIBV3ZxO3SNBOVweN1P41J9RmchwIjgzqSyJrAfsuHT8fY
	IeDU600gLLsykXeEd2Ts2ZLVWcyRQJ2+8yp5JxO145d4fKO/8+SJWmZrHiF5wmSQUtN5FxmyaAx
	QGTEd+0GgDLXCOwgXStNZWgDTwdcTPisvXtCa5Kqc/DHsjRpoaRCaxZs+8Uod2wG4/O7hIb+xq3
	lKeJ50gBHnQeZrFWkgIzgrWDib8u5zHiBQUqH3MOYTUk121p/RMUHF4A5RxkJs9LF/6aUXAWOYW
	LNIpWjdZt9ZseHEpW0/tlHELkPuX6attrPobYRyJv86Ml6WArKYaxnExkOfoXxdwj1M39BPaViE
	wbvowpmDf6SKwWway5Li/PMqG6L5E+nPZrf2IvMxoG+vXdgtU41cLmFIcFBotHsLS5c3kjCBmyR
	oTxbTnY8c1OoqUY5yCoQvZ4ZAEDP3eIJOWAUnKYngTPNQ5Xx0BV12ccORwXyX0+1Uug/3+atJy4
	AlX89nl8+LbQVqJ+te5xSA==
X-Received: by 2002:a05:600c:6206:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4b6dfab3fa9mr65842215e9.20.1794013319963;
        Fri, 06 Nov 2026 17:01:59 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:01:59 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:47 +0000
Subject: [PATCH v3 04/11] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
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
Message-Id: <20261107-v4l2-frame-sync-v3-4-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2702; i=bod@kernel.org;
 h=from:subject:message-id; bh=WmiBVZpxVNzE2zPZyHjmv3Y9VnCeYFeJ32iBUCdu9Oo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh9/QdpXNE5QhJ6y4CFacliB59UV5IYRzHn8
 pK6MhLJ4haJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fQAKCRAicTuzoY3I
 OtyKD/9ZV3Hf/ph7UV6M+liMAapx53DP62u6aXAcJxJMSjI2BK6QaEG7JNrWURz9tolCNQgYpZc
 b5ngEEntENBTZOfgFY0rU8ZT7dfK/SoZzPT1AUD1f0jg1Jl8YBii7vUhGpdPMtAwktgSc30EGT4
 ELCr8F/1Qo9brvy4vfMBniGmH9nQUVBrVr/L0Ywg8SAG2f8kvdJdzEJBrDl41D92tK+rJ/72Asn
 L1z7on2u3V5KlToMEHe0MP3M6i5oAN1JN0PiYXsvo0JJ3lpXssXXdJJvO5ZqsZ+uJE//mqnZmHi
 /mn8BzvkKUkwizTyHlKB29UrUQZbo5XeXzGtnTS58aoUHiztwDDfTuBJHCp5n3e/YrmqPuYzUyb
 l9wWfkIbTsGVzg0SGREQknXtqApzx1OhQNo40w0NxJ6F32jaxIhOpEctc25JuzRzergs5ayEJ2S
 WiEOnHpkVMsr+/M1h24wZ0gGv7dHWttSaLud4XSo7Ju/iNdYctwgXCMyrwbIaVDko5XloGZ95D0
 D1zy9F7ruwEC51rDj8voCQAvQP1029ivjl/BCcfkhU/3mP+emSivlfak9ACZfA8d9T5yIz9+sL/
 D9rN4nkWxLYENhVsOYS7W1LZ6S70iWSKYc1bZr2b8tHoKimn7tNVvjIZ1gjO58Ucj6o4GNy8EhW
 zt9LgmZYq5Gxyyg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in silicon enabling code to generate SOF and trigger the routine which
produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27db..6a538d825f78b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -34,6 +34,7 @@
 #define		CSID_RUP_AUP_RDI(rdi)		((BIT(4) | BIT(20)) << (rdi))
 
 #define CSID_TOP_IRQ_STATUS		0x7C
+#define		TOP_IRQ_RDI(rdi)		BIT(8 + (rdi))
 #define		 TOP_IRQ_STATUS_RESET_DONE	BIT(0)
 
 #define CSID_TOP_IRQ_MASK		0x80
@@ -58,6 +59,9 @@
 #define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0xEC + 0x10 * (rdi))
 #define		RUP_DONE_IRQ_STATUS		BIT(23)
 
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0xF0 + 0x10 * (rdi))
+#define		INFO_INPUT_SOF_IRQ		BIT(12)
+
 #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
 
@@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = INFO_INPUT_SOF_IRQ;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	val = readl(csid->base + CSID_TOP_IRQ_MASK);
+
+	if (enable)
+		val |= TOP_IRQ_RDI(rdi);
+	else
+		val &= ~TOP_IRQ_RDI(rdi);
+
+	writel(val, csid->base + CSID_TOP_IRQ_MASK);
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	u8 i;
@@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
@@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+			if (val & INFO_INPUT_SOF_IRQ)
+				csid_sof_event(csid, i);
+
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
 				csid_subdev_reg_update(csid, i, true);

-- 
2.56.0

