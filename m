Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2774CA282
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645921; cv=none; b=QctNHSXfemxafBOS3pcGlUZrqiiZy3EekYeCAqpZhL90GzcGCp1CKIQL2s82BM7Azy8MCOn7mPY8RiszQ4GA/yTbHzJBfNxkJSJxF+iWrLpKWSLXk433hc+b8rZVkZxuRiYlukBUEYMKCGINLB4+gLeMI7s/PCyA8WXRC0AwYfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645921; c=relaxed/simple;
	bh=IG6nNY2rpLz56Y4qeQC3PTx1SQ0y6+9CgmNeqxv5pFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCLnZi6wu/e0sO1BvnZlvezq7fghvdTAaJR+bUENU6gvgj66D0YSFsec9hOb7GOTVLTwX06vuyfW1IQat7vP2Vcb7UGCV6l/rp6mCUmTdliJdlV6qF5rKZEKHlMkIzbTmlPeFYiqCO1KebfJbqT2hPg/2+igJ/tTNnEEEuwIe9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGWhcaWG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dvLnMJ50; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGWhcaWG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dvLnMJ50"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg2Ba1805576
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NvVmHEiARXUqdG5xNPL/AxvPN8bY9Ggi2ZtbAMd1uU=; b=CGWhcaWGMDfTYyoN
	YEsHGIFs3e2TLxnq7jwlxjzEKDT9rFgUnsnfYAG2Umv1c8yeL8vQmXNocNPmkRt3
	SFlIoV5iXvb7BeZrplMlc0XhOSZNJNsytnfltarf6fPv5+zlyctwPhdhQbhqJAoX
	SLLoDt2t04SrTYkM4+IKCLF+9LEWxRh2oFT6l4pqWTmVkqA2OUrozVeZgSDNekZz
	sks2bG9V1Tl5a+UFg2yvwuDQ2RgDweGbrkOASmODV0wvx+yOYm56iJnLh8zdsOki
	Zb1Zl0taz9QLoEiWWZ68ZSHdpDM8aBY517akSGE0PbQDtH2TfVOIIJzp705UBI26
	+hY8OQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa9be2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso11540621cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784645918; x=1785250718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NvVmHEiARXUqdG5xNPL/AxvPN8bY9Ggi2ZtbAMd1uU=;
        b=dvLnMJ50enGdnAaLkqlbNUDfq/xQpNIlHlRkhj6MHzKsoV6B292LvU7oLP4M2hDhlc
         ETpL4i1qNz9jZm+sRex0SlE7KuIBTkgN1npP16cuT9fncDwBUsOKTlIKAQPHjJrFs4Rj
         IMLtpCIRoC+BkFWmHuH5znlTNZBhIk1NARdjKF0Ylynsz7NAWmfKPnqmNr4AxDayjjJJ
         LBk42c1Atf4yMet1nhcPPCtKB4bL54rgfUSmkb36+/oci3tXCBwLFE4luKZvUIEceYpq
         50zHIpsbL6up+yPBl3AAytcZ8nYL3IhfXsfeUPoL/bsIzqRZRhePzuu8A/lwamf1z5vT
         +/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645918; x=1785250718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NvVmHEiARXUqdG5xNPL/AxvPN8bY9Ggi2ZtbAMd1uU=;
        b=avX1m+dxQaH19p+ukT/E3GVIGfBXU5FsgM+xAEx/Nc+GWHGunaA+cLzy/QjhKt+LOj
         nQ0ua+tfldHtBRsXKbaVNdEDwLAK98Qd9pYBczoQfm8U80cPQrNOx/pfOvy+JQoEFCzZ
         btbVz643AeuqwT27HNYmpUIXKFh6kf5aXEK5WTZC10vMaIicfBvn/xFLQWbKR6AeNgaS
         MiJd5YWjUHPu2zP7C+F+3Np5qmAK84M4BvHu2HxSy43bNzseGHGsoHNeTNO95F5ABd4Q
         SVyxbu9wytKuIrh5Zb0LZDvU2AGkFPnR9TzxGL4f97Luj/h6GDB4F6Yd2AWN0LM0Cpzh
         VaTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqq1D4PpHLoFUrbR+9XH7FbhIXWgzLZTesH0LPCs2/dYDA/Gu5ME1kUFk7pCYu6AnJUqiGj7ccR1Jzxm/zY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn8eikOtsaWOmuXueKS7VTq4kSpkkfEhjmbY1QCfm6gSRrx5a0
	sOIzolY1IITZ3thVU6BPUVEwwJOSJAMHBqM3qVnIZAw7agdg/hWH2XGtFplfnp2Tbmjw5dwUA7U
	lCmOPNjihXwBl3SvD+vdXHdw91jIBGwDB9DBGEANZy5XeXorUnm9N/81594Mu3HoCsk9x
X-Gm-Gg: AfdE7ckyBSLHbb/RP3+h0dGIpZjkQktE/94DfRcJRi2xciIUdkIodblpTAkoFRZ6mQK
	Z9exh7wd/ho4FjeFJFzxRyVw7MWdm/Rl/BuGroUeEbdilzkxztnViR1iwzqiUp4xS8L6pQM4BPq
	z2JM4KVnI0RbBDjjy5iiaHH3MKPVrGvSqHnPjEnKpmYn/yRjSze+TGW9W6D9p3r2yvi7l8FqEF1
	HHWn0rjvkixwFAMMyNSet2nebzv6wZWvYxt7cRiYkJtkqeDibVPszhajP6/qlL9epMKzuU0+hSE
	+N+azucKyOhP0rtR3NPmbH5p6mlGgv11JrZUxwSEktPyIm255EwQfM5MMexAPa5GjHYEMB4GU8A
	d83U0QtwwQ3ZDRq0vnk2UZQONLJaQY81pO91qIBoikdnmMAxpLOYqvSTdqUrBQY/4bpaqoPauJc
	2VSBWO4NqSY4wPpdDxnXjOVn/xA4gEN4Dd6NRNOLz52FIIFA5FCEE=
X-Received: by 2002:a05:622a:4ccf:b0:516:e0eb:d7d with SMTP id d75a77b69052e-5213c2028b8mr186795981cf.27.1784645915872;
        Tue, 21 Jul 2026 07:58:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4ccf:b0:516:e0eb:d7d with SMTP id d75a77b69052e-5213c2028b8mr186790761cf.27.1784645906827;
        Tue, 21 Jul 2026 07:58:26 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbba0fsm5875369a12.17.2026.07.21.07.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:58:25 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:58:20 +0200
Subject: [PATCH 2/3] i2c: qcom-cci: Add missing cci_clk_rate for msm8953
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-cci-clk-fix-v1-2-5eae78700da8@oss.qualcomm.com>
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
In-Reply-To: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: HL-T6s-PL-W6t1LGJv6i1SXCIqMynG6A
X-Proofpoint-ORIG-GUID: HL-T6s-PL-W6t1LGJv6i1SXCIqMynG6A
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f891e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=JZ_a1HBs4gVu24XmFGcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1OCBTYWx0ZWRfX5nxRZhWvUfRi
 XHVH2fdG2V0K6rVffVU4DmSVRnmL18TpS4n0hI6TyxidEt0hT4IRw7eO8Yzpu0sUBr4PjFPbYnC
 aDEIdkAVI9+sUHb2GDrHJN90bVClquvg8whNb65UcO4iUcg9aGVB3ZsqeGa+4BaqCj2NBT2/hlT
 Ac3c2g0JzLMmGAVWKeKcJ5+GoC8lsrfmW2xz+Y9c4fTfZkVZClCGafTiGogssVefJdVK4Pq35OS
 cX0u/dWkiYVJnxw2j6gfiHuYLB9GZeyd0lFH5Kaodv9TdnT/Gh48b/hPoyeeDwWv+QaosecYaMM
 4vSLStkHPTwjGEqYQ6W5/WoM8UzQCV5JNGuCzj3b4NO52EjWNXX2EM5h/9K0ziyEUILTQ08WUrl
 V85ZZMzYs6nB91YrloL8d8nGkxwfFVlTxRqNaaHrRVXQ4iw4o7iZr5tw6xbg2e1jAvJC7SH+5FL
 YZhF1l4QW69W+3fwlTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1OCBTYWx0ZWRfX8fdrk65qzy5T
 +5cXlIggs/oB1bX/detveaazwL3c3It9ZUUQp5YKDKgRl/dWpqQ0PpdIS9QdIhxrVjRllx/HijE
 OO6HZ1ZAEY2E3eoO1pfeXlanzTi0C+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210158

The msm8953 CCI data was added after cci_clk_rate was removed from the
driver, so it never got a clock rate entry. The DT assigns 19.2 MHz to
GCC_CAMSS_CCI_CLK and the hw_params values match those of v1/v1.5 which
were also calibrated for 19.2 MHz.

Fixes: d202341d9b0c ("i2c: qcom-cci: Add msm8953 compatible")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 19e4719f13b29b2cf60e113565b1b63f19d0e669..5f74edde8558382e63e2c3d0fbe19489f325e8ce 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -783,6 +783,7 @@ static const struct cci_data cci_msm8953_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
+	.cci_clk_rate = 19200000,
 	.params[I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,

-- 
2.34.1

