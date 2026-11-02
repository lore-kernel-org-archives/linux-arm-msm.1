Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610951;
	b=segiytW77rWI6cjeynI4kkBb0RM1oXADiybhRornjo+h1+PZ4tGmPC42gjg6XlrJGMl4
	 L5Kur0m2TOdQtfjC0IHju37cFbDbnlf2caZyFW3YBOVYMJSIVjVzGALU2/jvAjqDsWqTI
	 yHE6d0vFCw88gSETNQQ1qF7K7pulNjVTVq0IuPq/y0XOMngRAg0tRhuFhP1Tn4+SHLWok
	 H7AzkJecwRMwA/oFCx96PQGaf/WqyM1m0wbBmGPYTniVyIe0fCq20oC7MMcJVllcl/7Hy
	 jKwRqFDHThg55S98vy5hAp2kbzjYMGX2Vt7AugphzJFot9k/GI1cKbsyJjxXBDuKJIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
	b=CGwkPO4fmHgRpfFYXUZd8UAf5YB5Ch6eZek8qA5AG52piplmfgHDxTJKVXE7I7/0v11I
	 NgXko1rCprx8TkkF3X/iBRbDaP1aDKe0raoUJXvH43S7azqUWZAWW5XRxDrYTRDhMEy12
	 1pPvTNiS3CMdFzgWdcAidDKJER0tePOfNRX4rb1mIs3e6wBWlSXZ6MFzfAEWTy5EYJ304
	 7XXAgGAfN/3/bVuMi7f5/xXqezyVCEZxsShJxiMx0RClwzsRPGn0VPziPPpdqP8IA7n7P
	 KgyPR6XA9MEEqsICYGjOvdPxnW/yIicsnWhefPqlo9pbdkqCMduN2MLD4imvdcKuuHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7uTwWoL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUhHrq3T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C8B606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C8B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7uTwWoL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUhHrq3T
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQCr3440462
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=; b=I7uTwWoLS2R3vItJ
	6mMqX4yhEjdW4vB5H8U0w1FBr7abaQK3uOWKOeEmb6bhRQtDPH7rQd6WbYWK66H9
	kjT8Lxy6XzeaMNWHqOrjfhivIr7cppkwGiyQDTjQyDUKljgAMWcllBAy/sS6Ag7h
	e23SLG5HzDs/m4Mb91jcvS73OlCIoqQFQYN65ORXIsLne4UAH4MJQT+9zrdCbWY1
	IzlGBpkIFlgI4gNAW/id0TY0cZ5B/UnkXCt2SWRLN7TZGyjv9d3wlyeDttYTUsgN
	09GPkyjxKhaRCB70V0BmrMQ0ILZix0v44oNGKYMeF9hwPLlKnUxk+kWhd7i7sNK2
	9wLBPA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201km5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:15:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0592d4539so4046680b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610949; x=1794215749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
        b=SUhHrq3TTvQYhpa5BgzXfksRmCaualRkAZXOhxMfu/gwcELB/Ks5H79mCGcJWLpUtu
         S+FhsLvh/ZZe2IOCO258msbkN1nXXqvBeC5JiBI3HSgrDpxiEwWh/adlVS9RuHSjRyF+
         8kIT3vsqyH165LiSbCZzj8mDe+cO8tS+QDlx8foGIM/FddRwFzNeoZdaGfpz7kDpPvZZ
         J8n0gFtCYJo9xS+oT9582nsKxyBVMheStD+H4OxMjsm986dmxN6k0TFdslakAwUktcbF
         x6sSTVHupcPQIU7+yknp/jkptpaX5bNqV0Lt8QWOJjtujeTBkv+ymiVEKnzndrhjkQ0s
         +BcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610949; x=1794215749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
        b=VpM4AGqEmphBCr0bsJ6R52zpMHK4W1JWIt9k6AQ+0crBrFlFfMnxoEl3cgKsaydbxP
         ffbyexVCBEHIyj8leFy7nRqMwdxlb6y3niG3enRRCsEcpJFEMONvrOLGDkQ9JPd/TyDx
         X48etKYnM4LaalJ/NeZ+t1Vla8uJYyJNXpi1FRt9hwlUbkJbYQwS0Am5lYeRSx6Yz5+X
         KWzsPrg8ix5seqwgM7fhuqvZEwTqkb25gMQ8obitjpngDTszq0HTtVM+ZaN/T0z4e2AE
         //aWQIcmwFwQEPRGd5M3493CxXVM/zWXPhuNoEBMx+hKMXBeZu05e7rp2Q2k/pKSnfOc
         GtmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKIU9eTiymcFg5wEmTnstQ4xcC1wmf0RsC7mNOtlB9nAgtvV1XbE1Jhcvjxylo+ymWBueXCFUD8yLBJ5Ce@vger.kernel.org
X-Gm-Message-State: APuU4Z/4tOcYfDW88TvAfeEhDuWlXmLfMJyEyIwiYBVjA6EtejCmCbkw
	eK8J05U56kL5+7ZrAAUq1yEiol4ToNpTQeVODGcx71+H324cZ4aYqtR8BwZfoOmbiEYqFxo1Y2a
	wBW+44mlqEzAlLr12ftbhKJ+mA2Fzny6XGz2xaLXEouXdLebStUu58y1seh+WACkgmM8k
X-Gm-Gg: AYBFou0Ig17HDXFyeKrbutkrV6FAQM2c3bnl1T4RF3Ge87yO5iRuzjbVcKYVrPzQR40
	03qNnVIqz+d9ua16JOEFh9j40blWvQ4G9ky+G1nbAJ8fMS+4p0s9bThxC4ZnfeaUeTUXaYEsLD1
	Tx4eJAmnKHGCQ0EtOuA6ocDIc9XsiC3Eme8X/D4qemR8NmmN4YVkEeHwRBX7EMXSC+F/3Tgsuf3
	OqKFK4Id7CY5iP8hKVpfUSbhC609Rc+mpwa4Ka9VMz5lIV27bkJ/+DnPp/kfXvbQgppCe2dJmVp
	BZKxTzMCKxIKm+qbnU4rUJfuyt9Zwx/lPxoHDCBxSgHlryzctcu6I6vc/On7lejG9Lzengpik9m
	EODDv+OuG/JW2tuxfonJNioBZMC0gkNXcoGMmyXLX6If1cB69eJhTqT3C+ZGrdNwC92qgKtekxT
	moyR4DzfHXlYgGP1jTmME3cHf4iwypaO7Y
X-Received: by 2002:a05:6a00:2d04:b0:886:31d3:51a2 with SMTP id d2e1a72fcca58-8a9bec6107bmr7559106b3a.39.1793610948762;
        Mon, 02 Nov 2026 01:15:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2d04:b0:886:31d3:51a2 with SMTP id d2e1a72fcca58-8a9bec6107bmr7559078b3a.39.1793610948253;
        Mon, 02 Nov 2026 01:15:48 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada6bfdbesm1745367b3a.42.2026.11.02.01.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:15:47 -0800 (PST)
Message-ID: <a4370991-0d91-43ac-b91c-c1c416cfbb91@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:15:41 +0800
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
Subject: Re: [PATCH v23 08/15] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Vladimir Zapolskiy <vz@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
 <dea88756-39d3-4c61-83d9-939ddb9336fa@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <dea88756-39d3-4c61-83d9-939ddb9336fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D2M1cdVSnNoGYyDxAdk5phpEiPA32Kyg
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae854c5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xlR6tl6hVQPR--6jroAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: D2M1cdVSnNoGYyDxAdk5phpEiPA32Kyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX9IwiZOBmGRoj
 nStDoenvrn/wndyCGaDpQLrB1jI/kmHI0srHb8QCIAMoTu8GM95630LBbdD3AcIa3f+RBiTSX6H
 PJ6d/cU5rzg6n+EMgb0frJHYnGLBMOo2c8/sYSFCf/6UCPvxNUXjet7inUI0KOI6wyi/5/RwRkI
 W2Kusz0pgPsuv3MGz9xFiIfas9x7ZiPlVH/L/VT7r85+EjYuX3M4T5lwYgEeqn5DtiiUDAEnszE
 g7FPDkvigA2rYKjAApjXkOo+ldLVcoNA2yDrGlXUkEwMpp3GGO1gReU1rlJ77EeqUYlFAyrXnJJ
 7e0/cm9Yhz+cY8uddPwSTl0QSrq1YYVOfbjSrG5MJB92kegqWy5cIOgM1fmDT6v8jhsZ34BU82f
 e3a+IQBEcQYh9c6XSLvmypAeB201DlF7qLInqIT4fAcGc/GuiuJfkzjcWnYzRM6AIuzn9tAfPeN
 9dkGsq2WiV266aS0Buw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXxJ6z0TG269E6
 39fnVlpEOvyZMBnfVvzzb0M0kmit3Xm05oeF5Oa6930OelkmvBf3VbRAvzUqiB7R3ydaIGSNAt6
 DF2+1ZQW34KQ4SU/djWnTXf2v6FS6sw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/31/2026 1:01 AM, Vladimir Zapolskiy wrote:
> Hello Hangxiang.
> 
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
>> the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
>> rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
>> which reuses the x1e80100 lane sequence, clocks and supplies but selects
>> the v2.4.0 common status offset, adds Kaanapali power domain and register
>> the "qcom,kaanapali-csi2-phy" compatible.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++ 
>> ++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index a64242c66cf0..b0b63dd3d958 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -38,6 +38,51 @@
>>   static const struct parent_dev_ops vfe_parent_dev_ops;
>> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
>> +    /* CSIPHY0 */
>> +    {
>> +        .csiphy = {
>> +            .id = 0,
>> +            .formats = &csiphy_formats_sdm845
>> +        },
>> +    },
> It makes no sense to bloat the code for no good reason, especially if
> these empty tables are to be added for every new supported platform.
> 
> CSIPHYs is not a part of the CAMSS on this platform, hence resources
> shall not be statically allocated for CSIPHYs in the CAMSS driver.
> 
> See also https://lore.kernel.org/linux-arm-msm/20261026224957.1115370-1- 
> vz@kernel.org
> 

ACK. Will include this and refine this series.

---
Best Regards,
Hangxiang
