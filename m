Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499634;
	b=v/P/EJmLRI5RoMvPqJXJ5cXSa7ShNNU+rOTPr1h1ldSEqHT3Qu0fKrNISyMEQA56Q3oT
	 GIuOKZvkUJqiOjIFVPjt9LRym9KKXBijYibbYGxwnxn5i1kBDdZMO7ojj/G3WjfmRK0h5
	 knnEntPRFOjjUfzrHTFouGxWW70d05JGZ8lX6U4kxa89HTSFWfCVfpQhOOFHoX2/HGyxf
	 jLQkDVG5y2m/WVk/yQiN4L5nI0iS729rVs+9Fb5hwT9TELwhyGuo8xUsCzwVgXzG6vBlU
	 /5gify2/PRRIKIT8U80k738Wgcojij3KBjC6O0Gnh3gyWYmR85XPcijSSVqFXhF80/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NnU6y4luvTuh8U9uo5pDvncjM0V/OsuTGIIKwgCmHqw=;
	b=KbiJHOQGHLfciTnzC2/IpmhhU1ETV5vAKhgIWvO9bPzGNDB7rOLPBrn/wreoDS0c0ZXs
	 a047dMzewnB+Bo6NzM9Ot8uqUhTVjor8qkXIfCa6wO9pXaQPaqMYr7NRxOmzrEi0PD84x
	 JPmctzTqmLosoWW92pM7YFAdjsB8CLoOsXwMEWbLWIRoXFMVxA0EPjcozmg8Ojhelh0uT
	 uvAu1kYbsUae+C6wSkQqN+pf65cxikM4NZ1ShkPYyMdNHo1+8lghLEE6W1yX3tfBDuVI7
	 ytwCRNJxuqgjfSJ9cQh4njKeuM1iPUmJ4XlhJD2W4Sj9pbg2BZrAKgw50Usf/wtOfgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aFB/Q1bx";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1YxzDll;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB56606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB56606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFB/Q1bx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1YxzDll
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZVdq1159590
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NnU6y4luvTuh8U9uo5pDvncjM0V/OsuTGII
	KwgCmHqw=; b=aFB/Q1bxcYpelLMYfZoTooptWvIZo6UX7IIgZnXH6UQ+lcftOEv
	Hi5o7GVWayaQSDX1K5054dKvvTw1/7jsBwf242mKTLPqWcnI/lcsNttovr3lFTBq
	4wOOEHFl0oZ9b7R4MoztOTXG60bNC9N2A8uu4zGk0S6LYDdHUwm0OHMV19HNG0nn
	1RQZPP7aBP8sGBVGBaFjdLxaffQsXZ9rei6L10YuIVmSIKfNIxiuSrxLMtR9XYQl
	XZUDTqM254l78S3lD8DHZGM2KY3vn6AIQro/sczKL6RcaiCv9kZt8WGvmB13xZjU
	OdniTa7pbATRWGd4o8fJI5jiSWyG7hu3dng==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a09tn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:07:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8bb1a7b0e52so2501674b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794499631; x=1795104431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NnU6y4luvTuh8U9uo5pDvncjM0V/OsuTGIIKwgCmHqw=;
        b=j1YxzDllJWeFmZ3J8BygUVCMUa1oKvk/CZrW1i/xVMwg06NVCheWt6vdjlLA2k3hbz
         7zZMuj8sJbN4M719wLfWVDsXOsn6bA/pApbU1/DZjZenX3N63dYuiqGk2IKp01QwUq6u
         Xb6aBSfF50CpBGZJ3+UToRFnv7paAPQnjNWY50VNDIi2/rc1Zmn/lIdNG3JvjU6xFNi0
         ZIFoH+ojCpjAKvg+G+u3oyiobgCi4Dtg7Kh9gpGtR/OrvTyMOU7hsRgFku1bkujktjM3
         jRTjoIhjGJHM/Qfn0zCRwlpjw8gBHrP7NjafM4Gzqug75Qnyh77zdsFUmBYqqIzhdIvt
         4mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499631; x=1795104431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnU6y4luvTuh8U9uo5pDvncjM0V/OsuTGIIKwgCmHqw=;
        b=FavIi+iMTVr+s68P9bHUGExxWplqQMdEnHzjlKNxkxGWOodUJlc3PkAvt+96kwuV8F
         G9+Ovt0XG0viggEI/bZ3C+fs8gs1fusRxgqjPwYehe+oXUC5KhHdOfFPxS2hJWcr/LqF
         N5bw9b0zHwK7BMF64IRbZTWYKnUYcB6cgY7ENSjourVlfVPPn+B283EkZlVfC4TJL98I
         gmj0krTN+pE1FYPMmMtNcr7onLdpswI5QnGi75kpWQ1ve7ZiENShmE0Hh/D1t2cLkJ9L
         NXUoqh9wKTRLeDYhzSnrO5RAlhf0vnh5UXwv3d7D7HUjd6jm1Rp8nH5WvWq9h/NP0f//
         98tg==
X-Gm-Message-State: APuU4Z815VyXUBy4utBZFHiI7QUWI9bTYEJxiyquGcbfqR86E3B+0yVE
	ItV5ZYih2P7m7FT2dc7SdRL8IbB1wnw7tV6UX91Yr5nAAcqkuOt0dUOrAaAgUQYB007zSFQESd2
	Jvytc9vcky6Y5IiwXxhacmpZ84qn60S79IV4I8dbuhTJNx/ddPWWwfNH1E0Sml0QVfLCA
X-Gm-Gg: AYBFou1I2dRuw2scK6FekSy2y1sPfwPM9AycgN/BOJuiS31uQpha9JIWwS/CFbU8jLe
	aAonI8FM9vAH7uRwUzk9xNmplyN6ZFigwMjTzPbUVHk8JbHAvIb4Ny+KqS/1dxRVgk+SZJNzPco
	Q98AHICGTOn6Y8VIOwZN5g93CI0ktmKiilmz/84oQ7maQkILop9/fVFl2nkGaeJItsAniMbaE1g
	NC6sLqtkW1Tn0KS+8W4zdlnEYTwkvnYhEv3KBi5F2K9Xou6yYwAn4XK6bpA2tVj6P0lXnTr87Jp
	PaDeH668Sv+i16MKSRbSbSxGJPLAmwJZdmJDjxAT0AoaTKHYb4asUyBpDnz5L98A1D2tn/tDLkK
	yhZD9N8w9gnpNd+g2I2GAnzZ+0nDjB2+zIJ3AJwnlB+Gi6TuhBMmIcctxcTqTOeoJtRB57w4TzX
	DIiQ05ToKA9DUzUmfmsZ4YB5EhMBHJKUOG4sad8ZTX9AjBArzLVKndwqeVKYqe
X-Received: by 2002:a05:6a00:189b:b0:89d:ec58:ce47 with SMTP id d2e1a72fcca58-8bc1e1d2a29mr6061964b3a.55.1794499630485;
        Thu, 12 Nov 2026 08:07:10 -0800 (PST)
X-Received: by 2002:a05:6a00:189b:b0:89d:ec58:ce47 with SMTP id d2e1a72fcca58-8bc1e1d2a29mr6061911b3a.55.1794499629987;
        Thu, 12 Nov 2026 08:07:09 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b27e8sm3588199b3a.16.2026.11.12.08.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:07:09 -0800 (PST)
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
Subject: [PATCH] drm/msm/a8xx: Fixup hw_err_irq messages
Date: Thu, 12 Nov 2026 08:07:06 -0800
Message-ID: <20261112160706.387641-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: Pkj-2N9Q7W3GHNsYKcgjG3SpyY01q6Ft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX56gYbHEs4FeZ
 NcbAaUlG3qR2gkmZhfdQTV4PBW8p8w+TS6v332MdvwsqZka8P5+2aGHYQj7TQsz+yqGaRWXWMkp
 M7hoXk4bkpNSXyrToZgF1/rZoe5jNU2vJrDxo9KiDTUaUL9TzqzLTtJ4jh2CZwC1LLzSbTVR4Pm
 crKIzpXmdPWtjylHoiNLFabwOvWgGQ6o/BJQwWN8ev7HtojrvnLedflvtHF9+n3yCxhhf3JueKa
 YJCY1kNFmIt7LnhITmHWeOzaJ1oTLLpAdbJ8aqpTEVWRIjlciIGj/jbqsdXL58w7zUqu2uBNAHz
 DXUCs30X7pJhslcVxBl6TA9SzdksF5ejakd/OIDbYgMF2hAcWhXlPtj5LjIHsAmI76fCxeql38G
 ZONT1HT24NzGFWkEmndbwyliOV+H/9e5rLJERlE8WH1KMqTAJV2JQTOEmYBhR3Iy6+gjFnXHHOf
 vB2T2VLUjsWxx2G48ug==
X-Proofpoint-ORIG-GUID: Pkj-2N9Q7W3GHNsYKcgjG3SpyY01q6Ft
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX0FjTN3uPo3aK
 /5vLnYAJ2pMHNTh3nwYfmzHf6CAG25lzuL1RXFQsMDxjsVUQ/zZU15AcGwDJ8eaLYBBIbvE/7+c
 hEJxxlia1bP/xmcDbK7wHMYoicLEzmU=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5e42f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=cmur_pPeXtk5nLvMRVkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120064

Handle all the pipes, and don't clobber 'status'.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 58 ++++++++++++++++++---------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index bbf5ca4fb6fc..a1747990e10e 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1048,24 +1048,37 @@ int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 
 static void a8xx_cp_hw_err_irq(struct msm_gpu *gpu)
 {
-	u32 status = gpu_read(gpu, REG_A8XX_CP_INTERRUPT_STATUS_GLOBAL);
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	u32 slice = a8xx_get_first_slice(a6xx_gpu);
-	u32 hw_fault_mask = GENMASK(6, 0);
-	u32 sw_fault_mask = GENMASK(22, 16);
+	const u32 status = gpu_read(gpu, REG_A8XX_CP_INTERRUPT_STATUS_GLOBAL);
+	const u32 slice = a8xx_get_first_slice(to_a6xx_gpu(to_adreno_gpu(gpu)));
+	const u32 hw_fault_mask = GENMASK(6, 0);
+	const u32 sw_fault_mask = GENMASK(22, 16);
 	u32 pipe = 0;
 
 	dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Global INT status: 0x%x\n", status);
 
-	if (status & (A8XX_CP_GLOBAL_INT_MASK_HWFAULTBR |
-		      A8XX_CP_GLOBAL_INT_MASK_SWFAULTBR))
+#define FAULT_MASK(_pipe) (A8XX_CP_GLOBAL_INT_MASK_HWFAULT ## _pipe | A8XX_CP_GLOBAL_INT_MASK_SWFAULT ## _pipe)
+	if (status & FAULT_MASK(BR))
 		pipe |= BIT(PIPE_BR);
 
-	if (status & (A8XX_CP_GLOBAL_INT_MASK_HWFAULTBV |
-		      A8XX_CP_GLOBAL_INT_MASK_SWFAULTBV))
+	if (status & FAULT_MASK(BV))
 		pipe |= BIT(PIPE_BV);
 
+	if (status & FAULT_MASK(LPAC))
+		pipe |= BIT(PIPE_LPAC);
+
+	if (status & FAULT_MASK(AQE0))
+		pipe |= BIT(PIPE_AQE0);
+
+	if (status & FAULT_MASK(AQE1))
+		pipe |= BIT(PIPE_AQE1);
+
+	if (status & FAULT_MASK(DDEBR))
+		pipe |= BIT(PIPE_DDE_BR);
+
+	if (status & FAULT_MASK(DDEBV))
+		pipe |= BIT(PIPE_DDE_BV);
+#undef FAULT_MASK
+
 	if (!pipe) {
 		dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Unknown pipe\n");
 		goto out;
@@ -1076,31 +1089,36 @@ static void a8xx_cp_hw_err_irq(struct msm_gpu *gpu)
 			continue;
 
 		if (hw_fault_mask & status) {
-			status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+			u32 hw_status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
 					REG_A8XX_CP_HW_FAULT_STATUS_PIPE);
 			dev_err_ratelimited(&gpu->pdev->dev,
-					"CP HW FAULT pipe: %u status: 0x%x\n", pipe_id, status);
+					"CP HW FAULT pipe: %u status: 0x%x\n", pipe_id, hw_status);
 		}
 
 		if (sw_fault_mask & status) {
-			status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+			u32 sw_status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
 					REG_A8XX_CP_INTERRUPT_STATUS_PIPE);
 			dev_err_ratelimited(&gpu->pdev->dev,
-					"CP SW FAULT pipe: %u status: 0x%x\n", pipe_id, status);
+					"CP SW FAULT pipe: %u status: 0x%x\n", pipe_id, sw_status);
 
-			if (status & BIT(8)) {
+			if (sw_status & A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_OPCODEERROR) {
 				a8xx_write_pipe(gpu, pipe_id, REG_A8XX_CP_SQE_STAT_ADDR_PIPE, 1);
-				status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+				u32 opcode = a8xx_read_pipe_slice(gpu, pipe_id, slice,
 						REG_A8XX_CP_SQE_STAT_DATA_PIPE);
 				dev_err_ratelimited(&gpu->pdev->dev,
-						"CP Opcode error, opcode=0x%x\n", status);
+						"CP Opcode error, opcode=0x%x\n", opcode);
 			}
 
-			if (status & BIT(10)) {
-				status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
+			if (sw_status & A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_REGISTERPROTECTIONERROR) {
+				u32 prot = a8xx_read_pipe_slice(gpu, pipe_id, slice,
 						REG_A8XX_CP_PROTECT_STATUS_PIPE);
+				u32 addr = FIELD(prot, A8XX_CP_PROTECT_STATUS_PIPE_ADDR);
+				const char *mode = (prot & A8XX_CP_PROTECT_STATUS_PIPE_READ) ?
+					"read" : "write";
+
 				dev_err_ratelimited(&gpu->pdev->dev,
-						"CP REG PROTECT error, status=0x%x\n", status);
+						"CP REG PROTECT error, %s addr=0x%05x, status=0x%x\n",
+						mode, addr, prot);
 			}
 		}
 	}
-- 
2.56.0

