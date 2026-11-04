Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788702;
	b=r9gP/77HVYmjBQrigl+iarre2wF8lmIEnZn0vHwQHxI3mn3QueMzh36XA8+xAZO9J66O
	 NltZ+O98Li2WY6ArKOwgnujkZ4w9JsQi73I6M4fjBwo8BpHEjAoxLySg13nBdRB5VsIZm
	 7Luht99bekCcFDXf8fi4N3K2o/9czvPYVe7CoDaFfvNDXbCi7NdClm1pHsggsS8ub+dTS
	 e1UzUrEPpHZl2yDrCjKkhOAcMeip2r5SnlpF6xSuQR/U92BJimc/o695beXu1ApuJejW+
	 Pip/nuRqC6cSBa5qR/IPEs6gfKpJOE/n2fRW+2obBE/4p6FCAc1PgTg1vtPv+WgA19g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5RYDMyWIvDWHXpulkX0r+TT2+36MfHzUYVRBJn+WEvo=;
	b=A4GpurKLlSxErbNFtixzMxD+QDek+u0NBZnSxNrWbXOtfqdHffb7BlpWQtrEUoBKXXw6
	 CoPeeUvF2+ZQng1vVsr9WZvLxGBvyne3V3tfpMfeurTegm96nmj49HiWaoyAcjPEqP5LI
	 PnSQ1fr7HSFj5AX9e8F5/k9j2blHFVc5AhJyPA57IFQIMwD/Io5BqBQ56eegt1Chd1IRZ
	 XBkkRXJ89iIqL5LyctMy6WjLdSOfY9JbLlO/XqtBafj6dKIKPK2fjMYg3rIeoCdhKO25B
	 w+GAQnOAdf2M+d/6DAdsE0PW2fPAyow+6IKeiKvU5ear4R9v2F2PQcQZguVgngW9NMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFWCcGlL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXQlO9Ix;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F5B606A33C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 10:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F5B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFWCcGlL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXQlO9Ix
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KZ4Q1874561
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 10:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RYDMyWIvDWHXpulkX0r+TT2+36MfHzUYVRBJn+WEvo=; b=kFWCcGlLKrgmTcPV
	lyTb+uihxB9GLLYLojwz8jsDGIFTWyysD1ul7OJ1cnfkmvyayJ4/W6XkVjHq8ZZb
	NY4jXSuraBOaEHIXxiaxroBDKCJdPmJMaYvkhWykGx55Zw4D+0yXxLWFuBoY16mJ
	Ba2oKQG/Ho/0PxJHBZ5YP0/JlLIQ06ju0CztdkOPnFSfnHlH2V+w0I8EjGNAbg7f
	Mhr2j1/fu8YReE3vTYouRA/THkGfmGkkQZHYgScrtPw0KYzsmq00+9u7gmFh02Nr
	fSbD3wgJw6anpPe5zntniAHt70e8yeTCdftFTDl/u5ipMn5sdmQl3c96xRe5aUJE
	5N4JTQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mudn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 10:38:21 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c15deb3794so95886137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 02:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788700; x=1794393500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RYDMyWIvDWHXpulkX0r+TT2+36MfHzUYVRBJn+WEvo=;
        b=DXQlO9Ixf5MaxB4Nk5/UzinqSZGfjBhcIsx5+MwmoEphUppYoIv9YLBYsWwsSt9n4R
         R/RKpaocVo5ZvJ1I26KwxLnHF7ONgfIYW+XdP/MDMdp12QAWuhW/Kp1MXZjVl/Ay4d0T
         oq5C3m2j8YbHIBSQxTnJhWmv7eutzODEE0BUtQQ4EWAAkgwXaccKsk/q7qtdC7P7wmY6
         clV+F3ro+V+FYfTBXMKTYdQKQj+eslxmlFi23iUWCCZasAPrIOXvK+/JGa5/qBx7BbL/
         pPjagCvFQ0dyw4ULrz462nEP8wv+FUVdppyvEEF+c+Muz+uvk6i2qBbBTHbW2NjAYhLC
         LlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788700; x=1794393500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RYDMyWIvDWHXpulkX0r+TT2+36MfHzUYVRBJn+WEvo=;
        b=hIJyq3abfiDHvaHiZFP4u3YqHGYVFgH0MFULlnk/sz4D9YYTF0J/2+E2orKVZGtqNO
         iVY4z3IrxfLLHEjmmzfBBCTdbXZhJSez5DjOitjkhDUi/CRBKTBW71VwqnnpCUtq+jZy
         QJKNPJgFRsoiZKojBnJSGUPq3zMDYtVcFEE3CNdXmzH+sPMDBNddzs4+tnSNHbKoHHT+
         ZhA7hzLmXTlLc8fzWomdOzAoAgPLTtzgVvFBOo4cxvChF5hkSKG5ZqN6S50k0ej+gf2J
         delaeb2uw3geOZeYewYg+W7laSyhtoYNwU/aIvV/f5Z7kRiPJy5KVqfg63ebrpaVuhzl
         bqeQ==
X-Gm-Message-State: APuU4Z8dOFgBOG3JQ+0O1Zx/U0q+IUfCEeY62jICyzMn1jdjNVv/BpgX
	Jo4tbVtILhKZb0bVrsRNufPRfqAjOaRNlcbFy04LOwMP+iLfkjd+u1mzvK7WUOdB3ZaDVANgFOP
	bOI00kgPqvwBvbUN2PHZW3vQilqwnlZDk4HelMh1LjLRNiuZLiRrh1GzipRt/BB7k7QTU
X-Gm-Gg: AYBFou2PL6mZiRxK7xV3egjP8PUL4sv5ixtWFYpJRTeF7RFIbz6SWOtoHYhD2VqbKxc
	T94oyci+XchSl71BRDyDGhGPekwi6u5jDUfzwZkOgO2fIh1CDAspfpQ6H4BOCUG9wGugR73l9Ao
	DJ0KzyFWN0Rh3GN1Dg5Zx1OxETvW+S7sfLVwqToKYvgUuNhYzoqLy6OWca/5dWF6T/rGwgR83nl
	78q685jB5nmoXdONjIlsK+rajRU3HlzvOdsu78SkObSoSZYLOHChnQ8WlNb/mNIUMFctUyUtoHO
	dOl7dAvXWhH9QEDMg5k578x0SZZw7zL93Sl+5I2eCWFYS+Cn2GTuXqG5NdQWa15GfVTkREOSnvy
	19jHpPwJatYhi67WP/RnlTJD9uRzC3fwUV9q+WXWFarmzFjbCWOShjE+NpyeHQv1HltKvMfIzct
	MlpQ==
X-Received: by 2002:a05:6102:4493:b0:7cb:bb33:8412 with SMTP id ada2fe7eead31-7d072552d95mr5297520137.10.1793788700229;
        Wed, 04 Nov 2026 02:38:20 -0800 (PST)
X-Received: by 2002:a05:6102:4493:b0:7cb:bb33:8412 with SMTP id ada2fe7eead31-7d072552d95mr5297510137.10.1793788699703;
        Wed, 04 Nov 2026 02:38:19 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:38:11 +0100
Subject: [PATCH v11 4/5] gpio: shared: detach the proxy device from struct
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
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-4-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6269;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oS8Wea8tAKoUySXn3SQwqrzDeA3aYvYl2VhOi30LNKw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsSacQXfDkiWcnPa+a2X3KgiQV3Pl9JSBe3N
 iyBGgseTw2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEgAKCRAFnS7L/zaE
 w+Y7D/4jfK0XBdP+4N6/mdC3fjnp9eorlOhO52EI4OTp53v/HbZFkEIO96bbCQt+cFZrS7KLdbV
 MmGQLyMXOqLKtvWx2V8NCcVcqC0Ov5OQjfIVNDlzGfiJhp2g+5hX90S6/+B/LhpA5tBJ5wQ2t6t
 bcHKbc5NRu5kLvtOEo+mP+xaCvHZDr3P+cklEERpLtnkmX+PIAbsDTmA2UKHSbswQvkUt66zM7k
 DYsVDKoaMmylWPZVHzQjWWdBPiKPQzSuaodF3eQ1mTKyjpSDElROMXUs+m0flud7ZvZvEHVfTYR
 ypwZd+rQQpgy+UT6aBLmCr8vcxXSODcjuUuBAbOJKSz30etXUm3smbWzpOLoMPK4hpjhzcTIe9+
 U75fxQv6TLz5idLmPMGrdv9EwjcuygM5KLawRDsWv81lUKX7SDHzZhK5kNoXqa57kHJRbUDxW/g
 oMXBFCvirYLHiPazRxEdBgBI9Uys17Tjd5XoLaPeoKsKt4HJ+0HxUjjRonUNPPVubrEJPepK/4z
 BQPih01j+Bn1Vi/BZECn/7jt1Zu685VJG7SeK4ZTZqLRqglCGWlVezjuhQurYW4DnfzG0ZSGjgd
 sIaD+ODbjzjlPC8svJ45zBUvf34DwYVtgfs8fcyVKoEzbrV6zlKoUzUcfU2GjnFw9qwzRDPwR0q
 4oUFgj99LhJiUDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: sdjMUHhah0h3OHDaUAw54HwgrWTisn-L
X-Proofpoint-ORIG-GUID: sdjMUHhah0h3OHDaUAw54HwgrWTisn-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX6CKsSaxT96mG
 rJ4CbIQzBbGiXrAuxiIeEvw0Z/QQ65zHmC4JOLDoSIG2IIOMax9cPG2GfeGc3Hc6fHBvXX8Nq5i
 FEzx/8O4t0YJt+oBMymHpLvN6nHR42/F5/YRtjMaRkP3gsVC5GnwcnKbAPs/8rSH80V8GUlAF5R
 5aHNPm2EtJ8ACf5eKzZwAkSPEv5/dI2OiP1wSrF283itbESvd+EvQz1h6FS/tBI8HCwNdVLFLTP
 R/xZ3OGsp0TgEwTFwDNikEzTwfbEUazRP1P/sju6ey0xTSmg/wNVnwt1a0Tr0BMY1wdmrPkAo97
 z38eWCJulUGlJu8Ecwj/N2kC0EKfn1qPm1egJuTfbTX5oqtpfSL4QBy4qTEoTx0pvn280Yg5IwC
 EA5fyES6ggsr+VdSz/odeP40FgUSWSnqFtfxx9xQsnGdVrqNYeNCv8wrQlgwyMN3yLm9EwNfFE/
 wtwS5gnNee+l57LZ84Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfXzHsOtwxN8xrc
 gMmJ8t2/vqOJhyHNkucczwWY2lA5r25FauBj2k5mfANH7MCI5un+TWJppz8TKD++moyK5ZusVua
 yqInyp9xjVWic1cC2coAbb+5AEgXqx0=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb0b1d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=nd_FmhSvACMRRlF81YkA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040042

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
 drivers/gpio/gpiolib-shared.c | 71 +++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6b183864933870e54780715c4dd9179faf800d09..7270a861bb5d787d41b7e2f055d707415774256f 100644
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
 
@@ -588,11 +606,11 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 			 ref->con_id ?: "(none)");
 
-		ret = gpio_shared_make_adev(gdev, entry, ref);
+		ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 		if (ret) {
 			gpiod_free_commit(desc);
 			list_for_each_entry_continue_reverse(ref, &entry->refs, list)
-				gpio_shared_remove_adev(&ref->adev);
+				gpio_shared_remove_proxy_dev(ref);
 
 			return ret;
 		}
@@ -617,7 +635,9 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			guard(mutex)(&ref->lock);
+
+			if (ref->proxy_dev && gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -752,7 +772,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

