Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198690;
	b=YrwuEV6SBvo8Nf9vmf/VrCHnz/ygPU1+vuRcSK7SiO7VKIkI+k4sZjmQxGtYkpGVmlsj
	 pwK5C1a9TTWFjRH6PFELc43WGMAmsDQK99BBzYpggDazSMMKyNjiANSZUz0/i6La7+PuO
	 d9jrj9kmaC8YSIkWuqRPo571Xrh9AeN78L4YHX43ifxuHoeZHuoszY/LCaBGC022UBpop
	 ZKG/pON6pILv6Z1+svchD7S+DvsPknKIrPmslTiK0E+KLZyQ7oo8fzIuE7FmyEaBt9Q5a
	 xsiPyYPsvOGJGqzfhUBUA3rM5Obmu2Y2nJhLkU1PbwDo3rpXN3yYeCkzofbFb1alWlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
	b=RaARW+ITGZgL7tpneCk0y46rO/SilJyWIUcPoei1R8S99+UH9N/55J/q0Vy5xIDyXMt3
	 xvPhUeTcAsMWT1KKYrJ39lW0Zf1p0B69HFzoLqe2HGP4p5y/yodrg+bfKzeWCwy4ZpP/E
	 3A5xenPzfQd5miHNeMbbSI/OciMezSLEvArcw7y6KhaBKl20x28P9FAla9sufe67+L7g+
	 xR6A9tw3BOtpTgC1h6w3X2xsJop6FCsmuNQXDVucqKO8iKpTcUZiMwCnqneAd/4JZx+1r
	 rq6bpz6xXpw/sHNMTyRtHbPHcxDo68hR4Z04pWYB4aQ278a/oxwNQ5UmeBfQQWHrfqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqtSrXl7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfiPJMo5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3308E60A261D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3308E60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqtSrXl7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfiPJMo5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIHD73916341
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=; b=TqtSrXl7wpab9n6s
	Ck/FEYQRFkKcIrLJbX8LuZIGIdBwh6PwIgljPDs+oEDEgdyhS/IdB7ZbXyoOsyNH
	eoXuYBQF31/jbdqbzhMtgoo4fS4D+mg0PxWLKzCMOvI1a+/Og5IU7gqaZjztoKDJ
	sMCbCyXxGyqN+cqVTZcmqMuJJ8PWPfOIuofspWwvor2h5CbpC0wdOjd9h6eFJBjP
	SbHjxUsS0VJaWThYnEstcH0fsbaOUIi79N4obbIjDhtf1x/yJwqdQiTSX6rd1yH8
	vI80SJSwl2RfSp6x7R/eaUD7zb9XcD58wu6/HhWFGfuKjFa9lskPtKEW7nkwmwlG
	HcXMmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngcf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so150057385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198688; x=1793803488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
        b=kfiPJMo5CLiQhQca9qlSfHu/dpiCNYBwZR5/HYIt/3NpkcE7mWj7uk9AbunO3VvylH
         DQPeofMRDck+dRppoYEFVD1qlOh3SgR5e5Vub7MgfLkAhhYrRbe7HvFzQ4bPafGZFNsC
         XIDDDczVo2OQYE3g3X8/rcky45eno6MZpyyHBY/czyMbKp392PI91aDRR9aVDinaCddQ
         6Sf9NpvBcc/XmC+J12y1gKYIMIHHbNvvhpWeVRghgV4kSzoKRi4CtOIrvSVASWgPD5q5
         A4YgqUJ+KX+KQh2Fl3LPuIa0wuv7Yjh4SktzDcNScEoBJrYjmA+nC8J6GY6D+Rmplyjr
         jlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198688; x=1793803488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
        b=zetVBTmIiUM2RtJwMee1yn2Cw7n9oIhMk0p75DZqB8nu0fjWEWO2wDlAAmrXvIIGgu
         4ObqjXm+ezUvOCEkhckSwV7wliC+u0nhtjfRjFy1sd7Mxtzn852BWgR+s0hV36ymMA1D
         ZUkd0RWqo+QnhGA4br0czPMcmvC6HAK6Pjg4CVOmln8hWE7LkOK2N9jlEIUjO4X7UljV
         I1CofPxUpPZkGbTS4OK1onmXTEfexw/eIPavhQqBzQ+4kdnw7KCGphyLPDb/G6zjSguV
         uKNpp6IpRZ42FAU5KtPCMLa0eTYLx4ZXbxW0+Enqn3WQ8RuTlqbQ7hq3S1Ed64LVPIUq
         2CkA==
X-Gm-Message-State: AFq9FYLs+gbetxwoBwf7+4gsPVQcrfPKY9aF9yuL+kxoqjeq5voty7Od
	p8dornexlT22ngKOkKA2m32gEGmPI5XYIRAcQi2/SOX1Dt/Ea23ox6jQVAmahAnKJItfv9NzMRk
	FW1vGomkacdk2GpIS1XN+KB88b+GcwdmVIXE/uSunNv9fnBsqAXeAfPkvVQIcRoMvYUqI
X-Gm-Gg: AYBFou1v5tlXjcUJipFtjJHhDo9X8CgG1YB/FaHDKF+NpxjOPq5MOQld7zb/xEKDe4V
	F40tglEgh/EAZ9xLZaWDKb+MTQJUZsZHxoJTPd/Ci+A4sYiz4q0NQIB/BzKz79Pm3QC8s9nDsHb
	0vN7gEnd1Y2wKRI1hO4vmrOnntZMG21+dR2vzGbnYMyL7BrxHmYiezELMIuC15tuhwClDAAyAZc
	niJqpIyJ56ety5bq5+GTsUSD3ISQDMM7hMEUVruUdOTCsnlL89Y7QSvFVivr8pRhZYJp8bzw8PJ
	Lw5a0fWssMziOhbzH/ddZA08cWudGuyGwa9FI2cXiX0Ajcad3OZ3GOckCr5jREJmU+38BgNjqKD
	Unl7QDhTra7Huzx2hraYMO1wa/UHi0F17oI6TTwBrSzHYzMH9kSiWjsquLHojLk4G84SuaTePBy
	kgew==
X-Received: by 2002:a05:620a:371e:b0:93f:4f87:4f5e with SMTP id af79cd13be357-94408cc1098mr388508785a.72.1793198688222;
        Wed, 28 Oct 2026 07:44:48 -0700 (PDT)
X-Received: by 2002:a05:620a:371e:b0:93f:4f87:4f5e with SMTP id af79cd13be357-94408cc1098mr388505385a.72.1793198687761;
        Wed, 28 Oct 2026 07:44:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:38 +0100
Subject: [PATCH v7 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-2-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4264;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uuM5n1/ji5JC6EPQ7kRmGdBjzEkAbSpadsEf1ipKIMs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpaE925pbnhhlJ0skqxcrsDPeuEoH+pq0AZd
 0zQJSJXq9uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWgAKCRAFnS7L/zaE
 w2l+D/wMErOsNDvZz/KjCU/SIjChU6kFedpOErh9459H3rNq65PFVvi9lL2UhRdpHlPJU2Su/zI
 sWfY7WKinipwaIDaXCp1r34ea4bOV6v60pe/1N50HXAWq6HubMEVw+jcfWSRIsH+hZ6Nf3gaohh
 ZttvHBXzNQcdHUDHyuk4AMNDTc7qvxmE0ERPvyoMxcu57crmj8wgzNGtB9P34mb2juPBdIIixPE
 2hU3xvrk4Nib+oNHsquHvU+L1PrhU0xhfEZSSDzWgOA3/ZElLb83iLtQTT3FBtRMlvQu6DaYwiH
 xU3qJbt6oTWr8TIe0Xfwq8VffzxIy2OTlWuhl7gtsd5zKS/nl8nd1JO6DSpqfipkElAmlrv7vz4
 SqMotMbiJnGDgbsDXJ35QouzA5JG6pbiJk0UkCvDREc1UpXMz4MzoSI9acbSM4reaN5JJGQWEYe
 YXlu+V5JDycnDpADkep3XdoOqsE3kAzjQAgE+Z3eAz40vjvUQTB3vnggBdTF7CTuQpnGOir2KoC
 Si7zhsHZHY74OnvBkfoGEogXFmO2E86066tHF3IV9jtTYbJeVe2ihWtICGwIXN14Oo4q6DrUNgn
 TNaBWeAxOQTWLY3kk2mCumJXJAFIh0i++1LnjxG5b74w2iDZoGJWGxoBTh3GNs0Em7UAO9Yr/7V
 cYkd7jwoztctx+w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: nwlBY19lnzVSi5JJsSPQe_IuDfRKjR_E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX0G1CV1UjdT3V
 H9+3W7Bw0yxn7cFT7Gnt2ft4ZuHvw/EAeK3/LPn4XTHkNkQc38tb1aPRvLa4d6iJX2hrYF1zC8h
 uW7oxMCEcM4zjMsO9vlCeHUuN9ivv4oGkmyW8k4iXJCd6fYTDWCn2UlfrsftOESDWkcq/XcKPbk
 sqgd587tkLA3Hkittnk6QGI6CBflX8U2GypYa1tOohpFS7Ne2yIwjIZcooAzw1IFL8LYytJk+ce
 Cas6abgvXOAKcIE2yfzyK9VygDApJHGbh1LqxU36J0iBOKK/JV4g/uh6RC8vzp2TB86MAGkyIrd
 Fl/J5MOYfnqy381j1Iml++Yv9P36NZfTQUgCZmpVeGj5mvzBU+W2vTaC2eqS8Rnw8pohRxSVEtX
 NvoS4Nh7d4Pe9jHr16uCwn5lAhDNPIEN4yBtyhxgKVhjqScAOA65bPgUqpKPQ11M0gn7v6LLGs9
 dnozeCmRIfg7Q9K21qw==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae20a61 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: nwlBY19lnzVSi5JJsSPQe_IuDfRKjR_E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXxaNHU/0XRtoB
 Yi0owmAd4ZqWPSz3JhtvoDsLyhgb19RUDoEQsadYVIqWPE/5nCgSyruCvKvJJ7IXhikPSL9u6Sr
 yV4DoJzGCz1RNLwon4MAkSHT9i1ZMqk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

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

