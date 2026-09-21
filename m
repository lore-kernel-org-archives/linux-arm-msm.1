Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D749B444
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998749; cv=none; b=r9FRxsRtCxSkAZADCoo+bYo/GbendaZBKpA5RW7t+OrdaweTdrvZQBfupdWyfbguH8N1RjTDWuj0rWGVVaeDGMCrZ8lSLtXLVe1P2gufvRRsg7yow80YQmqYvasNEJCABz7OmFffmIbiMXw6DaGOX81PTtGMijeQtWwMRVZzEa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998749; c=relaxed/simple;
	bh=Ts35l+PEnL8VPft81Hlw49XBk5atQ8XQhif/b4F0qak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5bpsn2qApfdMRB0RZWYiIoOUDj/n0CWuOg5M+UlAHENsKHIqYDHK1PeuLYFl+1+j6zobkRfpQz0m5XOwZpEDnmhpaVlsMCheIwXi2gE0CI77+D4y2pIId8szyXo9fcgJLGf0NEycKPx7gP0nmY35o2iMMDQqO3LQpjK7KKq/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nB8rkH4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiTcdyCW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB8rkH4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiTcdyCW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LDowE21983324
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dj95l/vO2+U8MWvuE/XE4MlOef8+RJeyIZeU0fanVvQ=; b=nB8rkH4kSG9Wl+rg
	tRHB+jL0+WSVKo3teO/XzFV37lsCqxpGDRFKaouYCy3SiA51xSNH4pyPBxFQgPZm
	SXvBuPBH7xRJxa1j7bdI6FtpI3NTI9jvx/MB6XgqSUxCX6WS9JOmQQmpJ/z2dfaz
	zdQoYAQkGuOeeFrcMhC0S0kNe0kAgfajvs7VycjmWds2mAYdbN4SbcbdcgGXt0OI
	NzgfSO+L/RKOA0oQXZLQyqPCZs64VPC17M4Biv0/ZzEspG0VU3CQZxoWGvt//JBE
	MA3cUSILm2Qny29yWRjH3BuzV5f5syh0MBjGS3+JAnLnpdqbu/ZdP6LoJ8ZyivWv
	YsgZ1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw1ju0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:52:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af92138f9so4525209a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789998746; x=1790603546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dj95l/vO2+U8MWvuE/XE4MlOef8+RJeyIZeU0fanVvQ=;
        b=AiTcdyCWyCtmRtg93tv9Sdp7NGJqygBSzqyH9Su10nJ0KZCstjc0IeWtXGofujvPbT
         mpE+Gt2xGtDj8yye8CwH2pJypbnDtLb57QJBDc0NeIF/rgHnyDb3o3eKciGFcnyUnfeP
         iyw5i7VjYfElArOarC005Rx1sMlxWx2ZPfoJevAo4M8d1I8FGHQNKMByLndcanDpXIfw
         fwyRJf0oSBWuhwo8aa1rFht9TIw/X74mLpYjBYynRHLFuCw2OiMtdHLXCYyPJerw25QJ
         38zl9LhneoApEsPej363Vz8+JLr6Wc8UOpxt5NLO1q+gZfAva8k6nNZFpyXGZzZspMLu
         h49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998746; x=1790603546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dj95l/vO2+U8MWvuE/XE4MlOef8+RJeyIZeU0fanVvQ=;
        b=ov/uP2i7P8zDVpUXQCt9eOMcinlWVyq2eVXW9tws4LrfPOc7wApvb4ljeRMHLtzMy4
         E3NSg0u+pIBqqq2WZ3l5HuF+CiZPYK1iMIekk8l7dHsjcESveP++XESyLkMIAB3eQ3ys
         IeL/1dQTDDPef28rLu2fpTwGBEvA3s4XUHx+6IWaEsHWVNmCgU66qf85CjVTDBjtQIgN
         hzmmTltGrbiARh76+/yCIjw/mLmnRQb07P7AtpqAX3uiL6BmPj7X68bBNsmhSjXTwpfL
         HDTlitGw4keLG+vY9BqUBSqhr86O39KCkLwa8HzogobsM27fOZmdc0/zQ+mJTREL/o06
         ePvg==
X-Gm-Message-State: AFuF++n9NqTLurIrWHYBEc6OAbtAU6McQ9QORTYQidbvzyAvd0dmjKq7
	qPj0MD0g9hW0pql5Hyk59BMuofseMYr7zxrdQyP8uf3B8KQwK2ifoTi3Jjt2H9QMMrgJMsbxbdu
	yYNVIglGY/TdOrnwutEpaTfLmWTJi/IvTg/9i0CfbqMMTMt/2V+mbdeIxPA4nPk7XfCdX
X-Gm-Gg: AYBFou37OY3sSQiC9kqLKmhnHCrDq1OrEtNvR50pMDNRY6qt9tJ9Znxeu5Q4ZOe1Y8K
	fFHqxkrmbP78Kui7pqlBdeIqAYTEUVu45+Tgqbb5cwRUcgeb6dwpQEB5Wka9m2wE1w4YLMqhCMQ
	8qqQIqJWjtJe6VZKUXvgpeuOExOjhG7V4Ym38ZP2TB5rhWDyY+YgOh+CiFczojO+q7LqR2MZbAQ
	AupYiGMlEZhb80ZxMZAa45AmnRZNxa/YalfNNx1tnI3H9e7x0dBPSZPZ3jlRVelGaN5ld2ifew9
	NGHhLAK2hq9XG4txUpSPTBlN3eenlU2CbF6erF5lHn3bjYIpQx9Py/4rjWUu7OEDszaXdEzFCTM
	PMviK/MiVQzq29UltzEc1GPCMIKSl1yE7rso=
X-Received: by 2002:a17:90b:2749:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a025f0ddefmr6072550a91.54.1789998745487;
        Mon, 21 Sep 2026 06:52:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2749:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a025f0ddefmr6072531a91.54.1789998745016;
        Mon, 21 Sep 2026 06:52:25 -0700 (PDT)
Received: from [192.168.29.146] ([49.43.232.81])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm36081162c88.15.2026.09.21.06.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:52:24 -0700 (PDT)
Message-ID: <5c16f588-3ea4-4f37-baca-e5a2807592de@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 19:22:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] PCI: qcom: Add PCIe support for Shikra SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
 <e03f3b9e-e98f-4505-99d7-1bcafbc384b1@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <e03f3b9e-e98f-4505-99d7-1bcafbc384b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwMSBTYWx0ZWRfXywnY+DZH1x8U
 jgFk311hD1TDnhwFuPDqkoXaeFObhnT5zqYNrhxr6UQg1ZNfhn4I1v8m4djEpgWod1gFq1Pcu26
 xS5lY4u9mA+ksFBCCplVa9+FfKAKsyWMChiuuHlS7/LfXjNBC28198jRGnqKkNcOwi/HshhNgnJ
 IFb7/u/bxxhrmgmHltK6fJRh1IL9Kjh2J6YO78o8vXDJx7MI4PO1q4U08v29LY6Z62EVKID1rhD
 Xe3/cyJPv1puMhKfXZx6oX4HRycDSXR9/Gguu6j19PlCjnwraBFU7e2nZ+Sy9k1ARyuWE/eqp87
 0rNyZ/baF2TQ1KespUUNLk8HBv44O3f+vyEad2ZVy6BxJ/Ud83bj2OOGAr9mPZHsO9ClqsitRfy
 gMD3VE9W86rw7eM6UIIEr9kQSZi/FYylQKmZ6td1Sf7oJhqnttGmjgIEa1ZysmmABjRAoWj8+D2
 +1Pc3MjWvBQsmA5Iqvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwMSBTYWx0ZWRfX/TlYKYB35dQy
 fjAxoi2f+vMnX7eqd0Rm/CN3SQANUXtk2z6DER99RrYv89ps8RtXRrU5sS5j0ruy+ne+Kbw3Ogo
 QT1XOg3PR9gsibg4jDcA/9uHnaf56C8=
X-Proofpoint-ORIG-GUID: 7sM7MzYJl-VXOUOr5y1wBVJJ9RxSyu3e
X-Proofpoint-GUID: 7sM7MzYJl-VXOUOr5y1wBVJJ9RxSyu3e
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab1369a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=gjxls31er4aXgMEaaoPcOA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xfGM6EskjLEd39232uAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210201


On 9/2/2026 2:16 PM, Konrad Dybcio wrote:
> On 8/31/26 9:26 AM, Sushrut Shree Trivedi wrote:
>> Add PCIe support for Shikra target, by adding dt-bindings for phy,
>> controller and corresponding phy & controller drivers/device-tree
>> changes.
>>
>> Shikra RC is connected to TC9563 PCIe switch on all three
>> EVK variants: CQS, CQM and IQS. The individual downstream ports
>> of TC9563 connect like below:
>>
>> DSP1: M.2 B-Key for 5G Modem
>> DSP2: M.2 M-Key for NVMe
>> DSP3: Embedded ethernet device
>>
>> Power and reset to M.2 B and M.2 M slot are controlled via
>> TC9563 GPIO's. Since TC9563 GPIO driver from Alex is still
>> under active review, current series only contains basic PCIe
>> enablement for the controller / PHY. TC9563 enablement changes
>> would be posted as a separate series once the GPIO driver is
>> ready.
>>
>> [1] https://lore.kernel.org/all/e2inl7k5gsjj6oomv2k5ximuzpb3gfiz66ufet3b4hvov7zqt4@qz4pifbos7yf/
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Remove TC9563 specific changes [Mani]
>> - Fix commit descriptions/subjects [Bjorn Helgaas]
>> - Fix PCIe controller dt-binding errors [Krzysztof Kozlowski / Mani]
>> - Document PCIe Gen2 limitation in controller node & commit msg [Konrad Dybcio / Mani]
>> - Add GCC_PCIE_SLEEP_CLK (which is actually PHY AUX CLK) in PCIe PHY
>>    node.
> You also silently adjusted the OPP levels in the DT patch:
My bad;  I did ACK Mani's comment in v1 regarding higher voltage corner 
votes.
Will mention in cover letter next time onwards.
>
> < +                                     required-opps = <&rpmpd_opp_nom>;
> ---
>> +                                     required-opps = <&rpmpd_opp_low_svs>;
>
> is the lower one suitable?
Yes, Gen2 can be supported with low svs corner as per HW team.
>
> Konrad
