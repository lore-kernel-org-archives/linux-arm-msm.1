Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695908;
	b=fTNNKgIqIxnTEEr/LtUMbW2dXs6ttqaOSWxOJlInZ5CK6IDmGsYkbZaUu0kKP/LiYLiY
	 cAPP5XQAEQ0os0zeAKSOZNUMRk0UI82uxg+jfS1z9XEDYMWFFdxn+gGNfctUQg9eaypum
	 zBpeNWNhO0jZzfhtWyouUt7bZZ5TSX4OdCEWdIgigg5gxpyBzVHMkcNL546aESeBzAyFD
	 FC1PAISmMfl01aamSaAEYpt88XiEHZwabIMnDOehaL5i9eTzelILuZZXI2lS4p9mtjwGv
	 qJgUKaaJAgq9qKeiJXdvQHcYNCqT4lozpi8bNNvDjSZPB14xzhlFlwPn8vI+XjJzEQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XCvvirDHMt/mDpBHlLgw3Uz9ts0ZYOeL2ziEuOb6lFk=;
	b=4BsnGPgvF8jtwjtQqsOKS78SAfkINYT2Q9UeVTlK1rUwZ31g5NzPJanIUoza6p7VnDDS
	 RI3QdTnZGQ0meUG5EtHqKmfBPp55YLbjmEAOfoQyxHzNC3dBQSWBoEbeX+ysacQfEUbUw
	 O17NboZubgs7AASyRSwNpIubyIxu34QsmieufhBr0f9rHCkRHei8ZPxs6fzp4k7RhnjQO
	 a2CVQklVh/ibmlEgPrFCUOJgrSzSE66AA35xy7PkAx/IX1XX7g+MXD+DbqRq8/EBTGqLQ
	 bX8F1fBaP9ECOyjh3OR2cpzdWcg4avX40b/t5kHw1sSqnRqAJn0Wu1JzUi0x+/4ULUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=byxHh5Vy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icnUUpfH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D3C606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 08:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D3C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=byxHh5Vy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icnUUpfH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A353GOY2451177
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 08:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCvvirDHMt/mDpBHlLgw3Uz9ts0ZYOeL2ziEuOb6lFk=; b=byxHh5Vy7u4l6tdm
	r2fWyET6aQ5qcLf9L8IUjEpsXuKh+j7nZnBzXyTG+pq++GXSyOEyRWQa3xpsUKka
	N2NawuvEwE6BkavTJSvrGD9vZGmRc6QwRHwGFBw2WZDFXs1xAFWw0OWwmsdFZnZx
	YaHRbLxGz2pDx4XVq2zMVy9RdczTCL4VP2XfoLItXsE0HW+uy0LCbfU1fP1VE1pO
	2KTXD6MNaBczeSwpq+MFT4x2ow1MxHrnOHU/rLQJi9GlbB0fFwdO/T1Hvy++WRnp
	h/Ur3wDMqwpRMyPBVGTz/1r6oMXLm9PyqT59OzgjqKk06dRdE2QiW+z4weassp0U
	427d2A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cru0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 08:51:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7047e84aso13564126d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 00:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793695905; x=1794300705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCvvirDHMt/mDpBHlLgw3Uz9ts0ZYOeL2ziEuOb6lFk=;
        b=icnUUpfHj3tneN4gWWIHjLf+8cdd51I0tiAI/3t0liFDhr/sa6HGw75Ty47QavM/th
         /Ntw1CDoyH3T3sxXuqsD/KhU2YU2FULHKacktTucOLuSui+TyBeh4287e8UqaZSJh0U7
         ixx1NjcSFnD0TpYpUFaiN2VMgyifEMivoiIHKUDxKf2MocXXHfhqw+9zmEK2jBXODjaM
         GKtbNvAPZ9swB8SWjDtIXQq4C+cHFAG2fyAiGzY8EcXNs11LphcF9z9NyhuLvBf222fV
         8qeBYTTNVm1XXHAVNXS+x78OPo0/Fpe7ql43463cYD9VRmYw4IStvZWXRDpwRgU8FLzN
         E+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695905; x=1794300705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCvvirDHMt/mDpBHlLgw3Uz9ts0ZYOeL2ziEuOb6lFk=;
        b=r3s5qs3/GxmF+SUroxHw7lhlDIfYrEg6MfYavH9u681jxsK+20B8Y7XI/i29T3WEau
         /LHWQ/urFN8Nq/UB8s4gcZ79Bg7rwMF9i3A/Cam3POrF9J2EvOz2VMk1f4ShkScBum7P
         iWER4n1BWaQKSBZkXoueKZ5uTGrhOurfk9PU3gk0DTtoaSy7oL6Ye4YtgFgITpXZsXT3
         ThOCKs1gN6ao8NbW/KG2Wfz+0b7thN+oEjxWBUbHUfbZFYBybjX3YzlWcqb2I/QW4THL
         AjkpcOHHKitpJ1/cdMzo7euKrcb5Z6/kF5pQsejwHNnUzu64xUMRYdkG8L/6tZDNjVB/
         s3cw==
X-Forwarded-Encrypted: i=1; AKwUvBxDZCaw47o//n4AkH2lOsUjtt9zRp0wWlN4cXgg1hzjkQy4UDWUF2ZPsvsIIwwQoFJVQysvvvjTqW90/O6W@vger.kernel.org
X-Gm-Message-State: APuU4Z8qUQnXQiwv2Fw8zkAQXq/2Bbdm1QGjZ7L4WVJpdRPg1tNXgIFM
	GeLiqUxpb35/A/fCkm1J36A0j57Quv6YNcJEceTY1OWCJ6O3PE9FuZv3vu3WXAXEcG6Jn7SXsQD
	8lKn5W8bzAZC0rFeNVsB1jOpixdXyS3oQX7rTVn9DR0x4txaLlz38XzZ+uGTfmMTfu1fq
X-Gm-Gg: AYBFou0XoFoqrVTxi5sKW+d6BTKsgrwhWvuC2DN144AHEnw5AI3l3fpABZ3OWYcCRAr
	Ls9czm8psagra0kplZmsK1elhvxP0bxedNG83GZk83K+bRg6DlBsKqaGnmuieqN0th3HQQ42qnb
	O1iBJTXEDkZp2rP+JcTHHG7p7hOLT9RCVHzXaqwtjf1EEUqHNwRg4rmKqohX1r6juCK1aHQiKiq
	lLyKeeq4r7/Jd3412ZtTOHgTkUuIydsRvTPC/6LqM4GvGUfMGXV0D7bcLSdG1c+DzZRolXxKd2d
	t/PeY2n+4gg4P3xyvnsfcNLN/lHRsGCI/U+x4JJT71Hbx8Gx7oWsdvexaXVXwSiX+rL/b85S7dq
	6pFrKZbXIH31XL9mhw1epOOhiTM1lCd47kTS0U3RWYrN9m17SoYEDNNlLxK+eD0vh+Q86MA==
X-Received: by 2002:a05:6214:3f91:b0:91c:6e94:3b52 with SMTP id 6a1803df08f44-91ca47af0f3mr285847316d6.0.1793695905177;
        Tue, 03 Nov 2026 00:51:45 -0800 (PST)
X-Received: by 2002:a05:6214:3f91:b0:91c:6e94:3b52 with SMTP id 6a1803df08f44-91ca47af0f3mr285847046d6.0.1793695904509;
        Tue, 03 Nov 2026 00:51:44 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cec16997esm66447766b.79.2026.11.03.00.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:51:43 -0800 (PST)
Message-ID: <47cc93a6-7816-428c-9c6e-43d689b459fa@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:51:41 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: pas-tee: Always initialize resource
 table output size
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261102150110.227479-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102150110.227479-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9a0a1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_Sw2Lv-1HmNiuYeRDNQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: s_3pLubmW7EFefOIEbRlghAdCjt_OkP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX+Ni+PieJghYa
 Pp4V03kYTp92KcmxeA+it2LSTwZsSRPs2AJSfZROvwRVTdlJlQtSWg6hjQXhbBc/l61+bE7GBnW
 e8Xwcm9cem4z8SQpEqIeYB1I1f8opCMkTuWsNUPhGaZ1EVMH/GOTtFuS1gV6A7nJQU8ow3usfJV
 EkVcPK24yBVY1Mt+qCxDw40zcYVjrlzD+TbUv6hdaojTfq2xlK/D2kc8le758hbBfjpsyX7lkD1
 Zc/C1O1JFXc4QwUP7B1AwVDz++t0hCRW0VCwnjIlKuYZBG39EKV0eKsChOlfJ44k59TFVGJAj7k
 CLTQ/eeq53a8nJ+xCYLKfPYPL2AQ257M5l7nMiulev2C4mZ54bEY/7qhWV3kyBDZuhITuk87rM7
 JZ83ffX3BtSMmWIz85ReCNj0FLwBNHTBcsPQcu+saNa31VRK3vlLGoc3gVjDInRwjqb1wZomrpD
 VMvH7ca5JH5CkxNDr4A==
X-Proofpoint-GUID: s_3pLubmW7EFefOIEbRlghAdCjt_OkP_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX98J0SVqi4ygU
 KSH5ttxCd32TsZuk5zpRfYGqRVB/y7NUCpI2ZSVqZsdCZ9ImSCBmUYgSS8x3RoOFvuxTYQpKZgl
 MT/beW2AGfuv+deRkEJechjOuvDhrdE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030035

On 11/2/26 4:01 PM, Krzysztof Kozlowski wrote:
> qcom_pas_tee_get_rsc_table() sets the "output_rt_size" only when the first
> TEE invocation reports a size smaller than the input table, or when the
> second invocation returns a non-zero size.  If the TEE reports a size
> bigger or equal to the input size on the first call, but then returns
> size of 0 on the second call, the function returns NULL (no table) and
> leaves "output_rt_size" output parameter untouched.
> 
> Caller of qcom_pas_tee_get_rsc_table() treats NULL as success, thus
> uninitialized "output_rt_size" output argument could in theory lead to
> out-of-bounds accesses further.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-bb15726c-4185-460a-a5f0-f779d5ee144a
> Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
