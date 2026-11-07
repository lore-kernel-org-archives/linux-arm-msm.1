Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013326;
	b=kEs/kMcuchGoKjjK9CeA5gBPC1+Gu4lQqOWRtvVqjaU/QcsVxcn9nQHJ+nIR0SbwQil4
	 m9B9HJ0vC6wMpPs2pqcE28+SQ7dW1/ZmTIY5X8rKM6tW+pk/xiTiXo2+SLolLdIw1d9T9
	 x+l0H2IrFlZ8f2llp+PeHJSD8e7iHNW69k62OlU4PIuRAOfSvFpMmiOuF3NouTDooobTm
	 fhAJ2vT0ofsXTAzMK0QgFp9w5XoeHsVpjeqbKUGr3TwmoYhaDKodj9UD9bWf5CTUrqZeS
	 UHaDjKJfnx0l9mCbI42VEV5T3gmYmsKJNhAiTeHJtWJaai5/XCqE0esMZ7kh5RDsRwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WVOppmOPF0oNPzwcOcitqSAGp8bpqXEMygjr0XfAqEE=;
	b=OSKaDC6uJhaglt++UnsS2gN57f+gBuH/Mw+SrMMvvFTvbiHHM4PM+sjKYQ11iwN58Gty
	 Fsav+ekkq2GOgO1SB69KvCSaXdUJHjMhcglWrELBZnm1Q07c/ij34FrXH37+Dj9jatRKS
	 ItKBU7VDwLWzQ/zw4+Sh3mKoiwyUQuY0NLWXWOIIIu5FgxzbWrUOE9uLcFHel0zUE+omm
	 fLG3bMUotBJw5jmOc8xB0qt9ChZx6SjHgfhSKylTpoli+hH6IBW4hlun3QNuepODi3TBm
	 dIT+uXcR8BaK2JQTzHhdEKiyDzTWhlJJvUCr5Hsma7tMEOhZ/VvtOQ0QnXLO+vlIFjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HUJAVbfA;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED86082BC5
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50ED86082BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HUJAVbfA
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so10030575e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013325; x=1794618125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVOppmOPF0oNPzwcOcitqSAGp8bpqXEMygjr0XfAqEE=;
        b=HUJAVbfAXgHnnfOkKEqfhXt7eOqE/3lxwihUWmgBgG+QO2xO3Fb3L00X3zIy6iGr+P
         fBCcYkwhfRxizQUPDVM+v1TTjarkWPtRoA/uHniB3oRuhcJ9Z2G+TpoZGSh2DdWscIqI
         O1Kwa9W32sC/mcHITA3jTUcie3AShYLY3WraKRGogb3b4TCpUcC0tgr2wGn9WgoRifDH
         gKPJ1hTfx5JNYDX+deZEp98DZCbWHVoEbV7/AH5pVGydvQmMpp4Jcp5F47TVhNuIvxtX
         SuwCc4RML2+idWggnNsHCt30mCgj9p9Pq5gHb7+ycKJGAVxsYcJsrny5qNbM2wDa1Ajk
         IJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013325; x=1794618125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVOppmOPF0oNPzwcOcitqSAGp8bpqXEMygjr0XfAqEE=;
        b=gRWcc9xvTnOeD6iWLWfBrLMKqhFrg5X+QDjzzuwZAhKTc0REHnFgg8IsmEhjoGJJCj
         r/q6+EGfyAy+PDoMMt1fpaYHtThHDp9K/nFB30xD5PcebzzQpTn+VT6lqrNjDfy4SbFt
         uQYJp7YC/n3hJwlOfN2YtPwxdfWkLZtqgLaMTokGDguZ8kmHtyB/2/5i/5ZsSnn6SI60
         v9U4v/Uzg3l1rnuTOAZ0xztTTKzgzvQFYISHytB2ML32YzyC2u16sIPsOyvhRkOVGEy1
         vx1HK1PHoXC/SJnMqbPBJX6p9yUgK21xuBr1Kg6GNIg4tM9PqGOePF/+QywVEeMLRny4
         04sA==
X-Forwarded-Encrypted: i=1; AKwUvBzG8h1JSScAy7V9F8KEYQkpDBanXmcbya/xKXDZR4T7i6K7dDF5nKTpL3Kcc+wa+NfLvfgrMNAQt+boIrcD@vger.kernel.org
X-Gm-Message-State: APuU4Z+kf4pqEMovIVuuE8tM0RZ3qECKUnMyVSuUDHlPmfDG/UZ08QSt
	Pk7+Ik7VvKdDn19KtFzPfDugIFyIKSrK/1L2bweSt21tH67B8s60SFUcoG3S8/cxP4s=
X-Gm-Gg: AYBFou3Fmt2qHOxF3uxtZoM6O7sOMdOrpMY6M9wn6QC1TVq/QY4IT5ZZk7ffbxfWWJQ
	9J9Izn/uly5Z6lmzB1fltm9ujpYCWs2M2QyiaEQvnnfVBluyYPaOHEWO5mDIROjHK+AY6LI4czN
	ZndtKpC8QzlD+zIQgx0iwQV1ETXKJWhr3J9ZGnkpnF2vjSLDFRvb0mTS45UB6PAaqywZzclVf1B
	zNa/TOEgBNvnfG5BW4I8s/j6KHCg7DMFMpUKCqhJgo9+Te++jqV2yAUiadVfckz11WJI8+SSbgY
	OzNwJCmB99hvMhPyLZHT42rGXK7kO6voIsExVA9Lm+M2GhbwdLO8lmvH+2/+feAxChpBLNXbPCw
	tRo/wFIEDPZCxfgQjWJoB8KmJlPErFfFVBJfwludzTpvWbXfQdAiXEVdg+frfFy/YFqC/Ju/yVM
	uuJwIIk/XMfT5pWOVF/N+cd0DE5RS32uVWyR69LzhLxRuxkAz3F5YtogC8IX479t3pOVMEXSi9X
	YHLXQ0Gr2WpNnZCrW4CDw5P/O+i8bjWasQBosZn/oZfda2dlhNNbnJT717dx+lJ2MDNrHMx8UbL
	Vd2UN7eGm8HpHVYR6+hNfw==
X-Received: by 2002:a05:600c:4f0f:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4b6df5ea98dmr73002115e9.16.1794013324705;
        Fri, 06 Nov 2026 17:02:04 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:04 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:52 +0000
Subject: [PATCH v3 09/11] media: qcom: camss: Switch on frame_sync_en for
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
Message-Id: <20261107-v4l2-frame-sync-v3-9-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2079; i=bod@kernel.org;
 h=from:subject:message-id; bh=DXNUQKSL1UUmzc8AGuykclATY5iBLPt7wD2yXM5hnAA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh/S6VmlcFdfBkMCXtHjo8D/B2ArAk4K59QI
 gk6UhV8bjSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fwAKCRAicTuzoY3I
 OugeD/9kSVCLRPiCuIo3sJuPXfxeAcvqE3cKWqAtbtXSS//SuZxbzlayEcM8SyieSQQuy0s0LhX
 QeiczEXKS2yYZ0aHWWrI2YUUU5Y8YWnO8hj1ySrt3rPVuMEWfPZLciXJlaGSugbvBpizLjBpzI2
 WTwoQc0oP4xqjN1/9PF1L+0yjd70ZU5+uMxGSOq3RNlunM4OBWZsMJYdShPYAEVIYJykvyQpTXK
 LpXUV1okjlx/hYeLvV5Jh5TygtS0hxfqaeTfr3ugGiWJ3+FsSBD/XAdJrh4ljg5OhGgErigTQBQ
 LZypl/zdYwJavXdaE6M1btwe4qb2YFY/za8jsL3R7Gqg9EmDMvo+DaBnSLr4n6oC93gCerOqx4F
 R41eYxhqhD0uSNmsv9SUp62BVUrXlk6m5hxq0GxtSBW/0zTDkyS5QyV37VxoWcFKXt7xL3sYXlN
 rA6wWWb/n0PGh/5j1YhLPiKWSaDn5nWswURE09oxWDkY5/dznljUomrjjK+Tocjj8zP6KcecRjN
 9OOrmM2U/eJx1xyfBgjZlHW1hDqrYLyDYS9Al+rb2e73p1yPejvsSTgDctRe0KwSINZ3h+1WizM
 MMXkXQvTnsiZ29xKkg7ExaJEph8gZilOPe6Rmmh+NbwXm0neu0TRAoFM/45S4axaeEZAF6c5DdY
 bAmUweoGQRMjvOg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e CRD
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
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

