Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C077F36E460
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321339; cv=none; b=ALOGdGy3tvquQ+ya3GHj8/PUfrmzErOh7sCaz6R1NFSwrcLK0LQ903NVuGvTEm1ZJ6JotMLWK2spU2xGm38lQSJCTSOksgBvAo79AuoFyOFQuYQZguB7JHny6Cy0y/Mc0p5BNKyKHPImFHb/Vg/dA6JtHvfuhRcf3GG3j7DPlbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321339; c=relaxed/simple;
	bh=wZufhlf2OrTXiXq8s7psP10WRX750jNvVBTi3KYm6Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACY2xlSMNySA/hpNMLU/WEyfClfpUao30vTKK4uT7dBmrsH7AlZeoWYuIOpVcsVzThg8PMpiZ/VzQVbjosWD7OWe8JZWJXe8qCngkqzvJ5QOmpvUDeEZ7pTDqPCvIN/FJe22CWF74nDH2X/Phh9KZm7301iRUf4wOe9lvYrMEUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEVnMuB7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbms/t05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEVnMuB7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbms/t05"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtPhC2906236
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ss8T08lcQRu
	h4LT8qU7cdiXED4Y+cvXcR0q697Hi17o=; b=hEVnMuB7JH37W5cfKsOLBno8Ef+
	94Q/ZxE9MwpMWvrnzYCxagCyucP5XO9OyUb5dA+IT9jl78roqA4Vwj/Rz6x7R0ni
	XFAXvdztczHynVLnsFP9QuluXxaPv8xhQEBXsex3BZCNVMltbrBZuGSvNL/age65
	iJhAn1fbiLHFnnMW+h6s2xe4ogrfxM0c19CXNfNAtgEeROW1Q5u5k4uTEw6eeUWT
	2p7T8P+0lMVetpGHFruP3wsfcEk0+qi7XHPG7RtxRgRwz1RLSUHedV9mm+8ZodK/
	ZPNqfevnPGMDNCkZNwvQ5gpAoGVz5J5KUjBjiFFHijNBiMMYjnYqnILd7Gg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq8rdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a651759a2so8356795b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321335; x=1784926135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss8T08lcQRuh4LT8qU7cdiXED4Y+cvXcR0q697Hi17o=;
        b=cbms/t05DbIC217A9BSQXNco0jonc9pH4gRhnmU1LayNMj0J2PoiJ7cKw+aw8O1VJE
         0jHSp4pwQ5f012w2OTDd7oVsfl6UHjeJArwqs1dPE88dC7mdhfR3l0NqSj+WQtlmmY/f
         u6FW7AztLYUu+WajQOPKUMCkQBA8SlP5kthDF7U83mo5pNtOU+rjmhzPdpf+DVB+VQVW
         jCUeJDwc6rk1tv7elHIfrIXQ3Qelmuumu71m1OtNXcfRTRLpV2JmDNbek2VcmW2jYCvb
         zIeanuC+WW8znGfjEQvswQQeYweCpCpElIGEtuhFPWeJ97dWpzQPK3r6lf8rg6No0qHw
         Tl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321335; x=1784926135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ss8T08lcQRuh4LT8qU7cdiXED4Y+cvXcR0q697Hi17o=;
        b=XGc2CFWZZ5PFwddTR8w6gqZ2uUxS5pT1BjDFgZWXB2yN70x4fPF30WaHidU73U6aGc
         XmAo00/bVCWc/WM1MvpXm2Ou3hbfD08kXSHp8hFYVEMvPz3wkC9F7aIaottiTAICwcpx
         wW9TIeZe3q5rNDRPg1Jy/Wt881/IT9W9gNJviLKxUPwnE56BX7IHbK4aiW0eu1q40vYk
         y62O3sMpEW03hZVEtXxGosDLyegZIxWje8f94R+7Oig34tncCXXsXCkXLmrHZM0i+EKU
         naWdv0CXJIKX9vVaiBEA3NqVVV5P91gUGybonDzpnrPZGVZjBdoZRPb362F7MhITnoYJ
         HD2w==
X-Gm-Message-State: AOJu0YyXW7CSn5/5TzgxcRpnnEDJS950emIDyz4CnnFbK+8qn6MdPrmX
	c1iLNgmqo5bFNdh1oHcJiQX9h85SigLPY69a2f7n/K5mvsSctX3p9kDaiELbAZshxLHO/nTPLH9
	RmQSoOKSkBs66e20cT78C7M/X+n7TXJaqdyvzdiRzUOu+QXsWPpvzI5Ghi3QD+Rc41x7a
X-Gm-Gg: AfdE7cktTcYXk4FybHW4tK7z/MItPBThwfU58C2QpdSEAdYHaqJNjzY9Igicr14igxG
	AIDVn098nXNPJL890tPbPnMNvE4BSRSFAIfgqQXp2EUe9umK4C8IWgbHqj6CoyJ31ozRFeZkc95
	WTLJdzadoBVPD2ztJtGDq8YBBKBJryqfMrPzIzHZA4GLp/7pQNeGTMK+gbaYjwpVq0xAnI+vId2
	hDTo+huTFTe4UInzJEqqi52VLiW+QyKYq1MY/1Ljw9JtDuuWTa1w77PlAZZwgd5PoIJuuqougJY
	gpEFS5QmGrE8ylwVc59+nimbyalitKbCQhzcmi/CYdPTzGiyMqfvCWeZ2vsWJtS1bX3zvObiHIO
	JE5V52h8U/zoh9z8JnojLTO9DdSZNc2lFXCpIiaYoAFriyfQ=
X-Received: by 2002:a05:6a00:1950:b0:845:eadb:821 with SMTP id d2e1a72fcca58-84c29271366mr4815793b3a.14.1784321335562;
        Fri, 17 Jul 2026 13:48:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1950:b0:845:eadb:821 with SMTP id d2e1a72fcca58-84c29271366mr4815769b3a.14.1784321335169;
        Fri, 17 Jul 2026 13:48:55 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcd3dcsm1743863b3a.24.2026.07.17.13.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:48:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 04/16] drm/msm: Synchronize set_sysprof on ctxlock
Date: Fri, 17 Jul 2026 13:48:20 -0700
Message-ID: <20260717204841.26120-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX0WKm97E7gg2o
 bqpg91NBDB0JeYRVZDNnJt6F+cgP33PhvhJ/d27MnGtCltuB6jkv0tZiar74451NJ9BORafBF1f
 RXUVVO503fwypav4nXCtqTijBgbKO7w=
X-Proofpoint-ORIG-GUID: zh7FcbES_r60QXpfIybgSDUkJCH0kpvv
X-Proofpoint-GUID: zh7FcbES_r60QXpfIybgSDUkJCH0kpvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX6vAaMAqvkBzR
 5xZXWDlwzL2mZc1Qc+7P0DbPz3o8T7gnGUwNL0dvPgHffbM1iBWYUk0e6p917A/qCi1PHruYifu
 24oWh1HxzCseW5rcIpHqhnMZ7/vjDzi418rOHjeVnHenwUKUCSAaKiCDeSKrE288jPLc7+igURs
 YBFsB/aEgu6Ae1UK1eqkdkdNiOPG/v3A0SZZVT954UCinEKreChuMMKV8Yv1h3iAoxARAaqx1TP
 u+bZvtIhPqKj33LvAPYj5TXN4FRUNF055aQxHpstvNqD7nEdXRoQc9nP50CsxOW7yriE/uXReV9
 62vqWz5qItkbEuVAgS//q8humXqHmoVS6bD+X0q9FgHJjlXsuKGV9/XnjmtPXXF+UoQpeVVgznJ
 ZMIaEbKczHhytjCdnZAmvVSAY2+b2m+5iLLXZFqBLVLLnNgHGhRQU5oxvCtcAM2JDOVE1ldW4pK
 QebdQE/uF51E1vIwM8Q==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5a9538 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=A-0ye_aN_Dr-yZQka4YA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170214

A user that was perfmon_capable() could try to race setting SYSPROF
param on multiple threads to trigger a reference leak.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8b5980d5a6a7..233c4f35ab12 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -9,6 +9,8 @@
 
 int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof)
 {
+	guard(rwsem_write)(&ctx->ctxlock);
+
 	/*
 	 * Since pm_runtime and sysprof_active are both refcounts, we
 	 * call apply the new value first, and then unwind the previous
-- 
2.55.0

