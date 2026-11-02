Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635810;
	b=1ncB9v0yDApMA/+ixQI070ofawdN2vOsa1NVTi8PdKZL27wD28Uekfvty+UHg8sJVG5Z
	 hPT9ZaLlJpUPk1YI7BZXVF5uWQCwbLgxscow4IPG+L5Ugzm93llcUtGUe7W1tn9dlem5X
	 sBKPxlEcC5nXGpW8XEPbjYbGl97mBneDKeI5Z5pSjGuR3jBMyZGzT89aLfe9dmLVSkQiY
	 qNCqJ+rkcdfl+E8ybSgVol32kqgtHa09drDS4aJ1xApVRNjK//7r98bDqn5Y1X+tDzIb7
	 IXiOUBbqnr8U9O9TcTQJHnd4qNXCR6Zae9lMAfR1Hi/03X4zl9vJ65DlT6IR8kGlu3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sAmuNonNdGJ9VJvNEnnfZOa2K2a3VEiqk//+WGZEfFM=;
	b=vmdKtSmRWfjaq+oMxXHop6Z87NTzqe1r0dV4ssdiHA2t04Ot2FSk04o3RcWgPanvLUej
	 ll+UdwZ3vuuohYPo4+i+JNMko3DTX2AyK8u13tuOZRHcAvBdfvYBtLFRrtvs1AxDa3u7s
	 BSSlK8hjzQlVM2QyWbb2k4qMPs+E1KWa9Ed4pheKO3UYHmFS4y77dpqkk/cM0Orz/EtSd
	 0pe4xG7UJpuaU/nSONtjZRAD2sCoIG1saVlH+ujJOgGWB4sN4LsyCpv6uZiMw/6+fm/JP
	 Ks15bskP6Zie1ej8B+nuSGfPbI66n5wsiYcWte0GdDCt7FB5assx205gCVr5HxLNPiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI5uQ4ai;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NWholbAr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9A6607E0F5
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 16:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA9A6607E0F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI5uQ4ai;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NWholbAr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dpckb2449229
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 16:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sAmuNonNdGJ
	9VJvNEnnfZOa2K2a3VEiqk//+WGZEfFM=; b=pI5uQ4aidauBV1Z5mj4D6J0tDJe
	ECsUWDqSY7Wgr4bvScLMnib4icwyWQfQXnpfpF5KaJoU9tIYP0OfUeKGuaztqCXE
	4/85Kl6vxCXhQGaTJku8DIwCKLOLiIsLK3bFfpQHSTfeHd3NqRfzuwme9GjUHJ6b
	+SxB+l0US6tdi6jGSgu6zwevolxiJcPqkeEgLUtCjWYL+qtsiVgG1ootUFkBjNGE
	GOwbTkQojoj3BxTXOLMiZgem32gn7QcMsTiB/jlDizjZ0g9fyzuZJ23QPq5s5Dy2
	xDZsR80TaSOCx5hh+aXH8u2404KQi4w/XkwyISdLRuEzd7jNktNXuRfWuVQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4jn3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 16:10:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea63087d79so30010755ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793635808; x=1794240608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAmuNonNdGJ9VJvNEnnfZOa2K2a3VEiqk//+WGZEfFM=;
        b=NWholbAr/we4My/D1fCGMrI4HlWg6Vfoff/+OWStrgOn7/9/0BQGoq7dJTnjocjRhv
         X3tP712I6MU7ArekPg/AwMWZCEINHDeTB1DGfEMLda0fPacdkPfm/NM6w0uxDo2B0N7/
         MRw7hzLLonz4jrZTazPkx8alIFtsGAPh33eJ4EZ2P2nufWO/EHHfaAzzBcVE4tWjYOmJ
         VVApYWL0iAZavD19AcDyeEv6RbixMD83sdgpWjLOZQy8i9Qwd05y+BneaPqbqjvoTsro
         mAWwJd53xgy2CTlk5lD8dSJKyeIGc2JlWDPTB2j+NKuuWey+U6ezZHvu0T6kPOx15/Cy
         SWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635808; x=1794240608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAmuNonNdGJ9VJvNEnnfZOa2K2a3VEiqk//+WGZEfFM=;
        b=NGGPMNoCtA1YwRexi/m0laVSC9YqY7n5SH1UMVh1ePAHlqk7l0/8dAH1eIgcJBwJ5C
         kMDJ8vKjRm+8RFueBN7UcvolVCIPbcbJEHhP6tJ44WOxqT4olIxV5geBjXpbaksTaoaU
         UhGX269nbjHgBVNFYeFjLZEIPFixfjXwSmFcL3XHpySSlvIpjpHm4Vb7Lb5g9SB0xH/K
         EXL73DElEGUfqXfkJKk57h0c4pQar37/tYhkn0qzeHZ2BGNcXKVzqTnx3+Fc9uxTIqZC
         VKaX6Wbb6uTaaCUUQgeddS8VTH/22rVCrOLDCsFCLg4f0lWZewtcb4GMk++Y2rfE4ioX
         xhrw==
X-Gm-Message-State: AFq9FYKn0iMX5C82Uudp3EhnnQe33Yn0SGIpekI0DRNFIGNbJPKdaTUJ
	oaY26eRkoGbrIX1ZZbrIBQ3ol/pJ0eykQ4UVBd0jkSY3C1OgY62fjUzfbIbJGVkr48j/SQ8J4F2
	WLFKR2zYwMKRiBNn9q66HBDrC3dMjmzQuGOs0bBQcF6Eh+QtvQQIw1lOjTrtzTev4rSap
X-Gm-Gg: AYBFou0v/sewdzfOkLJ8SzE8ND9dnekR5/Wlk0agCcNjI9zpOCPsoAkrihqYo7WB9II
	Ovqm8vH0YJU7Lgj9DLLvQHZVpztdwkJsAkLjxWhGwWvnMNUHSlmfXAYJurt10uX8iXcHJmFwTpC
	5bshXKoOBe+d3TkzTX2rl77tnXg9L3jahFZnsXlwgEeyQ5LRKI1GRf+jKlCrN1B+J4F6Fh1XrwW
	udQl7USkv6B2gyb4NHnFKWgaUq9/fBR+Trwgq5ceh0VyhG/nYjIHKfo8Q4fx41SSuuM5EWLkz0u
	ck33GEH3+DV8Khs8Q6pXdckvGKGMMP8F5jtl2p4J1cYZ300gYQ+siUKCCwbDlV6IUKkiRXF56uA
	MPSHP8EfdDYia5QfGvSbqfcMhR4D4uR+niCDltkj0XXPEWDayVajRb8oEf2dyDgIYEs7FCOLFXU
	MGRC0Eq9K9ro1CaD8Dv8D81Iw=
X-Received: by 2002:a05:6a21:3b46:b0:3e0:d5c0:74b3 with SMTP id adf61e73a8af0-3e928e3722fmr7511701637.65.1793635807976;
        Mon, 02 Nov 2026 08:10:07 -0800 (PST)
X-Received: by 2002:a05:6a21:3b46:b0:3e0:d5c0:74b3 with SMTP id adf61e73a8af0-3e928e3722fmr7511686637.65.1793635807545;
        Mon, 02 Nov 2026 08:10:07 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9aa605sm2219688b3a.47.2026.11.02.08.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:10:07 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm/gem: Fix VM_BIND range check
Date: Mon,  2 Nov 2026 08:09:59 -0800
Message-ID: <20261102161002.497152-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
References: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: JdF5krLDAuAk9dM6SavO0hR869jJwUsQ
X-Proofpoint-GUID: JdF5krLDAuAk9dM6SavO0hR869jJwUsQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfXyw2m70F2bpCS
 thfK46NAufQCighFNphV2kJ1izn79wV2jhPFl5R2PdwQUKJRCoBt2iWLufqyuXvQbybOTC3tBSI
 YVc38Zmeitpk/VW4paNLR7JhJlw8dBQ=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8b5e0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BFYDg4fWK-pXFiMG0zkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX6tOqawvAGUcW
 2089R7houIfQvBXgs6irIeyAAJ8RdA9TMgBNSlxv62NST6wmDY86VqzDcLKCgXFnfgTo4Dbhvsv
 yi4TeZH8grio2maCccyMtKcu1VJlOcYSFnsZI4otLFOmqFPO8FYcmQDcZ6Q0sbCqkWEhd4Tmy26
 MeXlrKbRpFNvFM5CANULPgH8Bswhli5pb3HCpRWKGFzLxSG87ekVuSOl18m2OqdS86a0RkvFOmM
 u3BvLIAMsIkPyxbcJulnsNzHaiwLzq3dBX426teAnE6fWU0+VVmBNnzEyUns+Bq6ZJiJQUBieDM
 8dMNodiYxlfHMX4qZ0Igm5A44NhcxWAYrUvUublF2dbciIhic8NJoiuS4pMg76nguW/DIOtr9uX
 1zX4DDVeq2XS2LswA5tNhxtPI3F2zWrWreO6u/9f/2CO+US2WPV/jZ/aCt5Kpk3b3hewrtvXHEi
 akzZ3GI1KhzhsKpCOPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020064

Use size_add() to guard against overflow.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index f687a629629d..922285537dee 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1012,10 +1012,10 @@ lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 	if (invalid_alignment(op->iova))
 		ret = UERR(EINVAL, dev, "invalid address: %016llx\n", op->iova);
 
-	if (invalid_alignment(op->obj_offset))
+	if (invalid_alignment(op->obj_offset) || (op->obj_offset > SIZE_MAX))
 		ret = UERR(EINVAL, dev, "invalid bo_offset: %016llx\n", op->obj_offset);
 
-	if (invalid_alignment(op->range))
+	if (invalid_alignment(op->range) || (op->range > SIZE_MAX))
 		ret = UERR(EINVAL, dev, "invalid range: %016llx\n", op->range);
 
 	if (!drm_gpuvm_range_valid(job->vm, op->iova, op->range))
@@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		op->obj = obj;
 		cnt++;
 
-		if ((op->range + op->obj_offset) > obj->size) {
+		if (size_add(op->range, op->obj_offset) > obj->size) {
 			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
 				   op->range, op->obj_offset, obj->size);
 			goto out_unlock;
-- 
2.56.0

