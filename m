Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405242;
	b=wUUWjmnKbtbCyN/B67yAX9aDLqu9MM1gIAbGs/rIp21DuSy+NpZ5SnmUJz+9XLvRrzHf
	 Zs0HVa4q9nTvMsLmHdU1C/+OfOgnIVWYKOCkw9vCdd4s53t8v08ii6Ei4FYv8c+w/qLss
	 WuAd3RBF/wCj+ViP96Y9Q5GhLOTctOG7NCgEGTexsSCL1Cmo/jakidLC9DwcvjUQR1lzF
	 h91HxfTcMtn9EgT3p+XyKXQX8zOcu9AF6eJr+vO8zKx/u4/cDyab3I3xG62I0Nm7iV8oK
	 xvqjXV0UHHWvFYTpffs+ns7A8eXcSthXjtHXayp22fHtYndLdRCAAkcqIwh/p/2dthA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
	b=A9OFJ7j6E4Vui34oeyKEiHhxrAjCayaDNdbk4gvPTxsylzPYhiaeV17VcTehweBRr1DM
	 oT3K+bzgCy9EVlKgVebUrRuYr3NrU8ziJk9pyCruD9XcjYsFQA6/P0E8/oYEVFtEnTZWu
	 hqlNKsjAVw56CCptE2cPtUgDbLMeytPkCbtOhwFzBoo3bukk5psuD9iXymt3lVNcYYiVB
	 bDtVaUyMlgEOtqSVDmCuxvyOsunOsH98rW2k8Ce6jet7Nked9Z8sPDJaw+om/Y3EsDptj
	 nZ+K+D+qQbZK2kJQnVLyZLrLGRqorth9I/fKubyawyGVTD69Ytl8mVEpAJ2xf0+1q3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JLYlk39A;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0412F606A335
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0412F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JLYlk39A
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-77bf892b496so1236083137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405241; x=1795010041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=JLYlk39A+LWuJ5c5BVu06EQUramJHojKBYOzACSa9v7IUaad883H39T5vT3jdiazuT
         FsPEWbTjY7gL1CFEyrDa6RMVWReweb9MskpIwhEPt4w9RDlJZ4CcsERLdkhK/UkNBDB3
         3vbsBgdIMlCPHxoKs7vfOpAoq/UivQAS0sq24NfxMo6EjmAOLLafZkQJ/aJyrPRTHV9D
         bKRz76RDqXhmHZAFBmuKNIJbpxfoTbwVp0jpAii7eOAyg4SB2KnbUc4LkNmTp6EDRg9l
         1Zw9ZQCD+42M+CsTwbOadDOwjpItO3mjJirfzyF32jWE5eoJFAZRW4f+Nk95IyK+6X7u
         L1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405241; x=1795010041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=B/9UJBACKyIs3++QBFACt8y2jIPtxxcwSMx74h4r5EwB758H/E8jW2MJG0SwCwpQOe
         wy84AfEO744yuMO2kWBWgOhVYmf0AJar84B1hxj4KEfGQ5Hge2RlHGBrpFYANhIZZ9zy
         BLfNKP6DrlDOOHfhedZHnk6dLiGQdhLJVmYuCKyF82ntGCP8vd8B6X0WJQnQFSC73nau
         5Wm68PAwKIiP2W63++E3IoRozabTMwmwyEjq/1PggS+vRC/VJCLdvx+QgPRjtzBJfegY
         kjQ5ZE7mHZ/VTAzdp3QGLUTTcrfCpdbVU+kLLL3qT0csrIHXDpikkevF/MDmHeJwtdNR
         whvg==
X-Forwarded-Encrypted: i=1; AL+hErGPHQwaBxLzEEd68XCIsQ2pbBUDj5DqCS5elcgqyP4k5kMOGZnqPcjGq5Fp9fe0qhWeUQX1vwplAI6qfrzw@vger.kernel.org
X-Gm-Message-State: APuU4Z9cVHtstzR9cJ2izI+ZVGczjmVB/PBNE6se6NWVIhaCozGRMUp4
	50JRZHrZ7xkEUXCVtNxbGRj9nXNjLyPcZo9Ec5YEj2Q+/v035W2Sany0VWeOpw/Z4Fg=
X-Gm-Gg: AYBFou3l/aRs9xVm44LFj191ZZLopAb9Fq6Sv0I6JjkiMYot5BJPaB2WAEeBvImWpyt
	qNgmc/ai1WNJMGsRPwcQ4ehC2zn0zffuG9Xw0phD/yYWN3ADSr424pFKe9A22TyUUOEY2AbV2pC
	m5d91RlrKLPRfQFm3QNKEADvI0mVr29JvnKu6GSHfvqwvfVoThO0EtWC6JU9FdUWuxH6pz6OGdV
	lR1+jut17SuK9PZP7jsUVqpiRKkq+IGNr0uB8Kuc5BFavtkVk6dauLZUWm6SmFy/gUdVhIp00vb
	NcW5tmXX4kikyB1kC88WbMmTvIZ+OJJHw1h70LjUvFOHLT2KdmuRSnu3DjB7tbMqxm+Z0+ffbNr
	EGbVd1HCp+JG3yclicLzx2wcUhXiUT2rCGJ+E8tC4lAbUL70nCiLqiFmmsaA3lnSFUlRH+jG8XF
	mLcnd5+OIY75OTee3ZLzzTKklnITrRxF2d5a0TTFhY47+LHAzHLeXVA48N3QQhOx2tZ4hjL/Kot
	DjVIWklYSMZCdcKGc1L0v7X8I+QayFNn+ZDYM+oddu2k73T+TxUfgdwau90LU0u83FV6wzSvjuJ
	0j3rX5Hxy/TQ8h7mdArrX/QZjyTwYh+WTecH5iAaBbfdL/ik4CEAwlOuyD+hJHFWdjof3H09rUI
	SpEqg
X-Received: by 2002:a05:6102:2928:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d5060b5d1bmr601415137.14.1794405240958;
        Wed, 11 Nov 2026 05:54:00 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:54:00 -0800 (PST)
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
Subject: [PATCH v3 4/4] media: qcom: camss: do not fail CSID power up without a matching VFE
Date: Wed, 11 Nov 2026 10:53:38 -0300
Message-Id: <20261111135338.27008-5-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
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

