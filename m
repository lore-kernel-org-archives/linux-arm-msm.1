Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DCC4D37CB
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471136; cv=none; b=LqwMfkOKdN6UN5yqdVlUklPoY1wSkNPKo+4Loh5QzVN58/7fZmiTjGYBZ4BEX67HJsY0/N2HtggdRg4qvWxMFH8qCDtolwS49dOLjhB8HUhNTKZWDTpxms5EXiD3GUEFV40bLjzUzdfpRB6aQzk1cst+mDKN68vUgHGz6MRETfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471136; c=relaxed/simple;
	bh=yo2wT2iDk6e10sLNY82zTxuUGNMJIU99i6T65VwR8HY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDdBLRCRvCkINGqI2Pd0Oe7ERj/pXxkNg5M0YHvCC6WAr2KtODN4uUy9erZ38+7ED29UElDQCQ9O14nRUnNId55+bJ6M2zpQTCSpIYvf/kpZrQ8530KUBgP8mM5T+32RQpC+x1pBZbqDlXe/KmnYIZ2lyv1AmYHljzYhFb7SZUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJ3Cgr4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D67YbGPi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJ3Cgr4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D67YbGPi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVPtm2801106
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 14:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNkG3w1CtEj85sKzT6ezhw7fcrc9H/luVeYYfwa7dwg=; b=RJ3Cgr4VbK5qWRK0
	2yPrlEDDBGmorvdZbqblp/RW5m3xRRhi97wxnyM7Vc8aq+rGR7T32kABSY5OgSJJ
	Gl+eBLUb6EHTHnGh+uCBoD2MX+snfGsARjieRlCisJUPMJ9cxWah8qNTGG0CncpP
	XN9/IUax1PqrxNghRnaJOXHMDaGJ6LAakViFh3UxsRxhxbYM9Bep6Bxbh8pRnWRA
	DenmRfp6gEfJDscIOJBFHppu5lyxLIV5IkHti1rDIc/pcBIdPUn31knC66o6ac3P
	DDmL6QFVQiEAkUyY558Q+dUUTP1w2pgrh9p8Hh1eqfCYqY2DeaCGmYP/DazLGlHa
	UQbVuA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3kfaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 14:51:56 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8ab4b1c09e3so49445087b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471116; x=1792075916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNkG3w1CtEj85sKzT6ezhw7fcrc9H/luVeYYfwa7dwg=;
        b=D67YbGPir+/Rsq8sJUN2h19QasucsX3vdyhdt5fuZga49HZG2MQh3JqZLfRhp9iHwg
         LFCO86+rHQWkEsJJ75WdoG3AIfCGHg7IToGMcd2AqHpKKpWFlMbryxxnLxjNGll0EG6h
         FHXKSSzWTW98fAU+cLSrlMynOfP9AAuS8bdnaHdKpt5Z0dJc1fd4L1GYVLVOXYUbY9Yu
         J/BK3WKLh60NCTSsS8XCRkpAfSSAE8uzp+mMWDDiQ4z3e87oQ18Oka6QKXa6ntuCs+Su
         EKz9b60b7uI9Iabmww3KXiOMPXMmM36R+viwobSPA18w4gxbKmlebJME1wyqQw+cxBXD
         hGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471116; x=1792075916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNkG3w1CtEj85sKzT6ezhw7fcrc9H/luVeYYfwa7dwg=;
        b=HU3mbJit2XcTTq7ya2FLzTSqRL/XxL22+c/U4Na0f/tNaYbLcyB/4YzCFBW+sDv7GH
         cEkwyfjYK5FJ+qcE3h3HB+bbJQg0uo0rCkIeVoVg8DF1garm6YxQpUiDMq8IXyOG/s8J
         Hv2H5XQ0m40Csxm8/be+6TMEhlAaK7G6aAyURR/JQYmBFQ+PT84nLn4LEBsAd8pneUjZ
         662RZltnNZ/WlZoFSb+OdOkV4YrGnwB3CVwi9m2ChQn8h0/9x37r1qVm1hnzaPH3RnP2
         Jxs5FwFN8leLzmzIbnHpGYTxjazAewb4n25A86spr5LtiY2+YjHQgTR9eLjFz1dROxkA
         sXzg==
X-Forwarded-Encrypted: i=1; AKwUvBxh3f6W1hSDmg4izMMVZM7s5zGbFqp3lcCV5jYc9qVYEonUQrTnfUsSkiVXrdFLI69HCti6BMGrvRxlmrWp@vger.kernel.org
X-Gm-Message-State: AFq9FYIeAGwTMEC62xtriYVFYvYfAQzF6I6zoJVj57/m3Xg9KCHXFEsj
	OxigOddSrfgvKm+qn/UTs0+MaPKF2T+LNipk30UDZSYQjWdruJercm7NRfIxGKot8ynfSwHJPmF
	WRQzG/AP7eAvN69mY8mWrTDrngbcmm6l1fICZm0TQMLm8GYk6PFTt3MRkF5/jiIJRTVi+
X-Gm-Gg: AYBFou2ibpEJgfvLHZ5UQLE1zbLdqQiR0Br6I3jlpRo4a+h4CE2nPpHOxYzK4Jaxr6a
	34hEOC89t3TvpV4+9xXMTcZn9wkczUODgbWyPFKhJOqIsOsm/A4Qh04llQsP/QYqAg6qoFmXIL+
	zCyvCzIPE9dUZZuTreqxAZaAPbd9OwbGwVsH3g3GJ6SEymODmW2Py/VCDnyAQbKfb/XZAVfvD26
	NerZREOjgpiy+WrwTlWw+KqVWpCdmghjzclQ+o2iYUIzxkie632KSLvZOWZj1U2aTC2yayep0NG
	Isy9ZDrMKQazYZi7WWc3nnh3F6jqf7DUQuwkzq/M4SbFunSAWCKI/xmVPR6HnQmtVVJ5kfIGwaS
	m6NR4YfRqAo5w9/Mr9ae4P+S3ILpB8GJ36os1+ZIN2tQ=
X-Received: by 2002:a05:690c:6b01:b0:8ab:43f7:f052 with SMTP id 00721157ae682-8b05b14f3ecmr37153307b3.68.1791471115167;
        Thu, 08 Oct 2026 07:51:55 -0700 (PDT)
X-Received: by 2002:a05:690c:6b01:b0:8ab:43f7:f052 with SMTP id 00721157ae682-8b05b14f3ecmr37153067b3.68.1791471114524;
        Thu, 08 Oct 2026 07:51:54 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:53 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:39 -0700
Subject: [PATCH net-next 07/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 QM configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-7-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=2494;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=yo2wT2iDk6e10sLNY82zTxuUGNMJIU99i6T65VwR8HY=;
 b=zMFGULV+7xdX0Ow63GUf7TfLZPDSXZ5+oEoOI78/8/AVBxpjiCKvxvL9G7sjaxxggkQJDwZH5
 tjaSuTsbx5LC7bwghOs1qGoA/V0A+yVBpvQOOv9aN7/x1h9F00PN4cb
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX1cE4gdV/zpjF
 +qMee3u/UqXmOkE7j07+6nkhf25fCf4/yYbwnAYCb9QHz23Yr+cbzLv1VLbNDwoFrYoH8IunNJ3
 uko8xEh2RviSrOt+3gL/z8hX1vTDxDU=
X-Proofpoint-ORIG-GUID: RJIdSclG4DR1XeeO4WDk5z3zM8M-MXf2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX267IqLvbwPxA
 fBB1szzKBDIDf6KVAh8e7KFxpEdYRCWW4tkoiICrVG1+a90KhGlJ1ILtbllOXbEnqS6CXNclt1R
 WiaU+ASFVsEUEAik53yjC7iAap/IduN52PTlUr82NPf/gl7ddCRt3voNBBrSYti6UBT3Sa7PSHd
 UoOh0DdvM/zCK+2bK5l9f38Q62rb8l+AsDiXPqdREkvflmGyKjVMnr6XeNSc33j+SKuUlLphsat
 DFxR9cbiQUMS6jRJblV1PD3IdLOtvUkqgV/SjZM8c0LwzQcAVr0mibPEd62m0Vn6sGLyMBG+jsX
 Mqds58px11/eE2P+CKfWzrnApqf43ngEul1YEX/pK85ZNPg34NW+7NcMxX7deiADAV0AgH8EyWb
 Igk4z41mIlwR/qt7c4SSsjAmKKouTvmTuzwtNbapQaUM4aCV26EKg5/b3KH0S15DgUf8ow351Lb
 bnM7/AEgIbpdxeQpOSQ==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac7ae0c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fL1B1hGL9xWiboNnwmEA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: RJIdSclG4DR1XeeO4WDk5z3zM8M-MXf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

Multicast queues are dedicated per PPE port. IPQ5424 has only 3 physical
PPE ports, versus IPQ9574's 6 PPE ports, so multicast queues 284 to 299 are
not available on IPQ5424, and 2010 buffers are assigned to the shared
group0 buffer pool, instead of IPQ9574's 2000.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 3afa57119323..dec8eed77253 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -314,6 +314,37 @@ static const struct ppe_qm_queue_config ipq9574_ppe_qm_queue_config[] = {
 	},
 };
 
+/* Multicast queues are dedicated per PPE port. IPQ5424 has only 3 physical
+ * PPE ports, versus IPQ9574's 6 PPE ports, so multicast queues 284 to 299
+ * are not available on IPQ5424, and the buffer pool assigned to the general
+ * 'group0' is larger here, 2010 versus IPQ9574's 2000.
+ */
+static const int ipq5424_ppe_qm_group_config = 2010;
+
+/* Default QM settings for unicast and multicast queues for IPQ5424. */
+static const struct ppe_qm_queue_config ipq5424_ppe_qm_queue_config[] = {
+	{
+		/* QM settings for unicast queues 0 to 255. */
+		.queue_start	= 0,
+		.queue_end	= 255,
+		.prealloc_buf	= 0,
+		.ceil		= 1200,
+		.weight		= 7,
+		.resume_offset	= 36,
+		.dynamic	= true,
+	},
+	{
+		/* QM settings for multicast queues 256 to 283. */
+		.queue_start	= 256,
+		.queue_end	= 283,
+		.prealloc_buf	= 0,
+		.ceil		= 250,
+		.weight		= 0,
+		.resume_offset	= 36,
+		.dynamic	= false,
+	},
+};
+
 /* PPE scheduler configuration for BM includes multiple entries. Each entry
  * indicates the primary port to be assigned the buffers for the ingress or
  * to release the buffers for the egress. Backup port ID will be used when
@@ -1547,6 +1578,11 @@ static int ppe_config_qm(struct ppe_device *ppe_dev)
 		queue_cfg = ipq9574_ppe_qm_queue_config;
 		queue_cfg_count = ARRAY_SIZE(ipq9574_ppe_qm_queue_config);
 		break;
+	case IPQ5424_PPE:
+		group_buffer_cfg = ipq5424_ppe_qm_group_config;
+		queue_cfg = ipq5424_ppe_qm_queue_config;
+		queue_cfg_count = ARRAY_SIZE(ipq5424_ppe_qm_queue_config);
+		break;
 	default:
 		dev_err(ppe_dev->dev, "Invalid PPE type %d\n", ppe_dev->type);
 		return -EINVAL;

-- 
2.43.0

