Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198696;
	b=dPg+pTFXr2QBxHwE/Lb+FA8Bkv1hASTXNWKUzjQhfhRr3UeaxsOyfIh0Rns0/tmaJTjU
	 8NnKzGqWqk9Yj70tJaNqYxWiSazY3p7KV0tWJZWuF99FiW0sxfQwv5sOxd+EhM8rvZQXJ
	 eLaTySHBTqCx+icic6eWmFYgUd5d0C6mrMR9nNfTIFNfLmuzptJ/IjopDieS2X6yZmUX6
	 I/xIxtMIAlCQdjOKGcEg9IN80vN5m9hwvnxqrZMMAXDb5NrJ6i5p48eSWalXlopl27hEQ
	 Oh9SyVQhYAGA2BqHYgJSSaZ+I+CJxWaQFvivKQ7TyJzem1Tv7PBtvIBzNg5hKDMXT4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=;
	b=sGzJSj6c+D/1CeqEY+KuLuA5+mWBWidd1gaQb7XTWtxmWoiJwQudccLqMsU1zgJuM4N4
	 2I17SZTK8l7auJ8qiq6xqyUDeIn07nUyuoXm5r0KPc7QRlvOfLBj7yXQ5QdhPkAPNaVKB
	 iwT48a9l6O7sykG/fnOiUfLFg9+U9ZPj8TJUOS6kmnmCnqUVNwEuWOER38kXhxlJ2yI1O
	 qjGrPuS8blxGyfGjerHecoRbblbN2rJHOoMLwTchKHjpc/MdmFlBoD1QKWzdhIfWn6ak3
	 yZIfpPJjWvt8/8oQkfGpawHLUgg7CkJacsalhFwpdWuT1aeo75V6p5Dvinz7a1CbBTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSSiKmVm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2h1dE36;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F57D60A3808
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F57D60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSSiKmVm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2h1dE36
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDILFo3916483
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=; b=NSSiKmVmog0ICnvW
	yUGUsNFU9N3zvMgqpqJgS6qaDBPbkcRj31zGNjpDlkpbPYlxgWvYu3hNmPoQTy8K
	ys//JvJnepI18fii2bLjVBLWXSgCTEUzV8cEVwR4DfkmstFMVk11R/2mVuEt/9eg
	8EjVtghwXkMrU5vch8uGV2n9kuj2MYU6cImu4DDWDQQ6WJl7LCJYmlJqXloXuTnX
	4Bw2p1w2PlNz82smojAY5O3e67sPHeAQHzCvyD7bPnn9QyFDbXg0tPqfA2JhBVwy
	v+Hrq+fgqPkaK98rejYFUapeIkO8ZBLWy3YOLVMrbgxqE20+QTubk2uY6UtNq7Ul
	ABfkLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngcfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so180730285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198693; x=1793803493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=;
        b=L2h1dE36Ebh/RwecejL8jssrSoTtVj5yaAwtc2vmGLUP2R/sk4MEjQ9iI7oUpFL6NJ
         xaNok4VmifjqONKQYrZlNaYIcmHMDv3ZMoTXCa5xaOzX+GW9FZkfu/V3bY/r4v2kQB9V
         ZYTVxa3l++Pxou20991jr3Fuq09oC/DtX2Twq9ctg9q8DIrKoQs6Pq3HymlY5ALhdNx8
         C6QG6Ra0g3YeoCPZsr+nnqmDrwEHN6SdFRXETZMKhjO3Z6WxHMbn/8ApZmwuqUF3HzAH
         FfDBEWG84ibc2oI+04IVxb/aT4MvdMQppnez11t26Ah2G4pEdd28bhWCC22qz6x5jng1
         TlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198693; x=1793803493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=;
        b=rNFjnDGEwha3QwXPMDAluMRm5r/I710RoZUmTkrjjf3lmFnuky0lQhk2r6LjQaNKBG
         LdMnTf0S6I0I5zXkF+PCj5wrj1Z4LoHD3/04Bmqi4RgAsmaqfo4pUCFXA45YnyqlCE7P
         chvCfpk9V6yW0xhg2vh8xT5FH0i/Cvldcjt5HnfLejnolyRBiqxC1aIlgQgw0nWYY5N5
         ucvQehwqsoZRobTQ4wSiyTE4BzAtelhY2DDRNlf7dktLn3r7GVy4uONDXqa6L/lU+53m
         Uw8IZHomiPEZSf3E+DhnhNZzvb838BGCUbU5AUZAuCw43uAcMyniqSAZhg72hb5/gYRA
         9NdA==
X-Gm-Message-State: AFq9FYJGDdqtJfIdZ1EptLQW5iPYCGOAr7jYdiAvvFLwqIXdSxOgt1tw
	Ztvy+yEO3OP2yMf68I75CHR2k1BfjmKCfEN7FOTSnFNPwmLivohS/Y+chYqQesYxNA2hdmQ8RTv
	Q7qkK87kDB5mX4pJuOfdpZVh0MSbVDxcoqOKLr8p4vDI+RnEy8pIDJ0XXf1sKbTCVQ6yV0RuXaK
	I9
X-Gm-Gg: AYBFou1VljIXRoIZis6VFRS2gBsQDewV3QTJA3eCGvUhFGClv25q0KB7vHlBFIwAKt0
	BauEnPwFxTg29IAfubBrxWY533EM+4OfdIx/wJ4ofttvHv2WyZ5DpNNAAUacAxdroKMml/h1yO8
	IDi1AnSs3LPMKinO2IzzbLefuiGvI24itFL5QWHUMROAIdyrYl9dAWcbrgSwgYcm4IRZUy+iK3J
	vQ8XEaeEBeDlXQBGynVCNWjnAg0nIjM5183K10lRWGMa5CdyK2yRY7HEQ9akmhr6rPW+EaKoy+r
	m7Gard2eDvRL7jUkJGaCXcvRdhRlgKZkzuLRG0bkNgL/VwqGcf5tsvQpiHeUtJEbj/bkunBXXxR
	fDG9QCsXtWo/lNTMtA/n7d2MhDSfJ3EbZScMVQZCZDq8AtrutBM/DpIGGbl9oWQC8elLP3Xd9Oy
	j/QQ==
X-Received: by 2002:a05:620a:444b:b0:93e:5daa:67a4 with SMTP id af79cd13be357-94408aa107cmr370132885a.29.1793198693262;
        Wed, 28 Oct 2026 07:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:444b:b0:93e:5daa:67a4 with SMTP id af79cd13be357-94408aa107cmr370128885a.29.1793198692792;
        Wed, 28 Oct 2026 07:44:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:41 +0100
Subject: [PATCH v7 5/5] gpio: shared: convert to using software nodes for
 GPIO shared proxy lookup
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-5-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9792;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VqQFAcdQslhA+FOM56xgGaartlvzl9PKEWzaLYMwuHU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpbqa6KuoznuPYwHA9SqJ36W4s2ps37G5yMY
 E+qbktKl56JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWwAKCRAFnS7L/zaE
 wxCCEACQqCuhhEkZx0awpTfHDjzI5KLTq/+hKu9cW2MD/ARs+BPPl9y4FwpqjjnQJo7WswYuFry
 DvElPrds6Wa2GXX5OfZewB7Q0vZQB+H81xq1NKEbsFCqRohfy4A8fAxi4kKSaZFW6BDpGZC7OLH
 u706a/PhklU+wv3DPOMJ4xa5peKl4bTHC3YrZem2PGQdiHgss2+4t/CUCfdYEGTO/9nc+at/p8V
 bXksj2mtUW5pc0LXw4uOiH6uOZ5cnyk9sqXweD65PB7Pozujmr2O1TJ/CVfJMkG6PBeXd5oi9wD
 CtB5ph4kSr+uZx2YgJiVcc62PvpLupaQjqo8cXuUfwQljGbSE12pS+Rz4hOM+pm+5M91Ym0XKeJ
 3NlIngOb/GUWAChsXKjrunGEIEM2LHhUs4TnkhpXsDidYyKtHDQIoWNvuIW8zKVeNHlOUdB5EDD
 BX2CCkpnAg5wmWlCH+DMYOfCJq+AKqtwYJqanGMFprmd2j08N7Z3z1bcbkpbalzLsterliSHshv
 8cthPKhCbF43WS5STRm60Uc8BKemOn3r0TVK847D4t0ogwMragQS4gTcmTI/RtJEufu7Y5aDsJF
 srG9x/0Q4t7Aiy3XokZ6Ny4R23bNyGhifuv5Q6Eas5l6xfpbd2IeTfa+9YnsxGkIBVprTjtijdT
 V0xWmlXHsoPiY2g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: vCx7HkdGhgYUZoh_sXwWCVMoAFZCbF8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX9FaYR1/NMqkN
 PeH6oiSeRvm3tRHM8tvy4sMbI9hROARJbwX6LM1vAKmMil0l09rE0mNzgUaF9QqFIvnrUe/+/ds
 aYHxpgWDj5QUQDkAwclxU4KFfYo7caPGrXdjlkYMek24EaWv3PFR8L2a/cQ70fj5bdEo6Ig98eT
 og1bwUA9quz7LgLNLmT0sn2xN/sT/3eqASutEHhqhGcUukfZM4npgqkGqwnXz1tLrUojN5bxzDd
 TJV3sXK+TWuJQsrkcKU90DZw/ao5ld5nGBBd1bwW1hj5lZ1+J2JbkdWBzNrbnAEykGsB7sAakxi
 /UR71qGPsi18eu5mdhqKUHLCD4J3IqB+jYA8eh3BzuzjOYL5LLOJf1SXiLCUT+arVmDCtGULbXL
 Qoj3FTDjxmNYkCy6gfRVFB/ZKci05aAUsgPu4T7LjozqyTWKl2GiM3Qo9RnwzdOKdKZAa0KmPwB
 rlON3710jlYM7FjmBAA==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae20a66 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-KlJ1dLh0LyCFQG1QjkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vCx7HkdGhgYUZoh_sXwWCVMoAFZCbF8u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXxJyrrjMZ2XLg
 DnYTeLHRiUyH3nlT2y32wyWu/tsw50kf2nMNUmm71LiTSlK6mce5/slJ5ZweqU+/VZuy9a/gw+C
 2uBxEgGLC+sHbTIAT3l8TvT2NJAkzEQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

Automated management of shared GPIOs only allows to request shared pins
when they're assigned to a real struct device. Firmware node, no-device
lookup currently isn't supported and can't be because we're using
platform lookup tables to point the callers to the shared proxy GPIO
controllers.

Rework the GPIO sharing by using dummy software nodes assigned to the
proxy devices and stored in the reference structures which allow us -
once the correct struct gpio_shared_ref is found - to find the correct
target GPIO device by its firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 124 ++++++++++++++++++++++--------------------
 drivers/gpio/gpiolib-shared.h |  15 +++--
 drivers/gpio/gpiolib.c        |  20 +------
 3 files changed, 73 insertions(+), 86 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c0e2a1207cccf16fe9fcf998eaf6ef744fe93eae..4f5ecdfcc63ac175b9c4fcc7044ba3ada83e6349 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,12 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	/* Protects the auxiliary device struct and the lookup table. */
+	/* Protects the auxiliary device struct and fwnode. */
 	struct mutex lock;
 	struct lock_class_key lock_key;
 	struct auxiliary_device *proxy_dev;
-	struct gpiod_lookup_table *lookup;
+	struct software_node proxy_swnode;
+	struct fwnode_handle *proxy_fwnode;
 	bool is_reset_gpio;
 };
 
@@ -313,35 +314,50 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
+	struct software_node *swnode = &ref->proxy_swnode;
 	struct auxiliary_device *adev;
+	struct fwnode_handle *fwnode;
+	struct device *dev;
 	int ret, id;
 
 	adev = kzalloc_obj(*adev);
 	if (!adev)
 		return -ENOMEM;
 
+
 	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
 	if (id < 0) {
-		kfree(adev);
-		return id;
+		ret = id;
+		goto err_free_adev;
 	}
 
+	ret = software_node_register(swnode);
+	if (ret)
+		goto err_free_ida;
+
+	fwnode = software_node_fwnode(swnode);
+	if (!fwnode) {
+		ret = -ENODEV;
+		goto err_swnode_unreg;
+	}
+
+	dev = &adev->dev;
 	adev->id = id;
 	adev->name = "proxy";
-	adev->dev.parent = gdev->dev.parent;
-	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_proxy_dev_release;
+	dev->parent = gdev->dev.parent;
+	dev->platform_data = entry;
+	dev->release = gpio_shared_proxy_dev_release;
+
+	device_set_node(dev, software_node_fwnode(swnode));
 
 	ret = auxiliary_device_init(adev);
-	if (ret) {
-		ida_free(&gpio_shared_ida, id);
-		kfree(adev);
-		return ret;
-	}
+	if (ret)
+		goto err_swnode_unreg;
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
 		auxiliary_device_uninit(adev);
+		software_node_unregister(swnode);
 		return ret;
 	}
 
@@ -350,9 +366,19 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 
 	scoped_guard(mutex, &ref->lock) {
 		ref->proxy_dev = adev;
+		ref->proxy_fwnode = fwnode;
 	}
 
 	return 0;
+
+err_swnode_unreg:
+	software_node_unregister(swnode);
+err_free_ida:
+	ida_free(&gpio_shared_ida, id);
+err_free_adev:
+	kfree(adev);
+
+	return ret;
 }
 
 #if IS_ENABLED(CONFIG_RESET_GPIO)
@@ -457,23 +483,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 }
 #endif /* CONFIG_RESET_GPIO */
 
-int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
-				 const char *con_id, unsigned long lflags)
+struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id)
 {
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	const char *dev_id;
-
-	if (!consumer)
-		return -EOPNOTSUPP;
-
-	dev_id = dev_name(consumer);
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
-			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
+			if (!ref->fwnode && consumer &&
+			    device_is_compatible(consumer, "reset-gpio")) {
 				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 					continue;
 			} else if (fwnode != ref->fwnode) {
@@ -484,42 +506,31 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) != 0))
 				continue;
 
-			/* We've already done that on a previous request. */
-			if (ref->lookup)
-				return 0;
-
-			char *key __free(kfree) =
-				kasprintf(GFP_KERNEL,
-					  KBUILD_MODNAME ".proxy.%u",
-					  ref->proxy_dev->id);
-			if (!key)
-				return -ENOMEM;
-
-			struct gpiod_lookup_table *lookup __free(kfree) =
-				kzalloc_flex(*lookup, table, 2);
-			if (!lookup)
-				return -ENOMEM;
-
-			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
-				 dev_id, key, ref->con_id ?: "none");
-
-			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
-			if (!lookup->dev_id)
-				return -ENOMEM;
-
-			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
-						       ref->con_id, lflags);
+			if (!ref->proxy_fwnode)
+				/*
+				 * There's a matching shared reference but the
+				 * associated auxiliary device has not been
+				 * created yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			ref->lookup = no_free_ptr(lookup);
-			gpiod_add_lookup_table(ref->lookup);
+			struct gpio_device *gdev __free(gpio_device_put) =
+					gpio_device_find_by_fwnode(ref->proxy_fwnode);
+			if (!gdev)
+				/*
+				 * There's a matching shared reference but the
+				 * associated GPIO controller has not been
+				 * registered yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			return 0;
+			return gpio_device_get_desc(gdev, 0);
 		}
 	}
 
 	/* We warn here because this can only happen if the programmer borked. */
 	WARN_ON(1);
-	return -ENOENT;
+	return ERR_PTR(-ENOENT);
 }
 
 static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
@@ -529,6 +540,8 @@ static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 	scoped_guard(mutex, &ref->lock) {
 		proxy = ref->proxy_dev;
 		ref->proxy_dev = NULL;
+		software_node_unregister(&ref->proxy_swnode);
+		ref->proxy_fwnode = NULL;
 	}
 
 	auxiliary_device_delete(proxy);
@@ -543,17 +556,8 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	scoped_guard(mutex, &entry->lock)
 		gpiod_free_commit(&gdev->descs[entry->offset]);
 
-	list_for_each_entry(ref, &entry->refs, list) {
-		if (ref->lookup) {
-			gpiod_remove_lookup_table(ref->lookup);
-			kfree(ref->lookup->table[0].key);
-			kfree(ref->lookup->dev_id);
-			kfree(ref->lookup);
-			ref->lookup = NULL;
-		}
-
+	list_for_each_entry(ref, &entry->refs, list)
 		gpio_shared_remove_proxy_dev(ref);
-	}
 }
 
 static int gpio_shared_setup_entry(struct gpio_chip *gc,
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aafd087df267a4a32732ccc03af38e..27fd2a40c5cb77a19c258e3fbf429d3f6e7d4b32 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -14,9 +14,9 @@ struct fwnode_handle;
 
 int gpiochip_setup_shared(struct gpio_chip *gc);
 void gpio_device_teardown_shared(struct gpio_device *gdev);
-int gpio_shared_add_proxy_lookup(struct device *consumer,
-				 struct fwnode_handle *fwnode,
-				 const char *con_id, unsigned long lflags);
+struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id);
 
 #else
 
@@ -27,12 +27,11 @@ static inline int gpiochip_setup_shared(struct gpio_chip *gc)
 
 static inline void gpio_device_teardown_shared(struct gpio_device *gdev) { }
 
-static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
-					       struct fwnode_handle *fwnode,
-					       const char *con_id,
-					       unsigned long lflags)
+static inline struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id)
 {
-	return 0;
+	return NULL;
 }
 
 #endif /* CONFIG_GPIO_SHARED */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..402de2e106f19fd110d67eeecd3c07794b7a5cdd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4841,24 +4841,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	scoped_guard(srcu, &gpio_devices_srcu) {
 		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
 					   &flags, &lookupflags);
-		if (!IS_ERR_OR_NULL(desc) &&
-		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
-			/*
-			 * We're dealing with a GPIO shared by multiple
-			 * consumers. This is the moment to add the machine
-			 * lookup table for the proxy device as previously
-			 * we only knew the consumer's fwnode.
-			 */
-			ret = gpio_shared_add_proxy_lookup(consumer, fwnode,
-							   con_id, lookupflags);
-			if (ret)
-				return ERR_PTR(ret);
-
-			/* Trigger platform lookup for shared GPIO proxy. */
-			desc = ERR_PTR(-ENOENT);
-			/* Trigger it even for fwnode-only gpiod_get(). */
-			platform_lookup_allowed = true;
-		}
+		if (!IS_ERR_OR_NULL(desc) && test_bit(GPIOD_FLAG_SHARED, &desc->flags))
+			desc = gpio_shared_get_proxy(consumer, fwnode, con_id);
 
 		if (gpiod_not_found(desc) && platform_lookup_allowed) {
 			/*

-- 
2.47.3

