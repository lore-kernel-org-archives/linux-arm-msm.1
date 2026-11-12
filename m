Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474802;
	b=ymylYyfQq6VLI0Y4Ec2s5gJLLBQBuPll3uAUe9zoYkd5qQinH7ehQJyj7JYKcghDuSKq
	 avS9vxldaQh7zELZ9AvHNzoNL3OutExOKbW7L4lJRnn50O65++C//FNCz+DL6SlFQ6kTw
	 xBM3gW5IQBeFSUPyVWta0NF35DLHt4OR299WELTCvPIlmX10p4Z50ItGRhwcxNi32/6rY
	 mZ44RQUVZPfbsK+ab5dHI+lDBGLcSWfA7/1YEB5lrJQuNg6G6chTRWBe7q5miXpT4t6QM
	 dDrc4FzkLTHaHDPln6NxIk1mFBocdkBhVQik0+bYRCp7xIM6K8hC7EdbooKsfgpfdAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MCNJh8pT8rOgmjUfJj9nAXCThtADkidlGo8htqWWKYk=;
	b=FteZoozR2vgESS7pcyoOKg2TUzIGtMpbrlaIAsBBV80D9EaXuvKtGTrBUyOHWugKMe0D
	 zO+Oa4vSCmg6Zlr1lxGG85vyKA/mWzB0rc5kPUBu1Rx0MORyU5UR//vul69PvAAWPph8b
	 0+ty+/Aa5RhFb+xpS7mVhDvpkJOyxJvRwm9H37o3MTrCUhQtldZ9x8+Er33bOZgBY9J8I
	 ItWSwwHT5Y4LwQJWvOYED/jnVyz9Y/PlVoilVFrvkAc7yQjJAiRbiS8VODhvcQeO52gCg
	 n9Sx8YFfvnDKpZVMoyP4G5Zod1dhIJ/AqXevBvzI71oje0edQKDrbD/M9/Zq86yHiVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6PkNa0G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ereeec0I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FFA606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72FFA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6PkNa0G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ereeec0I
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53pMd3477130
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCNJh8pT8rOgmjUfJj9nAXCThtADkidlGo8htqWWKYk=; b=X6PkNa0G4dWR3RJS
	1blrDUwv3ESpM8Vby94Lk9zpjM87n/uG+mc/ixzSJ95OKewH04OEXbPE2z0vSqp3
	5DnNFrxPsGKHR6ecQZoZMqoRPV60QZy8guioyaxyw23+tM6j5oXXQJkY9zZfYeWf
	rzN8iCmwCRKOELZ6+g5ngOy+yQVAgTlx8n/oqDYkUz0flHxSbckjsiZ1uYUTkFqp
	Nj7xsuoxrJR1QDC7T4bnIbZ6AtEP5EG09rU2QkyNg9AZlYzpXS0GZTG7+fSWfYXV
	cny444QgDXfb6njHMRQROZFLxizybqj8o4TtS1vvEoaZKxdxVwfoUjKWggZXdk4q
	AsRBzQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugum7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:13:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a064f294cbso3416354b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794474801; x=1795079601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCNJh8pT8rOgmjUfJj9nAXCThtADkidlGo8htqWWKYk=;
        b=Ereeec0IvPyKWdfGPg0zYErwewsPak04NuhbDgxLiskfmE31EsDWkqLnb3IQRBZmOA
         Hgp53bPwhSg9BkmbanudECb6ohrCSxUf4GRBXh/kn1RIQMTsRtdE0BEDefBRLvFeQnp6
         0XRIWNh5AYLZd7Eb5kjSLkQpdEqLaF2XzpsKHDP3YuDXEarYerAC+j9wMZMvQ3RgkHFR
         UqW4TKb7Cjikpxlj6U/8D14j9FmvMTgTg009YLIHvFma6E/WMKqa0BCY1WGGMvvLBvBX
         MlatLOlGS74WG7XExNBhMoIXac6HOoGTTFPcFTjVPPSEjKEOnkOQ1pCDiABV42I3p35F
         I0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474801; x=1795079601;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCNJh8pT8rOgmjUfJj9nAXCThtADkidlGo8htqWWKYk=;
        b=CCe27Y5hxkKCd6Z8l6PD+GXuCNmDkjfWGL6wmWviE3jjL9XEhZe6qq7K41URHaKcbK
         Ww1yyn2TNzzbuk/q5oYgSck/KMmWk62/50509ZT9LY9ZHV77VytVNudoR8ckMvbHXFoO
         UZRtS6xtsNyVkbE1X8LfXt7U78XA0KDhp+B6jxrCJlX34j/ztysxPmj9svSc2xQIp1X9
         Y8joirRusU2oB6KPMiCf9xOb3/rxy+kMk9jXJ3m2392C0w3lbkrCysBF14x5uursSnT6
         LdFJWFULjuUDYygmSyXQMAFUf8451UsMA3sXe6kgy2YfTJ7JKkkv8IarTCeGDkXRN/Yy
         VzCg==
X-Forwarded-Encrypted: i=1; AL+hErHmsjc7C19ramTXy6V/4GxHCjwOXan7fMA1CB/zxniKFnQxeKOdjt2HnZrfAHr10Q9in0Ue2XvkvUP4et1o@vger.kernel.org
X-Gm-Message-State: APuU4Z9K7jLLzDiyGBgl0qI98SZP6kJDV/aMN12HbZCyJk0CcT67HwNh
	zjrUnU8Q2mwW5DiqKgRaxhuM/gLX3O98xE4B66icmk20kVx4HykF5FkFqn2Vq2b8B5WSGxcBCfE
	WDwsksKl7gsoNlJrQdx6OveSPXqgdGdHx7dFc34Aby+PXy/Ul323u3QaWBr/Iz92V4gu2
X-Gm-Gg: AYBFou20fUXa+9ikf3E7ofsoIg3LlkwQ6rcGyLiMbOKfzIDz/sHJGYlY9lWLVOUylvF
	nJHQXeXBorRhEmzgPAdM4rIoITywaBNkAxYRDTZEf+Yp+Q3szZI2ODHtCg5NMXn1fEgC0dcxBsm
	lvUpf4sE2Uvfto+tMu2aExzUjp2R/ZXh9302nfqgRffW5SNfHATggK4ofCU+UKPxXD5dKJTPaSk
	ewRes7DDJN1odOCHNz/K14mOKQBrTqtLlhJv4f25I1rYu6jYuEbyScimn7MhynQrLXW0sAPRfQB
	TK5ShHV9/vREwzZhpjLkSbFFt5Pu1wa0d9L4Y7XDPlvNDd3wQdjtpWueRkcSfXB9tSIaB8hFtsr
	FB3rxBQ2cfbW+upWixj8a18zrxXrm0mVzDSXYFotl6saS7Gsd1/yGhtWd+hrtQg6X3qGYu3NkPQ
	HxjwSdo8qQIati2h0ifggKEkXdurzinhgZHp8aB7eC4g==
X-Received: by 2002:a05:6300:6684:b0:3eb:abb7:f92c with SMTP id adf61e73a8af0-3f2fd69cff4mr5299809637.22.1794474801079;
        Thu, 12 Nov 2026 01:13:21 -0800 (PST)
X-Received: by 2002:a05:6300:6684:b0:3eb:abb7:f92c with SMTP id adf61e73a8af0-3f2fd69cff4mr5299796637.22.1794474800616;
        Thu, 12 Nov 2026 01:13:20 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7bf82b1sm3233448b3a.8.2026.11.12.01.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:13:19 -0800 (PST)
Message-ID: <dcc4d7a7-6408-48c4-8fd3-af96519fbd72@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:43:15 +0530
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
Subject: Re: [PATCH v2] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261112-smb-repeater-power-leakage-v2-1-0f8ee55c4962@oss.qualcomm.com>
 <avWB6_hSarfdJV5-@parshuram>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <avWB6_hSarfdJV5-@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3WX00qvzmKBtRGa57uedtoNTJA3C7wj6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX2C9OShmwajB2
 pxeLy190x8M18l1jbdm3G+0GI22eEb0RcZN8ZtMvmtCp+AMFtHO2XAsIzzDKrQopmeQpPJotdfJ
 HSdn+tG6CxlVBlVyIpW/OGGP6/0EfdY=
X-Proofpoint-ORIG-GUID: 3WX00qvzmKBtRGa57uedtoNTJA3C7wj6
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af58331 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=E76pol0VjYxlbc1R3GIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX75AdEEo0ooii
 7xOcs+bzcrjgQ52QU0XJZLMmSVWSW8xVaP9zxEKVGL9MTC3+CLFUhoS9HhLsbgZ6LYvgPZW3d2S
 dwaRwEbng2uIf4VMH/FUL4uevROY3UK2vfR5dS5QFr6l29NvMkE6gqAmYAA/xKGQyh30CAiIzhs
 R12Qa+jQmOTtq9Qcg8D8E7IX2IK4TRXKAptZXMrdK3dpo1JmSQ7n4ywMHgV5n3LCSkgYiSbp8Fk
 5QLIdNwITBGgK96S1K/xeYkQBtG6Skcy6CTwQeg/3qtk7qu1q0AukXETt1mLsRHJN+vyLhzBTbF
 AIkkN6ZzaTO7HyYJtj2dHAYk98O8TYHVGiF+/vfghh3uR6M02eoev/26W7iLih1F5vtIyxCuxMM
 xFVkyQkC0+z7wP97LaRDhiV/BuUZjSm3kMBFntDjl+v26ySUB3icQJUoMPPkiofB62rmoWCVEJB
 v9fdz1DcjBsRzfYlWSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120036



On 11/12/2026 2:37 PM, Vinod Koul wrote:
> On 12-11-26, 14:07, Krishna Kurapati wrote:
>> On Glymur, it is observed that although the exit call is done, there is a
>> power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
>> well). As per recommendation of HW team, disable the repeater during the
>> exit call to prevent this power leakage.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Rebased on top of phy-next since [1] removes the base variable in rptr struct
>> - Kept the RB Tags intact since its a rebase
>>
>> Link to v1:
>> https://lore.kernel.org/all/20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com/
>>
>> Compile tested v2.
>>
>> [1]: https://lore.kernel.org/all/20260721093626.96264-10-angelogioacchino.delregno@collabora.com/
>> ---
>>   drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> index 89bc1c89fc85..607b5a5a1713 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> @@ -227,7 +227,9 @@ static int eusb2_repeater_set_mode(struct phy *phy,
>>   static int eusb2_repeater_exit(struct phy *phy)
>>   {
>>   	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
>> +	struct regmap *regmap = rptr->regmap;
>>   
>> +	regmap_write(regmap, EUSB2_EN_CTL1, 0);
>>   	return regulator_bulk_disable(rptr->cfg->num_vregs, rptr->vregs);
> 
> This fails to build:
> 
> drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c: In function ‘eusb2_repeater_exit’:
> drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c:231:24: error: ‘struct eusb2_repeater’ has no member named ‘base’
> 

Hi Vinod,

  When [1] got merged it removed the base pointer. Hence v1 of this 
patch fails with error saying that base is not present. But v2 has been 
rebased. This v1 gives the issue but not v2. I see that you have applied 
v1. Can you revert that and take in v2.

[1]: 
https://lore.kernel.org/all/20260721093626.96264-10-angelogioacchino.delregno@collabora.com/

Regards,
Krishna,
