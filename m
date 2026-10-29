Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305079;
	b=NqcLZCh0hXgt/DliegbtJi7mwRWFbTMwLe535HTnVyGYmdYm0qOT+e3UI723MqKOPMFT
	 ZyNMGqlZJDFpql9OCZqETb0JuBNRePtiBglFAyl3v70bwKbl8MOgBi0FXnNqb7A0uch0C
	 Lb1fUTkN5CLkDrUWztWdYXQ379g3/GfqmY+m/ZB9ynRxnt1wIqMXCqE3lRpo5UIr/ryLJ
	 FwuSm6uIe2ew1ys7FxriDXawDo7pVI1kjTxE7ZMkWtpbOT3rk85Baw5c6jYSjP/kHgL9t
	 eZLr4jyuf4ke5E9MCaO0/gzfbDZtXj5HTY9uf6+TLNqo5YQb9JibZm7FmBpTc0NjSIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305079;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yTsteG5a3IaJO/lb122nv9JtPhW2mkEDubQMWm/3wXI=;
	b=3TX7TjlmTcj8EcAsYUkj+XrFn72rSrVxwTrcKF8Nql1Da9ALRQa20v7CU1UMR0HLV8dq
	 JxQ5Xut7NJQELiavjpVCwtQpQFp7DyUJvtgx6f6Ts6qnOU62Dus++Mv99pWbMCMHQcZVk
	 FzFKS2zq4GaYu4u620TfGChf61g1E4+qs5zMANu5W5w9JjHx66PYmaboJ7el06H6CbPWy
	 iwfylA4DmukjayTq8DypojJfMLv1eOHPuJ+I1AZscrRyeIvvmcXXOo6SH2kgzquU9/AYd
	 RAgcm19WaX4d45D/gMxRmiOqOo+qU8y0lMgljBYGWhgN9NYPbU6QLQK3CYb4lBJz3ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VA1PesVq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuzV5IPq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F0F606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F0F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VA1PesVq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuzV5IPq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjYFB2138411
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yTsteG5a3Ia
	JO/lb122nv9JtPhW2mkEDubQMWm/3wXI=; b=VA1PesVq2urWe65w2PmaqXdjLxb
	p2iVzsPBZpEMkXpV/C3taM1Rj6CMYHclPnntq3FejbeWQGklnSBUsQq25KQ119MF
	nolz8Hzb8cK0a/0ZEG3a81noVr3ARSK2HXXDZxNGWfXMN5nYAIpQS1Q/bp9OTUVW
	FMXcCcUuCdcJ3Q5finPQL0btGxGAXVXLGOJ+DqncC4vRWpuZpxzQitWeAgr4ggqP
	oCuX2mqfMwU4HEI5ZyTiqf+H7reAR7YEzVIQF+wwjapNDl34rvflgRrs0yORA6In
	IDZCblL1xcaHmysbcGWnhizTHd7VjF1ZfggEvtcYdITrRY0b7sH8QCUJLdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a22kxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb362d1f5eso200765ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305077; x=1793909877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTsteG5a3IaJO/lb122nv9JtPhW2mkEDubQMWm/3wXI=;
        b=XuzV5IPqqg+456cEzd1Zhg58JXX9XsJbv8dJvDk9zdvL8SoaByNkqLwRO5RtTMY7YS
         s9eEEMLmHO3zcyZnOFvMAh2cvdBBLR4lLk7EAB2TVOSIBMAHB1eXOck9sr1qtYWH/azu
         vfRsnjhQsfN1g9fGaCuVanbWutAzJzzQ3cJ8qmDF8Tjg6jhZnncCMKWMxgH8KrnbIcs9
         NWTfVg6c2LoceTELs/rghWhKweGoBGzkas51lw1s36pkSSFPfNn4K8RP04RdnAhWRO1N
         /hi9kzWOzFInJN8g/gcQzh68eEqpFPNi9fHH1N7TY2Jc3rcnod3oNUoXge9vyxBaLxH3
         mE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305077; x=1793909877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTsteG5a3IaJO/lb122nv9JtPhW2mkEDubQMWm/3wXI=;
        b=xvPl845FFeTZ4fMv77kwCyxIyAVAZ+X/9w0keRCTSEgFgtGpnYmwBuCQr/VhTTXMAP
         8COsxMl5Dbdygf1GOI6vpRUffx+1q3WuDsZDshbDzIAkYXowVHHIqxsJJKSevcuUtCHY
         ZaOldNUDcc77FHRQiI1hyePaLsyrUFHyUXzgpzYmjmzxM7LEysuYcbmrA9t9vMBs34Qm
         9UTuf25GqhgIMU0vDDSwI5OD6AbMw/ydLNcE73aVRefumzBUnOt212s/DyqgUAd54o3g
         QinUdiYIY85qE+297F+J4lZvlUWm2RmevvT49t7+KRhm7jdCPkY6HtNpjjlhLtCdns+O
         q4zg==
X-Gm-Message-State: AFq9FYIrupm4pE83w6hJ/z7eGBdZhIwgH++s2kQyy/4rE1hR9IloODHD
	/pF2kx3tbV6E10jj+o2N31zAStxH9Ov/7rDzRCqfA0kGsUF22P7NnOnM/brCFIRj+d3GV3OjFrV
	F/PYstyA9G3CnNzSWfh/itVq4a0qfzzFZDIb0911M6Z8ChAnCaKfZGNvvKgyNT46gKXz+
X-Gm-Gg: AYBFou0A6/Yw7JoDUFFZy+SntlIU0ToQ8DNIRuO5PnkOeJAliwN8GZ8faochnP3nfQs
	hoG0D5C1/7AuzQR8+7T7OIe97jgRTx28vbQYGTyjutvC4khDv5lUWgz4npFHuGdI4LRri8fv54V
	XcXuf7f+IIRq0k95j6M89M/okevZ05P2ouazkBj7vVag24E9KMCAxJLej4NNx8PgZMgfDdE6uvO
	Sd2/yDkZFwE1YjDUU7wZ8hUSJcTiXusjs+j9Qr5ink/phaEn0o+6s1wcm4dkqKdnlmVmLgIt58B
	Q4UZyC1YZmDHiN0qTCKaMSIXDe/F4mZ79uR4xOlTM+DfTbg+54hDD9XEJW3FQszC66pW36xSP1i
	5JpDgdiVGL9ISFM+XH66qaQIajStcRI+T0vYx5bv67mIcfmMQ0KkB58yhNTXeBNV3ZBDgRUm/07
	Io0ZRhpIcgD9qluIqXk7CwlfQ=
X-Received: by 2002:a17:903:41c9:b0:2e8:2d05:9780 with SMTP id d9443c01a7336-2eb36414e25mr5294005ad.8.1793305077214;
        Thu, 29 Oct 2026 13:17:57 -0700 (PDT)
X-Received: by 2002:a17:903:41c9:b0:2e8:2d05:9780 with SMTP id d9443c01a7336-2eb36414e25mr5293905ad.8.1793305076784;
        Thu, 29 Oct 2026 13:17:56 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3694e20csm567305ad.53.2026.10.29.13.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 06/16] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Thu, 29 Oct 2026 13:16:16 -0700
Message-ID: <20261029201730.151754-7-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX7jSSI8d2wY9J
 vMnUIinLRT31WSi4SRcfbEm2CyODXOk5SbnOM7ni69iezJrl2pzjw55KeCum8f5uDFIeAxwtv2y
 OJOBtjqyiIlw2t4Fbc2Sx17Y0eFtYySiKmNttqPcFOQTBc6knR2BKZFSPiuicEKY0yb/CBGe7QD
 2/K9yT0471bO+aSDD5cCfChAKb80xHd6ou/NsketiQTInD2UUc9OiFyHjDM6vB5YkEyKyfzjXFd
 Yi6WvNVbFjlQs+8rEqx2fjJKxGKrMkaFHrrW0fk9Rzt1vTxTC/s7ufW3Lu17S5/DMkYFJ9Ku2HE
 TY+zWwQkhmZqh1rhjDXtrPxnDv/t24Pn+q/DW3Ng/brKRcKZ3ZJu1xL+QXXbbKN6Ygbdme2KQ/Q
 bmdmCIgws7EjB02wqiWTC+kUN6G//R71xDUDU4+AWxfkshft1gLMjFd35F6klFkpANZBWA9bura
 Kn4IKu50Qegdzf5kXiA==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae3a9f5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXxXsu6MNOM3Gb
 kb7xdh77EcKaXIkwy7TPVBoQiaa1YX8ZleIyt0S+284bUKCoH6eJOfFsj51t05EKtQdSP4ls0zt
 hE8w+wCe5T/e5ETOd5e8u5WeqqqbMz0=
X-Proofpoint-ORIG-GUID: Quuf3Gz0cwporL7X-fsoUi_naPxLCl9O
X-Proofpoint-GUID: Quuf3Gz0cwporL7X-fsoUi_naPxLCl9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290079

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 8e91edf16ec2..795c16d88f45 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -370,6 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -389,7 +390,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
 				*gmem_protect = regs[i].value;
 
-			gpu_write(gpu, regs[i].offset, regs[i].value);
+			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
+				gmu_write(gmu, regs[i].offset, regs[i].value);
+			} else {
+				gpu_write(gpu, regs[i].offset, regs[i].value);
+			}
 		}
 
 		a8xx_aperture_release(gpu, flags);
-- 
2.56.0

