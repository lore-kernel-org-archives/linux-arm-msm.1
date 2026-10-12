Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F7F449988
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794369; cv=none; b=fZVshnjAvTFhAMCGym+0PKQ8nyilbe+JIrK4iYgC7+pikGYpMWDuHXP91m04d23SuNQz64jUptu9rNW927x59GmrG7o7Xf04Goc5Vi6x5hnJKzz0VJ+E3/oK6KDRZC82TQiNK7rzF28T9YYnybOgMWMOeszjbMjfe+vtwc4L1dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794369; c=relaxed/simple;
	bh=OGepGGUQ+LWrjxXWY818lwVO7WpOVwGkonVoUmzk+mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N20a1Sp/98vTqFkiGASG4poHrwY1mYi7JdlcAhPqon1YBmJQCL6ZIPcs6GgVQnlPeduINQprCyCo+ic3aItqRw/d3hltVrhZzocDfZ4U8ZEv2l9HVeitDkqIL3FT5PqpX6zYbhkHmJQUvdEDkDlV/pD5blIf26R3+EkYf4+taUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOxZY9bV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7DDDx9i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOxZY9bV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7DDDx9i"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Ki9a741793
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVUoLgw50wiXKmSauCJw+oW9dk2W0d36IZAjmGS1EnA=; b=nOxZY9bVEcslPexO
	/+2oxnw9SLhb8czQEzGDJQ+9CwLaSs9zQYATncW8xQJZUGUebUNcmqEt8d2IRFNK
	eWS3saHtrEnx0T1WiT7iy8TBODk7qaLSPXaeHPUKgmANfmxtRNoDOkAiAgrrWDYq
	i1c/IJeXe+BmKdwCXHaAOapuep+6AWnNj+qVPFouV+GsxxOcocIHvQrzqPNMBYJM
	zRfmP3SLZBzmXQGo3azaPK0KuAnaj/iwFPtnh00LZVlnOcVPj15ycmWB7VASI+Ey
	Knu5DfibtyXzNIGBVE9PGAR4SZxggUtlTwqB+YXf/eRAqp2mU9CWyVfNnok8QeRz
	2eJ8Zw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dhvc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:39:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350173dc7aso3749201cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791794363; x=1792399163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVUoLgw50wiXKmSauCJw+oW9dk2W0d36IZAjmGS1EnA=;
        b=G7DDDx9iAmxMam9y0z4BaFf19pp2FOAPxM2ETmnp7FymIO7Ilk0hlWP2bY3Ka80LAv
         vyljcnJWqVTew2w/PeCMSB/hLWKaW5MELKZ+2gRJxX+NtIsA5gcFWutUJf47KiMA3DYQ
         xtLFMzslTJSdN9K/XAyot0+LDbDCx9bAnV1sCQdjj25SUWN27VsqU5dCLeN7Z0HKZaIA
         3iuuYb65BuCZEDthjXbzfX2AQ92246L8rJv8rm5k8UkGzAMtWDwOmIqv71G0CtoHzLJI
         37LZBtfffuLVpyWdPd9mkvXlOiLb2PO714QP7cHXJvDNGWfaBk8+0N0xGGfsTZiiPuC4
         aziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794363; x=1792399163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVUoLgw50wiXKmSauCJw+oW9dk2W0d36IZAjmGS1EnA=;
        b=WWGlzV3JL5FC+6FNRZxKDllUI5E4hIrVVBeEcpwQoVHoNdXBLWYgEr79zECr3oU77/
         tRkNTU8zbyOTXBLlwoe8you8Grnl3fh7UXX6SOWZ+6jAsKXq04oYYlI35kGvaVL2Wc0n
         6KIleSeDE4wabNitTGunOV08zgxDnpjNRYY7dkqhnDT55rUmc1aBqFsQJj9Fhegf0eoB
         C4lXyxSCndgPxc6wYIvQNj/tqT56Yi+E2M3G+dnrCm8w8R6pXzq8zvSs1NJP5Awn5o3T
         KuFxX9Iy+Gz3kTAXtX0jbkY1umsY6oXbD/XO+CdyPN+pGXxqXgaURK6QmD1REEiI6FYG
         +wFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAuNFY4xubdXntnO057iivQv7CZK5O1pO2LLn19LdUI8GGqQg4N9ZVG6BcM4so0nxd7C2ozlVa6xTgvmIB@vger.kernel.org
X-Gm-Message-State: AFq9FYIFuFxaZQiOvfTEXO5xgaYQSYLhqf3IIwybLPvysMfoLLDmCYOF
	w3frYmJV7VSmmYJVKcK4mjPd71oohvEUVYL3GWDrQaQbtA7U8pIrx1SAD1QkxBrlJr6yCGAZfwz
	G7vi6sMyQpw8ekiVwhzIz/B+dE2m4ScXSMHSZKwBJ8cN+/kDgzOqmwh6N6BKlr6if30zn
X-Gm-Gg: AYBFou3laBZwxsJ5FRkgVIHOG4Je9Umc3imtanYr6Q+MIAyD9lONg/8BIkgwqiccMF7
	Hu7X6ZR8rm6//WtP0C5D2+0x8qKZL4jXXTOTVHWPddrtqRUssQZdOmpZImj++6JIEs5JUP+mvtC
	CI5+m85hGLlTmpbfWt2l/XuCNeUGtSDWJu213pRp6fHla+3eS2Wc1F+ziQ0CQ1dR/+SWOWHYhJT
	BExQs5ztwk0Bi3K8n15Rmpv7Cp0lPTqUb+b2QitGIpsmlytS5XKBStvnRiG2CU/dJ+9w2/TBiLe
	yNUO8vGWNeVmnakpNXBll9Tygo05pwp0O6Lyt+cFvRys+2DWWsHs7Bxhz/ddFRrEZwmxl2qultF
	LDqji8YK8moXPZAaPwS24Rg==
X-Received: by 2002:a05:622a:110a:b0:535:1a6:6e93 with SMTP id d75a77b69052e-5359f4e01bfmr173143951cf.2.1791794362668;
        Mon, 12 Oct 2026 01:39:22 -0700 (PDT)
X-Received: by 2002:a05:622a:110a:b0:535:1a6:6e93 with SMTP id d75a77b69052e-5359f4e01bfmr173143561cf.2.1791794362105;
        Mon, 12 Oct 2026 01:39:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa8257sm434128866b.60.2026.10.12.01.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:39:17 -0700 (PDT)
Message-ID: <cb263594-15b7-4d92-97b6-e0d08e3d7c61@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/a6xx: Split out a7xx/a8xx device tables
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
 <20261010154125.726149-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261010154125.726149-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX1pUyOkaiEoVL
 nO8v1Os7uISQ8n34F5h6XcKK4QKgVWFa3G/h3igGO4O3oESap0+71T1bNqimFWeFmuOm9zpX8F8
 3D6jOwkb8C9PNYLSISJYSsQ0K7laZXLRkpaJsTtNfXMjwErELKamLOpOXJBeh9N2wK8WZSsjMSL
 kaj6BOicm3GczIJDjFUAsc1h/BJvFoA6WZFSsLdikCIdS87fiMUfjTg95Xm+ZrV8KivpNOcX4XI
 X5xq6iWmucCq8ai/zgjIt5ooeiZD5zQVmgvS6vuqdWkxx9MEt5jeRYtwMjw+FVpV2sKLFP9dPZI
 UNGva2Foo5tKjUkJWS16HaEBeghZyLpAyDqGJ0H/bbuv8n20jKTRwqHBJ0rMMO/HMyUb+2Xe/Ng
 gJI6D5H/xoYCHF5yvkQMueT+Tu4mO4p4IkNAehIuQKcIqwdVkYoebvst6SvZL3fo0uNfALjEZYC
 MqjOSIfbVJkT1klCojA==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acc9cbb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ysXiB3iG8gxY7zNvRuQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: DT-a9jiWxUMFv9J7juxN-UuC0HSkyyvu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfXzlpIk941OaiU
 itwKVfp2gRmwsFjVJhSKai7xV+phobdFqOgJW/GExQo4dxG4EKf7cwEt7DX64eOR071aHkMerlb
 gluRJRLOqVsQ81WuYeELLGoqcj1+CBs=
X-Proofpoint-ORIG-GUID: DT-a9jiWxUMFv9J7juxN-UuC0HSkyyvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120034

On 10/10/26 5:41 PM, Rob Clark wrote:
> This way we can start including generated tables for a8xx GPU snapshot
> in the device table (without having conflicts with earlier gens if we
> eventually try to retrofit this approach, or later gens in the future).
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
