Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0703384CEF
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271985; cv=none; b=dw1eXLelm1GB+qelMeens5fop4I1kEXNEPuw4nnMfLACuZ44vkco+w92YGA2bndg+vXTAuiDsqgEiusQhtf5GIV6GwGm5REIXuzRQG/RXoxDAb5AujO1obzMJY0HaJ2LGW48uOaBimIdia7+72c5l9K5qOQDxz0cWEG8UHJ2IfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271985; c=relaxed/simple;
	bh=1l6+B9/kiT9XZBmBIud3PCIdR6DEYQtW0/56aYQAQ1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbfBzv3tvR7h4RXTJk2XP27uWmbWhD2dxSxzBr4vVoszmcuHazk6TRqoC3n+cctlxanaBvfY98+KsJ1SnPpnF2agA8uWOmrmycC2KTflQmpdMP49AKEvhyEFxQ0sOGaPG1gr2HTjmNhJlj0h6cLhYHZqKOSJOkkaHhO1aVRKi8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sp5GeC8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5dk1Esi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sp5GeC8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5dk1Esi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YsZ2270319
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TuaONZnkIC0V5kedHDHgzsDhrDPLgKViMEylIZ9pSng=; b=Sp5GeC8tPG1fki38
	dE+/CQmbimwho/R/sH9Dv4SWMxK3uIE8VlpM+fV33MXxu9uskSgMqiPFv0svGdtz
	fS4N88zKhVZnX4z0zsB9Bw9XThir09l4joPZoKrzLSQIw5YJ7nac0xlqQcAA3MlK
	OnUVqazeYkECESTppblROss4kt65FnkiD2q2E5u3S5pRkQ7oFsin7D8SqZxRDUgQ
	Agpc3u72zxpqm8WoGcbACAWa2AVZDvJrpi4UQ1g3L/hAVh7ogg/PkjEfzePkNTRz
	EQu4Pdse0v2jVLclRE6flGtSkx8mON0nXjDPa4bX54Cr8dYISmKiUHwRqsbmcq0C
	kEplPQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx3mt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:13:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so104808e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788271983; x=1788876783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuaONZnkIC0V5kedHDHgzsDhrDPLgKViMEylIZ9pSng=;
        b=F5dk1Esic8qusP4gU4v9K86LFKV3kj3S3YGr+Ru0A7UCtb30xf8uD1avTRRN6pR8YP
         i8s2dM4umW1AQL0+j+i9U6uo49r1XnkmkehB46yFl3V0ml+mceA/nmqfkwe9DbB/YmoA
         yWZCJFXKQ1uxvHSgY6tShv6hkqE6S/4j/esBnwq7WJNl40xaVEVS0rfJfHQb/iGKMb/R
         XYAomI3XZjtwjIhrMbsp1hujG4gGij6KPrgAwNhe0WXyUJYQuazdYgFcqgSLAVEJFK1l
         5b8VjAsExXeYzZxQ186/vaEH2GMBiM+/fjZbKyk4U1tIE2mTEnCQdAZ1aWXQ0GNIkCxX
         4yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271983; x=1788876783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuaONZnkIC0V5kedHDHgzsDhrDPLgKViMEylIZ9pSng=;
        b=JEhZ1rc0dvkypV0KuPkXKuCPbyxf1lJBD3TcQ2c5yIMJxtEFU1dHt8vrMNLGVAgHC8
         x6NNeZOsbkzYdmSHckfX/WOhup4uD6GRABE3SaIdJC1hp8O2ZgKsbIxqz++G3RWqdK+K
         GzWzXKliPGzamvUhgesbcI5iL5P3z0UVjxo7B6X1nO1t/LjrYEktX2TW3yClp4ZV34pk
         WXEbCnkwkjfddP5HWAZAPiOgkNdeSFv+v9IvvbmA/3bqUMr8UDLX1Xm6MPrqfUHj/836
         NHhAHxuRt1Q2MhqpGbmheKiEFGF0BX1ZiZQApj2gTv1Cdc+87k8s3EXTBv5PxxJcOIEI
         coaQ==
X-Gm-Message-State: AFuF++kH7mJfzjMR7SbqBaMmFrmkgDqlHh01hVO4+6aIhg2Cg0dtvjlY
	G9MK4GMFDr/JzsNv1279JTNCqKngQHPU0oku7T627WDp1VB2jsflmoGJdv+eKbSy8M96HacZpP7
	1x/Xx8mUrzS/Ro63TtAhFU/JyVPBh9QHUJFTQC/88zfZYPkW24P13I/ws7SqTv4ypLxDV
X-Gm-Gg: AR+sD1154ieddVrYLawpj3LAkkWRWqYv4iGeI8X/+M7O1Ga49l3C6PnPpXk2YN08qcg
	YAyX4Z/3zpJ2o7ZzX4JbaRVFbKth6PPD2Xae0bsbji0WZTcGvzTShyC5QiEH2vJtjS8AEERa/yU
	ExDEONnsa6zLHMMKEAwQOEH5UOaVr397Yjl0q8at2b7TvtA+2L5+Ealpuh6kPwrsInGsYe5WCYI
	LmGbYphDG/GjtKdNCynag3uQAJB/JVEO4jxWcvXmXxmsIngnhQkg+qS180t/G0atGSKc04GMxve
	G2vIWvPjnwfsiTPmNfUWbZ9z91zWta6XE0qBBbS+C/DssrIUXSfuHqPJ/sXwwXwt989Ka1OaO/l
	QQHvk2C/ZEcnGHsQtwUtHsw==
X-Received: by 2002:a05:6122:29ca:b0:5c5:b075:40a with SMTP id 71dfb90a1353d-5c68140e41fmr4674723e0c.2.1788271982939;
        Tue, 01 Sep 2026 07:13:02 -0700 (PDT)
X-Received: by 2002:a05:6122:29ca:b0:5c5:b075:40a with SMTP id 71dfb90a1353d-5c68140e41fmr4674693e0c.2.1788271982351;
        Tue, 01 Sep 2026 07:13:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a673034295sm718367a12.26.2026.09.01.07.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:13:01 -0700 (PDT)
Message-ID: <a45dc2d0-1c46-4909-8d4e-d7aa57acadc7@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:12:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add RPi Touch Display 2
 5-inch overlay
To: Abhishek Thomas Varghese <tessolveupstream@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96dd6f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=23Cz_ppem3x0p0_49vMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX952d239JfGNz
 Z20wuubkDC6oEGmfMR/ICJhG6GARBilL4vTnakqzyIuSry5TNljyqSznF3W6j2UbdpEB6gh2San
 fxoRtrzLCtehfcURa+sAp3j20sIyvvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX4gTdhKLg1eAb
 V1CdqtDpKZNgqeHKQl02NxNYjyYNyDALTML2IVSB1+ISNzXCveDyCpj6syBDRM4sQSLxDmPmhJF
 PC2oE/ez2Kjmq/AA2TmUPCZIO3Wm2qcdiLjc/kZcBYgwKjNHp89Ms+lYRWzqdZNW4Hgj2dYiZug
 B8l7OKZzfxqQeFSKB6HNdkN+miXw41NCt3pj8DrdamKafAIYnzdQ7ikc3titGr/Dgh8mOdV2px5
 f7YUi0+KMs0H9QxxObrwLSAMmxbwwYTfNXdKjr3bi9dej8SWxAeVqHx5Mzyy1A4c49yvBpqrK5M
 S2BifzdKNFOgZsoTp1kVhJ9mesOztNxEull8sMRqtooEs74s0FMHxuJIsL/OXf45rC/eyA5qPW4
 jLICKcPkSpkZ2URCgEAkQEuM1r5JCBSanZJAIViOnEeRYbXbjoZGck7kOoZ4iyeaab0wd1bvvEy
 n9vvGr80bAsuhRcwB+Q==
X-Proofpoint-GUID: HlSIFxSY95RJKcbSHxJyQlr4ViXDgbrn
X-Proofpoint-ORIG-GUID: HlSIFxSY95RJKcbSHxJyQlr4ViXDgbrn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010125

On 9/1/26 11:48 AM, Abhishek Thomas Varghese wrote:
> Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
> panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.
> 
> The overlay describes the display controller, panel, touch
> controller, power supplies, and backlight. Disable the ADV7511
> bridge to avoid a conflicting device on DSI virtual channel 0.
> 
> Display output, touch input, backlight control, and concurrent
> DisplayPort operation have been tested.
> 
> Signed-off-by: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

