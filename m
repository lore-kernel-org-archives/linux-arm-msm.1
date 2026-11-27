Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810553;
	b=1H1ma4QBtpFXilL4GqT9j3Qh6u2revdYejPbo/5n1wHWUyuoNo4dc8KpqtnDbzwpsNHC
	 N3cO9qtVXCxLBsNQOdvtWALTN45Nkcb/mbMn+vbtdJKiP/7Jx3Jr0MyDjBVM+ALADQdXH
	 bCj9tdFQVYRvxnE2uttj5bEUz/f+pRzkJfvOubNi3zajuEk4JPk53FLDpCW4nXshBUsoN
	 FHxrB1cP1o5dWpbxk6FxvINyt3wx3BroGxB6+SuYXbr05DBZczF0fNhYbM0qyTSx27rNu
	 C0qtdURSOWPTYQf+hAV/+d4/o8qVwmTNjc++7V8T7nXj9EVp3116V9Oa9pZfHO0mffA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=98qDoH92azSwLouRMH+8XP3dKSJaHgdwXUq+g/TmSHg=;
	b=JwkhyoDQvmoNtP2qtg9umx7GFbr0QT5kdJdnkwPEo9bsCWETrTZbRL+sI/I1AE7dydZ0
	 zxhTYAo8kfAkvExPDTFzWN5rtZEG4cQNU3K1OpUiAaDPTyz1eJx67kh4rD4WH0gq1AmaI
	 i0hqNB6ULvH1urMGiD0m+EY2wRn+8QT5RriHwKiPqaQno4Poj/20DlIP26FJxRGn4D4Ph
	 ykg7vTrqOVwY0IrL8nfWyE6XEoQyJIcOS+rIUyLUUw9uPZ1UxRZTn+dKaCunJTd3XHhd9
	 tgQlpe2FgtNYQhgU2tpIzrYm6RlBd30ptua2YI6nfL+fmHorpK4zpPmqk+raXllpCWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VLU/0Kny";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cR38sX9F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DDD606A682
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5DDD606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VLU/0Kny;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cR38sX9F
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJTWsH525192
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98qDoH92azSwLouRMH+8XP3dKSJaHgdwXUq+g/TmSHg=; b=VLU/0KnyuUJMZQdO
	rBEocEKSzuWWiP5IfVwqLXMCIiwHJVHuegFQp+Y/29wQB89z+281D+srlm0HHAl4
	6XJ94xeoKQL7N0CW1DfrSfwuu4z3n8wPgYHRyS/bjRZ51w9lQEOP65ZIR4EVkQ8n
	CaHg58cL0ia0ZNgYCZlcf4/0Dq3RhPllklUib/8mUqqeSk4d2S7/bQs4k4TkDxMg
	s+bVtGrdARWnX8bnmLRM7bkidX9iS3M/dKlCHgJknOTV5q5aHCR4ryIFZA+wfm8d
	ZUWezr9vkzsOuXazLvleMPTo9ovj/vgn08nzh0LbSSVGXplBzj2U6MqCKmeHpRbS
	+vmRtQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g2dr349-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eae356241fso2355033e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810551; x=1796415351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98qDoH92azSwLouRMH+8XP3dKSJaHgdwXUq+g/TmSHg=;
        b=cR38sX9F91Wbr9vxkioBN8V56HD4PCZRxctc9g9KH9wnPH+X9nMJg9KZDKX4SJfrbQ
         4fA4Dj8oLwCXJEIxMl3iOofrKY74GtUjq1viTg0OhVvZGs8Hwueg44HDKnGex4KL27SG
         HCK00bzrhzcxKzKJZBfXsmT8VSZinM6SRV7S9ru6lYWFSnRKaOnZnzD/xc+SFclzX+mM
         o6NY/NwVwGJUFGwbGZUODGt2iXdmJAEUiKKKpDKoxjdQ6kkDw+Rk85t4IzW+U/cmFsmv
         P8fm5BUYWO9N6TKm+aFVSRoy0Mgzdw8PkGq0w9rwDJvwLOOlKkBcU5p0eBKiFGPWRU8L
         u7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810551; x=1796415351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98qDoH92azSwLouRMH+8XP3dKSJaHgdwXUq+g/TmSHg=;
        b=lSM8OdYFnRMziNVKFhSBiW51s+sIKf0RHjVdQl3LCaj/Jjftg+6u/NltE0wGKNGipv
         OM9nsHy0jNnwmuWNgfbJOoLZDiahk2VLsT6hHPPoDFiiqOF7HwYbOvqvxqRlJX6YjLU/
         8kPRfYD9cQpWh7lLjVK6RfndvN6lVHHjK4AcTHB8A+mEuOX+ol1XMWeH+gJ3GX5VSLLD
         cHM/NZzZa8t22/RJlsX6VU1ygDJuvCNfaywNEFQh9LERN4aCR8HzuMygvU+Y5H/GPt7c
         HY8Uq1ol5UEuqWzaqSv+fc0gdGqzpA1hCwxQsOA7VnUh55XrxRYnlsb5nB4a+AzNBJcJ
         yvog==
X-Gm-Message-State: APuU4Z8ZwtAqK2uV1MGOrmdXStXhhvCmtIkGa8vGNc7rFFTnIU8pzw9V
	neWWmXmLF8K5vVUOUbGa5qE0wWPnxk1PKtpv3+I5ksGpWDvlNez35us2sGJVC80OexCC+AHN04l
	2BkqVp/USGA66geosgTUXDJ81W15IeBRppe+vt3oCs1tsFxgzmlOaq+j+Ulte6ValIFgk
X-Gm-Gg: AZFdTZdYx9sTd6h5ZXRaYtv3BjFN30SlvhgXS9C21qkFPVMsrf/PLcMOIerzeLhMWVD
	/Mz5gq0qpWXm1ZKVzh+yf6oF3nxGg8NXkjRYGef13qQ60ZSsPEWv5E2GQqUFZscstd0rEUDb5pQ
	iSsYvx+21FxBh4gYf9zibErz/1ZIDLCzslEDTiiFf1pPi7bKdp3eP7U6j6JGFMmy5D93/B52TAn
	75mS6WF0Dv9konTsLPXk6pq2/fLK8RAsqogaVOjRmlVghowVxFjWiQc6/eZiC8SQ08kIj0tCsIr
	0HiAJjOjOEDS4bUuOeXqQDDIbleSEtMFfH7lXruAnbBCgdNIXo4Bafap8ZidcuXhTJ6fl/TDfBo
	DLl2oXUBR4ZdM9h1TcEYM+MMALW4Eo45JSFjqBrqfUXOEMvVGc/kMSgEpji+os6YhnRnWqFMh6z
	mnbVm0DOc5F6qiMKOqCJ0V4rt0MQspazL0zkXyEFpsvog1vPQ9naSVZmllvFAgxA==
X-Received: by 2002:a05:6123:a8:b0:5ec:3e18:a912 with SMTP id 71dfb90a1353d-5ee8af230a5mr14375552e0c.14.1795810550780;
        Fri, 27 Nov 2026 12:15:50 -0800 (PST)
X-Received: by 2002:a05:6123:a8:b0:5ec:3e18:a912 with SMTP id 71dfb90a1353d-5ee8af230a5mr14375526e0c.14.1795810550153;
        Fri, 27 Nov 2026 12:15:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050fddfsm64591511fa.16.2026.11.27.12.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 22:15:27 +0200
Subject: [PATCH v2 3/3] drm/msm/a3xx: update the CP_ME_INIT data to
 msm-3.10
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
Message-Id: <20261127-a3xx-fix-me-v2-3-839408d293ed@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=894;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lso6GGjxnW0xHLP2ZKgFEvmFfqpbP27jCKyKzBg+AJw=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGsJ5O2heZmgfdQPfBuaJhQqnhwbxZMb5CFc2yvFrdQ8zioZU
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJrCeTtAAoJEIs8ij4CKSjVmosIAJPL
 Q8lzjYTDLtfWLAR1zrvO/YFv4g2WYPDaBT/f81v8IG7R7cgVDeEjvOcj9tq2TDJjnqL59TJxq5j
 wtM0f4ufpkis94gCU+iLEgJh7L+AiDpvzR2pXNIpaqU5PbmWUdaO0a1qz7D0DJXqiFNd+B0LT6M
 L0TqrUS1sk9YNyylDbcwdLtXFz1LbJho3Kzif5oI7BYyH7hjr1jzsOOaSes6fKdMWY5fE+r/y+Q
 L2L+bR/nYrkfBkjECWzIFcKOtJ6UnOunIkPx4dMFST2g0fqkDS/EZfnPsyqRGfkI4YeUVO6bAFn
 EHNdZVo1hmxS9SotV2tq1sCqdGB8gqyO7nJ0jTI=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX9sK18lhZ3XHH
 qbVhEBREKVaohew9/5DkP5oKqFvzq2iVQEj76XUaO76sWljJSXzHlAQYvUaursdqqm5ez0P7F5g
 ytsmSV7pGO1LnLiK15m/zckf0cgiFFly8+iy3GY68/EsMDnaMH21tbwSzjmZBOMogKQY4Mpxbun
 dIreeLw1bHwoShmqkU0y01iKRSJRGO+5gom4k5K6mrDxUTlph9rd+dmcq+RQEDmkl282qHVo5cv
 r8MHfaK1ruyNFIf5EBttrY6YWZCZT3z4DraC/Iv5EfdMvwnlzrgCv4+sNXMwRd43wJdMjgyozm5
 MJFHArKF8Au2/b3NzIrP2F16UEq78RoWvKwiNzxnKB9yrxYElyhj/lwrEcg9CRN2ukPCs1abjaq
 R/OxvOHqN9LdXfjXLbt9oZJA9988TBqPTKPukVxBVxCqPP4ZLWr6YIxhU6EY5SGqWdkyHmUcg1O
 aulO1v2T9SaOGgE6Bsw==
X-Proofpoint-GUID: YyImYMqE1MQEbwEHFIwv4coUM94NlNwi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfXzvAECcbxIRet
 FxtaorSpnMXCc0qA20705F6l1SYcReFNCZXpYsNaCBTtMJrUA52wTbFC7eap5OK/4WwfyPURwgU
 hFUuuZZC8vN1dn41O6CScWz44Y4SIjU=
X-Authority-Analysis: v=2.4 cv=dJEzC+Zb c=1 sm=1 tr=0 ts=6b09e4f7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ypG0q2TZ0WS5u_ylJzIA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: YyImYMqE1MQEbwEHFIwv4coUM94NlNwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270080

Update the CP_ME_INIT payload to the values used by the msm-3.10 kgsl
driver.

Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 6a9e0e87a8d9..8bcd65f52496 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -103,7 +103,7 @@ static bool a3xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000001);
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
-	OUT_RING(ring, 0x00000000);
+	OUT_RING(ring, 0x20000000);
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
 

-- 
2.47.3

