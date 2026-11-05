Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911244;
	b=4BDv1xEt3/PppdKUSeES6JKKco0y5vkv/lj+NxE872UstHXtFBkF67ybBJqvgarYSG8D
	 Cp/gk44bfis+ZmA5jc6mwgiepWsAhfFNCK0Pka1tlytqga0SFprTBLVg1kxjudwjQBd0h
	 4Igf/VYlAZGip6Q044fY+X4z4k8xhtoE96gKaT9LTYhs+XtGTSn3lngKt/fFaAoCr9S5J
	 LBgMpc/ZSJmaGVykjpOaRgTvNrKBm7nfyUxLw3RKPbp+FG84CtkBSWkISD0JcP75GQ+GM
	 t+Qxp/V07OrrKOmHyjMrGz+6ek38vgS4B8XX0H6drmM8LhR36ktsuLUG0Y9+/N2JDzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
	b=cGbGSfNoW32Fr9pScuw0wSvYv8mkTlsR2PqmnVsAMfTyyXsy/a4Ssf2FY+mTMDgwYorR
	 pNZ0PIzXR+o8cV0Q61vecPeKnQwhPMLSCOyjcBCr2sdLvFCAS8K06yLMqKIss178u+ReR
	 0/f1fEWzGCaAqPDdE6keX0L3RvB7DVZMHym18wWswgrb+h8EH6HpOvl2Zi+SJYX3M04bU
	 0npEGUcpx7UvYAlevRYPYpz20Ysan6dwoRYGZBOWG0KUXAqCzj1aQgKgCjbY20iyScKaY
	 CIToZi4qFuAdK3XrkX7IQtHxbMKWYufu3Qr3jPSVs+tCrrWHA4HNJwHEMuSJ82WQK0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwSmFY0v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFf50S+X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD87A6082BFC
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD87A6082BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwSmFY0v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFf50S+X
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeCQA1474551
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfoXwA9UTdo
	ZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=; b=NwSmFY0vH5c62ZXXuZTBhl+slPE
	XtIPJzzOLQqhsI6gZRN3kQCw22GTkzntcn5OgO4YW8IVSHtcxTgKIPiNM/76Mhn9
	0sHiDLupizm2OB5zoHICJuDt5A8O8341w+1q/RpOGCQZHK6FI1DkRYv0xVUwbjKA
	F+wtv41nO7wjMJ10g6QAStqgoNMGSrdjLr/d0/ppT4z8j9Sxihp86VcVmEBnO+MC
	A8Jot3JaP7cf1HidKtiZUlgaDSQb6RS43GfvO2f84xNZOMJPS0qZVat07to4duuu
	C+qLwCXb5b1j5nl/f7Zd8nHvjPRRDBX8lqB7wx51L/pyE2fM9JPXMz7L59Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdbq65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:40:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so2137991a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911242; x=1794516042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=hFf50S+XsZYkjJIlSBC23Sc0/hPCWCCG9Gwji4FzuHf23EU12xBG3LaYouulc2nolp
         W0jhW98sEWbbCtr98FdmVgKqsdtpBYcBj4XBkuBTcsvJaPtU8tVpuvRyYmLtZQ2Su54e
         weBBGAavsj6H9BGipUniMudFHLGlw8D/ccpeYSRcpG8qYiZTiYJDEzap+l2E8fSkV7Eg
         NYNF8NMRlBrRcOLTCQLf+AnmftXkpsm+B9dHCzBzjac6HYWWIWBo2ws9dJlgOWa0a0+x
         66rUzSx4Sg4fI1DJS3ThMmMTwX+qTa1H7UVQQ6bdeBltfFxijMo9rKMG7ziFlX6Pw7RB
         xASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911242; x=1794516042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=jOvBuksoCSMOPJV6XreL+1iuyvTbVLMKSC8UdfBBg1yrKLz89/Rxj28SnVoSgiIrzv
         0VZJNJ1NAGdtRmyXWWNkksTW/hWTcie6BRBpBJcHZKiSfMc7fRbeGas3IWWqzQbLeoqM
         1LLoRoPnAGj0oThoRWO+YgvwnkVTACDKzAqSO1UEdE4ozUEtZxfmwSbknteGoqte868B
         cA/DKQqdlI7pdZQxUzppsHVBO5qyYaLTbsr6QfGdg6IKvQ3k5iQ/JWvDRG+GzbnydHYd
         xjWc7/AuWSG6nZiExSqQfyN+yggZc5Ixsss516oq8KCZUuY70AYnvbI0aY8kWgLcvO5O
         qYBw==
X-Gm-Message-State: APuU4Z9uLB664piD7Grjv2oTTGqdeMqe/a85R4TTgsurjtCJVFHce6xy
	PPENfPU5750r/NDHE9/bCOAhv0cMsmBMhfLI6oIc6lNmXrkbhOqQLJNT0uqUI+w8dPdVW5+1jK3
	HC/2lRYXxjfQqJ9evuIAH3pCzWsrG+l+6yXLTNfQdfPyNRusIFpiwWTk3eszKBAhPRh6/RHdHhv
	4Y
X-Gm-Gg: AYBFou0aOQqMFJKgYvEytzvJdVcDwo/BGgKeqEL8xj9plxd6Ss4EuBX7MGzz2lGop1U
	tWh6pRCQ2yXSZvb9XhjvqBpEAGs9yBI6jfwkApV0hSq+76IHwisl9Gfkhir1t1jngdGyeeceoZr
	kAE19LMcrkIK/yqmYl/fhjvTaxfx3olpsmJinzBQ6EIYO6RSqZL7/vqkqE2uGJwbApLuXH5mImP
	TI/SxsBaHLBWueif/B4TOg0ms6SJ+328Mjp0B9D6Jd4Bw2/4KlJYLSf6M2O7btgGhLmuHcFi2zc
	MiBcJuO6CCFJsG0rfwLGPTsQE4RSaTru5loU4cUVUfebaVkej1A4tZr76yAUMIfHK53VxmbRCvu
	nQ03F0YsH+5iBxwhDdV0dEXJCRq+YDZBWJQ7A4UsAIaMAv+/BSfI/6LkMNuk6iYKhkGmvTTT8FS
	g1PerfX74Df7rCjpmCeMvP3b9e3KvLGaoSgZmOvzXV1PcuvQRGZNcAkDd6imex
X-Received: by 2002:a17:90b:1643:b0:3b0:8947:fad2 with SMTP id 98e67ed59e1d1-3b0db70e040mr203466a91.53.1793911241729;
        Thu, 05 Nov 2026 12:40:41 -0800 (PST)
X-Received: by 2002:a17:90b:1643:b0:3b0:8947:fad2 with SMTP id 98e67ed59e1d1-3b0db70e040mr203434a91.53.1793911241219;
        Thu, 05 Nov 2026 12:40:41 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42932sm616255a91.6.2026.11.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:39 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 09/15] drm/msm/adreno: add temporary __maybe_unused
Date: Thu,  5 Nov 2026 12:29:35 -0800
Message-ID: <20261105203057.66520-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aece9ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5VHPQfPT90DSkkNPp7MA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 6kA_gTfbu9ksFr-8YhfnuqRbDPYfoew7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX4Q948ufEdalA
 8Rzp3JMMbQ8ikvTsdZEIsa6A7JHUWL3zgKb6eULoJMvR1t/YxTVY4xDx+gLQ721xQDLcO4+otG1
 5QZhIMg4qxdvD195M39/6ypEB6vQzzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX2PiQb70/sGMk
 mRaJ6ew/qSSkD7+PuO6H0B0Z8cZ912S8FyMGup0fXCzmUj6hNKNl0hicvaDeN5Z8bMb+WIIaVmO
 cJ1wrTeNRqwMv41+6jJ03ghprDQnDdqaiw66+D7TJLZufIuoVv+qPSFBjk3hxqTbgc7z2lKgTN+
 k5AfLtjqORUfnE6XhZRd6wiM2MU1LGpfM28bKqobf6WltAX7RPHAeef58kSlDjSwidV6sg2uv8Y
 +jlZmbbSmTMiDUtIPI2jMOx4xGakkFqoacNDiMf6SQXfPDfgXH32pWVcvVhnJdilKlzXnKHMgTq
 tb2SiXcZWltQD1VtBFMqU8nujpMenB1hfjB5RFUWM5Koch+vzD/kMxQA7+V1d6dJkRXuuv4gk/l
 87uIRe7QQd4fbptFWqwRztlkT9mEK0T3uAMqH9S1XZC+gVE3CdrIsi77eCgd3S4VhFgCcj9tAbP
 383l47qzPgygiU8gM0g==
X-Proofpoint-ORIG-GUID: 6kA_gTfbu9ksFr-8YhfnuqRbDPYfoew7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9e0d37ec9c15..2408adfeeb23 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

