Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627829;
	b=AGGyzxDc33u7HQtbJrf7ooSw2eZj7Yh5dMv7WA935fQhgGb9HL+C1z8XdVq2GCBPWtGE
	 jIkFzYySKqPN9wyV+jRjpo8fbXBX0f7E2WgZO+tmS/fo9MQDVX5bmB9pqANOPmSV3nTB7
	 8g+dmkWfZMK7IM6lzeRkilILDg/8fHNNOzBOISaxAer6k3gCrm7H28IYUZVIrZ3/crGnj
	 8lu0cIc1t0VGWWsNEuKOgOCgu488qsn1f3ndOXQBhmoVcr7vIKYFtPA3CBU0IoWMKO9kO
	 qqdcY0fGPfqyHyKF6ve88SGhRnMJiXQs1AK2+uxoOkVUNSh5ks1OKNnHZ82IKKSSe3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ROsfx3+ZDDwx39J51PgNoR22b+GriiIZQEgHzyee4XU=;
	b=JQ6rX1MFEvZYkCSayN+9/Yc4/En6JyHw6feXla59MV715sshFD3bCfCmgJBSN1wlGIeW
	 SNdKJF+OVGnP/ArewzQw3JYepkO5kpk9sDXaek7HmdoSu8ykpPgaLp8sI4tE0i/wRKIzc
	 EyzQxQcoYvt5P4ZHVJpV5bcEIN3m02PTka7qUzCIJ6uJwYFsCJqJloHtyWQRaod8k+NSs
	 9y01tkhc7GfWnMfkw1sIPItBXGAkeGiAccOJYeql11KkiATJ6R1fcdhuRl+w4clucEAHD
	 bQ8xV2+xK45JqcAS0Hboqo+g2qvjFYZ/Gzw+Jew4+e0sSYiDsez60U1QgeV+v7ycoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cGitjCfk;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ED660A5BC7
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20ED660A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cGitjCfk
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so15767315e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627826; x=1794232626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROsfx3+ZDDwx39J51PgNoR22b+GriiIZQEgHzyee4XU=;
        b=cGitjCfkJFxB4xJ0XXrrqj93MHqYut+N8ugiyr5tAkL3g2Zvsk7Y/NpuLMx95JDhZ6
         CwHGEy1WFJxy6rJ8yjws78cRtJEiYtSpkhgHhE4RVa7yahP+4RTVGbQVrVU9zFDtQGBM
         PQkD/yVGEdsqxW4HpQbLx5/9kTTTkPNoe2G+dAlDos3W00WRDEMTjjbaGRcmosOa26Vs
         aYxyc//x+CnkmdVOK7Lt1I6KMRe9m4QkYuR2tXE8Ze+w/AJSPQk7wqVuJuc9Qs7mrWaj
         V/MGaBsxwojS8mjMcg8r8HGyBOgMu0WIjj1ptv4h9b6v3V5b6c7bND9fTUARf5kghH83
         jkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627826; x=1794232626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROsfx3+ZDDwx39J51PgNoR22b+GriiIZQEgHzyee4XU=;
        b=gv+2biyThUiOBt41mVi5XQFv2QwH405j4Fam8hCcvLbIIwUqXc1d2B22UyZPAHh4Uh
         RCT872hwuQHbpf0h3G5k3Bhk4iOx0doG+MvHNi/vLrgkI1U4ch/Ok+Yo+hpVY9iRzHx0
         nWiv2gHcwCrThPrJMIPD7VyfgaUUOahUn1Oz2qGKqAfEn4we7CHH91XkjfGFR0vCs4mp
         ye32DPj5d0y62TxqDmdtnihThnvHFi0QhvZWCwMGVjcwJKPShuYLIpRT9xnrJgl7dWrw
         OrJdhUHrfw4p/ymnaivvvzsaiaUGUMjTyKyE3LlArhFe3bUrAS033GYY2tExQ5ffYHGp
         Bn7A==
X-Forwarded-Encrypted: i=1; AKwUvBylG0Bm0k3UNE1dU5HwmJwuJUXmcnUJ/XhkvbGCoiVzkjnlIGkzq2oV5EGq4nxm0RlElSaa9yqsnw8gmWwJ@vger.kernel.org
X-Gm-Message-State: AFq9FYL63nhqkKof2HRWwEf58uchJYkphO84WWGFSHaRt15SnFn+SM8f
	VGtU545F4B8eAvoac+JPl/kdjwJbHUTfZ+1Y9NkXSBJNEHx4kmBYKC+ezIaxFxhAesM9cClWJRC
	LJ5sO
X-Gm-Gg: AYBFou3nP/3+B5viA4VOHVGu1mBYV3GsazEpOl4r/DVC8Vmho6yBx3+aUOjxOsemTmp
	1B83GoGoAmYTElm5bDhereQCeZsq9lgSmb2g0lhxKSFLVatGm9c1vfALmzxF/JDq0HdQr2sSWZf
	t6ydmCPsLmX7X+c6nf8bJgexvP3URQjME7QXMPBIRPChJym7+C32/lO+/Zy6yObsO7yZm9bCjbm
	pITwAynCe/gYdDeh5RhbOEx14kxvyMFbVk+KnIDwRhphA3p9k/yF/KmRIE7mNQ/HzWWaTswT5T9
	0tXHu5NSxMT1Zm6KT/JSSTw8KxqLEhwd7GpIK4chvdbRoUE9w1vg9diTV8AIUnW41u9vL5prpGJ
	wioQPBHKC1w969hbThQh8DTnW0gnR8E25qcIP0moYIISBwXzCpJ3LLoE8LJ9BL9RpDmFDrOKTFY
	8BJ5W317gbrGXfYlYyuvrRljX0gXUSGjGxYGGW60DN5k1kKQuhkrK11erTJ33cXiE5dGcDLY8qa
	pTue2bGfE+NsdWvdIs90wqbJB0nvnnUafpcsPaTBcE0EX5xZ7hSURt1M9yEx774+HpBrmQN2bkC
	ccfDWvovMV/H6TMNLQ==
X-Received: by 2002:a05:600c:19d2:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4ac1932a12fmr227049755e9.31.1793627826426;
        Mon, 02 Nov 2026 05:57:06 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:06 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:54 +0000
Subject: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
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
Message-Id: <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=bod@kernel.org;
 h=from:subject:message-id; bh=tAChYgZgM3my+l5gwP88HIDeH7bAjggbAE84sPt/iX4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JancMv2K6Uz2df9YGlgm6DWLWHqfCvOo+n//
 FmeU6Pj2IaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpwAKCRAicTuzoY3I
 Oo+/D/4/jw1RoL70Pq/OAeKR1oRhzBDdm4bjc10lWunQIzvYA6XzdKJCUSoWAshkYxgD4GMeQvh
 3xvzOAfwQJbeziWixFPvRbaxGvcoWICUz2o0/SrJ6uu5VDGY4I4XiQgJDAAh37ktVEeKdKwpCH5
 ydqW3vBaJr4Hiw7p0ejmpSP76PQrSDbgoyQJfoIisuXbJJ9SfqJuQfFoc2O3NdGOXj88VJHoAa2
 ihjDVtSOi/TntCxMkSb8jV4qzQulRJANUBMfZBaKbR3hGXhFcOVThfUKdixlPQFwoEIbJEYFhMr
 URblhPDzWYhb1VErPQpuQa0Jf7aT/Fco08VxuyNbhjars/xYnE0m5ZKRFa4u7xIpzBbMJvfW1X7
 L+h7pMpEIdPP4tl7cWnzQaYKAIczyFEjDg3giDO2XAgWVdj+c5PRNeXHN4yeZZw10QAEdkiMcPd
 wuk6SxoK3RwToGHWzKGFotAG37N9GBxpVh+vD2Q5i8MkHCKC2C0JQn6NDLUxXBfC/5izHqtINWS
 33G2qY8NkTV+XNWkW9WAMbcT4hjL0PuTmtynKMAL4s8bpMLa6/aq4yCA2KMwlXGSkcD6JAXBxPd
 j/4wIJYPcC4wdzF6OXmdJ+nqfDOciNpqaPUTIOwnL/ziJG5FpUBkWlb3wd+zUICWYH4aUE0LqSY
 dCMaxAJ3VbK2Ytw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e CRD
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b7821019241d7..7911b30494ac9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4255,6 +4255,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4275,6 +4276,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4295,6 +4297,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4316,6 +4319,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite0" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4338,6 +4342,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite1" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

