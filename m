Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013322;
	b=RyNatNfypLreclRMevFXNu9w2x8QrvHdGBOGJmAnqEynPIAQORtftMyw2AEHew2Oz/Gi
	 O+gbuD5C97iPudTHED1PD/qhSFdwsuSd7UpkYqH7A8e7o/HQJ3i5VTk12srWRvqirKgqK
	 K7EYKeK9aN3ZXRmU6LyCqq3b8vZV0qkINj//SYoBk8d5lycyCm52/St3QX5Zl8FRyS7VN
	 3vv35rwOsr57BY8ezQ181xXU+cuh7tcjbUQFShUyDN4ssJf0sMpQh9yUqRnU/g7nxojWD
	 xMShgf4gRbU81r1/rKIXQe/fyexf77/8XNm4jWTEElHmf8m+RP9nx3pAxqUCaZ1RHPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cwULloUIaYoXz2vD6C9IL15PuOFsPnKMD2iSjIzuNfk=;
	b=HaWyD2F1AAcBtuIG2thH0skoyUPyqfLtuBdTNSuKvVijZJ9qCBdUrgcJ58dMRw8xBNym
	 qfZKSzspFikBJXEw4UyGCjJYklUMdSDfPIjYs7UjMP+Z5oaE+m0hCTolLC1ZmSNyNakX6
	 rUCk9qDyp3Y2xGIuGN3Lwz6ry/Rw1xMzmrIV8wl8GJKpmqxgjSuTkya7gHjR2KXfoqKAF
	 8xpqsnfPGnmgr+HrHJDGvnIhaijE90znA/5rZt0YTYjZdOD3rp/hIXns66d9winfhK4Un
	 np7oomQAvSGKldtnrpL6bBbCpgCnw3yl2AIJPDPFoXoGmP747sa0xu1aU87Qtp7UyKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gZK2BcCc;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C66606A338
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C66606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gZK2BcCc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so9917475e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013321; x=1794618121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwULloUIaYoXz2vD6C9IL15PuOFsPnKMD2iSjIzuNfk=;
        b=gZK2BcCcaQ+9w/+bYNY/xGefbwh+SJhOuLgDgA2JgmHOjhWqqu3UMxf89GQBklRrSd
         fKLpqoW39Avdc3YvwaIUb04ckWA+7q4BzimDFYdu+AUbP6TpJ+qseREnivgjIPS/TLse
         OUkajj2ZM5D7G7QH8mOAwan/7tML9nnmdbZ3yKfiHDBmMPeeYpZZYZI8nst/uNLkqCil
         fzn4+AS1mUwPXruaJ/SGwpcdRpC/xmyTPcJq4spH1BKV9wgmkLES96xR62cHmP3p0DqY
         6B5PnyKMJxlzktYBrCE5EZzmi30GXHlufFGokMITp9xLYMy9rNn2CZgn4wHGvZGpzbWF
         No8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013321; x=1794618121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwULloUIaYoXz2vD6C9IL15PuOFsPnKMD2iSjIzuNfk=;
        b=emChlR02JyylAjCFTH4USKPSzYtshKbMrf6tAzZNP1kkbGMqTc/+huqxM7wAp4xdgD
         w+nq+Tm8fDFxuFepUhMQTZE25OCRNd14tdSt39yI8bNV7SaiA4l2QDatd/q3r4belNFX
         EMFtz4KBzXf9UuFggbLwerLtXEqHX5uH+vxSBUdaD+LN43ddIAM6bs7cRYLe1p7Ez0wE
         roOhiO/30mO1J6vLBnJbmUzY0aee+ymDBPOzegBTBFGrQOk/keoIH1F4ihBNuOBnRVN7
         ObXkEmXviEh8w3ZVNNK0wqa6XGz+WeYe+TRO1L+XNupk8S63ck7F+zp1Ople05ja6i48
         JqAw==
X-Forwarded-Encrypted: i=1; AKwUvBxLQ0iM15P0VwHNyFvgY0V7v6Kt4nlO9BTLl760xEiKUhOMo0B3xeLrcMWlw8b/V/HklJvfibyXJQv6IZHL@vger.kernel.org
X-Gm-Message-State: APuU4Z+8/Cm6x+Y8HvSnkyAm7Am3Upce0F79K7Y5aUvH1+BXaStPYNb/
	b6uiIU1zqcsWM4FZxenRIuJWjFWsVOarPjCLbULn7tC9hj26T53nqAoxjf5F8ZQYQYU=
X-Gm-Gg: AYBFou28qTcAjgHPy1xQYADRjKBvjvW8u3bt/3d4snHM2jy9RjekemTvPYBgJjoGjxY
	USOVQiiclRKnxtax4Bu1mP4k/GIkkYhpvPm62jrdSfhVKc9YA0udn/yIr73/cLfe++xhyN+KdLq
	VYSFC2/Bno1V3FWUGafYxW9r1KxtVPuLuRWa4/mDimAUJmbi6zfHL8UCRUCaA+tr0GzP3Bp2FO5
	E3xyAQuAquK1HeV3KQ21dk8jAU+UlSekWakv/WOYcgP8TCxH/xOFqrDpbAimegmozsobQT29U7a
	hq+J4fXGqbgFI4/iPCMQIdIg1Rpf6OAxtI5bVXqjV3E4XEuYuEob7KaCRoBngDlQZqMdKo8jF88
	U/WbDXeVpbGViNIWRNAivCfzGFIqGd0daXiCZTJ5fBB7lizv+SVG/aPcajCLjTwtqg1Xj2C7YOO
	Zjcg8Y5BqcAUNjUpu0uHI9MYVk6Rf9beVHR2wosKWYmXmyH4QPVJtQoE8LazyQwbxXu2d9B9HfO
	p/7gspaA088UGarRGKzvOMOL8sg6r+scFHOXwliUrLrfv+3C5JYzudxxO3r166eWA3uyB4QDcVc
	E5G+PZKp3POxLPmh8dpfnA==
X-Received: by 2002:a05:600c:6814:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4b6df4f2554mr82962045e9.31.1794013320886;
        Fri, 06 Nov 2026 17:02:00 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:00 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:48 +0000
Subject: [PATCH v3 05/11] media: qcom: camss: csid-680: Enable RDI SOF
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
Message-Id: <20261107-v4l2-frame-sync-v3-5-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922; i=bod@kernel.org;
 h=from:subject:message-id; bh=fCzv68buAwxsczHI96n29xaXwuX+5lf+63yPz+cuhLQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh9zEiRkUUXRCR+iMuw9E1ljDxeTvSSlD3OI
 B1gf0EYW9OJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fQAKCRAicTuzoY3I
 OlriEACiXTL2j1V9wLVWE6FebRVlIUL945TiGxvFSQyCEUXpAcmSSEYZyqczz3LFZsvlH55pJ9G
 kRYoFyjs0i1PWG5yqMYr2vSKg7eg0J9Qe90FjYMXAG/xu9I7XPQUXBbqSz4hXmAqpYTszHFHBPB
 G5CKm4BMYc/EtK6lW+TZ/mbGixVxHQt14aKgz36IjPErjZHfq7E1AttFH3bqiidB4NS8cvuxkg9
 0gOvMQR1D0J51PKCN/XXzDjud/z6xzERSy3lY4eoYxOC2PHZ2piSyzxLtkT3agbNR5+/pNwcG3H
 gr14mA3Mu27CZKzDVjUYQIbQLTAuqIb+MGHLC2MgmRBuTNpIOvjUvWdbooRUv9VJP81BVE3KNPA
 73Ba1qpM7lLvHOGWqBkA3GW/uzCn1vrZkGzOJuRh+7WBPRyAMpiKyGQJpAjJA0fKInDYcBoWQ++
 tNHWxUP7geG9khibKUzR0499UQpRVmDqDCGEJCuhszglsA74D9Ar3Ob6mec8OnfQ1D78XwxVAxo
 JQdOzoOsBAkVokySUMMstb2UvaTHLqi/4/pSZaPorL2uAYPu2kOkk6M1n94uFMd90oMmhCtUdDA
 zJRMwyVkGK+OywgNI09EwW/Hl2AqTlH825wmvoLjULZU7OTIlx97YcvzRoZ229a9Fb8nawihJ8n
 erRM72EIXw2/qiw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Similarly to the sm8650 we can quite easily switch on V4L2_EVENT_FRAME_SYNC
for x1e/x2e which uses csid-680.

Do so now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8fb947..452640e72f6d5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -296,6 +296,20 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val;
+
+	val = readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	if (enable)
+		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF;
+	else
+		val &= ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
@@ -307,6 +321,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
@@ -395,6 +410,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (val)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
+			csid_sof_event(csid, i);
+
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
 

-- 
2.56.0

