Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581839;
	b=b0dJOjuFFStfElq+t5+ILsTtaqIBG/JqStXZKwrTvY2vhOOyZzGooPS+aS9n2ZoS22N8
	 TsxizB7oeNx84wZU6txZxzPbYpgixbdqqLGRS1OcnxeLd3pUIMg+wtOL994kTg6UWpjiv
	 0wPqiaPgOJxi/CUfc27UtNRO5pvzcmN6ZcCawZR7HNxFXcpPlJUTdDsLhgrCIc8cUggn6
	 xtKggDAiZmk5PmkAdyQ51BDBoBfH8qzWHzqet8UCBvqxSsCXfY+khFKcrizSCZd4seu80
	 prSWo9nOyBi0//w89ddIQOL++B9cn65WqNSdiill4ifT14RAVJfAT/JQTZLgxWV2gLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=;
	b=eog3sLYmGR/SG7xrLgj6agv7DfmRUN+fJNPMWZ4hIpsedd/2RdGXbHkD/0m3G8xvwzxb
	 THYIx8LXWj6ApxgGK8tzlznI9AZ5LLDKB9lqr6FvTi091aqJw4wNbKXsvbb6vJAXD15DT
	 DxHY+vbYIGPMAVfTJg9vweZoWHtXOVkUyC2Yg+oYO+LZUmgBsp3y9kuPR3XBkSOAdoYzD
	 Vk7m++jH8EE+V8i3Bjuz5nemNMc8buugD0ZhdBEAP2IaQYvjJFaILgbztGgAh5xj0EU/J
	 coz7qEBYGDCPyYp17YhLk0TYrbs7Mq1Cm+YAMJnNFOmFeUz/u+Hv20BKQtx+fVEuiHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNSbFL1D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzgclMqq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575E3606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575E3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNSbFL1D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzgclMqq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5kvV1357004
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=; b=dNSbFL1DE56q8Ruk
	R8M08kmvVdNhGeruKLN+Upj6jQNsDs+EaMp905UWYV4osNRX7NE1owPx70/BfzvJ
	Zu3We+Vsck6QDewQFRBwChkCyMNDYZTCelnthSS5YoR3RDjv4OWFt8YF7TLMtsRB
	3Daoa2V8xHSY+uS9og7zB7PueJ2vbAb7TWIqaU6F/P8U/rdHMUiiepEvx4kXHJBU
	kbVbgnw4Rx6kP0z/WcoOeKViKxLGvlULhVcR0KIb5VJ/caVdEhZuMuBd6Wd8L8xj
	pCzF12xEoNHS7Gk/6IxOWohafUvy+WcuslN9KkzEgAyjrWKIffZ17Xa/zSBxlk7Y
	f2hqTw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4un42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:23:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so1123903a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792581837; x=1793186637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=;
        b=dzgclMqq7NXyfRMq2O6B1ULX6wXULNlcQFWoJwlcaSfJ9wLQoKwe8m0Yp7F3jh8fOS
         PCvJZt8edebN63EGXHZ2PjCO5VR8ocVmWLxZRdNKZcpJEk5Hmls/tDddd+T5ArlvAcYz
         lDf7VXqSk/FEsPllWp5kY/5uIVRCrAKML0FJ4i7ZR80F0JJVq6O1WUH/XKtdXaYzUz3O
         bpWf/LLWfX1OA50sPD66vmnIpzhyKpMpi305FoeFkeecYTi3jz2yEm0sK/dS03R2zP5R
         B64s1tjjtXg6+W9AWQ/ZUsRuoR9sbdFGt19Io2sMtteIUcR3LTJPPrFCyXRN2Zqp4kUE
         QM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581837; x=1793186637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=;
        b=HIo9ESV23rj9RulH68JO700iSAmmWX0j2VjO9KbxL+P1bZitk8TraVpDD6qNqR7rpb
         mRc7nA8mnWf/ufcis6jdY5hf11Jmc+GeYWKSKo48QQeBhYytWD1fethK2IJHDW0IhSNB
         OUm0WAT/g2ig3yzqbqBnc+5QoIaH7qyTc3rkCLyWkOTRvSIbd561piWgHu9R4qoJ7Ggn
         DHh4/CKaAiDUb0H7Py6Wj2tQwjFarGth+3Hf2LlXjPM+/Qt/15/MskaolgqhZcTBR5tz
         4DnstuTccW1EhcDoX2zwHM77ZXIiSP1Qt4nCsqLd/Xan/mPkzyfAwpouqO5MakeFAiGa
         0ygA==
X-Forwarded-Encrypted: i=1; AKwUvBzGoXAxQ9m/spDbig+gBw+4KxOUvv9U8XBBM8ZtObZMXVDUZRigog/voHRaaQJ1JfXZJoPh4fGvkyLhzZzG@vger.kernel.org
X-Gm-Message-State: AFq9FYIWvru9lLvHan2FNKKCxNYql+VJvFBGqZGYOiTuvhwVkchVoFyA
	B5erYkFek2oHmAGHovUFnMfE/E6AEV/oVeqyb2X2f6YDKaG3l35M6mRuf5geWZtcaS2v7wDK/oH
	R1CK6nlMz1V4f+tS6RWXqJQGODFG8gPpQG0WE9xz2MR28pXjVUtIGW4WA8PB+g5SpiIb6
X-Gm-Gg: AYBFou193mc+jsHhb1japba4jh1d+Be+PfitJg1RmuEAUtaaN4VJVXyyd70yFJ2dmlA
	mHByNw/wIijI/6kstgPTEeRiYjlXzitR4f6y7tVw3mMpFXmD0IF78EHY1irgaFzFs5+mObcqSRb
	9qRnkUDXXgy05tDuURKjJgfnFc+YZZPteohJJ7Aqi9YKXZ45Tgqn4nvRWcCiRPq81NG6ysxeFhu
	6BPHNwSrxNytJyVb+yoj6uB9/Dcz0Q8h8FWB/rstfpbY6v5M0x/5Gw0S8SCKpTQua8v5Pm7XLVn
	6Y8lXhhsN/U9B5tN0xYwXrm8Oq6WDGuAb6ivmovEOHFuTt/3OFG9ayCwXnZxjfYJ/Hg6rDwBrNH
	AGRokNr6eYJ9pKo7G1SjHf5KKpqnT
X-Received: by 2002:a17:90b:2c8d:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3ad86e96741mr999949a91.15.1792581837368;
        Wed, 21 Oct 2026 04:23:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8d:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3ad86e96741mr999941a91.15.1792581836958;
        Wed, 21 Oct 2026 04:23:56 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad811c515fsm3765832a91.9.2026.10.21.04.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:23:56 -0700 (PDT)
Message-ID: <e127d06a-2c1f-463f-a30d-ee7815fe4a75@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:53:46 +0530
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
Subject: Re: [PATCH v2 07/13] phy: qcom: edp: Add Nord-specific register
 offsets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
 <q7riz5qxge3gqjqz23xz5aecfhlg7bry5w3wzgblnyozm7ac7y@b5s3z7vk2k2w>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <q7riz5qxge3gqjqz23xz5aecfhlg7bry5w3wzgblnyozm7ac7y@b5s3z7vk2k2w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KOudOmeHfiMmmjpK1rm1G1J-pJtM_iFS
X-Proofpoint-GUID: KOudOmeHfiMmmjpK1rm1G1J-pJtM_iFS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX3g/to0OI+SII
 cuRGN+1C1WEnFTcH2lw1lfAn+5QH4exfuTaoMkcY0SFUixFj2p/F1WX2B8D4FfyOP5kNhOEAPPi
 EzXoOy3bjSaS5Vvubz/rS4k1qwDRL0I=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8a0ce cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YZ6MeopCirwGMcWCqvsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX+a9tpxMjS5C+
 Ynu7I2EtxVN1oV4FN4cfhTXQWcYpXW+dZLFb+jCyVr9ZHXW6gypbwUrmowdoBPCfa0aE122pJGX
 0jUItiOpClJyhiw2omfE/42R2XUoZO3zHjeB4Wvsr5Ys4NYPiVEskfn/qhatfrnX71j/BDpSU4u
 Oy00ZDZX1VVtVdNh11xwX1qPHnosovp6xrPKN3EdCyfHnod15uYBwb5w9uS7oigg4OcygdPHbjs
 0CNtJQYrdIhTG4V4pohsIKbFphEvCLB8e9okT4ceO0rloaQL3T4C9qF2VuMWr22GgKpcM/0Wbc4
 GM60fOpSwE5WD+6pqubyanU5Fot1iSwcMuqWuco0JxoQ6Vh06JuTs7JcdnsCBC4i/zEfimkjWzx
 sRQXvNrnJf0tVUajhvVS7wecbuFH5i72adoDyAikVspWgEaiI8oWjca0295QlY8ici4o3Taa1gH
 LZC4/6MSMf4Gj5bR5zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210045


On 10/13/2026 3:49 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 12, 2026 at 07:02:17PM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Nord relocates several DP PHY and QSERDES v8 COM registers relative
>> to existing SoCs.
> Why?
>
>> Add Nord-specific defines for the relocated and
>> new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
>> phy-qcom-edp.c so Nord sequences can reference them by name.
> Typically we don't do it, If something differs, it should get its own
> set of headers, describing all necessary offsets (especially for the
> QSERDES). Otherwise it's not obvious if other regs (without the _NORD
> counterpart) are valid or not.

Ack,

Are you suggesting that we introduce a new header file for QSERDES?
If so, we're currently using the v8 header. What naming convention 
should we follow for the new header file?

>
>> Assisted-by: LLM
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c                   | 7 +++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h | 3 +++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index a3c893f72908..d5c6835b6c70 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -42,8 +42,15 @@
>>   #define DP_PHY_VCO_DIV                          0x0074
>>   #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
>>   #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
>> +#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
>>   
>>   #define DP_PHY_STATUS                           0x00e0
>> +#define DP_PHY_STATUS_NORD                      0x0110
>> +#define DP_PHY_LDO_CFG_NORD                     0x00f0
>> +
>> +#define DP_PHY_TX_LN0_DRV_LVL_NORD             0x00e4
>> +#define DP_PHY_TX_LN1_DRV_LVL_NORD             0x00e8
>> +#define TXn_TX_BAND_NORD                        0x0024
>>   
>>   /* LANE_TXn registers */
>>   #define TXn_CLKBUF_ENABLE                       0x0000
> I'd suggest adding these together with the actual users.

Ack, I will update in the next revision.

Thanks,

Nabige

>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> index 93edabb830af..008b17222a8d 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> @@ -48,5 +48,8 @@
>>   #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
>>   #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
>>   #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
>> +#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD		0x17c
>> +#define DP_QSERDES_V8_COM_CMN_STATUS_NORD		0x1d0
>> +#define DP_QSERDES_V8_COM_C_READY_STATUS_NORD		0x1f8
>>   
>>   #endif
>>
>> -- 
>> 2.34.1
>>
