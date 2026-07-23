Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055ED47124C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813529; cv=none; b=Al93aHow3yP4+Ho0krvs+NpOqLLpBhsoqSp/Zhg80k41N7gyOEx9il6e0ENth0LGk3Y987cwy8jdy/B9gdTmELEeD2rcGCrVGv2D62I+sp6wm2jW3J0QPV2wtqEWbTq9Z+gU8GWl88bbeJtqvzxm410eUm/WvkX/EREmjNyeRRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813529; c=relaxed/simple;
	bh=8Ryi5rxkmLYm0Rpkhz905fjJXX7sMk2QZABkWrXs2Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9SYO0wZqv/qip/xQgLJByw/4lx162IyE9ZkXZCPvftVkQ5sImZCtsYRoiOWkjEEb1XFsV4fet+ZKHScXm4n83Rqq7q6S7i9jPGLM2fd3VmydrFPVY4V17OS8IipS0Sl7ix6PhSAURlP+FPHYdow5hJeXgL0bAjqXi+NmIIZlE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdEJuSoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3AdbNtp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdEJuSoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3AdbNtp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCw56v3605782
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mfFGwI+Y5Nvk+ywMER5eZzI1kmld/UUazQ0TlW4XafU=; b=GdEJuSoXLgSjwEdq
	1M1+MluDFSaOWCzWCZMNipoITgmFV7CwnFljpM8fC07Wq7URywRTBW6BPsgeulEG
	5HabiRU/jUUURqGJOfL1ib5uQ12Nj7DzoAOdQOBQWWy+rc9JmPVx/PyujEtlt93y
	6f0p8WwtNNmjmJvXe2vKH7kt7pHmzeok8bMzZom81REYIpMl4dLpwaL6UAOOWQeu
	oIA7OTqIOKUBO661hzhegjU/bwrQkBlgmHdGPcItwcfjoSGVximP7sy9XJZP6MWn
	rQxTaAPLxQjUfHFSpKVgWRQbfs2hgaI1d9l1g08ugdTSiZkEaRkp9HpHg/OPwSXC
	1LMW2g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq9chf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:32:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744c091ec4fso40395137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 06:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813523; x=1785418323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfFGwI+Y5Nvk+ywMER5eZzI1kmld/UUazQ0TlW4XafU=;
        b=I3AdbNtpTpfCrUVfEz4VLKz+NSVbtYrwbjQUGX4df1XRy3BmFop7wEYVv/H0GXpwg8
         /DbEo0mk0iDGUVHYCn8EejsTZ3XKy4/wgZp4V/cPk2roy+J9W9FMdNTwhFb0CY2AZk2l
         xNF8CmDffIih3efKMLfi3HT11pFqu8aYP//fXffJ3LOjZ0XfZmUKT9pFa0IuvnnGM9Qo
         /CjTE5p4x2UmtiLywlUhr/As/EFCbVbURIPQdpLtlTm7P9twFNv9amYjVvNnLqeqdyBi
         pzkdlyoQTQ/nZ+UzvOWaD6Vf+zHpJwaJctDmlfHpi+74s+3C6UKNdsQDRA/ag9kiwLMr
         mA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813523; x=1785418323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfFGwI+Y5Nvk+ywMER5eZzI1kmld/UUazQ0TlW4XafU=;
        b=btHfCaIjBVDP36rJN3LLqMRUn+ZScRZpyaR3A9FZHEWtya8Y90vV4G3P+joX8kQnPP
         VkbjnzEGWv0ZdVFGUS5EW6QUFJHa5IHNPDtmTVyYi24Smm3ajwxhy2SRXB4QMk3bsHpF
         kwpy/kuEsugOcuZSyC/OxTZ8p8P2cW4xi5OPrH2ZB1Ty+EM0ReZDLudM4BOeZ/g9d37/
         32vF2jdZ43e0HFq0380IVXo/6sYMwncwxYLXI149reWXMDXdlFAcuNQIr9cbRPcCM8Zq
         Cag/EgOG1jZDXr3zYl3mNIFYZqyACR0n+Vk7DBe7HsA5OsgYIaFlx49NziVCO3B7PoTV
         eq4A==
X-Forwarded-Encrypted: i=1; AHgh+RpeDG4JinttjelRPYgh1DkC+29ldr3g3SZvkwoogPmbxI8+sAdslGm7c8ncX2DTVwHFiijC+wvd2ebdAptS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5lfvuIE5x2bw0n9pxa9C5JAT4cU7OlOrECoEGPaayYlR12zw6
	u21ciN8cGWpjoXrK1CuBrxqvY3+2QfYJSelV+s1TDxINg6GH+lyKw1KdEVh1LWJh13fkduIIQTp
	HAox46Wlhqpb/xtXtfKas3MOsgX/ZXMsMe8c0greS+MzZ2IUfUVbeX4YtQkKQNVb3oaGMNTx6Um
	SU
X-Gm-Gg: AR+sD13UTpIxq+B3FEVe1Q2sWv8tPYNVnNfijNoDdCfOWbZN5vShHJMtF1DE0hkj636
	NpskSsEEoCw4mLArkCwoFhW7cAX9ju39spntH/KpywQnwAre5PtWEBeXSHvMglguIU4Ku6Hyngy
	NUWERge7hCgArqjjwATE6YmIRan64stQd1SYxyT7Guruk6Q3ww0ViymLxDhOrcVHES2uGFDinvT
	+6V4FTRiIAO0TlcwRhdswgNRpV2D3/t2N2MRAcGUbVzpaeqfaMkLAg9oCbtKdQojBhK/Iy+O7VN
	4eQUl/7sat80kpau5Y7LvBR0s/EbfW8GSD/iXFKjOrOBf3x8ZPUtrx0Zv7wM1wNzr6QV0kIXtm+
	hVvYmE39FpAQLbJAMab70khuD
X-Received: by 2002:a05:6102:f12:b0:631:4d32:a86 with SMTP id ada2fe7eead31-74e4cb505famr74931137.7.1784813523087;
        Thu, 23 Jul 2026 06:32:03 -0700 (PDT)
X-Received: by 2002:a05:6102:f12:b0:631:4d32:a86 with SMTP id ada2fe7eead31-74e4cb505famr74923137.7.1784813522708;
        Thu, 23 Jul 2026 06:32:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90788sm232087066b.40.2026.07.23.06.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:32:01 -0700 (PDT)
Message-ID: <0c8979c9-6d3e-4bc0-a324-e36d4f0a6a37@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:31:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
 <dd22171f-7444-4c17-bcc9-f337fe9677c3@oss.qualcomm.com>
 <8d7ee8d0-66bb-4420-9e1d-615557dac277@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d7ee8d0-66bb-4420-9e1d-615557dac277@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX5QNv1E6nmQ2Q
 cYQedTuiLpkkMbMObgCVETX/uF19l0dOHCi3w5vQQ+YDcTg5v2EYhy6z1rEz61TkimMZhFLo0Gi
 GlTY6BeLTCZWq3XD1R7frAGA7pcrB2s=
X-Proofpoint-ORIG-GUID: i3WdzEMK6MfTzBCdinz_Ogi0rG3eXV4P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX1p/GDkYjRbEz
 CmwWl04yWLkj6H8flpCuUhmFljWuV0YmirYWz9rJFW8v6Ti01dntJD9PQA49AVERznqDZ69H9vU
 62KvAjBEJJwguuMnrqXuFzYihnsjKMo46hAjGl5E6PzcVN64FE0bnnP790aov0LPMjDVIGcwUkl
 uW0ONiJ418wN0oi/Sthge1sNOMvpxWicfM7InHn8L4yCZM3u7+eZOpDJkJnlDW8F7eNsiN8P9qG
 TK9w5HR2IC+zLqBcV2aq9q9AxMdEUuXZfLLbRhTjmUBxFaWSG5N1TOigE9f0IqsLyUrADKc7YNo
 zNJxhu0SZg/vHMsxJlmEuK2GuHJrJZYv7z+/vWPFIGWMv9a2lPkO47QDlZRBeOimFJBog2f3OQD
 /B9PUA4dlQETDpEwfxX5WW5EouozvzBSIN0I0SLRxmMGpwqwuMmCB3Py4/LUlSyPXxqwor5h2UH
 yniggna4clGVAPv/iGQ==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a6217d4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=mSxn-Q1uSbZy4lC67FIA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: i3WdzEMK6MfTzBCdinz_Ogi0rG3eXV4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230133

On 7/23/26 3:28 PM, Srinivas Kandagatla wrote:
> On 7/23/26 10:14 AM, Konrad Dybcio wrote:
>> On 7/23/26 1:42 AM, Srinivas Kandagatla wrote:
>>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>>> mic capture and jack detection via the SimpleJack SDCA function type.
>>>
>>> WCD9378 codec can be wired up in 2 different modes.
>>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>>> each of which has dedicated control and data lines.
>>> "compute mode" on compute platforms such as Glymur is enumerated as
>>> single standard MIPI SDCA class device.
>>
>> Does this require a different hardware wiring, or is that just a
>> difference for the driver? If the latter, can we choose whichever
>> mode we want (i.e. use compute mode on the Fairphone or use mobile
>> mode on a laptop, depending on what the OS supports)?
> 
> AFAIU, Its not possible to change it because its fused and this also
> brings in some physical bus level changes to soundwire aswell.
> Ex: on compute we have one control lane for 2 soundwire masters driving
> 4 data lanes. on mobile every soundwire master has dedicated control and
> data lanes.. Bottom line is its not possible.

Ah, sad. Thanks for explaining

Konrad

> However w.r.t to driver given that is same IP, I wanted to explore if we
> can have a single driver for both.

