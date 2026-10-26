Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017293;
	b=rLgcnwvEe8vuOSoAusCPvS3p1NExinLeUp9r8nHc1po22vwSVRq0QArk5NQ/9I69r/Kx
	 Rg5dyY8HRpHZCLKoMbcuEgb4jIl8u0MbPouT83ZYDLnibH64ojC30VcBz3MaMtiPVpVYf
	 wGLuTiHcykJxFDqeO4ZBt2qgNzyBdTr4vpb3LXk/olGq+zlUorxQ6/t4Ek9R8x268mVcV
	 OmBlmssP2S1+b1tcjmsBZeaWH25IVly21UjEhtrroCxmTxXQn12E1rOuIy8DrO56AhaU9
	 42HcK+0qmtOnkBt1pidbQRKSjWZniuFxawtfoUwtyVnlaMM790+9c56hQPw0+dyvang==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=okzDhOTrwCXTYAXnL64QNfIG2ShWfufp1R4BHN3mW+U=;
	b=MwWFHWFByG2LEGDZXPm4ZHzkRx12oxywjDZI1vGs27law5D92S2KBndwi6qAgBd2hsWf
	 S5NEtu8oe83VCEpn/ObHucmYlysGcFlwqaf6qyY/9eMWT73jRybIt2ps1jIjoerDeA2XL
	 bAx7SQ6X99+BXNfsEx9/ITUPyO98ea51kdXHGVwuCbruNU4Rkh3qRtpGrahFRWJUR7Q16
	 /6spB+ywu8d6AITZiEoEK28OVxzMTVij3Rv+gjLZECoO6YxJDuJAxPEbZFxv55ZF2+AAy
	 omMBYtJICsednh21QGFPqTdFWTcTMf9NGC4P0j+aAGVRU4joU70/XIOXTaMU/q9zFjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="QWi/nl28";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBTUcjiY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D199606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D199606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWi/nl28;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBTUcjiY
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1T23562064
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	okzDhOTrwCXTYAXnL64QNfIG2ShWfufp1R4BHN3mW+U=; b=QWi/nl281MHBftVZ
	+qM0biBZUyPJlArgcbADVnwBIGnS/sBmfD7VRz9tGOXJtvXbOfAmYWt5xuWCb3sw
	Mlm7EKZfJvnZc7bUrQ9HeTWQgt4yQxhthA0F7jAmoorw/NWrn9YOULuFxIJSC707
	tTzAffr0wHAYa6Oyr59P61fOKheO5vap+7KISwzTQww0ZG07KfVwHse3dOBiRJvQ
	K6tKxukGFQI//N4P+iggs7QkZfowI2Kdet/oHWEkrTklaZeyBxz+RUHpMeJOn5UA
	arY/4gbkV94tQgB8PsIfd1U/E5CWrgVJhdHiNvqyWII1ofh07isNQJmd0bNTXV2e
	AiSl/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90hdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:21:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so655727385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793017291; x=1793622091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okzDhOTrwCXTYAXnL64QNfIG2ShWfufp1R4BHN3mW+U=;
        b=RBTUcjiYfWpXpBXUvbGJ9f9yFu0dwd7SFb9nMJSLfTeDrb5Gr/GZTrh2jXRVEO8XIo
         FrE8/YnFcGO5+3Ck3Xw2d8HEM7DFLeIkJw9iy83lwOTef6V/kb9mpeuS2JsqBCSZNlvI
         whQACbZu7FBaWvYaRmMixQR2zg1mS/YvYaoAKysS1MxhXLwXQ5sDvH6GdlexrYgFPMFY
         Sr7shhlvVbBCP1Nmp8fMihwFmHJN/QDcRawPmIhSHqiF/DNZKQK6fne3A3SX8Wr0bhfv
         OvnqsqnLL4gXv1wE4/cC5Sr2z7w+9NutXNazhOP0muU/5bGbKz6yxX5TItfoDI1T07bb
         BaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017291; x=1793622091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okzDhOTrwCXTYAXnL64QNfIG2ShWfufp1R4BHN3mW+U=;
        b=DxJFMCIJeliEmSNf0HN5oPSFWS58diqibVNF7TcPcQru61vAqzWk0Acx6i1yhwB+HU
         NRTyyxv7meXlfFi7wf3Jq+nuTK/PX2sf7Kjf0smDPgxrBFK4lEqj5c+p/y4d64UBMk6w
         js9LuXkJD8Aqd9e8AihOr1ASmjBuidNYk2ayDf0KfDTNcMunZmXbWMvAUCla4lT4ggHK
         AOIrhsIOODsdALz0t5ZU9YZvIRUHSJRoyqRl6AK6sGvuaStiT6SBNgDTDqOb1aOV3XT6
         nyebyOTiKU/69yWewma/zjwrtL6tqvMwXxMKksR38nGfd84xjdCbQGMkwl0XLnWaYKBZ
         oXZg==
X-Gm-Message-State: AFq9FYKdrTK4+RWsh6I3CYGPWV+gBDDuBMlhrJAjFBC7BSkUz530vIkd
	rjdQsjBHi4VjPNKPdM0t3wtTFr73D+aYnvitJ/vtvdR3C/2EuE8K3/o05MQj7mZY5I33kxzd7K6
	arcllpvnXo7uN6Amk68rtYwho+jCG0Ku4Pyqwvg1TrbOiW0qkIL9MttPW0H/aDQjbl4Ud
X-Gm-Gg: AYBFou29+VI7g07uznTaHN76GDqHAN+WL7Uj/9bNAkF9pr81up4Bx5cab14xnXJmYVh
	JGb6INEY4ETjIrbn5li3FbPhLJiyrAyxsniS/D3RRsB17VACP2x4Nt/JGv2T6LRXpDxFO9jZZd4
	VLw0ArZWdR6hJ9Z5opZATr/x/PYIesLG+qyirToMOLzXfx2WqEIl8FIRVXBmg34qSbW4ajW45xg
	1kkMmn0lHXpNXusKLXttwx2MNC8cSG+fnfXaXTnMjIHv9VSe5eDtyuP6kKjeOKt6Vq/Dszp6HWV
	riyz0hB09TUf6nq/LdDKwrItyrWOILXcLgc18jRdXSSZoPBKiHwYLIDhz71aKy6TQ23fJIYimxu
	y2jk7srqCMXvcB5MlEZrDoV32KulQ
X-Received: by 2002:a05:620a:470d:b0:93e:c12c:fbba with SMTP id af79cd13be357-940ef94d193mr979022885a.71.1793017290594;
        Mon, 26 Oct 2026 05:21:30 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:93e:c12c:fbba with SMTP id af79cd13be357-940ef94d193mr979017285a.71.1793017289813;
        Mon, 26 Oct 2026 05:21:29 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd64cd1dsm306573566b.45.2026.10.26.05.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:21:28 -0700 (PDT)
Message-ID: <c38dd906-1436-4aef-9caf-8c2901a7d09e@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:51:19 +0530
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
Subject: Re: [PATCH v5 05/11] phy: qualcomm: qmp-combo: Add hardware-specific
 dp_aux_cfg2 and dp_phy_cfg1 fields
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-5-3848c2615d5a@oss.qualcomm.com>
 <e3a8d06e-5f7f-4743-a332-b2a8ef30e781@oss.qualcomm.com>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <e3a8d06e-5f7f-4743-a332-b2a8ef30e781@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OSBTYWx0ZWRfXyn6NNAtzHswt
 2/dW4Nwv/3lcnoqcK1cdjHJ6MHLQ93PONfqDITo2kCoiZNxCJn5usz2JaIY+OdEVe72Fj3cuhnh
 zWHHDJi9K9KOsLtAhURrzzc4OeYsFrPWd51avQHh+JPdSyJh4Ck1tw5L266wVEwU2VaZ7vX3XcK
 qMQDmbHEpnFsQC70IoDaigCeZgQ95CNcqJO5iwna4gO8E6WUWMIBirluadsEjXrOqz+9yocf36C
 gbqDmMCxFIRYZUswveDCdIMsyeaEFCo0ox7oCzhebvKBa/eGlE1nJBTQ4/AHZDVNwHzWT+w+f8+
 KLrWbulTuKFi4IQFJt4YE8iKbTP44SztcD4v9dKQqAb1rUsUz2expbepymxjrsP/J00jilE7X6Y
 Mw0/shklvVx+HElq0Qqkqa3Vv3iHrs+LyE5KGtszXZ2p7OZLoBUfXxmvqUS+qECNkF4GQ/ZKvom
 6P1ffLXuO5Xkeogd0cg==
X-Proofpoint-ORIG-GUID: 4v6e1IvJiW197OLkF18KVLy1GOMejbgq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OSBTYWx0ZWRfX2TNWAM66KlWo
 /uJzmUnaIt92XfDrKlmKencQ22SUGCBlw58J0ROqbKUQw8gdE6qtXXWXDNrHx6ThS5BRgf3v273
 uaWdxuWYaabqmfXAHbsdH+H9PCebGjg=
X-Proofpoint-GUID: 4v6e1IvJiW197OLkF18KVLy1GOMejbgq
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf45cb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=z9__apPl9ExnX2lTgnYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260049


On 10/22/2026 4:04 PM, Konrad Dybcio wrote:
> On 10/1/26 11:34 AM, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Add dp_aux_cfg2 and dp_phy_cfg1 fields to qmp_phy_cfg to allow
>> hardware-specific DP PHY register values to be specified per-platform
>> rather than hardcoded in the configure functions.
>>
>> Define named constants QSERDES_DP_PHY_AUX_CFG2_V456/V8 and
>> QSERDES_DP_PHY_CFG1_V456/V8 for better readability and maintainability.
>>
>> Populate the new fields in all existing DP PHY cfg structures:
>> - V456-based platforms (sar2130p, sc8180x, sc8280xp, x1e80100, sm8250,
>>    sm8350, sm8475, sm8550, sm8650, sm8750) use V456 constants
>> - Glymur (V8) uses V8 constants
>>
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 37 ++++++++++++++++++++++++++++++-
>>   1 file changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index 646e97a52886..ebe2e6136f7a 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -2486,6 +2486,14 @@ static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
>>   
>>   struct qmp_combo;
>>   
>> +/* DP PHY AUX_CFG2 register values for different hardware versions */
>> +#define QSERDES_DP_PHY_AUX_CFG2_V456		0xa4
>> +#define QSERDES_DP_PHY_AUX_CFG2_V8		0x06
> The doc says this should be 0x16 for flipped typec

Thank you for the review, Konrad.

After checking the hardware documentation more carefully, AUX_CFG2 
depend upon the swap_sel, which does not indicate the Type-C 
orientation. Its value depends on the SoC hardware configuration — 
specifically how the AUX lines are physically wired on the board.

So tying AUX_CFG2 to TYPEC_ORIENTATION_REVERSE would be incorrect.

I also tested the approach you suggested, where different AUX_CFG2 
values are programmed based on the cable orientation. However, with that 
change, link training fails consistently.


Thanks,

Nabige

>
>> +/* DP PHY CFG_1 register values for different hardware versions */
>> +#define QSERDES_DP_PHY_CFG1_V456		0x0f
>> +#define QSERDES_DP_PHY_CFG1_V8			0x2f
> And this should reportedly be 0x13/0x53 for normal/flipped
>
> Konrad
