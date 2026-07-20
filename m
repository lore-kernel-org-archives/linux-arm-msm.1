Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CB3449B28
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576198; cv=none; b=EHl6DrcP2zZnrrAj8sR7FFHtB56O8ae9OeHpi6eCt/tLvumd3h0oqnINB1lnExOWSmfwn9X8mM+IdNDNBv9XTFAK2klqF1y8v7T10kByGrh01gQo6X9Y5YrtoH49+keW92a1dld3rntKxNg3trKk9ZjdXdSNM+3BE63KdRrhbsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576198; c=relaxed/simple;
	bh=53p1zbn/yV9DrECz0/tAHExb1rBasS8D1r2YL5QxKgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i6rMZfTtoUewMsmObtZAA4IslJ11kuoLQod2pJg7soy3dUhM1CJ1+Rz9T8yfUCEf1RUZeys+o9rIKCqD5UXFE8V+j6RmMVLpnjVYBkXW77OXerhb9tIjPvQynwe2dOPatGhAUMd94o6gHKe0D1cSDnL2fj0eMGdWmJjcjhw+HYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3UOcuAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJx7oKBG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3UOcuAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJx7oKBG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTPnB447164
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	peSd4WSH4sZA1It8QAcMRr7yERVdJsaOySQXMlSSuqo=; b=N3UOcuAEWJ7+2mBM
	3u/vFPdnA5rR+rufb8Dm6UHZV/SuhNloGVlMqirxhEqmv91g/5B8AGeZAhxeMWAv
	UGPpm5Ww5uOu5cXOnnykqrWxIkxBkb+T/HMGOfBki+DbGKtMRXuubu/EaGwVaYxp
	44hNIXUFyKvotZW2oM765sP3KBTNMpqMD9BIAzpE5MdZzhGGn66ra/VkA0DTb4SH
	AdqI58W8adNKDcDgTXRqOnmJDtEDEuaaZQh0Wxf0sh+pgdeJwT6dux1ewcu7Beru
	55oEZ1o+HrbcsMqbrQMDL/eoEW+Q0FCDr9K/Uzzl8ztsjVIurHvCmRf4Y0OI0dvE
	27msXw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5rk4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:36:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso6155540a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 12:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784576196; x=1785180996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peSd4WSH4sZA1It8QAcMRr7yERVdJsaOySQXMlSSuqo=;
        b=YJx7oKBGk+ONzNwd/5yO2+xHsycPTScTr38GJlEEX5xoIQkfPSVgXV5NMckzxuytVc
         +1lBlC591mzTJevrypDJ6qR5IUtLwvLdu050UIJS4ou4g6FpULy64JE4p+3G4JBRqI/w
         3/nGUGOp0SedgH+SklxhajSNs2vuaEPcxEnYPyd10+wcZHCHFSf97SxDbtsWU3m1QmR5
         fjZUoKHZvccKmma/XMrMm4kM9f5t36hI9DrP1w0DF0Tcsxi5C8cp1/pLmNO2s7HXYpAE
         STRJALIprJA+2zubyoF6fY5Y5Q0kL+U8zO2y/QHaEQx2ZOFGcdINRHVwvjPZ9+NjsoTk
         kqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576196; x=1785180996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peSd4WSH4sZA1It8QAcMRr7yERVdJsaOySQXMlSSuqo=;
        b=PM15Xqw0hPyW8Bu9QhaIK7ZS6pBWsA3aQ7WxGefks/nPpMfFJsUkYmJnGs93OUrif4
         hwm2rDCTtbrEGrqrPZe9KzeviiOihvBNDQUSW20PUc79rPUZ7V9DZU5gTHA3O4VJrg7w
         SnwgoamaS0eE+zgJBxeGK7cyu1bukR2PDzw1hsrh+a2fyPlBGfW4QjL7HcfIt5a5aAbl
         XR1C2wfr+nNQlYzMLEZb3sG1m+A6lH3Wbur5K5ymLVtYUhFIZHM83PTQdONyn4E8izvU
         mCc32FsPphKYo3Rj2rLBdiJo4dk/I7Q5ZQIqIXZDbkXtLMYv/6ybFcscZOU8DFNyRrA7
         hUyQ==
X-Gm-Message-State: AOJu0YzpXqUwZziL27wRBhuR0sRV7mOMszowM+YKA2n6i6CvyhyfyY92
	J6eOvZmNdbkuNCM/27AJSWxiOv4lr1tjhkNgl/fA1eOwfFZszdzeID0XCqtb7BU8qmrvvv5sko8
	o8xK5+zcAYJh7y4TLT/RzleDo7dk2FXEqzB405YrkhxtWalnstUjFfz5o0V9aK0xHyGn+
X-Gm-Gg: AfdE7cm0gX/8PTKdaIaT244DgRk34hMKmMBMmmgWnaGZVpbXU5rglgvoQiXd7gVU6cu
	u2YY2PKbQERpBNKRVoUJEOCasvNXuH8vodV4C74tmpRGZZKVKGYDshC1JC6law4LJywistRG69K
	x0WJ97y4EcpuayuJtmN6Rxie3FrrUtNx/Y1N8nSq3rRKBV7CM6ytgK/hnn99BuPrQJ14qNGBcaF
	ZtWScf4vS+OBOnBjiCwtFc1Cgz3kcPcFOEdCbIyDaOATcF4fr/vqCTcSDeO6+zdlGXOGk4IFcS/
	07HbcS2Rvdnz678TgZEmS02zD63C+2wIAj1lC/tyLKGEqRJGI1g8GvSbN6U5VFcFR62E/2Wx14N
	pA/GFvtzV87ENhzoWl1J6Ny+9SMJ/vzRlFbu/f/7MsVaPlYWXp8lTwl5nTg==
X-Received: by 2002:a05:6a21:7483:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c3ad665ce7mr15639713637.2.1784576195538;
        Mon, 20 Jul 2026 12:36:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:7483:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c3ad665ce7mr15639690637.2.1784576194978;
        Mon, 20 Jul 2026 12:36:34 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d444sm45541529eec.6.2026.07.20.12.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 12:36:34 -0700 (PDT)
Message-ID: <1c7c4ced-027f-4c86-b780-b400af949b15@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 12:36:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: qcom: camss: Add C-PHY support for sa8775p,
 sa8300 and sm8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com,
        hariramp@quicinc.com
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
 <61d91ac1-636f-4b0e-b3c2-d51207cbd8bb@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <61d91ac1-636f-4b0e-b3c2-d51207cbd8bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gGJb0ORa9Urpd9Ovx7nvxZZz9nqpEvRj
X-Proofpoint-ORIG-GUID: gGJb0ORa9Urpd9Ovx7nvxZZz9nqpEvRj
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5e78c4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=O6vi9WdpL0XUn1BfersA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIxNCBTYWx0ZWRfXxjARcIEDYuMy
 ecaHrbKaLHmFsiuxJfsVGuaP2jPxRtg6j1dsr728M8y4zbi0p4WIuWYIvqT8T8Aw488vhrg3N9P
 TUKUg2FK7RWXqdel4mss6/nvWwuNZZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIxNCBTYWx0ZWRfX27YZywuuhktq
 SSI7n45yzmrBFS3D5iA1tMSfcrHd4cNC2oM7iGD4t+hg2p9cbqs3/zxTfskdfoUUZEErvM6V+j1
 fhG4g8xAsT8yHkliEAranBq/FPmhYPXlMqNOSI4YPrzC/ER9ENgiN7DR4XmkbQWLHgnwypHXE78
 +qmafSlJXIdiXhlTY8jxqyUb+6XRlsrdEFRR7hS42TFxcawR69jhutdw1NbmMAVXOqppTzv6iKA
 jBRKRFNYiNTRatqJ7dxIcUdTpvFJ/X2BIDNx4/9YS+yYP69BIbYxuVpzvnwhz4AEv37Wfnu/yFM
 MYCD+VCa8wJ8MLVv/Xm0TbWUu0L2FjerrFJbEEvPkTUQDLRy7aq/57gBImVWnW/ZDXamxiZHCYZ
 F2sOHg24Zmhf8E5mDXAGKnDpwWyM8IFCKc3iGqcgh//Waf0tGTKUwUz7/vFvgkxGKtIzeEKHXZS
 MXIzhHtuIRvF8JFmGug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200214

On 7/17/2026 7:45 PM, Bryan O'Donoghue wrote:
> On 18/07/2026 00:13, Anusha Arun Nandi wrote:
>> This series extends the Qualcomm CAMSS (Camera Subsystem) C-PHY
>> support to
>> the Gen3 platforms, adding C-PHY mode configuration for sa8775p
>> (CAMSS_8775P) and sa8300 (CAMSS_8300), along with a dynamic, data-rate
>> specific C-PHY register programming mechanism.
>>
>> It builds on David Heidelberg's C-PHY enablement work for Qualcomm
>> platforms:
>>
>>    - Program the common control registers and prepare the CSID RX path
>>      to select between C-PHY and D-PHY for Gen3.
>>    - Add the sa8775p C-PHY 3ph lane register table and wire it up for
>>      sa8775p and sa8300.
>>    - Introduce a data-rate selection mechanism so the C-PHY PHY register
>>      overrides vary with the negotiated link (symbol) data rate, with
>>      tables for sa8775p/8300 (1.5/1.7/2.5/3.5/4.5 GSpS) and sm8250
>>      (2.5/3.5/4.5 GSpS).
>>    - Validate that the local (CSIPHY) and remote (sensor) endpoint
>>      bus-types agree, catching C-PHY/D-PHY mismatches early at probe.
>>
>> Rebased on David Heidelberg's C-PHY series (v9):
>>    https://lore.kernel.org/all/20260617-qcom-cphy-
>> v9-0-83da8a8e4e44@ixit.cz/
>>
>> Tested on sm8250, sa8775p and sa8300, on top of the v4 revision of
>> that series:
>>    https://lore.kernel.org/all/20260301-qcom-cphy-v4-0-
>> e53316d2cc65@ixit.cz/
>>
>> Anusha Arun Nandi (3):
>>    media: qcom: camss: Add sa8300 C-PHY 3ph lane config
>>    media: qcom: camss: Dynamic data-rate specific C-PHY register settings
>>    media: qcom: camss: validate local/remote endpoint bus-type
>>
>> Jigarkumar Zala (3):
>>    media: qcom: camss: Program CSIPHY common control registers
>>    media: qcom: camss: Prepare CSID for C-PHY support in gen3
>>    media: qcom: camss: Add sa8775p C-PHY 3ph lane config
>>
>>   .../platform/qcom/camss/camss-csid-gen3.c     |   2 +
>>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 394 +++++++++++++++++-
>>   .../media/platform/qcom/camss/camss-csiphy.h  |   6 +
>>   drivers/media/platform/qcom/camss/camss.c     |  28 +-
>>   4 files changed, 420 insertions(+), 10 deletions(-)
>> ---
>> base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
>> change-id: 20251109-qcom-cphy-bb8cbda1c644
>>
>> Best regards,
> 
> This is great work, thank you.
> 
> That said, I think CPHY embedded in CAMSS is the wrong architectural
> direction.
> 
> I was thinking we could add in David's CPHY stuff as a holding position
> and also because its at v9 BUT if that means adding three more SoCs
> ontop of that... that won't fly.
> 
> I understand its a priority for you to get this stuff upstream but, I
> think this _shouldn't_ be done at the expense of adding up more and more
> technical debt.
> 
> CPHY as a monolith in CAMSS is technical debt and adding it in to the
> existing CAMSS as monolith is just a shortcut around a problem - that we
> haven't merged the CSIPHY rewrite yet.
> 
> CPHY should land in the new driver.
> 
> Aside from anything else - upstream Linux needs CPHY definitions that
> make sense for the community.
> 
> inspiron14p-linux:linux (arm64-laptops-v7.2-rc2-camss-v9*) $ grep dphy
> include/linux/phy* -r
> include/linux/phy/phy.h:#include <linux/phy/phy-mipi-dphy.h>
> include/linux/phy/phy.h: * @mipi_dphy:    Configuration set applicable
> for phys supporting
> include/linux/phy/phy.h:    struct phy_configure_opts_mipi_dphy   
> mipi_dphy;
> include/linux/phy/phy-mipi-dphy.h: * struct phy_configure_opts_mipi_dphy
> - MIPI D-PHY configuration set
> include/linux/phy/phy-mipi-dphy.h:struct phy_configure_opts_mipi_dphy {
> include/linux/phy/phy-mipi-dphy.h:int
> phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
> include/linux/phy/phy-mipi-dphy.h:                    struct
> phy_configure_opts_mipi_dphy *cfg);
> include/linux/phy/phy-mipi-dphy.h:int
> phy_mipi_dphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
> include/linux/phy/phy-mipi-dphy.h:                          struct
> phy_configure_opts_mipi_dphy *cfg);
> include/linux/phy/phy-mipi-dphy.h:int
> phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg);
> inspiron14p-linux:linux (arm64-laptops-v7.2-rc2-camss-v9*) $ grep cphy
> include/linux/phy* -r
> 
> Lets do _that_ work even if it takes a few cycles. Great to see qcom
> engaging with CPHY - IMO if we do it right in the qcom stack it will
> establish a good base for others to follow.
> 
> I'll go ahead and ask David nicely to rework his stuff into this new
> driver. Very nicely, we like him.
> 
> https://lore.kernel.org/all/220260718-x1e-csi2-phy-
> v10-0-5720a7888953@linaro.org
> 
> ---
> bod

Thank you for the feedback! We plan to rebase this series once David's
updated patches are ready and we will align with the new driver
direction. In the next revision, we will address the review comments
raised here, along with Loic's feedback and the concern raised by
another contributor regarding larger bandwidth handling.

