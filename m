Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417262;
	b=D5z1ysBeQjjmW2aHG5/5JlraSVgU77DM+TsIRc7yGY/gFnbjEBQ0CYTfhIVw8T+3GPql
	 PuVgjiFn5d8S+FFdF4evid7ivsK3AwJ3Vb/Rn+Gi0mzjZc3TkE/Kz/pHqmq/nG2vdU1ax
	 4JdcV5TL4VlBJ9tEKBhAy3sVSgqGiud/nd0ZN6lb0xOjTUUxzp5Tk2GBC/Pw8sIlj8Ljo
	 0KwtrPH2IEHxXHRM213VR8cbkojWz/ISWsxiozIz6DYGiWc0mMNTXwv5J0d2sfYANuYJM
	 ox/6bby5t8HxYLJtJDeynfv0SaV+nqAM7q/J8YlWrhJH8MKTRcJg0jQ6cTWtzOM5OXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/wofSj9aHPA9D3MGeEg1Jb27L1jT6JF34ZU9QKgLdoM=;
	b=vE7SWmK03PDkFdJq50BsVmD3SM0nzFPD6/fNCDl/zYOt9eRfXE0EKgXlhoAI2ob8Vw0K
	 Opln0Ryj1c15OhcghmUlXA5Bk0Yk603iVQMS2Ww6vUodL5wc3Hb3uYxpWs4Z3qxYlrhf+
	 JsZN/qpP47rTVE+FMa3klwuftZb3ciPHcPdrukNYGOyP2JPF5+TVW+yiH8kVzB3zBmBqH
	 kb09JbNpn7rLBglQlKU7XMpIruv7aOUPyfE0mGxwperJU2axGjkT1cME0O3It+Alc2b8s
	 4J8q4Z5uTx4556eHNZzMgFkrW85HqVWhmUqObYhfJbYSOriAZPEZFaVYTOSfz7fZIeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XInsIKDv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VVzdtrZJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE4F606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DE4F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XInsIKDv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VVzdtrZJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1E1G2116398
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/wofSj9aHPA9D3MGeEg1Jb27L1jT6JF34ZU
	9QKgLdoM=; b=XInsIKDv6Kvmyy59js7k0guJDqGZv/3GaSfRNpGavdN5zPn9yD2
	3ryesp77XMZIxNa2Y8RezwFpV/Vt5M8xAvZ8DPE/X0YyWNwEhd5SSCuo9hHhW0NC
	t8Q6pML2a3Npno4kOQkdMxwyNIku8jXnnaGQS8dyQhooU81cIRd8rxUvvcUL8eeQ
	DVE1zNrWWqT8N9tHebPBclWgx/Ar9hDm1jtFYVzuNc3P2yQxkmf+4mw5LxQ47Nla
	w7gnQbr4s+rA6k+pw8dn/aLJc1aT3mJf51zjFlfV7F/0s0ACmuPMNMvibu94qaJx
	5fpKthivPUpmvrLHEILwCXu02inuRtReMDQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawk7jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:14:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8dd9b9743so38369885ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794417261; x=1795022061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/wofSj9aHPA9D3MGeEg1Jb27L1jT6JF34ZU9QKgLdoM=;
        b=VVzdtrZJYM2YnDziq573eO88rdKz+kV2sU7i3arrogkTHTkWMXDowfJZTZmNH1o5P4
         HmrFuWQY2ioKbx/k3CYSuSvmNkJBEkTSgjvTZ7j3Egt/If2U710K3JWKbJCNVomb6+Kh
         UC2su1zfjvZzRV8MACl66Oh0GW/m5h5ErXT9spZlaqxL9EXdmlP8HyFrV996ESOCpvCi
         0EzFXwHfmexkUqqrH1/R+QfL+NYR3GqcdIUA9JSgnumtA2Dl71XgHCmwi/EuhQm04DNn
         DmUkat9tWG7yTHaSEDS7j/EFtyBf3EXvYZappBQJ33dUOM+M+RZZf3Dnw+dw7IrO7jYu
         d9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417261; x=1795022061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wofSj9aHPA9D3MGeEg1Jb27L1jT6JF34ZU9QKgLdoM=;
        b=puJoFu6W6ntlEadb5geCjZ+/y/cDVxxJThc1vrmeF6nooGrNfXNO+X8VrImvcCFB6Y
         c22qiTs4oUMuHXT03wWvtXy5HOtv7+8MML3Mu2trjA4OWzbB6k5NV+iEXi0uV0WiryNj
         lWbk5jtixP3EvmS+cgoupDDo2n3obNVw+phKQRVbMXVSG4WSw9+bWrjqN+Eql/KnDkqL
         X93GJ0eMJZt33U8Bd0tpHlNsxI6mUCsbaFb9pZNTHiMB/KhvsCG6GPN4NYkw2J/K+Vsy
         /k6Et06v3aK8KpsMmmgFm3O9giAINxbQdBWBAd9d8Yz9qy0fVXPYnsyse+vAnkVd2V7S
         UzOw==
X-Gm-Message-State: APuU4Z/bacgEkOFLp6pvixikn8wcdjKFaiiwZUzxZBHxShivdKua7tCx
	oemapjwnqHQOLgzxQTKoDr0i5MOg4UvrNVyHEBIjjNcmJB7jjW7NUAoQ1rADS7SVOUVpEIQZ2TJ
	kFE+MsJ5CwM3i+/UFJOgo3puG0xSlSqx2Gj7r4aO3VoIbSw5awIXcGLeiXT6rRfjh2sG0
X-Gm-Gg: AYBFou3hKnJL0zxSe035rMvNR/YvFX9cxTQvVhSEIFB5HbQ80i5tycnAd7fq3RTg5RM
	AUbU6eFbg3YH63HvgFSQYTAMQa9jjUYr05gwvCz3ZanxpoC8PXxiJkO53IMivt/0n1xylYyBdHT
	6UwV+hX2Eh3/m56T/TDEQfOF+FTuNLhbVNnVDlVjEFvKZZ/yl7xeS8mRkPXToW0TUFq2uEjhRkB
	tt2puhdJvZ+jrUEn6yWhmNHNFySFcV4mgjGCx2j8DflteC8bS5OxNtHZ5j/xrHh8KEHu3eXWnOu
	LT8x4Ps1fygCd20U0EEYqntBWApLQKlgNzU8VwJfSrTqcijznkeF5CRu8nRk+B6auCUpD2qfWGy
	Y/HcXvKh6IYncOoUQZ9Z91YxQPDIXyiimRsVnx0nI3gtvjpnt4yXcHxYw84TMFRFJatSxjOwNY9
	+BPiMlspS1BbBi/v3Ah537AGH9iTr7sdOYDRyam1USl01DX7SZ0HEYgF5fRW0yqw==
X-Received: by 2002:a17:903:17c6:b0:2ed:379:158d with SMTP id d9443c01a7336-2edd76d251amr34944305ad.9.1794417260828;
        Wed, 11 Nov 2026 09:14:20 -0800 (PST)
X-Received: by 2002:a17:903:17c6:b0:2ed:379:158d with SMTP id d9443c01a7336-2edd76d251amr34944115ad.9.1794417260379;
        Wed, 11 Nov 2026 09:14:20 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4d78bsm23272985ad.24.2026.11.11.09.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:14:20 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Improve AHB error messages
Date: Wed, 11 Nov 2026 09:14:16 -0800
Message-ID: <20261111171417.249152-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX7qZnD70nUM8B
 k9bVWNzDbg4zeL47fufFm0zLYQ0PzJp9MkXuRxsgtIsSj5P3jDROWDMoQ4rDtNma1WGP889x/Ha
 UHr+OyEolPlCVj32r3BDloSjjmv8WAI=
X-Proofpoint-ORIG-GUID: HGb2sP0ZCU1wz3gP5Ya3U-XTwWqkZup5
X-Proofpoint-GUID: HGb2sP0ZCU1wz3gP5Ya3U-XTwWqkZup5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfXxF2N36kn34mU
 w/QGuuu8+xi5jUyqPcnYqQMv7ChgdauFDmTOFT9b9tLSZaN26hNi2W84lfF5RLVgnW9CtwJgpeJ
 CQiNnBsfmXOI7OLPIQ7hOWlmFxDk++0tYwQJE58OtSETAlYtJo5Y9BUSLCQH640O7UAsYkxxFrl
 EVtw1SrAChJNDfYT5ELvmUAgzbgUA0KFW/CNU/LkHMdIOCvh0NRTHERBVXGF6UzPnVtnZr5PCrS
 FQvEWof5ifpI5gNTh2QCZvgZdR1SqNAcIRAzxHxupG9UMe2HWPD3gW5srhwjiu6swC15RYL8dBb
 dXsbKaoMM5loLFyxa3JuUA+IcB4D3oShw+x8i6fIHyDA7LyZWiP0u6sAiKz2D8Nsmd0EL7KrX5Z
 ykwc7IpM7tzjRJK+S8MLRTEOLPQmFkVP5gZM+MnEqqdkqM/wr6BGBuKR5dycjJ9s8os/L0L92KA
 3cfBCZUMyt2UFqrSNXg==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af4a26d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=WBtBlQOfHxcDcTM_9MQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110068

On a7xx/a8xx we can get some details out of the CP_RL_ERROR_DETAILS
registers.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 20 +++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         | 10 ++++++++--
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 11 +++++++++-
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a93e9c960d88..484a78dbc804 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1957,8 +1957,24 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
 		a6xx_fault_detect_irq(gpu);
 
-	if (status & A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR)
-		dev_err_ratelimited(&gpu->pdev->dev, "CP | AHB bus error\n");
+	if (status & A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR) {
+		if (adreno_is_a7xx(to_adreno_gpu(gpu))) {
+			u32 rl0, rl1, addr;
+			const char *mode;
+
+			rl0 = gpu_read(gpu, REG_A7XX_CP_RL_ERROR_DETAILS_0);
+			rl1 = gpu_read(gpu, REG_A7XX_CP_RL_ERROR_DETAILS_1);
+
+			addr = FIELD(rl0, A7XX_CP_RL_ERROR_DETAILS_0_ADDR);
+			mode = (rl0 & A7XX_CP_RL_ERROR_DETAILS_0_WRITE) ? "write" : "read";
+
+			dev_err_ratelimited(&gpu->pdev->dev,
+				"CP | AHB bus error RL_ERROR_0: %x (addr: 0x%05x, %s), RL_ERROR_1: %x\n",
+				rl0, addr, mode, rl1);
+		} else {
+			dev_err_ratelimited(&gpu->pdev->dev, "CP | AHB bus error\n");
+		}
+	}
 
 	if (status & A6XX_RBBM_INT_0_MASK_CP_HW_ERROR)
 		a6xx_cp_hw_err_irq(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index f6afa5b3b0bb..bbf5ca4fb6fc 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1248,12 +1248,18 @@ irqreturn_t a8xx_irq(struct msm_gpu *gpu)
 		a8xx_fault_detect_irq(gpu);
 
 	if (status & A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR) {
-		u32 rl0, rl1;
+		u32 rl0, rl1, addr;
+		const char *mode;
 
 		rl0 = gpu_read(gpu, REG_A8XX_CP_RL_ERROR_DETAILS_0);
 		rl1 = gpu_read(gpu, REG_A8XX_CP_RL_ERROR_DETAILS_1);
+
+		addr = FIELD(rl0, A8XX_CP_RL_ERROR_DETAILS_0_ADDR);
+		mode = (rl0 & A8XX_CP_RL_ERROR_DETAILS_0_WRITE) ? "write" : "read";
+
 		dev_err_ratelimited(&gpu->pdev->dev,
-				"CP | AHB bus error RL_ERROR_0: %x, RL_ERROR_1: %x\n", rl0, rl1);
+			"CP | AHB bus error RL_ERROR_0: %x (addr: 0x%05x, %s), RL_ERROR_1: %x\n",
+			rl0, addr, mode, rl1);
 	}
 
 	if (status & A6XX_RBBM_INT_0_MASK_CP_HW_ERROR)
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index b1e7dd26e98a..8d33d9285007 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -193,7 +193,16 @@ by a particular renderpass/blit.
 		<reg32 offset="0x0" name="REG"/>
 	</array>
 
-	<reg32 offset="0x0840" name="CP_RL_ERROR_DETAILS_0" variants="A8XX-"/>
+	<reg32 offset="0x09b4" name="CP_RL_ERROR_DETAILS_0" variants="A7XX">
+		<bitfield name="ADDR" low="0" high="19"/>
+		<bitfield name="WRITE" pos="28" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x09cf" name="CP_RL_ERROR_DETAILS_1" variants="A7XX"/>
+
+	<reg32 offset="0x0840" name="CP_RL_ERROR_DETAILS_0" variants="A8XX-">
+		<bitfield name="ADDR" low="0" high="19"/>
+		<bitfield name="WRITE" pos="28" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x0841" name="CP_RL_ERROR_DETAILS_1" variants="A8XX-"/>
 
 	<reg64 offset="0x0830" name="CP_SQE_INSTR_BASE" variants="A6XX-A7XX"/>
-- 
2.56.0

