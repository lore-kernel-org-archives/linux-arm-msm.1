Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10994EBAF4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055719; cv=none; b=TVkzGGqTMwAxTbB04uz7KYbg4X3ICDPrTEv+RrUk1cU1noG3+xW+ksEibMP3DMzcxCTvNgDLwSgfXJyxMTw/d0NtTNYK0bhWqtpzd7q/M9B9ijgZJSkdGsHgNsj25WP9R57ji27FOHJ5sNmu8U8XYqCGLy2AwpNqdAF3HkkwW1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055719; c=relaxed/simple;
	bh=z+BWBGlvD7j43OYcW9UusO7ekWqnSZaJz9t8vXKA1yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9o+UxmkjPqtAROPnynUNv82X+iYT/aXjWOdOaH7GN7UViwirQLzs4+Kx3Ki0wI6i+7GOZjn6luEIVhP36MI9i2afLPL+I7NurjJiXRnXsdE3MOqo70PLfVDHYRGy2UWwhBB/x/7+4fLQYf5vYlm6S9javzANj2h3ayc/tnBhGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azbW2sya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQmFILkV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azbW2sya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQmFILkV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F81xat3468988
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=; b=azbW2syaIxiAklhX
	1zIMGP1og2e4iIi9ZHhc/SANhUraFuOr+/DGkSZWHbqw4LDmzlIxtiCbn/myzXNE
	Mom5KNaGtL2X2o/go7Lrvgp0g5WCf1wRU7ZyWkSwHwdU7BRv/B5NvgaAZJpjygav
	XaOdj+OUU1WD873tYIT/RfH13BFNfdwHuiGF9xmzJlx3GFqfrd6r1xBrIJOgFAQ6
	pD9CtFp7+OYdltJp/tR6hsxrOTnzvCiC3jBVd3yr0PHyz76iURhXVed63SB+9C68
	LuAm+6Zt6ZZ/qn76rPwrvVQm+Q3lMLonpHqTjcLaiqi7yAZR4FZHtxUIuxmpYMX8
	4gV/EQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bfh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:15:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91795e52969so13003086d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055714; x=1792660514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=;
        b=JQmFILkVtObdTii1yJvmzAuDZlkSJ7fCk+EEONs/Ckcp+nUSTi2GN7APtsszbCQj/i
         cHqi/Cpb8C7P9tdJfi0CspmGJ5t4THU/3OaVAzrx9NvfTV4Wn0yiyFANWtUunCIefkTI
         fvbh+UdogZBBpu1t605sOmBl5h6toenQxoJpF+l5r5tpyDt2E8ncy/hFuvYKa/oiXSR3
         awgv1sCyBoRWuZkCcRm+LeAZ+zHUoSja3rwzJ0drhei4xQHZj6O39OTQxfpDxcvOyY3X
         S9c+d0HVTfeHHnRsYb+WL03COA00JwNxuL5NY6xc14xjw11ZMUYRatODKedNRg73197y
         RSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055714; x=1792660514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=;
        b=rQ/g4bxzix8pAZZ3ErVKOINu4V++5WU4Q1QPTzCEI5sybwWWQvaW+c/aUZszqTb+Fz
         WiEqwtdB3/4njU3jJv3eVBGXY0fM3JqI2Pv/HyzoNEuFDXNpOV2W6CotUxz179dUgCMt
         fJssGNzy8W4bFWM5j/rsPbbtksI2znvK3xAolbLBd88Dp8XzKIBA7OlaM/EWLXGLMGMf
         BSJeDum8tbH/FRed/EUwxVfsURD479G/IGzNp9Z/gK+KrmqfpP0jKM2vCdD1AtmYgtdA
         tl8CDl2h8tya24SmmqOMaSNkNqACfdouWdSl8e8vCiSdrB46Z+dOvlmBw1dzeNnXl9Pw
         M2rA==
X-Gm-Message-State: AFq9FYJXZRpUIigSN4njOW4R3owLygLh0OmKIz3hG1FYn4+6BK1somR0
	J81AuuJn5zaWGpNHXvipeNXxuxNlBlTt2kXgIXXtHOHd0j6EU+Xpbr7xhtL7FKCN25vksNb8qnV
	3Z4YQDhajnOeN7vB2j2PG/VDbtIbHDFhOdQAqU1i4U1T6xSk0rYM0Njmx9UJSbbiOO4Cg
X-Gm-Gg: AYBFou2FZfvMppjHjHH9sI4tOl68mSZtfRdFpohs8HOUznxlnKKPx5qYa31nMzemocC
	0D0ZGkjrT5fvO3PZHWzyL4CDCMChn4YSMeu85+jpRP/EvbYJrJCGm2BMr9uIZhHVdBWUQHckF02
	xY7I8BAE09EvylrGICaLm89Gcexou+yvRkGk0M9UsioXZoxV/WrE1q5HIpwIqtFLFP+4+tef7es
	dO9OZuEahARs0YzLlTfNQuu//ruYEOqjCZQhuZw9ukZ+JGhRquwQ/sjbe5HQJFKH5RD765LFlfc
	QKvPle8TA64U6X7kKXcMAt9ajoM6NjHLPLXGjjKi0LONJd0nGOYncn9dLv1zJhOkK6CyqrlVRGW
	MixGBLoGIaWbeucGm7IOQig==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3410266285a.6.1792055713586;
        Thu, 15 Oct 2026 02:15:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3410260685a.6.1792055713032;
        Thu, 15 Oct 2026 02:15:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6f15sm101465966b.10.2026.10.15.02.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:15:11 -0700 (PDT)
Message-ID: <0e456ae9-7286-4c4f-b56b-9bbaf4076732@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:15:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sm8150: add MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad099a2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Jhhi1Yo89JosEC0CkA0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: zbDm6W-xmF7ph3aPQH1ZNBU-uwkXNIPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX5u/49OIdntJy
 PozBdAjafzorEp8U+ByTz09MZ1Y6HxlnlwzmGz/bMwYtGktAtLhKO1DlQj/Z978HVQzwib8oc3m
 RC9WbvFlKcFGtvwejdErKVkcC3KwE9xtP7nsl0BgEU8dI0HvzNfFWy5iT2KJNBCCixOF/qFZMj/
 hc+mAporM1GVhyP6v7QLALw+cPZBWqurcNgws7HlVREVeYkDA9UAWWQY+TOuYmjkFL9h37CHyhL
 Jr3mdoAJezn3Eo46NB2zcMtuNzUAT40p9yvGAXdlqyNEWZvR+w1BRAdq8tYCMSSDsumkmfLT0bK
 Gby4EyyFDaL8elHqR99fN1j/bwDXuiThm66yJhyJBZrlyzPvQ8Rx4fAtTEzGPnlRCtTizeVXycJ
 MRxpR8/5q5LgGM9pH5o7tYPff9MxR8MTs67ODlWrvJpULWDQxOiOwxgbKJuy6Yh8jo5rH1rbOxV
 DVlhFmNJuzQ+zIgprhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXznKCybEnSaHF
 wusgafezJGFzjdYRreQlg9liyNXSYm+RYVRpnWCUbcKCiKDOHgf7XZGA+lN598KcnAPGyF4SHqL
 kFjAuxtbE1Z92zQNVHP2EFPUy8UnD+g=
X-Proofpoint-ORIG-GUID: zbDm6W-xmF7ph3aPQH1ZNBU-uwkXNIPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> The bootloader can leave the display running, as it does on the SM8150
> HDK with the display card attached. Describe the MDSS reset so that the
> driver can bring the hardware into a known state before using it.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 293fcbacff34..a2d6e6947c4c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3817,6 +3817,7 @@ mdss: display-subsystem@ae00000 {
>  
>  			iommus = <&apps_smmu 0x800 0x420>;
>  
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;

please put it under clocks like in other DTs

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
