Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9FD49F118
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357468; cv=none; b=ikJOuTmQBpuHkdRLGbr6fn2Lrkv5D5aUn78H6oLuH6GqmhLr1MvG+h1wnQ2l0WKIIUippDVxihlTBt0Nd2IIrwWqyGl4E1nW5B3MXAnx3zErma3n/4lE6Xzg3bc4pHThh94p8NVeWVunvTR5VkfWDg9LNx/r0WIJN53ydywiguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357468; c=relaxed/simple;
	bh=mbPB8TJm0SEs/kNNc3al0XqMbhDTl/navwPpGCPdZA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=crQF2PeT529PvQeWNkhffIIUYyjgL6GozpgQfP6/N3kVdomkKP+NHlTv7Jt+8hXFhfx94VCLr04/+TlfaUn1d9mh0JNE+qed28VJaDhPTIm+FLzfWMpaYn7M7qTA0MxdVnZrTqcdLpnLIQoKW8zqG38apVevKfUgpcpxklr6md0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwHmFP64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfqHYBGs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwHmFP64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfqHYBGs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRKRO2001894
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 13:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihOODbYYBl20K7j9RBcJCe+Yb2VmHVhiJmcPvuSo0v0=; b=iwHmFP643AT5acfS
	hqqwU+mB/Tb/+WOAtCM6VRZhTk4QkyeuTfyrklIkCVu9DgwzW7BRJHe6pjFj/PgB
	dl6I8kyNmVsVRHlOIZV37LQZRt0fHhMAh5C4dK4t5zY/Xr/qYjHkLBhNHzzlIfji
	AzcJqEMRbW4CSX1ORST1RIMboKKqQqcNe10gGqddmzm2oykjOjJIkhpcGX8r3GEV
	4WZ2LzbhI/YhbWupToBjrJl6u2mXpZACj7GBYAPRmzr1YYQCtCFHt53UOxjIXM3F
	7GEfg34qliJEKsucJap1zuLW5URY3xGjtpWeLZJK8gOJkDh04mseGGwgsLL0kXVs
	lNDKKQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy13fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 13:57:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97bf9097592so16100241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 06:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788357465; x=1788962265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihOODbYYBl20K7j9RBcJCe+Yb2VmHVhiJmcPvuSo0v0=;
        b=PfqHYBGsXZ9EDnwsFvVm4uV/bHDV7kMMBs8VxttK/zn3CXSIhgVOodeJYfZm0msOmp
         /EK3NcIEx71v1LUXIR6sERBP7zA5iyhZkdDDticAPfA6tNb9yqGNYpg7/0DRxZ9NUxn3
         DhtAUMt6IgjMggto9gENl5AZVnSjGh0ZNNMjLumUNN/n6A6J/SI5h7/x7y/2wigA35DS
         UDZDdNN7GeCOPUe7JQigus4MMAYuiWdkePmb74Ep39b+tIUqtkiDn076gPC4MHi1K5TX
         oOHitX1TcE/vsy08IQaU73UB3lEGovB0LEUJ0bsNhAHC7JaKzDhtQA+Oy7Cg4+6N1uSM
         LRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357465; x=1788962265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihOODbYYBl20K7j9RBcJCe+Yb2VmHVhiJmcPvuSo0v0=;
        b=tHCaMyfBPUhxiRkG07VL3dEEjP9aUiROlYGsMunwkyi8b1GJqQSKGH/Siu6xNeD0ea
         wtig1MBkE1s0D2KkjqFYrSDPuZvy9qGEzapkTisEAHBdt+hB2RqJGGyx6Wk5lpmBoBrK
         G02pW2Sb3evINWdoHwU1VicS4G/JXsWcK1THm2yGxzhe7i1YP6ekA4/kElL5ILi0+RkZ
         bC9iVpusAvs/SQe/KKR977ST7uJh1Tjhqv0c8/iK4AEv/Kbf5ytANQv8PjRmFNNMNbhM
         fn+i4DULy53AMH86nxsdJBLDLUYRGuwGrC1IYu/WfSqa0b8jKlnjcC1y3uN6TST+mQWF
         voKw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ+df3z23ber2uAcC3kQgFnlD3tRCcUE+nNFJ2pjbrVbmwXb0QQDtx4FGPKC+m26GFnt5UmsxQjBSZhd4P@vger.kernel.org
X-Gm-Message-State: AFuF++liaorFwLaGbAK+cl6PChyVdh29280BN+MEKXpYw3efsRB3Gi3y
	I6M2dLQuOWvSqxviwyKaFjL6TOB9dep6K0bg+W6Bf4JwzCrqS2PqzRBF0A2WzZ5I8rMQhZ+w1qE
	FOLIlaCRet89yffi8VV+ePB2R7zGeqVt4qFs6+Od0SybquWnVP5OICfD+Bx4k8tlMd/ul
X-Gm-Gg: AYBFou3WKeVFzyLNYGrCPyphP3AnOJtMop53vw719kbkjq4FWEj2gAMhUvAsy8o9eo7
	pNCogrWgjNRMwj8vMc11sw49iQIxfVdsTiuMpCIPGpdUOFmgYS0N+hkHdaPNR9ONRgwN2NmJ4nY
	QJ/kWmgovG2NQmhZNgZRSpuKS0TiDI6NjHqKEAUGb+XTkBcTeN70hp/M0HL8FLieP94xkxHAInh
	t3jETdm1KbbIekrXraM2Y+VSZHEimP2yVoK6RgQnJJA7R795shf1NxEKqCGSwlfHaR+/mUwJINb
	EKJUxFIQGnV2C2RBRfdNfMdu2BkC1LBPvZpoMGNezAR1nRrJRdbbfJTL3IdJcjNX1Gz+QNccFkD
	sJ0qg5+Gfx8PBq/HyOypD9g==
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr637111137.0.1788357464834;
        Wed, 02 Sep 2026 06:57:44 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr637100137.0.1788357464435;
        Wed, 02 Sep 2026 06:57:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad006e0sm5819851fa.23.2026.09.02.06.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:57:43 -0700 (PDT)
Message-ID: <16304e5b-9be6-4f4c-85b5-c03a7ef67d23@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:57:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a982b59 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BVw2MW3o-W1nHbPf4OAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 6TbeaqDwETUvKEOqmTqTXJVx-59TPGk_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfXwlMaISh23w+O
 Jrnhj707BktUmTm9IWw3S0xyWUbZNcHYUx3O6q1bZN+UrtaFc9jZq6AOczc1nQMqE1GTtV/vz+L
 pchYtzUwG0xXpr3gFEYmM/g2p6XxEAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX1M/FaHwGGCfm
 g6/PdsW70CWBrTDKs+2nhj+gcGXz7ydyFlfPWpSZJFXMKXxBVfl64j5KsiWuQBI9KUWO232iUnc
 FBbOQEk04nI2t4fr0FBmB9jWbjFyx0SdJe0L2JFrxgPg1cufQLvlrzYk/QWbDM30T7nDPzmjU0l
 UHwYLVcuRQ44fgI41N73cBugg77CrHYEStxdf8TUtlTYA7yXyK6KiyilFBGaUV/gJfVUFXbwGh3
 un8z90ZYL1+MGApOpEwMWcPRv0YpS/XyrKzzmIQ1+HAnhCSOK1ejzqkEHKlgMxlu1rKPxBRWCsy
 6T7HbYtnqAbe7xHkgPZ7zPoCqgH3DzEwpkDjYhjUSgh0ZoH/CVvvOomcv2ocMQOmmkocBv78q7p
 R1wdiODnKeUGDmz1xhg1HW7C3pu0kkHhuNKw/ueTTsDWS4tHcRj6NmwwT9X8EXC4gSR65hN0YO1
 XqZZ8pStiw6+KPsaNvw==
X-Proofpoint-ORIG-GUID: 6TbeaqDwETUvKEOqmTqTXJVx-59TPGk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020123

On 8/31/26 5:21 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the SPMI PMIC Arbiter node for the Nord platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Indeed there's only a single channel

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
