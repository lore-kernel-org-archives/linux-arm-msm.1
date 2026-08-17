Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310D93D47A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974416; cv=none; b=f0wqKiFf4syQCsVXEPb7MRlzZasvNHSZoAxEFJbmrjO14WNqgmTCZy/4NFdpC7yF+3WdGjwU1eFCvMTOLD3TPGK/MWMtXYxvVK4eNfAnEPpLNxcDBTcAsqOoWae6fXnjH1soug7n02r2UcOvY3e1xI85BHehW90JKHYRgy1Dg4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974416; c=relaxed/simple;
	bh=zbF87ZtV7rgz0O3uxpZ06xBFJvzJFT83u98UE1z21ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDut/qxJGtOwtPVL/OJjHUl539BwNZGcVlBuZcmxSFe+rQHl5x5XAISqPuy/EAMJbxBoOrrxHPTYLVPMcA8GZLXa1c7XVPv4Ngp+oGKRfD9O48dLT5jsLo3u17bVb7/Rx6uWUKil5vG6VJyiiWCtGqtUb3leBOEsVuFn9wNxGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gPXBzSCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRLtYzbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gPXBzSCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRLtYzbE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6Jao2431653
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kisyPj7fMtLWJkmcw99zpDofFaR/K+W+XXZHVzkhkp4=; b=gPXBzSCMdklHUR/j
	P/l22k1ivbFZIoKX1COxhQUxMhWP9kjrYPYBo1rEoppXuUWKBH2/dZxzW9wJoaKs
	e7ZkkndIlh8UiMyOKdvTlpOxvTTicl/pAsXLmKDKv6jOGl53xx4PnJMeyLbnAVnX
	W4OZGB5yuaGncliC5bTWxfom5Uc4fTMA5MSN0wFoocFxA8x0D6XjS2WbxTsgFNY5
	87G7nh/FrJSR4FmSUZ4WGnydMnQV/ZGFPi7Fmk6R0YtXXqUzm3GhcRJTkIf2hPBa
	oc4Znwd6TFoFlgfXhIPzJ7yypzyWo809LuXQ5mMT3xTgjCMuSW8xDhpsIoppyHbw
	nNeMGw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wrehgeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:46:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e789f00fso75881137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786974410; x=1787579210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kisyPj7fMtLWJkmcw99zpDofFaR/K+W+XXZHVzkhkp4=;
        b=kRLtYzbEq6MbtQuTI7LmW3UQ2AITj8KxDzOUD99Vg2TNZ8G/SfGP9jo6rx218mO2W1
         DQRrrPigO8iLhgnx0uZ+uDa/XHHmXpULwC+FnLItyUib6kFrD71ZGhqmPtewVU4c2aRb
         8poQjz0sOXEdIK0UaBBsNyL3WwupZi2Sc7zXHU+OKCIgb2ZjRj8OPBGkLapezFAk6CKu
         qDO2CJ8CEV1h3GzF6wnSnK7lo0Uwu9grnDZ8VRWWY6pm8zepmunvEwEHmB7djnzvw0Rr
         s4wf7W/9Uuj5vl3XJVVfEs7APeMcYZ4intUtVMsBrHOD2y0sagCx5fjahWnOiQi61oP4
         mc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974410; x=1787579210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kisyPj7fMtLWJkmcw99zpDofFaR/K+W+XXZHVzkhkp4=;
        b=kWO9rr4HyZ0MD3M1TlhLg9b/XckbVj22t/xD+3VLvreyjUNCQ97YTZFlUhoEjE7ZC9
         fWXml6ZZftL0ZgtnQGFFfslUdoq/FKnQL3+6/RnBuWrUSEpjNn69dz3/CI8McT9ry/AT
         eMitvNXoYRlLgtNfBfq79kPSebE73/l+q1Abtfyb+HovxmRe9kF7rG5o+LqCkWoHTW+0
         WW+kc4yz+O/yElk7W9rrbH7UunW8gCvmldTmqpqsbzvQFrEfFzsjvcgw4SEFahRv9dJg
         mm+HlbSI2MlLinOC4eT1DwmHeukjsiUpO6/RTkPjRtMFXqu/si92vgg92jaXvi7R30ma
         bvOg==
X-Forwarded-Encrypted: i=1; AHgh+RrqjJ2dDtVHGAgG+pS4HMVIJwl/goknMNtl2nxEFrFOacodgLzs2NzhRGWvGsFWxReDGBLZM3BaXyG6bZnP@vger.kernel.org
X-Gm-Message-State: AOJu0YwovdqOXG2OUhoUEsOfofWIsNCkz3E9nfU87CAeZk3wbDC06tFL
	DkUiMzeNWEbx2YyzjyLL46HjmNK+G+W8u2RlVuwUO9BxdVCQ3Rnjx0utlQKJUipVlecdD6RJOET
	YMK58kigGDH9lslO6Ir7sICA07TZWEqqgSMDx4I2al35XQ9Mim7H09GFXsDBxBzQl/WvR
X-Gm-Gg: AR+sD10i0hYdW0xcIqzUG3qa0w9zNrpJDFyxVPBnEIfB1NV74jLIAOVe+uH2LTjAnYq
	zwXnb57zfJArxeBoXaHoF6wHlcdhxGt1kFwseQ12lzepuy6ZmdgEUHN+uHVUE3LvHvp9F6fGVc+
	r559ZEc7bNVrn4Cp6D/aSJpCofy7TxBdmCA7kmI7jeixMC3+EyKWqVDuwOisdZC2k7d+bWuAr4x
	bgnAZBGTORDswPuIdMjs2Msd6TRa5xmPbVXHqjWosbgWUNVljD3D2JwUxKaRX9cRtgu2OW2Y4dT
	gom784MOun0805btkAgtbQv8dyV43eVi8xFYSQWSj7QVa0ola87y215EFVnO9eijigr7ZVd/YAI
	dpENhyCdwv5eefU6SPwkuRJa1
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1526692137.2.1786974410318;
        Mon, 17 Aug 2026 06:46:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1526686137.2.1786974409935;
        Mon, 17 Aug 2026 06:46:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b74059sm33753866b.38.2026.08.17.06.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:46:49 -0700 (PDT)
Message-ID: <ff8874b2-6851-4c8b-b9bf-476b807bf91e@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:46:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
To: George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
 <20260813-alluring-advanced-jackalope-55e5c1@quoll>
 <SN7PR19MB67369ED27F676F6197A0727A9DDB2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
 <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
 <f13b0be6-bc1f-4024-9881-59f522566f64@oss.qualcomm.com>
 <SN7PR19MB6736C6F52894B351836F583D9DA72@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB6736C6F52894B351836F583D9DA72@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a8310cb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Jmm3y0j5io58rGE2ST8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: UKGg0gUEqLI6iGu1E6Zb0K6YL9LVkHMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwNSBTYWx0ZWRfX4q5b8j1uz3DE
 azh8kh8eTNNaV92URrm6iTXJKqCS3xOwjdJgpVroUzmRUOe17F3Yife595EACu3OepIxbCfjg/C
 PM2OE9TQYiCzWJBYe+XMatHobe6qo0ugJs4yvwjq2urDv8F26Ms/Hpe/qNHRi4G4XMaP2mK4v7z
 EKVo7WXVDg6FaGRDGGlVidQcA86P0OVWiCUPxGpgvc3Psijhspk07zDTRci6QP83fJZ45oJ3t5o
 vJTmFt+jMJOtUqV5nsDIINm65MC1+TDev04PjJjpT7Oo1X71lYsur0x5A3yr1pbEZhbM1rBpt87
 jcyw2406BNeYf+DiLBRdBqxi7kTMBPof4G7mTUpdDh2hPObixx2Da7fMh7vv4j4DxFjgYRcGySO
 sjG9c9x+PxfoMAKk9/4a5zTDeDihk51rOy0C/BXKUYjYY5c4oi+KLldHsdHxx/gV5Zwc+BtIWCU
 lBw9zwL/E43i4FKWY8Q==
X-Proofpoint-GUID: UKGg0gUEqLI6iGu1E6Zb0K6YL9LVkHMJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwNSBTYWx0ZWRfX3f4hsSha7ksO
 aJ58K4dt4d3wWLMUt8VVEd2sFA+u2NJ1pEhkAudJUDC+mzMo3uqRJoBpMqF7ZO1aNSCVVDS0Rgf
 gOh2t2E3gMPxA28c8lYlVL3wsGAgoys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170105

On 8/17/26 2:45 PM, George Moussalem wrote:
> On 8/17/26 16:38, Konrad Dybcio wrote:
>> On 8/17/26 2:37 PM, Konrad Dybcio wrote:
>>> On 8/13/26 12:48 PM, Krzysztof Kozlowski wrote:
>>>> On 13/08/2026 12:28, George Moussalem wrote:

[...]

>> so the implementation, matching prior art for similar cases should be:
>>
>> - phy node with #phy-cells = <1>
>> - consumer takes a reference through phys = <&phy FOO_PCIE> or FOO_USB3
>> - new driver in drivers/phy/qualcomm to coordinate the two modes
> 
> Thanks for confirming it's one device. I'm already working on a new
> version using phy-cells and having the consumer select the phy type.
> 
> However: I'm adjusting the existing phy-qcom-uniphy-pcie-28lp.c as
> that's the driver currently used for PCIe only in both IPQ5018 and IPQ5332.
> So I'm adjusting it to register 2 PHYs and provide both PCIe and USB
> functionality. Any objections/concerns?

"UNIPHY" is a bit of a loose definition, I also see that name in relation
to DSI and ethernet, but I don't have a better suggestion

Konrad
