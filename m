Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B023EAAD
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205033; cv=none; b=A/+VM3KH3fE5S4MbPfam70Icj5iiXrMUuEsiR2ok2fp1lQfPzZzARoEgj5EPRF18xfgXMR5IcjLmJCuBL+WLNznHmGj+v7m1OEgTavp1Ej2JaXdd0baQ4foFz1Gh88fw5g9c+tpxo0vWfcgejPflcSqv+7+LpfSnJHRtK/ShP9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205033; c=relaxed/simple;
	bh=/6F/aLJSv5Q7HhM5eYJG9nxGTi2Lx3k7CUsBksszwKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwGvvGITROIdZnzXnLu7jDJgrixSjbmmElfEN50WMEcezzmGQ/wW/nQGIChtoy98RkFXsmDkgFjq5aTsxBBYkokwq9ujvnHjaFmbSqJl2ZpEFolwXsn7kQiVtSzSW2tOxo6MWHrO3xItrOV61Q6Lb8TIdKSu9S4yECT+Nxl4+P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aq+PHhQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ig8HvGn5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aq+PHhQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ig8HvGn5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFxjb4175252
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GEJSdsCp3bn
	OA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=; b=Aq+PHhQVatdfGXF2DYv9hs2Lokl
	ehZgGqYubAheic4HFlRbtzsRhO9czNSy/La/3YbMgdY3EnEvHFDW6FcC/GM+FtPl
	pNJucagIpVf3kDjKtTKb443VYPQ3B4P9KSHNVGF8IJz7JHWVhh/b38l15Fh98OmD
	6BS7PKL0tiHFcrMWxOD521nCZOwNL4ZJQlDySYa05wOZkEZD15HLiVok56lgA7DA
	OLwcAHhhQOI/L09HFw+AOr6HUHHQ9u9mc3VFCkpTzEWn7V0g/8m26zaoeNQC8Agk
	rrDcsYjwa3sj33V0aAl1afkwVIHbEkqVqK6A8+FNMTPjfi9ospaPvzrF/2w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbq451t82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so813367eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 19:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792205030; x=1792809830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEJSdsCp3bnOA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=;
        b=ig8HvGn52H0RvT8sCt60O0utggXP8pizPp17UCsYld91HWiKhSaBQ/BuvWrD/rn8Ld
         FfK0NG3vUnCQc7t2PLH9A9LgtCmZFG1FMmEYrbuVO/XZ8nQcMy0MBfVgTJ201qPQbbVf
         zyEDv2vv7mZrXq4WQA5nRG/u3lVhSkF3pxwAvF1QivehBpan3m9ZkkF+aJczrd0+2qRV
         ht/ITftuvzcQR5wxV2ij8YPdsJpKJw+M6l5PuGYPRk36ysDb/wn6IRC4RNTOjIza+V54
         wJpfPETk3LLSZhTKCkg3cPcE1t95wwDK5xZIcmx/d6Nwj7wxYB6nI/gtsdx8R6FyScNN
         WxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792205030; x=1792809830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEJSdsCp3bnOA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=;
        b=CNr7/YYgjwgNrRDfgT3eztexwrT5YiAkwg4zd8zx25Bd61eXO+l1rqS1q2qVk1gBsk
         aZ3f6kmp9xwZakCrO9PRdEUF4dnj0OApnUV4kU/mLR76c+YTTggI9O9eUf8vnvmcnPwL
         xc2hopPHkZS/gcz7xBh12Gnydu4iH3nRCtt7qOe1ETVDZdZiJUs5iubE43t+G8DJqpbv
         7leF+xXbH4Yaz9srzU0/tOrUb6gd4uoKBbG8WLjcFhj0FI0v72H0dkHsMEM1wA2PncyI
         HDommV9SfHRY6Xf/d1QDt86YdrfQfpJ06qlIGUNK2GBieC6jI4MgtrowgIdypxi9vSMa
         oZ5w==
X-Forwarded-Encrypted: i=1; AKwUvBzF8jerfokWtSI2Mmvv2EYcpy7javPVqmD0IwdVpq3rDiofZXu/WDapOdOAPOWkhV/5Zs7WAun42KVdlYHJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIXIIr7OMOBgnRlaN8B22JBrckwY0L/UXaRs1rNW/doty7r7wqq
	d1/mrn0qiUNkp3kfiojaN+v1D7t+IXkAMIg4okD64a6KSNcFDZtz+bWqCLayyX3hixWBM9YSKct
	Y8MKdEvqZATY4lMLZAMhp+pksPYoviYHZ8EDdCnm21RYwi5fQEG+6jIo+SQSSvA+rzpV/
X-Gm-Gg: AYBFou264LVC43CIPq9XEasqhzBl08xv1KZKL8R9kEPC7UguIyKk7P2G6cnGDEydsYI
	vRkvnMRGV4HTUnAfNEXjrO6D3CmWflGZANtBSrpBG+S4nHWyyB7vbfmy2dAuCvt0efipRvRgP5Q
	woQJSrD1YPeQiqRkNEVEw5MmI87D+25tPMl300RSBZ8j0w+wat/J6H9e+icOXEvWDVLfNxiQv+I
	o39nXg5JkQz7s32uptzrVfDyVen3lgmj/io6zOfJ4C7bvarl1Ql2vW2fbeu2BZBI4XY3Vga5ccs
	gxcvOPpKqryBkt4zHbScqlu25/qGCvLDBxP9wKkGFIKWiKIlCe3TGmZhJrSm6/EI5VCx3Dj0pfd
	WCrr0Q8PfVU9s02NpQdNsBDRLtbji89VOyxaJypdZG24Ofg8i5hK4bu0P+nA=
X-Received: by 2002:a05:7300:8284:b0:358:bbb7:88da with SMTP id 5a478bee46e88-361a234c05emr1958388eec.32.1792205029857;
        Fri, 16 Oct 2026 19:43:49 -0700 (PDT)
X-Received: by 2002:a05:7300:8284:b0:358:bbb7:88da with SMTP id 5a478bee46e88-361a234c05emr1958361eec.32.1792205029308;
        Fri, 16 Oct 2026 19:43:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm13066829eec.3.2026.10.16.19.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:43:48 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 2/3] gpio: shared-proxy: Drop the vote of a released proxy on write failure
Date: Sat, 17 Oct 2026 10:43:34 +0800
Message-ID: <20261017024335.1432020-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
References: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DGR9GF0QGa_VVyKxKGw8JwK2KKlfKQo2
X-Proofpoint-GUID: DGR9GF0QGa_VVyKxKGw8JwK2KKlfKQo2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMCBTYWx0ZWRfX/IJu8Bog8ueo
 Je7qWiiuo+AKOF1JDwEeBXBif5Y/BrerAs9I5fa/41K5+z8blJBQtjlRVh83uW/QGA6L4wD6+nR
 C+/ZMkMleMad3QY++jL+GO5+aCsM9i0LEzlZuUAy9FlT02RVnNftXT2jT47nObhmQ6UdnbDvBfD
 4jSYO9eZUvhqfN/iPeLdGJREqRejOEEVlYSzeOewxHxLE7R97YDHTkC3Vnepms4hEHbtGcmI9Qa
 vlPc80B8dkPaO0muENUMq93B48q2PeuWTXxfGNKDxpBOvQ+M90A+pzh5Ko2jW8S8BEasOotCG9d
 TJjpneSG8xoQtt9Ei7oe1ZbiF7mlOcd1z9IuohmqMwy3QIWZi90nL86QnX5nbykJu6Kbn6P0gT5
 sv4ac59Uig2belOVWpBONbEwoLqKwQ5txc3Zxt9lWIEIak+ewxNOVEkdOqA9Et7DhrGVHqoaYYS
 Z8GrYQHpNPAF6X2n4sQ==
X-Authority-Analysis: v=2.4 cv=e4GT2qp/ c=1 sm=1 tr=0 ts=6ad2e0e6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Vq87VKjZgZ7Zzh4gvRcA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMCBTYWx0ZWRfX9Y4z/L3GAQKw
 mvccDApqcIUDMn4iwRTvVDm86+ygV1iromPSYg1CjFCDBsNJ+nvYFILB30K44fITVTpyr904KSn
 YhU/p142G+x7uX23qV1WXLqXz2E+AUI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170010

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
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 0d1d724a6a37..24241c981df1 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -134,9 +134,13 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
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

