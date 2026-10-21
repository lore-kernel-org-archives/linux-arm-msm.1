Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592660;
	b=V/TAQHxeSk8ZExxth/aUTf7kDu/PQgtAzNSJa91dqueT+DyG2efmgN6GQPwCSZMtNPGW
	 lVX/L9MiK11D9TQdEhfj/SNwyf+teEO+YpdVb0Hzdn670j2lexbfa3yl7dKuLeE059p/h
	 EruGK30owjHIuJz9T507JjdyqC/bQiz2peh6rSpbpqJj6JHsnK1lMTwGLrIJGt+NzAKK7
	 0Tuw1JKJYVEd9dwep8Q1GZLDCn17rmV6e6YkAAFM8hd20yDyxHcEGcshIq889HrEpLni/
	 e9mEdQ0CBKKM6nYFTmeNVFarOss5b7iPJ8RiaoOMjnmMxlFiywYOF2+epKVexN5V4Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
	b=ytzGsd3Dil0HrBPlmfqQ7q+YYa4h0Yb7g8I1fTOK6mkZJqRs23H84JaevvUkCCtByT00
	 pxPBhnN9xtdjoD5Rcw2rGLbMUjeQUBNQ6S2gx7NEye/c9qt5XXQoCp6SW3uZlHm9mFm71
	 5Yc42cQWmT7HVYRs/WjH7UUA+erc9OsfAXJk3CLfyHHO8AxTwUc/+O5oODvKNf+s1Zr19
	 JLIsYVrRwTRhyVXgPcchwRxzkHq4nBoY74HIC+vGcaGx59MJmwsbXPllgbSbd8H6rKi09
	 TLgLCC2piSvRp0nDV8hXvhnl//OuvYBNUHyZqIEAwkrIJwSI3DaKhhsurhA83t3GzDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lj7pPRdg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Opiii4UU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2353560A2624
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2353560A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lj7pPRdg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Opiii4UU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFDfJ1313692
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=; b=Lj7pPRdg6/l4jXtY
	+xQWggV3ZuLswnslJYWksBhcAa21McnlRZi/uEQi4nPV353Wp2apNpGtzcFnU83n
	/SbWep4e6Fx4MDSq6AFM5FkvjV+4ivRrXrbXhwlhUZee6kgTab2LNU2UHxTekhYo
	aEWZbNyYCwiqX8x7o6KvxySCPszVVNjWNZd3ql1SfvMGQ3DVCo9Z0QqGkNHt+PXX
	x3kM7uSG6CQ2O9s+mR8v6hCLQSvx2hJM2mNOmbOKmPabA33PRKreu/BuFEszlGYK
	ndnjV8eGDc2crcKVvaxJxadcFx8X7KrH9tr3Jw28KihyK7gJOXANPBjnJJBGwK+k
	o45Alw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03k5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso688190241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592653; x=1793197453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
        b=Opiii4UUX0a+CW1Avdv27wYZZqHy4vkKuuRMfPe0ElBcbKjS+UVcnwZ1KpHWH/FEC+
         WFeyvoFvRaKtZ9V+9AcTWzelCQPVnaZqOQ0OeNRbiVd/nsp6Behi3idfq5Q15YWHDl2H
         ijDL/PizjmJl3kMdb3SgmnZnJZcDKUqTLbA9ICfJr8zsWh9K5dF8qAoEgTBexI4U3qYR
         JO4C/Gqko4LW0LXxMaq4JVK4SIEhpvWfQIRxapeDuVmgYQoc2sUCvTasAB5vGY4llc3t
         UilOhTPRRonRB7v9G3Xf4RDJtChUzKiN+lCI0QVFWzvzR/YsUIu/pRAIthI12uudJA0r
         e9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592653; x=1793197453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
        b=F6/2KqpQ1vv07kQ4Qx/c6rKZpeLFwN20fkTQvFu12ffuFsSe1kzJ/QHualCVb8urDL
         ia+sdRY6FhiPBnZGa9oMvNvgqgeGi8u0yLayH1tOxePwBFDEjqSfS+0g+sOgssvHXbbQ
         RTEO803OxmrWQfuwgpB3c4LXU8x3JVSK8yahhKAQ2gqjErRfGYJOUkMIbaWgP2zjQn7Z
         59b5LPP7u/WGWV1D/3YaWYnzadkftJ/7F9uDj2bUvq41WkD5znfX8IapT/Lx0e5JSDL9
         xfbRjyjG2l328gn5q+1VMFPj0/iBB0iFJDCHVOQRdRafq4eRkrR/pjDlHmD0DoDbZ6A4
         Duog==
X-Gm-Message-State: AFq9FYIPpVsQLyHFIinNLnBQxPNska8lu7lPzjeAERxQZYORwvomBlnf
	s8NDQ3Iqp4guUNVphoCjGHJgtfnwG34gu+uieapc52uGRRYIcyVAubl8yimAzZMp1HtufTTsV4D
	sQJhhOJXyIvoewWtW3VVhtnzgVRdNShrJ/8q6gOUehp+09UQ5G1j01o48LmxU0Iwwoyn5
X-Gm-Gg: AYBFou2Ry85G0VP4e/E/6G+K61/kx2ORz0+HigZ5XJ8pqFFjZf56wRJRyx7TuJACZ7P
	XdDH9Ey/0nrW2YAZURHOHoGu5btKeylzJ58BLG0VGyVqtJRcH9H2FfHenvBhzN+wQUg7pOFMBDY
	6a/wneloF3yKLWVtUiMuxWOYswBkO9IhzZ/9xK3TSGDmCnu5triuVFsQ0fkPoT+ZYKnr8piEO72
	9Z5soPUEyXhJvJGbS8/0xlGJ6qnpApcEFeClOuoU04+WOyIHAy+3vqDH0TXc0Drw8HlLlywuera
	43bPibC1LyAijhU8eeDiAzEFW3j/mrS41Bx31lWTMtNW+j5dN2a7K2ml2Vrz5qSYDf09+Nbr8Eu
	uBso+zmeDwoTzsrmrNf7z0Yc+htlh
X-Received: by 2002:a05:6102:418d:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7cc92753c77mr855485137.36.1792592653170;
        Wed, 21 Oct 2026 07:24:13 -0700 (PDT)
X-Received: by 2002:a05:6102:418d:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7cc92753c77mr855456137.36.1792592652638;
        Wed, 21 Oct 2026 07:24:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:24:00 +0200
Subject: [PATCH v6 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-2-6af7d8eefd25@oss.qualcomm.com>
References: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
In-Reply-To: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4264;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uuM5n1/ji5JC6EPQ7kRmGdBjzEkAbSpadsEf1ipKIMs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsGZKhc89cQ/LqtfxZCVpyusVYyEHkYteSbU
 DbLKPLh8UyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLBgAKCRAFnS7L/zaE
 w2XxEACvaawuFOIfyN+W1UrkqEZRKjc4vQPqyEp+v9K/mcV4cerTwfK7bAVramWn/hY6GjaZW3a
 pMevNfpaOp8ZUPRtcysmU5pZDaVM7Aoh38BQXW6TOfOGAH2aSR2uR0dnQSjRlcdwCiZRS05TMXG
 BD7a0Js3m8fOABEAishX0IE9fikib4m2H5HmUUcePA8lLNDF1VXWG4ziJCmExMF78xv/emoMigC
 m+2OVlHY8+8hUukJb6Lthf3E8/S3ZkDxRMrTdkO7sF7PC0EEmnnHSAw+y9BibaPITZnuFYbkx+L
 M+HxaTdMVmsPUWDYKMqDtotpg5CEw4/QN4pfsVBl/wr3KuGTndEC6eGYgplQeRWpWpSYPyZN7pG
 9zYQ5iAY2h6RW9EagULvbMVk/B3dEZSUQ2zN5epbGnsU7j7udNDUBB6yAZx3JcsalxwZZJ5Na5S
 3/jMkZiywRX3KVA3RMCQWalDh/ybnaoH5LyyUpD0BthxSnEczn6v9X3blx0nlN4H6tuI4qevo8h
 5agsbGP/3Ti0PoLljnwmTdrPJ8EHq3Ho1krTfVdMINSi2XVdmdDXss1rPZwHCHRDXND/+GFe5sK
 dSlxfPvlo+d23PRmohe/A8tiUdg9lWMSrqZPavyOQNj92epbmXuYfDBp9v8qqnKSDt9S6ZEBbRT
 PdBsc7I5tfX1+rA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8cb0d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXy6KkGfdNFWVe
 aJoSyRAVPLhq8k6aSn45lFhaH29SjjGvfDzF/Sju6koQt7z1ovBqEWBHJAuZU9X2J1H+bD8sewg
 IrKigVqXWfQmbMJdtnjTgZqd0y6kjs8OUtBL/dOuR7Cy4tu6BdRuHt4+606BXduaAjg3kFH/79O
 3vjxQtSVOXwDh37M0bZnNrcfXfFHOFn2e3qh/dkTnQkKd4UTXJMTW2D28cq9Oi2ROk+wQPGMTPC
 Pyj48eLS5xwYB3xu0BLAKBxGQKkIDG6opAhV9Fbg5qFIgKWZIGItCBi2yLqoa3MO2B//Ke/jf45
 X5wEsYZx+LDqV/ezuq108/ciqhlaZMH3Hkn2ckshZdFt62ni67iknkSGR+7Djbzg5nVv9pH8ZU9
 adt6+oK710g2oo0h/BmlnWexeG7IVpQEhaX/ZdprVoKW+JTP7mS4FRLYBHcQn0QF+IXFxwKd2FN
 XQ6XokdoG5ZGvxAA+RA==
X-Proofpoint-ORIG-GUID: 4G9acZ9SZkXsxYdMxV-Ir65J6_-dL0F2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXzKrntyALugBU
 tzwMYt38PGOT6QRhkQEsiMTmc2sGNaBW4ZEab+cJDPDqEcI/+fms0GhapFqekk3O7b0sq/qTA7p
 efsTy9tGdYhlIpM/G1ME/4aTAUMLZC8=
X-Proofpoint-GUID: 4G9acZ9SZkXsxYdMxV-Ir65J6_-dL0F2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

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

