Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185824;
	b=DJHbsGUMZk0Ji4NU+37IZOXexbo0E2qS5ugIQegH1MoF+/L9jgjTqYGHxu8ClUinq5Jo
	 TSH3tb+8L3mlnWEBS//YdpinUw697kXkMfnTNcKqkPJ2p6p/8od+8QHVG1qzZMz18W9x7
	 LinOfT8WzBxlkVEQik3dn51esknf9dLYsTjTcmMV4DAUrhkjBFFvmpqyuNecw2W8dVy/Y
	 1Jb7f/lYIp5sd/yOJRbhDZzsctcVSTf4wr3FZTTtbokm0dHdCdDus0ZE5uMYPz1RfY9HF
	 BbGmxKCWcOqlTwWPw0V7omC0jv7uVHBF13FGlZw1ZPbRlBbcFW6hu4saYtzYfnvbYRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185824;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=;
	b=IPPUs3Oc9mJ7AplV9lUThMwyiqNpAd/wuTM/e3wTBQP7HyXEIQ/RcPGgXOiyzxw75/sF
	 O6ipqElHTuw4rRbc7f7EYABBtl4lXoIEiWgxXrYA3sOBx5OHbFQPTBJrRHUTff/mOAV6w
	 172MSp1s1DAvuAekx2ocUJuT56Im2D3IbHDjkExmadEFnwqPwL4U0kq7kPqEo+1wLjwx2
	 0kHujtCJuM00n5tcRdwcf8oAtWagg2OsOImAmxEQACjhgOi4/52xslaVcOChNnRbL1JSK
	 lYzNTuraxVdMy7kRpHFwmL/cP51Qh7m785Ko2DFqiVsVQa1wUWC8oQp2QRQXAv9TwYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B0W7TcKH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZY4+pEw4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF50606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF50606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B0W7TcKH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZY4+pEw4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KsbC1101773
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=; b=B0W7TcKHoZmbnhJe
	xQfsL+9qVBpPiG60ubo+Uosw2UOGOOoKXBeZh5hH3inv0s58sOmmqNHyUlXMIt9W
	pLfkXADu7oN2VeCVl46ylXB2aUra8H2RKSnyMkun8mLBQpDjF+Bd2wXqK+Ww6ID7
	TKS1LaQyocGLdUFvvdfEamGdbGvBoGIjAUF3Ej5RdSTzN8hqOb5hQL8/oO+y4yq+
	y1X5jw/q7d+1ZoU7CuXD9GHq6vZCr5TGXUkk08beAEvFgNkYw1PWbVk3MzwrQ7A5
	bX5aOJqZpi/Lcx04rzwVTIQz3GxW2hemDD1TucrOve+NhzLToh09eNK0337bMRES
	I5M4BA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rm04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:10:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso7889955ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793185821; x=1793790621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=;
        b=ZY4+pEw4xzKAWRqaz6YQc/58Jhb5Oujb+SQ0HOxom6x8U48lpwMndD66APvMfBr1Dz
         k7tiOWPttHtfrtfMZ1XfDMwubxPy1blxjcN9G2t7hSCJXyKF9VjriPUJvdVXXf4ICWR3
         +zG9O682HLlIGWRDh4x2z7WEE9eDTvlF/QfU7SCUrQ0N6vpyq/zoqPzAfEx4oHcX5LvA
         Cm9bGwRbvTPB7BHX39nU0waqT32bsYmMSCpiD4iYr6m8g7IOGVQnf9s8lsXV72YuL4+U
         SRcnJUPgrGu7U0ad+5m1x3lyOUqMR+Jo9T6JA9nqE7a7+BWTk4PLmdaBPzNpOMh0/yGR
         4PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185821; x=1793790621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zvZtmIGa6NExyZc8Y5XlEQJuWyGr6+9vTxKDmPXbhw=;
        b=jO8D1uDvdKz3M4Qbd9nz4GLOEGHtb/VPzY2jCH6uGrQXeuGpXHjq5Vl6fSSHs+17ED
         IZdQTeBr6kFX80JU42RgOMYGASG6dPdA1tv94e0LEnw2z8/FVrL5h/fEC1mRGLSko25V
         3OnvH7PRjc4gDTgG9RcCTA59NGhbLT8kFIAR/JK3KBVAHeVV52o9R0cWWG2mn6Xew5Zc
         W5GzsvlRLqY1Izahr7yv5ST7ZsEiJPJskkv4w31dZ4Z7BgeyJ95+vd1ImKOlkxElU1kf
         d6PlKbcvgoQw3DPeAwPqenDRq4ynST1qPCCUt9DeNgzq8PcOC1HW6tRCvRDr4i9ZuGYw
         NJmA==
X-Forwarded-Encrypted: i=1; AKwUvBy2FrzdQIR+cwqzqxFsH/BFrioY5hFkOiPb+9f0uTFjfs3bJNb27Z3/g394plO1FkL0jy3ZHJHxNtFyg6UT@vger.kernel.org
X-Gm-Message-State: AFq9FYK6pyf8KzmH4Lc9iHOFqNrr9mRnBwTVqUMTwK+IWB81Hl+kBEu3
	4F+oVxMAgR4anYL7x8LxU8+Fk7Lk2k7La+Gvpfg6mLN573HhQKabcA7ud+MFuQOmYXmiK0du7rB
	10wrHroz03hD7ShAaWT1f0T3NJUk+m3iOUMmq/bIIEpnjXx6VvLClXhlnDbWsfkwwrKYg
X-Gm-Gg: AYBFou1cd5S60LKgU7jbqXCEiSTaouyEAwZkMzpaK2nacJ315UGsJvmY8ir40eX1R1+
	yFYcAQaTQGbOLlxn5jZdS2InDIh69x+JBDCsJrsBuwcxfv0sRuprxT00ovGifKEafV7GhnC0oR6
	Po/piZBkBX2K29nxjPHdXjnJIwRCAqGFxnpB9Zk11XrUEJp7BQz3/owYQQ8LT1iQwHNzlN97F6d
	LMuRKUMJHSNLRhkHmx449SQ6qrfaVP6spVgGZMn0IJvaVXaQJ8DUPRCZX+B0jgpYKs2k/eKb6af
	7PKiDvJvpKF182/Dhf1lHt2VqhLckvivfc1aj6unrinBWSgbaXW4t93t5JH5mqrugWl6zclxQlX
	W+Kz5EaeLx0Ol50Kkk4GJWWLttrfKsT8evoLIYH+4/D7nguzqOyXc4rDsxz0HR6NY6joHl00Zsa
	ebi5f+BZa7TExKCpCrqIvHanEajttILVNJpGDrx2YrTL60TT6Uy4X7goMQA6M4cIgXXbgPoLJZy
	PKJ
X-Received: by 2002:a17:902:d50c:b0:2e8:3d48:4d88 with SMTP id d9443c01a7336-2eb00242781mr19066405ad.7.1793185821192;
        Wed, 28 Oct 2026 04:10:21 -0700 (PDT)
X-Received: by 2002:a17:902:d50c:b0:2e8:3d48:4d88 with SMTP id d9443c01a7336-2eb00242781mr19066015ad.7.1793185820636;
        Wed, 28 Oct 2026 04:10:20 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eaf77e70d5sm13979695ad.75.2026.10.28.04.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 04:10:20 -0700 (PDT)
Message-ID: <4a51422e-01f8-4651-99b6-f7d3fcc588d1@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:40:11 +0530
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1d81e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VMI7CB12i6EQ-IQ_HUsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: T2SNfItLLSSun60p8LkaQUyrAqOl7cac
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfX7sCi5BkH+qcN
 DPUxXEl37N7CrT3QTvO0n1jbhvbhrzfJaUwgbIX7ysB8KbrZbi8CfFZXJWTNZYVUy5An44bN0dG
 a0YedxnQVRXG8Y7tivtGGhjWEnb93N4=
X-Proofpoint-ORIG-GUID: T2SNfItLLSSun60p8LkaQUyrAqOl7cac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NCBTYWx0ZWRfXx8U9x+7WHhnO
 BuQCCJ01vrTUiBXTscVo+LiUjtHaX2mDuyZN2f1WqEdSIOickj4NgFkZA1HyF9zHB3auhq2AijN
 X3lskCOXWQOtl63xQrqm6xdPLlTYcbNg6yWzhjZPp4zIcA5HjVm7f2kmv/zOmFsB5hgbUNudSIw
 m/VD6sOo0uY/iSZm17WTR94crxheB8BmC9wOBD15dthO2Mq0yabCB9EnwnUQGBsx+Nw+9X5Li/y
 rMuVHa8DnAaNP6xDydjMj+UimFqghd9WBIAViXipRLTFo7o/ai3uuRMzsx2xU16iUPgSKPwcxyo
 76PUWJ6MsRx/gW7XTcPDSIdorpQ6XGKBNQ3prOh2qUbfuApl34EuyhDzbVwVljyvHBCeeyZJftz
 Eob5l+vJJgB7qdgXECUUB8UaF3h1EvLhkRMzKPwBk2YbXElbBmkhRAzswCwqyRaVNtdVEZisN3g
 ne8IIkgWePR/Rm4GlhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280044



On 9/25/2026 2:44 AM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.
> 
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com> # 
Microsoft Surface Laptop 13.8" (8th Edition)

Thanks,
Gopikrishna
