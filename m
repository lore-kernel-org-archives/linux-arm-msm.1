Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569EA36B90F
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519493; cv=none; b=Ilwt1uicBVyd3M1vmCJtOcO0D+LTlOH/rDtoiJCumcyRrSzfRWS0ltYyyZS58q1W4D0/I+XEOcDXc6tJmc81QlgbJUF/tjRCj9+NjglQn+KJdjGzOAuTp9uDr4yBTPDBcb8s8y+g1168JNGUbv7aGfynjmxzZouGQkrqddIn0+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519493; c=relaxed/simple;
	bh=idEgIKuwLufALjp/jBV+Ut+lHDpRAhTiRSvAWJe3BF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tmi9352clyav4raWw0XRJ9kSgKbgUjeAhkZvH5jNgLIRuqYivuzVVRuWr4lVchnoCULHrntSE4yMWieMLVHZZFadFQsBTNYoZuErS76m5v4mnnGOcKYam21NiBMGT1Mg3WNUK5Ax+bPey3WjmuywhYnVO8kHipnH+raTm8kMzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zm+rjJtA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQeO8ynG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm+rjJtA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQeO8ynG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62ApL4090977
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8zmE4Z0t67Uc/IxjelkCGk5duWoHHbuKL7WpxEI2yY=; b=Zm+rjJtAIhhcVVmq
	JDFGgDHRb4vGNP0a3JP6Bkam278h3H4CuLU/ueuWx94zrh+FIQwq4a9AkdnaiGei
	RpZh9f8IMHxtsHa2o968rt4MLpIrUn2oufEH7/LFDsl48yVS6dDwYyT0s7tI8AqY
	A9uHYU0yc+BADE8Xluuv5PbuQyfsJm+vFwMVw8ZujWwUldlsUeVDmk13qWxnPUqm
	QUnLr0QdYLIfinuax6pszF6kZTtozeassr6PvRvCwrrT18Y6AxGnFK6whzABp3E1
	rkwV+TJ2KWan2wv0aEQdJSUqzlc/w37QkaA6DgRPXHzqM7a8tfhkek+3OBkvP7OS
	zIs9OQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049bv21y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:24:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so18896795ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786519490; x=1787124290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8zmE4Z0t67Uc/IxjelkCGk5duWoHHbuKL7WpxEI2yY=;
        b=UQeO8ynGeX4EQtAhzgsoXL4ypXKcAAmepTP5+2bbvAUpK/sfYPTCK4XTvo//6bgh8+
         3UMhSwV1PezGWGBuMV0N8YulgbbvZstm9DwljMlb7XcGAzc43Uy7UYpIkawVPruSeZ3q
         kNig8kasg8PHO3y2vs1kNH3bs5B43zQmJNEKXo/6U/pqO0xfSNb/b0PqhD0J8+juaeTf
         kMCr0rlr4DPUun43AcJv1mgl9BAx8aC55KmIxt0s3vdonNVPIc/d2zqysXNJ3bgbhdZl
         nnGZYNZotjSJA4vAIlc3m78G6Idn8KmhhzhYHfKZpScYZHPQKf8z7/Q45JU1epmDh3yQ
         rNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519490; x=1787124290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8zmE4Z0t67Uc/IxjelkCGk5duWoHHbuKL7WpxEI2yY=;
        b=PZLBI85wxE3LSW+OzoiLbOri8NJdypvWAIFqKOhn4myEmvg1PIMeIMGfW2xLvTyj54
         3HkxCcGK7ead2yB8ZsawLxZEi+yPwWYpKTZ+e1oTecPlH86ghIh2pgUR31KFlomYOIXP
         IioiRULHtRqLzllUlWNJ1occQzWfkdWyYbRzOu8LVchBafByMtdE9XSlRLbaF+sFLPzy
         3GScKFlrFdbKgTUA/FxfzP57ZKCU/Ui+e5gEkid/gISOjeb6DfmkH9mAbcA46xXszHkC
         8UGY4PZ74tmlS4b/YVk0P981XXXSuiYLUyzKW43mqbGSs72dmmn9usf/+DFzOxpiMKRo
         kyQw==
X-Forwarded-Encrypted: i=1; AHgh+RpDKLHfBS6pup/heljnj4J76gr0oKtxNlTn/xG9/28Xga3O5Aycao1G3d8gF4tGiPdcmHsQE/MyLmkiDCr7@vger.kernel.org
X-Gm-Message-State: AOJu0YyfeR2hX2QkrLDuy6VkT2BoZ65o1mmg+QDEJ+3y6p3wnqUXh9Ux
	5gg40DNJ70aQcJ6OqRRrIansflqLKb+qaI4S0HHjvAQlAWEWh3mXhjBIz4+AERwKwaU22ktQCDk
	iQ7/X2M3qfULUJjU4TRSNd2OxTicegBPdEKTxZ8x6fNPMZVxqGRar+HJ/4slpUmSJ+IwG
X-Gm-Gg: AR+sD13QUAhAC0vyo1K5dosmM3GQvXl24h2J78zU2VQPA2ERp+YVwYrW50b4ShRt3FC
	yUPLEuhexgMAGOp8F/7UtCxl+E2OSAgCeBriutVoNtGG+WSouzmGzlFQba3cDibGxWcTnnihbEP
	x8OaVe7mllBJ97EaNCYiBOS27FLZV/GohLKDNqWMMh1GuVsFN/XHLnPanHNJYQfGf3FuMlLzIgc
	yYg4KbzxmYsqa1EsBl5oE8qmf2LPotgq62KI6KAjsXsp054VZoE2qACZwkstDfoW3Y3ruQ/8G9x
	DxAL1X0modGm/As2Jn3OyDqdBOP8RkfTSAJ26/zOwuUsQdMVhy3R+x5JyyO3F9ZgRRDqo4u0oGs
	y/bp3RInggcbUZ4dgS9HTpnACnvWzsI6CrA==
X-Received: by 2002:a17:902:cf0f:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d3453cce11mr40083995ad.10.1786519489970;
        Wed, 12 Aug 2026 00:24:49 -0700 (PDT)
X-Received: by 2002:a17:902:cf0f:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2d3453cce11mr40083855ad.10.1786519489524;
        Wed, 12 Aug 2026 00:24:49 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d351145d87sm2545055ad.23.2026.08.12.00.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:24:49 -0700 (PDT)
Message-ID: <d5d64ea3-9c6f-41f5-adc4-9923381d732b@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 12:54:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pCIejkvHF-OLSUljeYugyy72nWEENku-
X-Authority-Analysis: v=2.4 cv=ENg2FVZC c=1 sm=1 tr=0 ts=6a7c1fc2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=9TDyKcSpi701ZX69LQcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: pCIejkvHF-OLSUljeYugyy72nWEENku-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1NyBTYWx0ZWRfX+JWtdD9pcD3z
 yIf1Tzz56S4WYI+gJ3j9VNabLrHp5Gbv3TfP3DXJWFshExa8Pz/62rvSr1mNzzoP/lTK8EK2Is9
 HmS8L1g1uFM0bgMdLORxHJc+kFdh+Zl62dJilHo2WGqop91hFikPR6IeRKLAKBlRieOXZmcaJ9p
 +inv6RbCauFSWVTceyewcTWjWl1ZzXwSWzTF65BXR1xYv62J+1zmeO2XvNRef0xkzoII1f0Vgli
 kOCpwDU5sHCnyh4GYHL36Fl8fH/7ZZdIPcRy+GvFSK7p6dTbFXwdzMwQzfPQsCz361nhHZQivxr
 gPmIHNKURjcLuL2/Z99HlbHTqSO/kM7Hd8a1xFgn3HR1yMC9zx8a4s8IXzCMuD7xZUNHvtyips9
 Uxm7d8SYsFHg0w1ZNUwgSCmNq1SojyDos5S2uYJxSdxMNbtXToZ5NBEx2oct+eopzs2+hcSmN8M
 utvu6zO9AX9fent+wUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1NyBTYWx0ZWRfX4f4zfmO2vtBM
 3VzCduS84YURtXN9xF3hfi8fWc7vwkDuqmadhqDaK/uBYhlc+ykuGd9OhYuMGKZ7fettQLUc/ut
 VaHkrtkqr7z3qhh2NlDwonRBOO+zj9Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120057



On 8/5/2026 1:27 AM, Praveen Talari wrote:
[...]

> ---
>   drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/arm/scmi_perf_domain.c
> index 3693423459c9..e390f902a444 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd, unsigned int state)
>   		return 0;
>   
>   	if (!state)
> -		return -EINVAL;
> +		return 0;

Won't this cause an issue to other drivers ? how are they going to take 
action based on changed return value ?

Remove Acked-by due to this till i give back.
>   
>   	ret = pd->perf_ops->level_set(pd->ph, pd->domain_id, state, false);
>   	if (ret)
> 

