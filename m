Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E984EA39D
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556284; cv=none; b=oSthWklpGglasU2fTaXRvXiq8Dp8lki/tVigCbdE959mOUJE0vR/5/moYESZS7j5O0kdbtDShowaWw5XvnkPiI0xUg/3+ER0gEsKbU9jVEMPHXJkm4WmAw9rn9OHaGhoN3LWzEQc6hWMZ7DFAO9yVKa15tKUFevqA6lgnZtSRR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556284; c=relaxed/simple;
	bh=OV3wyHhaayNQTC4WjVNcdURR3xbxXd+E1ZZUf/4ov70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDxnP9qVGAr3XUy8qsVFzVkOGmfgZSLUYeWMPJtpHRwR5tzKWahQ7HLsDUsaO6KDizAGMC5j5YlRapbHnyOqwUbE/Y0mPPVxq35c9rWwPlO9PDuk0G2dpnhaOpVcrHp5DX/4IUAzojz+Bqwxag4OHvgN306PYCQBde57b+hOEhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvY/DKKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3oo54Em; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvY/DKKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3oo54Em"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G9334F1587228
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Io2ravhkOMIcfAcfh4SBgZRpLjfHYqw/T1gKpXFQEN8=; b=YvY/DKKV4DWYjclx
	I1cG+koc29eOnYPpj9sCXfbLUr8yBCs9eXAEMNGwympZdsrz2uSo3IL+UQaESejt
	lyw5HfJC5j4PMvGu7M3LrhqooZMs9mlY+KgLgMn7lA3SxzvCXmMtjiSp8Q3SG1cW
	BBov5R4fzwUtSzVo+eTHfAZsJFjBlC3M5LdnXQGT4yZsgNOC/MHo3LPi4nBfvPtQ
	BaOoYMyC1ZIGo9HExXpPIhbMw2fPNevhy9WSR/+LZsZ1xKKq66n8TiPFON2MziZv
	Q/iIYXSkBWidMI+auJ/JNnieOckjov6gjt2ZLJ3vQkapfUBErQYcJDIBd6fxsq+C
	9ZnYNA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagekvec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:57:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4afc810bfso1908593a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789556268; x=1790161068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io2ravhkOMIcfAcfh4SBgZRpLjfHYqw/T1gKpXFQEN8=;
        b=c3oo54EmEHMTU1F4kr+DxKAGljOyjt8MTjSaeTo2dOJ3ODeGkZjZ2jjwpQouDpfFel
         t0Cx33ZdBsirlX9nNMiO+mdv++t8FYCpBFFa/e2wxR4bIzRj7C8X5fX9HFNFcbAfM6EP
         guz/Qu6WOtQHtpULHewfE3F+WVuUQEkMJM+jdq5r9N366MjAJRmcrRFpF44eEVxMrZoy
         6VsR2QT/76IQvrFWppgWVS16BEJWXkqfLqQmjIr3G05Bx3MBw4V+kq9edmhRy7ooEmkX
         r86pqPzmuog9A38Amt+ximx+fmt5pYsbQSvlim8rKnL1klQAIkx8XE6ZCBXftqhN9BXU
         s2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789556268; x=1790161068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Io2ravhkOMIcfAcfh4SBgZRpLjfHYqw/T1gKpXFQEN8=;
        b=tD1ZLgEOtBf/ozfkd8RPup2Vep8mdSyXNWNPBM+rqApzcdZQdJygaAJ4V19urlkNlE
         ttKFGMndAtMhlgH/yUV04j/7srxXCqInnamcYz0ZY6tZJodsmY4UsUEUl/+P8+S9no8B
         yoeLoVmeXrepvWrRtNVC5D4to+tbvSWlMmtDzLfw7GEEYRPIvA9bCmW4cmiRkuG2SdvB
         vBL3w7DBxVNfTanqPugi9w6g4qXWxyJj6S+b4Mjk+Ts283CycdcO8ntZzFm9fqNHjzAA
         C4Clp7aRMUZIbIQFxIDKhTHyxMobBz24xFNUOMD6GF5pIfYvtN/fhC7K7Ttok0ZXmjat
         ZiRw==
X-Gm-Message-State: AFuF++lJUAQIf1UR61AG7B3GNvl72oG7l+T7NfBVMeT0RTWdwTH76zmU
	nZ7N7wspr1MzdcbjBaZPp7VmtEpLNeAmYst46Styeq66oAyK9EXs62LSyIHOsb4uY+4Sjamgq5Y
	M1Ms1ZWs/KPr+FbMpk+kMxcJ8Kik92XbjHW3I9F6g3gLCvEPKf1UVzxAJlprXk4p9mtuR
X-Gm-Gg: AYBFou1167pYFSaHk6b/78znLpPPtggHOToBU6GBY1P7S9k1KRXoUunBLx77SiWKzRG
	ttRQ4HovbIz4b+36G5SE60oqTvX8zN2p1oYbfj/Vcygg7owPz62Zyu/QELoR6VMg9D5NGVZZP+F
	fCOwM4iVuyHzHe9fILkaem8bvhfh+yWnpFXfDqASBjftRDvuSvxEJTjndMCr6pv4+Y5WH2FLIxH
	ZSy693XCTHjDEm77YTVsxfZxESDRPF5woBJbQf94nLQrMq87msou2lt1GeTQEZL3KF3/IbSRrtw
	AJX0NMI7lxGYO3uMMVe+YLOsWZUsxe+9eG+I4qmggMeZai0t49zuhneK9pXuVLOe4794kO/zTJK
	v1NxROtnUxWD6kFK+zNORe+BXgMij
X-Received: by 2002:a05:6a21:8887:b0:3db:5b7:e9c2 with SMTP id adf61e73a8af0-3db4fa35df5mr9041014637.4.1789556267845;
        Wed, 16 Sep 2026 03:57:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:8887:b0:3db:5b7:e9c2 with SMTP id adf61e73a8af0-3db4fa35df5mr9040986637.4.1789556267394;
        Wed, 16 Sep 2026 03:57:47 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm6144623eec.19.2026.09.16.03.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 03:57:47 -0700 (PDT)
Message-ID: <3d6cffb6-2442-48d2-8c40-c5160c649ad6@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:27:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0NCBTYWx0ZWRfX1pbEjhtWURfx
 3vebws1FXI/d1RjH5sYmOeFtRbqHVwDCtLbQPlvxksSEAA9+9aWTbQl/u/5gCimUcdWuzd74t0Y
 Lfg1B3qVtMWXs8NSAwBtFJY7QlSft90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0NCBTYWx0ZWRfXzbnL1V7yq+B5
 mTpDMOpB5ukgGFHwPYNg7u+Wc7vQEk6fBNYk5mrFukjx07t5PrkYK8n13hNz3BqIWEpDzq36zs0
 IwwUB9SbSc/nl1MD48otkDz+ddCGNB90DUFMEE1Byp9EvAlDngi81KJ6YO5zq9VbmZK3w6zuhGY
 Y1VE6LeA1QMsvMlMNsdgk001xFIiHcXel/gLL96zICjcEMKldYak64ZJbDvM+egJfP0NlBrGij+
 cQWJVrvh3x50d+tOYtFYKRX5hRTOnRV9rzvVVkUXdhzQCg4mBa7kEhvhMoPYrBpDcMITwPlsu4v
 Gr3t9x9xKEASz+zQs4N7x0hzDfgLgVQcHB+eMJMK4UtWZfn91OlIMvm7xAR9FkhDvSy3q7JDH1y
 4zTpTSYrSzvse0c/r59XYhz6n2z2mn+xJCDCVoxHcWGtnHlabfaFsSJu4n9LWF2XRcVR0tXpzoZ
 o4peuLd84k9lCc9g70g==
X-Proofpoint-GUID: TRzF_l3uVGcEJIkPLPhII0R84CeqR_5s
X-Proofpoint-ORIG-GUID: TRzF_l3uVGcEJIkPLPhII0R84CeqR_5s
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa762c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UlBIJfxCiRem9hGYObsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160144



On 16-09-2026 03:31 pm, Abel Vesa wrote:
> According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
> Drop the extra zero, otherwise we land outside of regmap range.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/gcc-qcs615.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> index 57f8c80c6f32..1a6a1e74e805 100644
> --- a/drivers/clk/qcom/gcc-qcs615.c
> +++ b/drivers/clk/qcom/gcc-qcs615.c
> @@ -2999,7 +2999,7 @@ static int gcc_qcs615_probe(struct platform_device *pdev)
>   	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
>   	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
>   	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x480040); /* GCC_CPUSS_GNOC_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
>   
>   	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>   				       ARRAY_SIZE(gcc_dfs_clocks));
>

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
