Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810550;
	b=dYlpG2DC9ET2J5Ip54J53o3EQ3mMmhzbk90Gukc2TRylafhXDAXGdTdtMgfVGFz1eJyj
	 SRl1EjeZdDGUezBScYCbz1Y5a3qAvfNNTIhGSmwSscMyHP1/7wiCVW7Cb2cwbG1SbZ5CP
	 d8QW+8vG2D2IjEcgKy6TaEKQ5o5G4+Dkjv/P7k6jOdi3pkQG8KaJoEQdJxzr8MLsJUSk1
	 Ziw8Mymwo1xwt2MXOn3hL8LGVUB6XmccdR8gIex9sLH/ZlA/QiwUDBM7TEaOM+z059p2K
	 g0vAKyejvRGa6O23mDvqIiYR3FSuzwoddRRw3Mpbn5NgQI6GZfA2uk0HSo2aVsR/m6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0zRhM/O1T4txkzF9sfL+DPW1cvJF0Hj1I6FpvxqvriM=;
	b=iMYYXnaEA1vIaCw4EcTccA2OCWdmo3AdNGDQaE6gcGw4iDQeI0eUarrf5sdpoMNytRgy
	 UmlHgrC9uOc7noycC+EpDowaeCGHHlpfN2Rp7c+QR7D8nX6hDjGuu1iQtAPlvyvlIr/CO
	 iaW6gkyUCF/sovBVwR+aho/Ds32dErrEf7g/f7wLpQ/Q1GFtrk7uJMf9U+H5s9WWJpOkU
	 tXBoqlTilA467WvDP7cQ1RGzcjyK5ymuR2z3yC5SMi5zkHsbcGyJypUu8K9KtsMcvHP6h
	 tULJcL6EjZVh9ceQwObVFOadIf46YzVGEAEgdhWtol37XnCqbqKzRazbT4XiM/FFDzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hd0zUjHF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnCBFtQF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E783606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E783606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hd0zUjHF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnCBFtQF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRe2S1381607
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zRhM/O1T4txkzF9sfL+DPW1cvJF0Hj1I6FpvxqvriM=; b=Hd0zUjHFc90UyaV9
	FvI74kpFZEacBrMJduuxJA7JpnJa9Kr1MBfKZFcKjiblzgevThnrz394i/77Dhoo
	KPLDysWGNfbCp9dyB/cJe+acmbagwI1huIQACist6e29hxSyZhbf1LvVkZKpcsHW
	RCi19RuCkIG5FlrwYksumJRabch8akoluNcrkx0/zgFdfDxhi2szZtJd+GGpAS5M
	oiPiM+zmV7bJQPJF5zfSOVd2mjAgNpmPUL73DAXR+5LDTaVEUKtRrdauf3VQoIzP
	E7cCTGlOqOffMRX1Av9HnjySTp+CfWUu2sTRpKI8ZAvYKdYeASmxd2AcLWep4PU4
	aIA/OA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1s8382-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so6693543e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810548; x=1796415348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zRhM/O1T4txkzF9sfL+DPW1cvJF0Hj1I6FpvxqvriM=;
        b=TnCBFtQFaLPb/1y31LcMuA5lVGjUMqh1PuyStWhGwqHLUTLqacxmriCxJbOHYZkaMY
         qsF59MdsBrVH1HIHZgo2EklqplTnnZZBDi1vEXWRvnat60rjjxtzXgZv8xLm82hZbkER
         u6TWA46M1hQzxTfYnLaZMMFNNNWqdRZEP3zYEYWqkaGuxhKMRticcUt/aSeukA4Hg1EG
         5W3RFaD1wJ/j94lD2TeJThM1APWQMvup9Q3N5+GgCBIBaqtba4iLaJ/X+qYJ8/LVa0iM
         tymFZ93lSY70r14eGw7C7R7zMXDR8zscyTG8NokaAKa9UmAIlEhuXLpmUyBBrnCxOHkA
         bPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810548; x=1796415348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zRhM/O1T4txkzF9sfL+DPW1cvJF0Hj1I6FpvxqvriM=;
        b=HBrcq0ML5Tb7MRWhcG582aavekjWw7oHnyXPC+AjUMMd1Xx7oMaOUQBc94zSVeBz2V
         fR+w539NEYi9/rRDmnDI+Us5r37y2I+oINTa8ZO+4vUR6MrJGJq/yD0STNqlO7Z9pW0S
         A/XOmBkfrlxq8is4F98HZjhJFEDFWuzyOtTQALRQ0//OKnlVT/vBXHyu9eINt8fVHjHP
         Tw0avVZCBLY9r9q0GaqFnn88Gb+PDZbsIlAy4uW8gC0r/0VpzbSgaCNtYUsKkRL9b7n8
         omxj3AqMdySo+rsApNYw1Sj31am6TiKFSz1spEHDCoIVT+RJEU/zdmXTqvgtuh2XjKWC
         qfdQ==
X-Gm-Message-State: APuU4Z/IXrp9F8uUGAoosemX58elemq1okMAvtaVV1xGRQ91IzJqproS
	MxIPgp3OfMDrTiI1W66GJ0dkEl13Tb4iG/xTr2r3+ZGqs2w9ljW0tNkvUj83Q3VQ1/ZHaOpHRxq
	LiY2956CuTdodzhLUdFlo2TgaMaP9SvP634S5E7O/Acw8QLc9n9EmEMq2YFgDzOYF7BcBU82G9W
	Qt8uS2RA==
X-Gm-Gg: AZFdTZf+rduMRpTisiDsJvYlUhqtvrhbWM8gTic+5em3YP6V87hRS7NLyIg6QnuWdIg
	3BZSMfBmIC71paHMuao8HmH8JyK9uEDFYF7fue/jGyVs8J3BFo062NjQy+sPZEefOYHwca01CTT
	w/WtWAIl6BGj/Ghq1B+a1sX6iiLyQwH0vAyRyk/mubAYpTFBWoqoymhBaWq+ASgbDZbIJyUIy/M
	Lw3NQoqCNyxHTBf43axMZayWPV8JN02XBHgvTkTLzqY838OWvZAGdgS5G2SSjdsE+5wtzMljGVP
	OsuhBOOLDR1MN5qiccuf8skYzMIO0c5gc/iUknR4ArVHPyCNV7cCAwa7hf6LdC2gzmWRQDd0ggz
	+rf5n3+SISx03uezXt6DFHGUuNi57pgCyXjJ1WEyuGhLZGr9DDeGuHnCk9F1j1Jpa9VKcw+rEf4
	XhAYI/sRcxWX6/kNZcMs2xiuG8xVzAwXv9467AJHS5ha2w0xd1naMb7OOLrkudhA==
X-Received: by 2002:a05:6122:209f:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5ee8af0c762mr16859602e0c.4.1795810548012;
        Fri, 27 Nov 2026 12:15:48 -0800 (PST)
X-Received: by 2002:a05:6122:209f:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5ee8af0c762mr16859568e0c.4.1795810547434;
        Fri, 27 Nov 2026 12:15:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050fddfsm64591511fa.16.2026.11.27.12.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 22:15:25 +0200
Subject: [PATCH v2 1/3] drm/msm/a3xx: report CP protected mode faults
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-a3xx-fix-me-v2-1-839408d293ed@oss.qualcomm.com>
References: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
In-Reply-To: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+geKBFg39jc42lSGhUHzJ7znn8vxsTpvFubSIenP6p4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCeTotaSyqqXnFqCiPhSQ9CqNVoraO6tLNj98/
 XYAigPtnLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawnk6AAKCRCLPIo+Aiko
 1d6DB/43fdupC+YfUjJito55k/+MkyO2SkJwWHB09TjFQ3JnVxmLfMPVfyog4cOdh15VPtNDSUD
 3nN99aLXG1XncAxvtWfmyiZ2OFNAuiJLibze25T26yPPLRU7MdW595uy8GjoDlNYxTl9ur8d6Je
 hZRegMbyifgFyeclevAN4r3ZeRmTPqUhZCe2s1R3DH2NDEKfvAStET/kzaaAT4nZ6tWnhw2XdRf
 yDO5YcTS2yhNEnOjuP/c9kpRRhlhA9abpRMUZRWArOipnxjONMMQzwDGSxU0pYbYjw3TeI2Z/YR
 miGVojtzYfJ5HQTt61c0hZUZkquA/zrzgOzbvZ5fkGlxg+3r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FYOiV5+6 c=1 sm=1 tr=0 ts=6b09e4f5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=mspBB8xj_tKF7Wn_8mAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: yCVcd-mCKr7eNvfB3t_OAMcYhNU4XXBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfXyhDyhBewXKWr
 ZCeT0LVsCbZTeLBwEjRgx9n1NlSTtWpSV+tD9PXo+gyGvpNZVQhpneiyJcsMGmbwI3avEX0d840
 mg4hpPmt2g4GQC0WR2fXAejnZeOg0/bXXwRxJtlSLsnw2EvK9ny66w6u5/gy7c328YvMhKGo7lk
 WeDxgRp4ggDr7hLyYm+WMymhOCbEDQIlGFH5mamDaKYFcfdoR4D4KHOrLVExWtn7JF0Xu73LcK6
 kuT6mBOQPXKzj0VnmkWV3tghyCpXNHZYSlwaM9HQNC7Qb5XArbH1i72FgTsJ+i5Rfat3vRiFvqM
 rr85GQPOO+9x0LGowHpxxgjtqmR1YcWmNH8ezU9gdYRFLU5zdFOQX5sgvR/RS/jwhiBpIr2GDqJ
 f0a1NoGomyQGQPzSTXOyTPVmdHpEMqY4QXhuI1NJt1PJORjKy+7mxM5um6Qt4urQ3mMJe1tcBgX
 idyzB96bhqUrj3MHnKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfXyfW6H/yB2A9J
 aUMrvzu84MjXad6gEY8CTnRtieJ40QorhjWk4TaXSYvoNCpOtb84v/g0kF4wxhEPed0rkKOa8Nx
 BWQKlsmqsaRiYQLLJ/GCnqN9mn4J/Qk=
X-Proofpoint-ORIG-GUID: yCVcd-mCKr7eNvfB3t_OAMcYhNU4XXBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270080

a3xx_irq() acks every interrupt without looking at it, so a write to a
protected register shows up only as a hangcheck timeout with no hint of
which register was hit. Print the faulting address the way a4xx and a5xx
already do.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         | 9 ++++++++-
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml | 5 ++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 160d302e16a3..bd4b3ef7bc12 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -419,7 +419,14 @@ static irqreturn_t a3xx_irq(struct msm_gpu *gpu)
 	status = gpu_read(gpu, REG_A3XX_RBBM_INT_0_STATUS);
 	DBG("%s: %08x", gpu->name, status);
 
-	// TODO
+	if (status & A3XX_INT0_CP_REG_PROTECT_FAULT) {
+		u32 val = gpu_read(gpu, REG_A3XX_CP_PROTECT_STATUS);
+
+		dev_err_ratelimited(gpu->dev->dev,
+			"CP | protected mode error | %s | addr=0x%8.8X | status=0x%8.8X\n",
+			val & A3XX_CP_PROTECT_STATUS_WRITE ? "WRITE" : "READ",
+			FIELD(val, A3XX_CP_PROTECT_STATUS_ADDR), val);
+	}
 
 	gpu_write(gpu, REG_A3XX_RBBM_INT_CLEAR_CMD, status);
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/a3xx.xml b/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
index 21b00a17ef3e..fd2faf134e5a 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
@@ -758,7 +758,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x0445" name="CP_PERFCOUNTER_SELECT" type="a3xx_cp_perfcounter_select"/>
 	<reg32 offset="0x045c" name="CP_HW_FAULT"/>
 	<reg32 offset="0x045e" name="CP_PROTECT_CTRL"/>
-	<reg32 offset="0x045f" name="CP_PROTECT_STATUS"/>
+	<reg32 offset="0x045f" name="CP_PROTECT_STATUS">
+		<bitfield name="ADDR" low="2" high="19"/>
+		<bitfield name="WRITE" pos="24" type="boolean"/>
+	</reg32>
 	<array offset="0x0460" name="CP_PROTECT" stride="1" length="16">
 		<reg32 offset="0x0" name="REG"/>
 	</array>

-- 
2.47.3

