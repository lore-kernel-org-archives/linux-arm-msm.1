Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88C53DA7DF
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958822; cv=none; b=skqDQJzdZxOC967ziv3QdEDNda3/1Ykkhm8XkttKqPsvNwBpivKlV5O6lbFGrrSVTVe0cTSdn264HlXygvljLGUoLUzRaHL4RPkMe3LyCDjNCDr347bu31HUYaw+qYcNYNEaXQ/YbZf1KwvaXtoKYIZmfrbaoNijenkhFiRWUvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958822; c=relaxed/simple;
	bh=gJY3Tp1Tc5qnXPWVux6crch4A8fYuRuz8YbTnJeADhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAUThx1oZmY5/fF5g6oFeTw7NvY3h4adwNPH/0OAsx+nRbfDRhILn7QAI+IipeHKA7ddCdkAlefWbxDbinEyfnQfAbT1zoFsftPFi//RLoD50UOs0FQnhbFuSQf3xdJmzqjv72PCKrJJLV78SNPtcLcOfyWsxi0zcKxcmzfHXxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HaBlJ2zw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V78Bp0HO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HaBlJ2zw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V78Bp0HO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7X1599858
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 13:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vU8DphDo6k5bSz0d7Lxnwr8LMEAl8VYBZuXrpUxN83A=; b=HaBlJ2zwEDFVYmKW
	A/kid77zZU9Rp930kIOBNutwZL125050efqZFA1QM+6ZXO+dWtrbwTMbFLaO1Kjt
	S2Y9EjDF080lGo9Uhi+dbWBrAja08/nAt4a0inwOITpwOWaeC7Ck+evtEeuzlyeA
	1d13/2cM3JSHG9Wjuf6vJwWqLuEpFkYrJ5stQ9KIeMEeOIvI4rdi28gVj4TnhQer
	/LgrywlVnPFppxuuD8MvrqagTa/LzZh0U73ulRM3J1jVUgXQEfrJaJeoZykPkrMk
	n4Tkx8WjURABflPbZ/eSA8RJ1C4ThSBLzQCtFAzNEHnwsr2xpmIeM5A4iua5rA5C
	ozKZVA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr210x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 13:00:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78ff33b2292so17933137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958819; x=1789563619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vU8DphDo6k5bSz0d7Lxnwr8LMEAl8VYBZuXrpUxN83A=;
        b=V78Bp0HOx/2Ye2rZZUFJPSCupr4xKbH+gZ0CbvVEjVGsoRUe6xqFreQteU248kMVe6
         nwok01pVch/VFZPYhJ/q3wlaunec0p+0ry3BqPgxiN/5PckjWUEw5kY0ayrBr+7QKM3m
         7FlOICWdMjL06ZhukIoH5MZhf4PYUhwFFrhLm39nNmGL282torHYyGhfw1bzby6DwBZ1
         vSHNw02cRjv5NHj2fQIsu34rf/KSzzL77UYMZseSMIreHX1As0FRX3Ml2IxBPAg1quPT
         wX2nVDztwZevxFw0RWT/6EBexh0I7gnhGmglSLuJsJOqlSn0oSDRcLUGk/79s1o9qwOG
         lZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958819; x=1789563619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU8DphDo6k5bSz0d7Lxnwr8LMEAl8VYBZuXrpUxN83A=;
        b=iNzviaQRhz4vk88mpw2lGnVS0bdy8SNKTRSu4WfZeZdF3VxTliVP4o7Mu3TPKduKkZ
         UUEsQXKJltv+VyVEkb4KtjK32GKqjUfgP/6beFAsAudGT89VUQHjPaTNjLp4lhhxNgTD
         /zWjvnAgGosiqDLCOWyO+VHG5uJOPRn51UgaWje1ZrNH9FQzn3xILB9kWsdJGrl3StQz
         f1HA6eEMvuFVe1487ppdzO08a5cck0Df8Rlnb71quvfmBUGPFYD8V3HWJun3IUs1Othc
         Xk7fi4mIQ6oqLR2CnX+vLwFXhptUE9dtf+mInv06HE76wGHFJ6OGCnSFJKUXkPF/ss2O
         jQ8A==
X-Forwarded-Encrypted: i=1; AKwUvBxutaRE5NZtfno9S5pLn1o+pYx4oYLnAASApAMLrFPjobflGDeXCLodPqHMyfqmi6SJa8jc+MksLLPqp8SG@vger.kernel.org
X-Gm-Message-State: AFuF++lBdi0xxk3U013vj19hxUFOtcyZfdOhQbdJjp62PLfIwVp50EPL
	jrv2DvoDGQhuWCV+Dpx4zhWAFzC4a4olTFSROVD/68yAvV3qAkq2Eua3AImWKnph6hWPZQb1n6d
	CHDMJK8iFOqwcBkx+qMd5F5IB9URz3zg+ZfOM1eBE4e9kaWAmG4vnc2HjlGrCdjD4lzO6
X-Gm-Gg: AYBFou01uxtP2GBwVrurMWtzdc8e5KpS/c7NPQOta3R85haHUfissdhp8rmZKQnHt1/
	T2cIzM0tGczSazmqngRfW8iNSBKZu+u9RTUqJI8yBwzcw8wF/ogVapQebNtuEKU5BtLCagTcDLk
	Nemc8aKBb9/RPG9xhSPtrPELAxrQgIo970b/AvV1qxAMT5g/JK338TkYXXcAGZACNVgvNJqNBEl
	ySQ5z24BrF/5v6d5vqJ1GGdywnDFq3NpLAvi3jQUEFiM6XSyR/QTXkiiBW2klsSaJbpC8WFht/T
	kUeguLPmOlpsV2w4VCW10FKVmiCB8eyJun1pjLmdmRq7rdmw1PO4ism0/vWkSB+4Iyywfd2EfBj
	m3PWQTTl6VE+gojoukeNx/g==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2591550137.1.1788958818669;
        Wed, 09 Sep 2026 06:00:18 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2591535137.1.1788958818116;
        Wed, 09 Sep 2026 06:00:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b667b6c30fsm3387051e87.9.2026.09.09.06.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:00:17 -0700 (PDT)
Message-ID: <978dee45-827e-4fbf-a574-8c61c7e0e097@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <20260905-eusb2-interrupt-v7-v7-5-820cf5377a70@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-5-820cf5377a70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa15863 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FycFWezSpWEMHrBiXq0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NSBTYWx0ZWRfX8QPBc5pAf527
 QniaSFIPgK/+xCMbNQS8ERiUfirAbU6oudc7EgkKmB3SDpFhXy322gp1VESVY7MLHibgzaePy64
 R9Aq7n4rhlAU/Iy3oZ0emDm+wT0FUhX9o+dEHTXpopvb7d8CrV5QjwjzGd+n3j56c1GZBVlFCoG
 LXoavEgB7U5hgbhlFQpsQU6NKk/msPV66AnVNaGxm+1xb673UKPRnIOX6fHsL3xv6EnGzbh1ZuA
 md4b6k+fZTymL5x/9D8mbTZW6w4NKQ5IoqMgM+At1b4E0s8tmTYV/VeY9gTyZIpXdYwGoq8hBWc
 ayAxrujYwgkFsobP85NxhpjX154ds6x16Qorvop2yac75lkiQefLkTlPn7BRo9npc/O/sbdyUa5
 pcbM2yIqRU4qHZEPiLw5Gd4YGMJZfFM2KEOVnbdcqa+RFJdgCXsANlQZiCXVDmx3ECx0J3M7uvy
 CU7OK+K5migmLdfTRTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NSBTYWx0ZWRfX+mXqOpu0gU0y
 YOrE/9sXE5Rny/WWRgIU6aO+bs0lgLqzVvPJtsZ32mjSKgNLMojHsiTwEh2jQYtbOnzwX8zGtgG
 zPwUhEa8QwdgPo2SbMKT/fkWswhqrrs=
X-Proofpoint-ORIG-GUID: WGlG6vW3sYSwJbigkuftr4IgfQFpHL9B
X-Proofpoint-GUID: WGlG6vW3sYSwJbigkuftr4IgfQFpHL9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090145

On 9/5/26 5:29 PM, Krishna Kurapati wrote:
> eUSB2 targets handle wakeup interrupts differently depending on device
> speed when operating in host mode.
> 
> According to the eUSB2 specification, remote wakeup signaling in host
> mode is detected via different data-line assertions based on the
> connected device speed.

[...]


> @@ -628,6 +649,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	int			ret;
>  	bool			ignore_pipe_clk;
>  	bool			wakeup_source;
> +	struct phy		*phy;
>  
>  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>  	if (!qcom)
> @@ -698,6 +720,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto clk_disable;
>  
> +	phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy)) {
> +		if (PTR_ERR(phy) != -ENODEV) {

GPT reports:

When CONFIG_GENERIC_PHY is disabled, the stub in include/linux/phy/phy.h:489-493
returns ERR_PTR(-ENOSYS). The patch only treats -ENODEV as “no PHY”:

But it's not like one can really use this driver without a PHY..
We can add a follow-up to depend on that for the qcom driver

otherwise

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
