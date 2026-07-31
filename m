Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF05356751
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478075; cv=none; b=D0mx4T06yVbGlLNVojT37dWdgMPMZ2UkqXF31sgBMa6j4//YvhatJ6Ce97VpjugNdW1xC6gkl5pRgBBFRT4O/oPy8qN01eK5aH6OcwHKII1k3ALFxoAvvYaIGD8n3ivAuxhqk76X5rvfwFBApJkXqfl7vHvj2PaEaG+nPExvT7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478075; c=relaxed/simple;
	bh=NPgDZWp0zjQsX8p2iQgy6uXQRmUxzcpHU0jWoUp+/g0=;
	h=From:Subject:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=D13cmr0mpSmGiJlqkvbZg6rzXfC2NuF4wrdzz6sb9z+4F0uXz1nKXTQRcYupnurcBAzxlOnJms7RybH6bn2mQthvMkXoLb/B67IA+k2QWva2Go5uXkMULuiZ/Hl4npox7GX5ZHf186ZCz0uASXGttZUnhRlpcf9qQjbritToNi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2WFzYbZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KIY8zlx+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2WFzYbZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KIY8zlx+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V60E6m3130940
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBTysN2GKJ41mcelD+ifbRYjVUJ9bYWfxCx14PKUL/k=; b=X2WFzYbZrtKhMHY1
	D3Kiba+nZpKXKJ69fDhMCIOxnU5KS7ovHs2+FGhXsCWSons4VNxIw+vO6bdYtwur
	eWusiunQkJxiT5JQ3TW6APSPOGbT/hYceMHFcBHEyLodg+dYX8QdqEzPo6v6nQD3
	2yqFEoJ816vOz89XKQ69unkDZAiPn95CyCe1tBFs0e30nkPBLpxgkkO86OlzW8pJ
	SNgw1p8i6u9UTfjqBKJ7/00IJlvemreRWImrDq5yDuoJaJgwRMfU+Nr4/BAH2XzP
	qKcp/lbTFvLKMKZlE6dsstIcxlD9kn1rzexlNW464KxjeLXqpHbH3Z6llWzstoJw
	m0OpSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp2ar13n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:07:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so513893a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478071; x=1786082871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:subject
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBTysN2GKJ41mcelD+ifbRYjVUJ9bYWfxCx14PKUL/k=;
        b=KIY8zlx+kmXk7Do9pumkLKR3lti8UiQEXQlE4dY7bOEicsOZtZEShBUzvHinFz4/22
         qJ5SUUsZViBBWDv/a4ub8tXWb+dejjdvVywHg3/fQeYvtM88i/uvTWnM6w9tVquCVSEF
         GU9YtsYHEMLotPjOHtcBkSW3+cfhoOhLU/Cd5AFxluwpV91KJfgTlPYI+1wFzQkuekMV
         8b3s4E+W7opXvoUFSiB0hy64IOiSFjr7WeBTIo3Q/9/8THdiDQJ4IDB3gYwOemiOtYjJ
         qBKPhbZHcQaXAtvF7UW7b9+l6dsSrP+jBCbKavGKQNlVU2scOYl/HzbGR+GX4AfBb8Gj
         x33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478071; x=1786082871;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:subject
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cBTysN2GKJ41mcelD+ifbRYjVUJ9bYWfxCx14PKUL/k=;
        b=cd5PGsSfpUgvLJ7zrnBoPoCwOJU5DK45XvxODPXXxc77rLpzGFE+8/3vvRh25YXwc9
         Co3lUXX/cHYl+oSLsZQjDHviCe5lRKWLl4NVc8UTEiJ9tFAAkBFekI2E7Jv9J/GCNQIA
         l7Fb3T7qqmwtXyOxXKiVhrsBZMWLyVsMOmCPNODzXHCUYMLpLy6rFFgUxIyKpQQ+0vp8
         fm+ay6U5OlYsQwhtF7UNFMDMA8/sNIpP278tblRlNdkuDEDuVAJqS4pz1GVRzH44nIe0
         HEpkwnoaRvQWPOMvwJe+MBJIGmX3XFZj4pMLGDHiXvpJBR952e7ZJpJaaeqrDVy/rweZ
         8mkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWoyBkZCWOHAK0H7rydqjFKmf1qtyPFPLg6p+NZGlfm+h8Z9emQV3r4XjHH09RI+SadLtAMtxzcN977OZR@vger.kernel.org
X-Gm-Message-State: AOJu0YwiUkx3BgUwbE63nvXNFi7F3Z2+EF9z3kqIm8zQTCMons14DHEb
	IYWJKKjAlpZcm73vVS/iY5r1doHdkw+zUtALho8li5Pk6/HAAU+xhMq1ImmaCmU3zfVMCOcbPiZ
	/l2IsmHDAv9ehjQwtdSZsDTkF0ZQYS/vQlSs5/VyqJox5AGcVLrGF4cC6bsD2bu0yi23VA3X+lH
	AD
X-Gm-Gg: AR+sD11iFF2MKlXHgV7wAU7LDYa5F1Tq7aIUUts1KmypxgXcsomeTLD/NVAah0bInwj
	jgrbvvV2NI4v5ZxXgS7ec+yP8ZNU/QDXOauuamq9YNweKxHKzF7t7P+5KILMGTJaureir0v/h3G
	6Qav9wLdcZPf24djKa3DzW8eZW/Sb4xWYM/+Vsa5F5J3t0mklnrKKMEA7M4u0lvC0nllN+9jQe+
	aT2jbHRF+khjQto1YoPOeOesStXxDHAOmfWML21HCbE5ZB7lyCw/mrDaFrePaazsAImCs4wdIo7
	7PmWCtl/3VazmH8p3ogoPT87wBbi8Voo1a0B54uMdhle17ePjiv4j9P6yPRwM7CaFO3H0/eJN9G
	G/TnJC7BhTahorz81pIJk0pYCi0Q=
X-Received: by 2002:a17:90b:1e41:b0:38f:5869:387a with SMTP id 98e67ed59e1d1-38fb11d7b39mr731130a91.8.1785478070796;
        Thu, 30 Jul 2026 23:07:50 -0700 (PDT)
X-Received: by 2002:a17:90b:1e41:b0:38f:5869:387a with SMTP id 98e67ed59e1d1-38fb11d7b39mr731094a91.8.1785478070245;
        Thu, 30 Jul 2026 23:07:50 -0700 (PDT)
Received: from [10.218.4.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2f65459sm210656a91.6.2026.07.30.23.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:07:49 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/4] mmc: sdhci-msm: Reprogram crypto keys during host
 hardware initialization
To: Eric Biggers <ebiggers@kernel.org>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        ram.gupta@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
 <20260730140822.1976635-3-neeraj.soni@oss.qualcomm.com>
 <20260730191823.GD3139@sol>
Message-ID: <6c795412-ab63-22f9-0b64-8bc746fc2773@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:37:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260730191823.GD3139@sol>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfXxCZdCw1lKZx2
 BiASp3mgAlp5kmiVmNZsdwJv3RJVcCk6wCU8yrR0GBo3veBA8UBXEqStKatMK1rLd3tDrbJyGc0
 mGDmwxKU5JtuTv3nHY0wexdNnppdTX624in6SnR9J9P5XbnSqFuuaQG1E88jLDhNK+yNYM7xTw/
 0DrKhAn8+myrcK7q9BPGVoBw4irq7t60LUaJbNayMe3y4rhJ7UEMk/NHowahBW/NI34Q4sW03Yi
 0nCOeSmnW1au9niigHTSaYsRY4SKmhO3aq08NUK5ZxDb0dO/bhPHmGqRGcIftesKcgYOSlxK1RE
 LX2GJNYieUr7L3mjdGXSwEnn5PwCC9OM6i8z+ktrykeweMWlts+lHaFergzAP7bgv1uJedAuc+2
 q72wLIH/f3Ny+qpaFO4hsSgXY0h0Q23/jFSPDV+LAl5RdH3MoTMBz24GtoQmAuoDxuw480cKV8x
 pA/wIJo6X98/s8M1fSQ==
X-Authority-Analysis: v=2.4 cv=RYOgzVtv c=1 sm=1 tr=0 ts=6a6c3bb8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=j5mz3ktRbTo_uisptNEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: R_OYAJGDVqi98oKN0nDNJotbWO06KtFf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfXwXGbociYSemi
 VNl3FxaiJEzER8tcptSWR6pPfV1b2xMXiZdlSQOBDWVbHOZliAe+gdgJe5pCgy72rrQKHMppjLx
 0LvrWHmW1H+KXBg7zsOlBT7nfx5frkw=
X-Proofpoint-GUID: R_OYAJGDVqi98oKN0nDNJotbWO06KtFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310040



On 7/31/2026 12:48 AM, Eric Biggers wrote:
> On Thu, Jul 30, 2026 at 07:38:20PM +0530, Neeraj Soni wrote:
>> Host looses the Inline Crypto Engine (ICE) keys during hardware reset.
>> Re-program the keys while intializing ICE to ensure that ICE is available
>> in the same state as before the hardware reset.
>>
>> Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-program of ICE keys
>> is not needed during MMC runtime suspend/resume.
>>
>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 4aff965f0e2e..7d71dc6f388d 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1958,7 +1958,10 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>  				cap.sdus_mask * 512;
>>  	}
>>  
>> +	blk_crypto_reprogram_all_keys(&mmc->crypto_profile);
>> +
> 
> This still does nothing.  The crypto profile was just initialized, so no
> keyslots are in-use and blk_crypto_reprogram_all_keys() does nothing.
> 
This is needed to address those scenarios where device is running in a
stable state and only the host hardware goes for a reset, for example,
to recover from an error state or stall.

>>  	mmc->caps2 |= MMC_CAP2_CRYPTO;
>> +	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
> 
> This seems to be the actual point of the patch, so let's simplify it to
> just this.  However, this is also broken because this is ordered before
> patch 3 that introduces the actually functional key reprogramming.
> Please drop the no-op call to blk_crypto_reprogram_all_keys(), then
> merge patches 2 and 3 into a single one.
> 
The call to blk_crypto_reprogram_all_keys() is not a no-op as clarified
above. Hence the changes were split in two.

> - Eric
> 
Regards,
Neeraj
