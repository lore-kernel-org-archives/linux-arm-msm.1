Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743242;
	b=VlUFWcbkK6/47n1amWm1NfKoAsK6ioLOUeGK5y6F9czxOWJFR0QJJ996LQZR3ZcnkpgI
	 vzz8GRW/zxL9rm5CTLNgujywI1szoBoG0gb+pwrRxQGIP8Aba5cOqt7BJir2KKHpeh0WD
	 oLQtpV2vp3CkFFvngdMPTmv4491Tend9KhF8G+zVOkdMrvfIj24VFOp+lACi90xvvSJ2q
	 hkcsdk1759ZO5gTv3KLIoGjgQmOCxri5drHm0s9P/PuUZJEbNotXr7/1KG7j/YcNOO7Eh
	 6DqekslWC/yW5rVcueAgtDi6lyufs6zUq99m5x2D9QgPANs0k7xO29UsyjeX17f1srA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:X-Google-Original-From:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
	b=DcUkPYs9zoSa+sdosOA2mInDI60OC+8grg9KQV7NSdRD8GXRTDbmrxSLryKF8AkoajYK
	 54tEAY22Cff+CCOZLkL2VPTXxTmXr+H2Ey4kiQ5T1ivOJmfB/JhcX1d7FdodefsJIP9QF
	 fLC0mNxRt67juUjKU62RJSUldW0YwYnEMxEugrxvQ9+GkNyR/eDWCD+o7u+60fbIwgPbG
	 hL3X4VMRebT95WkCAxBRYDWWpDMo8ZmA0oAJ5HV+VckM/Rl2iJ24V+4yvIUegHSTaCxR4
	 z633aWwJe4Bpld/kb/QHkx7dsXedU9vTfuI4UP4kvkYkV7Sd0vJgfuUyBR2Ye5zwEEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJQsA8Fs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0FuaQ0p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089B260A2618
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 089B260A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJQsA8Fs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0FuaQ0p
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F9rv3154224
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=; b=kJQsA8FsdDYDXY6i
	a7Kj2LAxWDzNHdXqTYI8OUen0oHwtkYY49xBoELPc7nsS3cmskLKwlLSQuMI1Sfz
	PQ8/BdIr+lSMLozM6PymdpD5dU3HjuHwh4a5XIRnCtneyZgq9dsjQ5LKU9PZL3gG
	lefv5o5fY+/kjDHBCB2iMrXOQpZpJRVbfwokoURV/idtOFD0KAO6VLk0sZsUCrsU
	5tneIsou6i0pqjtKPcEW8Ajev5nljBoxbIg9OCcyzjB1wSvh7gkwUVCBr5gQ8H54
	yDjCWahkVkHcW4MKPCMPHpVtBndx3L+ZDbwKERK5HP+7uOTs/CY8sT858z7Pr4Ip
	NTGnzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmraney-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:14:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so604665a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743240; x=1793348040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
        b=S0FuaQ0pkI6VjzKMlizG3ZnUjauVgPirRVozKYI0Yh9BFgO71UCTRUU3zG13O1d/Xn
         4P0IGe0lD5Sf4jGJftoAKmu4zT0YMvEneKlojMLzTlF4sWMOSrdxBXUp7Hb5S0IhjEjq
         BYKn0dYhhf9PI5oC6L7/G+pTuA08lMma2QYXVQCQeYIJpuHMsNzgoi81eVs35MSSq1rf
         6P7anoX6Azgf1wZazuZn5+gscmu6hm+PZiSEA1lcXyb8pN8+KQgWNGrNDjig6PErBBCt
         nlHirsSmaoi5fFF6L/gw5jSAmbt6nDT/4WevzbxIeCqdqSrJTaj4FrNn/d2cQ9wvx3fT
         COqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743240; x=1793348040;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
        b=NQw5YFzmj86LxAAO33wNLAwyV/4mwt8heIOUWQGbCNA6ZC75+2XjSH30LHK0zzKDft
         QbzuGoKYkPDgcG8m76Rn6VLMR4Hda6WxqCBChiCgr+IvyKy2ab/xoaL9hOpza0MT43xX
         lWURuPoVNJ598we8v4kCi5Fo1Rtx1ThcpkOBiSQ0bB58Hb0WobV8ZPUPGxcd+tQM1TyQ
         /pIm4aEdI4+990W4DkisYi66tdSIZ3cP0Wr/9tUpLwibnKQbMktVJQSIavz28OsYGsMr
         zfTZhIQoUim4eOtNci/nYN3p0qv52Z+lTN1ypSAyWYfNfRIlEr1AXzrHWwMXJpmibOIU
         xU6g==
X-Gm-Message-State: AFq9FYJZ8mHEMjTgtA63wNE+kdu2JFeeZVEhvZPopSAZXykDCXK3Pk2+
	F748j8fzPXW8mG+ZiFNxY+0gx0CK/6KLh+M+Hql6aGkihyF4/gs6HMtZpQnvTKGrcdDKlQlv+rJ
	NzPM1+hNJMwgT1PiWvGpSnEE78DjThqx/0L5+CulF0KqiKKtbL0zL4TcdBlfzoIClKD9L
X-Gm-Gg: AYBFou16YrV9kaWbUpbwBnf6f5hSIg3jY8c0t/d2L13TspxlclKLHQLmOOExLK8kSGl
	wx+eoxU+P/nh9szKfsovKMDfT8YSHNZI6Kdsx5WQT2X7MOGDFZaOr4V5PBeAg8sIXO3xRdsJ/oD
	7mmcM2MNVHtm7VB8jwEnJfj1LLRzCl4fGV60UkIl7bUePTKC6ungk5geUXwq9fDw73RvOmpm5/Y
	SXwV6e98/qs9N943dek1qyuhE8TU6u2gMBa1+Sx341M//sEky+HDKt9ihbvSh8XKhY3MGb1U3Mv
	Ca77Kec3h7ZU8HQ6SWYxh/aVWYHr67oay5rFnAvntmQ32nptjTX/7cZ/dHgoXP6UyHx3fkmarys
	MmSbrQIYaJMRvheEbWXWj3qa94Q7up3djZg==
X-Received: by 2002:a17:90a:d40b:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3adce616026mr940556a91.20.1792743240431;
        Fri, 23 Oct 2026 01:14:00 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3adce616026mr940524a91.20.1792743239783;
        Fri, 23 Oct 2026 01:13:59 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm7758959a91.17.2026.10.23.01.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:13:59 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <4c4e48a7-5ece-4fca-9387-a50c29bbcc83@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:43:49 +0530
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
 <b2cf0c52-4c31-4b17-b341-029b82ddbd7f@kernel.org>
Content-Language: en-US
In-Reply-To: <b2cf0c52-4c31-4b17-b341-029b82ddbd7f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bza33ZIZ4v79f86gFiVRRfmz_oc-y8uG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXxuPqBMdAtR7t
 ScYVhWNHWCQYRPQ2aBvodi3Qk2UsfpcRHBy1ev+ZU63LLxzjxe2rtv3tFsxxO2tOUMzkJDGAKQ1
 MNJq0rPy9RjhxRbz1jUlYAOFFIAQ9VY=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb1749 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=_vtLzGX-cFUddgSYHekA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX1qOnBv+U8Wok
 MiGJSYsokPo2qdZVg9sAY3VJ07Ay2YtUjPw3US5O68aQRUbyLaXPtjjTD0QOUYxbbWnkLCC5b+y
 LyCbpgZKG8nQKydwszUAfCVyleQvHoXZBrj08SOAe3r2uFYv6sbvlNVBiRK0n1t3sN2yxhyDqOQ
 QV/BrMaIrgETtiGnXQlRGyZUNnq8R3IaIv/wqo1gM5sru8eF732eTxXjowRtjtUDHbWdnASwwLm
 oZaXg3b8FEN4MUqGI/3tF+OfXKduDAbfX93Vk3hpPVyYZc1tNykvpLcyvciOr3+buCW8wo6NNce
 39sJxDxEmFD48Y8iDUmGGYM+Ci+MpMFqeB00Snl50am7PxprLNJRAAEEbBaN41xEpDckoSBTU1U
 AsyKuNa6ZlDKEe/4Dd+TrJ4+QrJMZBDpG00l9CGLRbyFairIAqD5QeZ64UIL3EezWBvkE3WfflG
 cRZUeRojq0vLjfTf3XQ==
X-Proofpoint-ORIG-GUID: bza33ZIZ4v79f86gFiVRRfmz_oc-y8uG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032


On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> On 15/10/2026 09:38, Jayant Shekhar wrote:
>> The DCP firmware exposes display resources through capabilities rather than
>> through host-visible display registers. The MSM DRM backend therefore needs
>> to build its KMS objects from the firmware capabilities and device-tree
>> display graph.
>
> ...
>
>> +
>> +		remote_np = of_graph_get_remote_port_parent(ep_np);
>> +		of_node_put(ep_np);
>> +		if (!remote_np)
>> +			continue;
>> +
>> +		if (!of_device_is_available(remote_np)) {
>> +			of_node_put(remote_np);
>> +			continue;
>> +		}
>> +
>> +		if (of_node_name_prefix(remote_np, "dsi")) {
> Where did you document the ABI?
>

Will update in the bindings in v2.


Thanks

Jayant


>> +			if (dsi_idx >= ARRAY_SIZE(dpu_kms->dsi_bridge)) {
>> +				dev_err(dev->dev, "too many DSI outputs\n");
>> +				ret = -E2BIG;
>> +				goto out;
>> +			}
> Best regards,
> Krzysztof
