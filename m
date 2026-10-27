Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102512;
	b=JRqb+c7udWif/31CxiqrrFm3G9GxpfXucAitrURLu2iqcaWam5j5sYqSFx8CeMW6EKxJ
	 Y+gipAf/6amm9WbHnZ5vd25pL7ImoPVif4DTcjMbCWOKtQ53I4fMY7UhKnlqtTo4WQ2N0
	 webB1TC8s6bTzTiHXbDUxEKN3spma7TB5wQzkSjMJYGNZaXwbW4M5i/BHTyAOOSSHQKkx
	 qqNWraUj+b5K87wOtZE8Snx8xM6xrd+6dfcKRS/FT8sWwHbSdwQB8S0UBZ3mw8LzKVhPI
	 SDj01HTraG1+T0cmQl/xLpu4O+9kNPcl7fb/jk1XO8zs8+5q+c5Ex7iO2S3pbDGLJ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102512;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=;
	b=5CItuV9fK6T+ziTjI0+WdhnlPhErxPsC8D90nKJoMF9SWufHFtsJ8EgSxeaPNU9A9gHk
	 XCADFE6XRx6KwRPLMmBz90g2CnEZRXp8+7uW/TUFrwgXGKwb53WSv+nwu8/Z4TOty47Q9
	 Kb4Nro+9yGpsoDfha2WlSVZ/3UnV0pE0FbRqanfBdS5WD1azP4jVyPQBg0MZjCQjAoy/7
	 wt1mTn2Tn0AjoR5ZrhvSCJ7+4w7XM0ypq7sJqTpIPKHKMJ5fx2Dv0awCvoIWFtowJ8cVq
	 LEtY8+RCfBkVYEsiC11n3xIrO3MVnWi0KddfYFKaxpw0qKXULgA5XfYbpt1HnrpQVWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuCwDgS3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDJ4SZQP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC9360A5BE7
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC9360A5BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuCwDgS3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDJ4SZQP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsJT1973257
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=; b=fuCwDgS3MX4ohcug
	9wXn6nsWRS1Qh/HY5RtkDsdEQ7ZuXeQwR7MTEIEEkyuNqil2HNhFRsPCgd6gNP1E
	t79WD/wYrG4XP/cQpbi6IZ2wxrOSOauxfFdYWuELFNSpeMC2iwkCaJLM/piq+ogJ
	lRLH2kr84Hb73IFgB5J+ih6X10c3xU/Q6AwZzMmDdWXROcVe/OSuxCPWQbdpzRAA
	dwf2wlK//8cx8mDjYeVJvO0SpxBPG9k8Fp7HUr2HDuFn8vjiQrtpZ82qoStNsQWu
	pLL8IzXV7guE/B4e97dcDgEc98/T0gGz5O8TnK24Td+e2ozHuGvswILC9p2mq2Q7
	f3ntzQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1ge3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:51 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cba2460f8fso195392137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102510; x=1793707310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=;
        b=FDJ4SZQPdzZgh5XI9tLrj3JCmX4PBWhc5rqhoiAsIZzp6uQGdGZjzsK/XP826VOGRB
         Si8/sHusRS7izrqaQrDfRlSti4HlJ4zWqtqqDQayVL6pJm5pTvquk7Tr+cISN5zD4CS6
         rp3X/WwuU4c7N2d7bioWsSSe+lDVk7clZ6dnul6hVXAvHTZ4QCOE1Fr6hLbCDVaUJb1s
         Shw3xDZSLAuIkzmXheyjNuSzt7siHV9l61kx8Bod/2ePT8bmgoeXxeHBEbknN9FB3kv3
         SI9Dsn5L9JYdkGkkWLgJ/ewEU23do1qen3j2+eD/q2TAsphHWexdK724V9OvVaP1SA6i
         uuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102510; x=1793707310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=;
        b=bwfzLlHZCyS08xBH9DbArdcFJZX64BGbI8fl2zJcPd6eRuueFpQOnT0VwBemqs/HHb
         lmSPPCPOmMiYP8bFn5iJdz3GCw8bUV6d8ynoEeJy5SaCGUFI+bEEKYc67h6pu8HoAaXD
         Jkg1It7woeYpd6LNHydAqjsSF8sIafa3sp4n8YMF85vctWL8TAGTkYR2UVEv1EiPiBlf
         v1niIPhVj78vnm2HKr3MJyVHUC3IiJet9OdtXrTiQ5N9/GBxva1mo3D3Xyb1uG2GtIJH
         pRx/kwqArC5N+sRIgTUySQRk9zyalJCPfXukuGjkXlWhKlQS/s216p0Hlh7USGTIlEVo
         RkLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP4EXNEWdXJD0fqbmeCss8OC8kgiTinzhxMJsiVoRw5vpq81pumSIiOt6Lyu+Inc/lkhU9tz2GU+ECypMx@vger.kernel.org
X-Gm-Message-State: AFq9FYKLj8OTeRSgY8UCo7BPvzVdqMq1xXjra82AXhoymkWH08zcAJWY
	tc59w2eYf8KvrKIo9WGf3MiaMUWz4FokIoPKZT74epb2qeB4r5NstIa/nLGsbHXmLQ7m3o89mPk
	hxQrHL4tjNrzIxETPYo+7AwcHh+1bzGJEs6b2Bz8mltHZo1uJWlUSQi1PZ9q9kJTiEP8T
X-Gm-Gg: AYBFou1itPgHnhUaY26OSU//PN6yJdLdI9s1lqm50CrZHxow0EEd6KAgJ8fcArMhrVn
	LuKvW7tJKgazK5EqNESSD+WruVd52czoiIugmcUEcmzGgX9bzmPX6ChnU87yVvF8Fn6EcTkuh+U
	HXD9v5GXeyNkWi3SM3DurlhnqF15hbyKqtJGq3SUsuUC6xnLLkHQNDLoSv7IrtSvnHehsUCGI0o
	u0YlNfW9ovs72p1tbkkXZiptwYwgXpo64CyWVy9kiENu9N5QA0bridmFAVbRdf6Y9O8Y49KikBj
	sB1UqXMFlqNUfY7DteMdFK8IjmTQqE3f5SykCv5Zc/xPKEULvyg3rPtfJ1YwOfbgCzxr5kw9911
	s0oTXq5+bcdifACBVg4JFrw==
X-Received: by 2002:a05:6122:e006:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec232d4fe2mr3521991e0c.4.1793102510332;
        Tue, 27 Oct 2026 05:01:50 -0700 (PDT)
X-Received: by 2002:a05:6122:e006:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec232d4fe2mr3521917e0c.4.1793102509679;
        Tue, 27 Oct 2026 05:01:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89cesm445373366b.13.2026.10.27.05.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:01:48 -0700 (PDT)
Message-ID: <1dfd5e01-d701-4a59-9b10-062fd59e25bb@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:01:46 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: nord-rrd: Enable eDP0/1 display
 output
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae092af cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wx-G1DhjD7h3rq9mWzQA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: rLOXfZAtjhTwPt5KhTqD7Hs8V8oBGzGo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfXxiEjjp4EEoNH
 hlyCPoa9WH1Oa5wJK9BAuJ2WsjxH8owEzzSmpTvYikT57g5dXA4Y+ewZvtN5MIrCJbIQaB4YrBX
 N/utRlnfZILyst7pLMd3b9WOds2dHHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX37Lqiz5tCH1G
 S3yfdqDzXEwyXZM9miRMaWomJqjGer4rIdC2nanr15kcJf9Q1d+vsb8ebspbzbekI/DaACXFsLt
 mlTkXsEcOrjc8Onsp30/OCrpISyBXfjb1ONhwmkeTXFuHiXTmcHJSc9s8L0ZO0F07dXzru8uh3o
 75hEJ/9C/jZtD4HWAVu7ItwJMW//SXHQIyowPzuMtAF8rlhPh5sXNOsg4i14+MXk0yM7aIZUttB
 T0sRuRNp4O8SA2SAIaU4Hw4ACzL4+vBAzhM+LE4GPAvMIEtBaqIkQ1Lu6uXyq6dxtUp5Ibyzjtp
 oaMsSA2vfVNLtfJCbsJklt0KB8/grFGanHwf2tO618ELYXCdy7vQsOusl1ZzXEjg1VS5vEhS67n
 UY/sYItZzS70OdH6RwihDZOyPBcKpLiVCl9c0BUKouzmrKnmlXhGHxIt1jh0oE8o0Yv2DHcBocl
 V4uGh8Tvl7cFgyt6fGw==
X-Proofpoint-GUID: rLOXfZAtjhTwPt5KhTqD7Hs8V8oBGzGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
> board and describe the eDP0/1 connector, its 4 data lanes and supported
> link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
