Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448335;
	b=riWxvLSx7rfcGCY+ZXiZ8ZFnQfbLMNBYOuzmCTHnD9c0w80AFSYfJ7zzhrSAHMEwMX8t
	 pfHytWXsBR9IhNBmDl3dzOBtSr4t6vREdKhKA5DmaKdU54sAj5Dx/0Rff2M32Pn/9VPhB
	 JoiuMlLqNSsqCop4HL79Cz25G2FgW82axq2RifeeBSkPgDpje3w7rMo89YEiQr8Z3NDgS
	 xx8+116GHm+oZZLmTHYQrFmm1pZoXmfRcYzOePrZN2hlhnTBZbqfOA48RkEoH6FXLp6Jf
	 RWWi2vnYTBO4tkiMEBgOFnTl3+/0kWnzG0yt0iSmXYiBYZ1NRbQzjiQnmWHeu0WMngg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
	b=3i4PU9zFycWJTf8sY8ZEI9oUApJHRyFXZga/ZNcDZ/RlPYRDxXp6lSVUB68nkkRAlCli
	 ylmOWuYdEIES1TtrCMtmK6IfefHD/ZOdNpFkVH528WdumK7PKGXD3yVFW64npnhmKBWfc
	 7sI47McjZNE5309tIo50zDx+cJh9QLSlUDRIgWq5cQT2eCqJTI3i+niOBWE5C2FvLwDBk
	 ly8Lqw4IJg+LaaKQe6CDmuBH+5gRnhAXLvQwIdTAVd4EKGK3+imX2RtnvRUcntZV0KpO7
	 ThS1ejhvh588eKZtYOIV7FceM9jYJwv9IgPEKVYTcA40rto8jy6KvwzdJ5Y3LmeEjbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="etiSRN/Z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WT3oz5rQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA75606A33F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA75606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=etiSRN/Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WT3oz5rQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLERr4030396
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=; b=etiSRN/ZbBaGQPfE
	PqfRvVxzdf8I7UEJpZ95lYWONGlz2JsFbKdHzfBUlUXKEjec85yz8hBhWOcomrTF
	y37JW0So8DEWJsxGF0cipPSqiVX09gBwWww4iyjJ+90vgzEJcSFvLgq6eSVF1iYD
	z1fDYSoSGOlOr5tBQmAxpfLjSV8aI+kOxausb+34GHglWm7fTelZU2YiWDrY5LwP
	zJfR/QD2+wXLZAdu+jMzGoQNantoQJYhNTG3Y2UcmYmACqoW9LvUzCPmpwx6PVhM
	bUpTBkoJrZGe8WZ7Dxy77gHADmSVE4eflJKJxCIi6h9z8yfsTkjWyJN5JxRCoHGa
	yOm07A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsjakg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:38:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so100185e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448333; x=1796053133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
        b=WT3oz5rQ7gZbeAz44zHnkk6iVJXeK3DmzpH8P/CO9zx+F/I0hwXuL50IO7BWGxxx4W
         u46zO4eoBXlJH+t7X4co4f6Z8vNwWaYBqN8nCoiQJCqOyh5BM0DzjFvLrqdMTN9V0PS2
         HEvohFS9CFqFnEXVyVsjIjUDzrb9Fzl1I/n6ghiy7S1/TdZjXsOJVeDI3T+uG2ZrNV6Z
         dC4DCsPlvD4UsXL5jgFLwR3jW1DIjOgnK7Ylzkt+i0slmZNfZi2qGwHORpWXekimZkpM
         Zf9OlFN25XH8G2v4Lo+PE4IJANJ6CAIR3bY+YrgBkSrWR10f8HqzRM/Bz0oCd9lAg14d
         zneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448333; x=1796053133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
        b=lTe68kKHuMf6xFTBQLrMYLTuEAWgJjX0KF7UoLHCTA96MHbjplaOB4peVVeEUMsXbw
         BCpw4LFJz1BolSeZi6hedrUFF8/0TSHA1GpvolqiTBdkhQyYcNsYXIDdKyL6MUdXjgxy
         byaT/0cPeu/zNRWg1wrQOh0SCKlL5Pf8Nvko/xKeqfWkumMDa2n+r1QqZ3x5iCUiYrx8
         epFGQk28lA/3F+wkQGLsLVqvAmcp0+cv+n9OBRZE2BIPGrqjQrZL8W4zfibBWXvvH4cQ
         pVx0fM26R+WJqpJiqAub/sbUKxyvL9/i0WOsBpQcKgeZGxW41PCZsRMG9jZNFAXhiX/U
         UjqQ==
X-Gm-Message-State: APuU4Z+i8uWtqWYlMbWHBg1PfgK2/xsLpJriLRmlTB7v0jpeMtIR6oQB
	axK3IMkiQIZss7aVbK23AooHaz/erw/07Npt+Zv6mSVnewvUjABCnoppx1gRyhBKuXMHgicAfaI
	VC3irs+/vmhNcn5z1341jwd+FcSj0F754NnJbeesJFbnn04b4Htx/nuoarWLpCy74xYgU
X-Gm-Gg: AZFdTZf7I9c4DSWCvkzuQXDpSnkvjPsv8oXi4108ZymfA60RKt/npHZXaOf2jS8vIU8
	aTnT6ZYYCmBFjPE1EwUiZXunuDMaDPzdQsJbL0xUdByuxX7JlnfJwfTWTUkF5k2Fgyr/M4CGz63
	4QRqHLgOQeGrHRWCN94o9zAwYKJw5YUFrXhpfg8M4qYWHEn60nbPlsReE6AtlyjXyWi9lopHaz4
	YE1Axb2GGr+1l+hsRkXU9WF1/6bhlwg5G/esDTGVoyQkzSE0l4a7FaqF04ROxJs/o7aacYQ0Cfj
	L1GyiCzOFgPWn1MhXKetXFiWGut8/Xu7vmW4UAmjzCFOZrCJi4ni11wKSbg6vApPK7CtCohHtTN
	Ufilo5Fb59hx9TYvY99dCi8TeI/4VT8hg/YcjO/ySV7FcfgpfnYVlaOK3Bz9midJ1a/6tMzE=
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6871880e0c.2.1795448333379;
        Mon, 23 Nov 2026 07:38:53 -0800 (PST)
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6871835e0c.2.1795448332884;
        Mon, 23 Nov 2026 07:38:52 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm3621677a12.36.2026.11.23.07.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:38:51 -0800 (PST)
Message-ID: <f6eec0d4-1d37-4bdc-b09f-8bec0dcb8dec@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:38:47 +0100
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
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
To: arapaille@atlr-engineering.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, stable@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
 <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b045e0d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Knk3v0qlAAAA:8 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=wt33j95wQlzQpC1BO6QA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=L2g3GqtBoyQv0ocsUjqh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 1psUEw6p1pJ6EDXfpdLEiEvMXtR2mCSb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX7yP7fgTZO7of
 S/ElbN8MRBA19+45/ASb2iJroQuFAZEuCaQT8SPYR443HLCnT4E1memwkXgd+IIQVBNk60aB9he
 JE/uJd7+dLKrZezM4fSGxyBCalsnjyRY6IMSrfqgOb6Y1rYfAxXL1mERA6o20XyUySC3X4yoYmK
 HhHfTbpMIpai0rnGsvk5UKQcK8TNFCxC8rPNLP337vlmdhfAJ/RqulghKsS79wKpoOSrxe+nB+l
 ij6brVPjGQgN49riN2ceyiLKW9gCCffI+15h6ySeevmEZik2yM+gMTi4vyUjScKzGcVrYL1UBEq
 h48EJvBfdiouhZpM6Q40GrSMUY+7a/PFAypjdu1cfnpaD7tw2vYkoquuvGVw5vKnErUoqEAd8DP
 s+ERemZKO1j3vU1QJfOAMFwcPM1D041ikFut8lNaXPFpRsb09I9egfdaHifStq2VNHOcTvH7mV1
 wjsF6vOWlPz0YJzsFww==
X-Proofpoint-GUID: 1psUEw6p1pJ6EDXfpdLEiEvMXtR2mCSb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX4c5ltOhM+AeD
 hJs/B0Wm7hK879DgPwkMi/rwb2rCReZqAm43uqkbMOQqpRGKVX+1j6VKf4zyZjBFQbRP65gVt0R
 J2z0jiXfL4JBwr/OfD18Ox/1r+AHsIY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230062

On 11/20/26 9:05 AM, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
> 
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, so
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs.
> 
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc node")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---

Docs say this is really a rising-edge interrupt - perhaps the driver
is wrong here?

Konrad
