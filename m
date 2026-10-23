Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743177;
	b=0ixSizhHSKViSA00440Ah2BYAkR5VSN8TnOEFgN0QycIfUny9pi46JiZ9TVnzO5pdPGh
	 rjtMiVnx0/7EE74yBuODi6FVKjq2QF+Gn1WcvFeVYGEQ1c1pjQz53oUSmPmU9Eb5Etpsp
	 vJ5UOyA7phZHVLCDCDH5DiCRMiNyTK+Rh+mnr+Ld3Bsdif7lZeFOWOVKD4TnOFXjshaI7
	 sfuOZ7so1lpwoHhx5k/F41KzGfSqQUKf+JhiZBLgLvENs4ngeKpvsOjXJIs07ly37YoBr
	 tru6SDe3A7KHE58PJNjiseo7/IfZl79SvIF6SvRtuES0ULGMYxPCDe4WeridEIA2i/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:X-Google-Original-From:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
	b=FQKtTnVetiSGzFjnZLSzgEMZqYiTT4nc0uznim2c+972SP0ZJiSSlqmxGq8jkEtmMGjM
	 QXV321MBYZixndfmkl+aCprhiQDT5bc2SUVD9l9z4LEeBSw11npeC9RtFEmMEt9Ok+x5a
	 6Kthbwbsx5sD+m0dxGWeuI5h3xH5IIdWZuzstDmVhcbPEsod1ymK07InAJQYHYXFpBbbe
	 QV+sPBY6RN7EvEd8LdEixdLgEA36mqfwbNJmpk/WgNIYBAl2jH5mMC9r/QI0fqZfgmrIn
	 kbQRZe/Kyuif9sQ+B2N/WOI+BGzN9y/cWOFDZdTrThSc4CUOcXMt+Sum7Pxe6dJ7aLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyvWj+ot;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgMXftD8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83871606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83871606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyvWj+ot;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgMXftD8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FSQp587751
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=; b=eyvWj+otLQ0BXr1c
	5P4DKyOze42qntnvS0GIzRTMcrX2YMQcsvWL4X9TisOmvnlnSgnL/jGkiGrhZGB/
	JM4nCAMccp3ipJsz0sPhTehZi1lstygdrYT0d9g0Z5B/gi+EmIN6ynR9rYIdJQvj
	lKgAuES/X0d+AeS1N4UDPko66iKbUghw1jHtZ9EFSdNSfBsFk2A4Qo+qMDgWuklb
	ltwcxdfe1hf8V0ImNLcu44VH2Iffni5PZ8YCf3QzPrGJ5Hn6PLtYNkOw5RzzeWTi
	M8sZTKvIQXiE6IGIzWyymKcwpKKR0gTp0gZEfqk21r0KQt2qKZ5WNx0DtmkMiZLH
	+ZMINw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmat51b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:12:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so982739b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743176; x=1793347976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
        b=OgMXftD8ncNr/PKE5TlrhjqpIQ2POdj7PXSzYwe8VHo29y9I1S3ejcZHgBzyrShfIA
         CyVU6W/koEJ0LY85CDXSFQFhUAyyUXXwAGtP9waFPgPfQ5ZgjmDNUSpwwBlcMuqkucJz
         1K3Of8gLQZcTSHU7S7sAS3tBE7xjJxrtpdJIHpxk09YlYjYKFuJjrqu2z0lP4VgmbegC
         KhsvYIrD+XQ0Tvn2Tt/VuGVk3bJ4LGC37WrkB59ymGVkTq3O3+MiXtZZ3nYBME46Fjxw
         x9ArITPn6y+3SPyJraj23UqQ5zz/HQ5qyVnZBwjrhMenfnuuOAj5qbgPui7WSLvjWrNU
         I5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743176; x=1793347976;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
        b=O+Df/yb4bYLqlQSqc3hKLXqrzMhf+OnogwwVnkVFYg8RomDu8nEVn1MkR1IvLgc+o5
         WpAFfhKStfsV5DLO8iPfbw3ip+kexrm7rPjNuKbU0xC2Ci9KEnnCyXOa13A0nepdIZUq
         ICY/PcD/CoAAnHQ8d0xlZYSD17aARnQ9l/Z/p4WfyphgyCo5zYHUiSFPhivjYfo6IypX
         wJzonxOOWkCL6kWRCJGNJclGk1gDLnBbHhG/ozK2U6Wl3erf/6q0TuwpkT64lcUF7+B4
         M2ABEwaEab6FEnCAzK9nN/rpL8i4i4Resb8Wa9eWLIEOaWUu6dNoaMp13MzdWN+HRyIj
         C82Q==
X-Gm-Message-State: AFq9FYLB1k5+1YWMGsNOR6O1O/tXSmw5dC58grfXPDs53EH4JGXxr5yE
	o5i9thenLQDsCXF/JIXg8ODSQjNlMyuAl5ZvyePZzJ6qPy9CpnOPOVTfaGWxym8l/tdfTgeGymB
	zMtpn1+s6NJcJS57hEIDwTPKO3id80bQ9mA3nsZMrms4tGWVVipgwEgvHcWnkt7g2fpra
X-Gm-Gg: AYBFou2Fs/PBViVZePptR+yhGVc5M6XEmz3yTDIwXNbcEjbqngs0gpiH2V4FfBsnrHZ
	R5m+IlTpjgtmRDM7S7PRpXThXaXd2d8+Rbr9OOXi6A9ME8PVJqzyyzND5rsz8x+DnQH8nrzYcZm
	qeMj6NpKo5o8TpXuUqCfsbbwK4GS/iXM4Ae+1WHjveqzVjXVGIH66RX8kNb+21DNSbvPJhNxK6p
	2KSAV30EF6fQ6Bam2J3NcmyMuT+0NdIm1JJ07+UfUpM9ebxiCGi5WHQu8RaBNu0PP8cmsfq4WKc
	Ctnyl7ds10WkrLg4wUwWVTV5/Jvdl7wGhVXAnnHDGiXyrX8T/0sWDuuFGYS6Gm1ZIuRwVrNE6Ev
	HzipeRR9sx12NA5/prOMOtWxIUHXdGmxVFQ==
X-Received: by 2002:a05:6a00:2d91:b0:8a0:21b2:7c7d with SMTP id d2e1a72fcca58-8a2c472056fmr1403987b3a.0.1792743175961;
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d91:b0:8a0:21b2:7c7d with SMTP id d2e1a72fcca58-8a2c472056fmr1403965b3a.0.1792743175484;
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c797b685sm455376b3a.1.2026.10.23.01.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <c7bdcdf2-1fa4-42a5-a89f-689e688af5ae@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:42:43 +0530
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
Subject: Re: [PATCH 09/13] drm/msm/dcp: Register DCP display pipeline
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-9-48aad0fe4f72@oss.qualcomm.com>
 <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
Content-Language: en-US
In-Reply-To: <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb1708 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eWRtYoRFSfl0Epy3KhoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX7fb1UyIHsMl+
 ijPpDjdMlL+fSR3takphXCGOVPj2Dg+6Z58YSg9oQ7w1cvj/8eBE4G8DC2hHuz0+b4bSlE1TGJz
 oFycyPDFVIA1q/b9MIs2mJaImheudcE=
X-Proofpoint-GUID: qxJx8rYlEKBZkXbq8Hkm6mVtbFJH0DTy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX8ix6hY5V0Kl4
 oUSBcZhrIhVrvBRnQfmgaQ+prmBe4pp6sjRpA2IXCbraunffJBMQXxbdUBHqZop/ZMxI8oXXFNX
 59ckI4kE6AY4fU9KN9dvFSvMrCL63ezoQ0frAp5RAu9QtadsS2qS2SbhhYve5lZ+e8E/HIdx5sr
 5I4swpSEF4HpHP/r2+Cd637IT5/ebngvQ0/jDu8wzrxz/50GXT46xK/aFgk4OC3NEvZ1L+fwIV6
 ykOXZRp4jtOqJfG7UBVpzjb2QNG+TmnzHTGedQ2FoIDFqQjytOeVY5zNBxQVYymK4ch5zmhCcbh
 +lFBvxToCfF7cYq5Kk0t2fn8U9EApBeCsSQD7U0thWu9w2WTBeTxerZQzbZS1dJ9ZWBke+YZkmH
 HXBL6067Elslm+rHgDx8BO2/UA+jhm9086EBgXTABRPARztnlBJtDALyBy2KHWgyyvVYOOY6p9S
 VOTFlIkskyBXKtNPBwg==
X-Proofpoint-ORIG-GUID: qxJx8rYlEKBZkXbq8Hkm6mVtbFJH0DTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032


On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> On 15/10/2026 09:38, Jayant Shekhar wrote:
>> The DCP firmware exposes display resources through capabilities rather than
>> through host-visible display registers. The MSM DRM backend therefore needs
>> to build its KMS objects from the firmware capabilities and device-tree
>> display graph.
>>
>> Complete DCP KMS registration, including power and IOMMU integration,
>> capability handling, display-graph parsing, and creation of DRM planes,
>> CRTCs, encoders, bridges, and connectors.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>
> Your tag is the last one.

Sure, but I notice there are checkpatch errors, should we keep this or 
remove?

   ● env: :3: WARNING: Non-standard signature: Assisted-by:
   ● env: :3: ERROR: Unrecognized email address: 'LLM'

> Best regards,
> Krzysztof
