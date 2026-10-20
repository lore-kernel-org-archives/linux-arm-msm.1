Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529307;
	b=VXG64TzBj8Y0JL/KGz+pArOahPp3GU3Mf4Vj2I5ecea4OKJKhJXorJTXEg5Ao4F1OFX4
	 7jRAtteZSb5FH3bbgYcvGlDVoKxTO28hPd7nFO8Nnc8nyNQDJu3oF0SgNnTAxe665oOH8
	 iXafESyeURcEuM5oTUKHEonUjmXZqojfag9v3LVIXQ8YkznzWNUymY1cfYXv+hfXEVoiQ
	 /g1Ahi0HXT8fupHGW+XjsX+D5hyDlZe3b/de+wBrtJjiJeyfXGEupVa5VlL8Wv1Ja5vNC
	 gbXgNqTYutspJKVzqCwTTsoc7eO2onuVWL+bmRlC2dFREinePcXH1s9mulYQ8iNYcrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
	b=bvGmJJZCoPaCkzI0yi9Kz5onGCkWtBIRikdu+hX5/HfizNbaknp0TsLdxY8Uq3bhLvxj
	 uONCEaZkm1VL+8jarmGWJPctqEcywNQo+9SSGn07WrhmBi0ElmBx7qT47HvPMest/UULS
	 qaxMSsdFZR1Q1hYB0n2J7UNXUlX7guOzQ7BthckRNxPWiogwrN0Jpi+XyASCBtLrm4dsp
	 mGzZPv1fREqdeBKLb3DntEMGbDVx+E7s2fC2yUD+JfUnpnaRLQsxj7ZDqHCHic7WVYg3b
	 2jY2pzENMhrLm1/JWYLvjt1R7p+8BpLyrlUr3I/Ri1M1LSEJsVn+lVOws4nifbghGeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnE+5kp2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyjdWglv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC0606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFC0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnE+5kp2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyjdWglv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGuCYV2279891
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QK2V0ULW7LP
	9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=; b=cnE+5kp2GlB9jWYZjlh4paoeraF
	j4etdh//n0v3cMi6jQx+qLrLTaERvglpUBh/mIkpKbcHPXtGSktQ+7kuZInamF0t
	lWBpA47PNfV3QuGrQBr6Cr/HADzXd+GcrCQlki54n9bEGjCz9wV3sLFGjbNJ10VI
	JLBbk5IpsFZw6k3trXQcAhrJUvJvMuQBwqYCWbBSVFUtnuBjitXmClDemyoVXpXz
	jB2sdjG5+vh0z47cDoqV0tq4+hd0kFTkmPn3lLWIdb1wygbOlBzpkpiFm8POxpbu
	ccLUpVe9UaBBRDOW5MHdGjCHxBv0bljs+Z7yt2YVsTCAeeac8GlYd2En0fw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2a3wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:48:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so159627a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529305; x=1793134105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=MyjdWglvpojNsu4aX4j+ZpLOGVG9luKMA7CkD5dOjWRxnwPK8uTVYgEL3UVYwr22Vs
         7pJak5N+YK1UMB4dpqvYejuSRQKEIv4fsvnUPMWFicyvGd6VhwZY/wQ73C/hHMDim9xV
         Gx00USf1oAAMTiY/LVppPjZaY9NQ6/9XS7yIOsuTlfOZ5J4b22AmJ74TY9y92L64ISnP
         X89aHlMFQR+ShQQOtAQY24rK4ooC+eFcTGv/ZLM0BND7hrwOLa/fMErgRshSYOketQgB
         K0WbbAhi9/FuMei3N1SAc/O+fN7ERoxFufl21sH4CxPHRXYCr0En1iYhbAOYU1JnDAJF
         D9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529305; x=1793134105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=Eby4pXzwgQm68cGhMqb5y8m8ukVVPKkJ7pNN6TpP6NF/hqiibYWb0WlYA0PhPDhlRw
         T5oVx0+s60eMHCU5ujQKFn9TDXswQQHNePWEjzdOr6EGIE43cM/nUXX6pchcNyilZM62
         z6c6Y6o4KZPh2qm3J9kcA3ntSHhjcyrHUJ5p1N3Jyfn8saCctL7PV56rxP4DMVEqeKzj
         0m56TgZicF2y/Iar4a8QARRYVEjNncOGBPCQ+LRGbDZeNA/Xus/T5yeysJyWP3fzP8vB
         9tQJYxLLvdi5tOaAlW3v7qouQlfLLzhKn7T1AetbSsM6M1+WOmaYgx6cpTKRYDw7ueMO
         tKgQ==
X-Gm-Message-State: AFq9FYIUstGz32O4ANe91EiY/OcKB5G0NBnsyMusw86bgpzxrHGWWmj5
	7OceEsg5YOpJ/LrZmqvxrZ15kC6jhgT4XAbkSVS8PIMVp1gEwOoYKtLQndBuIHUvkSVi1mxs+2p
	Hf/cK6aLxpXwRnOTT+cxQ3K8Xcl3h5bVl3ZzCvFEYvmXC0GrrM3Ec0u3nAMzrXyuLIfiG
X-Gm-Gg: AYBFou2ms1am1pR6Lyikw6vx1TNHlETYaC+VdiLifmKsB7UZiwIupvx/zqbxDVlNPeR
	uPgolOlRRkxXaVvAUbehGOQmH3ZoQJoD13l8+DwpDWb+cOn00lF8jqPDTI9X4RC2s6u1tm6ebbr
	aMFM/uy1xIBxOJRY4bKuWrc/zjdZi/tBEcqVCiGFoz0vbTkuZDj+zu9KD8AeDvRrR0K+TAEvXoZ
	O+iM6IHrzbUt8VHTZyHhWtST3BAhYZKw/gAZ751VLaTNIGJLkMIjOdKlNurxpU1bg0xLuuZKYIJ
	vBg718CQOfrHhD9NzzXiVxOwcWoZXd+xm8I/VpPFV7VQWp40fR0n/lGQIyMbPXPgALS3aba4qor
	1DQUQcBwlSqK3pq9FYiAiLssehtpo6Hsk/26U7zZV8ZWbQib+
X-Received: by 2002:a17:90b:17c5:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3ad86f44ed6mr69622a91.21.1792529305143;
        Tue, 20 Oct 2026 13:48:25 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3ad86f44ed6mr69611a91.21.1792529304739;
        Tue, 20 Oct 2026 13:48:24 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80303302sm1045860a91.11.2026.10.20.13.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:48:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 12/12] drm/msm/adreno: Remove temporary __maybe_unused
Date: Tue, 20 Oct 2026 13:46:26 -0700
Message-ID: <20261020204728.28844-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: Dxq0xhNrpmGg6AIWbpdS2WFPjXsNaZtV
X-Proofpoint-ORIG-GUID: Dxq0xhNrpmGg6AIWbpdS2WFPjXsNaZtV
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7d399 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX6J88vvHBzdrZ
 tMPdBVWa8eQzsfBF8yQX+uVkWaKNFhrIyu8h1wcGuCSnCRXKYKeu/pYDEq81lwJnoBLd5fCopDI
 kqYR33pOdYO9p52iRnzC5MWpqFcado4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXxSg1qOxlmMiF
 ElTXX26HL35JPPfZV5pgk/9a67eUakvWoJ/15SgYO/64Z3SgndXx2/q7eKa42f3Sv1WukgRMTB0
 w0Kalq5Hjv15DjkIYgUBOT9MvPFROA1pAPG/eJizxkUSHx9Gs3+TCWdXjkrm8evDV+jEVtVzO3a
 nLTlz4T/lrodSt9CE319SgPaN2y7u0Z53fmJc73r6n53zHeC0SXUHPTK5wa9kldrI3gQuXp1RZQ
 o3wXdkM2F3ICe4ZmEG00Z/QgO9XwPqOIj/M4JENi2GWlnF8w7kmHWziY8fSbig7eHWjCzBPckC9
 P/+9vHB29d+XalwcPH+tEB2lAzWMLW2zsMfaQjP3uEa8Qv03uw4suRyljy0Yj0iTMc2SszHTjXv
 wKReNbpd2AX3g4m9vucokAHNjInwbUAYJeT3bGDGcWr8T0gCmMgfWlLlCgV4xDj8LRowyqOHrvY
 4ASFruw1r0emoC/3drg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200082

Now that is unneeded.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ed83dd927b54..3ef3ac2d86f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

