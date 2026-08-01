Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0766075801
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595101; cv=none; b=fan/jsvFQ9Zy1x0S3XgMSA/vCizuFoevxh+68Pwuz+GsLNPjOXRcKtBo0dTE8CW8RLs0fQsVI/tN91/hYA2Malw28nLAq7VnnMQfCmjM8ReQpHtlvetI4A2/AZcclp8KeWTwQh4zMGT/DzK/hK8ptwGss8TNmVvKHz+kZzAmB0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595101; c=relaxed/simple;
	bh=aR7wlk14jKGCr7YnqLo4Si2gDKNBUMLdz85XYfNC5gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6P87oHUMdRx975OcfBBsRD5qkLKnGv9Mf4p37VL9e0uTR7XrvDUsgzENQT4pEqRqKh+Ip96Uqo6EuLhZBqnUBFdeh29Gmh1opJt3hjsPD2qhcyyLoT5FcBg9X1pZGvO+CqQd0YdPQ4bNBD5wio4VPjL8Z/dOIMH4NWdJboJTME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hK8LDr+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDioyBnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hK8LDr+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDioyBnd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Cakw62945295
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 14:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/L4uhhrLRFVggnOJ2orfdgP8HbdbkXZiarCIpcSztA=; b=hK8LDr+SRkOhbSW7
	vSDoG7P9N2lD6sIrNQn9A9cEX/1dybe6Ci7eRTBQs6zveNYwMVGvMv/RHidjs65I
	8mWaUTN5zNj0aqYuTH6JXACN0VsW8AQLOrskp2HLXO/vSQD/BXfD6ShGKSyAVmwp
	2rDfpM2tAXKkVvsVxthmHAHcK7/w5FMeytaPgp5OSGuUzBdAELhXDd1xourWYyrQ
	N5nUmrQKl4gOOr6U2QrV1KnMHB6Vp2PDbt3AsUQSongAXYjP7Y1irE/OoIr5t/1p
	jb80V7LDgE1/c9maTTo11kBb3R/iSSm3NvSnb9EFxP7HiR9tVgDPvDj/YHr29RjD
	ckB6UQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u993nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 14:38:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so5035258a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785595091; x=1786199891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/L4uhhrLRFVggnOJ2orfdgP8HbdbkXZiarCIpcSztA=;
        b=EDioyBnd6dIHNwEFvYlkKH3BcSpOiTwIhm52Wf7wgrGxVvna931+oLoLAmi4PTEt3t
         Gh5huTE2kP6NcMGDsNIl9VpOdLMnA0DRpxo00DEaqTGGU/3y1/Q0YZMPaKwIaaOpnrNN
         IcBalk8Qd516Wu4XAuKoCvrQGZhqe05v5bWOPnSi0aVaYYLo+jveQuTeennJIYpHUBKb
         NOo6Ll2cMaz+YCeMr6dDeqv4cFBiHbxE/mRQlk1uv7UVdsKJWr6B+zi9rmzGSNhOJgbE
         2qE+aiOL+yxyZDRoPuvKWT/ZN+QaesUZDSjEDfLxQNP2LgDDbfNRQu0QnKDe9VLBEKGb
         SCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595091; x=1786199891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/L4uhhrLRFVggnOJ2orfdgP8HbdbkXZiarCIpcSztA=;
        b=GQoTH6g3aC61/ao0MRtJ8JHfMoU8EczzMbUtl0Rjr2Jo/xIsh2/jyiyG8z+fSpy1lU
         tf2luN+YDlVTbeAzxtJqUm1fujS89PLyEyp9aIR9vX22kh8TuL8az3gxE7epCh+djSbc
         +9EV/fudTEy3ArguNFnulCpDB/1+HmgezluPjBBqmtymRW3zfrYitS+L655faXLB6A5o
         TOYTcJ0noNgwu8amuTKLcCye10jTkhVQRlfaavGECbIErqrLUmzf1Xd+c2xBn4XWoWQD
         ITTv1i8CFyjyJHpMVLWrV0vTPq7HZbGQPfPv1jI0apIio9/gNXX8fvIVrk7vz3waNKhw
         OkSA==
X-Gm-Message-State: AOJu0YwxJoyhx2cWXaQL8cFF18RnIkL6bGIMR3kl346EmtgOOwL0JSFs
	RnV1EXawUSdz9jtBhDGbX/zTQ29GRdAJAs3a7T3c5YEzjtnxsVEiy8Di/KMOdVrbCdFdwurHue4
	FhY1R2983MyeZIAFj3PY2+i9q9rZCVbIoYY7NJ1rhbtC4UoJeQbtauGEv/eoGp7IzaiTLJhFIMg
	Vx
X-Gm-Gg: AR+sD111pVq+FO9tMZfZX+6nxvk5hyUcTTG5onrOoBBES9QNbvJxojVhsP0Hmub246O
	IepdNUSRTjHVZv60nhBUjaJbz/7VCyzxg+BAqN5iN5U4+KInfjXMmSQ8XBdzVYeBlkE2/3KlLsu
	80GVt7ACQIFnO/KSneNRlWI6OR1fw1ZYIkuv0zQSyTtjzfD/hkz0kzrHfoXWafA+9BJ44KEehHp
	o4W+x6SS9tkpgmEW6DvDIN6hRYKPPXJ9UQYBNXSTiln8/JrbA9c5hMxnO766qK95nJktFqRcZCN
	INP101oWsKt1RdCg3E/MntfNpFtvhIQTBMNVl0O+jb6zMuAtCw8vXFMtjC5jONJE6qfESrnLVs3
	okI7dpcFWe45/d7AtYzAesd+ZRl4J
X-Received: by 2002:a17:90b:524b:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-38fbc3e7da9mr3201960a91.1.1785595091058;
        Sat, 01 Aug 2026 07:38:11 -0700 (PDT)
X-Received: by 2002:a17:90b:524b:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-38fbc3e7da9mr3201939a91.1.1785595090607;
        Sat, 01 Aug 2026 07:38:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.28.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f197sm18557144eec.6.2026.08.01.07.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 07:38:10 -0700 (PDT)
Message-ID: <3391eff7-9b68-445e-93df-b18906ac1619@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 20:08:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OZYCEEz6L_igaxIMJpWporXUIjMG2WP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNyBTYWx0ZWRfX+zT7cV0EvFMU
 a+DmS1QsWrvFmXOtUE6D7GVLr9+quagr6Nhi6XlE6oLJkRlBQ21Vjben8iVuwuI+NLtQ4gHolGa
 SNEDKGIhojJN2Kwctv7sB8Ce4KcrDD17CrjF3yCPA+ZdheHSXYcLGLGiYTizo/X+4Aetq5yNWZg
 9Dc+n5PdgIal+T0m3SaS5+g4zdR/2AmAvGRVgR1YH0o7X3o5lLfPJDqfFueL6rwvECPZPvgZjGg
 bg84v8bKAJ1P3xsWuVNn0ue3+xwuXxjZXxY5SGg6mT03HZrJm9QrSUJkUUcaUUT3Knho0waJ2zD
 QcH7A6UPBU5xORaicHtESLK7u990zDN9DtJAjoo4Ahu+BCze47A9Cp7AUBfyQcPWETWvCm0F/+F
 WZQCQn53cEqFb4rf9Lt4zFal5zFzKC7K43GcQp58J2t1x1nTi1XChWOgQZa/yvm7XZAm6p0LHZE
 qMK/PJm2eTIPncy8iQg==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6e04d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=+2nu5FKjU1rLS1pfaWnYQA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ETOcCGdCUUXvB5ZO3A4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNyBTYWx0ZWRfXxP+t+V2/K4Hy
 0MAkHPA1R9iiTvJys1E8v6Af3zesjrlkdUCptDE3c0wKUOBvBxkFLJtrsuHQINzU3nFhon79gIR
 KRaewweuFEUS0bqMHSpGHSUB6P/Erhw=
X-Proofpoint-ORIG-GUID: OZYCEEz6L_igaxIMJpWporXUIjMG2WP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010117



On 8/1/2026 1:15 AM, Jagadeesh Kona wrote:
> clk_alpha_pll_write_config() in the PLL configure function skips writes
> to PLL registers when the configured value is 0. However, hardware
> requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
> for a few rivian PLLs.
> 
> Add a clk_regs_configure() callback to ensure these rivian PLL registers
> are correctly initialized on Glymur, SM8750, and Kaanapali platforms.
> 
> Fixes: 97255eedd690 ("clk: qcom: camcc-glymur: Add camera clock controller driver")
> Fixes: f9580bafd39c ("clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC")
> Fixes: 92aae35f667c ("clk: qcom: camcc: Add support for camera clock controller for Kaanapali")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-kaanapali.c | 7 +++++++
>  drivers/clk/qcom/cambistmclkcc-sm8750.c    | 7 +++++++
>  drivers/clk/qcom/camcc-glymur.c            | 7 +++++++
>  3 files changed, 21 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

