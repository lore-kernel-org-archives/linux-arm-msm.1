Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700020;
	b=a7MrV8FNiDZC7MI+aCZPkXCyt4OZH/Jl/C8OqWwO1uUutFBhxwEZ0j8cvhWQqKIKbvkO
	 Q5l1z/7zLtcgIglfDblfO2QMVDjrQVWcJ6X511DnkvsjpKzjha7M0/TbFCP64CcluJMPm
	 JVW34R0DA8YFpr91o9Cpky9qRmF9sq2Ls5LDXMu0FqP+NLHXblRAJolVzZ25z1tElSHA0
	 /wdDr+2b3CHB8R9PYVSwvs9GIAODBTJGwn2k6NIdRK2CIW/H9mP3gMSf68EOcdOcCHcO5
	 dOatF1SlDcX1/CnHFkr5n5vQE4L7A8er4R5ZuMGeqhxiLPVAgkS4PwNXafPOlQY+qyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=;
	b=uZ9G64nk2Rfk4hO49eSbcCwSL/JleMtZ0LYTBrjBtx0hN8aKQHp7+6J0E8NqTqlO92Cp
	 cZQ+XN5OV918DZ1J2dk2EbEQMPkeMMe6NPEWA29EcgR63fHUpiFnDKdiaB5GgYt7qb3Fs
	 8r/iUzlnZ+yeMlJQLkYRZ7Hu9wWSvc+EHV0mKFCaMcYeAqWWhfcmXNsxAfhFB9CsEL1Wi
	 cgmeaJG63G6ub8SFJFHbEXTkKxo9fAegGIInK6R8LEJRotMpFSp9ujZMQK9lHhAdKS0Xk
	 PWWlo+jvxwK/nEK5CLEvJbDLKS1cs0ihIalInvfqf9iEjogkFG0/FqqyfcNPN/aBMUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Yf0zCZx/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyWAlCnp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25CE606A80E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 10:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25CE606A80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yf0zCZx/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyWAlCnp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38YpM82106630
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 10:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=; b=Yf0zCZx/Ypb+hlgh
	oaZfNlIE0bWMGtX/K+RLPUHTz0Wwg/Buyj+nq/CiMKiOLobuqXVPSEKKkgjppctY
	qFvHKLboD8JqKHbUSFywllFzuktxr2yAn2aJ1LS6H0cg5g+JACskUXKgyPeMiwbW
	y1dL2Fleg7n+ikBv7AhgY7haz0RQEBiqkkaURO1CsTS7IWCm/VTgGK9MS1RqAX17
	QcM6/373sgRPWF1I41CQNHKa3K+qK7JbxIMjOr9Plw26WNmDbuqZzc5nxO5jQzw/
	mPygQQVxCxqT1WSHg7xvxIuMUJ2HABq+05dLyER6M9qfGA+sq7Dv7uEL1hDaIKTG
	WQuVzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99nu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:00:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e941532594so44532025ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 02:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793700017; x=1794304817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=;
        b=MyWAlCnpYAw9UqcQD/MQI3CSOzwgC3scIGGIbE+2mRAV7BoHBkYGuqTfa+i1sA3KHU
         TZMR/n6td6gQKiuWKRare0rWjv19b7ipMxb121SH8JtxdEYgeArR3fYj3WtE6Ce9EKE8
         t+7sq5HtkHrBQfjT3gK2PtIq1YsZUzuxCkqcFSNLeAJHr/kMfhPHLTSKd/XeLjpoD6jF
         Wx1zbdy4jm4PWiYWhx1tOFgn6EfccypdaJ2inOmMQmuDAE/WCMHtXKtCCtXFH8mHdmqi
         aKCOwSi6y4cE+3xAKEhxfZB7FSYLx83BLvyKeZm+jyJqotrJV0OMee7435pyFd3Iy+/R
         /VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700017; x=1794304817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=;
        b=bmkvcOz6D47kj9glcU8kF2YJD4ebQDvsEJyfZjilHHYdHWEyHRoiZIm4HsBgjHFef6
         Q90o/llrc6yBmssXJbf+vkTMjZZl37a2WzpKGnLS7Gl/7VotjtQIGt2A++QMWaMP0S3d
         BYyUfD6JjM/NQlGI68yEPI7BFx1dVYwD1AirBv1uNfwlmKxr3zgrCjhMvza1FDobIkAP
         yryuz7xJawTksYC5PNKz3AD/RC/IZyCWoVksYd9J7rukA/YtjVgVexEyYBm5ez0GjVWZ
         gTTVrgEA6+of8Mo1V4dccIs4utYxWPir4xNKya1NpPUzlRu2ooZUwvUorAxoVnvVTVQF
         PCfw==
X-Forwarded-Encrypted: i=1; AKwUvBwiEdQfEK8rcPYYMucolTv0qoZNac3/aekrImLeSAklx4I/ey05QzyEDNvu2dPsopslqAgOnKvZmNFj2GCc@vger.kernel.org
X-Gm-Message-State: APuU4Z832vHr0oXc5PKEgHnr/JjmBQElv1NJTZWiia0dxuUeipLo+slM
	XnDvM3dgBBThpHuEngm+PI5Z33XV5kvDnNZI9DRpdfQ0c+2QjhGM2ePSo5X6IkgKbzMfK3MdGEW
	cj32ZcloH0s6D9q7OmunHeZAJFI9d7ysNqb4ziSiers8USUif5IFU8E6YZTbI6wVfhIrnexy4R5
	JM
X-Gm-Gg: AYBFou2xM2C6pCZY3iQ+RuQWaDKt/mY+RFzrKULkAOC4bvdFfByLVyqWTqmYS4X2qqo
	pF/NT5G7UbU/8YIc2fPMVQKoXDVGiIWwpdx58H3jIpfY2acL5YfTwCu1zEcayECDSgLoihb+1yL
	zLv6dJ8slQsZVsAeG1NCjmckurqQWOcy1cJ0bkEU0cdUVyPW57iBtlCsDUF1RkuBVhe8m/utlgg
	bMSh4N10SqXeu8NoNuUgAUMS7X7uzQI03S/MfUvr1ut52c/Trk+6fPW9K4CMYIc3T18tQShWGos
	icDXcHYhfmhgthLDy1mkmWto7L8QeY626mQzNzorIVpo+97EUXd1k0yizFT7IFBk7g4w0ZWlOR8
	PqsPvvjWO7E0T4Eh5Q0pCaFAgr6ck8cS/mfaVH1z6wKK4zRr7DQ/lsMysdtZxN6vbmcSYA2sZkx
	u1n+XF
X-Received: by 2002:a17:903:190:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2eb36401dcemr127984665ad.1.1793700017337;
        Tue, 03 Nov 2026 02:00:17 -0800 (PST)
X-Received: by 2002:a17:903:190:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2eb36401dcemr127984395ad.1.1793700016823;
        Tue, 03 Nov 2026 02:00:16 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eced9d14c5sm7467525ad.74.2026.11.03.02.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:00:16 -0800 (PST)
Message-ID: <08bb4de0-dc94-4c4f-8d1a-ad3a4fce86bb@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:30:12 +0530
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
Subject: Re: [PATCH v4 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-1-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-1-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dyR1vF4MtQKAGhMi9EjPuNo9mK9_JvfU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX2sD9DLFG02Mm
 rLrxadmPfZd1KEbyAOpIeFipHsSSYoGUMkvS1fH1svHwhi1h9OTIIERkByLxp7HPrlmCaNjEZYb
 cTehO9VfA7iWokz4YVhBvrZAM6rW2U8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX0LHILlRDjIwZ
 RCWT9v9yjk52rd47Xzm/1snyeJY/JC5locjNzukfJ4YOJtkw0v9h8vBUebv4pCPoruBta22PlSI
 t1EM6+MtNbkjJbqTYoNtYXgHfWkbb1BaskXuUuwRTAGwShZgIXNv5tGcGlbi15C3RA3lvyPCIA6
 SZY3zArN+L4PmHsb/C/pxD5VDVYBx9J41C5aMhrx6VQym5VXRdO+dD+hPXbKnGa6l/JRcQoZVrO
 B3Rx/glaXSdBcU4jI0fgJHK8jFzJkIlKx1sBvqx0diEjFjtbug5spe25kOBsIxapdehuH3mc3ZB
 QanDGmXOCDu/71m+uYBgX5xwngkJnrt2PQ+hfJXPVTziBL5lgpVlEzAE6S8CLgCTRp/2xyS10TA
 TpDFhX/GhzM6fNsYUsOGFK4069Ut17gqS3H7hREpt+lls/IGpW8e9l/AWSo4Y2saWQdo4csgCsZ
 4s+XgSnaGuN9CXBwN5A==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9b0b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ue_Pd434T0zeNjF84AEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: dyR1vF4MtQKAGhMi9EjPuNo9mK9_JvfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> The I2C_BUS_CLEAR and I2C_STOP_ON_BUS GENI sequencer opcodes release a
> stuck I2C bus, but the GPI DMA driver has no way to emit these
> zero-payload control commands, so an I2C controller using GPI DMA
> cannot recover the bus.
> 
> Add I2C_BUS_CLEAR and I2C_STOP_ON_BUS to enum i2c_op so I2C drivers can
> request them through gpi_i2c_config.op. Handle them in
> gpi_create_i2c_tre() by emitting a CONFIG TRE (when set_config is set)
> followed by a GO TRE with IEOT set and no DMA TRE, and reserve the
> matching number of ring entries in gpi_prep_slave_sg().
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
