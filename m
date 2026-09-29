Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA5B50EC14
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678752; cv=none; b=QCdHmjfowsvFsx30s8BVdhs6OIfyEn4Q9mE4rWXjFhfBv0ax+/ug4V7a2PleE4hJkIIXBVdH1Ax2nfvanbpp4xqkctufivcQsOio3xqMRa3BYgJ3cCAHbleTfINmI8Y+M+27f3I2tzceJ8023yA7L5KF6MO4L+v/56IIIcCy5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678752; c=relaxed/simple;
	bh=7oAh9n2HNriIc8pQ7EX6gC2TpA2I2Y5UzF+0ybwLhUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qesEY/Om268BW2dhbqjEOx4pgy4rF3a8vLm2/9xphA74qGkLzff+VSC9bR4ADy7Iou2G+a6qWJPR2FmdfuLxWcGDWYLF/XUmm2xtVxClKq6D+fKsVp0M9PHduMe9r6iKtcApcx3e8qm9pAsfYuPqv9Oe3RB7OBHXxTA49Gmk73k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFM+X9HH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7nIToJr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFM+X9HH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7nIToJr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAilTA3655179
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=; b=XFM+X9HHocuN0I2p
	1BascmweDqw5tOUGaSpmElzjbVtSOBxUiiZMS4RkG3j6bXjtQV5sNiO+Oe/1QTFe
	bA+6iL1pI4I6Uqq9RRZx86HEmyLl2M1QZH925wxjyDEIaKZA4TQhZVe4jmydresj
	prJH7sX4y1x+pyJVa27jskfgAJFWoTQ6M7kzFli1kjsrxtBlCntks54r4+mdeZBm
	OXR4jJyKu23pmg2BRC4pmVQ5wBVKEzgaIoutyRMOdH8NEc712uveYpFwjwahqMZ4
	3Jak2AVkIKyFtYfKxXZXGauuR3dSW7iKjubunClTZyoaokIPPUsaznBcYMStZbYS
	4vTwsg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1g1xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:45:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so4727160a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790678741; x=1791283541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=;
        b=V7nIToJrNdbF49NgdusCVmShH50LT9NFLf8kyioi5bjRieX4WWLj9TIHsiGrbiirCs
         6STD8fU7sy4AB0yQ07cX/t0K5tHU6Y++LXPIs+YF3Oj7uj5yM15WpR096E6C+rl4dN9r
         +HFrTJuUwOtZbhkN6TjIxHxKekgf4iKOns1LSMYdCZ6hX3yAzNwvEEiDs0TfPuvaKO2V
         u7C0oXOiuYndEV+/eeksM9G37MYzjg4sATaLxLEEMPbDwaQviyPNpl20jI/xgaIO4Olc
         z9xXiDCZ+ZaqefDVhdqImBMghv0FyaqIpHGZ7h6uhqzvkkVh+7D0U1WZc/STwtZetxoZ
         ZXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790678741; x=1791283541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=;
        b=kDhm/GdBN7YlixGbiNyilKY93NNJTD7iKjvwFAk6TLm6e1Fdtsf8pPU47/y7GerZMY
         EQnBcfD94PfjAot9EfiVEbkcj0w970c5Budt0D/Rr+HssLom4pXCrGoUyHGXNW3s3uBf
         CS2AFFp676bIqZxkwv4LaDOjAy3nJ8rkTN+6Y2xBVjjW/QlS2YGnvizRS+Lp/gvFEK0f
         fv3jBvik4Nw9t3mCUhWr4L6rz+9HHwUCAaRgdqC2VCc62IeKDi87ajLjDXjxeP8rxJ+K
         aHHgymVPa2iSwo7hnBpJlgt8VOPuRdTqRzinu3T8dVOXIPd3im5xbvbEOGpxmGyft4Ub
         cBhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLRyimy2XHdYIkJWXepGgVEfIYtwwXhcQwZrVGGh8dnEouNrSvEJte3sBQ+wsP9x6HAdxpL6m9q98eogmC@vger.kernel.org
X-Gm-Message-State: AFq9FYL0QIMbW7h9sUmdB9L1Szgv8hRHJWHPRLvuqkDqfRa0cUlVwcDp
	ksQAtIV76oB/1GBSs0oywk0kmDEjZYWJv7IZxcHDWPdP+WirQ6+rdtneXI5K5oEC1Dh5b7Gf+Au
	np23QwNzLzrKMhwjLRxbXNZPSy2oIVc7WZRt9JXLYZYBOjYeQP+Cc2OOMoXK4KJnMRbDA
X-Gm-Gg: AYBFou0Uqm4U/auveASGXLStuxHa470ErHBKYlmJMah90X+ta73tzqB+4fF6JagEPAv
	m/SldfhW3cjgFoL4DDEdE+UyUfkogIIBkmEy0NnoxC1D1zOi/1q7c2kJrM2j0vpkNmOqOpfo10m
	zSTigsgbY15ji9BaaIdIJyyCJ+ikzJfkgRm7TWHy5QNE5M9D/WFe8Cp4Tu8MD6O7VtxuUP60KKN
	xPjFOoOk/6AAWKH1bTIQsv8lviSxjgZqNojmK78shzBFvgNiQd0uRJZ5p4+19VO0T755LX0IcqP
	3sLKKQ7dN/ZTLNFniech1Zg0/z4NhNBKJ7lAoj4DOWhm5IOIADIMTCZFD+VRfhgExhR8MfxTaaZ
	mAMg27P50uV1YHNcT6/TV8+p3OJ2NaVTQg3+3nQ==
X-Received: by 2002:a17:90b:5107:b0:3a4:af1b:46cc with SMTP id 98e67ed59e1d1-3a4af1b5358mr412421a91.21.1790678741235;
        Tue, 29 Sep 2026 03:45:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5107:b0:3a4:af1b:46cc with SMTP id 98e67ed59e1d1-3a4af1b5358mr412400a91.21.1790678740782;
        Tue, 29 Sep 2026 03:45:40 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498057a62sm4907530a91.13.2026.09.29.03.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:45:40 -0700 (PDT)
Message-ID: <16a6c858-1b75-45b5-bd84-3779deb0cd68@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 16:15:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
 <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
 <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MiBTYWx0ZWRfX2PxW5JPsNUaw
 8ZCV4DfFWq7SyNPcWpoDia7HoI7yaL4abS4JtR0IwYvxKhPUqMMO0u+QNiXndqpgjKIQ9iDfVyU
 MjP38eu6Msz8qpH97imKWQegHPhjZT8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MiBTYWx0ZWRfX1p54uq+kIfzv
 +/k3PxW3VGLXrKE4GZecEpzl/0FKWdYIVhFCX9x3A3fuQYDixHoJfewIDzSnX6LEaLlsZH+08+X
 LFgQrKj47/2nV55W46+y6yPTespfU7GnThdOY82sao6XmTvoW1br9RljqK0L/GAkov+SXMPNxcO
 MFBTijMf4XEq4HAQeQxHr/fYJlmDW1aoveKDkeZmr4aWdexEe7/hvILl8zL8qPu66a/Dne2pxZd
 QuvQaES4zIGmuK+gsH1mFwUO8gTvRAlj3jfJiI1/biPwqK3C6tpucc7ReGxBKXupMlmp5nZNkc5
 4MRA3DN37sT1cnDPxdKrey6XejwpePiinwpLtCW8WjsHijw4K11naxccJ3KhiabXIUjuyxoLA0y
 dHcm8a7HHJxh9R/ejj9MBgtCee/oBQW/4rY899zJz/PTkFwQVZPTT4qdL2lRb7RYWhLlvzkMHq2
 6B+Mx9/P8zLpQVPakcw==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abb96d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=uVyU-rc3LnrGhSSI6FMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: fYGf4LkQMDMUbTPIp1UaSZwbG4KH8xnm
X-Proofpoint-GUID: fYGf4LkQMDMUbTPIp1UaSZwbG4KH8xnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290042



On 9/17/2026 9:05 PM, Abel Vesa wrote:
> On 26-09-17 10:07:31, Mohammad Rafi Shaik wrote:
>> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
>> front-end links to backend codecs.
>>
>> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
>> the QAIF block. Keep the node disabled at SoC level; board dts files enable
>> and consume it in subsequent patches.
> 
> Don't mention subsequent patches here, please.
> 
> That is not a good enough argument to disable it at SoC level.

Ack, will fix in next revision.

Best regards,
Raf.
> 

