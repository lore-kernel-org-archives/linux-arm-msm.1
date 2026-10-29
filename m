Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290971;
	b=lBVN7c1Vqbc74NQVhXJ7hfaCuMcygOxPhRVTjnMbWIohUNSJrq1hOtRixEFF6xo0ptYe
	 q0Ei1Ap9N30L6KGh4fmPsBBRzeQd98L1lFh2rPvy6EltzcCf/C/M+cCRfvbR7YOZgwEYK
	 JLLal0FpLuPoGLTls1EMn5D3nCB+XdHvYoTmFexjAHTmlP0IVwnB0zWY47KiUItv7CHMg
	 NxO7OD7KWx4zbKYCARi6kowTEJPM8raia8WJ2RxZbdlrVoKr4BQR9NnZ/CLaLfREtsAp5
	 NtiihfdEPsfKBFrRAVRCjN3F4FY5hoMi03++50+0sOAOEvb7yeYi7+mrOq/qGtypFOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
	b=CljetSI1SvVoWnpWXpThbzhjCihaEuLXEhp86crbuRiWKXnvCFuhoOv9Q28lDbJydOB3
	 4WrDmi1zRWJJbUtKJK2X212D7PChCs3/uR1KUI1KGGFrjhUig2GxXQrrJWQHhLP+0WdMy
	 CxW8EzluDZ9M/Z8q2zQldypWBh/k/dIq5JwJcgQFk8bzSCDo/hq5APqlw7+7g6QAFogmJ
	 k5pIE85yBjCJvxKZZ3uQBlxOQKW0yubvCnfhdeXEU6YxDs7D6LLgEz4Bt/QSCMXaZI5HY
	 DEDsYnKcosJkVPr6Ccrdzo4N0kG7BTPnrhntCbEtjlzoeixdo3SdWqvvK+iKe0ZAZYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B43ZXqqt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KemV+LPQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6078160A3804
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6078160A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B43ZXqqt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KemV+LPQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDQC6594519
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=; b=B43ZXqqtN/8LIAD7
	IoFfvDmgQUa8VXdr/PgqadbeWnSbxsL0y3avxwoWV1iM8QzK9YhX2Liua9Li8Hec
	w8nixR154LwBzT6pkTogC8I/wEyJLFYNwpK617SaqoOeFSB8/X3oe4Rfg8VzbZZ8
	4eiJnNTsTUYxDqg9yuOwyt0cIKa7HUyrL2NI+PZYGdzbEgnDX20LrzPWEpHW8jnu
	i+cGuXsJViNsnv1ZShGcZuskbLataPZxkkl0Jwi0i9QSX518tHsOP/S0GKmVaUNh
	lMjgPPniTadXSi8VrbkEKS9Sj1UxZPhcxJOWE0K98oqXrV/gJefNE4mZl7iABdwj
	/ItiMw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3kcsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c1a2c3b118so1941193137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793290968; x=1793895768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
        b=KemV+LPQVm2l9Prsy3PrDM/VhfditgNeXmeFpF3mM7qpzc9Jru2NJHNRpyoqVZFp6G
         qIlRrU3lPZNHip+apSPxRBTPgZRF6cwk9fxE7FUtKrljqmdrcP7sxCdreb9p2HQ1qUaP
         z++n7/RSAMuo06VhdGZkfQNXdQiwaljqCiEmH+wPQFfXQxR4O3DQWoDuw498KrvB9xvF
         GCWNuI+Wd+VROqY5+biY7DNVuUjpa+RHQaG6BEqvxlwVm+tOaDVjVFQg4nIQnj65Xjsn
         p7Ky+CIA7rhGQhBBJVh6VlWBKo3rLG4rCVoQIUdGh5bCc51hzHgSO9kM9RnYcHMGEjZe
         uiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290968; x=1793895768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
        b=AR0Gq/UOUQ3IrgDupqHZnDLqkwhg3QVWVwUecrAFxn3UynKGZ+kcfvNCglI3DOlo5s
         ghGPibE3q4UgspP8TrH6q8VDINV4DveJjorZB11z5tktCBm6ajTjklRsYbQUI7o2AKju
         n7nlrAQlAEmeOYCdIMbjFrUk8/lLQ5h9ilZkpIjbFGPgJLS4nMlAlgSyawNpXAiJEf3B
         Ryg683wQjJ+acatFMrG1KpJi1Ui0WDQQPk1MNYdlKk+Mmmj26kOq/WoGmTAJSzHAz7lz
         3DmQHEAisKlakKIN1y2NB+xvPdnEPgfaaRN+G0vaJnbYBUdAc3PKBzX8zDRRIh6Eyokt
         D4Fw==
X-Gm-Message-State: AFq9FYJ0q5qWjN08wZ+ASy58lxdpoUGbHywlcaLO2iHdJxE/OMuYd34k
	rMErFJe0BlhBqj6/NluIlVUxHBTHJx/zLUwXFV4IKlcJRErLDEV/u5EodlPOhZxPdT9uT8QYmvl
	W9lMYN7rc1PVS95o9yjIGv0Q+3Bof0CFyuiqOTZgLHLvbKDyGFRcNb72sS0LlWUJby/6O+Oh1j0
	31
X-Gm-Gg: AYBFou0cZmqNegVZ+h6BjjOwVKwwcTwlC5WQfqPQybvt+e9bepvmBLZ9LCcAm1t+ulV
	a9WUa3JndhwXTOOPvzRYMWzGQlzW50pncgc8c9UJihWO9moE6aTwYKgrhC/VD1KD8PVrsiG0fKk
	6nKYoNfp94MTSJGjJXav3MDdp3SLdsek3w5wr714p52O59tZkza+Q5/hc7iNeJZHG0AeMwzFfwB
	CpcSaAWV3ilUcHQhnQpqtxQpRh/6O4poeARl1i4eghYCJCqzqYFp4Dm3CAV8AIC4EtWGL7WyR4B
	MlFRQTnbSTWj8lbJCjGFvC6WWm/xqfdkxiMfEWUCYgscn7dzxC5h/TjcHD4Mig8QHOfkSxe5zrc
	rpebu2kPgLsLLjfpoxK860WlTVwQmGiweT0uZUGlMt3srMugXigVwH+yPdOA5nGauOGoaqT2P/N
	aCSQ==
X-Received: by 2002:a05:6102:4b03:b0:7c3:ac79:9b09 with SMTP id ada2fe7eead31-7d03a5dd949mr3139963137.30.1793290967670;
        Thu, 29 Oct 2026 09:22:47 -0700 (PDT)
X-Received: by 2002:a05:6102:4b03:b0:7c3:ac79:9b09 with SMTP id ada2fe7eead31-7d03a5dd949mr3139941137.30.1793290966751;
        Thu, 29 Oct 2026 09:22:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm93868605e9.2.2026.10.29.09.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:22:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:22:35 +0100
Subject: [PATCH v8 4/5] gpio: shared: detach the proxy device from struct
 gpio_shared_ref
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
Message-Id: <20261029-gpio-shared-fwnode-lookup-v8-4-d15d75cd560f@oss.qualcomm.com>
References: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
In-Reply-To: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6332;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AK3+tDXO+muQ4ZCcxhm/oDc0hzzPO4mlQf5U9mOOPuU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq43LMqpDTnX0tgaNYU0SVq9D7iO5TLHEz00KO9
 Yc4DCOiBNGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauNyzAAKCRAFnS7L/zaE
 w8rID/9GDyZ6qrXFx4eF7TNlt3HBGkLqBZQ3DQEIq6fud4oygVcUaSI/6FXKG/Ig4DVlAD0oawM
 TDYrzgz0YlQDSd0pTsKLe4WLOq+jNvPBVCMMublPd/72PSweeKtlWjlDr4h56ux8hjFZhAFH5pU
 ySRdXRYXEjlKvSXuvktx0kevrvDws/21XYF7Iq2x1etn8pCmpBMxky3kZF/mnwvMNa6E557x1s8
 KLPnYTVtFwGIb6D3+BWivGwCRTlge2qH+3zjr5kf8joUPeWKyHdGTednqxvUHk2D9TanvWR/uox
 2tSUV6T+XX0cEMU6lirU1n60cSG+1khi2+vFHDvN9RqjQ5QsYOfXRL+fgh0wvKbTPB0cKh4P7VR
 hz07svAaHP83bR3RnkiAhGBYDSgexhDA4VP6Ci4dycGTaz55bJ6mvu5ASADC15mvzWMYEDVVZgk
 /L6odWaelYLURp6K5+u4T4t99Mf5JtTA6DviKqZnXIUzTD9eRKHMdcu5U8EEaGhJmnz8hY68kaN
 GRBbDhHu0i71WDp+XsTX+mNJtW3/dWKhAPgWylv9o2/yj+n/R233szaASolNZduEa6YAFQMXwiU
 e+mGtWU7+0PHn1soA9cPeDGf6zYtdsfPVc223acvRdCOG8Zp5NC5H79Pcv3/Wji+/k4Sd2AsEyV
 2HsAOn3NDhjbVjQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX39ncHg2bq3FS
 usVx4BvCvq4vvg6cHvyQPZNtBF0oIVHBE+9+17yVMm5YNrxaJR6FcnCAJZKs+/78dGf+bhOWoF3
 YJomZ8ijXUMWEH1NnIvSt98aYkqgxpg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXzmsm5BylywMk
 kyKgUbDOJoPBgU2kcJQfhPtQX5kzxwWBQtOSlbcTS7NdXwhp/SN0cBs2ytCYuQhWVJAWTE9bMG4
 5ZbHmnDi9WALdaPVCtcKY+XKJGRBlbjK8hPM6dATwO7BfDyooYXH5gt/chZVd+LgGHnpr/XOYPf
 6sjBtPBMf6EfD6rsAPeDci1wRxoTrf3Vu9bBv7QLR4FH1c7B6GgQJ51KTxagvUeYSfEordxHEsK
 wTFI+0ThulMoFEzGp6smycIH766QjPC/rIsIos5Yy7VRmBr4ekUGZfrlDuC3dmzj6Iu2bllrQFJ
 nFVid5S41xCXLiqTc/H5iKi5UzNW0cRWHuYDMBltMlaH8f9+lB+N73NAeBNx3X6hIRfz1wI2veh
 mtlLdtxu8pk9bQbwTNBkJVyYZdWL+sJKiezLWM99OllDFhjQUvVQoq0NnpZR36HglOM5L16nLQG
 a0spuIDQR/o1uz8ssxA==
X-Proofpoint-ORIG-GUID: JT6TU095ItwKrh2woKzcIp56qrdI_GXs
X-Proofpoint-GUID: JT6TU095ItwKrh2woKzcIp56qrdI_GXs
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae372d8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=nd_FmhSvACMRRlF81YkA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290064

Sashiko reported a pre-existing issue with the reference-counted
auxiliary device being embedded in struct gpio_shared_ref. We
unconditionally memset() the struct when setting up the GPIO shared
proxy parent while there may still be references to it held by users.

While in practice this would never happen and sashiko seems to have
confused the parent auxiliary device and the separately allocated struct
device embedded in struct gpio_device, it's still a bad pattern and
could lead to memory corruption if a user deliberately took reference to
the auxiliary device via one of the lookup functions and kept it over
the GPIO parent's teardown.

Move the auxiliary device struct out of the shared reference structure
and allocate its memory separately on proxy setup.

Since we're already touching that field: change the name to something
more meaningful: it's more important to point out this is the proxy
device instead of indicating its type in the name.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 69 +++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 043d5daba7a73062151a089b3ee8ccdac726f221..c0e2a1207cccf16fe9fcf998eaf6ef744fe93eae 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,10 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	int dev_id;
 	/* Protects the auxiliary device struct and the lookup table. */
 	struct mutex lock;
 	struct lock_class_key lock_key;
-	struct auxiliary_device adev;
+	struct auxiliary_device *proxy_dev;
 	struct gpiod_lookup_table *lookup;
 	bool is_reset_gpio;
 };
@@ -94,10 +93,6 @@ static struct gpio_shared_ref *gpio_shared_make_ref(struct fwnode_handle *fwnode
 			return NULL;
 	}
 
-	ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
-	if (ref->dev_id < 0)
-		return NULL;
-
 	ref->flags = flags;
 	ref->con_id = no_free_ptr(con_id_cpy);
 	ref->fwnode = fwnode;
@@ -306,31 +301,43 @@ static int gpio_shared_of_scan(void)
 }
 #endif /* CONFIG_OF */
 
-static void gpio_shared_adev_release(struct device *dev)
+static void gpio_shared_proxy_dev_release(struct device *dev)
 {
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 
+	ida_free(&gpio_shared_ida, adev->id);
+	kfree(adev);
 }
 
-static int gpio_shared_make_adev(struct gpio_device *gdev,
-				 struct gpio_shared_entry *entry,
-				 struct gpio_shared_ref *ref)
+static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
+				      struct gpio_shared_entry *entry,
+				      struct gpio_shared_ref *ref)
 {
-	struct auxiliary_device *adev = &ref->adev;
-	int ret;
+	struct auxiliary_device *adev;
+	int ret, id;
 
-	guard(mutex)(&ref->lock);
+	adev = kzalloc_obj(*adev);
+	if (!adev)
+		return -ENOMEM;
 
-	memset(adev, 0, sizeof(*adev));
+	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
+	if (id < 0) {
+		kfree(adev);
+		return id;
+	}
 
-	adev->id = ref->dev_id;
+	adev->id = id;
 	adev->name = "proxy";
 	adev->dev.parent = gdev->dev.parent;
 	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_adev_release;
+	adev->dev.release = gpio_shared_proxy_dev_release;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		ida_free(&gpio_shared_ida, id);
+		kfree(adev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
@@ -341,6 +348,10 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
 		 dev_name(&adev->dev), gpio_device_get_label(gdev));
 
+	scoped_guard(mutex, &ref->lock) {
+		ref->proxy_dev = adev;
+	}
+
 	return 0;
 }
 
@@ -480,7 +491,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			char *key __free(kfree) =
 				kasprintf(GFP_KERNEL,
 					  KBUILD_MODNAME ".proxy.%u",
-					  ref->adev.id);
+					  ref->proxy_dev->id);
 			if (!key)
 				return -ENOMEM;
 
@@ -511,10 +522,17 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 	return -ENOENT;
 }
 
-static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	struct auxiliary_device *proxy;
+
+	scoped_guard(mutex, &ref->lock) {
+		proxy = ref->proxy_dev;
+		ref->proxy_dev = NULL;
+	}
+
+	auxiliary_device_delete(proxy);
+	auxiliary_device_uninit(proxy);
 }
 
 static void gpio_shared_teardown_entry(struct gpio_device *gdev,
@@ -534,7 +552,7 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 			ref->lookup = NULL;
 		}
 
-		gpio_shared_remove_adev(&ref->adev);
+		gpio_shared_remove_proxy_dev(ref);
 	}
 }
 
@@ -588,7 +606,7 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 			 ref->con_id ?: "(none)");
 
-		ret = gpio_shared_make_adev(gdev, entry, ref);
+		ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 		if (ret)
 			goto err_out;
 	}
@@ -598,7 +616,7 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 err_out:
 	gpiod_free_commit(desc);
 	list_for_each_entry_continue_reverse(ref, &entry->refs, list)
-		gpio_shared_remove_adev(&ref->adev);
+		gpio_shared_remove_proxy_dev(ref);
 
 	return ret;
 }
@@ -619,7 +637,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			if (ref->proxy_dev && gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -756,7 +774,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

