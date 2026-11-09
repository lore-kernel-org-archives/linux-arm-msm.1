Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223595;
	b=YnXHmSIUmhcgNQ/PW03IT6L60w9xKI88nYnyWCfCRe4zSnX9D/5ECWLGHg91V0eAdCw2
	 g+AGnsR51fsFBLO8VpY1mxHSkNVQ8VkViiUA+KxNWtBGNlNpsV5v0EjR32cVXLv9YeHJ/
	 vfK1BYWoLZ6M5sOQj6Gw3OmaekiP3Auamre/O+a35WdOZsXRctBX6Itq8HewM4lUgj5wq
	 RkYE12dt7vZBirNAAX3QbcD/KDcevj8JX6PifZWehSOVnbSlTulzYQPAKbjRvvKgXQD/L
	 6fXlTirSIVeSbkzqEQEAJLKLWd95Sgj0dxmQvLrNL5n8uLFWZ5mbd4t92+ze8S3xcPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
	b=kqrAcIKDHeURazFvr++3ivAyo56fqq2EUYy0gnqniPlEA+2n+AW9ale/vB7YgzKu7fpK
	 5NrrWi5ad+I2u6zoaNHotaUHs0FaJWL1z7Hqbma7RgaaQHFpPYtE21IDE8+dBGjII45WJ
	 sRgDCBKPlEySjWlebjK5dn/5XDRILBuN8nFSQl+KP62jrq+HiR2sVUq6sU6AIyi/bD5Xt
	 W7736EXzGIuZX+/A0rWzWkBIVmw30IZAdSq8ysKlo0J6gao0KoBKwtZVbaPb1RrWaDcSf
	 pkbIk9FE25fWXcZ+A1CCFiRidg+CoXakhe+aBPbtUuoyTotpuOQozMCapnkdLFNMw8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="HRvk/q7h";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F34606D816
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 11:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F34606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HRvk/q7h
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b30ff12f84so4215437b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223594; x=1794828394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=HRvk/q7hv6GUxA6ex5QAp3j4lsMWUjdxCseq0wkxqkLNanJUBMmVT86O+ISZV4DVUt
         agZ7fAqjne/fIDciMzkFujvfPOWDPOi9ENgtVCvUOe+X9NaSD6MX0SiCHZQejumyH9hE
         0JplMJt4OknrPIug7uAxojAkE3CfAz/szXEuk8V6oLXoXDOfAMC8YU1ug52yevy/P16A
         pJWm+NGoYZSCIMdn0pxjA8NktfBI/J3RrQPwAhIdDtFTTvqP8pbHG/6l7tpFaXbn4wqR
         V0zoAIMPmvLNDBgTsYcltkD351vEkKT4tjiUO3DGVpynrmZlxKMRzDk2z4QdfkknYr1J
         LSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223594; x=1794828394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=XbyFc5LPbY1LOaDmGjBYLrkdB5Gaoiak8O/Fk96baCMPk0Ur0/doR/c9YcD3NSzETa
         HY8OC9X13lgSTLNHuPGC+yOKmJOMWzl3wrggoJf6vdVZGdSa+A9JXj/X14zUoI4y+gWO
         HKGi+nlraNsgvvaXqWBaqp9a77Qc7gh7RUriRfJ7tntnjRQnPdNpW16dYmeAE/cepLnV
         7D4mr1dh8rrmdR5aJLZH7vbcn6E8itPd2ZXnekZH55XbQscAkun4yu4XmBa2gC+kAnSV
         xPX4QgpbdLv8fm5g5BgBNvHnWRJQNCrhbjkpj9G6K7gMaUDayF7mvgucVJ/tkj2myAiA
         11hA==
X-Forwarded-Encrypted: i=1; AL+hErE3zEkJ4XhXMzH9rfj36AQRwcBAof+4o5gvis06TL4b8680WzQSIdJWtAxp4VcwpdpfJXZjrf8j1A5ZB8MX@vger.kernel.org
X-Gm-Message-State: APuU4Z9eWqiotQwk9Y+GWSood1dI8vFCWR28ApktnTw7RcOregt9WcMw
	ICwKH9P8/NtwVroMMwrAwsgYKkSvhVk4JBsqcPPC1fSpepl1M9xCRlyX62VwYKHZ0C3EAdEZbzj
	hsuezo7M=
X-Gm-Gg: AYBFou28KKHv6NPWU51mkuZM+l8qFDlWtGf7J2VwIqfgGVSt4eYURod7Op9B/XZlRfN
	c6xfkNKhRL5Zrht/McItC7mRH7I1fk2rniNlkDERm5JDC12UXzXVa01n0G50+xX9oZsokQc8to0
	+iILi3Kb2WRTi2z962F8167IhAz0jIbap1g/mvbJ0UMe6B7QHMMjsGhynRNVxuxNeecWEYB5u3+
	r6YZDEAKIqKmY38sOh/jOOoswW2LqSi61rXWauDwmyfPyTHnI5TiLCBnBN48s276KXFRzDcZhcS
	RLMCznkXFbvdo5Zo32FP58qW05ayY+u34TU5VJcqMbGXtsiVne35lg/gW2bRyCgMwMIJTCSgNb8
	atC+awpEprUW7mqo6ITVZxDu6afJvTYw6yxeD6mOMY7XYc2IN3ZHtFDBe5TCKyKaXKIn9yu9034
	goW980rBuswU3VZLHy9+Qc+ry+mlPujdJ7qAihPQPdLX1PvjzBPqS+/73j4OepGTFrexejqbkZT
	UFlH5u2/WJYa3bQvCt908kKyHceVxGOr/tuvDmXA3lC36H4HnC3m98XPbqhiIjOf0fdjOk58qrM
	wOB7A7oIUjjfcFceSlRIb+70afaab5BtwITo480JaFBNcHt//suD2+cb4eYi5EDlWvCj
X-Received: by 2002:a05:690c:386:b0:8b0:d9ff:4f74 with SMTP id 00721157ae682-8b36cb0c321mr27400357b3.42.1794223593551;
        Mon, 09 Nov 2026 03:26:33 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:33 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] media: qcom: camss: do not fail CSID power up without a matching VFE
Date: Mon,  9 Nov 2026 08:26:11 -0300
Message-Id: <20261109112611.94010-5-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

csid_set_power() powers up the VFE with the same index as the CSID
before the CSID itself, through parent_dev_ops->get(). The VFE
implementation, vfe_parent_dev_ops_get(), returns -EINVAL when there is
no VFE with that index.

On the ISPIF based SoCs there are more CSIDs than VFEs: MSM8916 (and
MSM8226) have two CSIDs and a single VFE, and the ISPIF routes either
CSID to it. Streaming from CSID1 then fails right away with

  qcom-camss ...: Failed to power up pipeline: -22

although the pipeline CSID1 -> ISPIF -> VFE0 is valid.

Return 0 when there is no VFE of the same index: there is nothing to
power up for that CSID, the VFE in the pipeline is powered by its own
subdev. vfe_parent_dev_ops_put() already ignores such indexes.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93..532f6d36d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4631,15 +4631,16 @@ static int camss_read_version(struct camss *camss)
 
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
-	int ret = -EINVAL;
-
-	if (id < camss->res->vfe_num) {
-		struct vfe_device *vfe = &camss->vfe[id];
-
-		ret = vfe_get(vfe);
-	}
+	/*
+	 * On the ISPIF based SoCs any CSID can feed any VFE, and there may be
+	 * more CSIDs than VFEs (MSM8916: two CSIDs, one VFE). A CSID without a
+	 * VFE of the same index has no parent to power up: the VFE that ends
+	 * up in the pipeline is powered by its own subdev.
+	 */
+	if (id >= camss->res->vfe_num)
+		return 0;
 
-	return ret;
+	return vfe_get(&camss->vfe[id]);
 }
 
 static int vfe_parent_dev_ops_put(struct camss *camss, int id)
-- 
2.43.0

