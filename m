Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529278;
	b=d7LrWA1rR3A5MFtoHLx3E5DjGf8fHz9CSc+bz4dVQBkWxyhsXAw4YwCmk8wnq7JQlDbI
	 mH/MwBCOCUf6VYm266Hvt5eYuV3zhkMGcZsBrPQXwh6VgHQOihvixrRi0MHaPPGOgfzm+
	 JF2Oawvg3xOC3nXgCpqgiq2B1Nrc3PyGknAfGYqhUFlqrxBQ96ojcQc6JDoW8UzlDqPQa
	 ZlhWkkCh78Jr0mv+zmBpLT/jaUJ7p3a5QVgEWrX91MmO8yLUkc7MtbwwHCidURvWH0zxZ
	 /nBy7BZm5Wrg7zlU/h5/VBVGsghce30Hve5cGaOyOd9UDzHC+P4MVYivhEENEJBYmTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2h2stUViSINxP5B7dXQjREMT+lAKurPPQoFmUpl9jSw=;
	b=KHqYASpWO6cKl3K7L2bLwGNM/7yZFCjFaLEi1VuVRsNTEI47v+EBnN6t9kJkRX3Y+tQf
	 80DIct64QIcgJLK97MKUnxA8IVVKNhCo+P+yRcOME3kmcHNiw1NoiPxY+K07aEWS3FG4U
	 ECuL0RyMHic8LFYE/EaUsv6kJ/RQ5OPjBgOEx1gkxiIJ6vcnsdbLuesdffo58YVHdEMZ1
	 vw6PXcnWvunOFAfVkTkeY1cKDNrKpHdE7lQ/lK8sUkqQWKGUGODHAZ2Uf+N28YZ0on3ss
	 K5uHTdYJpuo3rCl3Gxi5F0hnPYBof7bi8jt3ohgnTWEBgkLm5IBovndMpY05s59uObw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WwUKLnKN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIh841XO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3140960A2625
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3140960A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WwUKLnKN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIh841XO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI70EI1862513
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2h2stUViSIN
	xP5B7dXQjREMT+lAKurPPQoFmUpl9jSw=; b=WwUKLnKNOn8wKVLRNQZsNCxIPpA
	a9W0Ab0JzUbeaylgYMX9g1dhnGA53wG10T+OmyeeMsJrVEjn+ylwD2xKFaPzuFx4
	9+TCzmZPzvYfoPCSOavfLNBYRTfzT33O4B676xiXXXvkxbXS+jKJC4ko+wNaktqO
	RvyXpwnw+0A9keCVH+LUIXKZH3AXOQoJBjPfOhZ3ce1xwUT36mjTonNXpPkdzETh
	G0G1N2T9wOpXc5lRp7QdBpq036kWmG1EQicGyVqpbpDQ4ILAJ0m8WnDCpO+C6tHw
	KvRl9dSc8CjYU6VMoIXN1aGe/blQ80x7eWa5GPnm5gdER/0Os8MC4DcjyJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0ghhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so93469a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529275; x=1793134075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2h2stUViSINxP5B7dXQjREMT+lAKurPPQoFmUpl9jSw=;
        b=kIh841XOH3CsMS1gbuZXACfatyx61h+N/vNH7LllRl/3yiDicm8VLxJN7YrIygSo7K
         JF4mDLJO0TLaLdTUmDcltQvBTYgJaxQRNF8L/B+W5kYDKpWxQ6f4GxzTRQM8V8FbLoTE
         kljA4izEFEo1BX7HyEYY9lqU6CutKGIQDLLhilF/TxHVWMUlUAWhmUxYd3j8y2a3qOQH
         gI0cj9iLfPWLKjHmpDlY37QSj48Jm1SA3MXeg5peSJ3PCs4DJGwqP+8rM2P1LGChagi3
         +M4HrCio5qaqTuCOrwklTr/PRsJ9dxBETlDiIGS+pK3sqKVgsDbIEGNgm8PRDu9gUEFb
         n5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529275; x=1793134075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2h2stUViSINxP5B7dXQjREMT+lAKurPPQoFmUpl9jSw=;
        b=AjE0wfyMAR3BBpsVlFz75aVLiPL0/7tLMKQW+A4GXl6iiAPuUaJo9hUEt7qKfsq2+V
         h3wqrA54mR/PhVAESqKc+tgQA5UgzV8/4YNaJb+bByDswJZOb92qQeShiGYiPPO7Mm2K
         fmCoWFXw7c2kO1SqwoL6tsDFFUBkd8wDDNDcNo7uiovPwYInOj0CdFoXwMGdyVtvpD7y
         0Vqszy+HQFrru8bM/PJZxpUqXHfyUWuy3yGMfnwyAEM0f5Q0Yq4gCumDJ3LfdJqeg2JG
         J82IZWzNCdTEdjpI927qdgMzNZOxT8lQkd1P2QKEkm4LUbHIa3LFCHVnPEOHemEGhJBc
         ZBJg==
X-Gm-Message-State: AFq9FYJHF20/1kJKaYoljdcbldMEOaEPvD6Yh0g6g6iEqfEA8QTYv0ZJ
	iDoXJFXl8yfHc9A78/PPlzMpqJwfuyjcpfPV3kEsOrE3Z06l2vUd8xh5WiiGg0hHnhq/7kLXHpm
	oQYKsDXU8j5kVtE46ywKZdub9EjacrhiC0m1yYdSXpThvBSx3xi7AdMDkXgThIg/Hcdh7
X-Gm-Gg: AYBFou3paMHTzgYN2mLxxIuS4XTfcao0sVMSZxcnBPPm34GAgIY0efp3smO0srVInfv
	1F7MonllSFzVHtDe0SPPtDme3pGMGEZENLwYubDDohnbiFVLzTU0cN175jt6DJCndHqDkmI8kKj
	1bv8DBT4yR+1l/WDlNwi94b9679Ncr5Uw5euvkN64Mgh7nsTnZJtGxSnAlDOXC4XAq92Agd4sFQ
	8rtbMxT+BNx+J/kQlqOIDu0SwCmgkaU3YhOCTUgb3N54N5IJg601m1VXdULEKexDAdfYWp0KE+M
	wwuGLjPoA3TP1hxCuF9m05CBWqHgaiw85nieu99qR3yoiW/vTpULJpqLKxRLRcuSgNW4wsTKpq5
	Dq5aZB4M7tR29Wjji5nwxbFl7Ruq9z2lP5W/HtMkWoxuAqQCQ
X-Received: by 2002:a17:90b:3b4c:b0:3ac:9463:83e6 with SMTP id 98e67ed59e1d1-3ad86cd5f36mr107555a91.10.1792529275510;
        Tue, 20 Oct 2026 13:47:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4c:b0:3ac:9463:83e6 with SMTP id 98e67ed59e1d1-3ad86cd5f36mr107525a91.10.1792529275060;
        Tue, 20 Oct 2026 13:47:55 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8021d29bsm1052180a91.4.2026.10.20.13.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:54 -0700 (PDT)
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
Subject: [PATCH 06/12] drm/msm/adreno: Fix PROTECT span length
Date: Tue, 20 Oct 2026 13:46:20 -0700
Message-ID: <20261020204728.28844-7-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXwoO8vlM6YmGb
 GUqtaB1u3dgqougfQ0mgJ3HLCRqYKoXiY3g5ENgxp8lv+UreyXAsRMRshlJjC5IcyotBd4Q51Zi
 bhlVjIbpfdoufY7ikFaKbwLzBLi0X/1ejr00XkWOVBOLlHvpy5wUv/vh/Js1RQOkO6uXfNxRYQE
 9Xsr9wWuk3Z2q+o3/ibYWhK6ce5524cDm+CHv5iL7joHRgpx66ah94okNehU1FuXVl+LoU8djPP
 uT1qUXW//pXhyObOcPkzGYiSU8HGInnYgQzf2EVNiRSCug/qMlQoG/HgLIeYCXv3zzUAGSHXySV
 XZMcRghUHnTyKlscR/HLABxa0eS1CuRDYRJWfZCKjdb7+O+WHx6pfTF3wY4BwXSLMKoXcacwyja
 GZZs+KOJTDeOvqm/ZlNlUpEiWew77NtZEi1VpH7PTdyouqzYaQl+FZiH5zoVrq5v3X0oU0xdV5K
 sFZUGkY8LuLPx10VmWw==
X-Proofpoint-ORIG-GUID: svU3qbaaUQqX836PtEjtCW__s8Y4FqUA
X-Proofpoint-GUID: svU3qbaaUQqX836PtEjtCW__s8Y4FqUA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX99DnKmaqnYEn
 GNnOfOcRI08vkohpu4t2TrG3XRFiU3SqPu5Hiac61i5g0ynQ6jxFYHsXJxbtz3mf4awthDip4S5
 L2cPKnlg9QrdyONTHzt8JuFwMFSSUz8=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad7d37c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

Don't let the length bleed into b31.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index d60cbfaa0d8e..5e1f35c83d63 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 /*
  * Same as above, but allow reads over the range. For areas of mixed use (such
@@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
  * single register
  */
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
-	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
-- 
2.56.0

