Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B6754A7FD
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955425; cv=none; b=fWLUf8logLsiBuq58kpDNMkozrDndlvZTTRy/xopu+3kuTMH8soicTjDH5jXpajOMVQUa1rhbwEajR6EieaqXh0PG1IQMyGcjliGayIXlBKXaGB5WSsJxbjUmRTEmt0zifK24tUfuYur1yyz3pRMgkzrEi2L7v4NP6MZuCcWyI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955425; c=relaxed/simple;
	bh=LTBwD1h69J9FSsjHehddPX+hOWUr30Pz+tfBZRGQ76w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6llkU1XDKavyZmSclS5UQ3xcm85fsjpZW2dh/giFDlV6+bcpEnSpc1aKDDlvCIg28NEzzotUx+DNnF1RxsHCTCGwJpKAEsKKjUhNXpcMTqy0wScg40v2WcG31SoxwPk+raSw+X1rLjAE5OCU56Kfh3wB2ipuA+VHFFcVvfn6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nq7ReIHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIZlJAQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nq7ReIHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIZlJAQF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUG1T2376139
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7myrCA3xPiz3ZcfTIUST0TcemtCB5dR4O00mG6ydPY=; b=nq7ReIHKiSIozb3F
	PhCWHLTrHzlOg9SxQNkKM4oXCr2Ssgi2WT0qC15hBGnybFQmDOaw7gh9PuctG0WD
	DurvwmU77YXDi7MV+aArP9rt03OswQv+H8CbIE+o29i6r5hLVFs7MXaLgYt48HBZ
	AF0n5BD74z9kwX5Z6LykHOI08HU2WM+7u9uqBRBgB3rjfw9zQrZ/Kyf2bvnpgj8z
	DY3hYrqg7+NgoI6dSIwas2HBrnYJGrmQe5Iw7FLAvyD3/IqWpb9oiZVPVY0bsl4w
	n4BJBxoSiQJ76D1uMD+e3iATfdYxgJfQhxxJvngRg9Kg7cJeuKuJQrRNvGlKulbz
	D9n4Zg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru0aku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:03:42 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-459fb7e8bf4so2557064fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955422; x=1789560222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7myrCA3xPiz3ZcfTIUST0TcemtCB5dR4O00mG6ydPY=;
        b=bIZlJAQFqBe4V1dZhAgSxGb2ATNS3dSzZSIT3Aq3Ej+tEKOs/t3yb3eA/3VvDZ7IOi
         K1+xnlz4mpyVAlAig94SMAzrmvjx9BJxr9WHISnl0Mf/CRfHoZdeZVFdP3fAHI9WaChb
         iyFiYjKkBN0CTfviA2bBe533wCgNSmaiG+wltfH40RcHxYw+2x/VaDXOl8dM85DzYXDZ
         56zMNL+xJ6wlJvVHARtYx/kHiXogLHKa/6rEY6fwlrcbasaufsduQqrBGvxQNJdMOPmT
         XCOfXeQ8ueDdXT4kr6lFTU8yN0c68ibraNiz4qHFBiT/w+PQ8fz4MOsu9ad5B42tPeDU
         2NAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955422; x=1789560222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7myrCA3xPiz3ZcfTIUST0TcemtCB5dR4O00mG6ydPY=;
        b=IHQMs6PMqOAgDxw+cM5sH/WEJl0yvBO0ithNCN4hMm8fQZpy7Jycw8bG+yi8VT1UuU
         L39WIbrXG/5E+ebOVUuKh7OmZioYh8uNgnKJoMb218KPq2fojwRHVoKnMHrP73E/u9cc
         XccfeRZ47lcZsswktj/4yixn/xyt7h1nO5ukHEBXFBhymuO6TekhV3yTvsmX7W5vC5lE
         HsDjvQWK8Mb1anF9Rd5Szwb/FgioJKErMO/DJeQf1yYSVvHQxklg2cEHuVFBlF+Q9+Yx
         D9wKFjjmbG3XB69PqeKjJAwJ+9kG77UdZYOu0aWGvO+LGO/GPoote8dEFWyiFZffetJA
         CgcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwo8r+tM+IMm3eYZ/Ad+IKk6wORrUgP7ZOE0bEzTMau6Fb1HcUOS2UNERAtIsOs2Pp5qma4L+UEzYcdd6y@vger.kernel.org
X-Gm-Message-State: AFuF++mUc8s7sKr3ySNZjyyOXchU2DGW6dHrgt+6Y7HwowRFaMUNy0ox
	TqxNi3rLffKtTQJixq2zHUve20YbyGG0XO31LNobC3GQ6YX2UH/EDqebjyyc89+Pci1M8UGutta
	tFePEwedfOo7Nry8ZEFJ5ilhC7Q+ZL3T2tXK0bCsUHqsSBBnS2jvni5Zzrf+NGrO3beE2
X-Gm-Gg: AYBFou3WHpwrP+LD0NtWT25eu3WLcKQR2+r12V593TgRNFKKdYPaOswmqtLGA5wun3H
	B7vl68A36wAZ97h7BJmedKLktekXmoGi1WMJBB8K51WSmpqZz6Ief34xa34tdUqL/6LxDLbmu0j
	Vzhb2cCN2ZhssswEziXQL87K7MF/vs+tkO6VAmjsZtXs9Lb+aluMqf3oovuRKr7EX/AZ21zgWWN
	KgwIjKXole8aQNy+/SR9lhyKrTbN3XPTKxhKR+2fwUcTmlxDjp9eX4G1DKgEuwrradIr2RsPfHB
	6u81WJNZ17BEjIHd9slLX/MyD8HE5R8csD8mbf4aTmGRGV7rUOruc4zhMbY3h1kXfbVEvyOJSBQ
	IIRuynsyU4DYr7XVDrIH+sA==
X-Received: by 2002:a05:6820:c3c2:10b0:6b1:aff4:8e9f with SMTP id 006d021491bc7-6b71535d622mr11739858eaf.2.1788955421680;
        Wed, 09 Sep 2026 05:03:41 -0700 (PDT)
X-Received: by 2002:a05:6820:c3c2:10b0:6b1:aff4:8e9f with SMTP id 006d021491bc7-6b71535d622mr11739804eaf.2.1788955421251;
        Wed, 09 Sep 2026 05:03:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262f97f1a3sm586774566b.19.2026.09.09.05.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:03:39 -0700 (PDT)
Message-ID: <9416e173-7690-45ec-8c01-6ee4facf811f@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:03:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-tama: enable modem
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5131FC151BBDEDD2C6C615A3C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYZPR01MB5131FC151BBDEDD2C6C615A3C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa14b1e cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=q3xCwlIlc302ULIvI5EA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: gEPfRl8h0--5hQoFWM4Q8tskYvgyyRHN
X-Proofpoint-ORIG-GUID: gEPfRl8h0--5hQoFWM4Q8tskYvgyyRHN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfX6VipZJtH1+Cn
 YrfUV0UHnULh15y20xYe7e+onFyiSU6VtEmHuv1L5tqb0OkpsbpWWuPhVG6PLIF1sYyfn5mIW2l
 p/KAh4Sp6gdJnRBUOFv5myVHwaGoAAo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfX44PE5voRPkZg
 hw73JR9C+uznH1vru8A5mlC/sFTfsbRl1w5lQdIqzTPq4NhhTadQTolZo+dNfRydABcg4tC1GLi
 jWevxyiFQl7nJSEQi5tEy1cIxVcTN1dH3hJSoR0oEn2ssDnDtgzWSFaG+fEAQw05AnDSgprjYOH
 XxsfTlNv5Qvz9yEITGLYpmsrAFNDa7j41c3ZKFSLylszniDw/h+316Mjg84MTtYgLS7nuwcXdwA
 66iSTgABQ0mCm4IAXfFXj91fN+jzZ1eNAcbBJuBHxrxODTJJ5JbRLNV+9kXBUx8KVaVkfNm60KI
 aqEnK/Rm9lS2fV/nyCVYMMig0r1o3+sV4R2bsiZ0rT/PA4X39DiwJftZCmTwwpW8g3f1AfZx5DN
 T9rIsIgoiM+2p4jGpZENMxrDqkyW10Gb4GLPB3txEmSQYdB8JEYlQ8KDuT4rQDVsnqFVERWFy9t
 rYKvs4TQgr1eAjukclQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090134

On 9/8/26 3:16 AM, Shujath Mohd wrote:
> Enable the modem remoteproc on Sony Xperia TAMA devices and provide
> the corresponding MBA and modem firmware.
> 
> The modem requires ta-service to be running for proper initialization.

A link to that would be very interesting to people reading this
commit message in N years


> The remoteproc firmware configuration has been verified with the
> following firmware running:
> 
>   remoteproc0: mba.mbn
>   remoteproc1: adsp.mbn
>   remoteproc2: cdsp.mbn
>   remoteproc3: slpi.mbn

I don't quite understand what you're trying to say in this last
paragraph, given the other remoteprocs are standalone and unrelated

Konrad
