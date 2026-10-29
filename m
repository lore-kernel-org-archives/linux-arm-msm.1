Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267742;
	b=F8Q2bGWKmkIavJhcbZub4ZpybZjuBb2nL/rufBx5ZVmKlCWQsPkpwOQu5bczmwSkRb2/
	 Wtssa77u8XaURu8H9SI7PCLpIAb8jlRtWVsLj87is61RPUpddXhetkP+GDYOmObp7AhCx
	 wFL7rExuBfWDZgFSIgnlvaE50Co4+7NizrRJ+qFkjvqad95JlGgXGlxb6SCGwDNEj3M4m
	 AauNg+70FlawrKUBqxVHyixWo7ptfdbmLVo72n2OvtmxYFt1y1xJU/gvYbG3IideDQ0/W
	 RXLAgwErVCsick3lerFsaICS2G1fim/lGtsRnoEJQsVUHxkOZuhyR7h4s0Y1XNKrBKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ksP9i61srkHlhtbK1i5oAkg99zATJN9LSQpqwUBBB14=;
	b=QKkVz1cmUN66ZfRr3fU2E22m7WgdY8b5Zd/ex55SNjiq0m3A1TieuhVbBdssfvCiwebs
	 OyDd2ry2E6FxKEIIRgY1qzOXfQ8Xoe6Ub/qzxmTfrjc7jQFA9Ae4te+0aYp6ScDqinh0F
	 WLT1Htt7eXRhrDzCQzqofIo0SoaDZ0Gft/nG4OTNfqd5FXha09Garvv/tYccAZYiDpB+A
	 drTSQS2tmfYKnJaAfyircHk4tziZ0O4Y2CQw9Y1UuqiOuqy5v+bA+yTM7nBOQqV5WjHG6
	 QWLh9EWDNpKKmdBdPkXS5d6c5Gf3MiQ5NwX4aHGn5kAwszAtauD4Pf2sjMr/ao0GLNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sgXPQtal;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDC9606A56A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CDC9606A56A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sgXPQtal
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so19687755e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267740; x=1793872540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksP9i61srkHlhtbK1i5oAkg99zATJN9LSQpqwUBBB14=;
        b=sgXPQtalo9JKkdZBcarhM15td/OpKRsG229H+tTmhXVQU27gu3mRRDFp/FbVe5HD2p
         eOGFuXxzxpBz8f6FAo54Zr2Pdlr6X/8PHd49X/DnVH4tbbOhrMA3tPGghkR5O+sHvti3
         3//DUejyNKsjHe2eTZa5dqQOgW4OBJgEauRFIo/2TVQgzZ+O1y6ZULCCzMqZf+JZZund
         cUf69HP7jBiJKtYfGP+hB0tjWrQAsF0/1P2+evCzquylAJqmnamxD8/JU/gnJ+FwPUgH
         lyXVxM6Vc56qvO27cBgTN8ASIZaV0e4J+O1hlq/Xd7cTnOnaAdaF4wBQYw1N/zpqmtze
         bN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267740; x=1793872540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksP9i61srkHlhtbK1i5oAkg99zATJN9LSQpqwUBBB14=;
        b=apsEqsM18FAYSQhv4/p9bmgqmlBEuhWa0ZgtBj6aQ3LmaFRhCCYXXEkRXzN0c/mnz9
         Eji8vXLlLe965a7knUu75vgPzVGx7xPg4RaM2+jnwa2hzZJirr6TjH5wo9gJWALS8U5y
         usBZ6HhSTM7xBqTvkC9FSSt91nio8fLSr8zRP5/ylKT9KSOAY4PvHM4ngTsjjBHRq0oX
         QMttmtJC8W97/+x2ajFaSjFWjKZ0c5x9v7+gA2SBhpxDrc89isuetsL2KMyheDrMh0g4
         0MKIG8/Ko2mvzMDBisc1CICXHHNMe0RTcjFCldv2IbPijouj8pXW2WZSP3b6V97DObJd
         bB7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxM6ANExALrPX3ZEGNdFp2RsmaGJWbyEizDkFv2x9lDVOI5M4DiHjbrN0IGlDBXtpJXMuD4gTx3Jscm39Pc@vger.kernel.org
X-Gm-Message-State: AFq9FYJL5OxgXaxuitiXOeGwmRDFpg64NQve4CR0OA4jJWhIb5E/YgkR
	1oZc13RCMGJ9FGxeZ5bMru61AweVGWoPLjdMGIOYfCHEFM2QAUXZ9eina1FLhLoovCA=
X-Gm-Gg: AYBFou3A12c9TYsK4Vqam68fXBYyM4PZtfQCNkoXi+UsO7rhbweuJGUaPh9gSyKwSZt
	eGx6+J7Tepriubf3Ziku/2W2hVMJsQQTjcCeZbBuJruc7dmbaBKP/QRAb2Nbt/KwvkNa7Z2WdHE
	rxZzXRnMx/fS6sF9RylnVp9TcLaZ+jwkxbNagWWsNjWZ4CDKrX4syR9JHVTMbYZdkA9/xWK1Frr
	vlspzyHuAbKzTidUc5CKirtoumLYPW2FPGi/ZKa09YexACwKMREgfbrbYaFj6c2rA2EqrQdkjWE
	Qyi+hFiJF6zirrJjCxdGYl8csLx0L4VcvEd4ZPtziNva4yOiy96E4on5CHeoj/MOtAj5x5XzV5S
	ZIJQWNJPFPI/1ie1agHhYCiiRVEzK3teRUJyv+Wl3jAh53Dy5TN6exMQ6bZxrIJ5myt0dmvDKZU
	cM/jia6nGZYxVM/K63E+Vj8iF0yoJODb98jdxF366NWCcq+k197c5MeafONrFkwrH/XS2i/v5Xt
	pSMti/lEvkQ347XJsMj7QCM04mVsT/yF+9HVtxb0uC6W0RPUbzxnPUW29mwAqldkO90whtt7nJQ
	LShrMutJGh2U02Bd4ocjsq5pc5BG1iMWejVTgnhJ
X-Received: by 2002:a05:600c:b99:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4a966c41a43mr108339155e9.17.1793267740589;
        Thu, 29 Oct 2026 02:55:40 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:40 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:23 +0000
Subject: [PATCH 14/14] media: qcom: camss: Switch on frame_sync_en for
 sdm845
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
Message-Id: <20261029-v4l2-frame-sync-v1-14-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=bod@kernel.org;
 h=from:subject:message-id; bh=rn7FeESqvi7fxDDcMAXb76UUN7ncMp5AipCFIA8OzZA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgOsU7P33pfDuiglt/mOZbjSaxKzTw0yyMIN
 3yzylVbQ4KJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDgAKCRAicTuzoY3I
 Op7+D/9G5VlAqgH5yWbH10CQ0UsZrG2n74y7nJO0H+CO/pUhxXEn4nQaPEhkp9wOk7In0PfBcpC
 J9ZGvXi96jWE334KQOjsJXn4qLLcYqTpmD+psXAOkJIfxRGQGJ6XmMK5IIainddY94nPyLP0CwG
 78byyJ9ckTLa+LOnw5a372FqoM5i7J1Ex+MUf7K24U6mL1NQtOwHayACpYkog2lOjVMnljAqP+S
 i2JfDZZ7CxG58UKpbiR04YZrEoWxahAAAfKk36+0V5AeYemfeTV0TQ5HNdyNvbv0OqFrWRH5cj4
 I4qS8+kX04t6bjAZGl4StmnHbCZLJyflxAxcFX9MWX2n+5r44yeYrCdvL9ksNBQ9iX9LI/PK1Vl
 +yNDTPvQqvuV6tu9FNXoAy1uVMqzE+uLIv2UW5pPM7jLQF2v/l5MCXj8zOGI2iFcgxVDHi7qr/E
 cn8S+AJN1fL+gR2VrAi/rqAFvtjbdGVbzlYeyxrmb2Xw42vZCULv9jjB2FXCs2fQvFRIxrOV+b3
 SD/I4eJ4mksd9hY2pStzFugVoXMOZX2v7UVRrg9hUoYEhYKQDmtVlFanT0dOoBhBYW/g++7LFjl
 uGTvdWK6dqwbKuHV+ek+egmT/PzR878UBOtkUOubU7qZRlLaf4dQBr+25f2FfbLP+T/dtjTUNOl
 sgPpnxZE7AQ8/Sw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 23f0b63580bae..1e470d7583743 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1361,6 +1361,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = 1,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1389,6 +1390,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = 1,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1418,6 +1420,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = 1,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

