Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737358;
	b=GHYiGhHyHTZJJfM3AiC9im77UR/mkk8yO1KtbDvG4kqsYdRXh7I9IiQAV07EK4XUZsX9
	 vUnZAGds7N1AoMJRCQ1JcvnXwI3SpcyJ1ZsmL0vnqCj8UmnmUWUJ/+MRoqCGoct8dSkUq
	 KruER9+kPutwcrCrJNFpc7Y8TOlDbMCUPedFRUaVaomM3WzZJGc0tTv6pUQR/Odt0FnUA
	 Cz6rSMc2H7sBUV5l6tb52ZrjAexcnSfViVW/Ot9GqCuJlHfDBvSQpFoaPVW1xIt4OCsYM
	 VoqIkjWkZeX4RhVayv96MRh60Wny7lVIBHBgUStKojZDopwiV01UP8URwFxvRhVMXYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737358;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
	b=DH3+fB2oWV/RPth+wtiZWi94WP4e76S7+onuAQ3gMqO2gATc5L2Yei96eRCuIaKl+Nvk
	 Ga2QSXnjwtzrZX+QQ9Mh8WR2uN72ReQzdTL/8NGgtNbqwXTZcF0uukCise+RhlNk6Ktiw
	 s1d/5RCy+VSpNCHHD6yv0WTFoJ1LTFvOc7SQk7JtJUD4ZfKLV7YtC4rHfoZeFxNIMtdOM
	 OhYIJRzkUN4aQowKljAGQw4NUsto4/UXkK5RMuWkOVK/tfgqScv/qDKMAdUrc1ojvQddZ
	 NzsIebMswOnsjEnoIInb6vanifj2t1DqtKw5+IlJedgHWOLKafrZvL0zTjIrTtQpM1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSfuX03Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCCE71Ck;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122E606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4122E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSfuX03Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCCE71Ck
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F8CN425675
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=; b=aSfuX03YfS+94pFv
	7plch/SN3ozY0zca1mXWGPSdS3DaJmoA1JcxwoAjTeqEilifoP+0UMqWYms5L/5I
	jEfZw/bSM+bto/WuOO4pLtU4erDqhrHw/3Fgt/u6tseicUkIIYM1lK4hcLG2fupW
	nL1ZUtv7mrFzGSpywQSImgTozvUv9WFf4bFPaGpZQ/ghpa+wtmi+YZaZLLETO+JQ
	3XOzidkr68huM+J7biySdI4ZK4/MLMwiA+/cZTAYi8xMPmv+aliXo4WLqt93C9sa
	YlWhXgt551LC/VfgAcSsBAME/8fwaugdlWCyPUepAu8LytVA6mBpk1bT1/Cidpd0
	3LF6fg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms28am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:35:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df8484f12cso5323025ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 23:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792737357; x=1793342157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
        b=DCCE71CkyvVIO+hC5WDyWevOShxzDY5Tc8FjJClpH5ulJ4IZjggRDF5fHPWFx46n1U
         fd8IgTqaEIb/jM6j2AbF9zx+jk30aYybvRFYC1sRkQOBrXp4OEplv1tpzsQOcpP/GOeV
         k3k8pS+slBMyETVcvVQVgBvWJRguWDd2Oyztt4jI+CpeCfG3ucRm4OSi5+/8e0E6q39S
         m9q1ulvwY/KdNRcgAbwy9a7M6olvqyIond/0em60VrXRfQBz4hWfp3Rz/+7scvqxl8L8
         yNWp6wW5LEe4uZ02GxK2munvxo91T/YYNJv6yihHiJCJEASZUfWxVrq9tO4TvFk4hjtp
         xuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737357; x=1793342157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQR08uFswNG3btoxWUtA3xdkWmg6sVlnAnw71YgawmQ=;
        b=jiztAwGkvVXEkm7j/npzl7qKDX5TC8pm45lAvU0vpQ11NpD+tRMOxPlhvmlqqxnJbI
         kVixkj5a+czUk9CMin4hm1Y5Z6WRMuHOAMzgmnleI2q0mRMfqxcIUXY+LR4R2nZ3JzL3
         A4O26uARIvogOz8Dp5GdmlJ5YUzi303Hi8OHlqdOL/LzRcO34hdfc4UQP8HkmWexErA5
         2n6K/1X5O8UlchlGdk/9WEBTmu0Reg2iTNb/czoikOffM+cUbur87uJ6WvqeI1DbTtr3
         3AyavENB0Jx4z88fKY+xwSx17haOlOzFEdSylBui+q9J9oOSZXVz0AQoIGJVoKyp/5LM
         vsYQ==
X-Forwarded-Encrypted: i=1; AKwUvByLzqp8inVaqo8VccLyuTNRJag/z2vNYze2N591zGTF79A/sna7BJguFeVEZUEIC+olZ0g6coUvvKKSR4sb@vger.kernel.org
X-Gm-Message-State: AFq9FYJb25vcvpXjwyRcXgVqN3llD1MfJos5ik0vrrYsMOyF4PaIeWvd
	ow22+sIz9DzPCBl17xb4gGmrDWwMoWuc/tctH4XsWghPejznE6/oXBMQSMq0WLrToKj/xs03sge
	1ajwaaSBMX2SQFZOWMyBS2//33OJYelj4hJB7wstHUCzZK6aKCZz1w1wT5lfGkcU4rbyh
X-Gm-Gg: AYBFou3MZDROVvOyoiJVeYZJ5BXDIp3T1BdfZKtEjgX/EGG+0mvzPMVzv1vjk4MzGeQ
	NJEKPVs37DFkwxRHoMAcZDoK4vjZLVZn+AH5SDmJshOq3RADAw3BLWhztuY6cwHtYP9BmuD5Q23
	X8RFttxkD4YvdKVBwS5TGmkJRzU+fcu88WwY9+QitfwXcQycVmL97IcjDEkxvc8glCfH2C+9fdA
	luHC2cXUnlWoJqmfLuTkw37uIiBSelrE5SRoc7ZgnBs5HzRee6qGTcCFIDjp2BYhLWcHpWOef1F
	Xdunpjsy3loHvRswSEFizLc1u3HF5GTCWdXs4zXs0gzHZU0ZqeOnpu3eY2NGgA9LSn/AaYXnT9J
	StW4M25X48pBVv7K1M+2cA9x6fvOD0NoC
X-Received: by 2002:a17:903:4b47:b0:2df:afe5:56ab with SMTP id d9443c01a7336-2ea7c2e93b8mr13960755ad.29.1792737356551;
        Thu, 22 Oct 2026 23:35:56 -0700 (PDT)
X-Received: by 2002:a17:903:4b47:b0:2df:afe5:56ab with SMTP id d9443c01a7336-2ea7c2e93b8mr13960525ad.29.1792737356123;
        Thu, 22 Oct 2026 23:35:56 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b343d1esm6107115ad.23.2026.10.22.23.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 23:35:55 -0700 (PDT)
Message-ID: <adffece9-165b-4576-b111-6aa40a443734@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:05:50 +0530
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
Subject: Re: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
 <20261022140139.GA952798-robh@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261022140139.GA952798-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfXxTzfVv0aFYRG
 62UdAIl4I0+scI1+mZGF/XM9ZIA+KQiqDCR6FZQ7RvoS9rAg9Tsa5h7yT0gfDfNZaGtWC1SEKVR
 w2epLoIbZLqHAbRTwT/6Rk74etG+aenqJia+plHf2tPjIeNDg3jb+5pP5H6GY5/zjzvX/0hJJ+S
 Mp3W3JrRGLpmY/9lW1SQZe5VIBeD1aj0xa8i8GmXY8sT5NjSG37LLTY3qZKUie73pWSNPc4HJzl
 8sC6w3OtC+tW5FBrRhlKou9GyOUa9NR/USDoA1PB0Ux39MUBolUbTUvZ8esVcq5qYlvzh0RAe3T
 t7CPRtY2jKIE3jla3/0vAqT3Ux60Tkg9K30CFhN9AN02GBjUhXiDpM9F221LKdXvR6xBb9uuDsx
 hUx6+jwbJocyfIfv6liUD4rDK9cqdWScD5Ha2rR5s+RQ8Y8zgC66OjFLvt5gNbgKrEvqX+CtIJk
 xalaVy4saWdMovpN4IA==
X-Proofpoint-GUID: RiGMc-OYuMNx7sMTk3j0FxFrp-oRzSvt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX9pFwR6alrBSY
 EzBvt8ZtuuDNluLoA7EAWnrxDwBcpAcOTU2C0lg/dpgztAZSrW1cs4zOIwmzZcHzR0lPmWl5GJe
 7q5RAIez1CnjVXp0twvDgvMeTmDOdME=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb004d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=07d9gI8wAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=9ErL3UT9lRrTfhtYDI4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=e2CUPOnPG4QKp8I52DXD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RiGMc-OYuMNx7sMTk3j0FxFrp-oRzSvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230026


On 22-10-2026 07:31 pm, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>> domain, preventing it from accessing BAM descriptor FIFOs allocated from
>> arbitrary host memory.
>>
>> Add an optional memory-region property to constrain DMA allocations made
>> by the BAM DMA controller to a restricted DMA pool. Access permissions
>> for the remote execution environment are managed separately.
> dma-ranges is normally how address restrictions for a device are
> defined. Why can't that be used here?
>
> Rob

The constraint here is access permission, not addressing. The modem can
only access a carve-out that is assigned to it through SCM.

The soc bus on Shikra already has an identity dma-ranges covering
64GB [1], so there is no addressing limitation to describe. dma-ranges
does not reserve memory, so allocations would still come from the
general page allocator, outside the assigned carve-out, and modem
accesses to them trigger an XPU violation. It also applies to every
device on the bus.

The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
provides a dedicated, per-device region, which is the setup it was
introduced for no IOMMU, with firmware restricting device accesses to
specific regions [2]. Stephan suggested this approach on v1 of the
BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
same pool, so a single assignment covers both the descriptor FIFOs and
the data buffers.

[1] https://elixir.bootlin.com/linux/v7.3-rc7/source/arch/arm64/boot/dts/qcom/shikra.dtsi#L508
[2] https://lwn.net/Articles/841916/
[3] https://lore.kernel.org/all/an27PVxkCpD09xSR@linaro.org/

Vishnu

