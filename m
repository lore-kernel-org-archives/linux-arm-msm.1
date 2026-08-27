Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A620035295C
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826995; cv=none; b=TPRN77KAGNhPckZk2Sqq6dPaE7Ryjs9g5eeOACPUV8OBKIEkzTH5FfUfPAlDPYBoi/kTGLl/lN4aKAFRXJBf46eEZD8NXmZVxcwSVehcH/ZE1fn7vQBdanva87VTcqngydIj0y6Nub72eBQR80iTQIorNDNSfBDXZxgifpvrWxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826995; c=relaxed/simple;
	bh=R8NdFiTTELsNPWU5Kfh3V0If350yDqkrd80DIpjhzBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OoMItUj4SJnJIMQ6C7nFlfD1MUYA4XsIAqH5feAtcql5rU28hDJnyRk+djhRlOys3gF2JplQ80C9/f7i3lxYtQEU4o/Mm7KVzmKsqrsInFn7/7ZCd0ldUQIFbEz/ZltZyQ7s1bhXLDSb7YO8BZU5Qj5X4/7Ug18jBqJkpeGmitM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOgPKaVk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmIieSEK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOgPKaVk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmIieSEK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9HjGQ3643614
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 10:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=49BmMEhz3FqoDnV6VvO1AkxNDAyy7o57JLC
	z/BedGoQ=; b=OOgPKaVkAxVfVboRi0fJHNcCevK5jbr/9SFhmGMyWJacehZ6gRk
	gUr4t88ttFd6jyicMhKxFv7LvqeztWMGst4sK72y6hX9z190lNyyCQ5/FtZ8LV9U
	nv1RPHc2bjDldsooc7eyPWIHMQgVGxZP+6vx8F8+UWWqD+Y9hwL8+7XeMmOyn523
	ZxgGF6QNdJD2iZ8cdwBYJ6kYy1drfQDVBTFM1dV56yuwSgIjiQKzbLVXWeXZeSGz
	MqZuwLIBBG9tYWXkYCiRAECerrMTPqMN1hTpkadlHLZ5KUWDEJkz2PjmwqsK4jJa
	2exqHdD+qhwnVox+yKLDrwYtiNewA2Tq6Kg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4ecb9d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 10:36:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088202so648534a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787826993; x=1788431793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49BmMEhz3FqoDnV6VvO1AkxNDAyy7o57JLCz/BedGoQ=;
        b=VmIieSEKbPzwWKawSNnGX/I0sf1ZRwzyGOr7oD4XS0YZzive235W0bSXkihTgvCUUa
         uS+BrCq+7tvdTnp5JIBfSyA9gnCQHfkPIYr6e7ZGWMVhsTdUu5SBTfMS2R4BvIn6y0aF
         W44sPzPTmcUrColLLMExaz8gwjwQKe3sjPVP87nHPbmyCwjZcdWV6Chmq4ZmOSLw9rBo
         pHpklruhG3ztBQpqk+VjxGY9XWQ5vkJerOsxKFSL0vQl1fxE8tx08RyxZ8DmmnrcKnUp
         k6pMpQ3ONpyhwA9ndttOzY+vaIyQeA/gGfwx2G3O7sh1ll8x2VjF0jNYuLSAFZtyw6m7
         OIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787826993; x=1788431793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49BmMEhz3FqoDnV6VvO1AkxNDAyy7o57JLCz/BedGoQ=;
        b=AXGUAfh2ngUTK+hqnZQJZWn/SKqL+UPoNXU/q5mKrrErTXEiJ+uPrYCtWt0h1q6Sso
         YTBXoMFz24JLnGm3T5ZDykfVo1vs13vR7s7H2Lno8zycz78Mq9J8yfjI4vmfM51qrmDH
         b9fqAomCCq+GYRO7Nmqv/x/vrGr3jC3rWIjlkIysI27OXyczJROMKEHuOWoFPKnNJYJP
         wjFpAaPSBrYyu2QhYr22R8Lp+mMduf0mv6B5T/EGs12eIei1BO84NcJFRM/pW4f0dUiB
         E6U0sK5BOdK1mnIE6wxDT5OGPdi/WLEUdRy41b6AGgZt0dKAfLNeU3CHcG0H2s+QFflm
         VNtw==
X-Forwarded-Encrypted: i=1; AHgh+RoyTcVjaZlnya/HpaPd33xopcZOrRXFYPTv7ppoArIIK/tY6joaeCUEPEQeFi5UpaxaYxnYyD72DQuL+AU1@vger.kernel.org
X-Gm-Message-State: AFuF++l7/5b95F6/iMljuqDMYy/3FMM5GmHF3yQLvC8BcKG1BWusOPK2
	FsNejMvJ8j4Y2+hPt1Z6Yt65CN8JQ2woYbzOpiiqqhELQM5jFnZd0m2wbYB8biLFpCVSTfW81/H
	uht+TXkgEq4tHhg4SH0ABA2LfPDJa45Zz100e5TK2nkb6ijYE3OeJaWoa3bYDjZgCYlhv
X-Gm-Gg: AR+sD13cW8kosP6s+8PKTqFnH7xeZi6yqRTv8IYoBSisiGz1Jn831SVWhuzzV49Xo1w
	+Y47NkGBWomhHvS3goSJ8xCRA4rxFeZootNSCb5x9wETmODaB92Pqbu7fBEQxJVzDD4mxdoXxC0
	Wq0jc6CUSa7Qbh+Cxnp479XVZN8DAnE2UlrhJa606v7Ji8Mifjq+H00DqKgpDp+YJVDE4RhNT7/
	bcl+GRu+oVQO4rOsmqvbCyGQJPssodb2mY2ZpHbdWCcwnQMDFshpKg8k4iudLLrIuJB61KQ4Seu
	R/pteQzd6j60j8rKswumvGDH363j/toOOJW1WE2o5sBocoW+tHpOLXeaebuoZAAsajIltdhf/5O
	00MN6LVvNHeFCI4pyHPuYxqi51Mh262WPKxS3ZBx3suUgL0a2Mhvndf5+xw15
X-Received: by 2002:a17:903:46c5:b0:2cc:9179:335 with SMTP id d9443c01a7336-2d707a5d142mr256847115ad.8.1787826992829;
        Thu, 27 Aug 2026 03:36:32 -0700 (PDT)
X-Received: by 2002:a17:903:46c5:b0:2cc:9179:335 with SMTP id d9443c01a7336-2d707a5d142mr256846265ad.8.1787826992414;
        Thu, 27 Aug 2026 03:36:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d9e5fb1sm29831430eec.25.2026.08.27.03.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:36:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, Vinod Koul <vkoul@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] thermal/drivers/qcom/spmi-mbg-tm: Import IIO_CONSUMER namespace
Date: Thu, 27 Aug 2026 18:35:55 +0800
Message-ID: <20260827103555.883018-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a901331 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4ZI4452vc5jSn75PgjkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: HIOg_pfi6vSqDcFEX-A_Bion4TPTM-om
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA4OCBTYWx0ZWRfX3LVV7jXrYvSL
 uM/DXfRHLrgM6+lPZAzqt+qMZkDhbiXxYkE7bYP2G3VEgHkYGS4YK8ev25KQx4kj2YkjphcGfGF
 FZZ6lE4MjybdcA4jDbN12j7sjjSiX7SCkCw26rkhhkohUe/8ru2ilDImQoPLE7lv64+SXuHamdA
 bOX99ZPZeO+QAwLKdWumKAPqXyx356vE24tfcGxSVk2qATbrE1W1KDyLH+jsyU2M4TF5yG0cN8v
 Cb4gWAek2e6Qutu2cGdqfUCvkZkKHetkgVmtpFmHmRd/EX5e0MGV852kCtL/MPX7mi2jUMnmqYx
 tl+9VUG9ER0j7bGI+BreZXLCSRRYBnhIPjet+E8gZa0wlyyyJz4xgs7LM7c/4QyZ+MF/CV559Kh
 nXQohiSnTILBLq8bZe8MUDHpTfxXEjWyh7TflgOSahsRHEx6wCf+HDzUtAjhIPCiwi5Oap6ps7E
 Lg1MV3z4NFO8sol62ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA4OCBTYWx0ZWRfXzPSqrY3NsKXS
 trvY+WjVF+rq0A/2xR4ntnirloVxhbMKR4X9q6bz/fxEJy26uVpTVUEI3GBTcIfY9TAQQw+n25w
 ctF8uG9pr87tXcc9oZhnw4rREvz+Rag=
X-Proofpoint-GUID: HIOg_pfi6vSqDcFEX-A_Bion4TPTM-om
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270088

The IIO consumer interface symbols moved into the IIO_CONSUMER namespace,
so consumers must import it explicitly.  Without it modpost fails on
'iio_read_channel_processed' and 'devm_iio_channel_get':

  ERROR: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses
  symbol 'iio_read_channel_processed' from namespace 'IIO_CONSUMER', but
  does not import it.

Fixes: ebf1d03dab96 ("iio: inkern: Use namespaced exports")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
index 0492d5eeca01..012eb2a5f31f 100644
--- a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
+++ b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
@@ -252,5 +252,6 @@ static struct platform_driver mbg_tm_driver = {
 };
 module_platform_driver(mbg_tm_driver);
 
+MODULE_IMPORT_NS("IIO_CONSUMER");
 MODULE_DESCRIPTION("PMIC MBG Temperature monitor driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0

