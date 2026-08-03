Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4CB3033E6
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772223; cv=none; b=N6FFjyRamWW6XR9hhxUJrAuFv8/i8yZg86FF21ZBArR+6rxAToZTznFL/bzneQGC8p5yUnjDuPmhWEOP59nRNePNf/kECvpU2hfbxXqSANbzLCmAjrFNrGoTO13QtHAzESECUln23a16gyeh5FZ+vPftTy46ZuakDFuSzIF/IUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772223; c=relaxed/simple;
	bh=mzSuL7MszcrY2PnDeJbOJ2bs9P669YqWeObHSK0sayg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1N1Df8wtE0/qQalfiDNsiIMVgxig2w2pisYnevrBFU1n2nSmAwIN8sRNkVU5jB6urfBwgmxEGOXneVgUSaQPHseZIe2EelaEVDIomnZaAXk7nF5gEv7dJQrXpW5aPR5yqceqIIhUNGxWucuDtRZUGf7NVJApsNRBOg1Bz1MEPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHFN4YII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PT2ZXH7e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHFN4YII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PT2ZXH7e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EBlg7595666
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 15:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VCgP14LAVui9SPYNKhXy8/aCYBM7qTFR8oqPud903Vg=; b=YHFN4YIITmGnIbV/
	Bo+2+UzW0OJEP6YiebwbATiRqEHVmr7T/Bm3MDW8mrKKPQqIad+C0b218ot+Wx1b
	uEa12Ki8Q/E3zFswoZFWYopH/VqU0cdJ5DDHRegivt0hlB6a3FMSTJ+NW/BdDaue
	a7OmZv7oWdGHu2zMtQhCmyvG3HSbIKEOPg7fv4RNVs3CZwIYzmo28Nf6Gm9CW4fK
	cXmetIwCI0OAJLawSGdd/6wmC3cLcYFWaj3xu4rcdNOBM7F7ZpaRlFneqjErC3fg
	4EuW/Lfh1VO67X8YbmUApDHulJiEdX7y/MiBe7xBYYvguBUKUfETzUlFr/eCqbab
	oFrs1A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb2dnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 15:50:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5461460a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785772220; x=1786377020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCgP14LAVui9SPYNKhXy8/aCYBM7qTFR8oqPud903Vg=;
        b=PT2ZXH7eex9M+DD/GpguuSCEb5UXgbuY5FZWcy4fSaUbLzPf00W1rWR0JpFZLn7xwi
         8gv9gJUthNBLO+DyRCvTYfgY0mFnGuNPGcr13AhVwdFqsHICn7miFMl8Drl6s9U/2EkQ
         LjTW9GqqevMnG5WXD5U20d6OQBcvhJG7S5/mBe7QSYGt1AivoYV5wFav7xDD0IAeTFRz
         ri0vOxZePSuehTwvKlkMg5Egpuruc1ydxDLmNb6ihBpDN0EDzZfS8pR6ApOnjIfCt5dO
         bouY693Jrp7sO1b5tUaliLxu5drm/YtkoSvI7a97Dmfe7nwf+VL+DTQhcCYLBzJaHn2H
         F3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772220; x=1786377020;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VCgP14LAVui9SPYNKhXy8/aCYBM7qTFR8oqPud903Vg=;
        b=axR/Ai5B6wv2/4SSFvxVZ8aVdkSoOACNuHHiByTIwviR2vO4E9IsB/s9lAT49GDndo
         xKJoIZTtDoq6mjAFbXNimvws0/LzacqHupJMimVmerCDA1+hXmr/TjG8i+cQ46+RTC62
         31dl0MlhagIS0E5zkRE/Yp6oRmOxOsq/kzD1WQX+lssCAKu7JqPQo3NYbbsugwoafuoF
         TFx+XlPlcN7Y0/eg/nmNvVNsAl7894DbzyLGsW0fe5/wzDYbSWBL50MfpDPEh6NgRu98
         ij9r1t8R1SQYiaYSl7wzbf56DHJucydhz/F/Olykcj23LHi9GIZDRcVJ+6GKhraOTHBr
         diHw==
X-Gm-Message-State: AOJu0Yw7cSiZ+fICtT9Z/gtuKQO1BpkfxGlrExZmRTNga8btarj48n5N
	e5NtOAgK/OnHRHBS9HAW5BCFv/LPNoU0+l+1FglWcEwuBVJtnqQ4mnH1TZXPNwNLN7IjWwQ96uw
	OiltRRVrS7nzfxf1lQiorDnj7Fr5XitFOZeYk8TszdxKvwEP609rb7lCQBL+ACdLs0Nuv
X-Gm-Gg: AR+sD13/xu0rSnDATF5a1DOf3UtP13RcTuFP4gNtlj32nKiW9IC9MUqPO1ygUdV1LY+
	ECocpT5lhUXYlidW8eOTZzkbFO/u/78Igg2jkYu7cThbRAoelHUxaKKphE4xtQZ4OXEU/MJ0uWS
	gcwN2Z2OQCbLZOQXUqq7LTIXQkX8kEDvTY4rwHCAmCSxzXPCB7F1EGA8hhaJuO/2s6OFx7aFFFO
	roYtB+D2BNukjaUysVKs+jxUMias3csIPuQEU4M0M8+TnmOmONb+ld+Q8XShfP79HLFk3HBGC2G
	vmA6+8RI/JigrQDtRoAEg5vhmQwD9vBW1UQTqj6/981K/uYGNR21Amq9s/szc/JcV/hNXprdjsY
	oNQzd3eMORcfTo3NzqfJNovux/Pa7m3p4fw==
X-Received: by 2002:a17:90b:5807:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38fbc45585emr10216194a91.19.1785772219822;
        Mon, 03 Aug 2026 08:50:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5807:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38fbc45585emr10216162a91.19.1785772219302;
        Mon, 03 Aug 2026 08:50:19 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm56104807eec.19.2026.08.03.08.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 08:50:18 -0700 (PDT)
Message-ID: <7ae5b4b5-708b-4c8a-94e8-3582cac1b762@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 21:20:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <20260801054610.4047089-4-prasad.kumpatla@oss.qualcomm.com>
 <f24e2ad7-520a-4a19-9ebc-5771703de22d@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <f24e2ad7-520a-4a19-9ebc-5771703de22d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DcA_QDTHeqZ9uk-VsqILXGv8Q8zMEu15
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE0MSBTYWx0ZWRfXwPLZmuJG25xN
 AFqbIVETWqkd/sTbznTTFeOl1qkiuLXuxLyLjCzSSwp3igV7c3lWuFbOSUUfQRlbxUF04UZNy4Y
 5lKc8MMyyPy1NqwihMTWGJjsMKWDrjg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE0MSBTYWx0ZWRfX1zS+i0UZ+Anc
 RwhOWV5lYHab3U9dKE60gRNNfwCkhfPkbgki93cvcXg3qPp8j2N27hFOM1fa9IbEBz+hdkyXhH9
 OgvsFpTOx/DuOvqbLup4ZsB1a7PugWyjbPvK09cr5EtT7LKnzvNtOKHne74XNXTVMPcqyTjTKp9
 c14BkTPglMbreM4ziGj1Zj0Eme/WKtwYxAfAARvFtTUxceCSRE77pq8RC0bvhEFq3R0HtxfWxwd
 SLkNCHIuwqPzbX1cFYNgH7f7xnypwxfIQGez0VLsrGxYn0446GRSWqLQeOHybWNrT38403fD6/s
 f2Vi1rsw/eqQCcSmK5ast+S73hZ9AIYU0kfE7mVWVtDdILTAgMfTmVnfCIvSAOF/1lhi4n3DaqF
 xUNWl+Fr6o4muCSgGw8e2rhJgxvbPOgNwm7A8jw089RVHoeAGOb+EVk+qHUTzKnDOx8UVeGU86U
 eujmsgdia0LQKp6jWBg==
X-Proofpoint-GUID: DcA_QDTHeqZ9uk-VsqILXGv8Q8zMEu15
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a70b8bc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TjsEG-x9bXOF-Ie2ovQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030141


On 8/2/2026 7:00 PM, Srinivas Kandagatla wrote:
> On 8/1/26 6:46 AM, Prasad Kumpatla wrote:
>> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
>>
>> Platforms using Audio IF module backends request the interface bit
>> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
>> header so these clocks can be referenced from device trees.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>
>>   .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 7b553a73bc92..fbcf1ef9ce22 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -233,6 +233,35 @@
>>   /* Clock ID for RX CORE MCLK2 2X  MCLK */
>>   #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>   
>> +#define LPASS_CLK_ID_INTF0_IBIT		71
> Patch itself looks fine for me,
> But the naming seems to be bit odd and misleading,  what does INTF mean
> is it QAIF or some other Interface.
>
> Please prefix the interface name something like
> LPASS_CLK_ID_QAIF_IF0_EBIT or LPASS_CLK_ID_TDM_IF0_EBIT.. etc.
Hi Srini,

Thanks for the suggestion. This LPASS_CLK_ID_QAIF_IF0_EBIT
looks good and appropriately. I'll use it in the next revision.

Thanks,
Prasad

>
> --srini
>
>> +#define LPASS_CLK_ID_INTF0_EBIT		72
>> +#define LPASS_CLK_ID_INTF1_IBIT		73
>> +#define LPASS_CLK_ID_INTF1_EBIT		74
>> +#define LPASS_CLK_ID_INTF2_IBIT		75
>> +#define LPASS_CLK_ID_INTF2_EBIT		76
>> +#define LPASS_CLK_ID_INTF3_IBIT		77
>> +#define LPASS_CLK_ID_INTF3_EBIT		78
>> +#define LPASS_CLK_ID_INTF4_IBIT		79
>> +#define LPASS_CLK_ID_INTF4_EBIT		80
>> +#define LPASS_CLK_ID_INTF5_IBIT		81
>> +#define LPASS_CLK_ID_INTF5_EBIT		82
>> +#define LPASS_CLK_ID_INTF6_IBIT		83
>> +#define LPASS_CLK_ID_INTF6_EBIT		84
>> +#define LPASS_CLK_ID_INTF7_IBIT		85
>> +#define LPASS_CLK_ID_INTF7_EBIT		86
>> +#define LPASS_CLK_ID_INTF8_IBIT		87
>> +#define LPASS_CLK_ID_INTF8_EBIT		88
>> +#define LPASS_CLK_ID_INTF9_IBIT		89
>> +#define LPASS_CLK_ID_INTF9_EBIT		90
>> +#define LPASS_CLK_ID_INTF10_IBIT	91
>> +#define LPASS_CLK_ID_INTF10_EBIT	92
>> +#define LPASS_CLK_ID_INTF11_IBIT	93
>> +#define LPASS_CLK_ID_INTF11_EBIT	94
>> +#define LPASS_CLK_ID_INTF12_IBIT	95
>> +#define LPASS_CLK_ID_INTF12_EBIT	96
>> +#define LPASS_CLK_ID_VA_INTF0_IBIT	97
>> +#define LPASS_CLK_ID_VA_INTF0_EBIT	98
>> +
>>   #define LPASS_HW_AVTIMER_VOTE		101
>>   #define LPASS_HW_MACRO_VOTE		102
>>   #define LPASS_HW_DCODEC_VOTE		103
