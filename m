Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EEC30C161
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162183; cv=none; b=Thf1psQdpxTMgymhp7gQ0yOggGWm+na0cEYN8Vmrz+H0NIjsqlS+Zd7IuqvFCR0qLno+1weRMgqW8oQAkQKaQ2Wae1VEsPSf2mh7a8L8Y/6GkovPY9vqW+bGq/tP8JnJVC7ygiozJ+ENxC79qgC9GOz8scCVHTvFVUErEgVjwfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162183; c=relaxed/simple;
	bh=/6F/aLJSv5Q7HhM5eYJG9nxGTi2Lx3k7CUsBksszwKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMqOFR5E6o3Kc7VWKH9p7Tl+Ybt6jxwcl7zLXD013J7cyXT2s5a0AYCUieN06GANUbPUxNSa2+U8V90rW+tLGN0iz3Nx5d1Givby1Bq4TQ+Xibk0mvtFWZWHbg2P+g79gconM0btcuM0av4qSOgqx5Nx1bD5XmXIfK2GJRolKmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4lI+KUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbjYr/yY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4lI+KUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbjYr/yY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5x0E2301979
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GEJSdsCp3bn
	OA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=; b=M4lI+KUwpgQfLo/H+78fdSrgUOu
	7T6xsJKkZ9ZRb91LQ0U+IyeVGDRK4y/YmkqYH3bJaGsYlX34qY+tET7fG9iDpY8z
	Yh4pb6qoqgUDxxQYckg9QLWFNzyCIzhYbuPWQqewSzkHppXujEq+q39vPmfY/Goa
	T3jaSGsidZYVNKNUxHASkK4J9LpZNhOXyoEB/sBYdPXK5eQddlzMHl2zJSVsGg5q
	KK3OYeQYL1niJx6Nd4AelX+7ZleA6Ki2OkX3+hKG20TwtKM9VVTVZkGVLryr9Bn/
	Hn+IfoDr8B74C5jecByxHzZCZJp3rLBEXoJEMLPinv8cZWVxKc9sc5WvZCw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sev766-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:49:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-143826c4a13so4023848c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792162179; x=1792766979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEJSdsCp3bnOA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=;
        b=YbjYr/yYZ1ZQnLU395QLT8LWLo9U/Q9QIl8KQIQou+QKn7mrnzHG0WhstnPO3neDKO
         WtN2uBhRSjF6X3yvS/dp04xcqQkq9lPKir8QM2Qxbpc93BgxFvlawBYYviD64gk2mxSa
         Wa74aLNTBcb9AZbq2PCalxvdaop0wldhCUZwAqrpCpYWUezVIog9O3dpDjak+A9CSfJk
         AC/c+5aCnFH9FJe1Y422Z8kpEpFdkb2uUvIuNStGpAQ0OkIHWbAiHgiLRFi4tSxaaUhr
         YBUZ/4TAN5jiZphqrETBLY4eJ8vto2TwXU7sARjf+vZX0R7dnZ+e3DN1UiICIokqhNUZ
         S06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162179; x=1792766979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEJSdsCp3bnOA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=;
        b=cgjh6IcqpsANkoUJaoBypBRDS9MtFHAXEsNPK6yUYDgCbaNEEoZCdowL3kuomLuteL
         DWkpOhO1MQqh2LbMQb7ZVvM+8WljuYGV+1qX/bZyeq2TbGU4myjqTWL7OAbynNAljZAI
         MiV+rcjVap30ukKRK0npFvr3NeYMJLyUi86FLX5dZyg0WgwYR925Wyp/gPsAulJb6bbK
         Q+JOdQixo1RbvIohYwydcWSrrJoyfko39HVp6a0OkDkeg3xCxYDkibr/7jJhJldxR6YD
         VnywkweEnoLxn9AvE1YexOIan8po8DtAJTMLv385gbsBRJbUDrBKTxKRxlhMpxvjzV4A
         N59A==
X-Forwarded-Encrypted: i=1; AKwUvBy4f7kCNPySlPsddFhKkf7AIdtndt+b0wZ2DpxvxpDQsjQ5245LG6FC/d6njHQbLsU1eAs+5uV8T06MFxh+@vger.kernel.org
X-Gm-Message-State: AFq9FYJnvbz8LwBw05OB746EPwtfppxUPRDKVRuf8ePK4LANsZYMhyA1
	cz3R7o00vwBS1pQgerojpSZKlsDzKas/NL3fpPXB7eHEf8IbQVS80lbeZeQlf5B8y+Ee46Vb0nL
	53egOUOP2h2MsOM+rrBozZ8Wd9pGJTuFdVTAQ3YyqJzXXzkp9XssTSkMo2Bclo1QSAGNx
X-Gm-Gg: AYBFou2fu4wZX8lzf1sam11XZTQOGapxMXu2ccpxGsHBK96FBwq3vW8AjI+dK7zvHW/
	ZFnPxQ+vg8VtAvg9+luRuOqZDn8ol/5O449eDnRqNy2L35Sq+CqeOuOT7s3lJUMPl+WOP3L6Z0s
	w7JQ9QbE02TS1xVRuuwS6b+4lxmIJAsNXKOpuMQ0xb79Mn0bXCjxmRaBPhe6SVNoxMCNlZqOIPC
	gRJ2I6GJwOszaQADmpPezTTIxLHG4uf/oOE2yjPyvZnfOgQADVJKXuijeapXkYJYdsq/2fEr3h8
	BognNPq/pDxzNWRhmZl7gtQzcq7RXDbOpm5+CKQA4cA/MFr0mkeAKLZNd/FuwNTl0Q6EIGAGhfu
	jkdJYzEWRHlLvDkXJ6AVKNNaV23oFDKbfmYO8jdoWTxjli/M0oEfQa9OWKB0=
X-Received: by 2002:a05:701b:2304:b0:182:9553:287d with SMTP id a92af1059eb24-1851238aecbmr147571c88.21.1792162179391;
        Fri, 16 Oct 2026 07:49:39 -0700 (PDT)
X-Received: by 2002:a05:701b:2304:b0:182:9553:287d with SMTP id a92af1059eb24-1851238aecbmr147526c88.21.1792162178573;
        Fri, 16 Oct 2026 07:49:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm7765337c88.0.2026.10.16.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:49:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] gpio: shared-proxy: Drop the vote of a released proxy on write failure
Date: Fri, 16 Oct 2026 22:49:19 +0800
Message-ID: <20261016144919.1362846-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
References: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E1le94OEr8R53C6jrcLIXrrHHP1NxBVD
X-Proofpoint-GUID: E1le94OEr8R53C6jrcLIXrrHHP1NxBVD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXyMlaxLvz0FWT
 OwWHVlMDW5v6cdtwxrtc217gLc9HSE8B1lN1jCM57aVArl/ge+RwNgNMXmUtG5aTJWLfItdkkB3
 XhenRHxJ7hhwnofz+qNo+DU/WyHBHvo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX666EuJX8BHu6
 sUkvGqkg4daHL43a0PAIrXdR6PqEMdPN7UbXf4gb05AcQFHNPczQ9IpPpRDohqoDtpxv2aqGN7E
 w8dOYcT7moCHopH93h8SOaVVC5Sf54t9lx4I1fXlKiTR2dFR+r6UwOHhX5MveN3kTqSXCcVJLZm
 mTDkKSNSd2RgMDt/1sa0WDCJaTROqPFRfLQevNZAuMLyKjHpDPZkbstfEP8FMeQQg/v47Aku4qH
 dtRERLK3HAHTGZ15etHzvawaKd7j/IDK37WKEPPqcEyqgpy8D/Xp7VnyaSq+sRZddfXTVFkEkl5
 r0o7rBcsIBJuWDqyt+El43c17hwsvaEufEDe4+Gebb9qzpcQtAOmIIN7WWuy3Ktz4eGEff2EXFr
 Mf+SKOkr609eN4c1y5VSVHADbt+Cpq+e8RFNbzasZCh9qBvCvrsE3VSqPsO54DDlLshpozDQBAm
 EPGzLSvndNy55m7/KNA==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad23984 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Vq87VKjZgZ7Zzh4gvRcA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160058

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

