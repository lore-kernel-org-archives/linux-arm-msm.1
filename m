Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620162;
	b=m+0Via1Og2MLjhxQ3vVZEyGpQqU6S/AWmwjpFVoch9qoer3epZYPK9krI8YElZaQK8sE
	 Ovq5Zj3y7wZYKuQn5Cf1AMCUuLlem3cvVgKA7lVaU9wfg3b+y8jt5i7BrBVlQJDczE8e6
	 8JLxgTidb8njdeKGKhY3LARNt4fgvgTMQWJx1DJdME72pWnugt+2RKGaiKbcNdS6cSRKi
	 f8JQQg7kqobDnL1hLT0mV1q9KcBm3kGUtXp1C+ETk5cwZ0l/cnovusDcceK7P5o6PieJ8
	 7A8mGSzzpAabhNDtoMMz/B7oLTBTLk6aegHP2/prF+V4PhXwYEZDOKsWu969LyXEXKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=;
	b=xsLzxgjWwOt2UniF2ko6wbOcqVSQgH2eVkOkQ7HfXgxitNV4K61w4+9sr5eWmV8X/KwQ
	 ofxTg8HTpxqxUsbSm3TAC6jowvTHSdRZH4M//sUv9CjXBqU2UkGT/2BDa0o4Ixsbr8GBq
	 CiLMtGHkdBpE0ZJbEdvNImIJ3agGocLFG4KFy/AgrBalohGF/ccs9wrkMmlmnrJxi4DQa
	 /IEg1Se03tlUewnQskEl9kjuhLsQsj//sLCiBy8PtI1lWqSdwE+CBsURRbVlQOAvy4hTc
	 JKJTtlCyEZDc3GvU1v0oiExDiaKodH09l7Md9TqQHZueRA1fe/R2u+KpXdhqIicM0yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofHmSgH9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EMGQCps4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4133C60A2603
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4133C60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofHmSgH9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EMGQCps4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMln1821203
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=; b=ofHmSgH9FKVoN6FP
	EZvtNVxIU+jc/kRrs1G26S5RN6Why14/9JolC2Eor5INtH3BV/IbexYikxiRnU0Y
	NBSn3RfePJCK0O8GLANKGocGJGWunwRYbna3uGmmQ2q/wtd/f7PGkOAM2+9F2frW
	of3Wu2rGREhEFuK+xehUq/u0NvHbwEaqN2GG6hrC9HY0Oe+SV9+kIzIWrU+onxiI
	xuC9P2/Ei6M2W6CEl6i2wfwgLIqMF0KyWH5Af1h7oFcaD7KhYCdedKfb0Iq+b6uf
	Gyt6a1sTqqhZ1qUadaKuk7yKlDHZIcIsLNBeOddysolN07KN2+GxL4lw5seOGw7O
	xvV9iw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hgfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:49:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91bf35c4c78so6645946d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620161; x=1794224961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=;
        b=EMGQCps4+V0AvtIepAIqRz8Gzl6IMS4OHCucVm3muiSRulqy3xuxgbkPOJLETlMhdN
         D+23jpseR9iedabOPaanAKZMpSpIIyMA6EUcTrIIZGOvTJGbt+cwT2gRwx30AUJqXzjI
         p5iKy8a/irxO6dBEiYPaVAOmPp6zjwlE5EktIIjY+/s8WEpF9bW6UARHJaEv8vony2Hr
         1jRrIxrckem5rCeuyV+N1TzEBbw9SqUgMxLoeeAfIDtGfOtMCzEu/op4SkRQ8hpz6o89
         0nHBiKckE5tTUWzkk9ERqjysAueZkv4AQSPUb01XqdEhJVcsIt72JZ5YA3pjrpqqU/79
         br4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620161; x=1794224961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=;
        b=FLSXGkcsUDZo6gn0kZG1YaQfL+5fagyzqAz8sYaYMTt4oF+Y9F1jOqunL/0u4Z+/LG
         wzMwGQQClbZz9RY9NL7F6N8QjFa1TCXs3Mvp1wKYsYzyrAaqEcvmqw4xcVGspPvFkUiv
         2dx1aNygKXJ12LUgmi8oJyT6xdfDSYOdMQaCe32b6B+i0gRV2lstWkUB/33InyxhJ4A2
         RYqQgP2oinEOxp84xGK5CoPzKk6F51wFVyoMFCy+mTdRGRlGANYX/JdltGtY0XuKKmsl
         DgDjXbacWfRqd2kZjl9E4M1JQ+eIg1WkcEkmJ0wkHpRm2RifKiiqwrPXvnlKLsCnm9c7
         qGXA==
X-Forwarded-Encrypted: i=1; AKwUvBwLEP+Nj/2oRZn82q1PqnEpLhmjQATxOaf9umxX9eC6XdCweJc5kVoB13BJcf6yauF5nTOpdnQOPgPBRHMz@vger.kernel.org
X-Gm-Message-State: AFq9FYLT9z1qK7VrIMVezHWzRoYlI/HJesAR4piymFfCQ1cHRYRpYBdk
	rWTwvMiClXdAwBd5tckFtMk1E6EAQwSSt2peDZnhDHF5oBGXvoYo7AnH6e/xFT2SFMjb2cUZXH9
	/I1kcsaiV4tKjwavssb4VJNw6YOBbZ0oslCPaGi3VehNaCuqinNWLgA/pVh0vXd0CjlbY
X-Gm-Gg: AYBFou02gecTadbtXIUgHsVcv4GkYuWDQ8QmsZfXbqRtxqV7FIJt91r0Iz7OXFTnLj+
	JqZMdpoFQmYmcdmUCyilOkWyS8Dy8GdXQOiJgbGcd4QudKQd7smlZH5SjfJDutoEYIWw6SW6atI
	ScqA4OCQlqowOKpZlK+6aWx4qdd51qMoX/Wbrj6LrtBUo7WsEZm2q/sKW48jaYFNWaGVtpmZspy
	q1L5J8mXP9BikgXBP+G/0JvSSsobWMmKbHLnXtORg/jA8dfXhEcwV4y6V65zEe4ud41QcGJAZOh
	YjnHqrtJEdRR8ETlN8wYBmZg5zJOqpfhVOKnN3Qu+eAbfIv2bQIPrM+d9HYhvxokEnGOD8Dxquj
	t8PyGUXkwY4dqeSg8ydUiq3wuMEifQqOjXR9TZkNqsT9AoZIVDjpnjhqbVAx6mtQR5jS7EbU=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1795218685a.3.1793620160671;
        Mon, 02 Nov 2026 03:49:20 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1795215085a.3.1793620160155;
        Mon, 02 Nov 2026 03:49:20 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm3301742a12.26.2026.11.02.03.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:49:17 -0800 (PST)
Message-ID: <d6126285-97b7-4424-a644-23828d58cd82@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:49:14 +0100
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
Subject: Re: [PATCH 3/5] dt-bindings: display/msm: Add SM7250 MDSS
To: Krzysztof Kozlowski <krzk@kernel.org>, Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-3-159f403ec405@brar.si>
 <20261102-wandering-peach-lemur-0c57fc@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-wandering-peach-lemur-0c57fc@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DY4adW0BTuqjLZlTZODigV7UyP4I5BBB
X-Proofpoint-GUID: DY4adW0BTuqjLZlTZODigV7UyP4I5BBB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX68+WdpoSmd9s
 zZAd7m2krNPP6TdxX7Huh2s6HUEGPfB2dTYl9bJxXauv1wIlG241LocRq8robcKLusMXW4Mgtld
 cw6HHDIHigfh0ChSmRzMHdfF7l2Xsgg=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae878c1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ujgWmTuqKpTCez_IP1MA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX9YCSCNXWmfzp
 ak+QkQXV4ROGneJCGOhCq+eYm+l2KJR8xcix9MQHalRtKpN+MG51Nr78yoinalZoHRargSpafH+
 rXklgDqW3f64JChnug3VZv5rzz6Vj6DJqWfLXnFbYlIF4Vk+DmTfmaYrxtIDwSLIJQnu8q/15Sw
 KkO/YvD6Z/z16wGvH2rX/rQFuLtNItuAp8It0U+dsZjmwdJNyWimYkY1V8qKkP8kXrtZTP65EBr
 QVFGKfavKnKoQjJ/eLBpVJI/kuExQiQoaoFUgZ+N8zxpqelZ9EYn+kGOCAmD2q/Fla/dD82gBql
 ADT7Zj4kRzDrLEaZXT+StMpdm8ho+nBQFiJ0HY+t9CgSqPgSdqSnSUbKK9OLerYlKP/OXwxmUzI
 WjKkaPRViEAwj69PWy53WA6OLxC1NSguL+ggKsZrc2pzwVi5mjY+6GHA+9nmrEPYx8jUgfjdem4
 EGPKnk01Tt99lXTm5xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

On 11/2/26 12:35 PM, Krzysztof Kozlowski wrote:
> On Sat, Oct 31, 2026 at 01:23:39PM +0530, Ishu Brar wrote:
>> Add the binding for the SM7250 Mobile Display Subsystem. It has the
>> same clocks and children as the SM8250 one, so it is modeled on
>> qcom,sm8250-mdss.yaml. The example uses the SM8250 clock and
> 
> No DisplayPort?

FWIW This SoC has a single DP controller

Konrad
