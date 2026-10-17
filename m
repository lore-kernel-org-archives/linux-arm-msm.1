Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE2B3911B8
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205036; cv=none; b=EPPKn2jDUbwehT89Pm2fCUAkRDMo/kPYM56/X4P8bW4WDXqEHDsA5z5FMXVjanPWmn4MoCyoXhE4xxSQSveLH/ghICoV03hF9VEB4m400wdARw0rK7NQUAytZVtn8mvkRA3Ep9XJ7RMhfA6SeJs3Y6Ydhcjyo+Er6JgAGkQuSLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205036; c=relaxed/simple;
	bh=5l1nBiMrrlpH9xRvkKTMAQq8v5Drf3+dS399wlPjZOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgqyZ1Zs4MoTp3nuDPLgi6tq4goirjyxECeUgmxyQNTvy1Sf0dhOjxH1MSvAnRlvbcUNsjLtSfFfJZ8pTs0YrlkMZwerGxyJGPsWAMYDmbM53Md/IIupETbhV+dkQA2VjCp/lfS4Dew/kXAEcrxoNrrz0AmXAFdOamde5jZZBU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjnkBcGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsISNogr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjnkBcGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsISNogr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H2YGU93726627
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gxPBCeMFHgD
	gqMuwuN8DaktXA+k3btEseEDMM1YN4ds=; b=kjnkBcGRofTt9b0wCV8XPZmvfGv
	8xfGvgYBUU6tcGHJJTTgixv7VZkfBFKRU2ngjGLpSsBv63Rs3IAPUwtDWSLRf20J
	YTmI6oYj6AeEvRwpnU30qiY9D5GRRtAVjsQe75x5CpTite7Y02mPDAsJJKQlLOtS
	BZSC8xU0qg5eJPEYBIJgdJQ4kDKsJUPOXT7YH7xdsw8aF07ZbWv4Uv+5pV16NyF5
	7ZYoCN7dMBNymSbZhvhh/tC0KWZtyjh/FKCAQb0bxY364k3Y/4781TnVyBl/jOqZ
	6RKclqiFWJ7vX1Brq91e9eIRVp9Ir7C8BU7g2EMqMvp7XaE/ZzXS22SpA5Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bgg0jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:43:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so1202701eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 19:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792205033; x=1792809833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxPBCeMFHgDgqMuwuN8DaktXA+k3btEseEDMM1YN4ds=;
        b=VsISNogrBE51wXUi5ewgbWDx1dtUvxzUWelIeEgk3uU1OoSDp7a9c7bz3/WFECObR5
         ITNYcws7SA40rHQ4R+89UUGIfjsdA6ygYfoBpBNcXRf9TQdckkXkonVZEa2TRrffE++A
         TJO/ECK9AF4gNQmGoQErUaQhGFc5V6lYdyuK3TBOWque7AR1rb/szXndr8Vkl/4WdWn1
         zii0AwNPHrn4uhWYskIjB1OQoV5BwTxlWsQCf5KFopB2lh1jO7BF1L7PwVcgp39E1Ipr
         L7vv68kThYuLR66PpYgyjrWSM2vDAP2YeNIQD2HWLXhPUbvNKZtISUsQWq0S4EEqzB2i
         z2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792205033; x=1792809833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxPBCeMFHgDgqMuwuN8DaktXA+k3btEseEDMM1YN4ds=;
        b=lxC9Sygt9cVg9/jx2DG10a72X3GfrtKAnIm7d9YTitaZtooCfm5LX8q3g7w+pIwaSS
         qDew8rbKRlDvAgw3W4dS9Z5CXr4pOwIR//Qdml44GeVLGj8tBMSfOVorM5BpEn2vPHim
         pNov9RHnh1eFk6+RoVmyav2cBAs3XXh61y/AEztS+RgOBwHrZBvbObBdY4z4T9hfCrXk
         BRW6ecSuKmMPUUyo9BU+CiQL6nn70YxyHy/J3m4VozuvIlwIWwAwFkqhXcLfXK03gqq2
         dQf+yEBUq7IgqLpsG0A3rTSQHbyYoUUrOC5o9+4BTeRd2jMp5rwH+VOc3Au+U8MnMfHw
         vTUw==
X-Forwarded-Encrypted: i=1; AKwUvBzj05PZ+GcgeQOnEft8tdYE7ALO/kYTPkWqdt7bxzqtpA1MZonAvJ0JMf41qnG5MRdOJUowG3ZwEz14DKS/@vger.kernel.org
X-Gm-Message-State: AFq9FYLgrf1MwP4mvATKo64t4IAsLuKN82mlc5yNRtZi1bEpvAiyaKpZ
	cbDdCn3L9tOOBB8L7TbezmQgHlEnleRDa8sBlBOab1YDr8+At3NEPzxHa13zNFf3NWL94kv0/30
	F4nmyEKT806VDENfCKlwFT4o5cSliHX7aqGQ0XpGmrPYQ9+Lr3eaaeVrZLquJBwMlOMmX
X-Gm-Gg: AYBFou0RI/A4EUrZOt87L2I5RfN4lI+FDFcE+wVQ3iad8BV2vryzTwcNXZN4e1RZLsb
	2tusGeBovwV0M6OReGnsznYQQQNV6QP3xBCaKbaKqLsC/ajFWb5WAxLkR7iKov//wbzn/2goQp1
	yB+IST5M07Qa0ZtP03FHoBYK780IKM8k++mlYnpyBIZtJNfva769PCr3AQIibAxODd/19O2hXs0
	RUIsnBShSF0GeAdNP5w8YTPMBdz5a9J76rGBl+SaBmXgJRo2iVEOWZnOBLhcyK55uifL5er47Lt
	Q00qtAySvK1otT9p/GJJND7F95UkQJ4pWJC+Y5kkSDGWcynwUV8e/SLY+zk+FnxIHgA6Q4dkKrJ
	v/2fuj/1gKGI/nOQ+OZIk+lsNu9Me+sc5oqlom9sOT0OLYC1szOynlL75BTU=
X-Received: by 2002:a05:693c:62d4:b0:35f:2349:a570 with SMTP id 5a478bee46e88-361a2a3832amr1755460eec.35.1792205032493;
        Fri, 16 Oct 2026 19:43:52 -0700 (PDT)
X-Received: by 2002:a05:693c:62d4:b0:35f:2349:a570 with SMTP id 5a478bee46e88-361a2a3832amr1755437eec.35.1792205031960;
        Fri, 16 Oct 2026 19:43:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm13066829eec.3.2026.10.16.19.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:43:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 3/3] gpio: shared-proxy: Drive the default value when no votes are cast
Date: Sat, 17 Oct 2026 10:43:35 +0800
Message-ID: <20261017024335.1432020-4-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwOSBTYWx0ZWRfX8VqC3zb1lDae
 RNqud34iIjlhrvBowfNrdSj4EN1pe/E9LymSplxQBDQ7DVa1oYXscaJwDmBTbI58Vy4vqQTBuIn
 PBWUJimvd1uKNkx3Adkx9ZnHrg557Bw=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad2e0e9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7Xd5iGn_hkjN9V8jMBAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwOSBTYWx0ZWRfX4TatlEyddwWQ
 Z0WK1KxiykumOmgGaKSfdcfoQBQaeJ1thdrrOSxmbrXMp3ct3KFQGw/JcoeOs7+OmVVpZAppFFo
 ns8jUoTEh2MlxIddxZb/PhaBZ3yiZvVovn4KRLLAtU1Oq/QFxGD4QyT9AVhUgjmYeifpwfkGYGF
 triWZ5zAargVIQhEjWvNqZZVNJ2Lg26lubjDig0Bbz1KTFK9U/N+AtgO4l19rhiSlqHm2zY/zhy
 felZe50OhUl8zDwnlj0GHE738w/j4Blx9wyAsFscMN1kTL2D2eRWXyaa0bPW1qZbJsVGZhXaUlU
 blRZckOKWH77okP55q9TJqd9DIAMltPnTuCg/bQrszEZuYDzf5HtoJPyuoJXtcXEO9+sxYMhapB
 IwsyXpMYS0D0vUjEFaafqBdK0AbEYjQ9fWjyzU9SrB92EyoHb385kB6D9nS2TBNZVDYwAxku8Pn
 zSW/80kQzo4+GwOPmsg==
X-Proofpoint-ORIG-GUID: lUA_2f2-pppiaM-na2cKZSz9nP4JOnc0
X-Proofpoint-GUID: lUA_2f2-pppiaM-na2cKZSz9nP4JOnc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170009

A consumer that requests a shared line with GPIOD_ASIS never calls
direction_output(), so def_val keeps its initial value of 0. If the
line was left high, for instance by the bootloader, a later
gpiod_set_value(0) from that consumer matches def_val and the proxy
treats it as withdrawing a vote it never cast. It returns success
without writing the hardware, and the line stays high.

The consumer has no way to tell. Its request to drive the line low is
silently ignored until it first votes for high and then withdraws
that vote.

When the requested value is the default and no votes are
outstanding, write it to the hardware instead of returning early.
For lines configured via direction_output() this is a redundant
write of the value the line already has. With votes outstanding the
request remains a no-op, as the line must stay at the voted value.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 24241c981df1..456a3c3dbf71 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -81,9 +81,16 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
 	}
 
 	/* Desired value is the default. */
-	if (!proxy->voted_change)
-		/* We didn't vote for change previously, nothing to do. */
+	if (!proxy->voted_change) {
+		/*
+		 * With no votes outstanding the line should be at the
+		 * default, but a GPIOD_ASIS line may have been left at the
+		 * opposite value. Drive it there.
+		 */
+		if (!shared_desc->votecnt)
+			ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
 		goto out;
+	}
 
 	/* We previously voted for change. */
 	if (shared_desc->votecnt == 1) {
-- 
2.43.0

