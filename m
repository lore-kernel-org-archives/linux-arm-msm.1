Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293B49DBB5
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141565; cv=none; b=ofb+etq3Ns8n8Wr3fOCRFPY9e41LtJM3yG5i9jI0ALb+SpAUZvXyreopyzaDQkgsvVZYRgh174ZbVMjuiFzSMMfPpR2q6mDSmULgOURQHt36KzXP942CtR7ChXr6MNZzQ4GE4rQawYjiR+KIlR5m8NUTpS+THG75KBhv/TJPXT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141565; c=relaxed/simple;
	bh=tSipPj5v+toT6eiLFHZfg2ay5LiIR2f7cdFg1XG63rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXCjhurhlfXu7nbIsD5q981v4KOBlYuJV6SYL3BtFftimWj2EIjgZsVaVjQ5Y7rz296Mx66hOmXaedgY4C2ylPWp0KNGMatanuchqnJaA/Xz5y/2FHF5p4W+Bc+wv8KL81PhmSb7l4XuWiBIedNTFwNLgDPDswDHCa8KE163RCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wd3F/Da6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGvwmlK+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wd3F/Da6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGvwmlK+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BF8joa170575
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMETwDp/3YlyYwhOs1PhYLsbVwlSu+GFV+6efISo44w=; b=Wd3F/Da6OWHvXlJs
	5MGUI8D4JBwW1f0djoIFga8S2//zfxRJ9VJp7d2UUsFiyojhZXncLnxKw+VzKLg3
	/mC04DOfa3dgnSN/ATVUe71pxrk9tk/ndiE+9OwvftI0QiSmvD4MD1UIatdcm9od
	ovNC7kaK6CX4zMTSbtTvi8kVtFFSjp8R51lRvvKxWyHBlM6Jcu0YTZjKbwBjMUOp
	t/tPPXb7c4lMp8j7YWF2UQ6HeIRJiEftgejKs/B+RzuiY59o77ErqTKhr3BfyahC
	nKrsfLdXLQe3x1JfE3uspr/sfVBfnzb+CTiY4HAQNrgGDBMmAm2VtdUqlbLAi/iH
	YW8k5Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm1e855c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:45:59 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c8328eb979so42692e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141559; x=1789746359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMETwDp/3YlyYwhOs1PhYLsbVwlSu+GFV+6efISo44w=;
        b=WGvwmlK+MmnODzkLv499bwOthe6QuYGjIFCAqU7NUT5lag+1Xod++rqGZ9FvFoR9y4
         LEmNGpN47/P17pvnq2tKB4zqD8fmuIvedQqzzTuvmPE4MV6j8Hh2qbVY+72d2qPlsEqW
         3JnrboFb/LDRRxt/9cWYTWhYWk7G2+W94vIbBpFumVpJokFXng8OcEufz2omOhdDQAWf
         L+GpUklTAqfZtEilUJqhdmGYeWxhGXv7lUUsnA3RsW355syxsXsKcMZa1c37y5H9zW+G
         QClW+hE4AYQq6bRIZDrEeWr/sZ/M5p//ilnKw/5dN3ZpYzSTyR0IDpWbw/qHNA/IFy7U
         e5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141559; x=1789746359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMETwDp/3YlyYwhOs1PhYLsbVwlSu+GFV+6efISo44w=;
        b=eSEMKqO5JqIZu/q18Kz90eLmQ//jl+wtV3w2HwXiSlbniZL/3xnu7AjWs10GHDxqBA
         aTW61tXp84dhPjE+VG4BbkIYWvQEBYFn5KMfELHb5/BM5lQvcQxjrHrvZ4o3T77wBIxv
         RFPEU2MvoiKTS/cgHXTsUJi2qU7gX1gBXrhpLXvJkZh13jTPKa0gGfWmexUfQD1u8akW
         04DHt8w0DCiyhnGAxagIzZTWT1m/22JM1NnBAiX5Rdd++DSHVPl48VLoileE4igxuS9l
         rpZWyxKWCrQB6fs49lPASq7Dd5x4jjg5Q0XLgevi7fNYHW0d+3T2ytqYDcG0Hz5VZTxj
         bjjA==
X-Gm-Message-State: AFuF++mk1/t49TbfFcLDFiaC4wchJYqkjbjkScPHr1clWVESVk7k4hIR
	K0/Xh8Ou00l1k2qx/g3AkXdAjcoO++MHjZ+m12KnbcxrZCtbjhftxeVlEUUz7CAf+O0rGNwNTKP
	j9WPZKKgKqDJxVBWaIwtGuXtkoSziaE7WyfGfqzDyxdszEikTN/gw2HLHNeuDA95X1VFP
X-Gm-Gg: AYBFou3EyCZTiP8lcJco+Oz57VIQ0gmLfSuC3MMtCF/n16akWAsxLm3ANZl9upxk0qQ
	/jHuRg304caFLdgCiXbTkOiEWYHHOBgQuMmITvIz3tMgz23cQ9A6R3mstpe0bI00lC+nmZp6ykb
	WoB2g5s00xsmjC37X8wN1uErK39cf3EN4SGPyWeb6ZbjzXTSo0GTsSfL5lIqhLOJzFZgPYwu/Wp
	bqkuF/NkDSvIOH8lCqpysMynQ055mhCK8wBsq2L9ElM6OKXqQgr1bEn82+u7fLPrf6ryMQZ/NeT
	OIulZ4U19JFitzoLUJCKYGmrBf8vnO9smpnL5oP05RaeuzlYw2igxPVa2y8QXQtnZOiWau78NBI
	wAdsWI9U=
X-Received: by 2002:a05:6122:6d08:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c845d9f78cmr2224897e0c.0.1789141558811;
        Fri, 11 Sep 2026 08:45:58 -0700 (PDT)
X-Received: by 2002:a05:6122:6d08:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c845d9f78cmr2224838e0c.0.1789141558370;
        Fri, 11 Sep 2026 08:45:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047b678sm723077e87.78.2026.09.11.08.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:45:57 -0700 (PDT)
Message-ID: <ff5806a8-ed97-4023-849e-6cbd9b88efdd@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:45:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] drm/msm: Properly handle msm_ioremap() without
 name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfX2MKxYbrdCGEM
 gCDrbUutuPPuUeol3zYkZQ0DvhfEalfpWK8vjrYc+fOP0R6Lz+pa9lN+404CMXixbaZlJuYGBYf
 xrpQZpcwi0e2f1oZZ7XFNMUhzK4NfgFte/8cEWvUOum2EKOW6h0kL6uTpxIFy+6MB16zx5WW0gl
 ccocTxwv1/1hMg7ne2lHgQBTbJLmJLi2gl9PgyoXlZScBJOAP6/LK9Llj5nEAjZMlvNrrUBac1p
 KR/w4U9IFS6MCBAkac97YL0uv2q2DsIzql+e4h7EGbOVwSwsbn3NHFQ+wIur6dbB8TOBalGzZYw
 hxG3Elr3HPBjo9aX+tvIImlR6kXSyAamjFRAZY5+pp2meOmaPfJALh35YvmGp5cKMllV67YWmvy
 FHwk7kTwO0p2ue5x80xy1/IY4MEtDMqGHpCU0R2U/SRBxq6x9kz861dhV1myL4v8JIcENaJDDya
 QaR1HSDgaBBf2OOGq8g==
X-Proofpoint-ORIG-GUID: uBs6Fw25eS_39mpCSs2TttXPVEb6KSTw
X-Proofpoint-GUID: uBs6Fw25eS_39mpCSs2TttXPVEb6KSTw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfX4pB5F2z7P+ET
 qkYBBRaDNMGq7y04V+6SW7vjUsk+wwR8K+XA0/EmS1VilI7+xKftov5uVx+/h+0cvp/OwXZ2yMx
 MzXHKFUGOOk/Zge1HWJiFvb/6L7Ixig=
X-Authority-Analysis: v=2.4 cv=LrwHWXdc c=1 sm=1 tr=0 ts=6aa42237 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pPDQwCEtd_d-j3aiaSMA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110219

On 9/11/26 12:29 PM, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
