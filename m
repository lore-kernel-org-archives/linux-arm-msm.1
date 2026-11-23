Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457601;
	b=z4VO6vs/FNEiqxT85BLhoqkAaZGOoH7HvuGG1DrSgqCYHZkcK+Qdlot5yeWcvND1nvNq
	 A8nnvrWdFtiOdTVp+DmAUbNamzlL2Ks6Kra27Q9JS9HlC6PXdey+sK8Qt5CsG4MODUcQ/
	 vLU7NrpOVjqNoDD8wMFyABG2mk/n2eGb0A/SwzXNs1yxxNwq0r8wgsAj5KJKXtKZYkSfL
	 glK4RvJieKgkVfYlnmnCIV0FHHg1eyzdVZnKaoqOlSqHeSODdAaMVLSajMY6wCDgX/lAT
	 N/++0utZZ1O0ueJGpG/adRr0mTvD34vx5gNdTR9t00Sp4Pb1FAFSLwGphb4/1duaX2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z1amoST655iGgyCxzXVgPyjK+ap9dKFBCk3BVwBzWnA=;
	b=rwOYSDHGV5R3co9IK/M+ABnXFLupD1cHZU97txKXvDPMwL3z9joDGSD/2NZDRrG1r6XU
	 ik6GHwyCt2eoDOqnYaqiZ+qxEcVa/0iLDTJhinNHjuijJcCMtfmuOZkBMCxlD3GtitwKx
	 HCovitgn5reaIJiJW0DIaLNVaWNmsSiZ6jUBI9eZUTNi2Vbf79wG/fay8bTgjD5zwO/8j
	 lK+J/UOCVQMNbZJqeh5LvxNpUYhdF311aO+bsqgnHNpYdgki1Vz8ELl5D0ewJPVDqsxTo
	 h9vJ1jS7COR+hKnEL5Z0k1+29+x/vdQVTTDs+mpw+VDQDlb30soOvposCZbxU3QcpyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JQyKKKnl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZOFUbwPt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E40606A331
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E40606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JQyKKKnl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZOFUbwPt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxts2377194
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Z1amoST655iGgyCxzXVgPyjK+ap9dKFBCk3
	BVwBzWnA=; b=JQyKKKnlGAUM4zzAwMuOoUQgg7/AT4+JYUKlz71miX6Q13GB/3t
	rS4oYltre0uYeIn18ocKhFVUzI9uirxwzHyIXjITAs1tXkoRODkessIIYxMDIdO2
	xSam1fhbvSk2iyJFna+3CEUCu7w1nICz4Q0o+5cIxz+2EuEFPNyFvdv1GKHR+Kib
	NAhpOIz1tUu/CYKBcP2taFwKVyCEvqPk3DyvW1MASBSaDAEHg47T4EAkgVdUVntq
	62vl3dfBkjevh6TG+YcDmLylUoqAziLw3tXsl8wSj7bW2SMosqncHgARkJZxmws1
	QLXc+JDk9gBrZT6v2/5SRCSjpK/QSd8/6iw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7usq1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:13:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so5389778a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795457593; x=1796062393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1amoST655iGgyCxzXVgPyjK+ap9dKFBCk3BVwBzWnA=;
        b=ZOFUbwPtZe166hoAMD0sXBlw6ylozKnWvDF/HnV8ICksmVkAaRE2Hh+zWjnQZaobf/
         wwOOMEsi/TdlgBOl1V0j9YgpKJ+d1ouNjGZscxK+opIxnfUTlrOle3jmPlEcRhEqjbnF
         7RpurGm8ozL1hrBAn3JYHlkPdX8RWDSw/ZBAgCE2eTvr/JVanyZ7ClReGXxA4+nvf43I
         QAaXgsGQfuLoWfd32OvXvs6MXjnvYB7Qv3lLtkVxQ+8Pwga5PLATTXix2i3BnscJImVb
         4+K/f9YW5w1F75mVHHADnVtVYp5sZUG6ijEzgMI/LAWESRt9QPSLzTYJW0KaJ0Vyk7Q6
         u5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457593; x=1796062393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1amoST655iGgyCxzXVgPyjK+ap9dKFBCk3BVwBzWnA=;
        b=CWW103vUVBU9ikkiiMixX19Nae92mdmPL1dRdwZWrvQ64EZXqivTl7nuwuIAkrFCaY
         Zih1TDhj2FFtMha8I85ZAHuRlZLwT1bBHt1J1OTLIga6vQszH8rbd9nuJ7bCmqZ/p2lo
         2fAxjWj41TBYlhQ+LpCd2/4jlxVSOWCnEIS/48Ut8IBJVEKbS5RbCHE+CudjF0gs/dIk
         KHCwSwvGUhuJKdWHI5Rx1cvXemdwLjX33Xc6OpfvDq9U9ItTCKE9/Q1PX+rANZGgZDOb
         inaxhP+Nn3VVv6Fwrs5w7dnW7YHLMFKUb2Dmsj8pRceXVDqE2Ogzh9TbcKBs/9WZQwYz
         d2MQ==
X-Gm-Message-State: APuU4Z9TbQ3Y6HxKytL2MVCDy02STufmVEKmy6ZZ3ZUIQWZZDJKcV5B4
	+056cPG0S6z9reOFjEzzW7mLgV0w1iRML8yf3aeWCJjlsXRGTwkSUqy5wFYQse+VmBuo79ztFEr
	demZUxrW/VDkrNdQWXtj8dkM56sJN9rYv9QaJ52tbxR1TzOjkhllHsgSNQh5UUf28aYRN
X-Gm-Gg: AZFdTZetP0Tr4h+G2wZSPVcDRu6QTQ5scK4rfDmqw34KZsaBXv160llgYcRDxS+lnyx
	iuhUWYzkvxueaiLXOoeJggkaKOpZuwHNE1n9VAFp6OZ5PKYJJL91UDIQCIvSbn8tL8IjDd2apCW
	2RU2xz91VJB6CkKExD9OFhI9KqOctpTXEHCTGksp50qhePReAYk4/w1GuOLPyUpU42EJvt469un
	JGNouGIy+/vaOtFtNvz3oG59wu9gMudkLk5dn/2eEWosKHqSCczmy8PMR3qMciExkyVR4QHNHMJ
	+ZBzUgDs8K1E9KWDOqzxcMbrQAsk8KVX3Xc3NsPHCoISjslmICfbKkVFlmyH8O3P9fOTxn/mwrG
	kpqKz+Bf4vIhhoKkmbNlyG6Pr7NCdUIUJN+Uz7wbejtgtsJA35iaZBZVjqMRtvvw5zyKUmxVjDZ
	k+CvYNbUfj43/STRufdyNkgGSEgwVTkQOgfrWSpi7sXFHC1MmneyZkcCGyQebR3w==
X-Received: by 2002:a17:90b:2e4b:b0:3b3:886d:621 with SMTP id 98e67ed59e1d1-3b41c9e52bamr10846003a91.34.1795457593340;
        Mon, 23 Nov 2026 10:13:13 -0800 (PST)
X-Received: by 2002:a17:90b:2e4b:b0:3b3:886d:621 with SMTP id 98e67ed59e1d1-3b41c9e52bamr10845988a91.34.1795457592912;
        Mon, 23 Nov 2026 10:13:12 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm7779412a91.3.2026.11.23.10.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:13:12 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/a8xx: Add missing preempt_record_size
Date: Mon, 23 Nov 2026 10:13:05 -0800
Message-ID: <20261123181306.420017-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
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
X-Proofpoint-ORIG-GUID: 0dwj45NyeTKWYSAwkryYRGwbzh_EBFDE
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04823f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=2OSpH8Mq0sc3u4_c0_oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 0dwj45NyeTKWYSAwkryYRGwbzh_EBFDE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MiBTYWx0ZWRfX2KLSo/pE6ki1
 cvu96OD+nuZd8ztpgxQ4d7x+4hqQiu33Cg3RwL4bdaZ0cjh2aAODrmmRWMCbeZ6fkFX80VGflcU
 JBkoA8MpdO4FauArJZfNaCjeez/Djic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MiBTYWx0ZWRfX54Z8Ztm6+UdN
 Lb1kM9+FS7asy+wINR7AduGTWMxbmLAIiB2gucDhmF39Wiie3/nl+q2uenBTxMi8kqjl1bqeQFy
 LP4aTeGjMWpz03WvkdIPIU2Jzk2ju1EtNYoBhPtZhgInfKmwTN8LRFOPFS6HZ6CaEvcCzzzSegO
 mTkRT8NGQ0A+sStmuh6i0Ki76e+H+k2mV1dCQG8dEjuxcfyVZXRMOQUaxSI6YcisNsOWpho/r9f
 GagXJ+iRoGOZ+lAC8+3shOp2SvWRHprJ2tithg/mKlXLuHAkNk6qAHYGtYt8NDhpHVDblIReC0h
 uQNLsZsGzYnj9Yz5+Ws+n+vnSN9WtikmN4CMjR8mCkmwpG0D3zJXx00TKxqdZ0AEp3W6PRUrmE8
 Al+KUsyZFnm6Y//6kXQbqwK3AEALy7sh98jI4B1RnvgQ/WF1D1WcPOO66frfqNZalKYmv22xY87
 eBWACdtAu/w7dutMM/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230072

Somehow this got overlooked, and Glymur/Mahua were falling back to the
default 4MB.  Which is way too small for the amount of GMEM on these
devices, causing faults in cases where preemption needs to save GMEM
contents.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
v2: Fix typo in commit msg

 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 0c6dde3cbea9..20fe93b83c0b 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1337,6 +1337,7 @@ static const struct adreno_info a8xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.preempt_record_size = 23088 * SZ_1K,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 388, 1 },
@@ -1469,6 +1470,7 @@ static const struct adreno_info a8xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.preempt_record_size = 17712 * SZ_1K,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 388, 1 },
-- 
2.56.1

