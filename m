Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA1038657E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183709; cv=none; b=CZ6l+NWuEX/pYSASX/wDIWdVwzIsc0PJgfRJdv/LITXDpU1pJ0oME780ZiQXhQHaP3kncftTkPKGnN7brtyU0bNzNPVqZteieH34C9oCFWRfAEPMSqCyxGQ/bcSI5w7dWkpcZztLa1kP4bof8brzS4/NPvrHJzxckop6VH6cOKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183709; c=relaxed/simple;
	bh=7/GIjI+OhCTsFchnZELFwMMPgRUq/Deydu6BTUDf7ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKwwVfApdFh8HKuM98/70rm3xUqqITT+KJX9BtI06e5Q2RMuc6lrhr8yZWaCcZyjhLxM7nNd0ZZY9MsoxFnAz6sMsuWxuheSkVHrIqvG+0pF5jzapYJUED14f95IDewovs+dlCMtb8hVwKHqHuQsbhCgjBFtKORfbPmVLVifGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djq/ScPy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWGbc3XS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djq/ScPy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWGbc3XS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RICCWk245914
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1k7UGAU0dhgCC3X+aLHm8h5/tGBNO+q8wVuLsivqm+k=; b=djq/ScPyR1Uva56m
	C5U4u1qATqVI9ZvdCIjfxGLknC95jivY2HZZRh9g1a2TVGU9qEghFYbNokfcqMIt
	VyFiezZOnr8tNQO0N/w9vEbzH79HsTe4cKQF7MvvBHHZKBeJUY8as/KdZjLI71ta
	lkU2hf0dCRlI2nwHPbHdFOjg21HfbV1LDLOQOeExP5PhgK61BscTQoV6mOwiVQof
	ZG2kAVs04sPu92aRQLqiArSMgfhdt3dkpRi1GTCCaPa1ZL4HiH7Unrb9vNdokMVV
	b6IschqcH3r8EiPfaXVv6PeyymyOkeyqfJhBg7xkbgdVkmPPCS96iz7hRXGJZ/Yl
	0xggkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbtwbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:21:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cccfa32670so40655145ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785183707; x=1785788507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k7UGAU0dhgCC3X+aLHm8h5/tGBNO+q8wVuLsivqm+k=;
        b=LWGbc3XSZyB/oqroIogGolnte6KsShrJ0Ke1jHngpHuRUACBP6jljZdJXF6ENXgnjE
         118XztVsHFxAQSuu0+/7q48fZlHFZg9sUNSdegMF5oBqMEydxN5itysgartwl8tmYDvc
         D/ZTSECs0LC6+1+9UY7de5ue0dBf6wDHYw3dl8BC4Iy7rzzGGu536CMoq6BbuvQ3HlqG
         O3wyE3yMRbSqxkkr5WIzhJ9Dyvd7q3tpMUrebsqt9I9WS7zYmWDxk3b+pktHXepRDZQ5
         gLItx6tbOAVJoP3gf5Jf1x3sGbZeC4ucVY8WCC53p27w8aqYTP1scilocVnid+R2P8cN
         B/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785183707; x=1785788507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1k7UGAU0dhgCC3X+aLHm8h5/tGBNO+q8wVuLsivqm+k=;
        b=Zh9nWZN6ZsJN4zMp4QJE6Ko4sXABl7JCSpY5qDuM9FKr7TVOfZPdwhfpiZs/LlKw7C
         tN/w95GNgHTTd5YhSrunoTcjep3uCIfh5c+Vdudhh5o6mL/ONvdPdCgUWf+V5CiGaVrk
         mSL8n8FPpZ0rtyUrqebFl+NoX/saJnxCUijgYlmAQClx2b3cLw4Yzdsg6TI9mvhGZKW0
         o2SIAhD04i95RA4YH/nR0zf78VqzJ9f5m6jW6rDigWDR7B3s/JEG32nSn+HQQ3cFoZj8
         rOeVWxpKpv6XkfZrMnwvGGL9pxicCzfWUV/HjJrTGYFJFoMUJqxvOlMDXIWIi2aQdFlS
         k6VQ==
X-Forwarded-Encrypted: i=1; AHgh+RrX6uTEg4vZWnoqud2vX5BKuDiN3/qn3r6sLn0x7IYCHu78NEbvTYnp+Cih+l36lw0BQBXWF2n6OsXfnULt@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXT7xfWo8lTQbuSGeUX3ip/j2gxHT5ip1RZumMHzQsD18aMLG
	4qjuUBvTURw7FDJv1eKPsfzM6gU4AkfqF8wFmmBg9AI7biP84iCCUO6HQ8CO+rSwWOys9iFETKL
	J3X/pHYpDMnhGGQ1W6vCWBEXOU+o0US+I+nbmTkst1nmyFXnwUnt6dqJaoaQ17tQK9FVe
X-Gm-Gg: AR+sD10VKjWEXcj4cKn30oGSesDzoyKK5d+zYPE08O6eqsmVO9v1j0VzbKg6v52EZ0v
	AJ7809P9n5Iuff4x5TEvK0M5eQ32vYUGCGGLh1UOM1RfBPFI/o19ihxwB1vwUxcUN6hGFQ9/y16
	lpPaNFL7uoeDMgVq1G5ReG/tj8Rm/UzkeLKE2cmu6PepAkA1XIH6gqDngsc+dSJNXapTatuTAVd
	D5d8PLZAu7l3+0Nw6TwEElWmG3nulxARYQv43iVm/n1vJHbWFI22vQAuR9BCK44nfEHNEdVH0dQ
	xfYrDBF2P+vQZ1cM+36i2Epj21X7D9685lhovO6J3dNnzoRwDOG6mei6CW91uF1+X20o1xLXlNV
	segI4lYRDTYCYs1uWt4eIf7Vhj3cQ6Q==
X-Received: by 2002:a17:902:da86:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2d00f3e3878mr7260995ad.22.1785183706754;
        Mon, 27 Jul 2026 13:21:46 -0700 (PDT)
X-Received: by 2002:a17:902:da86:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2d00f3e3878mr7260855ad.22.1785183706354;
        Mon, 27 Jul 2026 13:21:46 -0700 (PDT)
Received: from [192.168.1.3] ([106.212.244.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e3e0asm40132515ad.29.2026.07.27.13.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 13:21:45 -0700 (PDT)
Message-ID: <d4d85975-6588-4f66-af99-518aee5e51d0@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 01:51:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260727151230.408122-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <1e5ab24f-d836-4d87-a21d-3d172a03b0fb@oss.qualcomm.com>
 <20260727-hospitable-chestnut-caterpillar-3c27f5@quoll>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260727-hospitable-chestnut-caterpillar-3c27f5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M08yOw7bNWYnRpBOsXBrlTFP0DGHGWxg
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a67bddb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=yelsqLKVWbcqNe5dfEYUXw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PAIWl8Xa6EgOu36E66UA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE4MiBTYWx0ZWRfX2NDpK8SlguF6
 DvFpRu++Hg/52RvPT1ifloO1q2mFu0K1UKxKojVv6mlOjELl0U599Esv8VDqEDenCOV5OnmFw3/
 R/oAFmxgi2Q/F9lB0Mxj/SWxQkg6bj0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE4MiBTYWx0ZWRfXytHS/1IEwcoi
 2ia5TH/F51HRR2aNL7jiz7xs2yT0FMyAbrN3FtZ2oNAfPVakQPT7PZfkgJ5Gs9ENBWdMEZPcOcX
 XWZk3O8oMP5OOSG6xvRVyjOEK4x32YelCqWw+8Nm2vpX4VqCoP404K67QBzFbObfD8O2LqgspGa
 sa/wIiC4nqlAXt1pmaXViDzyDgP9hMIpdp/gWVtRFZ9F/1++FDWDVzGsOILI90jabWFIfctg0mN
 MllXyLcxrqESIdgydgIEyVR3/nqqvOCEbi6aQ5K1Jh+gH2YKlGTNVXUVZklCFioNEUmJlz+y74N
 1DAnL7LvnQebGKIUEYEMDrLueNOY8YbiRUZCJLHVtGeDOEpVaZIuZfKFLK/sEQUUtR49MXRCo/w
 64WzrG6pfF+HRh0/DNfscRKD8mLSVZ875RB1ipuvFt7vx7hZM+Zn+ttaDv1WlKWj5rqSlsT2eM+
 A4g23f9Ci9BSFWwpwtw==
X-Proofpoint-GUID: M08yOw7bNWYnRpBOsXBrlTFP0DGHGWxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270182



On 7/28/2026 1:39 AM, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 08:57:52PM +0530, Ajay Kumar Nandam wrote:
>>
>>
>> On 7/27/2026 8:42 PM, Mohammad Rafi Shaik wrote:
>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>> describe Digital Audio Interface (DAI) child nodes.
>>>
>>> Add #address-cells and #size-cells to allow representation of multiple
>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>> per-DAI properties such as the interface ID and associated clocks.
>>>
>>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>>> wired to the SoC and do not always have an in-tree codec driver to manage
>>> their clocks. For these designs, clock line enablement must be driven
>>> from the platform side, and this series provides the necessary support
>>> for that.
>>>
>>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>>> introduces the required device tree binding support to represent and
>>> vote for these clocks from the kernel.
>>>
>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>> ---
>>>    .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
>>>    1 file changed, 50 insertions(+)
>>>
>>
>> Thanks for the patch.
>>
>> Tested on Shikra-IQS. No issues observed.
>>
>> Tested-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> 
> No, please drop. You could not test this patch on Shikra-IQS. It's
> impossible.
> 
> Otherwise please provide steps which execute this code on the target
> device.

Hi Krzysztof,

You are right. The Tested-by tag was added here by mistake. I validated 
the complete series on Shikra-IQS and later provided the Tested-by on 
the cover letter instead.

Please drop my Tested-by tag from this patch.

Thanks for the correction.

Best regards,
Ajay kumar Nandam

> 
> Best regards,
> Krzysztof
> 

