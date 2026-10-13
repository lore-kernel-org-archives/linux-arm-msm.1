Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89AD3C3443
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885801; cv=none; b=aDMZsSY//370Pg23rYBlUST99kpNBuU2VVTTB29TFwygnZgJVLJC96fQ9RzgFwx3QB9UMZ5+S45kMHsnCuW4AgvZMMx58Ns8Q7ZG1koFot7iRqHVL1vzUKsn9YLSFL2LY/urubSlev2ZtLZbZNGnpIckWYFoe+G6hXd4LdAbF98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885801; c=relaxed/simple;
	bh=rjo4I26n3c0IXUdbdxD0MoFTbWpgzJ6l+W042Fwrmq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOBUwD0HqLlqK/VJzAQRS72/vPA1itBculqW5+rXNQTcUmeQjx7nwkarJcIeWuqZq+Jr+aq04OClpzT/fbBL5qfULdeyu0CyHP/9eD9M9HwGFdF9p6JVnfxLXM/AZqZejGUZIyBaLLIHDKkI9mfNSLZ+8tP4YzJ7PUEDmLcdkoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcdrSJl2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtSDacc6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcdrSJl2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtSDacc6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OWYk015185
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7BotSoDsAkukhdswcmyp9WdfMfl79/kPupfZf2fAwI4=; b=DcdrSJl2nXO30Y0y
	GDBS8l+hQaSBXlaUW+OKiIh85KP4C4/BqnRQn4rgM6OPuelA03nKcSAJuMZsxoEK
	f5rB1kLvDwNh/ixN6cCkN1a6HM6fvDFMX88MeCnsu9vuz1LoN1H6kNqF9iVZiAhC
	2n4E5iMWhraJaL4pbwSdslLdGxTnjuAJggJmWbCbsk/RNEc+qrZHKrY6PTLCJs/+
	WHVIM+ZrkLadVv/IYiHsR+cmV2wwbkKxC9G+MipmI7viPDER5nf6KtQaZs64TRW0
	Lhzg5DytG5ItwPI6G3Hq8Se6OcpqiWdKPvjiwCOJfDsmJw1chBUMljPXArIJVauT
	UR5i0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugnjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:03:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530cd3dff25so5862931cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885799; x=1792490599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BotSoDsAkukhdswcmyp9WdfMfl79/kPupfZf2fAwI4=;
        b=NtSDacc6Nj8sPzy1HA7AUJLDOIA79PhrMd3jc2qV9ZSCtnXn7omKHcbQoBXjt174+X
         t0oVQNrVBP+ww1q8962GptqB41wfAWIW8EQFbLUYm4iK3V3UiQ5X/CO7qwYJsU+NclB9
         ksvO8wtBXk9kT6PvB4kKHTVqKlazVmBfab+/V5CMKCHJm7twyE3ogFoJMaZg0kcIR0BB
         0wSgV7LDdBMxrNbNnX7jzn4Mdkp7I4FG6U8pqvBy8rYXCkwj4JYDKK+f9UZ/CPN3vFk+
         cS26xklMWsmeFkyVM74hWOYmDnFSananrjhowrX5zUC3OuJkMujIkscKdXCJHxaZAZ2K
         2dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885799; x=1792490599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BotSoDsAkukhdswcmyp9WdfMfl79/kPupfZf2fAwI4=;
        b=c5gN021l5ccVYV10XAQGET5y4YlTnERer/KgeEBIHqyGeJcFXMV6TcI/Z0mEaW3eQq
         QI1/zOK4X3TmTU61Ca3z3zve+ZiIcYzMtjvcFVz7TPHsgpA26/Z1WiX/BWif0gfzQ/Z5
         19PSQ1inxEh4xQzJIw05nEUqQfEjGjytmPvZ2Pv83onzgyUGehgubwnw10TiEVrYG1zv
         NHojqgWH+B2jQ5bsOG2OlkTWCEzm0jfKI6yFtBe66K0t7Tw8NEaKfVIbFahpgPz07wue
         aCkQvNrCVWCBvAt0fCTeceS0NBMv2jnB6g5ourfsEWuJlpnMHoosqlNzv4fmR5SBlz9/
         YoGw==
X-Gm-Message-State: AFq9FYJ0fGPtlnzjO0DFZtRWj7KHfioNu17j9Ix9VXH6arCaLWGe+cN3
	0bTpAbk97Vz5I0sbWZiUajN8XAel4RrexkWeg1v7tY/DLgLQoapdQysJf3DDkzze5EcrfwUNsFA
	EImLSO4m123Obt98TXCcLXR4HzTvqn/4ZBpN4KfkzT55BImLoDPUKlgaIq2T9Y+AtxJ59
X-Gm-Gg: AYBFou3bAZF9XXx25FLLppCs54zF7ZkNrjMaIGB/vyFRzRgFqflwwiat3vQMh+4x/FA
	wwuXMHGzcS3b7Cp49AheAZGV+PGoOasDTjA5Gfy8f21V7/B6MWGQDXh4pyAkYiR8v6SmCYhu1Mt
	cikjzUyFSmINuKryeV5xzjkxuC9RDrDiPI8RE/3gvowg87N/Qo64nkh8+UaiygxP+iIOAPt9cXQ
	k7m0qRUSP/fSZNiTB+vDGiFSd7wnwqkfif8tc6AHfC7/thww1FeXwgCn69Sosjs1eOYh0FtjmIz
	45N+lCEk23eS5dPhD8IKdF0mcR5q8ITzDkf/vG0u33/ac0feFGSw5sR5MOvEsTBFE7j9PYjyU48
	C8BPeZpQs6vrsXMAu4jMQxg==
X-Received: by 2002:ac8:5e14:0:b0:535:84e3:b33c with SMTP id d75a77b69052e-5359fff77ccmr238294671cf.4.1791885798817;
        Tue, 13 Oct 2026 03:03:18 -0700 (PDT)
X-Received: by 2002:ac8:5e14:0:b0:535:84e3:b33c with SMTP id d75a77b69052e-5359fff77ccmr238294091cf.4.1791885798211;
        Tue, 13 Oct 2026 03:03:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3350fcf309sm352768966b.39.2026.10.13.03.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:03:17 -0700 (PDT)
Message-ID: <b2b51cef-cd88-41d8-b9b6-3c4f5ebf3d59@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:03:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
 <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
 <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXzAZfuOnvFVMn
 wnZTGQhkGOU+RVYvF3DHLuioz4cWxgepjEN6/i31LZGL4MTiGsv/LRkvrftm1R5y4sN70Vd6cjf
 qVeGVDUg//dczKu2Kkmi9Im6ZUgx/SHYmN3JEpGpegtZ4+blfNcd9g4L3o2tcmO9vbhanfzyAUe
 LO5eCi2KhNWK2cvEJ3y2jpAtzFTZ6RE+o41YDw8J2Rv4hvh7x4TPjcfW2KtKSIZVoFMGHsoE77S
 VXhGNti5EXzFFDbAM7IlPuT1t/lnV5Hxzzxp4EwBk7k82acmoOnC3YBH9MSerdsSYWUf+SN8COn
 BBoROvsh28enhQK2Ojj50WqS68BBLEvCOroZ3whdbNubkLb3Uqh+kcgG630ysQ+ckkiEYRK3O0N
 pVg6VrxGtLAMqU17leUir2/SWa9XCA7dxhMnefIFzctLS7DU33jouahXXNBjs3HCvcA1vCoDfrL
 uzvFVHniFLP3Fev1Lbw==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace01e7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=CFQHZ4Gs7z3mzJWHRokA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: bK1gVKHGlf0CPD78jL5xI6rcbyvBBhxJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXyGcN/6zvopt+
 vQ6WGfD/JUTPNEm1BD3+xCSaaWip8U8S4K5myxQBjFpIRyWXcz+iEZlvqGp0gvnK/n7sfsxiz5D
 b995B6xkr6zNHPW2kC63nvuhprEJ9jU=
X-Proofpoint-GUID: bK1gVKHGlf0CPD78jL5xI6rcbyvBBhxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

On 10/13/26 11:58 AM, Anurag Pateriya wrote:
> On 10/13/2026 2:27 PM, Konrad Dybcio wrote:
>> On 10/9/26 9:35 AM, Anurag Pateriya wrote:
>>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.

[...]

>>>   +static const struct qcom_pas_data nord_soccp_resource = {
>>> +    .crash_reason_smem = 656,
>>> +    .firmware_name = "soccp.mbn",
>>> +    .pas_id = 51,
>>> +    .proxy_pd_names = (char*[]){
>>> +        "cx",
>>> +        "mx",
>>> +        NULL
>>> +    },
>>> +    .ssr_name = "soccp",
>>> +    .sysmon_name = "soccp",
>>> +    .auto_boot = true,
>>
>> No DTB?
>>
>> Konrad
> 
> The base patch isn't merged yet for nord-ride-embedded.dts.
> we need to enable for both rrd and ride-embedded boards.
> I was planning to send them together once nord-ride-embedded.dts is merged.

This is not my question. Remoteprocs on recent SoCs come with split
firmware - MBN for the main part and a separate DTB binary containing
configuration data.

Konrad
