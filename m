Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA23C13F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280668; cv=none; b=AiP/KfdIIMAbE26WqWm4smpy+d+uZ03eLQlJu3rkQlP6FDGinp/gIP4J1hbQJuoEhAiRQAAmytKykma6HSL34/hAkR3cW4+viorSIpT3bAOhqTQIwr1AhyeL25BU+9Ea9AQozel8lN7ez88IQg86/twXamPMzbzftgmjVkbsFxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280668; c=relaxed/simple;
	bh=KLQicBeZx0Z69urp/IOAXMYEPDKZvOhCcrX1HF6jdio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AkVgPxmvB0zO5Cs754tf1hgMiWU8YzPbB/G9+zPJ7HMlMvFcS21LX0ZEOBF+7T5sJlcSZrp0Nctf4MqPtFyh66lw6MIIAgcylGiKDvgcOCgpkXn8LuF8q/K3+AgapZoDuekznOVl76Rc+DKXsX2OTeIzbYIeSk3ybjc3hK1NEEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRtCgrBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnXmNwfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRtCgrBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnXmNwfJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cSWB951378
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aM5py9i2hJf4DZx69ahJpSCbCz3n48OjyDSAbOkMjFM=; b=oRtCgrBRdHoViwzM
	LG5fZ3Qtm/T9lqDjRRsho928cj4yGFjiZ7ocnfWG4g2jGu4LouKj4drIxODGmCDN
	hk155wgwaa3EzVCXb+PyRUhCiixVOnUTOmGpR8o9zPXE3tDpGcIaIEZPm3RNOoyU
	jugju53PopccCKOVpTtElrL8knYVkeSqimN5ezE1x/T0VmCSOyPQfKbofY+k4ap4
	9/hIbcGQagEL23n5XDL4gwg9Yszx7jLoBR/pwjXUAFxFr0/Q5tQNxIo5Aw2cGgHq
	NKomTPiwTAFg9LW2R5WwsTRPLS7bCFG5WDfrcZH9hpmQcESIXzn4xMeP2x6rO09n
	ITe7tw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2uhxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:31:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so16148111cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784280665; x=1784885465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aM5py9i2hJf4DZx69ahJpSCbCz3n48OjyDSAbOkMjFM=;
        b=FnXmNwfJIwmZsItyOpo25TClwFJWwrdwDTgmlRxjg2R5d2Z8tntsynDPsO3d7mypUM
         t29M/ffx49FSmqX67D4whGn9vhWJylqGPl5HWdfv/K3WoUmJKpzZQwVokuNs5wu07fjZ
         Mc7AIzrwmlobOTyvj7OokTLY0/FJdlaBXuNnXxCKIdvuJRjFizNTbPswLrndfZhtCJhG
         Nb5LoeM/GcEdRnDInMbhBAacB1q7tjJ+OBl+LI4gu/8puqU4TMYBFBDSL30NUvJxdLC1
         r2znulH6QaacJCDy8s7nZwAi3wa7WjjA1NLPIv06yUXx3Qtz6TvbMs3pCawC9N/xeKbz
         QCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280665; x=1784885465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aM5py9i2hJf4DZx69ahJpSCbCz3n48OjyDSAbOkMjFM=;
        b=TR9JRUHleBUsNp0ulPB67+Zlca44sLU7QsJF4G90jFzXLaIDxH+l5wdFaqY1UjSW8o
         lHpaJTVxyD6x/cOPLfTRTL/6frbVTpDa5f0L8ARKo/snQyLJC7wxSqOinnmEbDYj4vPX
         LTvavk1wQxMuX8RM7/P8jEbR8nOcMNTa9Tu8Q5A1xn6sRMy8UNQDKoE8To3WSEDRt0Xm
         V4quqcng84YGJJLeQRbGOMoH0UDfNwgyuq7R16wzmVAmB+xIp5e6FXHwD38I/cKLVb55
         PPFwBDGevejE9DXlc23JHMHdX3hnA9YDBKSPQafioUB9ruDNFTGjebpdkFtXj9CxTL+7
         IABg==
X-Forwarded-Encrypted: i=1; AHgh+RqA3EMydCLR8h7UsCQztjx2gVnZCss2aI/59nuErOVLIWBLXdwzDUMREwPtTK12lqM9kYmhUMbC7gLh6AzM@vger.kernel.org
X-Gm-Message-State: AOJu0YxKjR3lx7n4p4I9wFJUxuxVzF+7KGR1V77kkT8h0QDD+llN2g9d
	VYyDwj1SzXHY75//7KRyhgFjgjGKqL9/fOIo/7Rm94O5IMvjgR5RRNEsFopfjYPXRpvtR5An0Q3
	8ItLVyhwzWp9A6nlOV3lv2FVxqEaZGyr7CrbUPPYX82R8CfaqhFxcoUG4HDN07ogbXTe1X+6ClA
	GM
X-Gm-Gg: AfdE7clOc6iX203/ICHEoWfv43ura11ZlpBmkC3B1utAGVPsRwbFJ4tfh16ad0ZxVI5
	u293WTZ0vLuL0XoC9nWL//P/iS19rsD+7Aue7XK7oI60WODYYo4vqXi5/rOCzOfGXY02YRJBI6i
	ZEeiZiK8U2cnZqsvvI9uXZX/GfFERUJh0Vx+nchDLu+w2jQ6K3mgWweNijq7sgsVjuCxnE1Xu0M
	iKnZvKf+xA9Gmvd0DDp5FoH0pYWQeS4cgeGJkImR5lN841ugrgcIGC6k+CnYi4t2YHA56Y3dPdP
	BQTOq9gGbppvwWz++V9DeC1wc9lX26o6FkM97mH6lC+xrec3zu+S9j3jIxI5r+aFlCyejuVdt02
	hiD2JjzaU+UaWaB9/1mH0FP5B
X-Received: by 2002:ac8:6145:0:20b0:51a:88bd:95a0 with SMTP id d75a77b69052e-5213c109e32mr8622891cf.1.1784280665442;
        Fri, 17 Jul 2026 02:31:05 -0700 (PDT)
X-Received: by 2002:ac8:6145:0:20b0:51a:88bd:95a0 with SMTP id d75a77b69052e-5213c109e32mr8622751cf.1.1784280665011;
        Fri, 17 Jul 2026 02:31:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a63ae0sm46622166b.33.2026.07.17.02.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:31:04 -0700 (PDT)
Message-ID: <bc13f78b-287c-4832-b2f1-a68e7b35b57d@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:31:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in
 regulator error cleanup
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: quic_akdwived@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WUzHMjUYu_wYUGEm7y5sV_meXjJTbomb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5NCBTYWx0ZWRfX1WWCo9YlCS/S
 8zJP+8n8Yc4j8GAg9gRFbvhhMXgLhRWQNLJqT5xX4VYTGbYCiPUkKJIZ9yZJ+0DnJe9RQFDUeSX
 cJ2wEoK+dIMBlkXrdLwYRNPCa8Qhx08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5NCBTYWx0ZWRfXwKqsA/zTBOZD
 t7XEsL7pSbZ6/Y0MtcdY0p+SY2p2nPzBy/v838COWmx/NRZV/j/AAzRl2m+42CeIU1fGnCWfMJh
 yj1pI21LhrUE9Z1ZiMTxYj6d6JecXzZGJB1fsKIsW2LeC86k5Ig650RMdmpucWV41t20s9EizV5
 FReisL8pAD2J6EHftKCEjazmg5tdpzzxO+PL/QjPio2rKpt+zvYAoajD/HiySYEpkBI5BN67iLC
 TGhI2m0lmIing4C1CWPbLEz2HpKsCAoxmlmeUWmWybof6Kt+7NcQJ975Nhnz0v+WiwdLBAKU+nC
 XR20vvFGRCHwgprMxWW2Bj6v4am6tOkz01/cVtf6iOXykt9UloBgu4pE7SHE5e4pUYeeEDcsBQk
 WvKGwKz+Qo0QLXkCGjtdaqGDgB+bKiup+k3rVaRQQF+TOIRXLkn2t13r/qMRkWasl5gpYbwoMoQ
 72BgZjl+nklC1o/wcWg==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59f65a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=hI5qLSgjwfH9RGL9AckA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WUzHMjUYu_wYUGEm7y5sV_meXjJTbomb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170094

On 7/10/26 9:46 PM, Sailesh Nandanavanam wrote:
> In q6v5_regulator_enable(), when any operation fails for regulator at
> index 'i', the error cleanup path unconditionally calls
> regulator_disable() starting from index 'i'. However, regulator 'i'
> was never successfully enabled at this point, resulting in an
> unbalanced disable.
> 
> There are three distinct failure points:
> - regulator_set_voltage() failure: voltage was never set, load was
> never set, regulator was never enabled.
> - regulator_set_load() failure: voltage was set, but regulator was
> never enabled.
> - regulator_enable() failure: voltage and load were set, but
> regulator was never enabled.
> 
> Fix this by introducing three separate error labels to handle each
> failure point correctly. For the failing regulator at index 'i',
> only reset the resources that were actually configured, without
> calling regulator_disable(). Then roll back all previously enabled
> regulators using 'i--' in the for loop initializer to skip the
> never-enabled regulator.
> 
> Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and active regulators.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---

[...]

> -err:
> -	for (; i >= 0; i--) {
> +err_enable:
> +	if (regs[i].uA > 0)
> +		regulator_set_load(regs[i].reg, 0);
> +err_set_load:
> +	if (regs[i].uV > 0)
> +		regulator_set_voltage(regs[i].reg, 0, INT_MAX);

The first two labels only unwind a single regulator

Konrad
