Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452546;
	b=K9e0PqfaFgfXN06gIAeNTCL7UzeQdBq2JjUzSNeF/S1pARtIXR3YT6KYkT4/doYRmo9S
	 CJ6q23wwh2yaC0xRDxZT7KwjfLRKnQho9iz9KB/mvstmUeV4j6IEyzn4QpxshbkUi28OY
	 AX+bRg8vQxG/bWrM/bnDwZk/1E8sphMMfGfXoT2o/fBaUCqugAeR5lAV4rj+uR0G8HONJ
	 Au0fXrCKia1L7EhtgtGFWj7RE29rgaGBScDSSmdNKEIP2gWq0NpnQrDNcDZl6EEUC2cwp
	 IjnbYJKNxGgeL6SCm668c45ORnzP4UktP4ipX7DDIjHnzDgM79p3MhLTnpAbKSOUEgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=;
	b=Oextzw9xoCjz6uqlUTv/7mI/nIATY/jlPqZ5dEXWdpk+W/Xpbgm5BH9ecVhVxYeAOdJl
	 bxJVm7Acp3gdia2I0WIVUWnH+I86jX176ReujPMjlKc8Xzvx3e4hcheks2MnVFdIWQwh6
	 fLX0lD27F6O2SkGNTpkR1qLDuftx+J0XDPo7+6uciyjQSiH4HWi3GO+57ktWsa/1XFdL4
	 6Z/TIaz38SILsJzLrcXKppx/VTlfMNvLKK1lka+TXdi3k6pe7hmcrGLaaTZHOjypFjNLV
	 ynSOj8ehDshck6YlqVtDwOojLR0bIOvbmTIWml+SFsLUL0q585ACgjA/673yz6YA1tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p2u9ssez;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ND33GazY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808CE606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808CE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p2u9ssez;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ND33GazY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZaUw2135752
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=; b=p2u9ssezkjwxBO+Z
	aiJBc2ky2Mckvq5XcTchYc2/MHdO1bxeSt3uhFIxQuNhzj7O5ijPf2+nkxb+62dc
	wXyHdwp1QaPvLTflFmSurrS3vPN48/EV2OPtWR/gupkoe8GPZRS4UfqWUk4G//NT
	fJJLyBPNArdtf2Sty+R5PpthBlE9zhdeAxSOPRsilTK/o/I2cTLP1crBIJOw/KXq
	8U9DAhZy/BuomdZ06UGBTpvKG2FP20Ubl7wJdE7Q2SBo4w092IKZkgXZhH0UjlIR
	y/x1aAIZRfego7/q1AcICOqOdvVfy4haGUWl44sdSDEjQ49tL8ayR6lCzAZWrCyM
	0PtDbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjupxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:02:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso92130485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 19:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794452544; x=1795057344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=;
        b=ND33GazYFxrZN+bHx3nQkTEHJHW6MVelBfTAe78leC/4juUJVPTd/Z40tYVL1gcGnz
         81a0hpc/ArfYWVCNeuoXhiXl8ni5g7KAaNbMunSZfXwi506OEkylZs4NC/XAvKZUo1tk
         D+744GyljGO+gB2/HKHsFLL8ueVylXe72e8BwGZRZEetxwSmX72gCQuKgf2gkM3IASnR
         xC0+O+kO7EIE06CF0cR3Rd57t7UBOpK7gk8BuRH518vadFYF3Tmapt/6gEZLSK3QZQaZ
         igaC/zKR099FiUnRbk4Tj9jCjK3n2iLkPefTFUljXSdObwFRQshlbqOJWdLIqpXCscH1
         OBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452544; x=1795057344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=;
        b=10m7aLAa3wBk9sGpk8mLP8L8PpO4YPDmjLeG4FCjYu+vb1IxZLPTAR5cgvykjBed8r
         O3yE8lc9JZhKbmMD/1J82xUGZy9FpZ356TvbhdAHt/jXK+Rh0p5hVLZW8tqjvWa8rZg0
         SZ5nKJu5udfCrUp2pQ3G9Z3VT0H2+MUWsSe3BTV6kcEAK9FoQ1pmKSrtjfp+yWqsDTdu
         oksz28d+NURIWd+t9DLMPf484CIPszxsIuXnE291RD2Sh0rCY1UEpWtTlurE+YmtfjV2
         DQbSnwdZ8AMGYlD0fOQXtQLIojS9gU8vywQ0Yratla0SwnatW+YEgw4Pz8lePUDzXxTX
         nvZA==
X-Forwarded-Encrypted: i=1; AL+hErFVEmc/irGPjYOoU3QtLRJUPFpPCnCuYWAsntizx0TEEZYeQxsBAUg8fvIfmzIhsGwHOCdmkUV2p+9jk392@vger.kernel.org
X-Gm-Message-State: APuU4Z+ci3htuIOD9WD79PkqbQ626q6LTiryYngxw8ppkRzCreiZiZ2U
	6U4cI39SYtRJtuq3mQt61NrhiHMEeOopnwX0wMF7BoCM5slpC0B9vB8mkydcEqojWm1xxz4d4Md
	4xuUTEebTnVwXeLv2V46vI5oUNVrN/jcBdeUzosmXuScRkdk4Jc+NO2PxoHmSz1U0LtPP
X-Gm-Gg: AYBFou0ozOgaBjxZe0LSQp1AcvgnlidTUe6VzzBUFIxQ/rSlDgYrbbErDOyGGZ7ByXo
	6v02r0s6T/iPcDWn2gJguXyNlcqBHsazxkm2yyZXjHwQFDUuTn8ePg793DzhGgn8BO51e1mGZhN
	NCF90+/0XDCne+FLohjkjK6C2HqmaFSUoW8lHI0/sGbhjcC2ys7YvKRZq7iTg46IKb1YAFfwIJi
	GjpC8+6IDEgBfGYkCLogR1LfAEl21Djcy8wK9lnV/q1zeg7TBOCrTNMcLWanGfWTqWur7YeKvZV
	K5DBTlH3Danj665jKJPrv6CCisL+WyvTGbGHcgdOS0979I4YRyu1VLEgGXKKghuwsyrWsBKZAia
	X8Wox9q14Hc7eZuJraLRAiANvOLW2uxa7RrvEUP58gSM/wgHrGPMGeJJC4lzZWMmZaDP4GbPjno
	35bIUUpVhZkiz5NkJ/4t+JE4wsez9wmJ3q4DE0jEY=
X-Received: by 2002:a05:620a:4142:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-94932e1d17amr282168985a.31.1794452543782;
        Wed, 11 Nov 2026 19:02:23 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-94932e1d17amr282164085a.31.1794452543269;
        Wed, 11 Nov 2026 19:02:23 -0800 (PST)
Received: from [10.111.167.254] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e3c34sm626765785a.36.2026.11.11.19.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 19:02:22 -0800 (PST)
Message-ID: <ae255a03-deba-48c0-a290-7cb0e50b10fd@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:02:12 +0800
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
Subject: Re: [PATCH v5 2/3] drm/msm/dpu: Attach CORE and INT2 power domains on
 Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-msm_gdsc2-v5-2-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-industrious-impetuous-slug-a8e4ce@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261109-industrious-impetuous-slug-a8e4ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMSBTYWx0ZWRfX3A3DBdFN134B
 6K8Gc8iEyhOcp3vnVUQfx6YeiypmSzcx8E0NJjwEjBohHn1t2ugqZcpnmyttElcSuM8FPCGI75o
 xuQinWDVzN4elCTQgV/tCO+JCP5claxI98lnaUsneDv7MY1DJEj0+rthrZxobRm5/rqPkdS2qmM
 NA3dq1Lbz0QkltuEiy+tb5W8tMiiDBeVJuZA7nLE0BZSTDubCLZta+hKJ7VTUGBOkQXOmS/997G
 XEBvoge2UvKZ/3B+XanGiOsslXCWv4W4m8asfJ5dqofb2FASur0QAZtsHRb8gA+3TmPZt7wwF+1
 e/ASHLp9nKpczB+7/LNCB/icG83u62d4HM8lmDu7Z0K1ZDq5dmFr0x/5Dxen3O9yZXU6agzlVVG
 gi7Do5y93NYi8+DbFfiSGNFskSWuQRZ7Oijp2gF4Yvc5dnFGHHy6vwBksErpWKPA87e6KhhRt/I
 F96TQy1dcYH2XaRpG8w==
X-Proofpoint-ORIG-GUID: V5GZlM-1x8shA7SGzCFXKFjvHWHQ31p5
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af52c40 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Exsngp9zyEbSqwYxnZQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: V5GZlM-1x8shA7SGzCFXKFjvHWHQ31p5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMSBTYWx0ZWRfX3yhPUI45BDpC
 J6Er1Qf0oNzXvLDX6GInzu//w6+WX5uAQIAzc1vUeNM8MBCh0Xo92kdtyZLizlAv4ls5LrB/1gV
 +9vKrBPGKhy7KuV11q/fyS1BZx7Fhi4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120011



On 11/9/2026 8:26 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 04:36:36PM +0800, Yongxing Mou wrote:
>> Kaanapali's DPU is supplied by both CORE and INT2 GDSCs. The
>> power-domain core only auto-attaches a single domain; with multiple
>> domains the device is left unattached, so both domains must be attached
>> explicitly.
>>
>> The DPU OPP table also needs to continue controlling the MMCX
>> performance state. Mark CORE as the required OPP domain so its vote is
>> propagated through the genpd hierarchy to MMCX. INT2 has no OPP of its
>> own and is attached as a regular runtime-PM supplier.
>>
>> Platforms with a single power domain remain unaffected and continue to
>> use the existing automatic attachment.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Joonhoe Kim <26rote@gmail.com>
> 
> Where? No tests were at v3 and v4.
> 
Thanks and sorry for this, will drop it.
> Best regards,
> Krzysztof
> 

