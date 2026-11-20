Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167420;
	b=RqfZR2S1ug5oBgkeS+uTl7xx7m3P9rmzy6DrLTFZ+yPfO1B9MNCPWkWKSbhIImsoKFmo
	 nhjbfHRdUjpT0g2Jkk6YxzkaoS3/AmQqIxzYTgKXz85Ihpw0nJrvCy1btV3SCUaAbc8iR
	 yPh5wwXP2GcMo9AToAurywIRWSovOH4TS9Hjl+OtIzNZBPVwAj/W73F1lYDF7PbFJ/48e
	 wab3QtGoCTGmRH42VleAkG7fFThUGvHdl9gvdTziF+6sGlCjF9tFQeXnSW6kWRzyxs7ov
	 n21KCtDeVSKkzCvKjzaoeCVrogfuh7CpGVWtjubkYGvF/C0iPXIC4o6A1NLNHOQp6Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=;
	b=e/gpEs3GZ6WXZHbtpttxIh3DRyKY6j/BWYpYkSJLIo4idKCl1dSp/E1dwxNJ5VhYWFjD
	 /dY1TpBXfUihj6GLY+ONHj4ifF/TmeYp7GnpTCRMw3IJuToI6wXTsAzFFie0P79Rh7Ib9
	 mvS5QClVF7Sw9qlMsE9pxWq0uxxz5ewaBgqj/Sq2Mmlie6FdgnkKMEko2NpVTG5cCrzU6
	 0BtPHmeEfpnm8vfQFoCYLKZhhuYbStPim9swSIercAP2eQgsDojbOyOLpmMH1I+85NWYG
	 D5VXhwZjZGLqijAdGHa4vrX8+p900LB32B5DLXs//0qx5k4sPxOmCjFvtax4P8obqDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+2XMwXl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K2wS5+pS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E86660A2602
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E86660A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+2XMwXl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K2wS5+pS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewUS605905
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=; b=F+2XMwXl2VN+r4ce
	HeaKZ/LNm9kaNf9UWO2fLOQe34kupTxy/VEmHvbVKWX6sxJLC2YIn1JCLxvS2FZ0
	5++WVRDcJt/nXIkU00dtUNVtjPSjDdIMY5tGRemvuBy8CE33vWs0K4D4hkOWqgMX
	Tu1VmK7L2+FvEXCq2gKwFhf/b2BuPbbuy5mQJnBsgPRhYE6KPCEmCoNCFK2lIgdK
	pNLH6oNq4HYDhQlktyAECeJ0MJv8Lyiow6wqCexq5yuyilT2YUL81tgTP0t18PeW
	UvNqn8VbsZgsnAGCyiw0BdP16NTGefl8PdLicZzyRAQUD2m2dwfq73ThWZXU+q6i
	UvU02w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrv5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:36:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so763603a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795167418; x=1795772218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=;
        b=K2wS5+pSxJhnWrJW+FtcR2nRUJIgtfaMwvROnUAPpDqaos5ZbjwezJLDRq9En1Va68
         AAFFN69Md95asOyzARORtdr0PMIurtScH7uyiqSL5IshHgj02TesmCVP8D++A9ML+gvl
         ozbpK4VDhQ8j1rb4u9gATfa3c1zj8BQXP17wBLyFHy0wLI8iledTHG49m6XrS9wQujjE
         4aXf1C77FRy7bvecVV5HjKJ5rrbe9BAoTdRLYooi1GVp12lFYtW/DhmT2bjkt7cYJm1G
         5BcM1eDZloDr4FeSwZtUHihUYYLNB1CabrubvtjM8Q0nwyPn5HwWyJhx41Npj9+Ba869
         s2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167418; x=1795772218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=;
        b=o0xUqSgJ4uMQ2D2bVfj21Abv2SGcahg7qbusk5qT7Fy0Ym/EuW09N3odZnDz7S0qxx
         M63M5ckwFwKYCi9HmQaFU4hwgSHN+iFIHGGifNmtIfZj6bZ8lIaGNv3Onmt79GmhsEu3
         cCr3gc3R0MIG+QhG7SSRPdH8pal1+hDiBX/zNLQykCX6mf6rYdk4sOQ34i3Z2sGaE7u4
         MNANdwB07mmHMf5OgZL5Nw6LOOAF8sVA3FITTXEQOrwye0OIe250DZKZIpWJ1A0AC+aV
         4J/XERHLpV586AMEuXlH8lxSsvVLm8JIz3Y9h27mX4SXB63nP8cm2AuRXBb3gxonh25S
         50IA==
X-Forwarded-Encrypted: i=1; AL+hErFGFDb70/sIN2bFGjobsZO3y1+pA3pvzBkD4xpSt3BagtLmNVqLs/1/PFG8gSWr7szgvKi6TpJH4QbEQZ54@vger.kernel.org
X-Gm-Message-State: APuU4Z+CTHrZ+bTPCc6Z0ZdmM2nRjdw7OsoQ93SNMt/QDjpKFXsAQSOA
	wM3cp1ZDSUo5qa7eAdYPOQtX+MNj+1m1aZNIVpKpC1rzXRuNPkFrsum3yDplzC3MARrLGcD/qda
	hDnLYS7vxCaMYhgZFm2qGGA/+WZ/XXkkULoV7ll341CsMO1OoFhl87YsyGP1dCqLiI8OY
X-Gm-Gg: AZFdTZcUmYlWCFaLgimo5OjvD1T9J09ZjQCSkQvN9bnaDUrnPDN2jJ6bg1HiRipRziM
	4Av9/rmQqoQw7d87tvWKSmdMbLKn55FP5jldnBvcFJT/3rf58ebgmIVK/tSHUawZDt7Je8aHUcT
	/bjKRs9Q6l/vEvMOQq0CnfDnNwfNI4GxVeihBOpn7ZQWR5/X1mNut2W/xnHbY2Auiik7sblxgUw
	b15OS4O4PUQQc/wogaVuXmBl0rQVR4k3d766bzi0CATyth6IufkReE78JA9fZnIByZOuZVw9RXw
	PoVHNufX8pGT1SN86YOzYgX4s3nuR1QqaXhwIGZkMV8wTnPhGJZh55pDM9MGC98wPdRGaKhyb00
	rqegeuvsH6I388+ozlXCT4ZdR3CKwv2gJ2ghTpFPgjiZd3QYb1Ygi4X71fw0ugDK73AkNY4vPKn
	0cC7/Ctw==
X-Received: by 2002:a17:90b:35c2:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b41c8e0c7emr1983730a91.18.1795167417630;
        Fri, 20 Nov 2026 01:36:57 -0800 (PST)
X-Received: by 2002:a17:90b:35c2:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b41c8e0c7emr1983709a91.18.1795167417198;
        Fri, 20 Nov 2026 01:36:57 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40548711esm7000212a91.0.2026.11.20.01.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 01:36:56 -0800 (PST)
Message-ID: <a116e2b0-8857-48c8-85f6-be3a62325515@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:06:50 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
 <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
 <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX8UW0SHf4fX9t
 G4ghL5lRmWk2fJND2u+DMOwNnPy86MECmu5Venw1OWhQ6GxR8zcGxcQvDY23Ngi8HfxhCE0Ubj2
 k3W1byLSfLal+jG+rDiwoAZpE9B9UgV9sV16s7rKB4+tBM+A3NnBvnhNKyHdLTbZMm/rVAiRqk/
 Cs2aZXFAXerq3kNHv5ilvgqzPKOsqlExXaAzlYWUyKGR/ZfTOGYgEPJyv5Eh8NNx+j5CIKYCtn3
 nbjzMAV53KJo5exB8Z00ivgxWEtjgl5Co7cPeVQLoUbucT8fcr35dnQ3a35HQDoLcXoletsjeBM
 MoxIPyvG0VJRxmlhX4sGA979Krv7lP8yyQF5yh89hHf/I88uLP5aO5kGE5wubF/C71YS9tIjRgo
 Ts7ooC5SJ6ziNZZfYnDzZG5aBFmvMPMP/j8inKgAnmByvWtTofnuPGoExjAG3A4g5rO6/9ThzVq
 u/sWdIq5ZqCGVYIomEw==
X-Proofpoint-GUID: gJ7HG-5BZencWASa4UkADMwiW5NYiX58
X-Proofpoint-ORIG-GUID: gJ7HG-5BZencWASa4UkADMwiW5NYiX58
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX+fxZQIc1dxtE
 iq+Thyzbnv0bVWkyF9PzasVh42nEqfCd9yaEyiiDxEROf9n/FZuoA9titqiPcRc9hYKVLGigrvw
 Bzs2A82CkcQk2mYP6LK3HSOmTEoDtec=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0014ba cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=H8OHiH52VRMc-eBXeh4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038


On 18-11-2026 06:25 pm, Mukesh Ojha wrote:
> On Wed, Nov 18, 2026 at 04:35:55PM +0530, Vishnu Santhosh wrote:
>> On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
>>> On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
>>>> The RPM message RAM is shared with other subsystems, and parts of it
>>>> are not accessible to the APSS. It is expected to be mapped as Device
>>>> memory.
>>>>
>>>> The "mmio-sram" compatible makes the SRAM driver map the region as
>>>> write-combined (Normal Non-cacheable) memory instead, which allows
>>>> speculative reads into the protected parts and results in XPU
>>>> violations.
>>>>
>>>> Add no-memory-wc so the region is mapped as Device memory.
>>>>
>>>> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
>>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>> Why only for Shikra ?
>> This XPU violation was seen only on Shikra, and only with Linux
>> running at EL2 (KVM). It is not seen on Shikra when Linux runs at
>> EL1 under Gunyah. So, I kept the change to Shikra.
> Thats not explained in this commit, why this issue not seen under
> Gunyah ?

Under Gunyah, Linux runs at EL1 and Gunyah maps this region as Device
memory at stage-2. The stricter stage-2 type applies, so the
write-combined mapping from the SRAM driver has no effect.

With KVM, Linux runs at EL2 (VHE) and there is no stage-2, so the
write-combined mapping takes effect and speculative reads reach the
protected regions.

The region is expected to be mapped non-write-combined regardless of
the exception level, so I kept the commit message to that. I can add
the EL2 detail in v2 if you prefer.

Vishnu

>
>
