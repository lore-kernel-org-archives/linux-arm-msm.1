Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EED13EC6B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144102; cv=none; b=FjpQ47uia715/zn0Ixj/mXRjsAp5gbISK8MDxCNdrfxtyhwng5HLkpoTZJKSpt1gRQOzNUBX44eea0kp1Infq7JxDP4jBoXHX9ygtLQ9HMCXu8oii6hmeJUkYGHfNmZPsv9q4XgmwEg5P4sr/YcGBN+e7Q7dmpEDlGOH+vWLSa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144102; c=relaxed/simple;
	bh=kMV/fIdncevKVfjmGtD42TtZdUil7gxexiPseZZWR6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKL1k9WP+UhKUuTgTw/OwSt2gJrJd+ayWAw/j+1IOSvjtd0snfs6QY5ur/+K5mIIsX/qXjnl9RMwfbRY64pjpIvfG6tLdbBjxJrxoSR9+k3fKJJChsn+xtDzCgtJU0Dwkao/A5R3fDmRkV/6CBZapeD4Faig6kkEWxtwKJIwbY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AM5BV5dr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYh62izo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AM5BV5dr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYh62izo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R93cjQ3577850
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eqQE6EJ/sZeK9Gs+yGgiu4HoQE4qPd/3LI0KMakU988=; b=AM5BV5dr/OH0FQS4
	EXwNz14zGf8kwzFVsKXZ0HMax/A5IZ24ZWW5bHEbVPJYsenjZeEzLq9mlsWZ9Ydf
	nPMIR+AgU83sOGylilS+3JH6S50aZyhpDTqQJuXg/4fY6BXu27UraG82w95DgChr
	ctnoNLDXmX/mobTgs5KjgBmraDTZdfd7Pnf2CuhXEwzQLeusiKtQSVHEerQqMhNS
	xWrbS5WdjFHwAhyJ8caGxxRo58KL80mN8RYwWIFyfO+n3j80TrBGHqgaLSKOjzBg
	e55ILfB8M8dYuxodMivdZqUqG2fEon5eyxY2XfxI7qu9p4DngItz8mGeSY6Gl63v
	uBI6Lw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c602dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:21:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-522de3c645dso52889271cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785144099; x=1785748899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqQE6EJ/sZeK9Gs+yGgiu4HoQE4qPd/3LI0KMakU988=;
        b=MYh62izojB/mGF+Hodb3Va0LjQkEOS01rTG8AoWhah7kdb+Ew6bFX1LAJvWFqJ3GVs
         3zRkNr6wwpxji499wElC/hRik3+CdRNTLWN33DUa4qUgr26BL6WhXB6RbL8FA2DYqDaU
         AGZf7XAeiXwe7YZlfp+3nTSO0iVJrrIkRog4YqCuLb7kDhQMEs4lyITSJPOmVC2/J1nF
         UNDY456ObE3dDc2VVX2AR3EYdUS/7PTSD7sxq5lgkd2O/4iLvdjwltoQAbev62G/IRoa
         7BHBsVlhwWm7dZd2qlBzRC8OXn0to0PdNup9XlWhErlSBGE4tKcnLmsFZrpzg9NTWzwL
         pwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144099; x=1785748899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqQE6EJ/sZeK9Gs+yGgiu4HoQE4qPd/3LI0KMakU988=;
        b=U1ggipLTD1ZKKJdnqao04eomnLkK993U+SreisP9F9vuzhnMUZBoW1+IXU8+/7euMg
         K4YwvqNrBg6EdXeVvOmmQ3ts8JlHWEyOSKobsPDTAvPPLDE9U4aijtvpt1bZPZ5ZwPZz
         vDhdJfA8ie8v7Bz3A7xKs+7pGsDBlUV/bUFeJcatCCXbHYVKmQwCf7DYhNCzfsIatuDY
         G9dM4sRY8bKQtmALIsS8UkSNVXxe8IkL64c6K/ufYLVHXbqxprN3WMiIuudUx/sJW5oQ
         IRlydHM/mjAFVh2mzGUzn677tnb0ajmCRYxHZnK6SDW67x6natDomIsGSRbSjWMu0iVp
         UYbg==
X-Forwarded-Encrypted: i=1; AHgh+RpVuAaI6F6fT9vkxguPMaOO7G3P5oukqpQFtVZGZTPDjB7P/cMgTVRJzeVrw3+21QTsbgENHDdkNykBuZ9T@vger.kernel.org
X-Gm-Message-State: AOJu0YxfOBdfEyjc8zJHl9HIvpLHHHCvEucHZCcXqlq/EmkJHxgyGkPQ
	HuUJl4o4nJdRNiKijzGek557cv35j7rz916WW0d1SD9+puYYzod1fm14bhH8wUpX3R7wTrSxAN/
	QsnS+Pxlna6QlaIFaqS/GYYb9+LIXkGXjfxekI5LGmC76AfF7nU1rzO2zFcdI26agQK4L
X-Gm-Gg: AR+sD13JBSB8FL3dTFKShFBG5Cf+bZtNqQJs8zemfz0FXnsr7DY35EtL1E5djt5tQ94
	00s+NL0mLJsvujgICFjrfP34WZ5TEclLg3zwIMRKF39LsZDep3F+MAYHKJWd7D7zMTL/JAh2idy
	FyDxHjOsrLknX+d93A/lTFD0H7bs3PRR6aeTv2jSIlaRZG4eP43mgIrjkXTmuiZGtS0qMhqK/gw
	71nn+7AwQlgr2sJarR2+wtBW5pLsifIvS3g3TETyeGR2BLjMm75M5boZYvG0BvVdTaGbnruBE9E
	B/vN7Sx3ZL7VlzFjqPZhn+tEtDRq6B0dAIRwxFmj20nZw5AVWekHtiAip7AxZNueS8kuQsNI+/a
	pXIiS3Ngy/xuP6WWX0EqcDCwQ4XN+53dqDT9uE9Z6MF6Af1TTG/up9AnYAOrqJoWoioLskYd1hq
	z/haqejX6Uk+nFozY36qbXgYhUKawwF9yvLmd2VfV1C+05D//cTlNM
X-Received: by 2002:a05:622a:5883:b0:51c:7b12:5fd2 with SMTP id d75a77b69052e-529a8775ef1mr73343111cf.78.1785144098661;
        Mon, 27 Jul 2026 02:21:38 -0700 (PDT)
X-Received: by 2002:a05:622a:5883:b0:51c:7b12:5fd2 with SMTP id d75a77b69052e-529a8775ef1mr73343051cf.78.1785144098322;
        Mon, 27 Jul 2026 02:21:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c9babsm2265326a12.12.2026.07.27.02.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:21:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:21:33 +0200
Subject: [PATCH v2 2/3] Revert "i2c: qcom-cci: Remove unused struct member
 cci_clk_rate"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-cci-clk-fix-v2-2-c3958f28b045@oss.qualcomm.com>
References: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
In-Reply-To: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a672323 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=wn_r6Zk-WEjAk6jVh9gA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5MSBTYWx0ZWRfX9GBNPmvSxr/N
 oKxLw/4jmwEP8juz/dR19koI13gf9uqXD+EUDgwdDvZMWHs4bQnRflw0sUddZgaufjVP63ss8M8
 PP2gb0QtPLhcHhL6RYRJB6urKjq9mX8=
X-Proofpoint-ORIG-GUID: bFLRb2fbSZQdJlADX3cAuPMiQJh4dRJS
X-Proofpoint-GUID: bFLRb2fbSZQdJlADX3cAuPMiQJh4dRJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5MSBTYWx0ZWRfXzUbVGxRQZ4uU
 ksLJ4GYwpZMFwGKQuH3SAK87K31HWQ8RdI5534c5CFjqeJeHhSbpf13sVZbpyaOCeJy3bYoL0RU
 xZJ9VG9C+Ungkvm4ZcFnybpoVFN3fwnGrzHJw4aDLKimkFFL4eksUHAgm6aeNjjKq3nlCmndVhf
 1imAsP417k4j/jhNXllsH7sbpgifM1DGUTOALxoHzTktE9T2u0u4PzVzUeQRLqA+AZVJIPRUPbi
 HcocycIDJwp8iOIzQV0tkzWJsMqR2RMQFGWfwbF48N2T5VahVZzl3/Pjx5YVw9GZo6/WUKXqoMA
 CEfaoliWojoYVloktgMWFMQGJQtix8+4h8M3P5JxbU4KrKeTXZCmJLUb8WUmRkQbxyrsBk+gtOO
 LGMO7C3AWO/jNCaA+gJ25vJO6joMGOv71tGo12dERtPlKv1EKllkon1n8mO+JZEfeNi86E+0yP9
 5jFL8RhUtAfgmPMU4xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270091

This reverts commit b641af684fc28a07bee9c808eb6c433f9d9bcec6.

The cci_clk_rate field is needed to enforce the correct CCI clock rate
at probe time. The hw_params timing values are in clock ticks and were
calibrated for a specific frequency per hardware variant, so running at
the wrong rate would violate I2C timing specifications.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 23cef922351ce44d71f1691cd7e4aab274fdd196..2ed58b2a2f31c62ee1c972a53b71f86787144b84 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -117,6 +117,7 @@ struct cci_data {
 	unsigned int num_masters;
 	struct i2c_adapter_quirks quirks;
 	u16 queue_size[NUM_QUEUES];
+	unsigned long cci_clk_rate;
 	struct hw_params params[3];
 };
 
@@ -668,6 +669,7 @@ static const struct cci_data cci_v1_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
+	.cci_clk_rate =  19200000,
 	.params[I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
@@ -701,6 +703,7 @@ static const struct cci_data cci_v1_5_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
+	.cci_clk_rate =  19200000,
 	.params[I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
@@ -734,6 +737,7 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
+	.cci_clk_rate =  37500000,
 	.params[I2C_MODE_STANDARD] = {
 		.thigh = 201,
 		.tlow = 174,

-- 
2.34.1

