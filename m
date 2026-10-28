Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190938;
	b=PFPnSDiBRPvNWMiMytO+UL14J4MgPVXYx/iEilrfQb1fzW8Um2FraH2AXJBeO+9EDBTi
	 PYyeKXZUP+0Pi0zc2S4QE6UKXDeFSRGUxM1QCd7jQZP5V+cJ2vcbVRaqImXD8SqFjgxfU
	 h0WgxXK35xqbFcdOuO9j4m61f+5mvF5u9BMy9tcd4biJeo8LLE2pM+VpSz3ed25lAcerx
	 lLeRpy9Uc0B2GwGrGWNyqp4uQr+yVeSQiWAOT9c0XeKMeBPmGCdc3R0gNO773XzAZPn2f
	 5NNICvPMy/l+dcnbZ2Zp/B+RKe5VMgigAWgQRgh58aH/dnjfuHziqCiqHjMqa5Sv4kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WrlFesQrP1Bu0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=;
	b=lwfTACtKffsw9TmBHI2jmpLkte7c70+CL4plOdn8LnuDrYEC0pAxKpKhoWwquhVJK4et
	 L1NlX7A3eSD0EJKhhndDoDoGLfwMyt/WJ4Nl6kS4Eskv66fONLAyQKnr/sWYVqAmjZ5MS
	 uGu8ezHjIy4n+G946VQ5YtY+LTo3gzVAKzBvM8mhZjoT+ea9uWYEw9BTNNo1MQBLsPEhZ
	 Y/0tAxTCzB+b9W66J0az0EPCmxjHgyk2rVvYoKI/IeQ3SpGK+DlGIrqnEz/2v3Cee+1Va
	 q5dvLasnGql8s0MehYoYooBzAMi0zpqX968M/Ze4T/qMamkDgnd7D7hRqvd9d3kXRvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAOev4zN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+7Iof10;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA3606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AA3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAOev4zN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+7Iof10
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4fj4154780
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WrlFesQrP1B
	u0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=; b=cAOev4zNDSNjtAQ/t0YzeZYiQDV
	8smOJeYqce1V7UlZpCGy8xGDec5PWmtlS9nZX9bRr91qYQhJVsGpn77YitYgOMrF
	NqUX2gXs8BylCkWbFfQCTS5VrouNHt8NGFB2HV4LDHUYXsQzPORgAxvxCUy7vwR7
	L+6f9rMiP5s8GEVMcro+TOI7BDfZikqDyWGz7t8UuxIjbQfYTMdY/6A0zJwID5NR
	jBKVEVenbh1vZOWe4kHED239xCX1AC2YLBVirDEgjTP2dZj1LFJ3mzhrr+WvolpA
	nN6ATPV/oHCvDjtaqeWpyMSvrk0uni7ZHX9vaFS8lGi+UQih7amAgEedhag==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0t6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so1425967eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190923; x=1793795723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrlFesQrP1Bu0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=;
        b=P+7Iof10/3f/TDLIEz/MxkDO276n7xMRknJq+H1bxfEmjv6hTifqr1GsTYBO/sHC6s
         7TXgABL9eaN2c6cYIQ/laraaNCaOKplRq2lhySRbdmPLTkyDac6+/tq7vtQS1h9TBMzh
         EBbsqhVu71dBp1yHi9NiHth3vxb79st1Lpm/eICtiGBLfCEt8d+3yFw3F4ZnKxyuo8UO
         di9Wckgp6mr18pTUkGSchRwAYRBDvj7r56n3Kpy7/DkmxeRmYG7TZZDzEkmk46kQb18B
         fPG1Vn/xlPkDhWqRJR2dmilVouo/sKd5W8yejZPxshGSmue/336D5B0Y6E52GrDwNcSn
         Q0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190923; x=1793795723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WrlFesQrP1Bu0qzO9q4AZ4Gc3JZGfspE+azJFM/95jA=;
        b=pr1nx1sTKDvK+J+cb0IZwyG6rJcKEqy29kAZJPvFyHdGcnayoC+L0D76bWvDnymjr6
         0CUT0Q1m0QZAV7/SMpz+elFlYfvK33I2eYl05MLdxHMCc94q21KM2xjG+t+hM7IrOMlc
         puvJ2gJ3CQh8kILZuzVpeYiyqmlix8aN5jhsc1YODEhxZue88q4UQtQY2kX4AKmbv8Cc
         R0E6khn06UJQ8NETXe0+Ut042lwji4/i7QpxqqngElDbzNuiv+EmUhD4U3hGNF8p/FRF
         wNMx54o2nXQm+rOC/eymcvbOv4TR6I1viRph8M5PZdiFhv4fvu8XntswiNdAHZAifDJo
         fNRw==
X-Forwarded-Encrypted: i=1; AKwUvBxFoJFfStWFE5aW+drTe2MILIhsHgYHK6ptJ6v6PHde5vPPSqHLtn52IBLKGydAdzfgXLpF+gkrwMDcsvLx@vger.kernel.org
X-Gm-Message-State: AFq9FYLi5F3tUAkhLqF+xEty1/lNDYXM8salxAdi0XIg+mxiyhGrrUhA
	PByM0i5IFzJptFKb984nAetr/1kHlMGSb3TxzhKp/Nw/8rfJs3J7CKMALGH7UrziXSjl5SniL/8
	47H2c4xvcNM3PEeqhbw4gP1LpEQiQ3Zeaik2ALlZmxF5L6BORN9pqOEFdcUcw4N6eASqB
X-Gm-Gg: AYBFou1+b7vEqZxdVJKTKDPgBAFIyHAIKDsC8UqU3ZeaqMv+P+EcEPXNvaKNo6qj3Ce
	4ZXIng1HCq8VM/pv4A0kHWQvkaa+xyqbpZJRL8qAKhCaPosGaDQKl4uMKp9xSIG9RepXSEPVQMU
	ndLY0SqdgFvNMnb4XNPmr2qBFeD5e/mmU2H2/yMPv8um2hACsm9G4G54fCWmWUEjmz8z7pbOHuV
	p5N1R17U/d9I+NffTWC+7Qlr2f8e0yhMzzZzWSMRT/mKLJUomw8mj5PsQNglN5BY/77hQuc7DdM
	Zj1hYjplCmYbLRDF5HTkDpd5tgyUpEGmsEkGP5F+5lUIVR6NFVOUQLmcX01J2PSH95kgxH8jDCb
	Gz94JPz5oqAbvqTkmGD0I7UIcMYv0E0WE9IemTUopN8Eh61zVHV5w3qDT7nCBm37btbEARXvz5K
	hERS12yxEt4HMXJiui6F8tdc5kq5ekM2X/
X-Received: by 2002:a05:693c:20c6:20b0:369:f9da:a70f with SMTP id 5a478bee46e88-36a200beebcmr3514460eec.17.1793190922620;
        Wed, 28 Oct 2026 05:35:22 -0700 (PDT)
X-Received: by 2002:a05:693c:20c6:20b0:369:f9da:a70f with SMTP id 5a478bee46e88-36a200beebcmr3514417eec.17.1793190922034;
        Wed, 28 Oct 2026 05:35:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 2/4] gpio: shared-proxy: Drop the vote of a released proxy on write failure
Date: Wed, 28 Oct 2026 20:34:46 +0800
Message-ID: <20261028123448.510401-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WS5_RRbXBqxSJhjpHFQjC6XaA9bSUkrz
X-Proofpoint-ORIG-GUID: WS5_RRbXBqxSJhjpHFQjC6XaA9bSUkrz
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1ec0b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Vq87VKjZgZ7Zzh4gvRcA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXzVSDx0MdSvdi
 dTkdeKLLNj0Ad7J5K8lG4afjPX99LCvyUVTmHSxcoaCrS/Zreo1nKCeIeHKke1Gi03/aF4/dCxq
 mQSXGlV91OmzGG9a9eSydShbFJfV6EEdT4mzhqYnKLFtOG5ocuZFVJigYUV6QA9YA5G9+FW6PI3
 1osFAQ5YuwMghHa7XX0Xbv5ltf/ModNXU6KI717K2ofBsOs9u3FRQMU643vDGtgYXpzHJNFtrl0
 USuGiI6/oG6ZmG2dIbRIIIkbQPBWsbFZDOgbbIGnkpcwguXWcoZW1MTWttigEAs5xcuKV2VynEJ
 aa7jTF3ZPt1Mm/79l41IaCcpHZhEA5I0vkhuMLzSkCWGQcBOZQKz6tIAA2UnOoFBsT6L9gUKvPA
 DAHXEaFKDyCE/rF/a/Qz83d3lxPGFzTz4U0yn9RHQ1EaiaZYfWWxHx2OyQYt36+tYGTZJgBqemx
 ZorzWrDuG9XcA63EPrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXyKTcmWO8zmjt
 YYfd5EG6xtVgK4UwIQmW+czQl/f8+KzglXNkLulvuQM6cFXjD9UCO9SQ09AJMWa9BnQ9CPHCIK6
 zDuGh7xH7zmTtbyx70IOr+z0gTboFyg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280050

When a proxy that voted for a value change frees the line, it calls
gpio_shared_proxy_set_unlocked() to withdraw its vote. If it is the
last voter and restoring the default value fails, that function
returns early, leaving votecnt incremented and voted_change set.

The consumer is gone, but its vote is not. The line is held at the
non-default value for all remaining users, since votecnt can never
drop to zero again. And the proxy data outlives the request, so
voted_change is still set when the line is requested again. If
another user has reinitialized the line in between, resetting
votecnt to 0, the stale proxy's next vote for the default value
decrements votecnt from 0 and underflows it.

Drop the vote unconditionally on release, after reporting the
failure, since the consumer is going away regardless.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 2e9ccd8a8d83..4eae3c9a5168 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -138,9 +138,13 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	if (proxy->voted_change) {
 		ret = gpio_shared_proxy_set_unlocked(proxy, shared_desc->def_val);
-		if (ret)
+		if (ret) {
 			dev_err(proxy->dev,
 				"Failed to unset the shared GPIO value on release: %d\n", ret);
+			/* The consumer is going away regardless, drop its vote */
+			shared_desc->votecnt--;
+			proxy->voted_change = false;
+		}
 	}
 
 	proxy->shared_desc->usecnt--;
-- 
2.43.0

