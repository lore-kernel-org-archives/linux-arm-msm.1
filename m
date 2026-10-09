Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EFC3B995D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565212; cv=none; b=LZR98nZgasGI4/4l8tNlEcSSWqYGdyg7mDvRIT75zJF5QKgdllVrNDRlieTl5Ph4rfB3tgE6RkspYBrDMM/NuF5fGmClGW2w2P+l1cWvSCNbuqnEC2DInbupMBNCRFpbRC5bMUz/iIaMi0nMVDvs+GmmUs+VclQebcrSvUVBiQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565212; c=relaxed/simple;
	bh=/SFRWd4s6/zDXRWcNQtbzjimLl77s3aTX/GJXWKcwpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAAfCm2LTcHQJw2RnGDHUfMBMC+hNf2nHzlHv51dRohXexOqs7IZoMZ5/rFr9oItYPLX6ZTVHCpLHH/CO+P74nrHcDUHJt2rx5u4rydRRWr/j/piTxaJdWWzMAnpczsbklH90JAqd5aQsyeyPBWY9VE7aLjEghMhGnsa6VM3bjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRdR7Sx9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMO0QPgp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRdR7Sx9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMO0QPgp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GbCt72185307
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xsMlwv29UHJ/iYsm6gVY/2H7g6IrA01pTEowYzyQ57E=; b=DRdR7Sx94OAR5rKQ
	GpSjlI3Et0TCCMsP/se5dpCAJnMz9quWray0E0ed0GMKSPyH3sdiMHPw52vGvrNN
	K2idutEA4pSTiUDjOw4gJlrfu085cjCzHZnKUqWy/L9M15fF0yMEBf3SPuHb69Tb
	/qRchcrGQowVYP2AaGPRakqGMveRXEE3t9MBxOMMwZl90VVVyE9eNBdAdQk7zsoM
	gye+n5p9+877nlqHwNnj4HuxkjzfyF1lHXPZZ+KvcMymLvdhPf8h0HbhCrnE5N+k
	v1RIVU+CUW9hUA6Wcfmi/Szea7zLZuKc9MWZCKV8mIrRpudOx1AhNGrJqHjWUgk8
	d6KvIQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6whgvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 17:00:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8884a02ee85so6973586b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791565204; x=1792170004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsMlwv29UHJ/iYsm6gVY/2H7g6IrA01pTEowYzyQ57E=;
        b=AMO0QPgptxRGyMYnuo3J52oYI4gDXgnHC/1pdrOnToursr8aI2LeTa1qKntZADtfCh
         E0rCA6Afd5nMYNFBJUiWQvEpXVkq25HJzRqsYYx51yYZCj8N27R45rdVAkUzoA1P82lW
         IvLzHM8k2xgwUgfHK788Qcang8p6P+g4/dkJTwQfRUyVQIx+LSDSBlbgbdLKqNe5U9Og
         VxkdMZ3c9rrsAQbwUaVaF5bOxsuVxXCfdrDgt5ZerRzdi6uIi8bed0zz0Wf3puyL3VDJ
         vUm06lClHtppmqCAa14ZQtR3NOV9PXViCfeb9tB6uxkPVuQy+Yuif3QH8HtI2yMuUuTg
         Yb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565204; x=1792170004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsMlwv29UHJ/iYsm6gVY/2H7g6IrA01pTEowYzyQ57E=;
        b=inlG2zArDXC1sv/NkUcFrahDz/olszbUQWUTBkts0kpgqeka3R1ZUngGz5osM+UUes
         /1KiBUjV9ad+QBfbTuSm4FYOrIhVbCCjPK496yBZAvkK3L/QPdJPY5ZLF1EuHM9OClBR
         inplkEB/xAyswDBzKfP1GDveLT2aUHFe3AnPxxj05E0F/1lq2cWlJpvAyLY6AszRJuLn
         pxtC3O56Y6BW+MszNGfw+AV2GdSqveqv4JFUIeRkwyAN/7rc3pHPGh+ithPL82omF8ft
         fJFctPVoYdewqfu4IgxqpDVF8fuTph0eM6U3YFevbyHzRFZKE8gx9a2T5onedLjEY1sm
         N/3w==
X-Forwarded-Encrypted: i=1; AKwUvBxKylAgp6l1KXfSDPwTX2Ku3ElkpIdU77wA6K4SPUcezATyheTzFhN4Sy4JbiQy5SR2JgK3GqvTp13AypzG@vger.kernel.org
X-Gm-Message-State: AFuF++nFtLlVWzJGb2YfhGeip0eyfXdJLtyzkJApLYQ7ELgYVAfy/opc
	AWsArZF2ED6yGM18F/OKt4C5W1d45aHdCHvZlzPg9mnrlw98ApH213S7bpAKDkDa2ygK2bFxCrs
	x3TX0fFIWCm86XiuAo62ZI8wljLe0yEAaE6doDwD/2m7GhGXuwTD3bnc1QaKh913UzcSf
X-Gm-Gg: AYBFou25mb58HcIseangyOzAqYOlQb7pXfr/ZTM5jyjJ1q7fCAdgW5RGgBgZwsGUcA+
	anrFue70hwK1kpR+vZge/SisVcBWra4nnjUoF5f+dqwnC3WowTQMjcLFiuHA+PNMhbqia46U8hl
	VqDo0q8LWfnYiRZBm0Q62FVtehyxWbGz2QDLjtNzCVWAiwJEvaG8dEEDi3h8h/lc6j698VlY7QS
	imCCYOg5sI6zQ1bftzUdB+/ikAIX5Dttst4oO2Po8NLcxVhZq9VgBZEm2JHvlqlGz+OZKAKLpiO
	o1gBFPbwbW4ofY2+hDWzt+Fz+zIHTKTmkJAH4Y5OEwdUWvEVp7BVpZ8Bc2A4E39O1E0PLYuk7CR
	+o7E0LPOhmZxmv4buPKMDiEFsq29lEQQ+ujnIcpL3uGdIQBdC0Kn7MjWL0PLQ0g6uxM0V
X-Received: by 2002:a05:6a20:3d06:b0:3e0:b9ec:7c64 with SMTP id adf61e73a8af0-3e16bd85989mr2589978637.18.1791565204178;
        Fri, 09 Oct 2026 10:00:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d06:b0:3e0:b9ec:7c64 with SMTP id adf61e73a8af0-3e16bd85989mr2589960637.18.1791565203736;
        Fri, 09 Oct 2026 10:00:03 -0700 (PDT)
Received: from [192.168.0.106] ([49.205.100.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm1395220a12.31.2026.10.09.09.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 10:00:03 -0700 (PDT)
Message-ID: <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 22:29:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
 <asNji2_GUda8x245@parshuram>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <asNji2_GUda8x245@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfX4LGD3pNufmfh
 VDqMA9Gh7St3DAcma5Kl5Ud6inwEoWB5BGb5/a5nhdLbxiK/47QiXtlIVw5g+QbRR5U8kZYh8Oc
 ajri+bM2f71A8gymTvuomEfNc8AmHTs=
X-Proofpoint-ORIG-GUID: bOhfxvsQy6V7WhbRMzl4B1gK_Wj_lh_y
X-Proofpoint-GUID: bOhfxvsQy6V7WhbRMzl4B1gK_Wj_lh_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfX0ASqlhiGevjL
 Xa9qFf3r/h7gJKt0XvT1USbyMy++sQ+e7+KpFwIpPq2ts8VOMg3B2+sVjiT/lOL+6wpDY3OvO5d
 vK7lTWx4IbuwKe47uN5411KiR+RirDobNHrnfzEo6JLYrfT8dZoPUT6GiNyOGBHhLqtZPDg6ePE
 NGoZz8VGnsE97wLScqetU+ufibTwddmnKMXQnjPO87h3u52cLmMCQLHLo/rVhxjDxbtSQWmEnv7
 t4SaBwIEuK2BLa5kq1t/1nbO4TEcTWzGEDEGcIHQgbs+4ZLR4kf0u+8V7PJn9Dp4F+X4cHr+EjM
 AewyL7WkkRu5nCKCQ08sooEhcDmSlzJGyIU6sNfdRg8cpRJspv+jXII3i0hZcO9rvHsbqo9BRez
 sAw/p+ZWFbaaPKs5qJLKIdNN9D0DT9IGTSho1Jwpqris1TqjNt8glZ5V/PibgBWc35HhLDheS4O
 OUmWJwbyoq5+4AGJKMg==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac91d95 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=jBUYxde0W5cEf5DRjetLAw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=a43HgpfhDiYDw8gHJIcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090067



On 10/5/2026 2:14 PM, Vinod Koul wrote:
> On 13-09-26, 20:10, Krishna Kurapati wrote:
>> In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
>> required to know the type of phy (rather than the operating mode) because
>> DP and DM interrupt lines need to be configured differently for each of
>> them.
> 
> Does the controller care? In preceding patch you defined the EUSB2 in dt
> type, so this describes the hardware. So phy knows it is usb or eusb...
>>

Controller is agnostic of whether the phy is usb2 or eusb2. Phy does now 
its type, but it needs to communicate the same to controller.

>> Add support to cache the PHY_TYPE and add the following helpers:
>>
>> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
>> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
>>
>> - phy_get_type() for the consumers (like USB controllers) to query the
>> type of phy connected to them.
> 
> I am not convinced that this is the way to go... Driver already knows
> the type and should use it...
> we alreayd have mode, i am inclined to not say yes to adding type here
> 

"Mode" attribute describes the current operating scenario of the phy 
(device mode, host mode, high speed, super speed etc.,). But it doesn't 
describe the type of hardware and hence a new attribute.

Regards,
Krishna,

>>
>> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>> index ea47975e288a..038c2b58bbe1 100644
>> --- a/include/linux/phy/phy.h
>> +++ b/include/linux/phy/phy.h
>> @@ -21,6 +21,8 @@
>>   #include <linux/phy/phy-lvds.h>
>>   #include <linux/phy/phy-mipi-dphy.h>
>>   
>> +#include <dt-bindings/phy/phy.h>
>> +
>>   struct phy;
>>   
>>   enum phy_mode {
>> @@ -152,11 +154,13 @@ struct phy_ops {
>>    * @bus_width: Data path width implemented by PHY
>>    * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
>>    * @mode: PHY mode
>> + * @type: PHY type
>>    */
>>   struct phy_attrs {
>>   	u32			bus_width;
>>   	u32			max_link_rate;
>>   	enum phy_mode		mode;
>> +	int			type;
>>   };
>>   
>>   /**
>> @@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
>>   {
>>   	return phy->attrs.mode;
>>   }
>> +
>> +static inline int phy_get_type(struct phy *phy)
>> +{
>> +	if (phy)
>> +		return phy->attrs.type;
>> +
>> +	return PHY_NONE;
>> +}
>> +
>> +static inline void phy_set_type(struct phy *phy, int type)
>> +{
>> +	phy->attrs.type = type;
>> +}
>> +
>>   int phy_reset(struct phy *phy);
>>   int phy_calibrate(struct phy *phy);
>>   int phy_notify_connect(struct phy *phy, int port);
>> @@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
>>   	return PHY_MODE_INVALID;
>>   }
>>   
>> +static inline int phy_get_type(struct phy *phy)
>> +{
>> +	return PHY_NONE;
>> +}
>> +
>> +static inline void phy_set_type(struct phy *phy, int type)
>> +{
>> +}
>> +
>>   static inline int phy_reset(struct phy *phy)
>>   {
>>   	if (!phy)
>>
>> -- 
>> 2.34.1
> 

