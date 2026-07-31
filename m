Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF07A3E7650
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506845; cv=none; b=eMI1YsY+E0bx7iCh66U80naO4B87tmd392ihhjcbaCGKbGNNVgr2NgZ8q7B0JgGvk2C16Ks7cbzZ/as70sgRw41hN93QbPvejlGZm+ShL6pVATEURaatwOlp/jO4Lf5gvVd7N0dxmJGUMPBJkVdpD41eFYgTzH7A6nrPK8hljGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506845; c=relaxed/simple;
	bh=Ipd83tvs5tHlvqKgCI2fStVgwKZodlwvcFrZ6rmFfnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XgE/+fXnViZBhrJC2gN/AmFLJrSdv30oYVlX36NWX5aQ2ORwszq7ZSyttUzyTJR0hwSx9f6Wt2uHRWf/3eCU/caCLjZX05gGPKJSg8d37MZhznHzXVDTc/7cNwuea+HAOPozHvhEPeuM150aKz8BiqivavaWx7Fgmyn3liSJEg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZ+kO3ne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EU0yma8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZ+kO3ne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EU0yma8J"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBa0Op3742179
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RTiRKJ5MonxgEru8fCq70aq6/NcAgUdpUxtAW+EJi8=; b=aZ+kO3nefTTOO27u
	EHbuin3w6oc9gMdbLhWWGFMTEPCYsFAGEsnL9sCMByAYrPoKvU/hLS2MoBu0WHfb
	i8zJ6uOy6za7dDuRcHknuazF3+ykTlVaV4cT18GLTHJz3BL7RUBhNNXDYbWAi/H2
	2lql6pY3JDjLHSJrqiAKR/Q67o4dcExzPYRDFb9KjkGPXnTjwgRxIWh7Se/Ma6yQ
	IKeZr64/nHoqvfr2QhInSYmLMGfHhO1SrylT4uWDctOl8XjeIq7UJBafX6EYL8Pg
	gypbTdO/ByztJ6GKQWPJ2SfxUnPgixjwi+O6nTyXxSNVR76UQEfqISUpCeZyiPXR
	+Ix2QA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqgmtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:07:22 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f18b7ea78dso91214a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785506842; x=1786111642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RTiRKJ5MonxgEru8fCq70aq6/NcAgUdpUxtAW+EJi8=;
        b=EU0yma8JqxIrQkQCUezyn73HW706nNEm0YRCzebva4RZ14ur0+IsfS59i4etetFTSa
         AhquM2tLYUTx/SE95d89RCouLnkK0au9zy6iUw/kWh/WzoIk5i8zzBIDMZVvCh1/EGOK
         DK9tTlA3nt3HsG+SmsTPPACk5PNAy4/yzBvylke6sz0/zj83TCkndGg98fTFjWeKAXZ8
         2rq2FZgUA5izlLl2iI7NtsU7ON3lAFU1qF7DvFifPUFZ2Q2lBzb/7klRThn/TTGR1hka
         hDPP4VZW2G1AP6aY/JNp518s18H5A9GjHhyGGhSYoDJhSRjrfap3YJeuwWtDsmUyDSA1
         Me1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785506842; x=1786111642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RTiRKJ5MonxgEru8fCq70aq6/NcAgUdpUxtAW+EJi8=;
        b=TQ5Py6IQN3oJjpVCmZL1V5Tsx2H6mzxK6rlB584PS2po2ZeDK2Mp+STtMVnCCiAO6p
         K/PSbJIi8N3MsnMzG0lmEfQCK0R01tuDZAxFndMCMwITgTdyBywXCyoBfJiEb00UZEk2
         5I/8AGOQbp7srhVGYNZdak7+rtfnzfM0BtEgWIpivwF9y/0h/QhnUalWXjC97twSD7jI
         frqnKMZK2VInhzkA5GfAun5l9/HB+CP7TADcBnx1VZCOXiaJ8QYjp0wZnmSaU1iNeQTO
         WHqhGsvZDclttUfR+wrDwgavswFFxpIY2N05jXSImBbQDdjo1pbk3++ZTgVUvIpJHehk
         G0EA==
X-Forwarded-Encrypted: i=1; AHgh+RpywhvJDSw6IXoUok+QWAuXvjffIlAJhV9wOciFkpPeUAP/rx/b8igdw+91i0oI1JERY3FrSZK3Dnr7e2Pu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Wv5c/DTEyondcTmHJLepYUc5VI0nXzCoNb0rgW6qhe9Gcvdh
	maPViRVpzUBSnRG0iJcO/Pf8MafSlH7OityBrqlzpMBnj28DenneaqwBHyOL8QDoGeMv9bKC9kk
	ayb7RmZWT/mU2F7HqjBc/3oE4X0mRZ3nYZCF5uEE7tTFeV2er6/m6mJyVYpJdoX+wHoF8
X-Gm-Gg: AR+sD13ce/jPeGgabJtBe0MAafC7N2jZPgpSpMFcefiYSE16b34RWOq/IAc+7ibQNpi
	l1MsbYbJu+XYOv2xOy7ZIopGy0es+PYlbQqB038OG7U2laipTDJwXv7XBHF2tVxA9pOGuFQv75u
	LzXXiy393594N5s+xTVG9JNJFdU7niiqBTIBy/cl7hScsm8JqoMXFURM+oxJaGOo4pp/R5XNhXe
	/97XG0BJdNsF0qmkxFl+z50CEzMXfjQM+VzDcmPiaimBwvxrt7S2nZ6qsitpb6gkVPcU9XRFM5J
	Ki3T7tVCryg1VEHQtUjxcORV8/07Qlf1w4UcJLzdcVUNJ+0DrV0PCBbmxnmDu9SPQU06DVlF/cd
	KaN2WIYIRtmSL+Ypxo76wmtsi
X-Received: by 2002:a05:6820:5703:10b0:6a3:d9c7:376e with SMTP id 006d021491bc7-6ae431a3d85mr160322eaf.0.1785506841906;
        Fri, 31 Jul 2026 07:07:21 -0700 (PDT)
X-Received: by 2002:a05:6820:5703:10b0:6a3:d9c7:376e with SMTP id 006d021491bc7-6ae431a3d85mr160282eaf.0.1785506841410;
        Fri, 31 Jul 2026 07:07:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9ff0sm139807566b.42.2026.07.31.07.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:07:20 -0700 (PDT)
Message-ID: <016603e6-8e87-47d7-96fb-5441ddbaeb28@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:06:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] i2c: qcom-cci: Switch msm8953 to the CCI v2
 timing/rate config
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
References: <20260729-cci-clk-fix-v3-0-f3c731d1596e@oss.qualcomm.com>
 <20260729-cci-clk-fix-v3-1-f3c731d1596e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729-cci-clk-fix-v3-1-f3c731d1596e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwNyBTYWx0ZWRfX7dRRDRWCjJyN
 kt3KtDdmz/RkA+WRmccZ6hxmMus4A2+ztzkS7uxi6bSEdXsqjPv2Db3CWTCaSQMzD+kpjtyg1P1
 6UhKL+HPTEpa5ISU6SAw5eThvCaMSmIZMIewKQ0vd8/GO9DxLp06AhSYNTonbH+3jW1dYvHfSRb
 f9hFzYPPK0UBSu75LW2u7+bk18pdr8x/81DuDuXi7+k/patf6y8UA+h5YXVh+peRshFNBNNXZIV
 0C6J7zE2/Dsh28c3KqI2LsIeGix/PpA2MrMqjvW6tMht5RhuA7ib4OdOmF16cPup9UHkSFTGzIh
 2SVW0NUJW+7AIUQ7GgIoRGL7zFwhKBUMV4go06R0wWvauDGYyQM0SlK0cyGPsaKAAts93LSIlQx
 4gFEADvCVXm3GAIVl2oBcdmbFjijTuCmZjcxKaQau1UsccmW2jzr/YQDPv2gXKhQP7+SvFlnaPL
 PRhJ8reGJQmQl33ULvQ==
X-Proofpoint-ORIG-GUID: 68HnbeIBp4rKupddsjtV6zniy0sK7Wuc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwNyBTYWx0ZWRfX36CKjThRTtlq
 WQegwPlqspi0aHuTMz8SrJz3sqID7EPDeA1zfj5msAUDOyIJ9OexpHjQAFA4W4yJ3ubctvwA+KI
 f14pFmr4Kt805yX44yX+TBVSkFNTE4U=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6cac1a cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oFlMz6Kjfd5ZYSfE-JoA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: 68HnbeIBp4rKupddsjtV6zniy0sK7Wuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310107

On 7/29/26 2:25 PM, Loic Poulain wrote:
> The msm8953 CCI timing table is internally inconsistent. Its Standard
> and Fast timings match v1/v1.5, which are calibrated for a 19.2 MHz CCI
> clock, but its Fast+ timings are essentially the v2 values, which are
> calibrated for 37.5 MHz. Since all masters share a single CCI clock,
> no single rate can satisfy all three modes with the current table, and
> the DT assigns 19.2 MHz, so Fast+ timings are wrong.
> 
> The msm8953 CCI is the same hardware version as msm8996/sdm630, which
> already use the cci_v2_data config (37.5 MHz). 37.5 MHz is supported by
> the msm8953 CCI RCG, so reuse cci_v2_data for msm8953 as well and drop
> the redundant, inconsistent standalone table. This makes all three I2C
> modes self-consistent under a single clock rate.
> 
> Note this requires the CCI clock to run at 37.5 MHz, the driver selects
> and enforces the proper rate in following patches.
> 
> Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Wenmeng, have you actually tested this on MSM8953 device?

Konrad
