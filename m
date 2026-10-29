Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290966;
	b=DwSKzEbi3ktvfIPhZkcfwSHij+pt+d1PItVA04FocvwvoI2ZFRPGEBqSK3/KncnPQNUf
	 YzugKCbaJqWyYtCTLSATRO4ZjIwztJPKnCQbfnG8bIq2XpRN6Xncvq1Tpnwv+Lyd36E5A
	 l1jfVjdPA9tUw7wM8FGZXVb/mE7dSCfpusm3mPBPn2QNGC2K0/vIi/Q3B0U24kRHnvwdC
	 bPsGw2zMWSHs1bouRsJQ4A70CQ+5IMOgHk0lwhxmXJHlFGBCB30JF8HTQpPEJRky4+u+g
	 SczXn92T+eLFGwu+KBjuaVQ1v9fjRD8USdzvz2vCtHHdkJFiR8lVKze2ZTDUypiNnvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
	b=d9lVMrBtPb970gtBE84TQcsuv4nir3ammAQC99UdVW9W/BYG3hWWF0uHBAVO7y9rq3Ty
	 B9pLYCLTjH6Lmca5dUzE9b5tUni7cK6/REl0uCf1bc7FKVmcYqnTfw7bqbKV40BM4zBBN
	 vFQ4PzCUyHmtLDzt7xfl511ueBT579m86Fntg/+QsAWNAFqistXkI9EALiNK2gLDp8Hlj
	 MwWvaP73vYTUkOR9go0Mo1X6nuywXO52NiLAJyIDAiVOjFbOR9EK/Q5Yk0g7NOVrz4SWr
	 +5Pc5QR9i6QvCqFOTRR+NyJo9bbEMlRyDRaHgRb9S2ceuoGXopwK1wkZkxN33Y+WKoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YhLMs4QY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RKyQPisq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9182860A2600
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9182860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YhLMs4QY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RKyQPisq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGF5px053160
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=; b=YhLMs4QYMkk84PXE
	ujN1T9q0pNInevXnOwHmFJaJDM4GBxYPwv9ApuXWOrXAsQT4UDSoSpfe0XD7o/V0
	Wci4/ZvRI+MPuukSqsks3hp09aQbd/HWtkAy0DCFn0Cehl/VUEG/xCkZ5zjAF/kl
	IFaUrg451t1pyPi+gAgzjMbNqlhLSs8RQSHmGDZONhbY59mVauTh07B+dVp623KD
	wrFj24iBK/t5Kqd99UYmeqfXRO7ttWo8xbAL3bktV0nfL/aRC7aXJXNntJhYwpRE
	gHzJLTk44d/d2i8mxr46BgqDNjgRMOLFEyicMPVmrkoVnBFsMGRxKp+JZl8O8Jty
	zPaxag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nc0nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so436622585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793290964; x=1793895764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
        b=RKyQPisqcolWS9iNUi1qGrHIjONY1c76Ohki6YNiswPW5v9c02Jzpq4BiCaJ1FymG7
         fLf2HbymWgn9DkGfxqdPGUR7jujxRBe+sdmm8r7xlo7XVU2vJsb9Hnc9iajnvcH5J7c+
         RaRt9CpuaseISF1lxfB7qbAPAe9WO2Yqx2WsLdREkaKMzbugKXnN4Mhg7LMsZZVZx775
         2MKZNxYNxHTpQ4uju17hvqU/Rg5PoP/7zeKtwDBhq9gn+yE978DtBtXkeHOPLfyjroYI
         ZmxyekmRImIy9xcRoWi2ZoDrTv7ZrT8hK5W9z1lYN34Uf/MRqJNiMmDQjGTjv3bCc6Kj
         nHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290964; x=1793895764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
        b=GR+0j94wYZVxgPGWVPK2GwW3bjx/gD8kwa0COKor1AGEQ8tKgZpZnZCZxjOkw4jjaf
         vQfCRXC0ahC6fxlld8wa44RL3ClTzTgbrNbgxIcD91KcewfaiAoOTjDahGcaTz06k5rN
         VRGLSNsK7IxJWgcDINVIWFPpcVG7g/LTXiFXMGVgRZpCNRvgTWOwr3ojGQ5A7jX1mlyo
         XtZUp67FkQ1sUpBLacQnqHmx5TCKWd59hz5lqSyl8jOA3AdGpadU0atv22wkutsRkBMb
         B6cEZ2LdjGVUk+/kfwhJkgMtRuUrKKCWHShsTDR+7BuhFJbQj8ygrSZH1n2LRmGkhPNN
         Wztg==
X-Gm-Message-State: AFq9FYKkzR/huu/XSa/dCVEkxBoblSHBe5xyE91Di7zUoY3ze4/hgAtD
	7ZYumQPVlrGgkS5bUab27/iRcaDhoopoq8l3g7DepHVHlNlDkHjaRdEaHh909Su88NmTumqZy4v
	29Kv9yYCoaxLJkKizMhi6uSb7n7ARfoMhdoV7sylMX8bIoKhnmpraAaQiVBN8BLxy8XWrga+gWT
	D+
X-Gm-Gg: AYBFou05JzD3GhYBAJXLr2qhX+/FDDpBuZTHgdiNEQH8SMNKe6/sk8NAbXDu8u0uvnA
	5gnb82hR/Lyc0Jcwrh4tNkFhtqjnHDCHu9y6s4nr/rORMlF/uBQfEHHgxpq6agURDw2tZeI0Jki
	KjHCjXto6utOUbX0p61VWVhRYvWKPYG/WcQvHe0ldHVm1XSauAehl4X8C7e/hKRpr+SZh5JOtcO
	M8fToDuBUne6PcQ5THuOUsmkmPQ3zsbnlBbZ4FUC6vQFQYVH/yYDzjQUGdO9pcJ1GECWHAVfMWs
	RKPmnR+m0cb+SkDRbqn9tfKk3E1ftdWdgS2jwOq7pWfyrL/9J/wnd+94QueiyZb3fzfAsa7wAFg
	qJaHsi14ZRD643VZdfazaHPiyluk13HR0du2odd8hAlyJfjssPyi7rEh0XG7WWnzHBTkd+rtJqu
	D68A==
X-Received: by 2002:a05:620a:2681:b0:93e:d364:c9fc with SMTP id af79cd13be357-9440896dc2fmr959215685a.5.1793290963631;
        Thu, 29 Oct 2026 09:22:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2681:b0:93e:d364:c9fc with SMTP id af79cd13be357-9440896dc2fmr959210385a.5.1793290962934;
        Thu, 29 Oct 2026 09:22:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm93868605e9.2.2026.10.29.09.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:22:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:22:33 +0100
Subject: [PATCH v8 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261029-gpio-shared-fwnode-lookup-v8-2-d15d75cd560f@oss.qualcomm.com>
References: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
In-Reply-To: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4264;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uuM5n1/ji5JC6EPQ7kRmGdBjzEkAbSpadsEf1ipKIMs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq43LMNInes7WMSDlOJdEiBIgbf9BfhO89VLpUH
 Z9Gf504vgOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauNyzAAKCRAFnS7L/zaE
 w5SOD/9loXv0NoNHt0bHBzStSOKV3aAUAiP4R4gPpWvZzkwV/mLQlx27Q9iFE4hDyE439mstcos
 GfEPmYGI1Z9XPv4MlLSxnPWcro/jURv6B6llYzK78lKADEvtobbsDTSGckx926VwJaZ2ioYV8Jd
 6jDOlqfdfvmy7P14M4aSsaWcclsRhDnlj14u1Ep9yD3+fvvujdd2twAO1Tb920ruoYDFXY1gvQ9
 rE4SU6ezlsE0WkOtXgCC3fb9uoQq9seedaTn07FA3rgpRETWaloUo0E6+ss4Gyz44nRIAp4bGGE
 yh64WabWMtfxk7s3SdH18qoahePSBJnNIUUisAGjgZv8EIM5CLFrCRkG2cYwBD3B6pSGBb2vIUJ
 S3D3ZW0qMo7uETwZh2l8RLyeevy89ScYA74K+E/rZqxDw6WuMjy5buRSGRoan6MSJq7o0/RgZ8F
 WrJadL0Beh0XsPDZwce6AUhx9CsPwJD6ZtG6g0sOoQ+jsEI8+ti8kPj7KlWdX2WAYGtQBDF5xzG
 mymveFrIaOfwXV3sd8E2xnRy1QVKzLkza8T7tn3NiGXeFPxQz1IYy0s9hJxayJUo65uNnFI3OKL
 4F8QgeB0uz6mYY1Ub2HRlISaGK2c9a844vEoF8F8M7Hf+StuaIcrI2Wqmoghi10zb8xhxlNuKwu
 GAeb5DAnV9EisQQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: KeT_0xYGrWTwCX7gm0Fcdw_tGZIUPOdx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX8eX7BRybjy0g
 dSQQO+iF4UnCrb0EQaBpUomqrqsf4aFYtvEUX1970NGQGkL82IwdsJq916VVFhIMNGYgBa8wSyA
 7JAO2/PPiilkUgDCverOzHr8XsXXKKWnKdHwQSsoDS3HjBtvu6AB5lP9bbW/2yVSzJkAiiI1jgA
 oPiQ5mm5FP9NQQM3QNQmf0jiXqSU3uz+RwKFMMZzvHnikLf2Jfh4mC94bXFmH5+WVufN2hK6Kea
 /LCWoEagt6s1dpyECeDbACdC7v8H3Lri+4zSMvxRj6whsP/cSmhUxx6zbBfYI4b2eQVmws485i+
 ofJ1mqNfItRYGNMX61jaq5iGrwqW/9gxUbPzzyczi8T2gJ8RiQZm1j/ggVIT2defbKX5HehxNmS
 ycebLaAEQEuRcHx/IbQCfTTB3UaEwmLPy0epHVrkVRDuPlLiQlr5unNeYbdzX0Js8gxOVSEl580
 goJbTra8alWyOM51xuQ==
X-Proofpoint-GUID: KeT_0xYGrWTwCX7gm0Fcdw_tGZIUPOdx
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae372d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXzymeVwTJWok6
 ihR4utcL95/qokkILJu7lOhZ4pbijsWzugehy4He+iQLlZPrIygqxasYigLc+aAZtrshut1gXE3
 qQIqqRVGBC7c2od5dVL7w/L6MF6ajPc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290064

Move the per-entry part of gpiochip_setup_shared() into
gpio_shared_setup_entry(). This is a preparation for making the setup
all-or-nothing, which requires handling the failure of a single entry
in isolation. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 112 ++++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 64bb450f0a8461d214a45aa97e2474ff0d1857ce..47b434db72f1ebd35ec36ebdb35f30809f4522f2 100644
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
+			 * This is the earliest that we can tranlate the
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

