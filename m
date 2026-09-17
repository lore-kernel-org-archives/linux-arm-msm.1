Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFF74B1CFC
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638844; cv=none; b=rCXhERP7BJ9hEEBoSkbHcQ/6B79grZfPPARPBPvSytYAGp5gJ9q/QoGQNJHUuFJT4VJW3sG/sjTrHRWxMxT6NtFh5c/q+ZEmd2EK/Qp5xmaEjxP71IAh4PuidSTaMMi/8egEuqijZVJM/R2fwXuS8bt6aDacnXlYJ2pDvjQbpJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638844; c=relaxed/simple;
	bh=Cve130myEL9inyJHbquCFXzlJXeFLlPCSP2ZaBXKxNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwvjuVLX9Q+vylAWMfsCQXvzUdl3ZZ2dU3Zn9aBFY31hagydMV+iOI8Ut47rdlWhO9UqbTip0fdSgZzrDY16pJwKMG4ESMC3EbN29mq8RWwKMPZTs2tHLZrHTSSRnglp5djRY7PA7G37TPzBovtluKSp1ZtTjDmwJbXabKImt/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejIHOTYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCHGC3W+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejIHOTYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCHGC3W+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZsNb4186762
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7idV/SmHuaFlrgRp6yA6OaUWlWvXCzc//paIK5S5A8=; b=ejIHOTYXd+7K/NKL
	fmqCwe0oAAkmWpSrf1jb+S9hKpG/SVZYu3Rc5ZJdbURb71uvDdLtk3ZYHf90bL9b
	EJoLe2RkjC1DcT3lKSWJUZ0W+WawpExtxQi9yZQMQPrzaonEkbkAJBp5byR6m7nb
	ePfzvRaGN0An3EEJl/4365aruYCgb0BftO5i23kjrw0oZfUyCpp4dI5JssvBd31E
	jG6daaGGnuPHV/TuiOzt2rvQNUed5dZLk/cmUJQ4N3fYk06yxh6MuSDxeTHd+h8T
	yc7A6bP+X9J3V0IQY5vj/5/9VpqPgz+dMaEZcKN8cblAx20YhqMf/dxY0jRvfcyl
	tGc6cA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc9j4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:53:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939fc317691so18796785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638826; x=1790243626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7idV/SmHuaFlrgRp6yA6OaUWlWvXCzc//paIK5S5A8=;
        b=VCHGC3W+SHpUaE0QU6E+1D9Apqkn3JFrCI/5Skh/B0vT0sY5Hgq/2UKzPD/MkqzI/G
         jeSoCtLZUzZQlXQkhQea5Xo8MXr/sFxbV6p+dlTGyEWVeK2DoItJNArpmdbAmPCiSr2D
         Dcx7CfinEAC6/seCzBlrGBc8uWOQDdMf+MR0qFDV+mUYM9KnumDDe9RSBSxIruhcBEHg
         RspsoIRx/1EVXCnpIGLR2tBcaigWynjvcNb4tI++lcMtu8qyDP3mpqmt/BeflYq65xr6
         UFlw6qtTe/Ja341K9QlNwQvoqO5LOtmcd/n/Xp8v9zHafM1LEZOxRNkYqsJNmkMfCPOg
         RmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638826; x=1790243626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7idV/SmHuaFlrgRp6yA6OaUWlWvXCzc//paIK5S5A8=;
        b=q0Qcgn0QNRAiyZq0m45dEBZvZ4w/3/g82NzxDJjlPb3cDsZiEE+R4c+0TLf5yGQfCk
         6BT7k0T7xnW/G8gVHq9t/EUhgcHmMxxniFvR9a4DXNIUasMU/zjTm6/1VApn7uVujy5r
         f5N40x166a+Oa0ZQyaCPYnlRyftwxX9lMa3ismr1Grw3lQbOrXCR3KrlgasycwFmLFPH
         SRxToBeHDgdJGz4oF0qJe/Vo5hrvODzoi8xf5blphO2wEdFNtx6klPg8JENyWZU3UDIs
         oCELsuAvoVMY7U0Dl4+pbk4CJcQ+RGHbek3N+k1oMJAKn1vvUxyMrWiniYQqxxzCqfZi
         j9pQ==
X-Forwarded-Encrypted: i=1; AKwUvBxryXNR3bnuh6ORPpcBf5hGzCvKsfkH784Ow/yHCGG+AQ9SypMIdjWZioBxLrY40+vqkeHkvisQ101rk9EC@vger.kernel.org
X-Gm-Message-State: AFuF++mu5D29j2JWGf2vc9vj0n8QpvxRhc95HR6UpodBRhYWPbkLfaQn
	N0uamdgbJYbbANRkeiyxE1uY8XbRGgJ8C9zEv3j0+mf84F3dPqz3wMuyVOxmZoz1n6QMbBrk4i5
	fOrtsPoAeIweqv3/+RdYZHi/xTlb3M+fC4IY5JqxijveQVI6z1jSwwDn3mNpAo+gXIfgs
X-Gm-Gg: AYBFou3hLw6LJsUqWBOghGQ9bSr2HhSK+nd6QTUheCVZUtEhQg1EIEqiwcoH7fjMvKX
	z6xWn+1qM8efJZMssEjU3L8SN2y9himIvyQ8lyjwUmoba8EZFfSsh5U1T4+lQu5LTTDX/tyRuD9
	qkQxORiaiZguAX/i3JgXvLbLcsQK+HaBVziMvnP4VFBc6ZPXnqnNfn651sUsI6lFQSKmVgUyt6p
	kdY5jxA9Q2Xp5UIPhxXna+eVkIN7OonI6vO5VfWD14vazfycqj0Azg7ygEkOixe07yCE3vexkM1
	eQjCRCKomNrc7+Rw4rWZ3I4quYouvbL5l+U9GYk/pp66w5Ex7L70UptdQnU444/rvgvBMVoTy4r
	g9ic+bGBQX3Q5PuyKNrZ84w==
X-Received: by 2002:a05:6214:508e:b0:912:3128:bbef with SMTP id 6a1803df08f44-9124ff4e920mr3296166d6.0.1789638826424;
        Thu, 17 Sep 2026 02:53:46 -0700 (PDT)
X-Received: by 2002:a05:6214:508e:b0:912:3128:bbef with SMTP id 6a1803df08f44-9124ff4e920mr3295926d6.0.1789638826034;
        Thu, 17 Sep 2026 02:53:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de602065sm254533866b.47.2026.09.17.02.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:53:45 -0700 (PDT)
Message-ID: <d8ae41d9-2312-4232-ab60-2f061ac5fdeb@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260917-pixel3-camera-v10-0-df631279b39d@ixit.cz>
 <20260917-pixel3-camera-v10-1-df631279b39d@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-pixel3-camera-v10-1-df631279b39d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX8LnnDrRyTXC4
 I/mrh/FxAIHY36/S2pqfT8TfX4kspKjUGlqHq1prR9TEiUjALp9AZbk8B+8svo7NyP4odB2LoAp
 FWv9uH9WwnLXyozFDqnwTZRTcmvDLBcbwbkExGGy30UZXq7zaVLVKPJUzOiMQRGr2KBWccYADTE
 PfRp337hjkmRK0mnWhJNV+US7XTNplgtx/SfLyvj81lrF4INkaV/4H9BdZfL9oWoiMJ1+saA0e8
 sYTpb/kSyFQKfj63qLzRwxYfEDPAYmwZqfMvVZkzetgBERz+teXkha7Gv5PXguAmpMcGwqH96wy
 IsuKo8F5n71MoxwZuspEiGWvMQOTh/XHG8fikAneTQAEHyC2tVEAQqB6ESAw5zSQJjVYKZwcsjC
 oHHsMN1s6k89tp60FncPGZWxQHT4AIoAm3ktWHphpDVNBUQpbHt3rn6Id+FkNt5PBSNylR5RA3X
 02bi+gLGchcIi4IOGYw==
X-Proofpoint-GUID: 3GVX7werU5NWLmwHVwGUavFFT-n0KM9l
X-Proofpoint-ORIG-GUID: 3GVX7werU5NWLmwHVwGUavFFT-n0KM9l
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabb8ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfXyJ/PuFYdeZBV
 I6lqFvh70brLcuo+TMgYvHdkLrrQXOEjDQttoluXC7SMvCba5JiTDzv2Hb6CGC7IYDku2xaQ9o1
 qQigpu/s3bPCtrN8/CWyFP+c4UnZqfY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170135

On 9/17/26 11:46 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
