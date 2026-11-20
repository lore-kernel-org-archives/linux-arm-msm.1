Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196430;
	b=o/uS8bBmQrbQ4+TvgQ7aKketKvpJQyblUQLPK3IA5k1WxTHFqbZLWNzxvB5Qmx3DOwaa
	 k9nNaqadaP7oqmlBkjsyySd0CnjLDH/UHb/V/O24F7Ai+O2gpmEKimps+GuaGEtsW3q5Z
	 Zm3ahgaadONvQworKpdOxBLIYHh1sm6sC9xxv+LCcZ7Fthr96SevnwaSoEOzxy1C5e/Y4
	 DlE5EioaeE4FdVw39TlRByqzajRhdgGjmUs9cUBbydD1fgA1Pv729mzfv7nh8tEdcW0Bu
	 J4dkHyiUw6eXOOfWC7XuuTriVIZiJI2l7DsrQbxLxoA3elGtGHJyKDDAgI+TYOlRxvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mAqhAwYtTGGUt9HsaNHp93GmUA0b3RGVILqFHkMc3dc=;
	b=hx7sA6QOh4CMkad7fvC4ceU74mnj3YoYf79/3KrweBUu0IDH18jxVQsneIKV1GedMQIU
	 z0cggbcm1qtDD0YQhGFikXAxnlGVYmQpEWU70jfX8486us/BRgdMH92wvTPlt9ljJRqXK
	 ruIr6qs35ZVAXG05lzHvhIO2fcAdIT6XerVOocVHIOupSk1h02BgP9u2lQ4jh8694oNAy
	 NNfuSLikLjoGpV2aBmWubxYVz57tdr7C23Gj2rmG56pTK1BVfVqjrMqNguU2MaDQbAQtK
	 hmlJ/UcS5VS0hX13XK8E0eSzcbDqxCos2EIP5C+MSX1LkkNIOmXZ+cvihNnVZmiahtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aBURvjdg;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3860606A335
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 17:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3860606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aBURvjdg
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55c304f7031so13571191cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196427; x=1795801227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAqhAwYtTGGUt9HsaNHp93GmUA0b3RGVILqFHkMc3dc=;
        b=aBURvjdgxtLl5qAXgNdjYWSJnP66qnq8B2tblPLUXp88tUYLeqNR+SLJeCHnh2nghb
         aTPmeT7jUar3P086sAi4sgLvFaRZcRvXDyRVX5ClNXV1Mg7gbBTOJbUvFBCwe/nLJ0oS
         COtMCuYSY8Ej/OrWv5rabABWXky7gZzf0IyHlOU2+y3EsRkKcVsYcDs4cI3V0ilO+3gv
         2t0CntRIr/Ikh+R08aOf4B5Y5sk6QeTU37eTl1XFQD/d9hukV/pZoavqBHYCkquiW7l7
         Spxtogf8d/rH0ZpKrubJDKhDCIiosnQ1cel5U9eRRKgGAs5OyRYWBNUzpwFkBzl9DGxl
         PVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196427; x=1795801227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAqhAwYtTGGUt9HsaNHp93GmUA0b3RGVILqFHkMc3dc=;
        b=dEbBV/qWIsJi0GpbIVAman2gVAKFWjZLd+Fg7kLBuY95DrNLBNbqmFIYi3Zh1l5Z9n
         D9EPgdrM/68ztHR6WTbYek5sptChzKj49p/cygw3LwwBdYDT4EJb/oe2WEu8C+APP2kw
         nSMRplf840acWiy8OQh+JtHmmLe9uu7O3kyEHBUIu+XIFIQjxJGMXcNE8RH/ONlNdzPV
         XgVdNU/9Wg5cjEErn73kcdHeViK+NnTrsZK3XKhDYh+frhJYXYz+iGhwaPCI838chJ5E
         rs9kDKZbQHNIbUSBfjShFfM8olzaVM38tTw2FA1Jgjxj9q6Bo7tbcBG1Wcw+MZvkI4q4
         nROQ==
X-Forwarded-Encrypted: i=1; AL+hErEYY4xDM+N4Npy5630O6bAGwjatsEA8iMxncF435QSJvh/V5/4OYYT02AzHmFyY47jyYot+AYjQE7SmtPGk@vger.kernel.org
X-Gm-Message-State: APuU4Z+JqbjnvKtSdOvcdomhTHx0dcHTEYDA1F6gqVppbskkrnF16NGh
	8ytdmcdWz9iQ5Gl0i4sYXeX+mUnoIzqK5SiBQpsQsv7/ZAhYbS/k3x1/
X-Gm-Gg: AYBFou2zKCbTOei+zzdAsuqaDG0P0HPsl7SMGoVIqwgiMERHbQkIefp3Yttm5lrvf5C
	XO0JPIc2GkS6rB4jCKtRXygq3v9ECtJopseuIsWP8d8G/4HiSyCCdPjONxEME1P1RXTkK6FtHQc
	0zTCsZsqugt/r4L4vin6twPn0D/PmNfYzxyGCJLRcSYy/7zn/l35BYo8aUkKipCdMX0Bj2MFD3R
	CjB/q8+ctzJ38AQiuTcw18l2UVvnqfjCc3B6gZNo+RnDM2vP3hUdq6lhaqUj+79og6HcMHrK/lQ
	5+ILbqRQ2q62VaeXf9xEYj5SuMBoqt5Y/faXg1lDbb0aYvZQCBXOfHQSFJ+9wf0V7S87tKKsblZ
	Xf1o+eZl+qPF0Ki+1RUM02iqnPlQjEc9Ys4mDqEACHhCL8UBQGpdG0aOPGfRA1BMwC2pflxPP8d
	J2bich8nEVsUnomNqga7j8N2eNFo9sdAZUk8sWMwD8R8V6h/BJN12PZVMgEcsgWusWKg2QGX0Gy
	KjGGW9VMZ40TSmDjGtYT9H02xsEKNaZH9qSYIhzqg0AGps/pFF9Xq5GGkX6BHnhNwbvRmQpi0R/
	HjQTdXRXQoFps6l7Eat74cd7DF8ZvSamQPaLPeITs80dJkyY54PG1e6DxbSVUhg2KSYfwtEgy8U
	SUnrNsYGvGf+iGu4Tk5k3nZEB5Jfp4S1mdij0sRV4QCmigMdXIrDXmPRHUQMgorrOCmFJxSQAdP
	lDZD5wmj2Qjw3XWRcQbAkmVdGDXQlgEQ+XVBgSB8QH1shMxgfLzEdI5P7cuucCsIcx0bDyRT+Eg
	4sKcizSeWxWABqA9BwNJ+ahbC7lzTH1vKZxN/eU5fywpA==
X-Received: by 2002:a05:622a:1808:b0:535:a5f7:d596 with SMTP id d75a77b69052e-55d6fd36ed3mr78926921cf.37.1795196427043;
        Fri, 20 Nov 2026 09:40:27 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm28110831cf.28.2026.11.20.09.40.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:40:26 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Allan Siriani <allan@fatecpompeia.edu.br>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] media: qcom: camss: x1e80100: Use the lite clocks for the lite CSIDs
Date: Fri, 20 Nov 2026 12:40:24 -0500
Message-ID: <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795196107.git.jesse.casco@gmail.com>
References: <cover.1795196107.git.jesse.casco@gmail.com>
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

The X1E80100 CSID_LITE0 and CSID_LITE1 resources list the full CSID
clocks, "csid" and "csid_csiphy_rx", instead of "vfe_lite_csid" and
"vfe_lite_cphy_rx", which the binding provides for them. The lite CSIDs
then run with their own CSI-2 receiver unclocked: their registers can be
read and they raise the reset interrupt, but they never report RX, RDI
or buffer-done interrupts, so no frame arrives.

Use the lite clocks, with the vfe_lite_csid rates the IFE_LITE entries
already use.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3..7d9622097 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4287,13 +4287,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	{
 		.regulators = {},
 		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = { { 0 },
 				{ 0 },
 				{ 64000000, 80000000 },
 				{ 80000000,  100000000, 200000000,
 				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 },
 				{ 300000000, 400000000, 480000000 }, },
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
@@ -4308,13 +4308,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	{
 		.regulators = {},
 		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = { { 0 },
 				{ 0 },
 				{ 64000000, 80000000 },
 				{ 80000000,  100000000, 200000000,
 				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 },
 				{ 300000000, 400000000, 480000000 }, },
 
 		.reg = { "csid_lite1" },
-- 
2.56.1

