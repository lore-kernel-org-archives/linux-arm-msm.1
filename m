Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808709;
	b=xAHf7aGkQHu1MNOZYWsOjzwGR2VjNbxp/fUFmPS9wqEKUEcGLE/yIEkAGjBQuxD5AaDL
	 YDdK+eRuAIQZZ3WjbTnpvyGNn93W/IbGCxD+sLVRnrf7muIAoBWbiSz7u5pkAcoacXOhg
	 F/AfvEhXK4hslCFHNdB9RgqpjO5ytD7VH/wRhJR4d6qkxGtN9VE9Gy+aMQBno0ThQREDd
	 GSqDCcZfb/1SygYHK4si7BUzNfkCeCjDguvzHRsLAAq4gA7LoXhLrQu12qyD6C4kVM1HF
	 pY7NlCPwR5G0LFyzGBjMjTavrTMyTqxw4iLeQj4GRiyU9p4MxNCqZLt7XzdEHZwaygQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KvZwkbWp8+Nl2K1PrPnNMNb3pN4kwzB/Z6/fiZHIt2g=;
	b=4n4kCYoZbTaoGZWBeG3sIoNRXJUXp6kWSwdfozcGabLsNMbUBZeeMAad1I1cm0/+VDjW
	 osvB6pL4GXAwRNqV+Q91knEW4Bo48qxjKqnfeTzSyWeE72nJuXyrSH50qiiVNT5XfwRTW
	 vSrQGaMwaXxulZRpEImDffnchTVtCUfPeZaRLAoI/xgt+iZp2Au00mlU3snu4Wd+vnJBM
	 xLp4d2rMSvuA4AJbpaTshHh/jin7eMvdmKjesA4GOssF+1YrPjbgPn4fYlD7NjgD/8lMP
	 FTQgqfFUOePw0yXt6VcZX6P1gFfw56omcE1BChqczDKV7jPNhxCdEr7z8iY8ASIlvMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lAfL3Tqm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cx6zh9+s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F0B606A339
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F0B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lAfL3Tqm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cx6zh9+s
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJR8g42668628
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvZwkbWp8+Nl2K1PrPnNMNb3pN4kwzB/Z6/fiZHIt2g=; b=lAfL3TqmR8Hps45h
	zEalo4PtEDMTRRz2YBSFytFrb3tNxejxXuZQU4V9I+SqvKAtww0I5/q3B41TyxO6
	tyOcMFzcXdebQsjbiN8+y3Gsv1hQpqBi3mgPTjm6ZO/k1SRFuxWl1yBnSpNjz6TZ
	YvRUrreZGoOtm+X9mA//QL2VF79G2+ndXIQpf9w60ETPxzSEUyYhbjjo1vsuaeq/
	E/q9AL+MLQS37ETNejqbc0yHJI8nRAXhjOtW086NmT3b+fvCp7Yr/4lSBdOn2etq
	Uy7lT7zoHOvzb/D+SNxUc+9a9iPUBlO/o+1bDt4dAGqzdey5Xs7nD5HgbYZThW1F
	oGBCAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1jg1d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949dc497896so740882185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808708; x=1796413508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvZwkbWp8+Nl2K1PrPnNMNb3pN4kwzB/Z6/fiZHIt2g=;
        b=cx6zh9+sSEKQ2ZAuk7zN5Hzyjwa7H2Gl/q1jmRQAn5RY3rmhr28cCEH1RVZ82yUA9d
         Cr2+XbiQ85OkC0icUm/BPONf1xLz6mDoDtADX6DPairhngtEs6EwIyerguFR2cjOf8oH
         WJhyBCfq4iwSNsxKfC7jnmV3lAUTZ5QuljF5pceEC9mNVCNfkhwD5hT4AC9n5DQumsgh
         PliGVTuEtvSwX0PNT6MB59w0deE1SLOA3cKZoVyCgqNm6B7EInUweh0YRhT7nCtDIjzC
         fWFlBEmcWz7IZnVoVU8im152rtboVc6XbGbqXWtoteZVF8o7X4jHluVv/eOCBJahXN80
         dCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808708; x=1796413508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvZwkbWp8+Nl2K1PrPnNMNb3pN4kwzB/Z6/fiZHIt2g=;
        b=OB5EbNnFxlUx9GlwZQ+xlIV8xnFTRZSxM52FYbGEAdkm2Cka3PkxntPo+kBuh9AktG
         KW1BZp5ryXOrT0Pn+EORCr3D/7BTkTK4XnS448kEvcwYE1KLjGe/CURdDjv1uuXY7gvS
         5dBKhz8AH0+MsbSXuW8XnxNBIWw1AdXgzH+WRd1Ie0QGcdSPk6GzU3OIedxqrp1ysVXZ
         cgRWzUX2u5M8WGLBVZWunnkijBbdaldUnhUIpnVHisphRskTcRPnSuQTEjUzLLA54LEd
         zVR4oKfBuU5FzFh8s8w4Bg9y42mWKXqTEj6v027pKK6ztgDsoTolSaJ703AypKKMEB17
         fc1g==
X-Gm-Message-State: APuU4Z+uv1ctBQn6qXV1REF+oKdsW7qM+6qJ5tnIAa1PEJHkaTeqSujK
	2JDX1cHuuqSDtzbZnn5aQL8TwpSRPt24BZGjJhSRGnRpJY92exTTYn9QVq3v4BitpLDzb7a2y4F
	mbgMFfzxv61aade1rC73kOoM5FlbWz7VreNLO3OE7MATkOaM0o4xAXFiaK0kVm3jACP7cpYqY6X
	BdHCG8jg==
X-Gm-Gg: AZFdTZce+mTT4DEsNp8UhbI3aw/0OSyXg8fEjMl/T2Crw7RELS00ZLpjq6wHgLF6CRZ
	vsUFvP8DUqWwsx1THLrrL2UA/O5lB4kj4bWVjo4w02kBWLuPKzwi6RA9tCsnkwpakvUHbr0R9Kh
	jFgJcvicBOGgDeIxvAv07dT4zuzDRtDrcZeGJnT2IwKw06mDCTdvw4GFhI1sGIx7giNHuHceJPX
	6kbdgGWQhlXOrYfrSTSWr1fZQg0Z5+786FpfLVT4sE7JIym7hCv0WCiouP572NpMXIcMzOLbwJr
	y5odeAKvTsY2UlecJJB9ECcq3WHmsnVl2p38K/cfUM+wEcUV8/r7k6cCTP362HCtYaLlPmDuhb1
	OkRnd2kqFWblmVmZqzgE1BEDEAX6SBRQNasuvVWIemw4QTrBkJmLkb9vfRua598TEJ2x0Wan3Hb
	Ho7SsawO0UgPxnKFblzwIJrsDuPeB+3WFy/BlRezsyklwsdjjWk0gh/a3xFepHIQ==
X-Received: by 2002:a05:620a:199d:b0:93a:48a:167 with SMTP id af79cd13be357-949baa001d8mr4450391885a.39.1795808707579;
        Fri, 27 Nov 2026 11:45:07 -0800 (PST)
X-Received: by 2002:a05:620a:199d:b0:93a:48a:167 with SMTP id af79cd13be357-949baa001d8mr4450387885a.39.1795808707126;
        Fri, 27 Nov 2026 11:45:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:22 +0200
Subject: [PATCH v4 09/14] drm/msm/dpu: don't tear down a failed hw_init
 twice
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-9-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LTc7bKP698tnyAhsvxfmRQqNfbXKCPF/Q1izJgul78E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2l9ltT6q6ZqKJW3XFi1JTeKp9lixJYeOVra
 RvKNlJ7dGqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndpQAKCRCLPIo+Aiko
 1Y2BCACFC3sPZ/fKCXBlrIF8QGYsf5zaSriCsBRkiKvz/GnUkU8zVL/kvsN7Yiw8G1EtkUGwoCN
 2JZHSk4NnsI0kgGVZL84Z2Fxj/4riSSLPrq0s1cdZ8QdqfCghLJadCAR+KHhZLyAvOzlbf0LJK3
 tOK7tF/6rJDNGlg9rjiPr+XOCXZ0W2j/zZvjtWFnizm6nM+6rPVakjpcfn16mPpwChYfEKZ/6cn
 HU3xOZvKSeK68AbKTK0Op6t38D7B/Nj3mCTR/8AFr1HGPXjXBpwxgFjVLDDHXTklCBDa1qAzY4n
 5iazoRBccfQBDNAJvCDwBhoN3MFXyqQfMQm3oSrgYeX3qDib
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXxYr1w6ju4A0m
 Aw9TXxgO3VJwsCi4l6Ca1fHlQRcsD7F0ZIdONz9+8WxC8DWWcGmJhtjsq5UuQInA9q+EBrGaBm2
 WS52QE1QU9ZBd0OjRJetITxjjs1kRwaNkdcMmPVIe8qx1x1VDx1WMUGvT/A5E1DYTykAYHfs1dM
 LEOs0wyta1QJZvTsS5wLX4utnC16VBwfPuvCK8Ms4x9l9CXczsd61bhMi0RNfcqWvQUO4/RiT9G
 NPc8s3ezG0LmDCA9e8N5qE0ijiwqMY6W9T6gc7oawMProvBHemRzjAiD1u5+HS43KyJ048gm/rI
 v4i+QOYsRs2/7kMnG+ZIyrGKn6Vkbhlx3GhgNR3OgG+gIcLbxAP/VdzRpBhY75tVtwjrq1TeOi4
 BhmRHB1a4SH/V8pjwPsrLqydVf4XwKAcQBkp/S/OWHpiiaXqjU+o6KWtjsZ32EqcetVb2cNTXq8
 8HpZ4nm+5S+T7OVMQ9g==
X-Proofpoint-ORIG-GUID: xAApILTAkbouj8xgUe2CO7c0IHJXwlAA
X-Authority-Analysis: v=2.4 cv=QpzLTlyd c=1 sm=1 tr=0 ts=6b09ddc4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VuwbfrIzBJgoMi6EY_8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: xAApILTAkbouj8xgUe2CO7c0IHJXwlAA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXzIXrciep9PZX
 2j2gm9TZxd9lHzi9vh129wImT0Id8e2lTy7iM42VZAfAQYmG4qJdgvqbQlx6k0EIXLrYVFEAvQy
 5IsMjiOCCDjQwnyKEHRipDKM8QmLurY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy() itself, and
the caller then runs the ->destroy() callback, which calls
_dpu_kms_hw_destroy() a second time. Since the global state object is
finalised there, the second call deletes its list entry again and frees
its state twice.

Fold the hardware setup into dpu_kms_init(), undo the steps of
dpu_kms_init() when it fails, and tell the caller not to run ->destroy()
after a failed init.

Fixes: 49e27d3c9cd6 ("drm/msm/dpu: finalise global state object")
Assisted-by: LLM
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..255beb83fc94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -55,7 +55,6 @@
 bool dpu_use_virtual_planes = true;
 module_param(dpu_use_virtual_planes, bool, 0);
 
-static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
 #ifdef CONFIG_DEBUG_FS
@@ -1067,7 +1066,6 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 }
 
 static const struct msm_kms_funcs kms_funcs = {
-	.hw_init         = dpu_kms_hw_init,
 	.irq_preinstall  = dpu_core_irq_preinstall,
 	.irq_postinstall = dpu_irq_postinstall,
 	.irq_uninstall   = dpu_core_irq_uninstall,
@@ -1135,21 +1133,12 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 
 #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
 
-static int dpu_kms_hw_init(struct msm_kms *kms)
+static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 {
-	struct dpu_kms *dpu_kms;
-	struct drm_device *dev;
-	int rc = -EINVAL;
+	struct drm_device *dev = dpu_kms->dev;
 	unsigned long max_core_clk_rate;
 	u32 core_rev;
-
-	if (!kms) {
-		DPU_ERROR("invalid kms\n");
-		return rc;
-	}
-
-	dpu_kms = to_dpu_kms(kms);
-	dev = dpu_kms->dev;
+	int rc;
 
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
@@ -1301,6 +1290,8 @@ static int dpu_kms_init(struct drm_device *ddev)
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
+	dpu_kms->base.init_unwinds = true;
+
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
@@ -1317,7 +1308,17 @@ static int dpu_kms_init(struct drm_device *ddev)
 	pm_runtime_enable(&pdev->dev);
 	dpu_kms->rpm_enabled = true;
 
+	ret = dpu_kms_hw_init(dpu_kms);
+	if (ret)
+		goto err_disable_rpm;
+
 	return 0;
+
+err_disable_rpm:
+	pm_runtime_disable(&pdev->dev);
+	msm_kms_destroy(&dpu_kms->base);
+
+	return ret;
 }
 
 static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)

-- 
2.47.3

