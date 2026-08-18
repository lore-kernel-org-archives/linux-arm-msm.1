Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C39331EB1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032343; cv=none; b=qvkn4VW5Eqoi55N/VnMi1d15/thK8s7mKgou/ToD6ZBsSm1TK36jDeWQfWW9pU1PEl+WwRdA0jEpsuXDBQQHijh6M4qjqPrIck4tAIkK3rvW2RaQi1XKLa1JFbqXcN8KgG5ut/BTV/8z6gDnlBixXr5PDun5nlvL2auk7lRB/+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032343; c=relaxed/simple;
	bh=Vqa8rQTBY3Zk3hkVDjVZQpf12nyCayVJDNTfdX7cKMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krDkvEvmDETSBGWZKMjQPKh4phcFyQstefGClP/8xktRC2aDUmgqCsmv1AWH92/GzRCxWDm6owq7htinM6OstJA1/KjfcrkyzFYMLJSqfsnSdn8gV58yG4IHEYxEPMEEeJk+LSWo+W1225EornbAPZZKe0hwIrV2IErjlVWHFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SldZMb+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f3wC93tN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SldZMb+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3wC93tN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3FueS3833539
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjYcnSrjSmgMzkRMxQam0GLR8tuJBIbwpiu16ja4GG4=; b=SldZMb+Zwc0l7/OG
	VMJ5pOsnhgpR2d8vJWDIFpUgn9RmdHDUlNOxDuTQ1jPuhIfd4zNWZYhwBkQFtXZU
	5t1uSxLpO5uIbAg0oUQUantoiZCuNBdpwDUOyooVOivP5ujX91pf1tqA3E138In5
	p7ajf20i/n1Guk9Z1wfhuh9dTFdvf2p9jtX1wzQbuUPCgYJGvER9q8h2oSjIkE9K
	LlwMujYMfVLZw34PIqC86VEgA9pOAfYQ158AwCI1rw6qtMtjl+djaoaM6T7XHt3j
	BPLnCBbUkt+apwC0A+IZxEpDEpCRhoPz+IV7DJLbJvrljST7LqCm1DiXASw6AtAz
	9CGDYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba8mc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:52:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso58056045ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 22:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787032341; x=1787637141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjYcnSrjSmgMzkRMxQam0GLR8tuJBIbwpiu16ja4GG4=;
        b=f3wC93tNOUlH2z3ca9/zmOoAAQCWXwE4ncuVAOc3/VwbAVJfPjUJ+GCUIM18q1rL9T
         zAfPrl23g+jpCHFETlBmTdl3wZaKyYN08ld95rRff8Lj/IFyFYihTN+W1v+jTsiLHgU0
         4b8FfNdPNOkCZARUbv9Tw1mLlYwtclOT6nENFbSkSb2inU2XKozUyhxxCNgb0CrgSAAY
         G4ZPZ6bN6id8pd+rFU7Hz34eNmJDRcX7nKWiQH6dVwYuUaj4jmqwJQ6CgIDDuEXPTuzV
         iAk38lcd8zRZtPLDckVKAf5r0NIhOeezNB0uaBb/0CBm5kcHOvmdgLd5KF1LddNivBvj
         PLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787032341; x=1787637141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjYcnSrjSmgMzkRMxQam0GLR8tuJBIbwpiu16ja4GG4=;
        b=qyKgAW+o+4NQW8VQ5GT+MiGSvRkYFoCpRfk5S3MlCCArsfKuC/E5wUtHM1IgZEOStO
         gaOzV7+Lth8bYgq7Nnp/t0CRJPLP/yihAnyBXrWZN4MiTHRkR3EHDg+HHN+ba4BdppZD
         2dGm//WZ193fApqUFfan5hiGmhDHSMMkvwSorNWPXMpq9v5FW9buX5yz8brGDI7iQibJ
         X+zPJA+Y7xINgE1sFPIYAL/KaAuxRXhYdFpbqnWVtFUNuvCxmozdWZXnbY7qh6ArRg+2
         wj8OHyYBbNs0UyyGiGUU3Otk2Y2aOI3tbY8UJN9TlIl6Vb3ei8/KCJSdfP7++ui9fuMM
         47eA==
X-Forwarded-Encrypted: i=1; AHgh+RoXNzzZTCjvQNvQe3pkeyAm3zFSUrSfrYudtEX4mihhpjp7oHrNFK1PKdfl+Z8TIRmkcDBIQhK+U8IKXJHT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlw/ltzXywiv8Tu1BnfsMqhniGQeiZ6jpwni5ZOU3ElONn8aPo
	0J9We973+Fue32J+ssOZ4xehqt2ILzJEYUKEjuTtXsrVf5q++3aFuJGseIZl8HYdjPhG5C7WLoU
	miu1We9Iw7BqSMyWw8rp9DSa9vYEVQ6fAvayDUDcRsEYyNwPpsJWdkv3MSUsytxrSISYH
X-Gm-Gg: AR+sD12q0BnI8L2V/R65Wr5RGdeUvVrEhpIHhhoZHPLfPVqlMsJXnIb6yA/2In6VbN0
	qx58yklI93y5/WHyvNAV4Bx6vg+Vp+pEwKgR9CziN+GKBz+xOaljr0eMqypgTf5BN5Zt0iBY9CY
	ZielqiRwJnPLI/ZNvodOpy57TMPctKFukD7UZcWsH2gHY52KabXjpFn/4a1SGCfhbLc1E9PCocL
	zPrybUhdThIzOJxKVvVMWbDHrajHdVN2i7SOwmZj3CsZf1fEOPyFd2UKwV88yGSl8U7Fw1bVKR8
	1m0kZuuj2XDG62zbgZw/pmhHrDn9//gmafkbWfmlxArRLgoooILFfcYfGxyoQqR36aMPVrxFgph
	xK3wzk3Rq7IRbDamAoLKRfd8Opo0b8w==
X-Received: by 2002:a17:902:f543:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d5c5381b3fmr57274895ad.14.1787032341107;
        Mon, 17 Aug 2026 22:52:21 -0700 (PDT)
X-Received: by 2002:a17:902:f543:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d5c5381b3fmr57274255ad.14.1787032340674;
        Mon, 17 Aug 2026 22:52:20 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ef0147sm10197055ad.77.2026.08.17.22.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:52:20 -0700 (PDT)
Message-ID: <50b067ad-0ccf-4b9b-9116-c95f40105140@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:22:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
 <pm5yr7fovkav4cuat5zqn3ngf2fxzrqutsgyaobwp5djv4xkuv@in7n4o3x3x6y>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <pm5yr7fovkav4cuat5zqn3ngf2fxzrqutsgyaobwp5djv4xkuv@in7n4o3x3x6y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX21b583TiNUk6
 byOeO7UUOBazK6oT9JBKXqroCok2HZB1eWgOxrL6DUzLZduRAuNMh3ZKOZyKEp2MpPKID3XmKQ2
 SAFtYyeQWSRdYS/CZS/vguENadfPeMw=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a83f315 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=5LPJMhapKY6Lgul3swkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5DfJ92fBe8K4kR-I5isUdZ6BGjSh6pUo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfXywMAzSS1v1/J
 okSZqVzVco7m7w+5RMEDZRBi8M6li01uZn03CO4AiE/dYvv0eOrLZdISJiJK8RzkOA/x5mdefzI
 rW6etV69e/mTsHBojLyy/06xVDF39+xG28sIgaWrsn7axPTn6gazoFBq6+AOJpmhoEtNe6MGzRD
 4BFcw3TtZucAy+l2DJ26tr39mNiWGAsQ8GfPAAapLloW+ji2myRJdu9i2u3Y3ckIoPp23oXWi5e
 rqy2LDcZX1zv51qZRRjJmJHFqushMu13GyZPzR/lXF/fR5bVZaWGDyXzeL/twPe1M8wp44zA0Re
 Q8A3pMfD1Htem/C7neGWnkpc/Xz1RI38SkCEB2mscy/g3mLwJyVmpzMjRNLsPqvJg4enyzMAHFK
 f749l1FD0boEY3ZOR2LLcwgAKrL/t0r/FS1Gj8gZlKDBjfxUoEGx+lsNs+Xv2I8MEIYauWY9Fyc
 wEBH4+xD/x+5f160neA==
X-Proofpoint-GUID: 5DfJ92fBe8K4kR-I5isUdZ6BGjSh6pUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180042

On 18-08-2026 09:18, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:44AM +0530, Ekansh Gupta wrote:
>> Introduce DMA-coherent buffer management for the QDA driver, wiring
>> together the GEM subsystem, the IOMMU memory manager, and a DMA
>> allocation backend.
>>
>> +
>> +/*
>> + * The DSP identifies the IOMMU context bank from the upper bits of the address,
>> + * so the stream ID is folded into every address handed to it. The DMA API only
>> + * ever sees the plain 32-bit address, which is why the context bank devices are
>> + * created with a 32-bit DMA mask.
>> + */
>> +static dma_addr_t get_actual_dma_addr(struct qda_gem_obj *gem_obj)
> 
> Let me propose a very simple rule for you. Unless you know what you are
> doing, all function, struct and macro names should start with qda_. The
> to_qda_foo(), I think, is the only example up to now where you don't need
> to have the prefix.
ack>
>> +{
>> +	return gem_obj->dma_addr - ((u64)gem_obj->iommu_dev->sid << 32);
>> +}
>> +
>> +static void setup_gem_object(struct qda_gem_obj *gem_obj, void *virt,
>> +			     dma_addr_t dma_addr, struct qda_iommu_device *iommu_dev)
>> +{
>> +	gem_obj->virt = virt;
>> +	gem_obj->dma_addr = dma_addr;
>> +	gem_obj->iommu_dev = iommu_dev;
>> +}
>> +
>> +static void cleanup_gem_object_fields(struct qda_gem_obj *gem_obj)
>> +{
>> +	gem_obj->virt = NULL;
>> +	gem_obj->dma_addr = 0;
>> +	gem_obj->iommu_dev = NULL;
>> +}
> 
> These functions are called only once. Inline them.
ack>
>> +
> 

