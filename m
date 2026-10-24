Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873455;
	b=mQt0gFENSaUF2dN+yVF0JScSoaDKYCeRgPD+xYJltPF7feYwr0v5e8ur31KPnVd96nSF
	 IV+iUus/Wt8Je7Ifq5N3tJR/ki7cq04SG+oRbYiSYQNgYYYFnJxM6Ikzi9ya7XgHo3jjF
	 3UdsgWN0/07tsEY2evRifsQopQ08oB++49rinyd/ZOt1NHRlfToyDykuAjxO1A9r+xfeC
	 V7QA1BrY7ChwTP7iJWIsx19Yh0W5LUHVBMY/3odoDz9SZYIcQN6uatFWGYQ4bJ7nmSMTQ
	 +8uTU2pIMS1KZxmuEbF7wxMjxH9pW7xhAQ/USDl335k1DXRQRDkDnGvaa5g+iDVXeuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OSWoeKkSl8LV8SI4xnbQdI97ATBMcNBTzfvGNoiDQeE=;
	b=QmMfMvavOXkL4I9UiJA63BYHsvI1XvyVI8+AxWZ80a8Uh+p1CKi+uuA+0vxJU4Cn+89N
	 +b32Giboz6ThtcKP4vWFOAz9ZEyQC2ozD/ffAU70t5nOcQkXR1X9x3ncdUCJuYICcXonw
	 9dpbIfJhDCDbSOHP2IEHKmAyiabOJDDHqSIxwEJ8evZnp0VG/SBraAcvYS5TeCRm/OmxY
	 3P5o2498P5Zs/P/6e5A+TdwpLCEsz6mix1a/dtcSgaaayGtvFN8TaomZzEADPLKTFOgMa
	 bpP1Ed4KfW77WyDUGZTh58rGs7JT6kizeC6Do24RjC1q3Dvs9CKcBdNERkxKmp5olvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSFLzhfB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWmCLqyE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301A3606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 301A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSFLzhfB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWmCLqyE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OITr1W1776691
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OSWoeKkSl8LV8SI4xnbQdI97
	ATBMcNBTzfvGNoiDQeE=; b=nSFLzhfBkwVROVya8rQbcprcd/wwmxZH2IEH+0NC
	/EGySx2O54lH4yS+3MCMM7e4Bf2L7/0LXM0rUPVBbH2GsT+B3yJveCFKOw88DPCQ
	R0aX83tHrbINfjf1ResSTTQ2ZgYVuBRaUwdaJ3hVgZRKSSCS7e+GPfJSKqL8LvAO
	5wTNZ9iZRUUgVVn4mQ7nUFGZV14sz2dpgpS4a/tM7RIGPBZ3nipMGdfjN0sQVWcS
	WBMvptXJcUBu00iPf2NFwDREQk4gK4na3cgZBysIZ5B3pb23YVDWF6YAbyv0MHTZ
	CQaO6xck6xKKJrA49A45ywGiUhF2ryMtB1ZFi2vDekBDlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehhmwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:24:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so441115385a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873453; x=1793478253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSWoeKkSl8LV8SI4xnbQdI97ATBMcNBTzfvGNoiDQeE=;
        b=AWmCLqyEwBm/meuHJkBuuEbfmtULihA4NR1YSFB4Au+T7j7I9IZgonW6E+0tWY3eVk
         C9+77cMndtfPcggxTJWefEKpPSPJiA3EMqqK2H3MyF7z9P/9unPckabc9HU5c/aFV8hK
         XV6kYwp6QVEyU0VCs/JTAEmywJZQRy6pYbo/sI889pTdDX5V2zo9ZtXS/zgXXUXMsW7+
         ExKI2HyM14OlvsPZ+M6D6cmD6jODdFD+Ckxg3M4KBYX7GXTQzxpK+InKF221GYTExpT3
         u3Q0xAvyfG9TMtvKboipM9Omq/1DDC1akzU7T67DJ9WQu8XpG3tHuGIhR+CJRA8J1/2k
         mUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873453; x=1793478253;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSWoeKkSl8LV8SI4xnbQdI97ATBMcNBTzfvGNoiDQeE=;
        b=wHREpdEROBCez/Z844yWuFcPos1xM8rzvtijVhhn6W0Dd2e6TepKQZxZUiFDg/Kv96
         mtJM12NCmCu/THjL982zeG+3/o58w4+XqGK0eH8/5lsXgOeeYLHpziRPs8qVxxpTYj0z
         m2u7gUslRsEMB4F19w2FCkd1RE8Yl5F9p44wYoYeJib2y4Es+q1GP2JGxNzcIxU9Epeo
         if3itSrYxB6hyBDlG9baK+WvR+JGROFGl77xhiSZHy0sJddjgcIf5mile6H9iOb1H24P
         ufV/p4FsamteLZxoBmWHPOJTKd0rVLFJm8tURjC5PY2ARK3ueTp4byiYqrJwqR/iq4MN
         OHsg==
X-Forwarded-Encrypted: i=1; AKwUvBxAFxv8QdQorUCln6pvQ/SPHDfF33Kq8UHYpXy9MorFAEMeeDtinNRfu6u9ALR3fncjTjbUjGLF7IkaRf+D@vger.kernel.org
X-Gm-Message-State: AFq9FYJ41bBfMpcwWHvakR0RN/G/sHouM+kEKCCDPn+3QCkeWD0qVvxN
	LbOdR5qNFvjLtq3e4sldyxQuhLr0QYEnN/abo8AOlBwsdvXBnAliAdJRbIQloNBpcgHVhlFHDBd
	nBBlf6dahPtPowh7mWdw9iqErgPsvq6BpYrCN4zWnIqW7FAsYASGXSIklAoPIf2po9a9W
X-Gm-Gg: AYBFou1pqrebwhckwovvVKG4cXKQ+d2X4wOjyjRlYkWTvn0mK293Wi+2QmGt7RFCvB2
	4t2jyokAVr4GdOQwlYZET84RubHqw22pdD1xQgzXt5e9ku/Tzd+UTtuSTSf+B8+n6dNRcHsZ1L2
	Y7eRecSdJI4gzChGmaSlQWT48VGog4KW/NDEMX3qXfjJtKBfepz44qVR4cJNQyiCl1S6nKBtvjD
	b/Z3lI4auNsRnQ/uXbg1Zvj4Z/RtyaqZMJ2Sc00x7ZGZE34z9jjssqptkAVWYKG+Wm0z4MYUn1N
	z6BzY0AVycNCd43Bpf8uUZ+257hfV2aVANJHwV3IsLPUjob/W/XSFplbC3MJnEihRD9wfPQwl9R
	5azTT/GqIp8+M6ja9
X-Received: by 2002:a05:620a:4152:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-940ef98b7d3mr417511985a.64.1792873453013;
        Sat, 24 Oct 2026 13:24:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-940ef98b7d3mr417509085a.64.1792873452350;
        Sat, 24 Oct 2026 13:24:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm73364725e9.12.2026.10.24.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:24:11 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:24:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8450-hdk: add DisplayPort audio
 playback support
Message-ID: <x4vqbuds2nl4apdi533rqkx4jbtb42f3gtdog5fqvilqx62x5g@lhud5o6ayymw>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX53tgBW0r4Kcu
 DGlZ0Zi2RghDXOLjy8JSKH+aO4gxJZXzQ3SnyVKLqnIUwaCHarsT2nW033qMfoBFPPNHUMDq/Pl
 cv5bvCunl0WnotrSmqVppCTSvROxIYE=
X-Proofpoint-ORIG-GUID: UVLW7BL-KlNpI4BjVCu-YZCsBiiqeAjs
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6add13ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfXw4ix9Z7LBWoC
 cXm9S1dQpTtPn7koQiYAbRNtuIReFB5AIPg93bNSbqWtLZbuKZcOKdPAK5iOLpBiM/wPAPEpKOh
 TNnGpHBDaiGCiE23JAYD1lg7Pg0DTmEjkfXiRbQ67x7FyZ+GmkHicpG7XLx0kOcYtjW/VoTtlJ1
 YGGr84jukxaf5j8HTafhYCREL/sDom5FZsZ28qbQaLbLdgz/XuDKjOCzSUYh9h3NUm2OTwEeys1
 IivddBJJUWNykp0b3NAFcdbJFl3vm+9RIzVjZwf14n8t9dzKfJleb6EGk+SqPsJtdseNV5gbtF5
 IaHW2jJz3PHH8aZDM4djPo75R3tLUds7UUikvFhGfFCYgPW3RrzhD9nyOueLelO5FJAKlKO2lBV
 cMNFMfQid74WtUnuBBSuaiNfjFQ8lKMoC9kitH1+5RNyQ107Ts1+2ng7kTXS90KVKiFAHt75J++
 93fo36rdcHVMltBJknA==
X-Proofpoint-GUID: UVLW7BL-KlNpI4BjVCu-YZCsBiiqeAjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:36:21, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
