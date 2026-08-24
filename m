Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E053E7167
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561067; cv=none; b=reo/V++JRGnL/u7Wf7toBJrIrOz5btA0li2Y3URHWe9yLzqyegrFKOZxu+KH+bNr9n3RQYL64kJ9/pasQSWmPsNuyyXws0+PTyZy0ZNsmz3gNsOcyFAIGmcB11L6nqRbbXjIOW4InW6XiAH22nCv/i0FgDxaA/+R6Fg7ADQIygQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561067; c=relaxed/simple;
	bh=8LDC1fIZw0VxIOIyC0NqqLsIOXCsh1QsQbMQUEg97ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgqrdpmKeua0YPEgzVoGG+EoswiaKjMSdPU2O8IaUdZNTyy1UITm7+fcG4VIp2Eba/PQf1Rrvtst9EAcCzftvLuyWDbK9LXKEr7uz1KsanbSEUGAib0HFQ72W4bdhklrPeQWXWZazNE9Lmt04DBg5AU4QGu+W1hOB7GV6gh3pR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0rP1khS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Is08U2Gz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0rP1khS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Is08U2Gz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RCuY3066900
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRC9/nnQFMJjzCuQLMerdD5jbZ2DoD+xn4FWz1VE4JU=; b=U0rP1khSVvAPRnwE
	xK6VLxvFpoygXy72UCylJkNiHNsQFo8nymrX5leovkgjM7NCE82lca3/TdpIP4aE
	v7K027GBXgoLk0nYuzzL76XufILLmW1Fe2CaatawxuouTfWMlZya26qKqfwSyVBY
	1tDcTgyBtRQVJ3hr1B4mUcbp9yxG5nV6X2+zAZ0k7WcYkdVDbzgVQROnUjDjiTOF
	bGX4YmTH2LvQ+ipWenP/IGPQrAeOYAHPHOL+FUsyTVHm26u0GrnzltYhKv3Zu8oX
	/lckpaPy2YxSqYvKcsCIwSqKFMVAcbMcIV1bOrBkXZrtkRQ0l+kmcvN2hxjvx3eC
	lYzYZg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphqw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:44:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737c728b37fso73305137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561063; x=1788165863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRC9/nnQFMJjzCuQLMerdD5jbZ2DoD+xn4FWz1VE4JU=;
        b=Is08U2GzVRuYm4Fdnx1PsFNBjICmeDTaR/LdVKe9mXnH20dchYTTjDhQMPA261WsLH
         wz/EkEejUrcFeKpQ6OtOdhaDaMcUnDUA1lmK8jCrat3v9gOGlNDNTL5hH96jlqC8H2BI
         Hc7OX2ejNezRsxKlL8CFTlqDpVEULT6Q1Sk72cTmjbEuIUP5otcYEtPJtCD6t9zfcFLX
         mjvHCYW58uTT7kD37myhPrbeN1zUO1CFIPwz6gRT5smeTo5Y9muRMImVT3rnEMRIB1rP
         6kN1oeIkMctVzlUh9bG9Et1/aGeGtBlmQ1u3/2Egd3UogcJaH7/FcLdD/ogpWGhbsyFW
         CHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561063; x=1788165863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRC9/nnQFMJjzCuQLMerdD5jbZ2DoD+xn4FWz1VE4JU=;
        b=SNzPBs3DIiCnzkDwa5OdWFg9exE/1KZCcpg70UjeXDzJ4hnXarS14/oT1lBq1nBkw9
         WTUhQpk1QlVXvWCUJzjVUA5bNdge1iqKRUS2HO1k6w/zLrW2aMYN4IjaWzN0zqVFrzpE
         KgmmOpl/u+PNSXOmRlMu5+DQMmow1p7hGWQIAeNP5yvQPQ+DHoyQfrqHj/JEJZg5Ts3q
         zgjoQoCNVTj0TPrnSFnCHGTTzDlgwsQV3HZHo5mk2UVkAGqaKXe1r150m1wTlw6d4NxK
         VRCRopXX9+GrFMVpgIzmR0NVhNOhkfxPHoxgXdecLpvZ9SZh36SFiYfUGSJ71cZ3Qa14
         xy6g==
X-Forwarded-Encrypted: i=1; AHgh+RoG5WlF7l0a4BX4f0fnkPOp3+XCQYWKNOC1FoiOyMqHFLJnUTy0Mdrp3ntJAzFJ7qcj9IyoIDmOyvgYKh6i@vger.kernel.org
X-Gm-Message-State: AFuF++l7Dsclw98kUJ+51rDCgczWLeFkncj259OlXP7RbTAYxIg8FhOi
	08KMwOhdnBsoamlm0p0ejhIGHQmjpJfyrjasQxTI2qUv+t+mPNEAhGv1UChvy7pzXKMpi3tdY1u
	85rzXxcr8JCKBAs+PpVwjamAP7dozWRzEQS2xUxei2NjFNcHqaDdB0t1JphbTXrNtbcFl
X-Gm-Gg: AR+sD10LCdE1BL5IoSRUrn/lCCdF5W46zAMlr3DN/uwcM0v0m/PKaVv9mC2wifIPQC/
	1ZrB0rA56GOe5YJsuQEk5OJ9ARlIdhpngnIjNuqF+C7XpQrk2lOkmrk8B/vNcM5QzmKiVUzxqCQ
	4Oz9fGtSjzDCVuGA+b7nj71YzfA3mZGeGFjY2gNJqlz6fQVx1wy8eAzC0W/SA66xMdxj1PxWylq
	k7rMuCp6Gyac/HxZjppHA46KdBRkzEzAKrqXz6zCCIAqUHSzNIzxzQLBv96mKIm5nLIK3qOq1ZQ
	vqrtTpKXtwqopYh6OCAiizTDI3G30VPYEFfOxGwoTgEqOtwy/LWTBza3I0wU3qCFN8A/KuCWPuD
	xpCnrWQS6nRZn45aQrqIk/IrL
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3272582137.1.1787561063290;
        Mon, 24 Aug 2026 01:44:23 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3272574137.1.1787561062820;
        Mon, 24 Aug 2026 01:44:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e0190d3sm7562369a12.9.2026.08.24.01.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:44:22 -0700 (PDT)
Message-ID: <06acd175-0078-43ce-ae58-567005f62562@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:44:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair
 functions
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
 <000076bd-b3fd-42dc-bd43-96ee9492a638@oss.qualcomm.com>
 <aoZVKWTtdCQSSvaH@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aoZVKWTtdCQSSvaH@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NiBTYWx0ZWRfXz7NclS7gg9L8
 iSaMo0jQzbDmHS/tB2PeVHKcMUBNpHce8AfahLirDzTxOC1YyoXss1Gt0/MQYxt/xPvTQ1v6aA8
 G3sei+7/0DyEdpMh3M48icI+hf8ny14Kn9Phr3XzRKmB6MpOnlBIbTs5klEkP7jGfIgaA/2szO4
 OiR4bRSgMFuMgk9ZHqGRzdH9PZVyjce7VPN9PF4l34DWeftwUvndqd59YORADWmy5qFBpeIiw9V
 fb4sLlgzB8f9mr7fWHikcOaFZ3Ak7s7W1JK6qNgg5wJOMpUgQLuuV+7Z+k+0yyDJnN69Z1QsV98
 LKfB9fC8C5PA0PqwCQx8t11rys1G0rqpWx/Dxwmm7dWLI1fuDs+2YH1s2PGK/r1Z49S9f/fRs5V
 DNyKj1WYa4VQppeEuueDL0fDC4XqrAzJm0Yt4TvEIB0GhBqqYPf/Ni6AyCYgkzufNgI9qmA6kOd
 CyfLczh7efrTcHnqYzg==
X-Proofpoint-GUID: irF0ot5XZb_ESyl0loYWKKipUoEQfCp8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NiBTYWx0ZWRfX9j/2eMzQQ6rX
 hdFU+eqbIgqeuFmngKKPZ6ut5BuFrssVTruelc2May9fNMnvTKUEmMHF1+jlVkCjqXo2LjMnsHV
 WEVIILXh826MQ4OXhjcrd2dVVw4cHYs=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c0468 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=eCN_Hj2St81N8EpzqcMA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: irF0ot5XZb_ESyl0loYWKKipUoEQfCp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240076

On 8/20/26 3:15 AM, Shawn Guo wrote:
> On Wed, Aug 19, 2026 at 05:27:34PM +0200, Konrad Dybcio wrote:
>> On 8/19/26 5:23 PM, Shawn Guo wrote:
>>> QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
>>> pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
>>> TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
>>> respectively.
>>
>> [...]
>>
>>> +	msm_mux_qup1_se2_01,
>>
>> other drivers where this is necessary stick an 'l' before the
>> lane indices, e.g. se2_l2, let's keep this 
> 
> I can see that for single lane function. But for lane-pair function,
> it's not a new thing with nord, and the naming convention seems to be
> without 'l', based on what I see from shikra, eliza, hawi and maili
> drivers.

Hm, seems like that happened by oversight, but yeah let's stick to it
now.

>> The bindings change must be separate
> 
> I understand that's mandatory for new feature changes, but for such
> a bug fix where both binding and driver changes are closely coupled,
> it seems more reasonable to not split.

Up to brgl

Konrad
