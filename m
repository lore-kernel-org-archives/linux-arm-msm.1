Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823812;
	b=xyuvocmMd/ZBbfYKKWUUbv9oczZnn0GpR/ftILW5RsdgLE64FACqbFhqx/ivggVogiIn
	 0MHICknyGesPD5osqcmCsZIC3e6ZfXB+8YC/iKzgOksF5t6iz8mJ23evDNP0SePxNLS+S
	 23mEseWas/JeBQWrQ41++GtGQDQtMPT1JPkQAbhycsROVR3nyDFjW0vMNFgwfX+PGew8f
	 azN6FsLMBvnU+L3Caa+9+tBFZBJ2YpsLYcJa+T7gpcVCItQvbsARa42SX9i89HJiTMPwK
	 YIZPHMsbh/xu8unOvjhnNJhbitrt0XzgyYrfQFXIBs7BrGLgQ29BDBRiUjwyzXOZFpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
	b=m5uDoKytFz/+k9DHOXB1JAS/qWCVDSV+9vZafyx4ZoBBKofJstc6h83SSOJC7d23O7Rg
	 OO9bRblLHXUn0GdGRofmXTUIpBmwsDAggonHmDitQhNwHTmwao77+VCqiWkivYQQkNzZa
	 iQGzjCQQvF8JxN8ehctUvZ5PfFvghzgSXk122Sn2+ERGnNjPlIBzcBPy2O1ya4GuodOX1
	 rbUeIVe18Zd09Ys0QoE4JNIX9x1MwnJzkoRwwjjSEpSfd1SXIv9ZZ5mCNR30r3zlqjMKd
	 vU46poaxOTesjmpYONY4nm6HZqB2CQOqb2qBD6lEnTj85TKZEepCyO3zqomLCTfRquQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VEpxIxb0;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9296073509
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 20:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E9296073509
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VEpxIxb0
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-677bc4704cbso1457556d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823811; x=1794428611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=VEpxIxb0a8wfXYvhkeSKmMTvunJIxcraVVKLZX+mTN3NdQQ/vfiZmqDdf8VgZ0/5dP
         /sxmC9qMzBLR9O+p0fnIKEwySN6MXmp4fXaHIWnvwAVAmSR+QgNXzYQCwxutgObDrsOA
         wOWyFEM2xmRTkxqM9af2+03nc9dwDEziudLWUCTU6l4Km59522R/+GZgl182BbmPhYry
         UcLTpiqNhxMOQH0wmgPaQQTq5ZA7y8NlOzdnaW6ZNgN0wayNDdF8ozseUBUaRkHkhvhR
         3am3i+xX8J8obrfm2Oyr8K99WvBf70H6l0DvTSzcw3jWngrK9O2ODq3E6VBOjlZmcTCd
         6Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823811; x=1794428611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=fBVGO9PKYGSVxd2+QDZ3zro8WxqXrAC2w8HQ1sq1SOOnJyIZ2Js0L+Piu6QLROaRfu
         mSRWc8elcpu3iML3ovvW0LLgjWUeU3cjwaY644+jw9Rq/bYhZ4K/8bvrk9hlmUKh8a/j
         9mnAPIMXQuHnSgYw8+baMLk11V2xYqhNkc711Ui2bkcuLyITnZkhrrVzz/Se7f+Dd+yG
         09xpDQ9acUlmpniRGundI6oR6pmXLHoVwfbnLmfVRK2D8q4hVgSqUZWDdVDNKO938wru
         sskEpUNYe4VfTS/QNdlGowOVOD6rvbOp1eMhjQe9QKnQIQOSWSGVY/D9T8lRQPPZxpxb
         u5Eg==
X-Forwarded-Encrypted: i=1; AKwUvBy6bsp0xE3m5KiIWR3Sq5xWkXkCb9xOtuCV01Y1ErX3PipcKxEOEhGNf37PkdqnpT23Cb3Rpj5eaVIx0nly@vger.kernel.org
X-Gm-Message-State: APuU4Z+3IeXssMGpMB+QIXtAcRQ40kQqNdtKg7KXOO7PX8Q4/STtACIu
	KPf+2dFEoaY2AU0c3WJuBhF5fZyLbwqDsbxy59izwXnUq94HsZ5jS39iehZBlJaESz5sy3prEqm
	NcyxR7E8=
X-Gm-Gg: AYBFou3S9/jRfStCLbwuD0z7gvWsWPhNK+pi5SuQtrhqX6mJaogNqiZ6FTDrFj9urww
	GdRbF76wn9OJAGKzDxPkokjfOj5xj0/mKGNkrdGu4DnZ9fA8xaZ6fGJSmFEDl8AgEeX1yvejiQw
	Hy7XbP77+akGmPaXZoaOlFrFHXDI0ft0k3TCaiomBBL0Rqtm0jJVgn5nQJZXcGKpTsy+roGn249
	7jx/2C8GQtWR85fnvLi9T3hec3GrvNF8/qnOCVo0avt5mEwj3JmzGvEd1dn+VNMcgoM9CS7uP4o
	BJ4BEnXY3GOWw6qReUo5dFfQ860P24mypZ0cnLtakoRmY09ySvyb6D8QsD6fhVG3s1ma/8JKPNj
	o69soehtQr/keVeTyhKOQv2Vr2pXwVzN39077oR+wDKgSrB/Lq6eHdkkcbyzz1Wwyno3ab5Bzy9
	Mvjpxr8CKxZjAlsHOGU8BoWIgxtktBdtZ4x2Z+BJdq+rNbYSTSc4aRI96TgA05tc3IYioPVolAV
	yjeVOMsK68rfRMGj2fYM6IaS/MPfTCR3D1NyOPt05F0x32xEUwY9gUkQGwfl0asQkuj/dsZZR1b
	GbMTQv3HyN7bGSbdsXMxFziYlTK4KPFytcrLXTbR/TxYplsh8bn+RhvlUkuNGDOPbwTpcxRDhhv
	pADnMjElJ7Nks+p6knLq3+WYe
X-Received: by 2002:a05:690e:12cb:b0:67b:bf6b:d9e3 with SMTP id 956f58d0204a3-67bbf6bdd12mr6448256d50.48.1793823811217;
        Wed, 04 Nov 2026 12:23:31 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:30 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: qcom: camss: do not fail CSID power up without a matching VFE
Date: Wed,  4 Nov 2026 17:23:13 -0300
Message-Id: <20261104202313.72494-5-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
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

