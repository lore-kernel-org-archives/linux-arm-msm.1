Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305083;
	b=qA3cxF30GzKuSQozhj/eYRCqC/o40yVda6bmHvfdl4ySxugtaYepzP1kxaoDDCQYBe0S
	 9v2cXGqLWogfbIypW6qhrsuT9tKvlOoD1+zSNmVJlIaHuVXgHW6I3MgE3KaU1iOHICjFo
	 7Y5A8aotUvx9y8cGm9G+EINTyivQUoM0aDKkVTkEfPdctlQspqWya4mehxjUzOxPgDTjE
	 aclNZxikzDlZUUrLDe6CeXYdLB3dX8l7ZGW8TFIP7lPSRv6Q/zaEtIF6FDX2xct6LbMGz
	 ys1umGGG/caMzdME5etV9wFBhnZwim16Btt1vyr2ne5FhiejOBf8wpZ//q36fk6sBIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
	b=0UgGhPvDo92gNTLHqwwuwIE3ZK4cGNXJSomfRTVh8zm3guYgkyc5DUi8aUhxDUqWgYiF
	 +d2xioMEl6UBJTxTGKSsjdwiw785PmKJIDtt4qppioBNMXyGU6Z1FiT7hZFvc6Cey15pb
	 6Z8x9vDO9x/UY/6RCIgZ1IEhOlQYbcEugzL+iCf5kOFcExZurgNM6n+/wag1lo3SL/1Ky
	 JOiDRu/dYgjiIHojH48DXb8QDKSZUsJg41f5vBKICGezFoFdyG7MrWT5imryOAqRN9z40
	 YdV5oy9I30+xRwDjL3PuyLlEAv1BrSjYA09itjhSRG1EMgHYD2kM19N1qrRItnhypIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pHtX//R2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOCOfK+3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C7E60A3816
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C7E60A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pHtX//R2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BOCOfK+3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJk2qW1708436
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocDu9x7a94S
	WPcpzxK16LgiMD4smeVd0t/ViadjFsRc=; b=pHtX//R2xJT+i18ENl/QKNWY0vJ
	7r8uCHQI5u4k3CnifuU/x69t5GE+18sF28UXcBBa9Sd8qrfkkJMvuwmLaFVvAKzX
	YgJCtb5mXCrUes321Wv0qPfLRqKQj8G2cK9w2en33zUlBXOZJfyhsV0//8hQ6bxf
	wyr9h5gFFtaOmGXmBAKOJ0SyOPxwgyqfU/0+ObDusaBsAFWgecTD5UEGjlEPuB0e
	Ex35pcN4axvuLC1w6RzIFSZpVc/ccSrdh1a6vaAsxANHwbwWd+S2+8asrz8kaXL0
	UVgKCULA2b/8wqT9V1G7uQZ/NEXxDHWHa3e2Io5lM5uzebHj4+Cvty9heZA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76ck50b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso1641756a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305081; x=1793909881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=BOCOfK+3lHlkvc8sz7mEInkCoxMPQW1ARx9MT2ognhvzuPXsfnQctCdSoMDMX8+Qs5
         Nochgstz1zLzzWUE9eqP5Xo9KZSyrQJv5Ykz7l80LVj1wjB73Y9U7Ww8j+2aqJUEeqaJ
         q932RW7jPEYqc4nDjy0TDUPoDpAqCPhKA+xJ9sUGPaVPMafPBlZonhmxvf8j9deYHAWz
         Q2yiphTNM5wkrrEs+a3febAIHY7L4/Ws6K4T2VJ67XP7EnWaI1M7Qa42VBzZQbef3N5/
         qhW1giMltbupV0hutuOo7K/1/s/Nd17Y+BEDcQ8QENhVxXqWphzYDCnBBbyRPvC14s1s
         0csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305081; x=1793909881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=Ir0HwqX5RSNS/p70MOF4OyCIae4AFd+DyGkVvyDU8zbEvIzErTvTh95sCESBYTQMgp
         TW+WdkbjUG+zuxwibOxPzxHQvnew6eG1yPm/19mAPR5AQUVN6FgdOxA4mvknVj2u3W9M
         676o2ftmtjG4AuV78JvGglfhJGPc8dZM9k9g3JB/7vNjRdpk4Gn4Z33chBI+iUIr1CMg
         kX1JmDhmy3LBLwJRK9dvzuOm59/silrQyqPedj1LHK7mZgc2ZgQZyzLPs7efFYV8Fm1B
         3eF82H+Wla2YuAZaHvN7+uoo2MVIFbKwv0MFbjsSNay1lTXTcIWe+UGlV9rX4JNP+Vl8
         MV9Q==
X-Gm-Message-State: AFq9FYLwv38YWIU9CmjZyBlhm4bRHyqKH8hZVJkqnLbHKAnJQkhLl/P5
	FvT1Cmf+8g8ExBHMPLiF3y3OIrde5Vo30eJ/avgkbNIyPVIKF+4HOsknzUEqKyUa5pw6uQv0s1d
	ayArDMMZ6jpJgUAzjLnMq04tQLcfhjTOkqeEsxtJ8u7hRj1AE/qTbOPB+pFmda5nGXZe2
X-Gm-Gg: AYBFou0SiGnO1KEHlhBvSIhD65vEfNuVpu9QVXr+ngi3yRKKqPjqDxuhWcdZI7Ekfdx
	QQf22CtFgK5GqA29CoBEdKRZxaSriLRW+x0eMrPRG9C35htgQMhtUCFZW+RvYBDjidy/Mmr1N54
	nSgQqI7yLyKZ5O6y1pkYxpmlj7U6hR6AMG4qRIJXyn3fW6Y0ub3UsBRZhPBTeGUjhqqlpos+R23
	8IMB7QDqOWamFUmXiBBVP+fd3andLp1SSZpVH6T6UWyAZ1HMxqWvC7O3psejkHz4h5LxhfTS7EK
	uLD9fqv23UU0KIjdShV01XUwUOsVfXaeAxXeKuRDeJYQWjgW2RqOG71Huu5lAyirsTy6xxsnWoG
	6eRNdcFP/dKuUywJIvVYPB9Wa8/7JjW7UzdHY45Gl64DjRynnRi7D7OA+Nm5gCw0EmS5eg0CTiw
	ydmLN5MCacumJnUoyED27YkQ==
X-Received: by 2002:a05:6a20:6a2a:b0:3e2:1f0b:5987 with SMTP id adf61e73a8af0-3e92903d098mr262451637.86.1793305081045;
        Thu, 29 Oct 2026 13:18:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a2a:b0:3e2:1f0b:5987 with SMTP id adf61e73a8af0-3e92903d098mr262432637.86.1793305080584;
        Thu, 29 Oct 2026 13:18:00 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb0549921csm190361a12.14.2026.10.29.13.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:18:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 09/16] drm/msm/adreno: add temporary __maybe_unused
Date: Thu, 29 Oct 2026 13:16:19 -0700
Message-ID: <20261029201730.151754-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -kdGJxYQkpyGMgxbj_vKBZ3spZvfK8Kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX8nu3AKovzpp2
 fUZhGjzgDHYyEFqUuXttNsP2I5E1nY4fazQJ3NZTW8sTD7xGNh2ypr8Rc7NOgOSNC7A0HBS1w9A
 twOVCg/KEnSSVUYUKlnRtK5AitA+eEGo2k8ZstgC1fncK+DveSIa/KqEtlePw26/lMol2IUGwx8
 iR5UZYEnxvesGY83XTkj+ZNKj3XIY51x1XPugwwCGNKVztu8dqkW1jinRu5GsBtOVzJ1nSieEEk
 pK3lhwE3TKyrOMwucTWvG0H0HiC0u+XcQZlgb4YIlpXtpw/oUnNFhWG0FuzXf3eBScHwOXeJVAC
 4BFhbYn7C3XPcurQhm8h28FCMBIe8gtczxagqt2+v/AiDRkx05iGyCpX0nw/uPaFweTR6hxg2p5
 KwQooXTf4aUqQlUONfTlYJG0JSJpw3lLxniiRTfczQgdDRZFCMPv+NYDC7ukLFPSBSWhzEdAoRs
 GbK7AaRJmER3r7oG5qA==
X-Proofpoint-GUID: -kdGJxYQkpyGMgxbj_vKBZ3spZvfK8Kz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX+se/45sLLtPT
 jAbDCyvV4EsHh6x/stfE3p2OJw6vtxWFsARPS770rsvBcQfe39AcA3yTc0Trbzh3A3p4b7ySs94
 aogGv+x7keBJj+pq1RKL4vDWTUq/sWQ=
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae3a9f9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..c43efb85fde7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

