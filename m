Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598033;
	b=DtrNOZd4jEuwm7UgmfUm44gvvjCofT2x4NlUFn7KgBDYPEGYizCtav7a0O0cGRxDssc8
	 hCu9YZKcTCQKLwZ5J/1s287atOvOaT4OhyiT6KPOKJYexm4fPj98bfYANONT8166m6KeR
	 wYsQREvTiNF8NIw0vg3BNT/2VQr5yEzW/yE7aZ31S24PaKVnK6j+RkI/nMnEQPr3DFuyP
	 bFJMLYl82Ue4cwKRY9cmTtd0nt+CrobPJZiArRaJbJP2fQ/3IjjBvO0XrBZo9IoV6zT1r
	 bgHQAy37DWH/vKNgGqgR7utOqWF0eUuWZUMekU3f7OfIBhx+gY2eU4qzrRsa5MBS2WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
	b=EQCbgKeQFDSbHQkljeLLXF458+VqRGN8xT348QXmesCBCltwRonXPxejv+lZiSLQx+zT
	 h2NmFi+S22ThEptfSj/Wx8SGTh9SMXmNczaJUvnuIt8BYwSRJypiz40+wAtPK8E5oAtsC
	 rRWYhUVk165jPz2rstJviGAdPGf6wx2AlqjIHRY/zYdnx57vL6AMmtGcI635JScBqXPik
	 rT5cDd1hchm1jiTkU1cjrFQRD0nzYNXGpXodRISW+9jv8SKRNklg1rAUU8zsTLukROldz
	 OF0z89xxYTsFdklTy4CVWKe4Wcvw8x10qNj8ce7DvEozvRWXCDwNyhKQZqCDYFVSG/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMgbQEQ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dCyHkpKr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F4606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0F4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMgbQEQ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dCyHkpKr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU90a824806
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=; b=cMgbQEQ7VfS06ZuV
	BtEiyMgpVn/N5F8ms7jbbXwaqMgAMC3WP58dKYhowIdj3zPxCgf66HFt0ZE9dZmZ
	MxEQ13a5bmyK7eGoj/nn70Opst95clRXvvI2oUwD5bb9DJiP3MKZlji8MMDYwsLJ
	reApLjQF46W6eHReycSp0Zjq7kUbKP86SPTQZZIhV/iYkX1URRGEj2eBsZ/3oi92
	quwmglX5GoM87OuYqQ7rjVS1y0RAxtc9PuW3WLs2YlTkPywh9x529DXSQ/33w9wn
	irlIFGWzaLByOOZHZFSsiHZmfyqKm878uaaX1sgPwiT+MPnW4jEm2Do4MYWTmS7s
	TgS1Tg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4tmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:53:52 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1013666c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792598030; x=1793202830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
        b=dCyHkpKrzlecjH9q1vhjhUL/j4PoPuvOk6m/EK0otIiAUBpIYTt//wz8ZDstaNWR2A
         tlN6vu+hknNgqkMl/WFl+N/9iNxjIsbXGBfKENlDhpivdT5aVIwoA0IGFJC1vIxYkHVS
         ekcg38qAqbedb42vE5qOuzkJHFlqzaZ0bxGhi2X+T/daWrnRZKbs+2bUbl5+P/aiMD/b
         Y52Vo7wM50HB3nhxlgD3dSngWycP0pHN2cJDIw4HKs4Dz7WzicZMmKqaiOu3t+ReW4MB
         UhA4EP4EhbjZmIaVZHtoeUaBRHorw1uEYJMZFp116elXK81xGCa7H724v0LoQUCGG3wE
         8T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598030; x=1793202830;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
        b=pi5TNpo6VD0lUplbqm2N1E8vsFZ7IxYuztx5Y0EAcNdXfOCubvN9XrRxFlD81li4cK
         yNDr/MjvJeCuwJNxgnc9HGFZcg6u4rEueYAdcOvjDV5ZBq+vSD9chgiIknyAkrEjg3tM
         fDUTaSBhnXqiI6BhTBpf+oFQA3RY67OqczIqQLRiJJ6qIvgNfkWO1nSoiGBsr+DENXMI
         zBBGzZiBflFbqm+NSVEmrn1yfVxwZZ012Nhh4wjXmqf94PofRdor6qJ2vsJgnULI1dZ7
         T0nqc2NiXfAJaE+33uozYjMjZhavY5/P/MBUvOPEOoL9yyY1XON24BF24gtDmAu6R5ds
         6r9w==
X-Forwarded-Encrypted: i=1; AKwUvBxR86jYxrdAunfPQvcbtmOGcm76Sl0eGZRc/Qf9YF+bu8PzlyM3dg7swRXQbD3INlqQGTSlo6LEyNDtD2wW@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5lBFjJiUOVwUNloZQKBzylaehzrMpVnneSQVwUM4qd04nxgtw
	a6kXtWQXA5l3KeTz7U4Q+x6UsIEoDNA0fn2JJsTJ5tGOJ6vk6nCnBqthpHQ4GAxvH+ieIsnKs3H
	FJ3ntRpjryptl9kbIE+2zuIPwzXG4Ca0qiAEHqK+VixzdHL7mtmWEd0udM3dH3riX2Agm
X-Gm-Gg: AYBFou1zR/tcyyDiSpfKVCU/0vMcZvn6zo562vniAlKwtbNj6DQoNbES/At2aMuN9HP
	qBR1eo5OwFkkuGDDbpD29US/Xn2QWHHIbwrupwLU+kgeexW7u9epn4fcYg/g4ZkRyO7TC4BFFPv
	Um9jyraV0Hr3ouVej6896xdaz0QWX/bnE5EeAqQYtjPFnTI82P/0Y76XeLMjOIBVz6ZWSUzW4k+
	pFw4WGQCuvre6zxm0QPI0yxtf6KZGOt64fWuYri8OdRxsg0lMziKfdOTrpwdLf86700SM82otfL
	P2lQhuZqMlrAB5etPosZ6yfvmM/uLigGE1+cqyqFT7h4ErN3q9xed9bjFXJRbXUGC3zzUQm98Sp
	ALsCdbnRwUnmun/L7JiRFksavFXk11Ss7GQkr8xCkHI2U
X-Received: by 2002:a05:701b:230e:b0:176:a225:e364 with SMTP id a92af1059eb24-190a77580damr2971986c88.35.1792598029947;
        Wed, 21 Oct 2026 08:53:49 -0700 (PDT)
X-Received: by 2002:a05:701b:230e:b0:176:a225:e364 with SMTP id a92af1059eb24-190a77580damr2971949c88.35.1792598029355;
        Wed, 21 Oct 2026 08:53:49 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm11144550c88.5.2026.10.21.08.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:53:48 -0700 (PDT)
Message-ID: <b9924970-16f9-4c41-9b2a-a5d3b7958c95@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:23:41 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
 <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfXwfcL8cTXKNez
 c4PMB6QaftPJiMyltgmg4vQt8c2FT4JUrbEQLBfMsHCy64Y6++kpUgsG+3OEMVlI3yMrEyxwmPR
 aE1Dto1F2NVISKLCXOeYLwEKNU52idY=
X-Proofpoint-ORIG-GUID: j-drWWYGarPU7_oqBO9aGbifX0XntD2n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX5fmUWxURv+PH
 1UFnq5FtxUN8aQmoMehfFc5TNOIiwiHikzyk9VeMqFcRegSNYvfdP2/JPERDL8xIJ/3GpIJ3mic
 sdwjCV5DkMmBtb6HwuzL+YTtScxK95eDnFDMnmWBCs8q0E8iWiCInyFL1pH4v/4y4rLE79KgY1v
 FBcoA8pLpmLUuPDHUWcBvngJvjK5Mjl3+CGN1sZx3ycQebZ0ACEd+9vTL2WXVacoaWHUMjzEyv9
 p6c13a+jmoB2pq3GDFxcdV/GPyp4jsTRAHIhTZN59WlXDziDG4ucgLZ0wLCweShAX09D6tZbwik
 V6CxjUGcK777NbAVGQ31rpWd1amSJ7LpVz0ZE6fQj2WrdWw4v8pWeyglGdNKG5negJScd8AZpXw
 ZaBhylEHcVVqG6UB+TCOZnEZe9INNo3Ru31su38i7zpkOGG3cM6G3Y4Qs+Xf4Yhn/D9NMwpY+bA
 v5hYEFv1usZI40utUFA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8e010 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aSm82yqHt_v6FYJ1XLwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: j-drWWYGarPU7_oqBO9aGbifX0XntD2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063


On 10/16/2026 7:20 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
>> that provide the clocks for the A55 CPU cores and L3 interconnect. When
>> the APSS clock driver probes, it attempts to reconfigure the already
>> running PLLs. As part of the reconfiguration sequence, the PLL output is
>> disabled and the PLL is placed into standby before being re-enabled.
>> Since the CPUs are actively clocked from these PLLs, removing the clock
>> during this window causes the system to hang.
>>
>> Avoid reconfiguring PLLs that are already enabled and return early,
>> similar to clk_trion_pll_configure().
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 60173b076cc5..3641b2da92cd 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
>>   void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>   			     const struct alpha_pll_config *config)
>>   {
>> +	/* Check if PLL is already enabled */
>> +	if (trion_pll_is_enabled(pll, regmap))
>> +		return;
> Please add a debug print to match the other similar calls

Ack. I see in some places, debug prints are not available. Let me add 
that as a separate patch to make it consistent throughout the driver.

>
> with that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
