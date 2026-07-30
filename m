Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7743E9DF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432452; cv=none; b=un2o9hYS5yy+wFG5OYQxHMMBLrdPstD6AwRjgZIZJDtQCeah3s+Hwr6jJF2UYzmvjuRDkIt/rXSazp+vMU9LR//bIGDIa9Cgki53ssvN2wDhPU+r8pzvVywXLbxXBpphZa6eL45nZIbdYXdFQs1PHkMBkGqWd7CFBQ8YZvKc7oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432452; c=relaxed/simple;
	bh=zMbxMyPCKoEIebvs1f/vEYZFoVZug60d0Za/1x1vW6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAltYrD6j3QGgzIxQhkKzFGLer/mYAQnh62A/DHVOhNLfiiEQuhT3zOct80sUXuTU6g6wX22pji2ecFu3M681el1Xj8lvR2Y+zOG73ZeIlrP9/8YrFL8zUd44cXvJDrR04hH1npGvrecK2XDa5gAjGOuGwP7jrrXG0YxcffOHno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzBpbO8+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHp+Io6K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzBpbO8+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHp+Io6K"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXYYa1571739
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qw3YuRXC2A0da21fG73oZk3vo8d9zbu79PzV9Phgn6U=; b=ZzBpbO8+FyknhlN+
	h0RZFo53tiOsja2ZD2Sale/txmDRxIvIG1/eT9MhCucAlwwXNavshyNvW9K56zKb
	daSQvNF0/QPMwHcnHl+Gb8petlPSiVLgaqPes/dLB5BEd3P5WkxmUfzJMv1rgrTr
	IlSNBOmxTyFjkE2BZkWFW6+XBARVopsU+rFy0/PIbdFhsM51XW+rEfeWKHYk7kgm
	81u2rewb15oKw+IyKFBrkIIISBOLAIX3N+4WKXZrUiqx8f5rrWcKmzKoJXXMoPk6
	IiyGJFlNfTgIaxdq0Rqu770H7yMtoK/IBgnnl+LbWqzoHOpk8jCYlCcHVXzD0EzL
	ROGqAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891h214-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:27:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso38231cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785432449; x=1786037249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qw3YuRXC2A0da21fG73oZk3vo8d9zbu79PzV9Phgn6U=;
        b=KHp+Io6KTrHFo1EYK9cR63M4h2NBHEUZf4qMUzI1GhPHrgx5m7FuXeGJA3NrY83hwQ
         YxVHIZdY0uEtafuo56p3EIRNYm2IaHNqiHFchUKM2eHbmoHrw9taN/UuSPqkDjOX8+RM
         C2rGFEozfN/O9ZnlqeU9H6mpUCESTDutNsUOQn4/4ghMt1MOP8xV+Cs0BA6bFHnMgLi8
         oUKKsJAr2Q2y59CbGFHaaErV8CGIXnQm/gitDr5dNzHSdQIDuUBMkL3U4L4p88ZQBPKQ
         yTVjs8BN0H3HX035dxcCswjXn77RQA8i7NITX1GRuPG0ka7nL1JJImQFFqfTqFO3QBIW
         mbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785432449; x=1786037249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qw3YuRXC2A0da21fG73oZk3vo8d9zbu79PzV9Phgn6U=;
        b=Xfnefe1JHNCB6h8/XMH4Pm5r3+nleDMdI96lwwLfKMzeGWYFR8sKReGDDvwnud4H6d
         fToEVu/pXW3osuudAThM1PhYsnkg4jvjm/G8TU70pSgqWE2avAIWjsCMXI5URN7RkCTg
         uNJoffhOgvPcpqVbi5Jxpn/A90Ny3uzgXBNf+jQ1w8tX5uP3SoSzIv7So6DXXjj0lXZn
         USB6Kd5bIbXGfQLV5SMw/OQNtRhHEHBI0jnkjiz1gATZM0Wn95L3EgsCoViwUOT9iaOx
         IluJc12N4ziEwX7uhyDzWfROsIs+UU8ImIbUhlGwlMb4PKfkbksUhjg+mUqnJFPtFbNY
         6e7g==
X-Forwarded-Encrypted: i=1; AHgh+RoNMinSsKne03qn5dUvrnukvtzJWFufd80BuA9+eK3AVqPgfu48AmT/y1HOWNvrVkRohn1/KXAN8sggib+A@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+V0diWog7yN5bQg2ADSWmw4zki0RqTgHXPqJRhX3wyxGCkuv
	7VDlmgQFJyAmlqLdn4grTTUQWdvLTidm1MJkmVi+oIh+hL4OHuA1lh0vq6P/WDd3YXFB+uyyW/A
	cRZEKgx7ADCLEYnWEnW5F/gXgPnY8jt358Vqg82BwNVCiyptsbMcHg8lP32WK+NtsfWLv
X-Gm-Gg: AR+sD12B78zu19yAB1vE3s8R6a3e25vqTcobfuPCgM1+SVvXOXZGXJzWnD17xGe5Wpo
	LXGF8L+JRoI5J5+09QbFo91dUEFXrWCyIqqTEPtexnBXTjo+QeAMgHpCNJDcP/lpAj68cb7YVwB
	1f7ZEZMPjBfcm1z/xFkCxh8BQ4PUb8A/jYVTYSH9IxiD6/c2a7S0K8d2nYeDJukM9CTpDGnep6i
	FIHgc6hWChEq8jOHHPP2Cvkki+uZ5sGoZ05crAdyDv93yKir6h2ujIqoyXeBcZAXdrsdS6qPLoP
	0xsIDhiOz8RvosM8zlQs5KZHrg5VaPjQ4MM+Rothch6WWDJoejfjgHG+spLrkWrpY5CP1Lysd+h
	+0jHqZ99Dh7bdotQoMXXImeRr
X-Received: by 2002:a05:622a:420e:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52b42b74c4fmr17313921cf.1.1785432449199;
        Thu, 30 Jul 2026 10:27:29 -0700 (PDT)
X-Received: by 2002:a05:622a:420e:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52b42b74c4fmr17313351cf.1.1785432448770;
        Thu, 30 Jul 2026 10:27:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3a2e17sm873628a12.26.2026.07.30.10.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:27:27 -0700 (PDT)
Message-ID: <dad9fb2d-4d05-40ed-ba71-56017a5e2d0d@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:27:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: monaco: Add graph port/endpoint
 anchors to pcieport0 and uart2
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
 <20260729-b4-monaco-evk-m2-v1-v2-2-0548e1dab760@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729-b4-monaco-evk-m2-v1-v2-2-0548e1dab760@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMCBTYWx0ZWRfXxU7omUY2EgBw
 PVLj/1fW84WBAuaVDwgj9YDZ6p7vCmiLPctXhIUlNHMJfzhzEMKDwVO9/G/0jhKu7yX1zUIfI6F
 wtcABXxfbqaDnS10fQUVL99FGnj4W/+zSzNuRajJnX63Kzu8CHr2E82amJDwMJfK258ES7VlhJh
 5YuecIQDubwj4lk8h0qBoCMiI/BcRmz+2Arf933ZwmsNX+1xqaxlaCpMZ5388LOudsDKIvZodEM
 OCAiyyKAf0aZEBhof+YirihGLDwwtj7T8czSCKUa9AnnPH4i4WdTCTKPOnzbDK4MefMyKxu9gAm
 Dx9apbvSBokTKfyVqoK45G3iDA0qUF1NeO/2ix5l3RMIiiVJ+UOr1PwIez1mU2yo6hPYqXEyXrt
 9Sj0xdEJgsQgvHXOqMNqPHMlVCW4kTBfoCMN64ezfQGxeG/J8JVnLHmDnFoJMGfyOhf934afFTe
 0v9zfgSfX9c7m4HhPiw==
X-Proofpoint-ORIG-GUID: 6Z2lDRwKASfQLSsLPr7LaVXj7R9m9qu0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMCBTYWx0ZWRfX8Oozfx/hE7hO
 dSBqEt+Ge82zUblFZ4cMdjfIRZNBelrQgPocrq48sti/VqT2Ggy8hLEIhw4pzKKu7rmdsHFGzcK
 Ntg4JoXWRUxZ6uKCkF2+ZYuK4zscVbw=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b8982 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WVJFECOOnsQ_CaLLT3QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 6Z2lDRwKASfQLSsLPr7LaVXj7R9m9qu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300130

On 7/29/26 4:40 AM, Wei Deng wrote:
> Add empty graph port/endpoint nodes to pcieport0 and uart2 in monaco.dtsi
> so that board files can reference the endpoint labels (pcieport0_ep,
> uart2_ep) to describe connections to M.2 Key E connectors via
> remote-endpoint overrides.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
