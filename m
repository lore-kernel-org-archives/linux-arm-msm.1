Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747948;
	b=r/36jMorQaGcCvweo6XtfW+f6FQYJz1LB0mlDU3lBP4UOGifzwTAE3wSISYASnO1q2zP
	 EuSN9javnpFJ6NlfgMFPHLobJe6HH638QpGqAcwJcVeRBmEZkIDIw+IbG0YvK2XVFYpel
	 6gAIwhctPXbM+C9QhNmH7KCAFAHAHrd6YMy7AXdnMU217Fzlzx2WzXO4VnGFWXCfI/XG5
	 KhVybiblNFCXDhJOPZUc9zG44KxNQHWYP5reGJjlOCpAnupkJOEQtHh1IahrOg2Q1juCZ
	 AOBGKNX/jq3UcEicJ0mP10affGzy3PjgkmNOjo/Vx3sEie8KMqf0wmGqmmdDBjpDT9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q9e5W7qSWUyRUqa8cuD0BBaWq/H42JlZYFTsfRPc5E4=;
	b=vPATM98HUPhjp6Wgfxw7SVcLznueGjYif+peOeBBqvczl0uhNSHfyAua/qr+WgAouaSz
	 EWF3SOd5X019n+9sKHFWolWadGxwVxB94vHfLMNj08aM2E+zjSEWP9XfgaGuZp5vb/iN5
	 elg0c6nCIKFNutXbzJ4saLaji/1ayglL45x6e9Sj5PVPVFgivySF6SV1CJ7V+YsnG9x2a
	 dRPuB+me+vrszeke0SyWn18e9aD5lU9L1xb4d9+y4/OUL39EvTbP51R1S4FIuS3Heis6F
	 L/x20UcGE1Y6IdqAEWJ7msUb5zVuUKpGB6w12bqEiUUme1Nsn3ovJi0pEtrzV23Tmqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ceUA+CcR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMs12bYw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A869606EE85
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 23:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A869606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ceUA+CcR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMs12bYw
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKp6u3065598
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 23:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q9e5W7qSWUy
	RUqa8cuD0BBaWq/H42JlZYFTsfRPc5E4=; b=ceUA+CcRtaX3hNtwtUqQtfkv4bC
	CpcbX41vuEyT+DEo+RDEIb7ni23NCNcU3O+/j1FnjWT1jhaIdO5AlPf+iwfxrZPF
	D5x4+Qq57Gb56CxzKEALI0PZPZYbpogcV4+Zv2lNFa5G1/wEhFK6MbJqRjpbFS/o
	s6j0RfDSGDToLP4yVy9qsrfhDcP1v0Jie1qz7o5H7iLDOk8RnZ8B1FGUeSSxUhwD
	CfBdMc3rtRzioVNK37CxXkSMyxng5Gt3diaLwjKBSnnKE1rnD77Qq2avviviIYE5
	/5wMZZRpkJm5H6WeL7RSV57YdUgZigBomfHbnhQBSutXInEkfly/b4fYXVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bt7gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:19:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed02a00b24so479445ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747947; x=1794352747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9e5W7qSWUyRUqa8cuD0BBaWq/H42JlZYFTsfRPc5E4=;
        b=OMs12bYwyr15w6p8z7zXc4xlkaPI1X8MX+KSoR7CoS/Y/Zk+RFSiadSaoNGaLZrltu
         QBsToRInapFuBSnzf4Kz6KzqX1R7azmpkGBOGI4JmzBjSrYCDIxkgf8Z2XE3v3qdpkNS
         PDd2Xh9xhyb2SkEnCqtM45sWzwBlbqkPv9E+C7rT02nHEMVZZCipAiEWXoZky7wr0ubK
         d6T3QpWT6ebLxPQuWequGwgtRj3ppbqCSSxc2DiJfo1dIE8LfULq6mqsSA0p9Sc/Z2Ks
         O50mtx8OuqIldBllRHqenIp+AkSwMwymn/y7Ce1vRpQWqGVbdNL4DNTC/AJt9eomm04B
         XTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747947; x=1794352747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9e5W7qSWUyRUqa8cuD0BBaWq/H42JlZYFTsfRPc5E4=;
        b=O2ynrJYR5GrghJw1EIIA6GA+8dxc3m+eIwL7ZM1v7eNEO4gObzOpiFIrrpvdkE4HqI
         OxHvGyoR0q4TKWFsYmEp+NDOYPRcO29qDTUWwaHQj8sa6o9Gbdkqqfd5O0QRm0J7+5Sj
         F2v/UGjypMN5lcMutto83njl0KQLO6jWUnGd7N8txMOcqGkM1hXEJVekPLLdc7/feCjk
         ABrx+D7wA4RO0TjPByRcpvnwle8XgOskvopZ7siTbfskMjHbMmrwGMNi+3Db2jRzav7q
         9ehV3qpA8XSPVt7ho8a8yThkcvmhoE7VfXM0byGnlh7uSSZVqiMxGn8WnOx86H63Upvx
         UZ2Q==
X-Gm-Message-State: APuU4Z/2hmFdariWcJ1fHmeSokL+elLPyNmTSS0AJGWK1QKtHaSXIRky
	EMIHg0QcBdC9MNdgLrH7/HK/UXvEbUd83azobYG93gKIwSbwKFWvGkF2LMa98JdY4OM3EpCZAVG
	zu78iBkkifMYL/0HSEsGh8Ns4jjWvr9u+edYcuJXyKESr35sMw053r67MJ8w2v7e0XOFw
X-Gm-Gg: AYBFou1heQl/tNiEG9RhBYNwTyIAfn9ck8SY9tmHM5hxd2JkvyYzKfsLKgxKRmuQr3h
	J8zQgBc7MjRR2vIvb2A2xEbxul0cPRhZVZqpzGeQ0QaBx6SrIZH6kzUgpaNoTlurIAA1c/w5qoq
	98rkl4XX4eSBGgY0JJT7+ooEcBTNcU+EZvQNommy6Ut2zRxO5OtYEC/sMf/GNgHpegW2ZkUei0z
	2JJJNXFU2fQlmjnRAUy0ISpgscjAdlawh/No5eTaC2w4eTfo/HcMurcHdZxuSH9PjGZNVuRJNSU
	8DuoXv4qhkQlfsNEN2Xf7gchdOpcjdthZB2dYg2nCbaPoq/3Kk/bBWR3BTmnacD133NIUuv2pnz
	4ReN5aHCfyxYt/DUx2iOkEXJ5kqH7IqYAMy8I2A0BYU/Mn95+/Xwi0zuKL6b3pVeZEmUX+SC9gU
	ABzfT8YPrNzCCxJgOriXKrNaClV0iPDP964UekLOAu1J7DI+Dy06IhB0x91Q==
X-Received: by 2002:a17:903:1b2b:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2eb36426f0fmr133796805ad.20.1793747946885;
        Tue, 03 Nov 2026 15:19:06 -0800 (PST)
X-Received: by 2002:a17:903:1b2b:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2eb36426f0fmr133796555ad.20.1793747946394;
        Tue, 03 Nov 2026 15:19:06 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091723easm329635ad.58.2026.11.03.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:19:05 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 6/6] drm/msm: Inhibit IFPC for state snapshot
Date: Tue,  3 Nov 2026 15:18:45 -0800
Message-ID: <20261103231850.17493-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
References: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfXxogu6lY25r9o
 yWHdaxZgfXfQZ6JaiaXP5dduJf+2PrtqV6sdsj5VbSa4JNdcuxjYZXWfIqZuzf3ZMR3SGd3Ttqu
 cLxnr1fC1bY9LbJSJ6d/wmxn8ybuoTE=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea6beb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=eWlSUfSnBrBg5eVjM6UA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LQga4y9EZjVBGyY0bJj0l_rUM3KSZGV-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfXzgodaUsrsycE
 4czgyg+0DDARrPy253NXd+24WTsJfQNSvkzxABoZfO9BjaP/EP085dbS+9GYHam3KOdWe/S/PhE
 sIHGiAcpOiBNQdpbwy8Pbl34OxwKzC7mDoj/DobVTT76qbf0yfir5nz41APXtOX8UBFCgMxt8iE
 MbmHSQY8LS3AronYKteac2k+nHZ+a4ZRcjy+hoHeaOlTED6vlyjZpqYDr0O494wK8qgUy7RssbS
 F1so4dRBCsFbG38zc8p0w1adz2uacInGKJOo8XS8t6tH+fjy2CZkijvNuiT0wMS7SagUEM/RR9/
 AXeYGXsaaV3jFq8H6JBUzluNDYsCPIre8S7Ac0o8/Pq8an72SAOFk/o4RJm2RvDUyEAGtqogKBF
 YhTq09SU99sBDiBuhgjzqh+vQQOMpk/1EYsgO6Zyui/kUAR8hJ/Cm2mJrn7PUv7H4qCNbwalbLV
 u8a+jVi8foWGznYbfCg==
X-Proofpoint-GUID: LQga4y9EZjVBGyY0bJj0l_rUM3KSZGV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030092

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index aa59b28a3392..45df35d3cf90 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -83,6 +83,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
 		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
 			msm_gpu_hw_init(gpu);
+			guard(ifpc_disable)(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
 		}
 	}
-- 
2.56.0

