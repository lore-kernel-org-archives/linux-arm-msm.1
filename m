Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985130C631
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211804; cv=none; b=BYvOaxFc0dbfEYdgUmbILhg0T/Z+lnWC50frOL4/YhbT5KN6fMjgwfTqpNx+d3uIBJX0QXP8FN7mo1pN6BfdmFx2pvvGwVgGJb1Frl7IXBuzhAddCNVghOCq3GObkb890dljj2VG9Fu+tMrx+qWUwJzmIKjCV1k7zbWHii/mkOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211804; c=relaxed/simple;
	bh=5l1nBiMrrlpH9xRvkKTMAQq8v5Drf3+dS399wlPjZOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFgMewS2pxynFMzxXGxJwltPSE+/iVD1qf2lI/9fnLjBSz/ALHZYQq82NzjJ7jEXTxp3r+edaurMnSlAqS8fJos3p+5DdFmYrp3pO+Al1NEymWfE9DfzPfEWCigd3+J+llj6pHiveDmK9bvWAqB0d2UI7Q0t2ocPH+fF4+sjIFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSITMKMs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arvQb5rS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSITMKMs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arvQb5rS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30pKg2625329
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gxPBCeMFHgD
	gqMuwuN8DaktXA+k3btEseEDMM1YN4ds=; b=jSITMKMs84tmfODWSv6h8eWQGuB
	3V6QZUwKpgTwWf5LuW4DZhQ69KUHojrTmBUpnYJ8byu4a8s9+OWbQyX+eqpNrqDC
	+maNuFDeTj19+FA9YD6vOiAUm2TdaUDG+hUBMXxmsNVbWOKeFmP1DKcVrMbIltg0
	klXQqPU2FdjKoOoVgl/8jM+mmkKEBri6Qd/EsRNE7tacriAQ0sNxtB0oBQnfHhNJ
	hdTdk9oY3S0qdcMWYsIZmtK2Szk7ads+2JIaRFh15L9jSfu6bZXIZ9UUfnhhlcez
	XlLc27HBDtDcjSazD3KJSo0iMlbM8TKyd//DVpY6UvsIFmdO1CjNdJeqFEA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjtcq11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so165511c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211802; x=1792816602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxPBCeMFHgDgqMuwuN8DaktXA+k3btEseEDMM1YN4ds=;
        b=arvQb5rSkbyuFJC9Vjv1birH8Y3NZEuc0MMzwL5/bRxX/w7f6Wctgl31bnWg/Jc97+
         C/PLmxE0W2JlIMcCNXKVK3vImG/Tb/e/VE+XdHS1WzgqiBPGzaRMGoGON94EyQC3sxbw
         mB9Ezw16GOrnD85Qatfsu2dwKg59URlEq9q2pNhYj2/OFHsNr8F4XdGoYgYVRVWGakmK
         SzulBX4E6wlFyecji8aO5ob0JtBmRogpjTKNgV+ZY+U6GqKyfekEk8va2sg/zjFWFjWl
         mYd7AnmO65GBnS4JrYUnb5zk+iqHwYFgv11it1Una2PH2PbLzDfYqzTWfskl1a9gsvgq
         Q2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211802; x=1792816602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxPBCeMFHgDgqMuwuN8DaktXA+k3btEseEDMM1YN4ds=;
        b=Pvx9UKiG6x5N0Dpjqz+/XACz8K1EHSar8qqVo6V/jHmFHieuoO0an1xV0dksljdMmi
         oss4r/k6SSaS+g4jHmI3tROoUpbo2wMRzdLjbpZYFkDyGapCdxkQ3ZH1asnfNgBsbJnv
         hnueinM/gowIMK8maGo3jvA2UcHilQTHNuu+maLeH7jDtqkSRYkzcpuWngTzfhElnhku
         FvKioZ3HxjXTXCkETPD/gZ+pHDztk5PN5JVaO5SUMVL1Yo7XNA727Dz5bVo4rucReRJy
         ELNI4Hi9IABHrEc0jNYxzsMTeNejj5Iow1hogIGtScKAl+o0ZCSappVha+RAf7t54Aeu
         1xFg==
X-Forwarded-Encrypted: i=1; AKwUvBzpYbyRvRJ/yoYNNPII+of4OC99+Oe1gPMRoGjYuzdocFmrVjJ18cIkNEtDO4LXuxCH4z+Iz+vRB9eUfEnr@vger.kernel.org
X-Gm-Message-State: AFq9FYIHn224cn9/RansIjYd1zKl9QeamnANKugxT7LD+W1r+z+fd9wk
	dV2NT2iDW4Wcwq4VAjCk1wi74N2lzf/JcTavbO4JYVRSdGk+1cRrjDmu+yWx5P/HCtiQuXASdUT
	5wF0Cub/Pa4C7KX+XoNQhMBZbDkPDFZa0B0WOBWZeKhlNsQtNV9A3jYtqNAeoX0BZXKDs
X-Gm-Gg: AYBFou0iWcoXiKaFg1ARpBgfoPph21QlyaT3ee11z8I65Y+UFbdLZ7IY1F7d6s/3v4q
	gzVWLGaAO+d9w4UTmlyPsNGw4Lcy3lO9ab5MQOspnx3sv2UcZVsAA2H8v0yWfikdhRcjXrsYmsJ
	WY9YF7qKpXOUIJBcrgIDaDNexuQVNKawadij212O+RHMoQsE8ZowsyU6LkVYTplq9rW5zRnQmS3
	rbFmErvcM7a18yBdT8ymysL1Xo72HwvzYPz1Op+XS0UtjSVR0xbTHWkt7xAC1CZ2grbGCAfcauR
	sfgPn/W1W7K0jjRmQt0SwRuul+4o/T4t9hBQkyEBmq6lQhF167qpWAWbkivH0vqUjudjVVrZUgN
	lo8BuRWww2xWlopMJQbM3W63SzJIC8QlxonZInjEefZpQY06XpzXlJ/5EbjI=
X-Received: by 2002:a05:701b:2047:b0:143:72b1:9004 with SMTP id a92af1059eb24-18514633f89mr2154560c88.45.1792211801771;
        Fri, 16 Oct 2026 21:36:41 -0700 (PDT)
X-Received: by 2002:a05:701b:2047:b0:143:72b1:9004 with SMTP id a92af1059eb24-18514633f89mr2154539c88.45.1792211801206;
        Fri, 16 Oct 2026 21:36:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm9771425c88.5.2026.10.16.21.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:36:40 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 3/4] gpio: shared-proxy: Drive the default value when no votes are cast
Date: Sat, 17 Oct 2026 12:36:04 +0800
Message-ID: <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfXwNs5ZrPJ+zaf
 okpEkPCnpwaUB/74qHobdF/ngwS65oRGBOTl4MkVTitw5nvRYzlZ0WjQX6aECz7oErib23Ihjzc
 NZhk5jd7W2TPt8f0V8HLzpSEABZTeTBrOiUAxGorq3/GpAGxb7TnVqpu2Q+HO5eAtWaXU5dhdIA
 oZhLkkluYm497EcBGfoqR5FpKlMDTd57kxnJN2mz+lJGAFyWFdS4CnAcR1AWvmcWROHv8wy33t1
 E605wXCkqyNzeQGhQlFnNv2V+c1I6eH0XVbEpUOYn6LqYYOj8eDzTqWezl6rhRXlcHwxj/U+/ER
 uFagGuUhRSx20/lFIb6wQHyATLSSJhXwD8o94KVy/bgasWQyniiPwDezHPtHRUDakNrA214jWBB
 H3/4ybfveNmkBrPzXdi514TtcE7QOUUOCRT55ekgquOCUrfuZpwlppc5KhBG204iED+fEPLKBd3
 pgyp6WkMGZuh3RNu4FA==
X-Proofpoint-ORIG-GUID: Bev4WRqrcdMG7Fzi88XwPpkdSJNzd6Av
X-Proofpoint-GUID: Bev4WRqrcdMG7Fzi88XwPpkdSJNzd6Av
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX2UCQS4FLEIaj
 8AjNKndKFISZKOHKLMOGuuh0kumCnINfBXdlmms+Td/0GZ+ruHOlE+A3iZaDVbab0PpjPWLDxpo
 OXv0ajJmyzoHxse2E1snp9lVXriWao0=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad2fb5a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7Xd5iGn_hkjN9V8jMBAA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170018

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

