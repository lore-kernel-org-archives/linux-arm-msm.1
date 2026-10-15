Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600252ED38
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072848; cv=none; b=XFsMt3vzIW96mZXM0QkNjuIO9YzoNMv3M9XfguQD+iabqqtHDlttkjUHX5BUU6wW3Pa4O2qs93HasOtZNDJfEMcmCYlgS+8uO0VGh1xQvC5Xn7fy+ylxUbrxSmsr3ZW8tYRILU/2WRlAwd7RGHAn4MijglbXf1GOH6qdwE4Z0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072848; c=relaxed/simple;
	bh=AX1weSWRV9L7p95o0pE/jdekN3jEDZy7K6K5FfoK1Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klatkdp+BWtLeAKWm40TYHURnB8H0YgZzPeEo8JS6W1Q3Q9wxmqiFbfYtIIqPhrdhY2puZ6W9m5XTB1DN81SHx0v309pEiBcnZi/huuUrWAGg9JAn12cHO805hRs02Rs/4EstI1c8np5c209Fh4PUJ0AT3apeK9aEwnNyu/jyms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zp217iie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+UmIWMF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zp217iie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+UmIWMF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTFM2809304
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GyhG3f6yky5p2xQIB9m8xigN3IiQFU+DTNcZd6h+JBo=; b=Zp217iiexVdzugFQ
	6uGpP7ZvYbwSQKIsaCJ7mubpI3FYKoj9UqbWJ43LZ6TSBOjV/MnaSvMBVmAvs4UC
	igBPFB7ZpxFTmml2sNiRUOm1p+11/YPqmH/pShFw1/yk4s7ODSdMa48WRiZWiQpb
	63Umd8cudmniKleaJIdoNL5guTH1lh+7QdQDUvlw5Xn2Fs4lqM4GpHF4Ty6Xn79n
	uiuOmZVAKADF6H2wztyVGTkX8SroHaLlXsj+HvcfvtTUabthHoPVoOwODj/ymNPR
	CSl/VWyLnjvWktfb25QEmI6F4CXvpvh+Bx1CeY7wv69EIPTZ820DY0CiWJJjxm3a
	Z50fMQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54tx09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:00:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91785bd637bso168809246d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792072845; x=1792677645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyhG3f6yky5p2xQIB9m8xigN3IiQFU+DTNcZd6h+JBo=;
        b=Q+UmIWMF29UdzW+toemaQXtJyE37fs/lKNAlsGMw87i3aWnroqC7mgBcLEbZCt4Bc6
         XP4PTBMhycF/BntxjyzytUOS2HaA/MoQKrMO1ruenx8Pq4dkszKzaD/ITba1Byx/LZHd
         sjOMgcQHXM6+PXa90Vsow6UBSwVWt14+/cUsHID1TxSEWf3T4SUGh+FGSqvGjBUROlYU
         YrTcOwzDXgCa3FEI7BmMRV/I90gSebXEk4S8QqZMDntMu67tSMDHSFl8SdmbOFbaFbyf
         X5Z8j0Z7/SdHULsvaPJ/IYQV4vHaeM8CckMzffDwJAHQYNPPO5lCKVniHHI3ZcMZOWrk
         Vt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072845; x=1792677645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyhG3f6yky5p2xQIB9m8xigN3IiQFU+DTNcZd6h+JBo=;
        b=bhu7P0UjH9Bma68iFrwF/a/+DnoY5T1zukJaPKHepOCqspkBl1hgTxu9GIueHtTvs4
         9BT9t+2RtBRgW0N+PSYLwpdFBl066VQ/ZAlUuK3AazgJqAjqwAekuOrzXRCBU5f6I3bh
         vG+bjoz8sAt9GkXqFGTVjIgYwOEC+oNoxGMiRmAMZZRKHmWKP6XljoxwP77n0pMpR3s0
         dag2snZnqctaYoJqFofltN+PirOcYZ6XYdZ7aWr6sXEu8Ep+5e/FEK3hvLecT3VY9oE6
         4Dw646qGV0ZMrfhWZSIjIKrIvtXRK6HJg4ITOqAGU+ba3W46h7N8fQccDvDXDCPOIeAs
         5QCA==
X-Forwarded-Encrypted: i=1; AKwUvBxLGpPJxuEceP81QOyCkNh/11rdxsUGTJ0t0wL9hx9/P++HIE7QzyI2EljIW4fH8US+OuPIrNT0CUNxYGrD@vger.kernel.org
X-Gm-Message-State: AFq9FYJJGpRQeJbKKhm7eoMPrQ5ToJdZEJIaMD6xxIfnKV4PCjergUn5
	xUNTCOHC5/kVgDYt8YqQP997r23QvUn+hKPNNrUBYz+PZPDYqdCcVWXawlvUM/EN2xCvGVUFMg/
	EfFBr6JtzNYxMszdFYQbR49BxCSi2qcv8xTus4/M+qYN5dON9tuM3O+8gzfBubFxHbv4f
X-Gm-Gg: AYBFou3zmde3duFK3crxwB+QB+0EnTfmY4tl1Bfy5ZNPihRK2k1P/lv1c0txCJ0oZRw
	U6zajinpc9z11rNd6bAcUS5xSLYSWSigvXpxxlrw2STPNheICHwJY1WU7dL0f+a1LB9zoQ3fSFY
	msXRnRccZurMykVpuelAMFPrr3xIoY+a+FJgOY9HPOTZPL5CmqeVu5jYdTc5rx8Mpv+cC9IfuAZ
	ZiIYZDFdw10A4CB7cbA44TGM4WGoJpHemvGFHSQLlnwDeGfAuRrBG1fNBFO9ziKqizxX07B8RIo
	gqbf4E8YPRVk8dPj0RNuiSA5VFgRVZOYrEx8GaH8kdjAht3BxtwpRoYBQIKdA+gY/apzNxMn9ir
	hUciklweyp9o4yLMxbjPw7jmWpsU7VA==
X-Received: by 2002:a05:620a:438a:b0:93e:a8c5:1340 with SMTP id af79cd13be357-93ebd25394emr3089508385a.34.1792072845112;
        Thu, 15 Oct 2026 07:00:45 -0700 (PDT)
X-Received: by 2002:a05:620a:438a:b0:93e:a8c5:1340 with SMTP id af79cd13be357-93ebd25394emr3089496785a.34.1792072844394;
        Thu, 15 Oct 2026 07:00:44 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.197.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b32ffbsm129953566b.34.2026.10.15.07.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:00:42 -0700 (PDT)
Message-ID: <1a3f3b8a-fe88-46be-ad23-38c4da650183@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:30:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0dc8e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=/y/JNeyFYS62MWjl30sOOw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=erN5cKggTshIPlD3kWUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfXy64dhqEbXdvp
 QHL4V8d7v0Cm/mU7O97vZQ1K2uzJvcTf/O1A6WYT26KHe9TM3dWNdty69gNJKpFIR/5wgCafSbP
 UfZWEUFHhSruADq8OWFh5DRuS5CxfIAZp2tuswBY3JDW57x9yv+OF2WANYmGPB4vl5csxrK4Q3j
 SCXPEvopTaVMKO0893Wka6uO7v6bqPEvYDPgZQLKWcNZxGRcmBpxANtaqiwvy+Ia28sLPp1ihYm
 WBAesf+ABkspSdDO0qnPFebP955Co735EIiSlliZ7CsKei8Yk7TAwqRqdW57Qv2QTBElDDpg8Q2
 rIW7nS49EsqDUGJz4HxSDgCMDWXbJrXepgRF6LP26V+u18O9pmibNkYfNq6MMLNcz53aDjkhiww
 zRF+H6VC8S3vuxXZMGlEGsK/hQepXgMSyfSngvHDoIZrPMNjFJ8ny92pjVQKOuR7PflT3mkPiGO
 ouNz5MpYH4Zmb491X4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfX9/56OTRGmh8T
 vpQxXgmn6VvbPmypQu26fIs2lEGyXFhjYAh6r5tUVY05nW+mA/YjSvktQc24Ld2XQQYA7YoKNSO
 vNrpIBvTklEsLapNr83u8b1OsPuW1lY=
X-Proofpoint-GUID: zALVFQDyoTmCK2N7F9zuRF2mo-hZ8iGp
X-Proofpoint-ORIG-GUID: zALVFQDyoTmCK2N7F9zuRF2mo-hZ8iGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150055



On 10/15/2026 7:05 PM, Jagadeesh Kona wrote:
> The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
> Hence remove their clock modelling and add them to the GCC critical
> clock list.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
>  1 file changed, 2 insertions(+), 30 deletions(-)


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

