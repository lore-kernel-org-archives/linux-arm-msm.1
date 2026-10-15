Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DDD4AA40F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048548; cv=none; b=noAtHO702Di1iuCvIZJzI3F0i3pyouSmROORm4n0x986vl7MU7Epplww5qznQypLfR0lWSeiefSsyALykk3HYjDOUoDt3EuRDfrJM7PFfEJXpWpAvRMYsqFKgH3aq7yiaW4gXObvGyt04S4x0REeA3YBNmHXVZ+zjEaLSKLZYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048548; c=relaxed/simple;
	bh=/wSh3zJmkx6TtnnckwzhBMdBXjxjl8xQdGNCsjICl+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGfhBhA1DwOaKAHqMZXltOgo4c0E9SDinWGdXr0bNKiJsH4ecS2qWvLWnVI0oXgb6bTASt7NZXAFLPvzu832IHm1bqgV4+V37fNB1vZkPtf20y2HTj3aSp/iMfTUY7mbx0UuPaGG/Wc60JPu9zZyJQi8HEL5B9zdYfUQfp3hkiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2ruZgF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck8rdLfu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2ruZgF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck8rdLfu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F60Ao0644564
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=; b=K2ruZgF8J3jtYrUE
	17ObGhOSjwoqNxY0Yc2lqTcT/po7C09qq2p71Ngob6oZfVfXv8foF/tYbeJCwV66
	8ktL1L2KQ4Fy8NRbBjRgVVESMl/4yqr77X8EKp5x2oRt7/c5abPbmTRfo1fkUQFx
	ZYVp76OR4KP4WjzcRWLrKssiKjT8+n2YROgH5NU3Dt/MAWgr4agHSPUGf50RFs38
	uEr2aY1vQmaaukYknt6OqNeW2ivQMeqMV7Eq+He61Q+gYL0IvqrPv1FSViyu7JRR
	mBfv4QlZlKUimDrjzpcFjLu7zQYPLSe8vRv93OV3f0+rXue3pLDNqCTMW/mOdIKQ
	R+6Pkg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9nu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deda201bcso8135311a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048534; x=1792653334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=;
        b=Ck8rdLfuQmvBCBqr5jy+9Uz4eoDWwrAAsRYwuCykHSZxgeFauis4BmLxZu1iq+VCRr
         n5mVKJ0mHO47I5KdAOfCHGZRYcm1AxH1cXYq2ioGU27lyG1DNkW3NIjpTsRIHeJD4l6U
         48UtPrgJTo0U92QWVv7w3oyaAKhtTZAiKi+lx5RRToE8KmjCB8x2gJGbe1RDtlRSkhx3
         5nT51stlY+NfAaedyRHrV4JJ/GH/aTUGZDjLDhyPr6RtLFEIUKk3KS/rFKs03+Wa6Db+
         r4dr87lo92ys/oJPCwRi53VaAu9Nz5OHFwJuiF/c2QRH+GvqOIfIul7P6g9499xhjIq6
         DYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048534; x=1792653334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=;
        b=IcDkobNTH1m7rxCl2yrpUYJ2ZnuZqS7ChSoo9p748Hh4gQ+9kezGjl24llUI9lDLlh
         8LXTBacaBuZJEwywIVo73dfzwhvB8wXzFNd3aNf14bqNTRG1LC+U5UDcnuU+BdiJoRJD
         KTV0pwV3M5fmtAHHGDgWSbyb7qR+4Py5/CPsHsFctfHZ4A1RIwdU35YHl1LtFQOSkb7G
         wkM7vLJuaPzU9a7mQ6D/qXrkTrAkEBfEYLhkk1qL1SpHG5DXv20E1J9/9SdRtIFQke9f
         z27ZlYt7fEJ37+7x5cGSAGiJSx/Opw/WBc5Sqx6j6vgmFe7A7HeBzQfODMMQhZPZkcz3
         ZIcg==
X-Forwarded-Encrypted: i=1; AKwUvBzNvjJ3LKPvrh0DvPnuwkJ8llIVGWtrLT7LA1L4nvPWKwHalJGZ4QCC12nKXU5/8QnveRWlaBR9xFng4Otz@vger.kernel.org
X-Gm-Message-State: AFq9FYLPAb5UM2jBZ+Xb2YtoYvXvab/uH3Ie9Ld1OQH+We8vV5kfnzjS
	ubNj8Sc7z5dbdtqrbizrcuI4HpKXTgGbF/Ccfzkw1XectunzSs1XsjqLeomDVdxVAOAKekEjcg/
	SQ6IZig6pKi4u6P9du1A2AJHLGft2Uf1PQfpdL77GJfTWiN4wUozZt4KRMyt1ANZ4Za95
X-Gm-Gg: AYBFou2QIunt1H+zP+nyLT0UnpTKgBYSjACTHd0s8r4URqiEXsfolfUfbGoNUK/As98
	gvjP6wpp8XS+c+jx6cfXZi5XT0jP3DpI8c0AdlVPlLY39K10iJprFzpy+X3C1ueifZd6nDFXaLk
	kdfFT8+54VVrdDWQG32UPAKb3I483icSPTuAj07n6cgWNAT1t0bjPHtp+3nQaoH4e1LIUvwh17R
	TDaUC5tXrO1wws2ViY57wjjI8jfV8RW3GXTx2xlWAXfm4HvI3IzODlu9hZgGj7RK2chi2Pvqv0i
	LJBjcyOuMPkvbtLitjWQRlIXvGC35Q90EBUyy1NzBfLbmMRap7V0Pn2TIGhwsfRPGTReIU3D1sO
	OJG84jZtCSUIGSxc2uP7T5V7NK9k=
X-Received: by 2002:a17:90b:3a48:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ab3a33db41mr16430165a91.5.1792048534152;
        Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ab3a33db41mr16430141a91.5.1792048533687;
        Thu, 15 Oct 2026 00:15:33 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm1617534a91.0.2026.10.15.00.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:33 -0700 (PDT)
Message-ID: <a944b2e1-3985-452a-bcc6-8b16969a7392@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:45:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
 <03ec182f-b1a2-4ebe-8e48-9e88168f7694@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <03ec182f-b1a2-4ebe-8e48-9e88168f7694@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9nWY0LNmcwNAZKld9MKnYz2NK3aos_5v
X-Proofpoint-ORIG-GUID: 9nWY0LNmcwNAZKld9MKnYz2NK3aos_5v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX0rVFMLJt7awg
 qr4VQ0RfJg3AxKDGCRfFv1QirjC5txgm5IYs39y8dZNexQv7n3vFHixSbu1X3+0o6PHNQsTXw9R
 prTOxdCFEVK2F/CsRxAX3SzH5CcZwyA=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad07d96 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PM9MLdjoRCq9o7e-zGMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX69ybn6Mzn0On
 kSrzNQ+dG2cS9T/gGwlcdbjjGLfavijwKql2g7actjMV0ZSwTP+gKjgGkHVju+zvzO8rb76BaZb
 frf1hX7DMYGODK+jxAaTxShn8RQjNY4d5XHwTHaHtNgE9G5BK9wQBpicU9xcRsQixUX9xw880ra
 MDAKM8TbaKyR4OzruYs8LZiNQDqx5GNH9bmJFP66uN/VaqLlZF8QbACY1ur4Yut6bTQelZByguZ
 u807T6tUEhnfxbSL6LsmL9Qnaq5Nxxgdo7bADeVH+JbbeiOZ2EO6vF2F+FblUSPKyu3H/mJQkMB
 QCpRjXZGGVE+gyg27QwJCibC6tq5yE1WVvDeWOUFuUsvF9YkoKqOS15sAt2cHe6Wk4UU5qUbQhd
 8ShanpyiWuc+bWPLlEHNx62VTlfyfJXIgWqBF4hx9duxRBvrAdIT7MczqFOZSe3yp2fmBTk2GWE
 CZK3Z/cH+VJxTSMyWhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/9/2026 6:55 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>> clock divider. The hardware generates a fractional output frequency
>> from a fixed input clock (typically TCXO4) using the relation
>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>> register. The clock output is routed over a gpio controlled pin.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
>> +  clock-output-names:
>> +    maxItems: 1
> 
> This should be deferred to the driver

Sure.

> 
>> +
>> +  pinctrl-0:
>> +    description: Pin configuration for the GP_MN output in the active state.
>> +
>> +  pinctrl-names:
>> +    items:
>> +      - const: active
> 
> I think these 2 are always allowed/defined

Sure, will remove them.

>> +
>> +  assigned-clocks:
>> +    maxItems: 1
>> +    description: Parent clock phandle used to set the input frequency.
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 1
>> +    description: |
>> +      Rate for the parent clock in Hz.
>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
> 
> Likewise, we could simply set_rate on the GCC clock which is the
> parent of this one, via something like CLK_SET_RATE_PARENT


The GCC clock could be either at 19.2MHz, 9.6MHz, 6.4MHz, or
4.8MHz(consumer/customer use case dependent) and the output clock at
GP_MND can be a range of frequencies(which are not fixed).

    assigned-clock-rates
            |
            v
     bi_tcxo (19.2 MHz)
            |
            v
          CDIV (1, 2, 3, 4)
            |
            |
            v
      gcc_pdm_xo4_clk (CBC)
            |
 	    +----> 19.2 MHz
            +----> 9.6  MHz
            +----> 6.4  MHz
            +----> 4.8  MHz
            |
            v
         PDM GP_MND (Variable frequency range)

I missed one patch where I didn't add the CLK_SET_RATE_PARENT on the
gcc_pdm_xo4_clk and CDIV(additional) modelling.

-- 
Thanks,
Taniya Das

