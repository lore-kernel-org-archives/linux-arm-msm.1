Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234121;
	b=NHc8219Etul1IDq24mYioYmSX3AF7kGngzu2N24PpGU8RPmY754VJhQvf2M0oDqh0PvM
	 vWfdUj82FZ4cg6oTNwLmIVggMbZBrDtNNTlYcUNoj4WNNH2ybtMCnI5+CP+Nf3kD3eWMZ
	 BqS84zK+gmIGqbcVoYjutL+QkvT40cRuUGvAUx9VsiZxD1ad4RPutU7OF7bpjr6j7UiCe
	 JhqOB3EjG+A9YyaAOal/0+V3w1moIzYe+Io8fUgR1pAwMtCb3pO3SXrCpvvMbNDh6jKck
	 FHURF7QyizBVGCaWE3ffLUmnZIqinHz5LkuISeh++NkJ7lB/CHWPJP57pA6Z01NexmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MNMuYGUV+ABAHAOiKDt4KXHvnuZIxHJe2Tnq/L/VKok=;
	b=WE3m97/EdYfLlb6lcA5hZgT6f5baDDZ+kydSANgJADHPJowE0mVL0A8J25ZphLXoBzN7
	 gJhZYP5YdSpVjp4E3rXGhCmhPUGXeetGmCGn4cGzQ3q2hTvKm8n+fFDWYJnVNHgH3WU0+
	 prZjrqIOEzX39xdULc7gRuFk+JgZ1j/RdY+9hTgriyUGF1uWmBBpCuEHlwl2aeKBk+yij
	 CgGZ26WN88bztKX0keYSGflHCLULVPZnHipCpmD2IByL+0qgizymzGwEXVGXFaZIax2lu
	 UNaf/0EdHY90fjzbdAdnrHgNHnTEPaenz30J2PznwnGSJgED88VgTXwTwtEYecVJ6bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCLsReed;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rj0TRJf5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EFB606D804
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2EFB606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCLsReed;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rj0TRJf5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFJWF3588596
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MNMuYGUV+AB
	AHAOiKDt4KXHvnuZIxHJe2Tnq/L/VKok=; b=pCLsReedxAyjfRPm7Op5SyI3dcw
	RnUN/w8q3ph7vVmkL3PzOFUmu1Qz3fzRpxR6JhAlWBSdpHiFQ5euQgddtdpzx2UG
	u+9tVZZzkkv6ojZAzABK3Xbj1XOGoFs1VuJ3OSkMrDPjaDo3Ocq28GrH3Z1V1SB5
	2KZgaVHonXGFaj6tITDlosjcr3uq2tBvmSH03R/9oEI/5wk84LGqJ+K1x75OSaaH
	xSgmjEmB2u7EGepZdnroYGowQhvYWmWgbxAT0WcQ/2FY1EqQ0EBaFSujtW51K89+
	YoEw+BPwe3581Ngr8BldEK4Rg+w+AW3XgblkNxdQ+s+eeHl6n4+CRvv3bgg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8jda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:22:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso845758a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234120; x=1794838920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNMuYGUV+ABAHAOiKDt4KXHvnuZIxHJe2Tnq/L/VKok=;
        b=Rj0TRJf5tE/Kd8g5aD6Ga+R0GW1fbrOoQmznWVloijT/28zjz21MJoTKDbr4mTz7bG
         7VQ1TWy3Zd7KD71OSzbYVV4pxEWOCzS6SNYNDZbL2yQpvLRl4GXmyb2KouAVdYVSFtCw
         XiCIzwHBVv7vMV49SGNlb31pFyNjudHaxQF0jYNpZHGYKE6IVQhEMNiupCuxTnTr6VOs
         jxFMR1OmsoCbQWwjIxkqPJKdGX8sWPw7fJxV6WxOUJBAM/ZWLbz6RlU+WfFetEacK3KO
         ihsP7vPHfpe1Q8Z4ayMRnaYcChCmT6skiO8XnVudODcOEmqHDyNZT50Z5H3z9FGNCVaX
         kLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234120; x=1794838920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNMuYGUV+ABAHAOiKDt4KXHvnuZIxHJe2Tnq/L/VKok=;
        b=NRF7WYGzhZKwd7WNqzmuz9GL0ze0p5596ref3d2ege8uWR1T5e2AFMArAGqNZ8Z4IK
         6UKvudjsQlSON6U9xsrJFu1/Q/9VzQFOOku+NeBzI4nHuJsYaCmHXhlQ6RkISis4CowI
         Zxwt9huw/G5Ka0u+WoMTY3V5+7B18nAUwAfyp44AiBCmNY6p7aFEvExxcAzUGrbip5Pm
         BoCCyhacjaL/VXs7GK0I6M7mEgkGaouWtKNAiLt4O4khOgjo85iCn3pJMEmuy6ffA1Tc
         mD+c1laKfcvvFOCqbCbkHo5KnffDAE7TKvFNq5w/n+4KUfDaislfXsidlI2g8WbLZ0A9
         4XAA==
X-Gm-Message-State: APuU4Z+NOBx8YX5qdOvbJbcESiWn1X24lmQoH/PBtSqMxLHX6TnQR2G6
	2p8R6o1kGI/Uj7sT2x9XTzDGlBGL/EEgG4oprV+05CaF8+qQVpwISl9FqtEWNPsGXe5H77OKjOm
	5SEV8uic62Vr5yWmYZdACGVXrMXAVBjiQAWVWsApCe+/aeTq9xEDknN+77YnWCNlhNTn1
X-Gm-Gg: AYBFou3H6tScfca/gOLCUGik8LFwKCpfZrGcvKpYBVUEETXOHv8GuxCOlXFI1Z1baaG
	kamZfnGfI2WqkX7RCd62UsD+8O1HjozBaYQBFv3wRSiDmNmTyEbjrIUFSqbhzS8moFzn6XOjbCH
	/DrJNpDC5K59QbhCF/RJMRUSUfWWHc8NTOSqi2F/e6AbU04Rj9JlqTr9CkRWoDyh66gFLRhl4JU
	Uv3GBaTTYVDxEk8dL5sjbI7C7WBPq9togti1xVd3Xu+MPPVTA3gpOO49VN0CRvogJVRIIfjCRYJ
	HFARyjJZwQJ8MI3XuOxdiqvRjsNCGiS6g+S02ERiezDIZeY9r0jzJK5Rsj+KxZ9+W7M1jQMY1Gy
	WPAVwytnSME/5QkJHM03HzP+I6YK6jfW3WOIqIwHeC8BdUzPYmHWKMn+ALRcjogIDSi1MBMKmNX
	qEuSO2/75Sji6Q67PixOVIOaqAq1sIxQ5qRjrT9EuA/H+Fmlye4/Ix8Co4MHy9
X-Received: by 2002:a17:90b:4fcb:b0:3ac:adce:60ad with SMTP id 98e67ed59e1d1-3b12d2f2c65mr3427903a91.22.1794234119376;
        Mon, 09 Nov 2026 06:21:59 -0800 (PST)
X-Received: by 2002:a17:90b:4fcb:b0:3ac:adce:60ad with SMTP id 98e67ed59e1d1-3b12d2f2c65mr3427860a91.22.1794234118734;
        Mon, 09 Nov 2026 06:21:58 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1032b8c55sm6087595a91.2.2026.11.09.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:57 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 12/15] drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
Date: Mon,  9 Nov 2026 06:19:58 -0800
Message-ID: <20261109142111.256630-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: uZ8fYoDVvBwNLEEibcRePjyB49vyitz5
X-Proofpoint-ORIG-GUID: uZ8fYoDVvBwNLEEibcRePjyB49vyitz5
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1d708 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=GwKEIKth3DexCsueK50A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXyRJPr0u0lWpL
 diR4UEuV7URRYVXV6hX3RrIkTmn+eSLkoPE1EOVpYhEKGFu1U6n+c4gEjvakzWUZnp+b24tqCTL
 J82p7clwzqddtHCh/i1zoIgNR3EgvGk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXz2T0T/IuQ7bp
 2bwMfwKMNLd3WuS8YF0ia8iuyk701BI5ORGNub27LEGBHM7FxbEIMHgTfNG5skFtuZ1AOIbpIdi
 LC1sObFTyqpQvPA1IzCxjvbjVt1XWrXpqTlNkiCo9My+WdG4uC331W03Uh3kBWX6agg9eb1Bqpb
 IMYFjzY/b5zQyCYDpEqVyDO/2UlyCg8ixcYt6Z8m1S0tYa1RRxG1X7ZYMyH3g2TJp/t84OKWTPM
 3Xx6Bzh6v1rwRXhQ91LcnZFHrSy9rBfAahmLkJrEYM3s0nsZWYTVTLWyjpmtZ7pIejf0BTmO2aP
 exqCctu4zWnu9Whi+5aJU9Uqkb+LhbvZ1dJ4LnctmYcmra0lQ521sYguE/01aiE6dq7i5UMXI+I
 UZcRg2XsJ0MOfmpA5ysNBbTkvVpUvyDyS3yvkg+A0LJvexeNxvSOItbkQa/fF7KBBLmEFuhnjF3
 V0pjFgRj9O7EKnloPBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057

We're going to start using more of the CP_PROTECT_PIPE regs.  Rather
than missing to restore one somewhere, just add them all to the pwrup
reglist.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index f20198125daf..113a31158f8f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -276,6 +276,21 @@ static const struct adreno_reglist_pipe a830_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -437,6 +452,21 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC)},
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
@@ -670,6 +700,21 @@ DECLARE_ADRENO_REGLIST_LIST(a810_ifpc_reglist);
 
 static const struct adreno_reglist_pipe a810_dyn_pwrup_reglist_regs[] = {
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
 	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -999,6 +1044,21 @@ static const struct adreno_reglist_pipe a840_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC)},
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
@@ -1448,6 +1508,21 @@ static const struct adreno_reglist_pipe a850_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
-- 
2.56.0

