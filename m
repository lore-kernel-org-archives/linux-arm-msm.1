Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623833;
	b=LeFm6YOEU+aaCJJZh4mlUhMgCXATiBt3Lfypnlc/e/pL4YHJemQ9sCTrmv7QGukG4x81
	 8WlLxM187RG9IlAYKWJhUr1Ulnc8ecshrKq4rvpq/Y2efQ0ZCxhbH6M9yPyx0+b+kBBht
	 z7cO1wDxqI1DxDdBvYVU5JgOkT90WLfIoEtgkNxksAhIm414qq8pRbCl+j3yJy78/Zg9q
	 iWuXLwmXFRJoMjvMs3kbdP0nmzVQZmTEDUKRP0w09L6LsofNh7+VmzZvvmp0hVnqQjhub
	 yZslJK3a83enwNwwpvsJa3epMsQO9jqvxIm6/DmOWoSFVjEuJTPr9YIsqqf8hr/xsnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
	b=OfmQry6zg2Ovem976kvT3D1gbPMiwvkFEMD5JE1WoEISyj4iWjbCEbRDsaZMIt3/1hkm
	 Ii8h4hTfpmN0R+isHI0PVk4acRO1BHdM7M+ve6+98AzZjxNjXO55bfL3RwFXN7HtGwU8S
	 cLRfSahYsHkIq0RCJTqogeN97ZCsUxX4NF/FnFqgrlZ5GFHkqzeV07AmNKG625/rFictt
	 C5Bq0hGqVrttD0Hu1nQjEf5RUIP8G5FpZvTyYYdy/wWFfFLPjGaXS3p0cgU9/KQaIfZNg
	 4wqPpW0b99sOm6+wjAyL5sK7uv83umtFmCIQqbcaXVuHiqQ5LFq9SHTvmugaWTod9Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DRgVKmrz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8bX7V6f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6427B60A2635
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6427B60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DRgVKmrz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8bX7V6f
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A0YN3430284
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=; b=DRgVKmrzQ3nCUmKD
	8ij9enGNqQBGcCxPegiucxXLdYbHjRGNXgVlzuSOmFghzG7HqIgUovg7bcsDjnuJ
	hAHf8/3jvad/IirpMnd06YR9arcdikvrWk0cmgxAx50H6EEQYW2aJ/uwOckZNOoe
	ZgeiVEsapJMavUH3IBsA1wQSfVwvDWP9QD4uTy12L7LKOEfMIxXknoTHtkPahvhk
	uGdHFsH7Xm6SRmERLPFE43dFtZd2pHSIIq2LtDqZ4umshzTDnvg6SEDvs74ttUhI
	7T3sEZ2aWFL2Pj9R3CRGOgih2qiIrB0Bpzgx+r8J+hon1baIQEhg4f+BbNEgkzTw
	axXgdQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesb71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:50:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so2345783137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623831; x=1794228631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=c8bX7V6fC0WRVlAxF2fF9xj26XK8EUECYssMopoe60RAu+snTVK4KpDUbk6kMLpcNf
         wjrs2KcGsRE5nFLT0MvQu55pboHI1qLJ8gsNQo/eioZpP6Pi2GrCjjbhLA2iLoeSJOJl
         NippbYPL5mIBaANd2pOkZ/Oac6jJt+tnYjhXPsWFXT1YjxSY+uMK5juRtGn03qnOkNRa
         U+m78mTojKPJ+ybnzKxV/F2FJXrAK1QFHPsygIWwagVqs2jJdLeTTC1JUYPqNbQVbam8
         sVWHTRIJMHRiXRgdpJfpZ/x8zctXq2u1GgXh3peLnYkOJ5yjBSop++XBvQ2nNyEYvVg6
         fpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623831; x=1794228631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=pOrSAzPWuPeKP82rSjyZo1DZMhe4bMou/vf8bJNIoL7tpzjlo7nRB4Pu/dAqWYtFKb
         rcYo45EgCM0HgF/nkNp/zboHP7onOQzWWzc0dc79yJKQyYNRqXVi7ZjyuWLripAQ4l0A
         Lu10QaLwPR7MIq7HfpCLdFhpZuxfNQJm5IV35qTx46qTBSmcoB7jeV679dYTUkoXlnWM
         oyjDprLQwpdGwJW3pn+BHqP+9fluSYanKVepa/JpfX8Vq7sI9oXTckJJ2UmEiruJcEO+
         B7vHyGolkXED/DlwSm9vdh7Bh4wbuTUdMu8GKrH2hvgR/LU7+BvIQRaPcKetjB4Zr6y8
         vDhQ==
X-Gm-Message-State: APuU4Z9+3RPKuWdczyrEfDuqLXrLSPluhuVUDjnBgAB/9VVXZC9o7sbx
	HoWUfTGSeN0rn31mze9EjyfoalTIw8XIGx5e/Q8hpEg9zZpL1zjkqM9lneqLG/4E59krM84FEXy
	iQT/IfD8pFqnyoqgfbNFXRtZBUkOA94qETVkwPhKlTxNMSJb1dDebDtIec6PI16dTiBIu
X-Gm-Gg: AYBFou0I9Vk3sN+/PAmLjmOGh8xcUECP2h/mJG+WT0VOfy8cY+6xqp8nnFm/PT87epq
	YRGAZQna6XbJ2qSLxlUNiTv8gByJnhHZGGkkvvfe5kWYk9ixmi1+3RKrG5ABvmyX50Auc7Lbadt
	CJSpnej7rYOoTAtpEluzKCF9rFBoTCUHf6iMzs0f0HoaYfIDk4SdgoMaVX0cbeyU781nsqK/3FH
	SzipwvT3d9mB2N+aaXCJHDXgvY4DKjB3lQBqXwqz6JcAcM1cu3r3b+k3JdsvF4+yUPGAWZtfnZA
	O9uH2t9ubp2NaHbfIyqiVo1fCBHwpEUl+8gXJZAcW4BNOX/KY7jg7THJn54tvzRkbrrFOOQEUDW
	ryASXP9gG+X18QdvVg/l7UHR9GViPVEvnq3eT7sACggYHWzMsA+y6FXRb2DEfdurAsSVx3L5PzM
	89bQ==
X-Received: by 2002:a05:6102:160e:b0:7cb:bbcc:e4e with SMTP id ada2fe7eead31-7d07271116bmr4032162137.23.1793623830550;
        Mon, 02 Nov 2026 04:50:30 -0800 (PST)
X-Received: by 2002:a05:6102:160e:b0:7cb:bbcc:e4e with SMTP id ada2fe7eead31-7d07271116bmr4032158137.23.1793623830044;
        Mon, 02 Nov 2026 04:50:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:50:20 +0100
Subject: [PATCH v9 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-2-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4265;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pBmr6hTIjmoRjtYdJqbTh0DkvQI3gauruJ23Msg4kXE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcQbGDlWObuvqS+ty1xvhXyP+5fx4AA3JhIh
 q7ikzqGFP2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHEAAKCRAFnS7L/zaE
 w8BrD/46FTsLpK2zfYL3VWIQ2Nwkpwf0z0XrJzv0eU6MIDFY61NXMDRaBq3mruymrJQw1MKux6C
 8Ouf1xVYxWyiLMEh83AhXcbBj/Nyjlnd2mxTdhKgdzO2ZWwHS9mxVE1wejH6qSwjBlo5WBDXQCw
 RcGdXcyOHBNYiS/YpyjILgG90ZSqGFmWgBooF9VJXsKyDXvYWGIfHzGB136mid8rlfPnQs6Oh2v
 xaZhjc48m2nc7xbg2NXEAl9an4BbMq9twdNweXnNedJCQBmESHQfLZscN8JYxbJs5BlwU6C/4Dg
 4jDJxf1WooIxtpbsj5pCIX2IJsv+E9bUQ4NMmQ/nro3TR/11PlpAq2+WAlxs6DCIuRWFMtzSFUd
 jCO7IEdIIAo9BhEezEEPa/TIaXBoXEutBQcZAKmSwGdH/cYn8wVjD9ftsJ6mK8PXmNxGEAhKf2L
 ym/pjkgLeyndrz/2YegLfErZlyo5LOHY2K0n+kSTXF77fwA+4R/Ihh8d/E53l/Eru2BfAGfBXaJ
 LJHlr18Ab1BdbN9zuk1D9Fxb/0C1eWQ4CPxovC7SNsjebXhe7rqskOAdVnnUWHCBNvIC1lvwsAb
 sA6Osz9KASEo2enHoi7kEwJ715bQZ3KtH1DsJyHP4ZErhr2kJN3lCE0yCjGUZCL+1IAOuX1UFxF
 PZ93zSGhhEiVFRw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae88717 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfXyLB0HaC3ApD+
 BSnod5RbfHiDGmfza0TVbBRfUyFjtTwNB6G7FNEX5HVz6qx7165u7rbZ7e1N2qYjgYjM0ndpAfE
 7tpQT5P9Y6QQfnJ1HIfXrFzEcqQID8iUvPlYHQdIOcGBYZdzCt/QeP5dcwdLjEHD2pfZHvsw+zb
 986prnMj3Ezm4+gLsO+291h+cLOYhsns2/v1sp9nOzvwHhmozaVUJsbr3migJ23FPWbU86ai5JG
 kLMzQSHiin3JELCAiAmFnqdqDBwVQQ0Vps4v/rPpN+AClS1J4mWMN2F5XFe2bY/8/9r69pqea8c
 pcMu41uHT5CR5Bbk+ldhwGta559sm2dRs+uGTaWMseCKGmf8/oG3zD6QHos8+eHIveJu3pxQB6i
 62GjRtfGWd9ImNvjiun9uF2KJ9RHUqpcRZi+ODXO6T/mJ7veLq1m1xiMnbmUh6cHIzLFdJfPIHO
 cx/2FteoVJUpNsodqSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX0/gKBlGHSVeR
 ziQxQ+hZHUyr27R5LnO++Hvo3PAPmXx6UUB+Jpw08z/HJAMF0JoGLWHIQceQFWrlTVJ1//AU8DG
 J2u5dsuU4QrwYI1e6RGLYBNxxDkKZzE=
X-Proofpoint-ORIG-GUID: fvlq-F68OY2j69khQJxbvNz-kbmVaNTM
X-Proofpoint-GUID: fvlq-F68OY2j69khQJxbvNz-kbmVaNTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020051

Move the per-entry part of gpiochip_setup_shared() into
gpio_shared_setup_entry(). This is a preparation for making the setup
all-or-nothing, which requires handling the failure of a single entry
in isolation. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 112 ++++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 64bb450f0a8461d214a45aa97e2474ff0d1857ce..c9500c2b904ca53dd1e3cfe1bdb921d767d18b3d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -538,12 +538,71 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	}
 }
 
+static int gpio_shared_setup_entry(struct gpio_chip *gc,
+				   struct gpio_shared_entry *entry)
+{
+	struct gpio_device *gdev = gc->gpiodev;
+	struct gpio_shared_ref *ref;
+	struct gpio_desc *desc;
+	int ret;
+
+	scoped_guard(mutex, &entry->lock) {
+#if IS_ENABLED(CONFIG_OF)
+		if (is_of_node(entry->fwnode) && gc->of_xlate) {
+			/*
+			 * This is the earliest that we can translate the
+			 * devicetree offset to the chip offset.
+			 */
+			struct of_phandle_args gpiospec = { };
+
+			gpiospec.np = to_of_node(entry->fwnode);
+			gpiospec.args_count = 2;
+			gpiospec.args[0] = entry->offset;
+
+			ret = gc->of_xlate(gc, &gpiospec, NULL);
+			if (ret < 0)
+				return ret;
+
+			entry->offset = ret;
+		}
+#endif /* CONFIG_OF */
+
+		desc = &gdev->descs[entry->offset];
+
+		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+		/*
+		 * Shared GPIOs are not requested via the normal path. Make
+		 * them inaccessible to anyone even before we register the
+		 * chip.
+		 */
+		ret = gpiod_request_commit(desc, "shared");
+		if (ret)
+			return ret;
+
+		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
+			 entry->offset, gpio_device_get_label(gdev));
+	}
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
+			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
+			 ref->con_id ?: "(none)");
+
+		ret = gpio_shared_make_adev(gdev, entry, ref);
+		if (ret) {
+			gpiod_free_commit(desc);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	struct gpio_desc *desc;
 	int ret;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
@@ -571,54 +630,9 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 		if (list_count_nodes(&entry->refs) <= 1)
 			continue;
 
-		scoped_guard(mutex, &entry->lock) {
-#if IS_ENABLED(CONFIG_OF)
-			if (is_of_node(entry->fwnode) && gc->of_xlate) {
-				/*
-				 * This is the earliest that we can tranlate the
-				 * devicetree offset to the chip offset.
-				 */
-				struct of_phandle_args gpiospec = { };
-
-				gpiospec.np = to_of_node(entry->fwnode);
-				gpiospec.args_count = 2;
-				gpiospec.args[0] = entry->offset;
-
-				ret = gc->of_xlate(gc, &gpiospec, NULL);
-				if (ret < 0)
-					return ret;
-
-				entry->offset = ret;
-			}
-#endif /* CONFIG_OF */
-
-			desc = &gdev->descs[entry->offset];
-
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
-			/*
-			 * Shared GPIOs are not requested via the normal path. Make
-			 * them inaccessible to anyone even before we register the
-			 * chip.
-			 */
-			ret = gpiod_request_commit(desc, "shared");
-			if (ret)
-				return ret;
-
-			pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
-				 entry->offset, gpio_device_get_label(gdev));
-		}
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
-				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
-				 ref->con_id ?: "(none)");
-
-			ret = gpio_shared_make_adev(gdev, entry, ref);
-			if (ret) {
-				gpiod_free_commit(desc);
-				return ret;
-			}
-		}
+		ret = gpio_shared_setup_entry(gc, entry);
+		if (ret)
+			return ret;
 	}
 
 	return 0;

-- 
2.47.3

