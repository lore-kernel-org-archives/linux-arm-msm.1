Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313457;
	b=Q2Bn0E3/K/s+jL93d48u5H5wYPM04D0+x4Luv20pLhcc4te8xoSVvtSSMUAmgOuvU0Bx
	 a/XA6jppD2g287vez1DxWjz3kJWyhfGyVLWfnzvorsebR0EPLDS0K7rTyFmQow2JfCleM
	 TZpqoqW9zO+ZCeooPZPauXTjbwSOO8sL1LAo6WjTV+vNRWD7tckoHVMu9whPuxIxhMsc4
	 WQahRb9Zo8ZUBu89rTNuNaYesmaccdoRwIiJzQnSsCPnpSwLnWFmIOjHTwIPHFGqVbbYl
	 s7W2Np3UUMSwSUW9CwqwfSOw1S2u2DZxkm007+hyJoqJh5Zl5V+MMxo+AvDIy6NCT6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lKpylqXu9Uw52OCo1aOFe+RE5mVfsZxA83eEzOJV0H4=;
	b=NCkVP1c9U10gD0DCuVhtI25X22dOzCzqeUUhce4ezNe2H1QaWydWy7MYYVNuvj1PkW9a
	 oYMntONMcBvj2u3IjXbk/lL8e3x1fUPl9nhOw1MmWfD0ypaW/tc/h9cqlHIUW7ugkCDHq
	 r6oGkF8X9PW+UdfOSzA3bYcGIs98Vi6KJujKVE8qcRowFoOjyg3RjaDLBsLjfRiw4gMeP
	 ZhEeYN0Al4YM8LWiJdiqXyfTxWy/djsT7TKIjl+RW7385+OQC/yB+6adsX+HjSFna9l/e
	 N7yFTNb7ksaWi1noPK0qoOwqbof0kr0NwWh3JWmXfk4vcUTQAx1ti0N3pJmGS/tXp+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XToMcOLF;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00779606A681
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00779606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XToMcOLF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so1511860f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795313455; x=1795918255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKpylqXu9Uw52OCo1aOFe+RE5mVfsZxA83eEzOJV0H4=;
        b=XToMcOLFOH728bCI6bsvUC8u23sqcwRPfaiXYmbrdWxa1JM8wR7NfO08U2GH/tXpJc
         K5hXKSxqwSGVw58ymqxjAjM+Dg5srkwmznHewK+nu7Lqk7tTcQggW4Rc8cQwSBNuwjZR
         y8OwBrM2QnITs7IrlsmMNNHJDhARmIpZdsEQk/FKml4ibj3RRVhIiVDoq6ST1soTCOkk
         4tTBvEv7Pzt5IuVV7m9QDfIvTuV+UaEIsFNSBwgxQuX230zcwNfSn/RIhc+EXLn0rto/
         rJhHrWR71vJz50aPlKiS2HyPkDLGtLSl9p37xyfZzctnsNedI+4Hr4OiWAI/kVb+OcMU
         p8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313455; x=1795918255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKpylqXu9Uw52OCo1aOFe+RE5mVfsZxA83eEzOJV0H4=;
        b=G7aqDffDzwQaSFUP26axyDwqosJchXPEck5YcdXl267cMWxhkcFXr2JAi1ME9Tbxvr
         34mGWTfdRMcv1K7nBg5hgN2LVum8wgSUeMYfEo94g2bhEPSH5Iki/kucTXlCN6241L7+
         RSeWa+tqPaTPU5371lObkXFVznj3VOmxAApdPqELcttO3BQG/z9oMltXwA1rwOZf3K2z
         8fVlZiU/Z8gBU0gY3sJRM7XWI50+EfRL3yMIgzvc0jIm0a4VT3bBaB8e6VkVpz7I17Fy
         Y4tDeuMXEdkZCJPQQkhRWKd11rh+xKr7PQHd2cdYiDqJg4IxDX2zv+cYBkJm5L48L0dO
         7AvA==
X-Forwarded-Encrypted: i=1; AL+hErHT+ibhgM5ZRfcQuBxj/z3R/8KINAlSf+jlr43NRXVwyChZEhQOJ8f14L2Ay0rpXmtERG5pthCynqblRdUW@vger.kernel.org
X-Gm-Message-State: APuU4Z+zuklEZ2Tf3FwTvdRfZNlpchKzykXX5r1yMhX1+VsJvUPEzG6d
	/8RGzvVamh/dd2Uc+V3QlG9K+jbuVEgYUO09mRkwmYcdNrRFAr1aW7MsFAbTDBQMjd0=
X-Gm-Gg: AZFdTZfdqwcB0ih+yRxzYsQQhw7FAIyZ6e9KJYvrkuW/jVAqvvvL4fIaO3BYaGFcvv6
	MNan6GZkCC9GkIcZkuhiKZMR8vW7v8SZQYMxOz/e5Ve7eK6DGwJjBi/6MEtATJZUcETeCjggB+h
	aHa8GKmmzwdQ1kK7DahcFQFJG6ESYLSVtNlBmq7j+/7rTjENxw96gFiu9p130r86+8QeGFDTk+H
	s1GD9zO0f4oEWCioBgIPoPZK4qoAp00kaiJ/GH0FKvQfsjwHwHqao8CqktOIiGORnSYB9WjS3W1
	FlGgnio/NeiNMlQqJ3BBOhEuDzPI8u8Vk63foDyGPqIWgvMS0GMZ9szjB0kC0P3y5bDQdpjkduQ
	5p5zw2K14KGgmthGY8lVnsjZHdYhY6OsF0vTIDOjMWstU73q0duhvX3iNUEtzPujsoE5z9uWEEm
	B1kqMPtT1s2bygNR/x7JiicgUQzlJUeFsVck2vdPVTVN2HkeWD6yvgfvTIj6j/d0JAFcNzaiIA/
	9212OUFLg+v49V2DyO63g9fZks09Q4S43rFYQfJH/1Gger3X8w0Jy/P15fqYS9gABI/zWUcYiU1
	9LSiBeElvhzP6xxk53VV
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr20839619f8f.11.1795313455355;
        Sat, 21 Nov 2026 18:10:55 -0800 (PST)
Received: from [127.0.0.1] ([109.76.78.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm14822085f8f.2.2026.11.21.18.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:10:54 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sun, 22 Nov 2026 02:10:48 +0000
Subject: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
 nowhere
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
Message-Id: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=bod@kernel.org;
 h=from:subject:message-id; bh=92IHekfTyjvBbs8tT8DKzGarLMgWEdLE770DO+618EA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrAk8q0bMyIBH26m3izyE+H7P0FtGu9HCkK61dB
 OOYKhXUzSaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawJPKgAKCRAicTuzoY3I
 Ok9CD/4iKkZnRVSqZAY0XVdyEfKn6tvIN1E/c2yJvgWSMbkO7ZVdSVXXq8trUTgXvUYAceFMYEb
 EjVI5F/fP/uJEGmXFphVfV8RIxqbvwSVyW/C+3o+o/iF1LbVfpHPhloTY57T8ZoBFkNBbqU4+6i
 0HjXKZEC+5LIzQfX5yfpH1hCpI2/HI0ghX8GCCzYAqEvtCot1SOPAMKcRFAfZR+8ihSE0toilHD
 jc+gOaFTLarjP6pM9HkhEXXSmwXcw/Uetzlu+wHFJTiACXhHWrKHu7Wnbn0sm/XShwhS8yyprTv
 e0OuA8Qbi2aGnKyAH+JJTV4D+X913PWbS+aolF5myG3aeiteSv2z7Vjz28IQkidcc1Gn6cDaQzX
 8u+YQ9hafaoStVQzzvvooo+MWi31jeNsJCXUEv7JJjOKVyEMVItsBlLn7O8+NnTKI9j/KJdTpI7
 6vkPA0Oy441yHS+9IMxQbVNayOj65QJ2zA7BaQH6oN5crnV1+VG05sGtIiLkJT/j1mAGIla8y9g
 L+PbENIHVq1lox4BAP2iB50N0GQ8o0mxxhObS6ulvrkpeJDW2O4Vx+9wFmigOJNllk01PIrl7c5
 rKp9MDXv0GjTgueGCGwoxzVwiFHlEYhTRPEOdV62z5LfApXxwUa7qx8aafYibGrZddKlgNss3BC
 oSd9IiXjopuZ2qg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
and raise an interrupt but it can't drive any VFE write-master. This is
basically useless and not worth coding around in the upstream driver. If we
find a real use for this we can turn this back on. In the meantime drop the
definition, it only confuses things.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 26e3f2aa3ef24..aa6d01d8fcb2a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4515,27 +4515,6 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 			.formats = &csid_formats_gen2
 		},
 	},
-	/* CSID2 */
-	{
-		.regulators = {},
-		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 64000000, 80000000 },
-				{ 80000000,  100000000, 200000000,
-				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
-				{ 300000000, 400000000, 480000000 }, },
-		.reg = { "csid2" },
-		.interrupt = { "csid2" },
-		.csid = {
-			.frame_sync_en = true,
-			.hw_ops = &csid_ops_680,
-			.parent_dev_ops = &vfe_parent_dev_ops,
-			.formats = &csid_formats_gen2
-		},
-	},
 	/* CSID_LITE0 */
 	{
 		.regulators = {},

-- 
2.56.0

