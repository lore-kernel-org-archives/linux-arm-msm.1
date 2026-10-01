Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8192B4F4047
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852795; cv=none; b=KQ49VLdR/rGbEh5RgZMS7jdXpvXsP6A/1nLczsoJSuHkmlDbsprvgMU+xx20nu7ixLTFYmSRFdLtcLnKfU4ERW02/gU/tJXP57Tyw/YZJ3RHEtoVGLVv8Ib5cpXnL6kmCMRWnLAyexZ19AVdKTYQRX9GSsydhxJIR4zp2wgQtmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852795; c=relaxed/simple;
	bh=OudGoG1Xw1V4jzeG/S5z47MQq+WzDcNfiByweynrSHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XP1BNvH/UJuQA2ILz7H0DtFCKAg3hDM911oT+bOv4Lg7XQy6283X4vMcbUj3Wpe550A7RN6a7S2Qf6GGNNT/ETKtatMgRthkXPRBqm4TUq9bn5hVOyRfVlZBOD7F95nvdZ8IPqyP3zb88PlWKD6Rxr0YfkyB5QDW871by0bN7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcEYBc6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hO3Tx5wB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcEYBc6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hO3Tx5wB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xcib962504
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 11:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j07mDs8hKEZ6BOzq0/CtthubvO4QWRGm91M2icxKLIg=; b=VcEYBc6+b4C+WVDb
	iLdfvqBvSw5hT01rhtU6/L26aw81sYFLL3XXvE2BklbjHA55Vf0/0eA90/e+lqtn
	kvbrAvmpqAnU308cfX8H3IHIDxeO7aOpi3nsm7ELV538arP44+bJ0z7CBDYE/7Go
	hX7RW4iXzt2hTVuu1UkWr1CR7aDQehJkelwt4fK5fNsHfcNhea8mRpuWsBZWJKVe
	hwrdYktc9vK4+B1xC0IV6oHS/Jxojr0itEjWq0TpL7ofIGop39mT7rqkxJZYy4sq
	Ycat3YypEdZvv2hqRp41bCFP2Duf88xS0m8X/AFWxfqLoE21hNKzEth2vvNyOCia
	Wi6CfA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcuvr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 11:06:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bfa915da7cso496359137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852792; x=1791457592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j07mDs8hKEZ6BOzq0/CtthubvO4QWRGm91M2icxKLIg=;
        b=hO3Tx5wBdnkDU2ubvsI/teHzVdqM46HwHzg3SPv9MSTxRR15opabqbqHPAQ3j5Jtvh
         uo1CsKPapXx/euYNiDe+Fc6fXBccDz3nTt/DHIqMgIwiwssIiTPZSm2tGwDXLcfoblYV
         Je8CaQ8lqQHaui0yv+BF0ZdgQHBN20KCB9yOr3ZdyLD5NikAucMylmrmiL5E3owf9zDp
         OMGMXP53dztr1AwdV83kSGq93A/hlHis2iGrStAiBqtHD9iWEcwmS+HsbLvkgwqbXwJ/
         ccQfdzKAksM4uA6AcimN5vKRsbf5zzs3Pouq1CXhziOMjPHjacBHo8/pFNVU4rHOMB//
         wihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852792; x=1791457592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j07mDs8hKEZ6BOzq0/CtthubvO4QWRGm91M2icxKLIg=;
        b=Dp7irylJhJY4VQFlvwuEAvmBOatp16hRyWwpS05Pmh0D4MBpwpw3CnmymiJDsIr2dH
         ZSZ7uRAPnpGGMbio+CcHHZkzcduMiAaMk5zvjgFlUY7gjwJ3Wcs2S4WmZtfvSSfBbma2
         MpaP2FcZ+UMAjcAzpvgtJLFZ7bCGisRHW77EytpFnv/pOcjqkXiYZJWg3/W+X+JfnZlv
         bi7s2Y/e24QqZQ+nOIRL/xkus6UouEFSGUsCEgmskYGaCCoETX1mA9AQ4RWlhXFFK9PY
         CIE7PhcOyhxFeaVrreLshKpuQ14FwS5Haa2o7HhjiwR1uHdOfBu4YaY6wLYdG8xghzYD
         ZzIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1Y0Ke8yZhLKDVjgNeoGEcG3uqBFNMDm7pDpdy1p9jj2bkXrl5McKjnMT5o17PapRN5ybCpUsB1B6zK/EH@vger.kernel.org
X-Gm-Message-State: AFq9FYKV/IxUCHuA0jPeLfWWvgE4WEQIkLU2BZEcTgUsONyEFQjBhlPr
	+pue6c3dV14F24/nex8K1+jhMXmzsGOcahwuQBhp+bzhx39gHPGuzZLsth6I369YSbuIxp0blmn
	T48gLa5Txbu5U1lgTsZ/4xSt1+6w1WtAphnq2/WQe7ULVTmoZwVHWOlk2Dz0a2I9uUxyh
X-Gm-Gg: AYBFou2J5iomZoto9Uev2mWeLSrrIcsqYwL3cF3OuKV0dk68Wurig3jadzzGy7ug8bS
	OgapDXTX+CYWExCtykk0JeMy8cq3M5mgB0ltnHqQhJw8CW6UuBSW3uYfZEgHKVsTOMdRs+ncVK4
	4K0djRX7AiA66Liqz3JZOZBgw5Cpb6nstW81z5H9tzCoi0ujgtFbPDNbRWPIC5q5Yahv89BPdeB
	F4lChvjeAyltH4ceiXcnyBZ7+9a6XFLsobjfiPtObYwh429QV12gCx/DD8rWerGyaPOm1s4kgsd
	nqB8sCJP/TVCcRnXe3rrLFc+kBWeJnAiy2H1aJLbvtVyhDFlV1a9gxMg4zfCnCsrQPAbcvbyHOV
	aU+THrP7tmnzP3Uu8c0jl8VCjew==
X-Received: by 2002:a05:6102:2244:b0:7bf:8ec:4996 with SMTP id ada2fe7eead31-7bf83a64f28mr498357137.20.1790852791622;
        Thu, 01 Oct 2026 04:06:31 -0700 (PDT)
X-Received: by 2002:a05:6102:2244:b0:7bf:8ec:4996 with SMTP id ada2fe7eead31-7bf83a64f28mr498342137.20.1790852791121;
        Thu, 01 Oct 2026 04:06:31 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2e31de168csm132870766b.72.2026.10.01.04.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 04:06:30 -0700 (PDT)
Message-ID: <586046f1-8439-4353-b60d-dab6356de3ba@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 12:06:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soundwire: qcom: add multi-master support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
 <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NCBTYWx0ZWRfXz7ydLwmeP1qt
 +u2p1YUF1RwgSGuu82/vEgoPARF2DcVUQC/7vNpXcHL0wvrF2b/ycIWuHXUU9UEFVooaJTC+862
 scASrgSIc496om7p/a9jf6cJdU1/pbclc6T8zqRW2Yqotb0BbtOWodB9rmD2cXpZdzdMm+aOlMw
 tBkc/quDXkGVGIJYCxglkz5YyDXVcXY78go9aGuzHICg2i+yBTVObvspHYORTOfGRg8ZN12j0i3
 fsCrYuG4ah6xOKH8mqOrkABFVnBmnua8I5gYOToa2O6CP6dY8WY+asVHss0qQR6pmkRPFcgzhKp
 IYjXmYetGNtzrd7GK5Od3GUwPZQTiRTYZ+e4kEIPV8nKQJZ/lHyA+BNesAn6JUWp41wdESrcUmd
 otuGDTuIUkR2ofusBfdBhrNoN6oM6NdS//h1mqx3IQl6fnxstXyda7jc6d3iiV8W2noyoXnTwjk
 IV6h1NtDBjlM55jvQmg==
X-Proofpoint-GUID: T5Pu-phopKUYQSWSuGDKU-BSuKWhJaM3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NCBTYWx0ZWRfX5YCWJxDb4VLi
 IFMa4CiUFG1xOL1HydXzdleWZMPGx/eQUhxiuZu6ZkhxXtcQE3ARUxclZtLoV6Udlpk1v7FJaml
 VIM3T4mMHpQefduIPgr+ux93Akd61VI=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe3eb8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=76a_tzKS8ymlcKiXT4YA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: T5Pu-phopKUYQSWSuGDKU-BSuKWhJaM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010044



On 10/1/26 11:53 AM, Pierre-Louis Bossart wrote:
> 
>> @@ -192,6 +194,13 @@ struct qcom_swrm_ctrl {
>>  	const unsigned int *reg_layout;
>>  	void __iomem *mmio;
>>  	struct reset_control *audio_cgcr;
>> +	u8 num_lanes;
>> +	bool is_dependent;
>> +	struct qcom_swrm_ctrl *peer_ctrl;
>> +	u8 peer_first_lane;
>> +	u8 num_peer_lanes;
>> +	bool is_primary;
>> +	u32 peer_dpn_offset;
> 
> nit-pick: do you need both is_dependent and is_primary? One would think
> that a single variable would be enough, no?
I did try to do that which made the code bit confusing to read.


> 
> also without context it's hard to understand if lanes are independent in
> terms of transport or not, not sure what 'peer' means in a multi-master
> setup with a primary controller and N dependent ones? Code like this
For now its one, but Yes, technically we could have more dependent ones,
I wanted to keep the patchset simple and right now the only have one
peer and i dont know if we have other setups with more dependent
controrllers.
--srini

> function below is a bit cryptic...
> 
>> +static struct qcom_swrm_ctrl *
>> +qcom_swrm_port_target(struct qcom_swrm_ctrl *ctrl, u8 port_num, u32 *reg)
>> +{
>> +	u8 lane = ctrl->pconfig[port_num].lane_control;
>> +
>> +	if (ctrl->peer_ctrl && lane >= ctrl->peer_first_lane &&
>> +	    lane < ctrl->peer_first_lane + ctrl->num_peer_lanes) {
>> +		*reg -= ctrl->peer_dpn_offset;
>> +		return ctrl->peer_ctrl;
>> +	}
>> +	return ctrl;
>> +}
> 
> 

