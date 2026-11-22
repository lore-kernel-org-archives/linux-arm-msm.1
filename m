Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313460;
	b=GvTR2+3XMVWsNRP3KBFeCQwHIdOQd+tt7TzNSb0IoZqByAb4yh+53k/vGbNpU5mgq/49
	 lk2RRJXQXOHDO22zO6Vcue6X543TCCre+jbFzmHLsvO82ONCtkbXgjz58oDlaHgmgTc0C
	 lOsGaGgGyPxqqdVih1Y3x/mU3oQhVQ+2gL41i/GX8nKh6Uf/y9XQiokqNd00+Z5T7brjz
	 c3im3KxZ+P7o7HetEcr5P5caMfjUUgb4c8VKOJJjXYcHjUNJutG94V9nuEonq1SrZYat/
	 63SxAxKmZc6cwSsO92nX5IyvCytYGKIZnmoEPeP4e5aKBv1v/Wn0mCQDM45tZ/fWt9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RTZZloUEvJoEm2gef3JIqnv9kasmhOfSewriv0MYxuE=;
	b=qMtgqYKbK3Y4Q5CamUrvuV/kN+4G+hlfRR4cz72/b0M9UQanYsKaH36L4f5lRvsdu3GY
	 igLoICY7oY9hUGWfP7NKfebC1XVDN5mh9KELWt0UwCOb/XSHCd2iTuMexMLELuX9NrhxM
	 pVrQ+G54nmc24Y4T+bF0mihLqYGfZTmMG/+p+gjKHGlyt0dyaqRaWGdBVUpbKmBdUDP+d
	 Jn0Rq52scb0ISd1cXhHPlSreRsltSZ+MM/F3aqZOv3Pb9HUY8y1rJYFl3Y5E804FRXDLI
	 QnTgnEhu2tuRcgA3lc//UhEUwRRfTjTlHyJpZHten1ZoKh9Byq+kCF5U0IDsXYVlqHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kqxzZHLn;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F334606A69F
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F334606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kqxzZHLn
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1309081f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795313458; x=1795918258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTZZloUEvJoEm2gef3JIqnv9kasmhOfSewriv0MYxuE=;
        b=kqxzZHLno1siIGU+x7Wo9LNA2v5s1GUJ3RZMNYH6OK56Ie70MKKn5eWy2OlpkdBAs7
         zM+P1HPoZ/ioPRk9pYvBqrVAa3wrkyslrv5+SCeRQL9rvueBIIlEASMSelW1N5399QKP
         AvFEkFTgZaLsXsty1/v7DRU9mR89ZwjPrlKrWBN3612xJnbtP8jk5Hp3pjXn3yr9TvaF
         vdzVAlxIn44gGN5yFIYvPQYxKDefYb/nQTfy2+k4RWEGdYxIb7t4cfex6W/WEfMtp1h8
         JlpibIxgiHXUKwR44MkLY85A09Uq6QLp43mpbgi0s/ZSWFA/ARz7HriFCHjn+dCNECFN
         Dxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313458; x=1795918258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTZZloUEvJoEm2gef3JIqnv9kasmhOfSewriv0MYxuE=;
        b=GxEdW8AdevXqapJVJAncAOZuAeeB8e4Hrnaog3TVW+rlNJRDP0cdbVoVhTjAFooJQu
         kdbkevTFMxTHDNsnk/+t6gxEYEtYo9MuktUnJ89pS6pnJYl3lMnMmWAxF0x11frgIFlX
         siRzYkngXodj6nJsJ/fBbpjClxyF8xQwupqgkIjTZrLfcrkrh86fFojXZDAdN42jzd/w
         UicuhC8XVm59BKFl8K4RetMx6p/4pFc1Gd5Wtoo1xQJGHXo5ewJsGvU3BMUJ2TWe8U5P
         2YEBu9blTOBlDXie93XXj67LS01yDf85kVuGS7Pkv6P3Ui16AeLOK1FR6WGGhX1fZ5Yy
         6VVQ==
X-Forwarded-Encrypted: i=1; AL+hErFeKTM3aji8W03ec6OE2pQoFX1DpAMD9eoiSfis8VSOYi84ib1la8T59KbZkGjRkgoWSOYwdPcSVtQgeAFP@vger.kernel.org
X-Gm-Message-State: APuU4Z+pbrJCvPhETdHfVlXN1825A0V6AVIlqenJrkeLcmgrkcQKp4Ip
	gvq4kST26OXwSK+GZ0+dkjqQ7CPgRrKylz6tsQoaKIZX94GPNU/AbtCRGXlRPg8csAU=
X-Gm-Gg: AZFdTZf3kyc00taayMhq5A2gu/1QuzoWJV8TQkUq/PXgtW9wQ0KG3Zu5bH/9TSz/xN1
	EjCjmDsKx9mknp9g5U2oHwKT7ZKVeHSn8YVN1LyYIEGiV6PC45Tjq6E7RWBxY/H6E7XJhJiu2wl
	RHcFs0SY2tmLKNdTEvvk8Ah9h2rpTjGh+01UNEz+r6uClMwwUPkW6dlOYy75c3GVcps6Sx7/8Cz
	CqA7cosm2W1mZCKgthLctsMen/wC5gvo5befaIDSRlJkuNSWpQ1wiYZJEMUMPrRxyxIf45LnoIv
	LEc/PngHAviJD0LuF+75grrtZMDgka2oRxVxewj1g9TC4fPH7qyvw1mPoRzkyFAhuzhYHgApaFD
	T7ivk0jt9dwAb8NNkUPsu6NbxVbXzvlBP47gXVTms2PxfNgZe7iUvZrLMFX/UaM0pOMuUf6FWP2
	J5qfAzapF2wB7Kn+yiQr/0Zne4ccecXOARqnY5z+x0KhBzOOgut6ZZ2BBlaCXWDPXEo2hM7xZjR
	U9amV32fjMpAdHxJ8rpxMEuC/p/pY+sGPpRqp4J4o5IsGAVlHvVaDSJ8sOpXj/Qg962BZ3WwsmS
	nVDLKAbV7RPxvIZGvDE9
X-Received: by 2002:a05:6000:2309:b0:4a7:45a2:ec26 with SMTP id ffacd0b85a97d-4abb0f3bc89mr16386094f8f.16.1795313457577;
        Sat, 21 Nov 2026 18:10:57 -0800 (PST)
Received: from [127.0.0.1] ([109.76.78.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm14822085f8f.2.2026.11.21.18.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:10:56 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sun, 22 Nov 2026 02:10:49 +0000
Subject: [PATCH 2/3] media: qcom: camss: Fix CSID to VFE routing for non
 ISPIF platforms
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
Message-Id: <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2395; i=bod@kernel.org;
 h=from:subject:message-id; bh=9VmSMCiwAd6wMvEr0q8cG66RISBCUbwiO5AxYnBJo4c=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrAk8qevMZBnrtbTMdBwkqggrhWOGUyKtR4e3jN
 vwdWCwOyoyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawJPKgAKCRAicTuzoY3I
 OhwuD/9M/iAtWfoIEszZWFGErOTtVbgxKUhxHaqpvRVjoww6re2QW0l+5blOSNQDzjwwqGDvE10
 FsJZqgGIv9qxtBK9yRN0ozcJp07T3HgPJPItriY5OiTMBeccWuDsAu3MrbRPGq8slp8TNXf21kY
 dMXx4xX7tdThaPmNHzVEsllN2nFwQqKTlh14p9tlgM+18HX1VV5txsUY+wUeW6F7IYpUgHdve7B
 ZqWb4hO/DKS9WNI5Gm7nwN1sPBAfQEWzwMqR1uoNBvgaf2iYKd/PrLhR48khaBb2f3eNbmh/kda
 PY5nC7iTv340t1f8jncX/Jhw1Mptycabggd1xKlIVISiPqTxKGNzBw0ZgSqiXPtDN3Z1Fr7U1wG
 z+L2pvczkGdz7+Jg+aaHzfWvKKEoO7LY5MNJaGdrQRORsq3+Z4B8YGpz4O5XiaNY240AeHYCXJX
 Em6Vo6NnIbSJ67exig60YOHBZQOA9pQPlT7hxisaPa2qcmFtZ2rsDo/HEoHVA4oEpZZsZ+CTiRO
 PWigdSXgePrQHv/3lH4WJR/EDYg3RusOLRT/NoG8zsWpZR5gAtJ2lFLSLvoDCLtjWPzD/tu/Nw0
 gQn9zuCefC4foc6j4VqYIqSfa2Qx1xJgdvVN23myNedWAjo/1nTs7ay9NmRotLheSiggvow0w2J
 OvVWNuT2ozZisBA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

This patch fixes a basic routing error that has been present in CAMSS since
the addition of non ISPIF platforms.

The ISPIF platforms can route any CSID to any VFE however this is not the
case on the non ISPIF platforms.

The current requirement is a 1:1 mapping CSID0->VFE0 CSID1->VFE1 etc.
Demote the spurious poly-mapping down to its 1:1 real form.

Fixes: 9229b53f9758 ("Revert "media: qcom: camss: Restructure camss_link_entities"")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index aa6d01d8fcb2a..060879a55e483 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5257,24 +5257,30 @@ static int camss_link_entities(struct camss *camss)
 					}
 				}
 	} else {
-		for (i = 0; i < camss->res->csid_num; i++)
-			for (k = 0; k < camss->res->vfe_num; k++)
-				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
-					struct v4l2_subdev *csid = &camss->csid[i].subdev;
-					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
 
-					ret = media_create_pad_link(&csid->entity,
-								    MSM_CSID_PAD_FIRST_SRC + j,
-								    &vfe->entity,
-								    MSM_VFE_PAD_SINK,
-								    0);
-					if (ret < 0) {
-						camss_link_err(camss, csid->entity.name,
-							       vfe->entity.name,
-							       ret);
-						return ret;
-					}
+		if (camss->res->csid_num != camss->res->vfe_num) {
+			return dev_err_probe(camss->dev, -EINVAL,
+					     "csid_num %u != vfe_num %u\n",
+					     camss->res->csid_num, camss->res->vfe_num);
+		}
+
+		for (i = 0; i < camss->res->csid_num; i++)
+			for (j = 0; j < camss->vfe[i].res->line_num; j++) {
+				struct v4l2_subdev *csid = &camss->csid[i].subdev;
+				struct v4l2_subdev *vfe = &camss->vfe[i].line[j].subdev;
+
+				ret = media_create_pad_link(&csid->entity,
+							    MSM_CSID_PAD_FIRST_SRC + j,
+							    &vfe->entity,
+							    MSM_VFE_PAD_SINK,
+							    0);
+				if (ret < 0) {
+					camss_link_err(camss, csid->entity.name,
+						       vfe->entity.name,
+						       ret);
+					return ret;
 				}
+			}
 	}
 
 	return 0;

-- 
2.56.0

