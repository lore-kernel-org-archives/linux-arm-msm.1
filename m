Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291111;
	b=tf/TpsgxgIC7dQHZSHfeV1XUfn7rF4xp7mXErCK0GC03UqwUqfmKdqVLrP72UWsSaKl4
	 b1cGszX9TIV2AqtrJT8D48E9tWJB2F6Naq9g14ITHwnQ7Dv5EwZSmIzLStgxuEIZprvkS
	 WIDJ21OiJHCpcAJh2OcWZ6aovvyd32aBfeueTe4IpNdi2VjGwh+H/QrbZRztkdMerbL6g
	 ecDOeXUi8sEVD4TEP2nVRNZSnhlEf7wgzA0dbg6z/RK6AYJsZjy/CF6JyF6p4gYA34RrK
	 E3NLHpbH0+2ClGOBoIGsxg7h4UkBuBPRI87NOPjWEU7g+kP9D03a52Q7iyZ6XsIk6/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=;
	b=VEJCErssAVhClSI0m+h5Z31OvnybF+SMJjQ3gcAO0h1GDy/Cj7C9HuTyHMa2PjhQGvF7
	 hqGLeW9gSyh9DArOvI8eteFDShITBIPb2mJRQ5Bu6Hjh2qjDt/lLANVB8s3CpP+Sb+MCe
	 HN5doS9/2ADxk8TpvCWEApUqTgK5iW7F3wBt0NM11QK3EiPz2IdQP08vnvt0Gxp7/jclP
	 TI0hD7XCpRjTaobhdNqCLL4uapsHAb4yDAebo6VoJiyyQAP6DMbUqh1Ay0uE9AfIYN8nP
	 8c9VvQr/Z4pN64zKtj/YCVou6Abv0ZhfjxvKhO5ih44WEKbAPnHAHfS5GoQrZowGO+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsZMex3M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RRG/BEGD";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE221606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE221606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsZMex3M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RRG/BEGD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGCxX43872930
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=; b=SsZMex3Mdtdel1lm
	rp7ABocgH78LHOS6rFNUdjwO8e0GHQbap18dU8eE1iWCTTyNNUUZpceerclrFupD
	UnVz5Er4GHVCg1xMWaK9RvUJYpXxcgVXErPqnV30Sh6w0YJwRKX96tx3AnmttYJL
	vai1q7sOz0ak4J57dq4yj4N/ifyAJNAmUThENFlnh0XNaTVVPXAWGW36S6U7CjnX
	ZdjoFhJY4IPiYqyS1wQlky1tSqIuDBMfzaW5FQI54S7Y/AH5w9RM0RXSyzTF4nwV
	y7kRJ2QNqbo1Juwl4PMkvIDFnYE80USRoZYGg4kh+dI8eB9FljFYI0L0YSYImsA8
	hTSJzQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm7620tkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:25:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf586522d4so1472280137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793291109; x=1793895909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=;
        b=RRG/BEGDdeGvb5XVgKca3oIreRlRwTNqw1U75TuMyjEudtz2Nx+6f1qV3ccIRIjFQy
         HBNFB3Qc6YalX+TPnm2X8uVhwjxTOS4Dcrwq6VvtnAg+Ydg9m8I7HxluwCrwmraEGE6m
         ltAjWeb2nZzQA7eYitlY13OCMmeVynaGPnObBcIVaH8OaRwRcaomRq8oZ57W+Z5a0VNp
         E3n4OgpoqqBoqMvybeGC3Vf2ld3PpynWMNgu05la22UT52UDXQCazcPS33Lpy1VLWp11
         pzqs1/o5pfVc1sLsz2qyKNZth895Qvl74oJ++RAyoHySI2QSoao/xfOXqsfDgAdIxWJe
         22Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291109; x=1793895909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=;
        b=ZR/jscZhR9yB4JNeKK/VVYn26vU/EwfwXqIpc38PoPcIWTBDgDKt8QQ3frZF9J25Q8
         tpLB4IaXicoMzG25Lx616k6VYNOxIkm6XzX0cz5PN8BsZadqds2SD63Pwh5MS2fSNA9E
         eUlFFuARiWdNh2CI6195NaqTEBFg2EReNADensRhjjCss1qVw+T6euqotgk2/GEPx6jP
         gAbidJz+4+n8V7rFmrckBdYjkHv3/nLu9wqr+Kf9c2MYkRo0oTdtMTNzbXie/1TV8YQo
         7iYRn2oMtY9/iBSzzrIYbiJgi83c4CozwVXZ2fWfcucKh8XM7MWMZiNqT/uohS2sWHTG
         47pg==
X-Forwarded-Encrypted: i=1; AKwUvBxNXKnj5u0HutjSxn5kQhBUvdNU99FoRTN8FPKfH2kU7oGg3TiGzeLSruI3G81TU2IQMuU1n5wyNESAMlM7@vger.kernel.org
X-Gm-Message-State: AFq9FYKzx59ZFsBDXTDuK9XCbd8Ed1wQxXVULL66pjjpaPMpxz6gYt/g
	+iQ8xa0H/Ojl6nOUt5NFF4WrokbpmZeX2fYWjPtWRlnXhft1hSlx9osWpUQORW4T4zlbFaENwN5
	73Ox8xYHpTdye3oRI1IvQYrNReEpI/p0K2hZ8s4BQAOq2CXpwhdsPKFAhIoF83KF106WU
X-Gm-Gg: AYBFou05Avc6brpFUt3A9gtHvF6LBMZ1TwS4Nix1oT02oKMjktUUIEzU5hczsmnNlq6
	9PE7H/8ri5cfd3LsiJvd0PdzJgZU2/JeBR2N13ew1GIkPUmxzRRsenGHQ1tHKK/wg2ef8U72f0s
	spHt+iHnfEjU+FkT/20PrzoZe0w1SWGcFbw4bZ80u4qhn3hASOaTjJcYPgyI+GEfQRpr7G5wFh4
	zGqN/Yn5qAoaowVm/8y36JGCzX/VUnJOnCZ9loSwkWsSBZ5Ih2vbZIQpAdpk42wCDo1yHXhOVSw
	/q2lsgv1jqCkzdZIVoIe3IK9tR60+r6cJW/OhrbMOPctKSBX/2EyX1OtxN4N7EmuZ4KXBoUNTN/
	XJTk/I5AMRx5BynLTwg6PH2Kdk0ob5SvAOREpRLIDlIvJtdOHCjEuveEf8xX6J5CxcZAVjMjsoZ
	T/kM9ueSA8szIi
X-Received: by 2002:a05:6102:448f:b0:7cb:bb33:8413 with SMTP id ada2fe7eead31-7d03a417ec3mr3095926137.9.1793291108727;
        Thu, 29 Oct 2026 09:25:08 -0700 (PDT)
X-Received: by 2002:a05:6102:448f:b0:7cb:bb33:8413 with SMTP id ada2fe7eead31-7d03a417ec3mr3095908137.9.1793291108222;
        Thu, 29 Oct 2026 09:25:08 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df9625bsm163829f8f.26.2026.10.29.09.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:25:07 -0700 (PDT)
Message-ID: <ada94208-4a90-4e3a-9d9c-1ecc87b53d6a@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 18:25:05 +0200
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
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
 <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
 <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
 <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -DOnHqOnuhQnXfVK4Gmi6X_NnvOsgwxQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX5/Gjt3U3HMuD
 uZeUyU3V4yvl3ooaIsz3e+Y8V4FWgqwZS04e5JtmhNrUpAi9YTsCo5a2xvgKGqft/Vw+YczjlhJ
 ggtx+nYngEQJ0ntr0C6V1It3DKGahEzCZazqAZ964c5g8VJo5AvHOCZsxd9YBd9NGWhPNnXJ/QJ
 ofvABDfOjIACBMCd0/lMR1eH2eooBTNZT529BNlugNZEOyNWv68z+cLtzICzLDUAjtXdqvLV9uV
 r7U8rwGg4oSGP4V71/m5klzs7PRnjakAOHTTZSytLgUgwiPn+BJrkscaM0sdnb3VoUG9BTF1AE4
 3EAdOBPz6o9THWHitnMW/2P5Jw3/J/JhM/zahBOhYEqCYgsU3ov/AJhH7jAiXrA2kiN4SPeHIv8
 C8CxTqgxQBW2/cOyC2pCB22QTlbyHEeQ1Ma/Tq5cXdlPI5E9wLO53jm8fx2QYLTxY1Y5JVa58aC
 CFl76rEyqYFEjINzndQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX7th2xmIgO/5g
 pIjIfJpOXie9xlfAa021ICoCdA1fTa29hF61JJ9nRjECxnRoU+igXQA53cAgn5m8wEn4cMeM7u8
 0eFx8fdWbWdvGN30sDnj11it5Ufc6O4=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae37365 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=9i6KQpN3WAVTwM4Z1z4A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: -DOnHqOnuhQnXfVK4Gmi6X_NnvOsgwxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290064



On 10/29/2026 5:49 PM, Bryan O'Donoghue wrote:
> On 29/10/2026 15:46, Loic Poulain wrote:
>>> Is this something that should also be tied to frame_sync_en?
>>>
>>> Also, just thinking out loud, are there cases where we'd want to
>>> toggle this dynamically at runtime based on any V4L2 configuration or
>>> pipeline path? For example, should it be enabled for the pixel path
>>> but disabled for RDI?
>> Obviously, if userspace subscribes to the related framesync event, we
>> should enable it regardless.
> 
> That's the behaviour already :)
> 
> Again though we want SOF so that we can drive seqno which really 
> _should_ come from the CSID signal not from buf_done() *

My opinion is if userspace does not need on SOF events, the buffer
sequence may not be  important. However, for use cases that require
bundling and matching frames from different outputs such as DOL,
it makes sense to tag them with the same sequence number.

Therefore, if this feature is enabled/disabled if userspace
subscribes to the frame sync event, this behavior should be clearly
documented.

~Gjorgji

> 
> ---
> bod

