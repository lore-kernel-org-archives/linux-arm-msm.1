Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2DC3C4B68
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994313; cv=none; b=i71GD4h+WfEr1qapY5SrtRcppXW8APye71VDM5Yrh1nbTCc55YBb2WP06Li/9MKAFs9tOIcIkLLd4pu/34HtWylUwVV+wPuLntdtnVuK92gIxURZJoJv6O57gi9Oj0XyfFH02aqZHd+g6CHHRYxDuDOg9oTEV9UY3N9edTJjfJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994313; c=relaxed/simple;
	bh=YxuXzWHDam+cuHCgh8Iwx9qoxWf2tukZ52/V+Oq8Xf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+mOMb+nNXYslePpOlTIYOQ0o2kb4tFMgudQPF2HDlhVVoo6a1yqXstTULT9T0Ffm15tRkpHbrNmqnhvUkSIOGWdJlatq80uCr1KEHCg+4JMH6u/Ou0na581IfGYWlq0xlSV7yoJiH1KDXyOn8eMayhnP2yvSpPfvSK7TM68Rn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbQcBQ3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4MN3o3g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbQcBQ3L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4MN3o3g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe9BC419349
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PvIZxmuE15GlVG+Q4wvYNTHDEd1Gz/i8y/bSrvtg4rU=; b=MbQcBQ3L8hl7v/O+
	yGvXJuRxZUpZs2h1b20swVmcTg4Gc5tI5e0nhcU3E0Gniwp3V4fkMXqnVlTdMx7g
	KtpofB0o4MtfGBUrYn+rHcg2elUz5K1uYCz2MnRTM43KUQlVqHDubT2ikKZegKrA
	jhiqJherUM3LMTYHCM0teQzFBIMCtJ+mo4+kIXJW3BLB4cmEGKgBhsss692lw1QG
	vTQBYVxgTo0l4UquoWWHXBvaWehJUIiPqbN8uoJjHrf0R8KSssZL/3wScCeCBnrs
	dIGg6xfLDQhRGlnXUb7MFIsBBQRQEoo/8+CKSr/sI4LvDoe02ILNoGmgGExNISD8
	lEwNuQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq98qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:38:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530db5af1dcso5774861cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789994310; x=1790599110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvIZxmuE15GlVG+Q4wvYNTHDEd1Gz/i8y/bSrvtg4rU=;
        b=V4MN3o3g8DgDm6y5UxVXvq4r/xmnAKbzK7P6CGCTkQxV/iXZMFaKqvVKN3e+9uKjRp
         WIesl9wDN6HxVH2hnmNxuRzRaSgcCOKYc1pvd2Me/Qd2/P6FKulSoPEJviMETAG3wy8+
         33jsSfru13TIHMYXj2UjA13RyOnnoCxt12L3nYMlOSiAJuQR00xm7CrBsL+qJg7mF9U8
         CC4U1xz63ugulng0eFitiGSCenRZkLKGhEJlQAEmoNvZ7oZlveV+gJAzNtutsuFdaxdd
         +LWA4dWeZsVOEGu4fSd08bwB5O84MqI3Tlklkr/T4UFCuXsaOwygK++ZXxeOvA9pfH0y
         xS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994310; x=1790599110;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvIZxmuE15GlVG+Q4wvYNTHDEd1Gz/i8y/bSrvtg4rU=;
        b=TitzOditcXwWrtZCYCBF3L+UcFSj/aqI/D5bYEPg4qoC5gwKDNTv/PFMqi2nE5N2CE
         3jHxplZyIs853nc9tdgVqboXcHqMan/ImZF6gkfQzZufkRk6U5GICdiROASQsbPz0iot
         ORqUES0l9HAzMPs6HbmUFmlU+mWFUdPIZhnhSxqfV3gEYwcORGh9TVi9qF+64XuBKH0I
         3xosfVBR6cKdnFPRn28vn3NYuAMswZYSVGcNh283HXEvxtYGTegEXYO3qvai3kBjU2LR
         4+XgXAtXZQOhqNpyFheQjZdX7g9eKNkS/r5ybatltj2O3VqIV7vMp2mWpAzq/nd420T0
         h4Dg==
X-Forwarded-Encrypted: i=1; AKwUvBwenQRItmw4Zv2FCtp/FQ44bEnWYRh6Too5C9p7aM3GIlnwqB8Refy2dmUwQyeX0wxwhywWmbpXROYT3KJh@vger.kernel.org
X-Gm-Message-State: AFuF++khfe8oODzjKPgM4TaYrpaI0/doMB1HfPI860kcIWaE5bCaD/ZA
	uADcBKV2JzOzv8wPTwvqp0W8D0dCYpTXJw3BU486g5oA3EJdhKIitVIMOu1rCl/dRxvphyetxQn
	bPNAUA8omcE1Mn2cRQAO3zPMI6zsaDfT6zrxWAPOyKfVbJ2wW98TKChTaUTsZcMv8HnDP
X-Gm-Gg: AYBFou14UjqpIX0c2+qU6L74N0PJrLPNjBI5nGOowqB08UDHMrnXU5YKIPbJ+5vLgIQ
	oqrRP9ohqkMy24ICamP1vYdl+dw4HJcQK6k9O0blPUCeLelTkObGkocTpyg+wk3hz6/QIYVZ0ZE
	exgQZtfCyu+S88b2LvCq7jGx0RQgll0wVSZT6TN/lPy0dUvT0I/NTpOxa8XQ/jQYJSnMv4xuBE9
	bClTJUhtMmz2WpI/dvCs0u5ve21wuy73ZxO56pK1XAN09H6DshVoF+kTL4K8580JAys0Be9LXxh
	xN1Tf4JhsVzwLuTYd16SceITG8stwAQl9p8AzDEhU11+wttSHejC2AjbAzWnILEqVAFJb0EStcM
	3GW1ebHlduPK4yMeIJNUqgw==
X-Received: by 2002:a05:622a:50a:b0:531:c5bd:3014 with SMTP id d75a77b69052e-532d8f46a54mr3898981cf.5.1789994310248;
        Mon, 21 Sep 2026 05:38:30 -0700 (PDT)
X-Received: by 2002:a05:622a:50a:b0:531:c5bd:3014 with SMTP id d75a77b69052e-532d8f46a54mr3898381cf.5.1789994309616;
        Mon, 21 Sep 2026 05:38:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60762de03sm21616271fa.31.2026.09.21.05.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:38:28 -0700 (PDT)
Message-ID: <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:38:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Manivannan Sadhasivam <mani@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>
Cc: loic.poulain@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com>
 <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OkWjWKw-ycFGJ3k_bJMIO37zduq3KZlk
X-Proofpoint-ORIG-GUID: OkWjWKw-ycFGJ3k_bJMIO37zduq3KZlk
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab12547 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Me9BlI2ErCU43xmxp9EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfX788HuBC/Tc0A
 2W4V0oh5/UiPaXSHU8kYYED/JtoSJ9wVUVaht9iwuLosm+g9UYafL5XCiU+Dqk7yL71b51Uktt7
 TDa8aq9dejT/uGsy4Z/EBajn1dMCdZSxDabS4i9rvgqWiCAqUhBty90JalHCwfiAP9wPs6yzNdS
 Yxq9VfCVcLJI202SW2/ZGReSX9vxMfZyK5WST0bsEfw9Ma7HR0rt21Y/k7u6cKwmNiwvsMcJIqW
 TrADzOVf8JSTL5JSUVJSAc8yrI1lDguEskNp9zilZ0tmfHOBx10h9JP4fmvtu3OtHhiGKIzy52r
 ReeDQZlXKTP083ZDYGCq0TNPgzh/TgORIE0UcB57WYp3IuAKbQb0k51CwWjyH6k7ctNlR8VVgTc
 hbQ+R+s4hnN2rYFsKBsmT0mZktliZFnzBKR3uZTAE75dzbsInOTR1ekCB4w2WrjtiYIT1JcrxGW
 /nYbKvzmtLFLP8rMQuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfX3yt3vp6E43HN
 d25iUpqLCaaz2M4UgBCh92/EwQBjd7E5RfRoOmZb10ZrnjKuIz/GoTuMuNNlpROpQF2IF+0eANg
 ukUysbZsx3zFrw7E0m4BgBZxKHK1/zE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210182

On 9/2/26 3:48 PM, Manivannan Sadhasivam wrote:
> On Tue, Aug 25, 2026 at 02:57:15PM +0530, Wei Deng wrote:
>> Hi Konrad,
>>
>> On Wed, 19 Aug 2026 16:24:35 +0200, Konrad Dybcio wrote:
>>> On 8/19/26 4:13 PM, Wei Deng wrote:
>>>> On Wed, 29 Jul 2026 08:06:54 +0530, Wei Deng wrote:
>>>>> Fair point. I will move the port/endpoint anchors to monaco.dtsi in v2.
>>>>
>>>> After testing v2 on qcs8300-ride-sx, BT init broke. qcs8300-ride-sx has a
>>>> soldered WCN6855 and no M.2 Key E connector, but the pending series [1]
>>>> uses of_graph_is_present() to detect whether an M.2 connector is present.
>>>> Since of_graph_is_present() only checks for a 'port' child node, the empty
>>>> anchors in monaco.dtsi caused hci_qca to incorrectly enter the M.2 pwrseq
>>>> path on all monaco boards.
>>>>
>>>> v3 moves the port/endpoint nodes back to monaco-evk.dts. Please review.
>>>>
>>>> [1] https://lore.kernel.org/all/20260720-monza-wireless-v5-1-69ec6743543c@oss.qualcomm.com/
>>>
>>> The series should test of_graph_get_remote_endpoint() instead
>>>
>>> Konrad
>>
>> Hi Konrad,
>>
>> Tested: replacing of_graph_is_present() with of_graph_get_remote_endpoint()
>> in hci_qca.c works correctly. The M.2 pwrseq path is only entered when a
>> remote-endpoint is actually populated, so boards like qcs8300-ride (soldered
>> WCN6855, no M.2 connector) are no longer affected.
>>
>> Hi Mani, Loic,
>>
>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
>> (monaco.dtsi) for clean DTS layering, so that board files only need to
>> fill in remote-endpoint for boards that actually have an M.2 connector.
>>
> 
> This means, the dummy port/endpoint node will always be present even when the
> M.2 connector is not used. I don't see a compelling reason to do so.

I don't really see a compelling reason to defer re-defining them to each
device DT either..

Konrad

