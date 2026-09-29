Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967CA525A68
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685143; cv=none; b=UFfAXDGj8TcBMtzdjwNi2OOWsuxGvvq5xDZ1x4pre8fzfkJ1TbswmTJKq1ZTx8Ejwn2uR48s8kVXm4CB7qg615IZcPqUCtpOotA2cgYTIs9VX2ZvvUXircZ9/S/Vf8KJceKevq7Yf5irWKeaEo4SZEhNFR2Xr7DJg8zR1RkbeQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685143; c=relaxed/simple;
	bh=ToYpGBC12hzJhRDzJNwcgUv7r5Jiuiuajg4VXkHeTd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6gYftxKN8tZEaLrTYgX/wIy2M6hFbCa2FL21mqbBE+bqcZryLfA9Cr10ruVAPQXw/u62ETZ1hYFiyVR2PL+D5d2HYSCSen4BGQXIZDYANW1LWRopZU15s0l/ynyyG6+kA18Qt1pu05uUhysZQc3Z0cmB8XL5eK/cPM9zP3ipEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQG2xYl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMYP6guv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQG2xYl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMYP6guv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCEdFP1392314
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	raJcTzmr5s/EvuNwPUGO8MAZeKAxKXT47iLaGrEQTTw=; b=fQG2xYl727KoyxLp
	EOeFYRBJvqGpI9jpk7uSIpK7yNT9gQi0/G+CaRI9kVksPo6t0S3Q3fuPXA9whmmT
	Xr0dHocg2JvbNcypT00c/gG6shf2DbKvLOPxME4rCFCUI2XyOK56Dp1GrPipuO30
	QVhsctco4q1wLTM4ez340OiQJkWrg0G6Hoa+AjuDRv946mYwjW/nwRTQVCNoxudb
	zT3KOLaUOTPf0XPhDZ6V9omoRg25Xlyx8LHqG1xhCKWgEivjspcimuPMpC9rI3sL
	n5SbgvqKWJfJH7bExbYKAYG3o2L6UQmZybXhT33VK0mVlhmTKwiBBO3tj7htRNYW
	OhJhTA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03m0ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:32:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b497a7878cso367896137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790685140; x=1791289940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=raJcTzmr5s/EvuNwPUGO8MAZeKAxKXT47iLaGrEQTTw=;
        b=GMYP6guvnSqXDmLU5NKRDgDhDbitO8Oh1z7t0i79yY+gQnqnml0/c5NcjPoOCpfYmh
         94gWbI6KfSPVW2bYMs+B1rzOpM42XNTcqMgUvgZNwMq/GCJZumFms5hx0LXM5xh4oJMI
         Ay+TX9SA6sxK7J+K7dyB3ZeL0I3/v8rHPCy3LG/z8JrC1/wTLVX5t1xYnLXVHQU93uQL
         gYPeXaolPD2UFmpGcH1gQ5uU6TXLpn08ghtTBzbAjMtjWNq+n2hgg+Lqs5Gw5ZGKBczU
         ncggGI/GSgAPiCXTSK8igzRg8yjYIiEP/BOHBJ1TZG+9IuB/oIWjtEhwVReOIQS2478t
         PtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685140; x=1791289940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=raJcTzmr5s/EvuNwPUGO8MAZeKAxKXT47iLaGrEQTTw=;
        b=cIWAFysQRlodSulUpkiKa1GniOrCrRSxC4NSCxnkTidAWG9TTEO/mwbGjNaIA9kqZ/
         oC6QQ13SqQ+4gZ7JCdZjPhUkLceHv6DpXRmeQ5g0JNJKK0xv2IThKLD8fvuH53pmlxYe
         sUONcKMRlSMKABcB96QBf7e10vhO3A++PlRvo635tKbn3cAP6iGEEgx7iybacE1MPC/j
         r/sMZxXYErP/WHL8ypRnEesSvT/Zxyc1USBC+LjdybjWZeC4UWK4lk+PGeO6Pe/5iFM1
         yAFEDLwiM6k7NFIvOLhg4hgzv0uTUDz9+zQ4V5qiiZZUOVpM6eS7plE7gc8UjYlIrCue
         +sbg==
X-Gm-Message-State: AFq9FYJmdi8lnfC9Ihk0wbs2AhMrrgzhhtQvgp/+H8B3XqqUgjnH2QVN
	UVhyEh5h7Fu55Bfo2X3eegP5iO6Bb6rahUOx/s6hjgQX4tJvqAKTt3SN/z9DxU81pHCM572NCSC
	Tu57Tuwj/QtRR3aExuohdkZcOOvFShabw4lYPMpO1Es86dXbEpwXPsGoYHstcbdKGApLbxhi2q1
	us
X-Gm-Gg: AYBFou1xuEa58C4qi+C/YEb5sZxh/iH739gg9vm+zad1gBpq06ZDs7SQz5sHqpveZkU
	Jv7T20uSlduLiBLvL51RMLbRW2siJ3ZshJ113ur+mEV7MHITK2g76XwClDlkO4pVI6RkNSI5HRS
	8mGriRDrBbd7p9I3DzTsuZ/Ob1jferuywHCb783/TeeqWv+Yva/cEDwHd2jCoOEEVoLaTiilAsJ
	8GDOyxNLXPCgmpD3GdgfPMnTSIWB00llmV8nXSaGIG7TaVyNPYoK8AAMOYk8P+N6iiNbSUXeiGR
	6VYwzB/dc6lhMCJYeu88Xq+ChhCJrhqNgbDqHrr53n2G7hpYZkKClmfQ2zrJcp7pY/Ht3sc/fOr
	jNUWEBjy97pkyjMX1+UnqL53yKsm5BA==
X-Received: by 2002:a05:6102:5112:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7af1eff69cbmr4955720137.27.1790685139335;
        Tue, 29 Sep 2026 05:32:19 -0700 (PDT)
X-Received: by 2002:a05:6102:5112:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7af1eff69cbmr4955713137.27.1790685138812;
        Tue, 29 Sep 2026 05:32:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1e:67:47fe:12a5:a874:db1a:dab9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea7c0sm79190355e9.11.2026.09.29.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:32:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:32:04 +0200
Subject: [PATCH 2/2] gpio: shared: fix no-device, fwnode-based lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-gpio-shared-fwnode-lookup-v1-2-57d54811de1a@oss.qualcomm.com>
References: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
In-Reply-To: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ToYpGBC12hzJhRDzJNwcgUv7r5Jiuiuajg4VXkHeTd8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqu6/LzOv6mrMl5r7HjPnsgpGsJJ+ZPF2DuUvzH
 ru5c0lNJG6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaruvywAKCRAFnS7L/zaE
 w/WbD/wJ1bbK5xvV3eD2wcwN+qguprO9o3atp/MhYHrNvaJ5lWyX5Az3rh7yZkIVEEmFhUx/5aa
 vZk3FyeiF5ZVD454FZjbWsI/9ztR3iHfAdDyP6eB/u71hWgG0QQjWSr0VGpOQJuKtHMcpDrglfQ
 jxvG+aWZoctihJt+psY0OFibxens+3vf6rSPbQQFrzVwlkbDHyuYcnjLiisGTsUr6TU3ErUf66N
 P6RIiU77Ns7gvzDncX/ULaIpLEwhdB4oo8PlPkFcUH6dL3Y5f9ee63Q6uUlN982TmM1ZV/K4rMi
 9Lzne59vsyDY0Prl0WL+ULdnyP2CiIOGWN2IRThYDs1fmPdvTVFcDo5R8pcnXF4KtaXfW28eC4m
 uk/euBRFcSkqHebtsTldNvSUivUkHUpwxpbIZvCTJ7v2+BMQPfA2gTyAPkFV8FUhWgw3dHJFRGT
 wUIo3c0V9NmZmDHdjpxE6xKmHy0CkdqnuLnmClp0LPQp+nUNLXRzX7p0MV5sqlERvKrN7EQ++NQ
 HkTws8kWqN8GVPuQinidtYEKa4UzfbdynultZhPsmqYo/WDLaURRsrrZ5bys9j+EC/jGoG9dIai
 bYKsj40DS/U/c55b4lXgbt+l17DPGBO9f/PAz6FkHEAVzzrkjTTtMua2ttmgS7AaXtqZNvVSQO6
 PYt596xOZFOF7rQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX71YrsJC3OIq8
 b6hdEqWMAuZ2ccPS7HLX1lbMfKkIrvnpxS7w+MKPwWM928uavx34KDDEcyDFvEa6erIJKtGMXHp
 T4O4POo1/Lq7Pd/1nlJWMdISC/9IhnM=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbafd4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rks5i3XnzFQczMNaDf8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX3Iw/oYmbpr2m
 y7b3XnxSw8P4p4ZjCRJ5j85J0XW4q5SMaaWkbUXvvYFK+RksDv8fhbv+x0Q+dRIsdOfzrdYoDzO
 6r9SpfNSlTYWAAoVNQoqliJoa8G6vYeRvEymkEGCu01sxREFPBMJ3DL6+gHhOuApQWixcRNXL4t
 ZUppekUvepKOjqP28MBwhPS6ojWtp496lQWV6NEKD3mOUQBlcp256W1/jYc3+1+hNzakRkbp54c
 Dod1MSgMoISZ/Buy9+xfg2DQ/PwQ/ctc7NFopB/xuO8atUmT4/ITohu8ywJq8gHa1Eb3yrscjOv
 +0ap6mCk/2TPqeSRguALx8V9/rF699YcD66oaWsXQQp/UqtHUtK+otTDwSZJvYtwDzvNLBoZ9ER
 UQ7f1U2q5EUqpFdx686SFksjzMPNuDnJPengWM3O1AxcEMv0zXG9HH4RaOrdb5eRyy0oCdb8Cha
 +E1RP2hcFDIXFEtZ8Qg==
X-Proofpoint-GUID: -fjG-KXANI7PxtfmbRWc5WP-TQHFLPhL
X-Proofpoint-ORIG-GUID: -fjG-KXANI7PxtfmbRWc5WP-TQHFLPhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290049

Fwnode-based GPIO lookup with no associated consumer struct device for
shared pins currently causes a NULL-pointer dereference in
gpio_shared_add_proxy_lookup(). Add necessary checks for the consumer
pointer.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Abel Vesa <abelvesa@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6acfec73b73477245c7e4c593f2925efbc8980c6..acb420d77d2f286c40888b2d2660eea15f79033b 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -449,7 +449,7 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
 				 const char *con_id, unsigned long lflags)
 {
-	const char *dev_id = dev_name(consumer);
+	const char *dev_id = consumer ? dev_name(consumer) : NULL;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 
@@ -457,7 +457,8 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
-			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
+			if (!ref->fwnode && consumer &&
+			    device_is_compatible(consumer, "reset-gpio")) {
 				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 					continue;
 			} else if (fwnode != ref->fwnode) {
@@ -485,7 +486,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 				return -ENOMEM;
 
 			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
-				 dev_id, key, ref->con_id ?: "none");
+				 dev_id ?: "<no device>", key, ref->con_id ?: "none");
 
 			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
 			if (!lookup->dev_id)

-- 
2.47.3

