Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2209B4611E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388539; cv=none; b=SjB/uejdyUQtGXyKRtf2noSQIpTMkdZJAWlJM0lqgNSAz9wGUM4n9f/nC/RmVb6T0MAb2fNNd0e9HdysZ89SNcEj6PefuPne9lKs65l5bYKSIKauFbIMLdBj4DaCrUPjIVzV2XIYpx8dpqXoNMI+jplj/cs6RYc49st1SD9xCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388539; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DtVrPST4USVDuhuMPAbKVGyZxDjMkajd4HpkMPWFy/cRypfP5T/m9vIdx8GWp9pSrWoUrTaeDAHxHZ0eznBf6TUa8XxvXbTYLCiesc02hJfAerI+MsdLlVwAtDt0ikr+jrph0rx1PD4CRwWAkK/ERixOc3T8YuJJR4lkdSWjg6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3+NdD3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYPb3RRd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3+NdD3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYPb3RRd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8wv530991
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=V3+NdD3yWu5yOc78
	hCJf7MuzAMU+xjqGvaDB/5FB9PUqPZC7bZ3MeTNRjJVbpFWdLPVxVpI2l+JWUg8f
	bHGc//vhzP3W6WJruUhjdoy80HBl4KXBBQiLF+oSbUjtV+CRWmhomBDGCc8tDgE1
	AGbhBQMWY5uweODDA5DFyl+CYEvX0ygPIk7dJzLF3xugLiLSYf5MtuMXpscky5+e
	WGqsVwwt7EektvHZgVLjrTNkujQJdIS7SS8BuYKv9oS4R1iNzhyoEcNVKyDG5atD
	c43d3aSNuZi1diVLJxGh0uYXFz/iRRjEwA6j+P23hOs2jyvL1Ma8gP170kXgtz4F
	c5V2gg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstctc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:22:16 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97b57ef2bso22397e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388536; x=1789993336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=aYPb3RRdJ852tVHjz9tFqR/lYRLSVvDbqRZUEFNWxwUnYD0+zIWZcZ7u8VR+YAhP2d
         X0BFCP9+ljLe8ta5Ki7dr9UKlE5lD1ZxqY7KpdZbM59zIIPQEdEC74ghuQBeNJtM2+Yr
         AW3Cd9rF26t1QDVq8L3BPQfS1XlzB5nEsD7nl3P9HnVzY8WewmqpeCLzdNxOXCJfeF+n
         11jQpYkeE/kYr42mzVP2LD8sDW+c2MBxBE0QwknBQcVqRshIV0E7zbymJ9Rrs2DPmrMI
         6/Ceh4D9SfloUwD5lXt/GayPIpdu41ZD2GP6OueY95vTP20hBTGalFtcsvUUnYUtE1Os
         K+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388536; x=1789993336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=P/RytlqrC5MJMlHWdA3awvyEfVPaQlM0NuPsb7UpPvt+asuan6m/GRsalS8V0MXh7J
         cponalS++5MPSvqb3+d45MrYGI8s2bNpTy60VVIziBGo8NBIn6a5xIPb/NGbhya3dW/R
         Rzb9pnbInn8JHGo6J1wjS9jonkSPcTEwX/r0DzGNYcVh6igRGbhLaY6XvJ3WCCBd5xok
         xLqimxWLpYehWmbAJI3EJ6ZoTqq2Ze6hXxaGhaawcarFfg4a3R5CQohqGYRUN5wiLpah
         NKEkegmpnG1+xoUL53rCu68lqDM3vo7cQfEv9s6+inR7o9Nmb9SvfhOKGJzMbdMyjo6s
         B7zw==
X-Gm-Message-State: AFuF++k8vFmu+0gVXsS8xqWdTgnV0K5kFWyHCsxNpjzPfLTvNeU173HT
	9Yh4WLF4atDRUyww9QErnxynGFBMLjYeeho0D0R641uWFssQvPgsfkZdD4uAEa8ZQIYdLi4x+pn
	VNktdXxrJZQeItVQngPB7DezVXJp1mMr3zsRlzb3v+tcOY89W6YeBuWvtHhFKiVvhKIG7
X-Gm-Gg: AYBFou1L+eU1rTHJp7ZXoBCwTQXboabgnmeTax2Oh5TzvehC3oSz7KF5Ho1/mL307Xr
	u2Be0XUOCTyimxZNnBH64eL1aq3yYnx1SbynbzsYs/JJZMzZ3jjGig7tFB+u3LNdcjXSmKZTURs
	15QyfK8UuuDFUM6rp++xhIJk1JS93GN9BYQeGsjLtGNLTs1/uFqQFOwMQVAYE2voWCZhepZoB7d
	kM0j/tZ/1uVJwJoVwDGBoeOUgsT/rRnWIb9m+AXM0A82KqDINkcTrnIHGHzfP6aiY4Dgf7wa1aO
	bVhElSTCfXY1qjLPOftsoASLyQZfOGkFw33Z7s3TR6GNMNSkyRNwpRbieqUnrzQnr54gPHdAQ2g
	vqk3GG2BFqFhk7yR4YmTbBA==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr373750137.1.1789388536199;
        Mon, 14 Sep 2026 05:22:16 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr373738137.1.1789388535775;
        Mon, 14 Sep 2026 05:22:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0471b6esm2391714e87.59.2026.09.14.05.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:22:14 -0700 (PDT)
Message-ID: <1f44c90b-a8a9-4d9c-9b98-3412b9086b3f@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/31] arm64: dts: qcom: hamoa: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX1DsgI2YUpBFg
 4LV03zDC2pV93aseuExNPhzQeH02rsQT0rCWVe10+tNpV9C5VK3+933BMzwzycSdlWTxr9WHWrk
 YbxojZecA3QlAnTq9eSLw2+0GAIflmkSBNJLwJRBL80Z8fxj6apQTaih0gS6KnvE8tR8pEVMdAP
 WO81JmdkQ+p9AWEkl1GHz5dkRgzLGut2Y5oVNuE2z9I32ClhQAkY8bAzCO7zxp7DT5wJYBlXdV2
 uVKiJ46wBdtycjNbZkn5VDyX46w9r8zncAWHDnOGDDWZwer4ROxg4tIa/TOR+myt+jKVIlFypcM
 rli9c4lJNauCLxF67wLp7eUSG9cejVT5Bv/BmV7zXbFH0hxIxZ7GClcBF0PINZUlvU22I+5an0k
 /kQt7v/5/QfGZdESg7DdBDEOhmQC+18DEZBlVOuWzGvecS4o1e6yL0wYezRboxTMSfcj1LCvF+a
 +cZHCeEXG7fpdMbnJbw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7e6f8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: rs9fCFZNV4RRA-mty2Gqa19kic0OKA49
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX5VY4a9olHiUl
 ZX1ohqAKXCtiz0hPCIO6CXeOIgYSM47t7OVtRUXb7yseDNZv3Glx9abnqufLwSpthk7PJKKk9G4
 2r9P32UdJa7tFevzH6OTjEYH4zGJovw=
X-Proofpoint-ORIG-GUID: rs9fCFZNV4RRA-mty2Gqa19kic0OKA49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
