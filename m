Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080416;
	b=qRN7WywTqqgWn0ehyzmnMoaouSKxtVdMoWuFBd7luVK4Dt7b+AYuzNreW8w0OZLBO2w5
	 8Qq0FuYPt/VjP47+WRv6EEaKO9CVVp04Si1FrlexkwXpx4Wr7DevOVVj45yiuV2BHPmAH
	 KbevPUGqWqMuHq2p2oqOzXcWaydqLXOy3WWJLsuqx/PJM0hiNSHZgNQaLD6sPyMW6NibJ
	 /iiADkpm8fAjuR98EnAgLt30JHLvmJA0Iw2+nVxLVawrvnXGfQ4CtlWpEBJsp21d6ceRi
	 hdOnj9wYRxinkl0i8hs9YidHCkeyjR8XGs5lwoqJrlNiWxCKKMHrCj+2aP8GX4bHqFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
	b=ZCkrg9MTzb8jfyeVkORpFAjgJRKtiliB8Ys7UL3TrguM97VYss7ngBFUATHHpbydXGFm
	 sBFCO6hnxKqsVHhNo+nFYQkuvcbLb87dC1QOtHxq86+2Wh70cm19ecg8EVGP98bVwJ3ck
	 vF240Zkg3NH4I8pjSWwcOrucSSaa9xF3CBl8pRnoaRO3IlBVS1/OJIjAzjNMIi67TX2ZP
	 /BgrwUehHfI6Yr2Yzxl3IH0zTjxvJyYZzkJl64YeRsN+bvzxLvXN5VUf6KRjT5wzb5UGa
	 gbELhD2yxyQX3yJltefW+yXGyMJMTexjwp7/iBOFRbHvvgnomXKFmA5Kk2hLX5keK2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyqEmaCh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9aR+rRl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92179606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92179606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyqEmaCh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9aR+rRl
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YwJ6752083
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=; b=cyqEmaCh0aOI+N1/
	/pDcGlpWVdVeutex5VKS0y+znfue/nj9pQumOoDLWWOpn4DWYxPphMJqiROi+q5f
	9cZxyzwI3+gyBKsSpmp88LxvU1430K0LkZxKH+f+zJFu8PBNtk7agDYKvH1cL9io
	UIOz0XgCq75I3jaqE3nUjp3qV5afxAPdZZ7zqK5Rwf6ld0ZxQlsrgvTmiiQ7Bslc
	ec1vH5+SjCBzwsKg6+wxjTmBue2619fAngECyLoA2wzUUDAAEYyYNWlcVQQ+NyQw
	BS7PUuVMteEVWT1huXXaKQbbFdTTSkCFpxk1nvrqtpZzWawHu3yDFlYFhSR0KvzH
	6uVdyA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmma4hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:53:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so10692911eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 22:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080414; x=1793685214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
        b=j9aR+rRl8ciTvZ6BUIFowHccSHx5BDIK4rrKvqRztP7GtikmIOmrvfrhOiJ5AYeyhG
         icMX1/zjzwAlxXwoJ4NQeX8Utey1xc5GGvgehwaMAfe8WKoPmUl03KkkStsBIA9rtXEw
         zfloCEPou4LvauktiHTJooQKbs/+nBP2FP4fvpE1Xza+PoXduY6CZXigvufhUCupTVG+
         civfT2G5A8PwUdR1W27nmGUV1Zg962yebo1Yqeaaboj28CoPf19zVkC59w1WONu0QuvS
         vc+9dWcF2BQrDoWRgtAuK+Jh7aoxHvAGZjtt5EDlDnckDgmIEYA753CH2a54oIRkZbAq
         mzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080414; x=1793685214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
        b=lsQ8xxHmDiG+YCWx8604pkH1mOHLQ9QLdaoLflC1ufP2/RE4BFrb564nLX4R4FTAPv
         FA18krS36vJRRPjtZmP/qFZKGNcWpUVuxVKKZ7d9StqjFW3Ln5O87eyO3T6kF6p3qMrr
         lYR8Xo3mh8xoyrSfKfm9LqKzLagnpRZ9BSfVzOPDHx6k94ZHA7nJz2wjeGRjaB6bkmhS
         1g/W3aN7cnHLWY0KzqNwY1qgZ5Y9ver5TIeu0ZqsbKWK1q78++1yhiuil24XbCxGww13
         Pr33NeGIbTMed2RttjZCUwTUuW+IOQmCK4acSZdhYVWj69BtKX6ZDcTvtObYJz0lW2KG
         qg8A==
X-Forwarded-Encrypted: i=1; AKwUvBwstBauNnCgygV80skQccTjPp4sMRW9I7B/vEofLgcIDVGQkHdbalpEqHxXRuPgE9pkwwDcJHiNJPHhDhIB@vger.kernel.org
X-Gm-Message-State: AFq9FYKTh4q+eH0GtBTJcj8R/1xJDM/e/uI9Gs3pyeFedTLZQ5F6JdWF
	zritwClqtarwoKfMvnPlauQwJ45RXSt5/joHc8UnF9czTkeV8dYIun9ub1NEYp5oexemyWP9COa
	9CHnlYldDcyd1KjRV1xcNyLhKPgAUBGhMZvj92iR88PFKZNNSrF3HIZM7v0jBDbX/9oxl
X-Gm-Gg: AYBFou2iuWGkyP04O3Gt8hSCZSA+XbrIlfOZJojlbc8VMI59hz8jYRlmjoMa/ticDhy
	lELaxu6AY28wUUvHLzSWvgy9OGhS9AIuKlrm1rr/G/rFdpV+Lj1GkbHNzTY5cSB4BbgP0WxQ0IB
	+vSFE4po8xc+1QVUM1OYDKyZgNqad9RxcS3DXIxVzu8Fa6DBdEMlqJmHqeF5P+GeUqTpHf7A1y3
	P16tpc11a4BIeOzEqSnoam2L+6DEDNsKww6yLPlZLJhinfXSM+9ESjp6X2L+iWk/+zSzhZH+GPC
	fywFU7JsIvUPNMAqAJclX8HNyqCFVM+zJSDap7VRm4e4kbU3LC7ghCmI6h4OCiYTCErkHOXSh8f
	x0QzJrfgjbp0tSajlG282VPHKlH1ECvRMA+5plptyfVoVRngB3JGnRVHC8bSa2zB57wghsCRJiK
	8=
X-Received: by 2002:a05:7301:514a:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-369e842b597mr12692366eec.9.1793080413970;
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
X-Received: by 2002:a05:7301:514a:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-369e842b597mr12692344eec.9.1793080413423;
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d8a690sm30226262eec.12.2026.10.26.22.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
Message-ID: <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:23:25 +0530
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
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMyBTYWx0ZWRfXwRVWC4uHQFt7
 oK1rQUw/+fr2Bjx8Tc0ql4NfwxKhVNqgWxFjKdOpb6yLUGVcvxmNBjKuyS11T2z3OYD0gcYg82r
 PFmCVWd3rMUxmNBYLr60rmem6EYhuFo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMyBTYWx0ZWRfXw3/eibCwrkgv
 v+whlz/VpUoGsZPbUXGJhbY94O7+TywOJluJTNxmg+cL9GqNfO9/2WNcHJUdDYWZ/+NMq6r5+IA
 7Qx3XbKXrVY6IIu14eK30jKemyumzHiTgY0QRtYD+VWFJf8htzcM3QtqRvn4oiXP22Nx3hGvxcu
 dSm0WlvR7CxbklHolYWLB08pmE8zqFj9txA242w6MLm359D8bQSq0aY8Zh+g2EC4fCXJSyNuPDZ
 P8s70JMB1VkR4h+tM7zJq5AZ2EI+SbXGhVCmMh7qZPI5pusKdm8NO4u27Ey99LL8eFw6GQsmtoz
 cWWQr959JOwNzoDQad1Z7ZnAFpPV4RaPDc++jYPTlGMEX1wcT8jSnPTDHCOUdSkd8+few7D6yOl
 4+ROhCgJYdmEiyT8D3+WqU/2GGyA4qSkafR93n+WZrZ/EXBj1bg/G++uUkA6Kp+GtiXrDZuSLzc
 wbDDQBKUAxGnD7D2FlA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae03c5e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UnRI9tf91rfGD_JGq8UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: VrGGYZ9cnLc0pJfDibB_dq3_Qhjkrfrh
X-Proofpoint-GUID: VrGGYZ9cnLc0pJfDibB_dq3_Qhjkrfrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270023

On 20-10-2026 18:30, Abel Vesa wrote:
> On 26-10-15 15:25:22, Sneh Mankad wrote:
>> To make the MPM design more logical and avoid probe dependencies, the RPM
>> notification is managed by registering for CPU_PM notifications.
>>
>> Remove #power-domain-cells property from MPM device.
> 
> Can you elaborate a bit on how the two phrases above are related?

The MPM driver now supports two ways to handle sending the RPM notification,
either in the genPD's power_off callback as power domain provider, or within
the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
driver to follow the latter path, which as explained in cover letter would
help avoid probe dependencies.

Thanks,
Sneh

