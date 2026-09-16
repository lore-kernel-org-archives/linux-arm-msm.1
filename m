Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CBD348477
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532278; cv=none; b=NMFHyQQLZqggL/UjsZ1RcM5YL8NQxQM1K+F5brHFFp7NbLJSzZy9lh/gJXb/SS7X3cerPgeDOyhnQEGhIUSgAI7OepAz5ZE3XzvR2A/8T0PNByo8R67Q2Lq/ea0batJ/EDdt0dFPd8XUR/fgBvE1/anjy4W+q3VP3tcW/4ZG62Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532278; c=relaxed/simple;
	bh=0Um5hxrCDnA6hJBMs8PXT66TyVO85dEsGiGzP6yZCbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZltmGLejJEvFRJ7welzYdz0gw5l6WFxwGYa1VEw4PRHPwqzO0AbZW8VyPY8X0hq9VTXbUwQDnt8rG6LuS0xinv/7b1z3eQtO+896ZwPAqob3XS2y0EjXBgmBEOu2X2t57URdbI6jeIKDWQEUof1bBF7+Krd5HKslxEwimNY2hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ht1JxI2l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eE0o2f/a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ht1JxI2l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eE0o2f/a"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYpmw3680606
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 04:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFyXjwf1vW6dWLb9NnJHDFBua+RxW8tDX7Lmq8HoTrU=; b=Ht1JxI2l10OWZ/Ic
	/kAmtifwpte+vO0gL4njqrp0FBiq2yswUHCnwJYmhBultnP9jxvE0hyNtHuE7qYJ
	6Hdtj9yf+C45Y0xkExzWP48pIHHo2kectFCGfUSLdEyUCiP46YyauXJfwhLFMr3u
	z3QC6KmU8XCiu781QibzYHE+MHrTpIciDwdZU2+Dio9ACVqVoz9s2XlDMNNfiJkK
	+p88G5QRqZYsLtNwJwd6dPY0dhb3hb638W++6ffRs30861VE/xgRtol/ckeaHl3S
	UqcRz9yhEX1dv+HbQR7HWFLUB9mzOgUxkia7VcZcMXF/rfgnnx3GStzVGWhePvsP
	fBCxwQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r97q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 04:17:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f80c76e6so97445015ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 21:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789532275; x=1790137075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CFyXjwf1vW6dWLb9NnJHDFBua+RxW8tDX7Lmq8HoTrU=;
        b=eE0o2f/awQRquFbHrBv2LqET5wPRtIXMxiHzpn5pS8UpLl0Qn3w3cXPpMy9oe6V4OB
         YxIaWsO/CQONJ+B/Spl5oB4o2hR/r3xyVi9Pc9G+NMvd0UQdqJ7lt6p9YB5sfoIGl/22
         J34Vlr/gBEj0u3Yx3Um8LL8Y+jQN/N+SgfYryFRM9SwhtS5GstxRWcd2eCk7SqpdMrng
         Q2i6q3oB6JEIMsE5Vy4TIAsrF2j4EUWZkCwtRPDnHoAq75tuBdPOTxfh1GOPAWWK7AKb
         3jfNaNbj3HLQgoMkbyrxZ8d12kVwgoE8Ppr+aYCJ1u+ZdRKBwXG6gCw3pjnkF4mJ6C11
         rYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532275; x=1790137075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFyXjwf1vW6dWLb9NnJHDFBua+RxW8tDX7Lmq8HoTrU=;
        b=UyLm1EGfnQjnpFFQH8Ltv+nRLd0gqi0aRnqaOA+X/+CmLLICW6XXg46S1IXmTkSo0x
         hRsI1W+1MwE/7l9IWp6ow9edJ8olBVH4zAC24cAAcFlNb1aLn5YhDwA+c4eb1Tk2tBon
         aYF/LTqYqS/NEHSqwlmtzxTpoo+lu1lTa3vS+IE8vTLQsvByHEUgkgH94V0LW7qvOjLO
         Lf9hXCoLNstijhkg7cvhIR7Gn8GZMtEA6ZQ8uaJH90WceQ09eTX7bpP0gzI19Fe+IMCr
         JrxhB+Un9ZxdiUvSX2vQeCzv59NnqtiPDzjMEPuhD6ooITc1wXFKZPOhX3QqmAscXmip
         g8kA==
X-Gm-Message-State: AFuF++nd1zWv82oka3QW1iAzbVFW+nRrOCAOjXExHuyndmG/b6KjuWMf
	xAb2P/8YfLexafQaYbNKRvlTEykGX9Zpqk43m9KKRbXdEPvckBZw5eradzDqmizM7uJePXWS4Jl
	j4/ikizDrQchI7ej6jdNPbR0S6009f29lzRKiOMMQCqFPww3RA50W6MK52EeYxlinm6l3
X-Gm-Gg: AYBFou1BU7rSMqB3kCoJYVKmmOak0Uq+QGJd1nBV1yGaILNtpmKvsJ3waOEzw+2YBeV
	NU2P6f2EGbMaA4D2X/1qxWTnyLnk4zqnnXZJA3WxWNeDAExsI7qZbn0A7JssNZ/pamS47ynxdYQ
	ndw7nvvu/JBwz0chE4VdIFFQRoSl3DeG4HmeDzUKAe1ECxa5Ryb+DDPOgOJdimHHQxUkZM2qOPE
	WmMipPHt6y4zSS8q0vted58J7K7typOLCDNgTo5ttBbz8rjV/eb5se9Vex9ALxtTM5YEqOKNhDJ
	nqIZQFGzAfWDyi54edsQxR4wwr1xzcFuWl4Qohj0TV/WxQBddWklA18GtZQsdcKy//2Td7It+nK
	7yYpHb7wiGO1HuyiAvGHyNqVJtJo=
X-Received: by 2002:a17:902:ce81:b0:2dd:64:12ac with SMTP id d9443c01a7336-2dd8e632d3bmr19186205ad.11.1789532275516;
        Tue, 15 Sep 2026 21:17:55 -0700 (PDT)
X-Received: by 2002:a17:902:ce81:b0:2dd:64:12ac with SMTP id d9443c01a7336-2dd8e632d3bmr19185755ad.11.1789532275081;
        Tue, 15 Sep 2026 21:17:55 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aca3fbsm3951906eec.20.2026.09.15.21.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 21:17:54 -0700 (PDT)
Message-ID: <80971c66-23f0-439d-afd0-a4f0211d2a36@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:47:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops
 for GCC UFS muxes
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-2-d0aa1c60c269@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-2-d0aa1c60c269@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA1MiBTYWx0ZWRfX3T+sNjny5KrP
 rt1owTy/q8pcXQiFGtCKrQdBZQvDWLJSQppth/mmz8JTZHKkPreC+QV563ykayS1q/nnif9a2Nr
 0X18KyIoEJlrKX8SKGOhI+WJ9nqVVK4=
X-Proofpoint-GUID: Bd1QTUALhr8t1hqfnucL0Jfje369wUyi
X-Proofpoint-ORIG-GUID: Bd1QTUALhr8t1hqfnucL0Jfje369wUyi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA1MiBTYWx0ZWRfX+khlbWwVo7U0
 W/TvZyHAh/LqwZxGQ/r6DpKftWw+J++ujfxpGQNFsZmps1bZ/lu0TdB8Lg6bZoZmATmapCqP/19
 ZtEaXE0mPUtdVcBYjqrFeNL4xCBKb2bEPgl+a95uD5di3XzVjQsGWqJ5XhmyolL2Mro31TmzKkP
 GJNzCxPjfT8xpXNcV+gcWfVg8D/QzpkmSuRW4QX9tjWUB4pKajbdIcYdZ08VinklW36E2K78JG7
 nqAbYWGCqfkPVKfTU6Ddi318gfC697HF0Dbrdn6K+Xc1yKA8vX26ex0Ovw/20FypNs8+WnN7Zlo
 SSbIZWlfgDZd/uekFzipl2CXlDPlbLh6PZrwhtk08sC75vsPpOkuYcaeTjmHkg21woHh+tU4cmO
 b8El0SvzQ+xjC1F8LkW5bPx9WmgRpQ/HtCCvSLLWUEYf3mNpb0UyVjjDlW88zHMWXEq9ju1Yil/
 eLx9BiqiUgNh4tF4G6w==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa1874 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vZgVdhwgRuDMrAwUH48A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160052



On 9/15/2026 5:37 PM, Jagadeesh Kona wrote:
> Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
> automatically switched to UFS external symbol clocks during enable and
> safely parked at XO clk during disable.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 69 +++++++++++--------------------------------
>  1 file changed, 18 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> index 2ee4820b6fdfb1ad2cdb15366cf746651fc1a36a..a47a2c6b961ba01edc69be91e299a190f4662c3e 100644
> --- a/drivers/clk/qcom/gcc-glymur.c
> +++ b/drivers/clk/qcom/gcc-glymur.c

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

