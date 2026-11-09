Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230317;
	b=Jem0TkVJM/iHNahyQYBQA+MlRBaSdE1hAR6aKECP1Eqg3SmVMBICLXJCIXx62UvyQ75b
	 skw+EGzlh7lK+3nRe4d8R23ZOLcVlIXZoo4qr19hX1qb3CcysW7IiFQGlvEpqwSg2uLcY
	 w+GfMXsFlEL3pawbYgeqCHMKDY7gNvbSLEkbEf0yQSIQEjIQzJ1N/qB6BhpQ5l2ARN2eh
	 yjuYg7ThfhUYMjUE1v1Lon+T3T1aPKRqgA1zvIn1Rk7LWAqIlfPBw0PCoENPmsnZUDYH1
	 22oy/FrufvUz9C0T7OIEFz40yn5eQtgnb0Zt3/zEpren6Pa/ypfVubPAjMiSEhfabYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=;
	b=MeWfDFOicU0zMAN5Y+dPntvZrNPoyndkgy5LpxS5biNo/Sp1SYjuFU2qqZRNtk0EK/4S
	 T6RrmYehpmBcCt9LhguUg/sSxHbr8GBYMS1wEzFWXdFGWpTlAdb0SnS8ilQFfNh7Ih9cP
	 tgAjdS3ZtHfbMuMuI0OMpGI7PkzABpsiDPvSp3h2HganBxtah3jMsb5yqqli23gsHqsLd
	 JMjWKml9Qo6y8CAEtlRWyX0F9sccrWcHsJowSTYgYaYLABaVyYP9P4iY8nhkThBvm6zQK
	 JFODgC0zg5Tqa6zfgNnBaNUVMvxRUcjJevt8lAbfdhBNVGRtVWomMuhKjAt5VMk8yQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PD6hAaI0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJrJulhc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3138606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 13:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3138606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PD6hAaI0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJrJulhc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFCAB4025841
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 13:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=; b=PD6hAaI0nLrQm9uz
	XCzX7+Col9KxUfgrilTFUnFUvNpqmRvwYtuGFnEZiIuepCYs4LKA+ae1LDXy/3je
	OcN8+Gf44pc3um2q6ZOC8id8nsSyzQIouuJ5iIcVRvMZ/vbHRr3Fcycfcbon7yJ7
	jsHHjSh/gU/yRGykgvmJgCvMLCelJjghkpXI5rN6/DINd3q60Ov5SmYhxCwUeADb
	XBTD7zsQmIfmFMiFOU2nudE0Vg1mAoNrDeE+FcRM3/hfBW6qdVJQTzapG4g1lQ5l
	SQp/LKfJSGFaV2ucmVL87hPeYJIutMXOwHole6MZ3SIUd8vYXbv4oBas7W6UxLel
	vZ1E2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5893xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:18:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945e8a244bfso7270985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 05:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794230315; x=1794835115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=;
        b=WJrJulhcBXRT7GyXwi84Uc/eknvHWCajm7BXtOYjZRorNnY9K1it2Z5tPuv3qRW+YO
         6bUR1+aG/Zdh7iktYHB2fyoiEiFhnquF8DDzbtbfVrqVBjutJOtWEKEJINP6cZR4JO39
         5GOXGYFjnDgejJjkhP78adWj0omjBM4gID3NfRAVHvawUvjKUtZnrZK8qoycQhMNbHfW
         EpyEtNrpF1NUvP5bu7/iBIKDWaLP/OwmAobYr3ssYOi7xsxbkwH3OqMBN0hRggPEqSBE
         oMmcFgJlX7uf1BuXgYKxspHFD+BhMRanrGd7eMiSsXC2j2EnJNXlS9EPPrDhn1re9vvY
         4iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230315; x=1794835115;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9Ly0H2eD+VpB4ntoQnCNH5IaZ4AVMAVdM1dy+tGVBg=;
        b=NkPybVjy7GRxakJp2XI+qWmJLqrZtL1tSBu1tDzC++PwSeIgxcS1zxD9U3RjB9LwSn
         wfLyAvQIOq4+JgNRHQsc76s8zbrO3/9tf1fXwhjK/rysEhbmjXS2nLrjXgMclQY75Jzq
         XmkniMrMYUkkARj76sSyOM+ywYgkoy5bPQeWpF0HICOdJscUwoxLTjjEddjgMQhX+OXn
         TwuU2Qef/eipp3Jh4vV8umWy41M6BKYKdcoFmaHJlW2+pQ6BfIpIdjNvC4jbNKw4xGtZ
         Xe6Laq7UuVjqhUP3G/EvvPF7kQjA4pSk29NyUHdCHnLXAuoH0wqYLnv37Rif7fMPIXt8
         dzXg==
X-Forwarded-Encrypted: i=1; AL+hErFEtRfmvwTvOd1+4naSgyux3FDWEWvYKItLGgBhT59+ijOSdA8zvAk8yGXkMDAQ92C+Wuxd8YpyMX/uJI2Y@vger.kernel.org
X-Gm-Message-State: APuU4Z93NLO4UbwsrFdYETwBv8O91ELhTny9emqsAnxry2j9RU9v+zyz
	E0hFXraRsp9c0z91xY1GucDW6d+lpZV9sZv5YdxVbUkVqFM4FAjGNPFZeeVZyBdAR9ic60K7TMV
	O1oQ5UviyaIaFjTcVQf3sKSyD0i+8VeesEBV6dad19kV67csVF5Kx/hZOzdSvSxIsoYyjotkqqZ
	Oc
X-Gm-Gg: AYBFou2AmQ+DITJhs8LrFTfiRloAx+46VEp6lUSrEGyHLw5s3bBpcs7oKUAR9TfPzI9
	SfTAH/u6TADInDDiMQ+0ZDwVySkhv3BgPVsh1IGMjaZACJ1kxO65KU7a+OA26raTHeoppwjzcAz
	Pk22891YTgptmZ2CEYAdEz+FxvFb9kY8fPF6fYJX6wxSszTdsY7EH83ooxtYHaeT+uXW+4QoCTL
	YFhJSK99OPFUFC8xNm8GOnSiFfyd6dNWSDw+OWBVbx6fio5Gw0zpLubidyiSEaZSBg0htZgUhjw
	OZjO4LIYKDNErpn46AF/gv2+0tEiLhIKQREB4NUiCRVnMUz4aa1fUZl6IjzFE9AReNAGF6WR4q0
	Xyvb8kc83XBdFtYYYgGuUmk1ck/Ofa2zl8rrkDGgJGDflmcdnnH6k7cEH/4j0gPklZUJ5mg==
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr685964385a.2.1794230314727;
        Mon, 09 Nov 2026 05:18:34 -0800 (PST)
X-Received: by 2002:a05:620a:a90d:b0:945:c5b3:6356 with SMTP id af79cd13be357-94784143254mr685958685a.2.1794230314176;
        Mon, 09 Nov 2026 05:18:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f93858sm167363866b.24.2026.11.09.05.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:18:33 -0800 (PST)
Message-ID: <1704850e-c461-4ba1-9a01-7fae3167bf5d@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:18:31 +0100
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
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM8550 MDSS compatible
To: nacht@dxdmail.cc, Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX0TtkbZONqzsq
 6NEIamKFZt3ch4Lgs9133KRK4VczVH5krlByXMONbDM+Oi46iioE65j5t32xIohTIEt2q9zm3Q4
 JFBlD+xwuztWW+hz4P1izJbWDkz3fieb2KVxZFnhaQHX0w4UtZCMb+n15vhK6LlqKyxglcR8gT8
 QNFIKx/qPq+nboYxey0w9f53t6XnMdR6dZNRW2nc7PScn4Kv+wsh9ym3rkxF4P9Iul3Q0d49UK7
 TBrdgi2x9C0gHtOWk6jsekHQ+WRyCx/s+HYNLu60XJu7PNRe8GYDZ24y7OEyHzMwj3i0qORBCCw
 gYm/Fm8eZZpZtFR+msylPjXV0hpAnWIrXxYefcXIN1mgVO5TUfGqAKsrIDX/RxF/GRnGyzF6QmZ
 NXbzqlpTPaH1x62fwWyhxbBGDZVxYmoaG9uLK0rvdt/qDxUyXq4Hzr3yue85vHEItBQBt2TMLev
 C5gFKWdsycB0oYDRpjg==
X-Proofpoint-ORIG-GUID: b_rIazdkXtUqExUD2mfazKuIuSRRmO0R
X-Proofpoint-GUID: b_rIazdkXtUqExUD2mfazKuIuSRRmO0R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX6E6fncZ0BH/I
 ksWa51P8waH0woKkEBJBl0DIwtMbAVYZXnojO4ZAwT3UzUNE6f1B8ftfd9AASanSMymTLDILFua
 ZPUAKzZZJeNNcpBpQYVypaQIWGiYiEY=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1c82b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UwK4q1c8QMLSmQHnhC8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090052

On 11/7/26 9:00 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Add the SM8550 MDSS compatible to the clients list, as it also needs an
> identity domain at boot. Otherwise the scanout of the bootloader's
> splash screen causes unhandled context faults and the screen goes
> black.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
