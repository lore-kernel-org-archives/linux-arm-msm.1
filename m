Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F6C1A9B58
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379895; cv=none; b=gyxBUCCpxDg1KrXGPmeGdtud/zWpjNS6e54X89Q1WrVWxLCT3qtkTOiZ+SNVTeMU9+CDt2aWmR9VCg6CDyNbIrg59qYD1doaQKNtMt1b4xhuCGHuPQqBJU92CZACjMHofoM96dQz4/aCE/YHlaphTJQubeTgFWTUj7YngAhErEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379895; c=relaxed/simple;
	bh=Cr6Mg3P0Q+kOQ6fcmKRjfVQfbXVt+8eGxgKUyr2ddME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFkXeSVfPCedB9xxYplsX8ZnWdUP9cXDz+aEqaVnp6XbNSIhioZ5LaBA3FxQPTRUNtMZiotZ+98a7TjbEDvocyJoODtpT5rVKMZIeW+dR4EjLSu3Qq5IbU3qd3J+xj4kA5DPpjwlNwuGII9iozm8DErWA6PwbZXlbJj8dfJG7hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlVn+a7R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekMIFzHP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlVn+a7R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekMIFzHP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHoTE476125
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 13:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jN072AWICsPoUEzDlNVZ41tT8WbbOTfcjl4RUJ04GkI=; b=YlVn+a7RGjZw07YW
	shYoPw5E8AYcg+6MhvsJkn1EUPIDoDamg4ve7Z9bxy2Z5eqJUnEzHdan6So1Gzgy
	Q4/3g84Pma6FRn2xusvTwHpICACcTjvoXUG2r8/1dePuqfdRBM7tuPYoNOetCHeL
	2J07cUVxaP/vcOD3teX2YVBrNVwFltwTuMvVI5+lbMLYkxoojeOAGotd5F51Ag95
	v0RNDhohN7jFvEn4mibiTEbc3bLaEEfSoS1kj8ivb1pXXj7negaNFgA7cqVlvkW8
	LOV+8O9EF+Fn9SPXXZ6AyiKvHvSAL+X5ImypekPF87Lb51+7ci8JbR9NG1Nvi3Iy
	2NzKvA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bngt8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 13:04:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso7960728a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379893; x=1784984693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jN072AWICsPoUEzDlNVZ41tT8WbbOTfcjl4RUJ04GkI=;
        b=ekMIFzHPv0NTIgjhTzsd2NasnsFhOdy8jwtH0/5h+rDgSdO/fS8MuDobAxH0RmHGjn
         xUOQxG2VZXb8+lUdu8I3qGs+P355aQ4WgPnl2xmQA45IdRSsGOkeQLo3vecCTfXHmeDa
         bZqP4WPHpgL9Ouihv+dmQ3v7tpWGBsil1GSPM1YRd5E/ds19GPjmf117KeN2yCm6hl04
         /NSfevoubK64TzgfYBOVFeBE94RDKCF+R2tcSVOFFkTT94g8//joBrBb+IIH+olKCKPT
         2WBDccP01zVy+oU7Ch8pSnLDzHdiZrRbJt1MkhCACd2gWx92RZnnhV/64Hm+elSg43OY
         39Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379893; x=1784984693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jN072AWICsPoUEzDlNVZ41tT8WbbOTfcjl4RUJ04GkI=;
        b=pZLc0YNQfIqo1/gy8EHhhcjSXlt2Tyk55q5viV4cfyIkMALs7fFuhOZuH/LhE6dzCi
         98EH0jzjqmeuFT3bjvOtpIJm9jvYlXY2ziDCuGjWuNOekGlQGszOUCp29LgoQ2I0s+K4
         mXgfykIAwkPnM8AGGbJgHpvJ0Y7sALhNaRJvGocoylobbzSqwa4Plp7rel6Fd/DpKr33
         g8G7M5EJ9xPXTaeNedtfD0u9BvrSY809jTmQDwOoiqyyVPqF7x4QnEggw+pLCSEl0nAW
         72oTbdFENFO+pqyu4aXytsP1wvnJ66+wSJCruWijlJErWY4pQx3fnok5t4WbLwi3I0w8
         AraA==
X-Forwarded-Encrypted: i=1; AHgh+RpGeUDFr0siDtnEDWBRyFndhB6piUA1FGU5v2ccU3MjEAblPtgDxJ9B+jEuqkM92C+4vDBynVGXK6V+Z56J@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJNvSu7WHPObKOT5pk1PkouLIkaZriGXdW/4cvBAztXlNe3c3
	8fXk7SFoUz8syY2TBOG5jsYjlLmTYOb3ZfV62VSGCIljb06lH1bxqDf67cH2BcvFjjUQDYS6m4C
	Wyxrl+GxOYu5rdLZWjZOOb26WOmw/Re2jHbwsL+42J0f6nonWt3IEjIrlkkX4wYoxZl3M
X-Gm-Gg: AfdE7cn4Efs3MFfcJOW2C/DZUZX54v1vsP5h3T2646PBe5jONPyZ4odSk3XEKkw1CXc
	I3myL7D2LRQgXdVJCBmBqcuiIFu0iShG8fTjhXs2xV1Y/4mYjsHJ4ZYjtKFY5CWBUqqB9wuB06T
	ezcxof6XY3PYThKl7oeYutVZBsr7vuR1co2H7eMtB6Sg5UhuIFYS82FcQ16/4x3wsa/XbOKNUiR
	Q3ZyOCgphjnU/uFN69EP7YMLfIi4HStjParQcvNL0A/wAVWr8MZoPvPsuET7g6/s82MG0GikSa8
	l/9Ox4HLwbOuKa7vYeDAe3z2xYgd8XKKHWNuLKRXhCXXlDrN0DhoVDiY2y+vmtP/DL3aAVZ2lQw
	obBX3Oj4jWZvV2bi9lX5HwdPyOzYkAw==
X-Received: by 2002:a17:90b:5606:b0:38e:c79:8112 with SMTP id 98e67ed59e1d1-38e4b41fd74mr6860729a91.5.1784379893254;
        Sat, 18 Jul 2026 06:04:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5606:b0:38e:c79:8112 with SMTP id 98e67ed59e1d1-38e4b41fd74mr6860691a91.5.1784379892874;
        Sat, 18 Jul 2026 06:04:52 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcccsm19989257eec.4.2026.07.18.06.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 06:04:52 -0700 (PDT)
Message-ID: <454c3fd8-6379-4808-bcbc-ae54534cb295@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:34:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Add additional frequencies for
 EMAC RGMII clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
 <627d9c30-5b6f-4634-92ef-5d70d3843102@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <627d9c30-5b6f-4634-92ef-5d70d3843102@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzNCBTYWx0ZWRfX6zbWUF2RkoNL
 k3HqrxPiV+VQq6YgBOxmR+jfiRQSXlgwZIPtQzSD6Gb3+HxpDtXoDEGF1e73MsJ/UaaPDb87Uyk
 Un03mXFzhWMip9zlS1NX0/v0q2jdSuS5whzjIEzhVZkbuar/bA+7Kbg5iA6c/OfLURJrSw5BoMT
 35KaegW1QFp1mA2tzz7jE7visO21gXLtkoU58lN4Ewz8PrxaFTJRhZMjZuwn/MBgpEsb9ViZywS
 r+fmIzhpVxnEDX3GDdyQK2d2QUmF9kKRNo+PZX+UQfDWz6q5MG0Ulmm4AY/ba89Hgr0K8Ni5n4v
 VwX8y2BH+tGxRL+yqs+LhXkuDiNakhaLDRk4GQqjFLT9zLsEgvpe+KpCo/xlm3kb4sdI2UjSADZ
 3VrfCa6xt88W07qUIzfMOC+pXCOXZM5FVi3T/Eem1NLzPwlthPdsSlzKclQTewDl45AbzEgByTY
 rxBqytwviMalh4vE7EA==
X-Proofpoint-ORIG-GUID: A170ONgsaOqk3o5tUIRUuD17LM44ncB-
X-Proofpoint-GUID: A170ONgsaOqk3o5tUIRUuD17LM44ncB-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzNCBTYWx0ZWRfXxduZZIa099VU
 dIBP+YOuI2ENzADBuaqCOhCdmyGWL1pERM8hj5I8FxDqGZqAJbjYUwDPgN/SoQyZ241mndSBhls
 Yvfb3rw5R9MT/sDCmI1gd1SY1mXQxbI=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5b79f6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=1plhUvqAqgq3PYIhvHH4kg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-LE8F9h2gSoCF2HKZX0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180134



On 17-07-2026 02:18 pm, Konrad Dybcio wrote:
> On 7/17/26 6:03 AM, Imran Shaik wrote:
>> Add support for additional GCC EMAC RGMII clock frequencies (2.5MHz and
>> 25MHz) required for the EMAC use-cases on Qualcomm Shikra SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> It'd be useful to mention that they're necessary for 10M and 100M
> speeds respectively
> 

Sure Konrad, will update the commit text with these details in next version.

Thanks,
Imran

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

