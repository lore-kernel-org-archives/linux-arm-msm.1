Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640012;
	b=feMsiM1ZnkbeVNUi/a+U2DuaSz+f5Hhlgf6Nnf1m6n4XWDRnr89HV2XU3xM3bPoSooK5
	 pI8kBTQkrsjx+qu2QXr/rlskh2P5WrwAn8W8GiTCqO35G8qkOB6EmenaBFi+F1pYSrC2K
	 icfF1QPsf+NzUgmDYwShzSbRm9+B630sBO3rov/Pzfx6geeTqIO/NPHgJMi1Qb39iunfW
	 rLGMWkKGeWZPrlETgqhZzGGHk5f6Q7/AdIZZOnJcvrmLTF4kmCC5jwiOntXHgAXAuuVYM
	 G+RDVDbACZlcHxdNVyrmyDRIXGpHh2tSJ3Eo60a+aEIc+7tOnVtU+9CmldypWscKqBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r/WboLhhvDmVhQJbnTSwViwOgEjv6oVEPILntAbBAew=;
	b=KuGN+K5D01bGRCgOqSVxeswjZVr7Ouq3/ZlBKW+rzUe+BzOj+vMETq6CtrFTFYEYtxxN
	 v3ChPPk4Y4vEl0QbNjM5FQQ2f/NI1lQev/emi3bzg/yzYpGO/0/WfRN+bjgb7OIlDrgEp
	 fMJTxow/PbuxPPdRHNdjqhZlLhbSOsbWNcXem/jj8+Nx/JmWM3IzmFiD/Tawl1GMQtPKH
	 JhfdKSmJbMzlml5Ay6WqdDwSaA5BUoiV5KZAeH1cqlT2Ijn9bOuM3t0NvFUszNDJGdPDF
	 HeIqq2ExLUfIkZBSKXkFXqTyJZDoBO7kc6OIJwtbcYTyf95JmSlJy8ouy8Dys8ht2bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5Gx3lGv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ma4t1eJT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F9F60A0FCB
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 17:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F9F60A0FCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5Gx3lGv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ma4t1eJT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZ4311270868
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 17:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r/WboLhhvDm
	VhQJbnTSwViwOgEjv6oVEPILntAbBAew=; b=U5Gx3lGvUzHDBeDBNSBPpwKzlva
	esSfDhf9M/mt8sqjqFFipFzhuRP2KnQFsyxX5iDD1fKYOS4vwxgpCuHxNThajY+9
	ZxhYv9LB0FHJHmLaWiKr9AWrjBBbVw+ZIlifI3i1XeblJkOqbs1u7EB5YOoYqe4a
	h6BUmdXy693kW9FhcjnC+q7KMkRA4edC47IyTdOhqkBrvOfSvAhldiyMSRyVt1u6
	QzstlZ7Wx5Poq6cJKrIjwmCi5JWUkeUa82sNYcfjXblqzjVq0u9/VKWqTQEB2GNS
	29uwCKMXKg2GSIo/MEIexuQqSdKiSptfjRGuP/o26PA0tsUR40/a9ExdiBg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvt1yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 17:20:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05b68f851so3881614b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793640011; x=1794244811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/WboLhhvDmVhQJbnTSwViwOgEjv6oVEPILntAbBAew=;
        b=Ma4t1eJTn1dlUGiT699rwYYkQqlWaxm9VNV/k8ICzCMCZVyLIa5L08zXC2yg+64li1
         yDDdmoXNSdmJh94X1/NdXc0zObTTDNjN40XEaOUgmHHapp5BpHw9azJ7Xs4tUJ7Zqko+
         /CJSCBVkGEqOm8TJ2mZ+0AhJtCASWVsky2XbjOcLqz95b+9RyixK9BxMl5VE0WuqLlDW
         7OLSVVBISCzqqqg2nxX+Vi630WCyuuIuAH2ZHCvzl8GyEeR51PxL4rzFYhyVND757AGm
         CY41yplyByerdE02+6gOBMVn4PfXo8H2okKWqhYPRhyN5S0L5nLrcxb1TNv9iZAo96MR
         rwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640011; x=1794244811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/WboLhhvDmVhQJbnTSwViwOgEjv6oVEPILntAbBAew=;
        b=Ps0qmmhHjzxxQLojQIYhfiIEOx2W97Yb5WfQ9ljDAXtxCrc1pPL4S8F1KW8NxVv8Y6
         5RnRlgXgkiOomiBnviBQpG+6lJBbHfKN/ePB5sZ36fTWZDLztRIAKLVQ+SQpWro4/D3A
         wN9mGuLP/W5SJUCs9K1S69Dc3OKyhOBwhyPy5/xphS6YLUnrAwLMOaAtFM6EKbonlV50
         nglZfpDBu9tW9XmUAIzNlDPshHIx7Vy5NfF9aCdxLbLWlBKk6mKPxFXo+zXqsMfDqhKr
         6EU0glZ+MLIMmGtwA9tTzDP/BNV9c7w5L02Eo0aOOVsVwnTm0hPsYntSnvFw+m5jS8Hv
         9aBw==
X-Gm-Message-State: AFq9FYJAwQpENcdIP+gQ6CD7NPNA+wWdDLafpwzIsO+fgeGbO5Sm8B+a
	joA1K6r6+m/6AyNLkBQ/8YmckuKeBe2wrGYVBA3KE6FIEvyLSZUTB7ojxzP5kAii5dW1M2Elskv
	aLK2lqCSUcI78OhUomT+8rIZcJs83nRa8nabox+Ab+GRgoz3xdV+7TIqosN6mCVs9kJQZ
X-Gm-Gg: AYBFou2sKT/7Rlf8WXu1GnR1mdJLmmbvcXivYqpQHcf1oWz9sPnxPAZswcemZXPj70C
	zBhy7XSKO0Lo6XIs4VY6x6qR2w6XCAUxMnMoYLeJ0SosMY5xbCHi6/bHAbon+uYGZxySRHNaWxN
	zkFvPnHMPdK/+XlkSccheEG/u9f6o/aiQWe36jyi2JZzq2zqEPWzmPGGiCT01O/nGc++3oALmB1
	f/DZiJ8uCGsdhyal3GVd2t9bANrgXnZn4svmnbM4z6J4P7Ne3GmKTqqJ4mQLXMiWEWWBwP4K1vt
	ZStVipyFCGYahQ5vU5/QmBMd9nAk1K/HkuPNZNHaucfFdNyNGYsOYfGDA9xxZYqcYMKHdFKz+48
	eXYp1Zt1JkX5KpafYnr09YHt6cSMGhzPTmJ87XTCQIfZOwNjVLYYg11vgdCPQARC0INJkQOFBxt
	8RQOGkwBj8OkeL6D48SwR4dg==
X-Received: by 2002:a05:6a20:ef1b:b0:3e1:fcc6:2f12 with SMTP id adf61e73a8af0-3e928632c18mr5575759637.4.1793640010516;
        Mon, 02 Nov 2026 09:20:10 -0800 (PST)
X-Received: by 2002:a05:6a20:ef1b:b0:3e1:fcc6:2f12 with SMTP id adf61e73a8af0-3e928632c18mr5575738637.4.1793640009907;
        Mon, 02 Nov 2026 09:20:09 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9637134sm2275551b3a.11.2026.11.02.09.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:20:09 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/4] drm/msm/gem: Decrement loop idx if handle lookup fails
Date: Mon,  2 Nov 2026 09:19:59 -0800
Message-ID: <20261102172001.508440-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8c64b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=eWlSUfSnBrBg5eVjM6UA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: WEnTzsgP6YX2-eNx1sG3WL73HNlCC1bu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfXznTkp5cq6l4k
 6CQ/2PKXvkrVe1dVvMIpz3449vokLZDENMmvUX4xCMPXvuaEPQ3iuWD9v+6wM9j9SZA33gGXcoF
 pUGoSQU07bjcgVPW+GDXOzTTHB8EK/E=
X-Proofpoint-ORIG-GUID: WEnTzsgP6YX2-eNx1sG3WL73HNlCC1bu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX0aaBl9TBtwgC
 aBv+iu6FsKQNOnUVc1973avyKhCy597oPTAZDfbpdvOHh1SbElFycVGEhrobyPsrNX7Dg/POESR
 Hr9HgeidoUn0dlFoRoLg0D2bTqPIL9KMgb1VMi134OC8FEaCuYuNYFyoQ8UR3N4T/Ej3vlxLPrF
 nOrX+LMje803ZNvgbmT7+Xn4sZqiaD2Aihm8VhtlhYG1RzxhaQ3VhiWeeIVhVzFgcITV9sgPECp
 Hvwvf8/UMOtWLlb+36GfJNsnMVlbk5di6ZXDahst1tIHCUs/VjhcRtdbFKhPkokWJa6cYUvZYFt
 TjIdv49jO+l0FVZdp/Dm9HcmVl9XXIb4EvTrLM4129gHTZv9VSL5VoTWzdzA4XrlFcoouZZQD4y
 m77xtx76ChJUMYbVBBo83/Zh7Y+VsMJTfMlYRCuERV9aYCsbYvpnE4QSnNAr54agkx32/OH9uTs
 t+qlhiRl1QDvb/73d5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020069

In the out_unlock unlock loop, we should skip the op which still has the
gem handle instead of gem obj ptr.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index bd1c3ceeea51..3177461d7ad0 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1110,6 +1110,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		obj = idr_find(&file->object_idr, op->handle);
 		if (!obj) {
 			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", op->handle, i);
+			i--;
 			goto out_unlock;
 		}
 
-- 
2.56.0

