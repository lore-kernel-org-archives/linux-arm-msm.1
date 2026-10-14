Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02034FE2F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970735; cv=none; b=ivxkKkLib5yU3MNzm3/nch4jDb5Tra85N4Ldn/2OrlR793DDWh30ke8OwXaSzrw06s+widcnCKzpZiPKfxb9J+VPpsOMdzxaSiP0vm7J+qDn2L72+HoTJH/uRn9PdlA4CWnqurIo6t8XvsIhlwmUBqajBa7NWcWGNnu2ZvKgh9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970735; c=relaxed/simple;
	bh=wRimfFBhTdHNg2yoeP8yhxO3Fx6yZZtgreGAqNEyEhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5H+SqoB+tzvVWZBu/hdSaQWYp2wGRpv8SGpuXuQ6L4PvQ5MOWE1pjbH1EKUDEBk081j+qQ/mZfdF+FFjADK6dN0BUxKowF44nsL6CF/SIV3rrnuxmasEeo/ewaucPwDwkG8Mys0bJ1l/6dqCrjej+/wOXtGhkXk5FUpfkxY5Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xp1Mj7lc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XY1U9Bol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xp1Mj7lc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XY1U9Bol"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E686Jg2515943
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HApafeMN+yFyGCXa9NtRihlow3+PpaBbOz8/YN3Hoes=; b=Xp1Mj7lcAUasqmGD
	zoAw/V6U0rSTbi5bnD4DKj7FT0ZwIe6E92D6CAY6AnS4E5AHZAqdal8pSG4WddWV
	+L7YonV/foz1P4KfLqHzONkZJgRBDmfESVrgBb+0CyqiwGM0W5DSVfuB0v+mJn3A
	LqNt3jzHxW6aC2UjxfpgGSEoKXina159P2GlkM8zez9C4rRWZvhv7xtyKuYiQZAB
	taDs+51w/2p26Qu0oEb/Cu6WqHM1WCrXE9lRo0mwcY+hXB3C3md4FA1J6DJzUytF
	Z96QB3USN7yAo2Y1Dxv8XRMOPcEU+W1oTwTumaqO+p30WmCwAaFEEbL4AaGIVNNA
	pB8CFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4708vhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:38:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so1196967185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791970731; x=1792575531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HApafeMN+yFyGCXa9NtRihlow3+PpaBbOz8/YN3Hoes=;
        b=XY1U9BolzRdb/I9y51REpQna3l5Nv2so58YPze8mr36WDb1+KWlxqldZgFMtSEhsnu
         1veiQaSH5pOzYKImiyqoufbPYBzNdO202nFvjPavnvizBNFVrxcK28EiCjBHuSxD3VEH
         DqM5g6epi4LkJgsQe7ZbluEnI3D9fICDhZ9po8xCCAcy7CnC+owUTQ3OZMb71LRl4yjv
         AJkevgmpU8EK0e8G2ICslJXHWOXAp//IlWghW+OzWwI6eGjYJOjGOypVh3zgqKvNSrPc
         uNmaABnjrrLSV9WB+uofsDYUfhrHRJBE2qTDt+UrAU1QS00RL+AHoqIahXAgj85Fk4eS
         zkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970731; x=1792575531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HApafeMN+yFyGCXa9NtRihlow3+PpaBbOz8/YN3Hoes=;
        b=Y6MnUdPg2REZA+HITPay5BWPHuUkz0uSVsv67i4t9A2OV25tZ3mzr+aLtpiQXPCWzm
         orBaUsV6hR65f13LA9NHWTLb8+j/cDiIWwW3F+7ZH5edSndQTV4Vg6zwH0dB8QD54Yo7
         2YOLzVOxZHFJCupylXLg77Fd8cNdltoyNeDMH8R9E1EEyFoihLmywCLI1g85ZzoYCm1a
         8cNagagEuv7X0ZKrMRK6YREh4VvyEEply9dnKro0HB+cLy9jwSrCAI07U+xT+iDSqtK5
         rIzC37VK0MjS9OlHU3OxgkJZY5gxsb8tQXtzrkKP1a1klenrscA5OlmpJNHf+ydqx7j7
         DK2A==
X-Gm-Message-State: AFq9FYJZZdXBvYvAVQxmpE/J89zbdCLZqgAJY8o18LZP5TR6VK0eWw5T
	0osTad0dsr2yJTHXv0ZeFSn6Eze6QNfdxh6cVLV7z4yb5W72NehWww0RZ+1VsSRIw4PLEI3TOWd
	ZdAHCn0VqYo8VlWG29Z1F2Z//2xKKKJ++ukixCZSOtO0s8Ic5brvPj99h5HykLUYGMCyF
X-Gm-Gg: AYBFou2C8pE2wjArIKnYnozodYWx5wBv3txiP1hdrfNEuU7a9M1Au9SP38Cro5YS8xJ
	cehjnr4BSqMKv3VC6lnjMDLEf8lA7zVdP0PpTacBcDvBK5ctmBs4v5nDx19acZhk1UShtVAHY9e
	kWmjDAUkWrHQhjv+myvrd49RumNgVzpw7d0dV2Xc3PI2ByAhFNgsEgaarRHo3d2UIbMHg0bnsaa
	g1KT5ChomxWNLJ1rfEcaMri8lD3DZKJ8d/GoeC/yMKfpZY53RxzSQNkAg/fdKG/Oqqh9zhJ/2xB
	SfEsI5fKPNylBBHjaqun2G58J1lAWIGG1TdGZR+QQ5dn9y82e1rCxjic2EufD4gpec+BKvh9D7C
	b1urj6ko7gNzMoTrpWrVAdZHM3Q22
X-Received: by 2002:a05:620a:3910:b0:93e:f9ba:690f with SMTP id af79cd13be357-93ef9ba7a6emr674532285a.73.1791970730736;
        Wed, 14 Oct 2026 02:38:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3910:b0:93e:f9ba:690f with SMTP id af79cd13be357-93ef9ba7a6emr674529985a.73.1791970730144;
        Wed, 14 Oct 2026 02:38:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4b9ea1csm19510655e9.3.2026.10.14.02.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:38:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:38:27 +0200
Subject: [PATCH v4 3/4] gpio: shared: detach the proxy device from struct
 gpio_shared_ref
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-gpio-shared-fwnode-lookup-v4-3-2253ad645fd6@oss.qualcomm.com>
References: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
In-Reply-To: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5943;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wRimfFBhTdHNg2yoeP8yhxO3Fx6yZZtgreGAqNEyEhw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz02el5Sj1Lkk9E04lNKlEcbEswzUAMUTLf85L
 e+aFLVet6GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas9NngAKCRAFnS7L/zaE
 w0UnD/9tsSxPLYSGQNZHh6FCT8urP+UVCM70dME4+Qo5aNXivyTb4f1k2QathWO+iSsrHTBe9AB
 +LPkBlUj9wkjJvwSI5vIdpR+GLLVs/04d1GprTdE7eXg8AHdk4QS5HlJQKJSHtdAgd0a0za5thY
 QWvHDobwoLH10fwowEKu8Z2r8D42Z2Cf25XEcZUqCvthlIBfKCAFBQcKdxRu08bojygf5JjkyO1
 gG2pNUIv9QyvW0rxGURNyXxSA2uJLQse1Mr1anCXhFRKnwO7LtE4uiGNmr9mSZkLWr3mV+EMvAf
 Tzd7PrJVvJ/N8E4YlQKHrUnpY3+XTV10c+5FiBoLjfB1HIsv2l4Emdx3/VfRfVtt8/cek2xDSS3
 fclioqgLRfvVgWveqbBDzvCbUko08EVyTSeM40tuP4wjiZ0V5czU8sfo42F8rX4usQ5Js8TsKod
 FbFJYwRat9Qkb7WrWipEKQbEssoTJ+wowsKADCogk8drQtBiAqtN5eiWlFyvdjQ3J36mnc9/OjB
 2tHliXi7adQBv5GcomtmlalAsO8hHlIhe0Mu33Svy020cMLpNT8PPk1c/cVa7SaFTorFwPbGcGA
 +On8VlyZ+m5cLnha5D6IRBMqxAevpe/F+qjo8t6bz7iDaaCC0QkZcZbDGHzSWF9hdkLVW0VBxo4
 afNop46qDMyPfhQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX6IRQxMCtujC7
 1NmTXDYMKQjDOvBMpGZYXszQUA6c9VA6OQYwgBLp1fq5jVz3alagHLe9EdPhqYU3wSOLowwECJf
 HzhvcQqv/e6cReBtRddLU8yfa5w1caC1u5z62obts7ab5CCMuzZNDcr5SzH49sK/8Jym1fsiy4j
 YkBu5wd73RGh0up7ZF/D4MDqlhDDyHVc3ecG26G+S88t44Eqp+5Qzfi9QADkZ+Zwu0DMap/C4cm
 +JsGl9pht+8esii6yS3ysTykPSG/4yspcn4P3+HSXvNBdxsS6b73hIxaG7dzZuccIIowIcCuPpn
 /hNKijJKaOCnAODRYcHY/V3t9dskhD63K3fXQ1CLvOtLTlAkD6V2BrydSJE4K/NaZyT33mQuh5L
 GksRAGshx5g7hbFnjTdN/ctdWCE95BcUlzCm3IYB+NC1lVirzQj3EjCrbq1UacoXG4sOBY//Qp4
 aGl/cLU+njmQndb38Lw==
X-Proofpoint-GUID: GMxBTxh8ZiFEI5Ei9qn3OkLbB_8MzsGc
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf4dab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7-zWc0oKUx6pH-XSlPsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GMxBTxh8ZiFEI5Ei9qn3OkLbB_8MzsGc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX/7FBWfTGnb5H
 rg2sxRppjyBWKCAC5/inXRq9ia4cEMnxAth2FxRa9dTG6/KvSArsL7v7xv/vBZRX3UerbpG6ODe
 BsPVWunYNnMFIQbnjE9cy85LwIaVu0U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140038

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
 drivers/gpio/gpiolib-shared.c | 61 +++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..a57a2dd5ca00eead40dc79198c94862b5a3d1ee9 100644
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
 
@@ -511,10 +522,11 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 	return -ENOENT;
 }
 
-static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	auxiliary_device_delete(ref->proxy_dev);
+	auxiliary_device_uninit(ref->proxy_dev);
+	ref->proxy_dev = NULL;
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -527,7 +539,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			if (gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -592,7 +604,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 				 ref->con_id ?: "(none)");
 
-			ret = gpio_shared_make_adev(gdev, entry, ref);
+			ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 			if (ret) {
 				gpiod_free_commit(desc);
 				return ret;
@@ -624,7 +636,7 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 				ref->lookup = NULL;
 			}
 
-			gpio_shared_remove_adev(&ref->adev);
+			gpio_shared_remove_proxy_dev(ref);
 		}
 	}
 }
@@ -718,7 +730,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

