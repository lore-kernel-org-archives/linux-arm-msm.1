Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC14642DA53
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173618; cv=none; b=hipPFfya1zwVC6zi3KjPNc+G9WGE87+HGGuIghSJo7pKclw2Jq1rEULnDzSXOL3eQJcwmj1maYAVIlqvsa+YxuhczZvx5Du0y+lEO+XwrkeA3EEUL9HBVGB8UWbVCnbdJICKYkG8eA47KsBSR83/zcXC6budvG2+lzC5BeIQmYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173618; c=relaxed/simple;
	bh=7P85hDswDllC2qemhbx/4JhYrERCeCIEfZyvVZ4Md5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7nbeC3RQyK3PbzRb5+yzv+v2a9TqgfkmHWodjxUM0Hac1w6bk+RTsGdP+AOvvxP75g2/IdzRUHAJjMIYTYrn40R+H8fyn1RjyhlBrJT6VX4N65mEBaKGROUk25Z7QUdsXH2AGbFmp3zmIVXXXHvg+FG4k1XRAM6JIgwfQhRV8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6yZMlzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrlEQpTI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6yZMlzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrlEQpTI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZCV4115088
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YhD2+q7DI4A
	UEN5rkLNrrIb48BZuP48MkgWKn7wK1dc=; b=H6yZMlztaVJxlWo5rCHHOWyWfA8
	g5ItqUw6r53slx3ZcT/46RSMcr3ATeMalBR6NJsVJhp8UKBiiUF2xcu45raH1L4v
	ZoN1u47sx5+A8cMhyBHpJjQaENZOOt76Sk7k2usbJbXvEvd9AhRYjSzSbT5CxUTw
	NuQPTqB0rKkK6mCS62lRk4CT10n1KDu+IvrPPUUU2/W1uf5RlO02HSpHZMpSEyXg
	bddbw47FJ2rioypZQxWLOx8azF61pOb3vKd1/f6EX6Gr6fx0opGuRTuztjsv+hvD
	lT4I/b7UuFcj7cQBfng7pKcIkqTkyrq5vufTNH4YzifrwkC1yUqm9SW9yiA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrt2vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so64540731cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785173615; x=1785778415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhD2+q7DI4AUEN5rkLNrrIb48BZuP48MkgWKn7wK1dc=;
        b=hrlEQpTIT7RDkW5AYT8jDxzR8OzIUxxlnrVJoMiIhFOzm2i/F2RvzC65dp1LVKPyvo
         t/NViyUygLc4cY+ryM6Te2yvFn1H0ESUNhZxGu7QP16ps+p0N52gYtvtnyUQDhcDuXl0
         Nt2vAcJkpTPW4TuQTqcjNfI7l4lIrSevWwP5gEE+3gikgqnsgJkq4Eqn4Fp2vB0SIpqc
         jlcA5HhJnssmDipOAkshA4RTzocHRD57IJMo+4IDrgNf0RLVAq0IRfdTIMEer7OUF64M
         rOfLx9+LbmQuju2vLY8HGn+CpnQufI3sBvY2x6sbNhvsUVlEVKD2AQY+e3kmTPecLLIv
         jHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785173615; x=1785778415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YhD2+q7DI4AUEN5rkLNrrIb48BZuP48MkgWKn7wK1dc=;
        b=kUWTheKLloF8ugNORvFnIPRLjcpuycXR2AJwAoQWsTP2HlvRyjjuWBAX+Relid1cI/
         7t6HYpyS06o3T0xi2tAtprHYXNNCvW06Q9As7wN6G3FpKeq6wGwTIZ9UCri/dQo8HI6T
         Tvi7ySa6ATHQ+zP6a1FompiqqeZwCnZc7HJRoStYDYa4yl42HA71o9IRtL6ADVPtwwQZ
         Dbh0WFFrHsIJHKd2KjFjyXr3BA0+CyvQ8ba9ity4jUB4M/lKVtzz/6v5vK1ZL1qL6Jta
         ii+SvW1bTGvziChOB2qIhcmhQz4e9gj8OFIbatcC7yXX4BXQHEVLg5gtRuBLG0s7Pjnd
         i6ng==
X-Forwarded-Encrypted: i=1; AHgh+RpDQBa8wMJFV9A0VuYIocGI/Y4TppAtLUY3XnR9gIXr3KrXVRtxnik9ZN+ykdLUiWgyrYA4nRf/E1kwI2sw@vger.kernel.org
X-Gm-Message-State: AOJu0YycWg+/FxD2O8ZYteA7PXHfGbbI5FrCCbNNFBWM6rlj5RsUCC0N
	RdeTuBk1Xc2ujUj61+r38kE6exvrZrP1+MrtsBwMyvlA5yIC5oJ+ZM/T3Ro04R2wVjWMc2Adnd2
	AaZ6jLLh4ywcOCii2299MEJ4LD+LNxDzxv42XvLBHvVaRcsF0yo3VXlKmFn4a4roMPEhr
X-Gm-Gg: AR+sD10u8rNq08doOFbznYZZEa7O5NAwxN8lmpua2KCr1WVGEXZNT3VEOYeA4d/qbwK
	ccAr2Yhx2Vw6RmFRZT2KRcly31VQWZXdDxaPXhxIGbTT4cffFj50peQqOJmPIRYFR+58Px3eMSB
	TKEKDIrLviz/mvIiLD0F9l9dbTmcNbX/VcI4R5WoNUJteHl3Yk3MlCT0yGi6Lmotjs5X8V+E1g7
	wFQGX3pZuvG1GNFrcCcy3EaDPs4NKkU1j3xsDnns1ZYbs9TfKDMhraCfrcdr9qm5sbrey3Czwn/
	Mw3yTABXiPioB9tEwb4cYUbU/gP1UCVHcBFdLprQYvuuASwzJc9mZYfbUTCh4h+AN9wxGE2h6Qv
	Lth04tJLlk9sXrxbMXVH5UYlnYdNl7i/38vU/x0RU
X-Received: by 2002:ac8:5813:0:b0:51c:7b12:5fda with SMTP id d75a77b69052e-529d1c72479mr5131711cf.86.1785173615027;
        Mon, 27 Jul 2026 10:33:35 -0700 (PDT)
X-Received: by 2002:ac8:5813:0:b0:51c:7b12:5fda with SMTP id d75a77b69052e-529d1c72479mr5131231cf.86.1785173614486;
        Mon, 27 Jul 2026 10:33:34 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm2945391a12.15.2026.07.27.10.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:33:33 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] accel/qaic: Add <linux/device-id/mhi.h> to qaic_drv.c
Date: Mon, 27 Jul 2026 19:33:23 +0200
Message-ID: <20260727173326.2219191-3-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MiBTYWx0ZWRfX3Rcim6s0X9V9
 T3nQYMufeKN7Z1FXyMLyvQnowabU3Z7DMZsKGjMzFgXR/+jvFgGTI5mf9bytMF6/yGEFzKrdC1e
 j58YKSyaZWY4n5GfjY9G/7+EdgqsHSQ=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a67966f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=470nOrkEHAbYtoG9YpMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: uYuXVK3JrxzILwRD6qIHyFSWIR0XE7BO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MiBTYWx0ZWRfX7i+0atQVF4v9
 FE51MaM7dBqRBbfO+r9r+NrxWl9aho6ebeskVleeFW9SGyJdhILGH6J9EEwGuXxdy4A9cMpwlZT
 9NzsLgyxwa6s8P4aY5PmdlUhoNh4/aIrsbX45ePXmftQWfNMmU3FA+Yp6aaudujsMU/OhQ6qvcn
 uyOevRPYy2KYwCgU7i/FdO9rFOwhT3ifNVdfZtBfE8Gq/cHzk1vGvtpupO8/yJlvlUbdBMG+asT
 6pfYwOM1nJxYx/RBwtapef/Z1PmyyADDWwXoM6r8LIMPnkw2p24QUusaSzuptnukzHqHwf2dx0K
 w4CgmlI0590mjCfoohWiKMxkVCztXrm/peRDh8mDRCsEicvZ2Ro6OMcHNpDYast7dNUeDtM6Isj
 +SWJC9E3sHP0fuPFtnkd3dZn+xzvaQWaJMa/PpvovAJnWS7BV887xrSEAaz3VqBlZkp4skpfulU
 /iJRfJ5w37g/2LybjPw==
X-Proofpoint-ORIG-GUID: uYuXVK3JrxzILwRD6qIHyFSWIR0XE7BO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270162

qaic_drv.c uses mhi_device_id implicitly. Include <linux/device-id/mhi.h>.

Fixes: c501ca23a6a3 ("accel/qaic: Add uapi and core driver file")
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 0acf6cdd44f8..c1bb6db78d12 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -4,6 +4,7 @@
 /* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/delay.h>
+#include <linux/device-id/mhi.h>
 #include <linux/dma-mapping.h>
 #include <linux/idr.h>
 #include <linux/interrupt.h>
-- 
2.43.0

