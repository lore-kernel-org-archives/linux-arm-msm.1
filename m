Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088456;
	b=n3IlhEXsEYPixN2kQ+ef9fyN81lQF6f7lsEvgcZDEKizTeb84a1aJIhSmOrH3QQBRWyy
	 BpeaOUcyuUJSXeIPObXKWAJ690+jRH7FaczqcPqzju7iEjQTcAkzhCrr8Eg9JSMNzEqsU
	 dg10OYiSpalN6OTxQI/orh+46KUFHrgiynMoN2X0FPZ/UhZB6StAduiR3aniJxEqnqdvd
	 6K/WG8zsFg09pmWBoNsdWyAEklDea6WzlxrgIdMhl7Swktv5SOOs5i9QZyYdqIZ08DfD6
	 NmJA/rJcGoJX/N4EmlLKrJ0tBSUH+pYArkf64WsF0bcBjLzvsL/QCZFgNbqLCyffH+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088456;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SV5EvR4Qw3kXSOIY+z0ynS9HZeULhn5oEkX4RVcLmU0=;
	b=Q6tngXwggEwRASDt3u22Owi4EUvBdL6IDt42ZFi5BK5dyd/0dD1RHeoHmQ92+kqnVUEH
	 rLuMUXSg+YT1M1IA8gDuaVdX39nE12hu1SS7YJlA9jaA2vfr9Bw83BYyheLOt13Q+5eMh
	 wNdqkcaFRGTzytNrrpe7E8kgJ5uhtr+h1rnUmroOV8wXwQ1mz0nP9tIXKQEN++gtP9+qE
	 +n4uhzb/jidlh/zL5cQFi6frNY0souoorJkxbZME42TpXhGIGgqqt+LM9vL9riR3DqlBV
	 sSfxJ/2AWp8RDu2RvDuVpX7KLc9zpiBOSbWC0ndpr2cs4MWJkwfhdOUbBffY2+CWrjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATRvnsLV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ax4FRd79;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16CF606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D16CF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATRvnsLV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ax4FRd79
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z66I1297121
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SV5EvR4Qw3kXSOIY+z0ynS9HZeULhn5oEkX4RVcLmU0=; b=ATRvnsLVchYGE7qC
	kfzXVwjviKIQ0jax2poUAzUkZ0gFeo9Fe5mhF5XK8XUiHHsVF6Z+GGCea/InPQug
	Ntjma7L5TiRAB7MUCv4sKj+OjozXezIrBg39pAEAVBU47prrU95I1fjdcNe+WG9o
	hRuIhXKWl1gRxv22aQQWFX1BC2Aon9kl8Niyvb593AjssTTGIMYucagE7oF9U/JM
	pOOBCOJIDB32jAh0y7V2nENc/96IiQy1xAgHd0oSYwh+fQNoxUD/3RZheyLUUU84
	y727x0kJTeu5gnyVC7ZfMp8SkzmMTtexrMgs0RE4HdWF8OFWNEFKXh8Y6yRiO/E2
	ct1hJA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xutcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:07:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so3717859a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793088454; x=1793693254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SV5EvR4Qw3kXSOIY+z0ynS9HZeULhn5oEkX4RVcLmU0=;
        b=ax4FRd799xJh0/g0tWbtDkcaJ8dzkV+fqffIIXnL2HgYqOoaOxQTY0k1GUtUWr5SY4
         mdPoA39IdPM0KLnhOy0qoEHWkRI3T5wZutzcRint0LJ3b+ek+XMRcoQ6dQ27Q7d2KPO9
         s+LJmIN/VvWLa1V7ZeoKdIZQzGMR/WawrRUMPtv5i8XJ3c90LIDjwzc0yYSDRYmS7dVS
         9REDLWZLFoyvYVpSLssl0g/ImFT7dVjDqBlIJk1OP2TjIQS8IrGVdoIho3TVgiW07BBL
         o6W7JofLRXV2kIDc0qWsQFlOM1pmC2GdD797e/L0susWYELwhTqTVCNZhQf21bRS9ht1
         TO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088454; x=1793693254;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SV5EvR4Qw3kXSOIY+z0ynS9HZeULhn5oEkX4RVcLmU0=;
        b=wlrEjKMFHvC+WC8QGpWMQROQ5AJGJr+qCmC0w3MqXwPC8UDsAhX9t7cWG/r+Bfaumy
         rPMiCkSmuppJv7MfoNFlF54815Zm8envl7DF/oxmJgBZeyENKPVLpKA0I6GkC/1FY2J7
         /b2Vn+CQpYh9+JvaA3rlbwGZyF3iz4DC0OIHPp9acoLY8QiMZMC7jqZT4sUPZmAIcQli
         WNIGcBImd7hvhity6aZ+JVWlWGYcWGmz9YhdporaGoaIYDOTSaE6a1RwcMl3NxVwxC0s
         pRGDix4QiM9txLIJlLnBx0HiyzOaw5hJ8/T4sMKfL2v+TQSzc8zRdGgpi7VgjTsVk2N8
         V0SA==
X-Forwarded-Encrypted: i=1; AKwUvBwik7e3xXCGsVq/0FDbGFmGRk7tlSXpGnnt023F6RNaZCxVF9usHA551V+5uV50bkdkIosbFaJg4H7wdf7D@vger.kernel.org
X-Gm-Message-State: AFq9FYLjlpmL/BurQsYmjbrwOdOKMDTkIVysW13KAU4vYKzKC8xLY+mG
	dvjWv+ShFItFCcUffDSDFqfaYd5P4XUIedkxDb6QfPwbz1aS7i4kP1S5+ati2qxnwAksoIp9mzF
	H0Crz5DeN715ToePqN9wSPkorM3Smnl9m4N6joeOJoOl4d8FCEaWUSZEB8Yra+F/FT0N0
X-Gm-Gg: AYBFou36QkTpJ5Krds9oGRG4+uey/+0AZf75zvA3jk1eoLnv/K2KjY1R1SKG55P0+bK
	N3FHYPfJZUVmseYvF2ioKeobcghr6Jss7/H7s28yKouGAC5F05AfLSASkGibCcuoB/BK3qvYL2/
	vnciMzpsM54yABkMhTpnb7pPg+xwV+rOJkB6qvogLyRajSU8Z84affW7ZKNV+1DAAcHHoBae0KM
	pz1EjSVE02afDyEJs/0ONGHRU4XcILuQBX0440K86mC8+6i6TohF7OV/QGtPgyd1/91qu8YYjtW
	FTxx2ZfXPMf+cWbwu0DeqJUJosjxfeXz5iWriHejQ5575qqppbRQbb3tFBhlwBxfuSB8eSHP0U8
	TXKhPhLWJ7L4U5fJvJxynYTb3TTgstdC6bCtlSjRO4XhDAo2/pnipUTWGFhfXzt+IJa0=
X-Received: by 2002:a17:90b:3d8e:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3adea8985fdmr7019851a91.14.1793088454046;
        Tue, 27 Oct 2026 01:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8e:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3adea8985fdmr7019832a91.14.1793088453468;
        Tue, 27 Oct 2026 01:07:33 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066aec8sm2585161a91.15.2026.10.27.01.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:07:33 -0700 (PDT)
Message-ID: <033c8432-4a03-4f38-b0a3-28f5d551b0ef@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:37:27 +0530
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
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
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
 <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Pe3QQ8zHRRTfvS6wVRElXVX_Gp03YLQY
X-Proofpoint-GUID: Pe3QQ8zHRRTfvS6wVRElXVX_Gp03YLQY
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6ae05bc6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=SNSdMoAXaN54LQpy3WIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMiBTYWx0ZWRfX+qq5X30VDJde
 N7I05ku9ifXGXen+zc1xdt17YNhF9QBOF0aQ8GxHKS//MANisvtPZ2eLLrDAeT4gOJNy7GvrH9u
 LtJEKG9VJc7iMU7h5M3YWeBXlZnaLaiaDXJzrxFRaSj4OtgZggq41oQu5PB69JI+dLHMLIPEh5q
 qbRoOawtNRLckpw60nkmx2KAVWAtxmfIjlNrS7m583dURwvrDY+Xtt71uJ3mTuZAaknzI3c6/Qg
 F00hkyzvXG5m9H92W6GXRrKuMwaK3I6U5t9fUnSc1tsfEEO+q3GTRSXXzTqwtljHAMWQHhlXum0
 iF6uoe1qrdsdBanAdRhg+QJ80M9T0c9KHMJAxkXiyjRgqPYwvqDPR6qbUdbll8IKi4KwZ6XwZfe
 4HN/ZdHmLvD3zo3z2K00d352JAhuEtKdSCVSaeI5JK4v+0Ic+/ATK8BLAyCm7EMKiKII0syv4ty
 daMF28x9G4SWOBLSVdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMiBTYWx0ZWRfX6wfWeku1mTVH
 sJHecGMIgTLFITrtu6MFXga4oW2kmHELlWMwsxaTxByBJBn8/yQOJj22NN3CHWebJ4yDL2McooA
 4GEVQfaV1m/vJ6gGkbfOv+BjJsVb1bs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270032



On 10/9/2026 10:29 PM, Krishna Kurapati wrote:
> 
> 
> On 10/5/2026 2:14 PM, Vinod Koul wrote:
>> On 13-09-26, 20:10, Krishna Kurapati wrote:
>>> In cases like USB High-speed phys which can be either USB2 or EUSB2, 
>>> it is
>>> required to know the type of phy (rather than the operating mode) 
>>> because
>>> DP and DM interrupt lines need to be configured differently for each of
>>> them.
>>
>> Does the controller care? In preceding patch you defined the EUSB2 in dt
>> type, so this describes the hardware. So phy knows it is usb or eusb...
>>>
> 
> Controller is agnostic of whether the phy is usb2 or eusb2. Phy does now 
> its type, but it needs to communicate the same to controller.
> 
>>> Add support to cache the PHY_TYPE and add the following helpers:
>>>
>>> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
>>> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
>>>
>>> - phy_get_type() for the consumers (like USB controllers) to query the
>>> type of phy connected to them.
>>
>> I am not convinced that this is the way to go... Driver already knows
>> the type and should use it...
>> we alreayd have mode, i am inclined to not say yes to adding type here
>>
> 
> "Mode" attribute describes the current operating scenario of the phy 
> (device mode, host mode, high speed, super speed etc.,). But it doesn't 
> describe the type of hardware and hence a new attribute.
> 

Vinod, can you please let know if you are fine with this approach. If 
yes, I will send v9 rebased on top of phy-next.

Regards,
Krishna,


> Regards,
> Krishna,
> 
>>>
>>> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>> Reviewed-by: Manivannan Sadhasivam 
>>> <manivannan.sadhasivam@oss.qualcomm.com>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>>   include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
>>>   1 file changed, 27 insertions(+)
>>>
>>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>>> index ea47975e288a..038c2b58bbe1 100644
>>> --- a/include/linux/phy/phy.h
>>> +++ b/include/linux/phy/phy.h
>>> @@ -21,6 +21,8 @@
>>>   #include <linux/phy/phy-lvds.h>
>>>   #include <linux/phy/phy-mipi-dphy.h>
>>> +#include <dt-bindings/phy/phy.h>
>>> +
>>>   struct phy;
>>>   enum phy_mode {
>>> @@ -152,11 +154,13 @@ struct phy_ops {
>>>    * @bus_width: Data path width implemented by PHY
>>>    * @max_link_rate: Maximum link rate supported by PHY (units to be 
>>> decided by producer and consumer)
>>>    * @mode: PHY mode
>>> + * @type: PHY type
>>>    */
>>>   struct phy_attrs {
>>>       u32            bus_width;
>>>       u32            max_link_rate;
>>>       enum phy_mode        mode;
>>> +    int            type;
>>>   };
>>>   /**
>>> @@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct 
>>> phy *phy)
>>>   {
>>>       return phy->attrs.mode;
>>>   }
>>> +
>>> +static inline int phy_get_type(struct phy *phy)
>>> +{
>>> +    if (phy)
>>> +        return phy->attrs.type;
>>> +
>>> +    return PHY_NONE;
>>> +}
>>> +
>>> +static inline void phy_set_type(struct phy *phy, int type)
>>> +{
>>> +    phy->attrs.type = type;
>>> +}
>>> +
>>>   int phy_reset(struct phy *phy);
>>>   int phy_calibrate(struct phy *phy);
>>>   int phy_notify_connect(struct phy *phy, int port);
>>> @@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct 
>>> phy *phy)
>>>       return PHY_MODE_INVALID;
>>>   }
>>> +static inline int phy_get_type(struct phy *phy)
>>> +{
>>> +    return PHY_NONE;
>>> +}
>>> +
>>> +static inline void phy_set_type(struct phy *phy, int type)
>>> +{
>>> +}
>>> +
>>>   static inline int phy_reset(struct phy *phy)
>>>   {
>>>       if (!phy)
>>>
>>> -- 
>>> 2.34.1
>>
> 

