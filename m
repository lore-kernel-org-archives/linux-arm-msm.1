Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757005;
	b=razfqx1PfdpuX0FZOyrfCIOSt7/13GBAqg+xkaP7DZCI1x3YMD+G/DXuRSaXNe9bFlC3
	 Tg4tvFy77qTBSWOOwPeZAvyO8kDaBNRz8POQGeysysZEpBsZcUTHBIQz/I3ZQpOXQbvsD
	 ruqvFgK6SDrC5QrwYX2k83ol4pG+OO/41moWJmcnifaXZjsobGEjI/kIaVDG3HHHUmeDI
	 bzsEgSEy/a5FUSOMF4Lp9jNrVGnrtBqf2y1gZ2PPS1DE+4wxReNGDZL4je5ePmn1igVDt
	 2AV8ed/oPgPjdyugm4jKtYzaF840zas8sN0CAjz8oWGmoZATvIrrdrVd52VCed/y3aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=;
	b=1TFbOwv4XvhD+qszK0o/jtFKf7A0WEHWsmDU9Uvlxpop+EIC1DLmXocOhAf0NEbHLSyc
	 fzrK75f2r4L04rzU/IUhPshILpBoEQIpBlotAiWlrGEQfafg7vv6H3JuMCRw5o4ycOrSU
	 GzWPJy1zi5IvwGJjhElc9MpjMLGVECjOC3zxQFcrxylwifpBQvVM2ZK4G8N24e4hxQFkH
	 9i4/QtroME7jdqXNVn6lUHwBtZgnEWMivCjxS4WE25gna5f9PlXIvG28omrJbTvBXpEgb
	 Ca3ZWZA4rc629NabrEsEyk0W5XytsqzwvPM85875RpEJEnrsZlfDnsSorOLWMzv9jaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSMywDds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0kQ+vFe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663AA606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 663AA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSMywDds;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0kQ+vFe
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR0lq5o375469
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=; b=fSMywDdsFqHHk+s+
	tW1dUgExFcdPWhGl3TOHnpiLiaJjXkMp+656MdMvikbgHq/Bs7aKdOicsTIOzoj9
	bSMcot11ua/l1kFR8YvTE2YlHQYm9ZZlEGwbLvcE6amK0IbKkLqNo16KEeqpdSme
	D+AcCApsLBLwgukcf1Pas/NdjWr8qakM16+R317dEaqKKDMgnfZxR4tG5XqV1QSO
	6M/IQq7rnJ9KU1nF4mp+fO37015edF0JO0zPivCKFBTI6HZSybfV7zoe0mCbHkBc
	bmbYkHwGKnrCGMAF8F8A80kkTjXXirmomJ82MNyUPURRaeR9qhBZJzgLX50Cuy85
	cHIDTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ymw8np4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:23:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b494fe37e8so1019975a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795757003; x=1796361803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=;
        b=M0kQ+vFeTyVuwua7aOkSlYjpufjk/6+XGlnV0mCfIqrpscl/lVpUC0i00+S3rBgco7
         NIQuuzubsInut627tkP9fHPzo0v6WvLcX678OTIG0ug70TYrsJryg47xO0H6QW6QXWvR
         xjOvTVTPfr9G9olAmPoo7GQkAjjpU28zkC0A+9DAJqR2BxoInsbteInr0lUMNsO4M7SX
         7ELXQHRl5fupeEM64tTz9Yq1RTh/H6KhRqbkAKoYuLWviVjYwcpwYAlLrkVOusA3EL5t
         3JWVVHCj4LfGV71M567uD9zxAKi2MgTKbievYJEnUUZr4GuRsIhfcIOkNt7fqEkdrXk+
         alTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757003; x=1796361803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=;
        b=Uw2Mx+IAdSdFYU0ERQs+Ts4yWqLVFAfQx4OJmoGpzAkwstzHqQs8+xcgf5L6/vg9Bm
         QxcO69K4pDyIHfRLW00rs5zm7Vvr1Lp9wx2uAFDkUgsczv8W2HqunfXjzwLa2qyMLc+E
         awjML5nOJOmP+puKtBlhlXecn2gknlI852LFMTHsTF2EWsT9cPENKUMK0wZNwipAb9Ai
         tuUEZGWIoKrU/x7gowpI3LGKZhdxhFdDCPV4mEY5oav2yJQukgUw2dxhkXxju5X16sGk
         OHNLg9nk7ZpkjAU4eARch6DOumEtD1OzDxMUPhpV7UMsZestOlnxHnmc2m4btw0NSHNV
         aLAg==
X-Gm-Message-State: APuU4Z8x2eMEiDMDMfTNxSkZcgvjIUJxG4IeToOg3bLRu4Bxrq7Lc+YI
	Rdm0YOUI859R3B6q3VL+FCEYHIzjAusBzESCabuo3daxu26hOk6UwVfsuOhnL4tmb14LNyWwChD
	USlFoQZUt06b2GIR2ySI+NpT3PKy8+i2te8GNq4r+K8YCAw4mZmr9ahVDuHQ0if6G5BjJ
X-Gm-Gg: AZFdTZfQfaZyHEiHh4paSskyRmw8Rah+KjkT/eu3je/Yt52+/dodkwa861B+eMbz09o
	85PdC6fV8+bYgtDFt8lDc7luIL2SWxyYpPhXocIF+QGgbzfeIPpkoei+tTGncahuo6MKf8qUSWe
	aCva5FgYnwHQumri/WlmPk+OUyrX4otvvVw98AFFD2IrZI3ty2TRxT6/k5U9ZtjAnZaFGVUoVO+
	1uPgeYwyuNLGz8DLn13DJwAUYHTNLF2IsitxVKZyUO8pW+ReAb2/DkPxblk1b/ZdloQnSjRamJn
	tPTstKoSkITZoJvn8Za4JAipjpg2+8GDqKmQYCQKo5cdrXfgNhfF+vV8vbJw3BWr5ranOEyPJjh
	upvYjfpWFeTFelUGhP+5V+uybRI0USpdbDgZrz0JxbicosoZ103uD7cq++A1ZyIyngh31mgfDqH
	Npskjw6mPQxK3O52YRsfVGcppxpH5Ro4oNJylZC7BCzkoKRW2eflei0Nt5ptFNoqlu2iOScMpVX
	o9w3c/68EXJ/+AcfpAU61Ioc/54
X-Received: by 2002:a17:90b:39a3:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b41c91f7b1mr38330320a91.4.1795757002963;
        Thu, 26 Nov 2026 21:23:22 -0800 (PST)
X-Received: by 2002:a17:90b:39a3:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b41c91f7b1mr38330281a91.4.1795757002478;
        Thu, 26 Nov 2026 21:23:22 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm38637787a91.14.2026.11.26.21.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:23:22 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:53:01 +0530
Subject: [PATCH v2 2/2] usb: typec: mux: gpio-sbu: Enable optional vcc
 supply
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
Message-Id: <20261127-eliza_evk_display-v2-2-e4223634aa2c@oss.qualcomm.com>
References: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795756988; l=1883;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=TAGiU7OPP0DmiRW1r6NgAjRh9iFMp42fKygt8T8dPBo=;
 b=LGI/AGvn48gKNMsc6mTiekzKj+lOk6i5FrXL8+Y4t1yZ8r1j2EQIvZDZbDpr6FzaYY82U4pXy
 pUc/IjzEXkqDTXfqWRfEa2Wn/SpimdIF/T68TwksNH5el5ntZvdtZGR
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfXy5+oyen2VwNL
 wqRvgjt363fjw3zKnOae6UYe/iHqBmzNvR5NTwct1GnGJU4ho/0N1oq0jqyFyEZRh9TlOSZRlpf
 jJBfSpQvhDS3gndYJfqJIll1FoWwQJQ=
X-Authority-Analysis: v=2.4 cv=ZKtCCn7b c=1 sm=1 tr=0 ts=6b0913cc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8W6NrlJ52h3mw0VdyTcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfXwDacGvZBarZw
 EM+EyXFnBa6ObTJpuWzcGc7lAcXxtHhFxifqKP18WeWO7jPFM+xx6VSeOKmfWEHAB+I0JvMY8QN
 J/HvUv40Qk/AOswkYfQIsp8x1FpPx0J0fPArFtIEboBvxR6DzCOYEGcSwQMOX60VU7M+LoYFsfx
 3HxjAr+jeIl/f16LekRzBJBv4omBye5rt4WNJJqC96zgMxwZCNLMXn2Tba00LUbRCZG1pjCc1e3
 4lzr6GfZj42HyN7J0ZWAS8gQTXvB8B6JBCk2kVUCeTRGNayDJgQwC4km3Pd04555ZbcXmISZYwg
 +xc7BAC3zvTo6v6y4uRfcu1q53rA15vV0Qd+rnjQ60aaF0AVyGyrY0F6+u6T6dkTPureHc/Qnhm
 yCOxL8kmJdcJK4O9LuIQJIDm8eQBN5aFnbaExeTuT6W5RnWt+A/9xtAqINXqSyobBZJJD0pH7XF
 j/OE/DQU8sItHvK2uUA==
X-Proofpoint-GUID: ape6kcA_OoHyWI11eAY5APy1-m1DL-Zf
X-Proofpoint-ORIG-GUID: ape6kcA_OoHyWI11eAY5APy1-m1DL-Zf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270021

Some GPIO-controlled SBU muxes need their supply to be enabled before
the AUX path can be switched reliably. One such platform is Qualcomm
Eliza EVK, which uses an onsemi FSUSB43L10X mux.

Enable an optional vcc regulator during probe so boards that describe a
vcc-supply can power the mux before registering the Type-C switch and
mux devices. Keep existing designs without a vcc-supply property working
by treating the missing optional supply as success.

Return probe errors other than the absent optional supply so deferred
probe and regulator failures are still reported.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/usb/typec/mux/gpio-sbu-mux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
index 8a8aa7470df4..7aad3f738a5a 100644
--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
@@ -8,6 +8,7 @@
 #include <linux/mutex.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 
@@ -104,6 +105,7 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
 	struct typec_mux_desc mux_desc = { };
 	struct device *dev = &pdev->dev;
 	struct gpio_sbu_mux *sbu_mux;
+	int ret;
 
 	sbu_mux = devm_kzalloc_obj(dev, *sbu_mux);
 	if (!sbu_mux)
@@ -111,6 +113,10 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
 
 	mutex_init(&sbu_mux->lock);
 
+	ret = devm_regulator_get_enable_optional(dev, "vcc");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable vcc supply\n");
+
 	sbu_mux->enable_gpio = devm_gpiod_get_optional(dev, "enable",
 						       GPIOD_OUT_LOW);
 	if (IS_ERR(sbu_mux->enable_gpio))

-- 
2.34.1

