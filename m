Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913307;
	b=QrMky1VPxm5+mgpmUCUHbwbpshinM5AcoLlucIP/M1N87YHcYZ3h0w+V0D8jpW5tyUSn
	 6rA+xsBmIk5+iVXXO8DgkV4rFfxZ5V+t+gK0KtZqbKuKE9wCFAtfGhhXHxU3w+YDwXzDs
	 3v8AAJdYUJK/EzBd2FT8chidYeUJk8EQlMv4r6l0rIxMssZCJKDQv3rQzSGnf5mOZGixf
	 BD42/zaU3Ot5wpV62hcntOiudyAmi7D+/Zb28CG+pK0b7idhDTdhffiqZl6Rbjoir6sdN
	 gzxsKb0JK4NVqxBh6WMYbgNiBcwctarsCgn99UKD/dQOKsmhArDpMlI9dqVsyk/G6vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
	b=CTjcQ1f1icUicDUjNZzsZcXnGLPjsNrSZs7yCtuq6XDjL2TFEY5WgE80HAJch8fU1IeJ
	 gWMV1THSSE4AuyG6YxREDpDmY0TQL4S6I36kjfhu1v0ouMcw5IlQPznERTvG7KFPq+fwR
	 KELGQzOUMbHougBvSbsoWNAtgNM/jDovtgosPX5IDuefaEQx3iYv8d7EPkBDOKx8kEHvK
	 LO5yq8//yaCrLxChOz+SOGtL1R9u5hiwmfe9R8YG5kRBuH7C4dfE3U60b+vX62LPbSkp/
	 7GUwKecEKHd4/vVvwLaz6SMI7VBiMUYH/2kja2S6XUK8G9UBZrpXA0WD8WZHpgtcPwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=muo0knjk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci9ranhs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6691606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6691606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=muo0knjk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci9ranhs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8o6jt844374
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=; b=muo0knjkPJLHmOJ+
	SeIMK/MkrZFvRSOzz9zyW7mOiP7Aeux59PJGrr2af/T8TJNfWp6wS3vQwgJXcXNN
	X5KtFXC2c/g/N9JMosketbN5Gs5gjhboYbfe2ZwTcxnTEMeWPxKecaH9rEQIRgpS
	+SSCs0MMEOwVkjhBAEpcb0sZwt3WlKRZ7b+Ef3kFUB+xNV2JqYiGIYLGeTPFItYT
	aPNQK0Z4C62hgoMi0sWVHbEuCu7SHu2bnaH8bu6+iHjElppP7JY6JFANxsoeqlAu
	q82163jaV1Yzn/+tnx/BpA5f4xhhLW95lGhlXjgxcmQsTjxUq36QVyA2qfzg1KOf
	zF1sFw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h26hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:01:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so3165385b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794913304; x=1795518104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
        b=Ci9ranhs+b0XxSps2j7HeGr1p8VkSfvyGMTC63ssG6lQ5sfQbJX59mBuvrgv0O39TH
         Tv4o1PFWS/N2KFikkfgfp3xE1O+1Y09FWPFiTm6ovLXhQVEJ8EiJMzZSVH72ZHiSo9Wc
         mp+mnwHX7V5vQlQsECsoOeAq0MZjZhnSvybMwT8eMHwf1QBw7XFM314c5z8wNuF1r1zf
         1aC0i1MwQtzSrWlczThNnFK7UYaakuaZCa/vun/JgU3hrckeIABCj/wjL0gLUOpCdKL8
         1ArhEWsPYFuLOY+JgnY6wpfZmI47qFfP8W0kMgLoGcBmcWwd4uW0UpEp6u/s+4cEDaz0
         DMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913304; x=1795518104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
        b=D1AtPTu27SFUU/32McR0KXmhXRbIy45qE3Co28RDRO9jAM2mSwBPHN1rWv53NA0RZA
         6xYKCSsrlr6EiebcV33dDJyqWuoQfiVlvLchGJpxde8SX8kcJeXfrHGcsC/nvzrzVy7e
         m7PI07IyaorydcPxYJpHHF+VjNIMpJfMy7FW3aEkkqB9iUn1PeAjNG0vU5GGyvB7HYhu
         8TKVsOm2OaTeF++2qd5gF6fkSI1+AEvuHq/g0E6FSgt1Nv2k8MpSeeLlRJaH5xd4SUab
         +nA4lk7+GTVRpXXhLBtGhN6EnRnaTFCH8gDPyOP/y1n5niIt6qb+Lz3zq7r3YJiu2QBR
         gQCA==
X-Forwarded-Encrypted: i=1; AL+hErE5SVOACsnr5tfwHU4Tw9n8+18DeW0Xn2dO9HqIgTW6AlC9gC5yPs0J8GXsvUO1DiDuTydOhxhTvffkuRKE@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ga4ZuycgorZT9MBLquTsGmD0d0gy+LSs+Szi/lVHYeD21x3jf
	zm+eO2ub4T9n0fb5tLDunWf8CgKF4YeV3L+Hb1kYKSS7ReB9w7JwkPknWUoqHbjVtYuGdPbz9B5
	zjNSWXV7a6LQetBRSU4GRG0RCz3Ag6oarRywR6mV54DRReZWGBWdUnqa4dkShrdXwshq+
X-Gm-Gg: AYBFou1+UcxB76v+zmsxPYVx0EOcYabHZZPBSI02up4dK4nQualGpfgNRUh8gXrAy5i
	aSlwGElUItPfiNDhT8zlI6UVZPgKjbkiDDD6jo3rQr8/mn76B4pECQxZtOjQwrOYEc53U2vbHeA
	n6I6O006fxH3vUpPSWFYu2P4jMe5mhqLoWtdSsTJmZ/mRnDEN4sWrP4MZ/TlHVXcGRqz51mbwWD
	X8csgkKGKhENwz9Gb38Ay39ChCXG+uAqUCNrKi1mMATPmoWkjgBY8ayn//Jx6sMGx2+vatv+jf9
	GWd8GY4pSgui6tNp8HJbmHXVRfhaOm29f+B9XtxWtE5ShDiQKCnIqWQFxm2NvUaf8Qsla977GOj
	pD7mBvMblgZEfUhemfpAd5YPp8eIx+VQAPJ5hmabkwUoSh8fwjrvnyx+abOMbvzj7Z4Dsa/uK
X-Received: by 2002:a05:6a00:3773:b0:89e:8915:24a2 with SMTP id d2e1a72fcca58-8c42858750fmr1991702b3a.29.1794913304369;
        Tue, 17 Nov 2026 03:01:44 -0800 (PST)
X-Received: by 2002:a05:6a00:3773:b0:89e:8915:24a2 with SMTP id d2e1a72fcca58-8c42858750fmr1991679b3a.29.1794913303862;
        Tue, 17 Nov 2026 03:01:43 -0800 (PST)
Received: from [10.219.2.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b648sm4805369b3a.46.2026.11.17.03.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:01:43 -0800 (PST)
Message-ID: <2e247391-ab5b-477b-933e-0e396e0920d2@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:31:37 +0530
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
Subject: Re: [PATCH v1 1/3] arm64: dts: qcom: talos-lyra-evk: enable audio
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
 <20261117104303.435294-2-karthik.s@oss.qualcomm.com>
 <2e7767be-ed88-41fc-962b-7c4bd728e856@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <2e7767be-ed88-41fc-962b-7c4bd728e856@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CAIPbsbh1jO-XxxvBTdhazaZ6edR3aWk
X-Proofpoint-ORIG-GUID: CAIPbsbh1jO-XxxvBTdhazaZ6edR3aWk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfX8ZzCJL5FEMvD
 gK4zgPIq53yeIDE3L+80NDvN3tkFgUJTLaTVULL+Nzd2llozQZdbu0PZHtsk+l5PAS60Km0xyRA
 MdUtEIxwheZ+mny7/hp//jOZwBzrdpH9rHThHAwl4sn3JfPxcfsaNpXTIXW6pNwkZfkAsEojNxn
 rWNSi9drT+UI8Z3667bAhDpLejYL/ac8pvzzjOMLacXaH0vjA7BCdguBy14rkqiCWeo6vvewJow
 16H0WsJjocJJeu1L/kIaGvrpjDWSAyXKyAza72u3y9LWKDg2MOdGn4jL2tY+sifBdZsiFFxcfUM
 mNCBZRBv/kFQylQO/BzwW6phV3WHWKKpgvzvV9Yizy0PqYTFEkO6XxMiam3ABdjVtL0u9jSTowv
 YxjMoT/+K9gL4q++SMWO4Nk+AMVWUkjhffnn3elz3UUikBwYLqZ2PpLDUKjNWRSJ+ffLDi5SgcW
 d3djIsUSvR/5g6CFAIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfX+bDwEwZ7kGDi
 51cqtlNmhkoIi0ItjP0V0bU1b5EAQwsfJuI1MAE4GietPIYtrD+IYouZ3gN/iPuqt82nsV0hMpG
 HYG2gXJJzndiufA24NDJnzi3kkWckNM=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc3419 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=HA4giugNgv4V6a54TBAA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170043



On 11/17/2026 4:20 PM, Krzysztof Kozlowski wrote:
> What is happening here?

hi krszyztof,

git send-email seems to have picked the wrong patchsets, i will resend 
V1, sorry for the confusion

Thanks and regards,
karthik
