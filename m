Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572855;
	b=PrZDeOOCpe3Cob8lkIOxlQe5Y3M5XnzLRyJoHwNIXwj9wmMPW8WxP9rrYUIbNcWfw26d
	 a2Om6I71GV25T7lbQ4GAY9++c67XjldEMvpdN2Npzq8sPZoee4NvBa0d2ahLb3OzQ7vXQ
	 66ZPLvygBhYIk12LJRHfwNC6Sqm/9k19N6+SktmyfMws++NLhjWXUYlDckdHLswIiw11M
	 B1WTM+3yl3maK699s8UMpCR1Jrd6QcM8SUNWOdT7QYCHSc7Jq5iP/IvLCzdEEeGJCueeo
	 hxezYXeB4kZ8UjJ/AzOJiJ1YJXN9QEPJQJZwvyKbqrkF21OYauTAn4+9biNSp1PeApA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0r+7BMhF2phGSMt7OfziLY4BKvxh2W77vTTsK7xMOJo=;
	b=quDTu1hOBwsavrlsYTNe+1PGS6GFBDDBqfPMQ/ynqZHXabQGRLWKS+wuPcOrkodtisQx
	 V2OpY5JxMEDSv9DgQvF7IdlzSzqzVeVaC4RCw5XgjeMcTXx3T8LHDZTkzXKjpAE2cT8bH
	 RbEiDVBdc039aSzkpq/iARPosvTTVaMCi9tQBeE+tJCJBre/WmfjFJGloKbcOL9BmPgEB
	 7BxehEMUH4z6F4QSi3UzzJyTO1CMFaRHOWNgaHd7w38zdryxKXX/ngK4z91ervGC5nCoC
	 OXOusvxmP2uPS0Iaze8sS6Dj6PmC0+EFH0kJ/t4X2ooJSyZB60F0c66uJQbZ627eLlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UuXTUMT9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JdS8auAn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB0606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEB0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UuXTUMT9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JdS8auAn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jQWR3573373
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0r+7BMhF2phGSMt7OfziLY4BKvxh2W77vTTsK7xMOJo=; b=UuXTUMT9sHPc0oaJ
	oGz/YooBQ4zlHr80gMeUyAfk0CopnKjtkEuGLk9FEJw4eT4K5MpGd9pgyKk1R4b2
	Xcrj9E2GUNBVBCTIp13UVioEtK1m7vK2F2T6GgXSq8nhCkLk7MW8G6hRa/4C10GE
	Q7CNPWnY1RFgj2hVwZ9IqBNnEWI1r0AMvNE65qGB08XNIfuYIsEaLPAmHHRoo6Pj
	h33l9GTZuokOxj28o7OEKqjx2nTkl0Qh8dUK/qb77C6YX1P1S+TE3eM3Fm0KcMbq
	eWwtfu4LnUHoJDy8NZN5vmPOE4v/HKcZG2Sqm+ddMZHDRgnOlDT5r2BHfrqufpOH
	/h9qyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hu2v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:54:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so14306585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572853; x=1793177653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0r+7BMhF2phGSMt7OfziLY4BKvxh2W77vTTsK7xMOJo=;
        b=JdS8auAnw/hUHbTKueIWNoDhcfjNhZrupqcVGSkas7bRcCdo9KdYcQqJg4Eu7ZRjGl
         fNTe+lC8nKULV31Vu3sYoyUCadvG4YmXo/6O/jQ/B+DEN2qexJIKeZ9GK7BqIN9TtCwG
         Ke1Epb4GrcYL7tVyaXzMMPUOUVIt7IbBTM2vIAvuaHAy92U7No4LKtF2mR0Ojm974Lt7
         t8aBi/1g4yjFEe1rlCarlNwKaRlOCDZpJzlEwyxbbp7qBWpfNHd+4ketP4a7AnYams6/
         /4ETcnD+3+/w55IfxVfEWKAfdnfwezwZ7ExcEETq7OvucC3vnsT1nC0COrsFL/qoBdi3
         M1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572853; x=1793177653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0r+7BMhF2phGSMt7OfziLY4BKvxh2W77vTTsK7xMOJo=;
        b=MUFKwpHOzCLuQnJ3Sneyk02Q/cQ14LZ5HitMC4Vb5gTgHbn1moVONmL6rtLtk9IV4g
         HOwjiDFue5GK/jJOhO4g4rvq0f1GHepLlDHs1druReRy3NI8hqLLATprGTQcG844tSA6
         loiv/p0RwQWklCM4Niw68nwS9xT4SXo4cG2c1GKwcLEa1WKRh6HLRYnbEjx5ARWi016m
         0nsZyLsB48RT9mgRkC5Rqdx3KtluskRHrYlCdvgCXWchtf0TclqbWMPXMjbdt+qM1WDQ
         oGMf5gD7VyPy+bAs1tgK/taziKOnQ7kPkjoU38kT85jF8vQLYABpG6A0x2lGSX3kbMFa
         r/Rg==
X-Gm-Message-State: AFq9FYLH0SSfXl7WjadvPf+V4zWeIo11c64901ie1K68rKJ6Lu5xQJwt
	H/yDDbiDJ3QHwopgGuyT19rdhlac7jiN8o4ZH11/uP3kjuQfLDN1oBd5mFUiMUn6bf7eZKpiWOz
	zfPVt2MBdID8n4+Z2TW7QqX60U83U+SCfC1DNZ5F30DQsGV+oy6cDZ/SJH1a8T2jJ3xYH
X-Gm-Gg: AYBFou0zvAEgQkL2jiwvDwfN8QkHyHpsxqB+rRAK0Qrl7IR7ZsrREkGucteezaMMy4W
	JXM4Yvx0zC7z2R0Zg3p9vSB+eypboQ0VjfsdL3a0rUHMazjwutEGdL1yGiNKWtxTXM1LsyZyZsG
	pw+PhKBGMuarfioZ1ug6Af55iotQlF8ekPBFlhDpEC0KXgmIK1HGrk2oyl7O7KSbTs4Tit90Zym
	Vz/vp4PeSA4idIuPnZqEg5n6h5Zy/04zYUF7ttPOPSLLexb0Nmh3W26Naek5/BpsrXwkBTZW0hb
	4wD1rClmYs/6Vh4K+O6Tsk6comBbDk7NdzpGzBzIyoSfoyqf2uFnIJyJJc/fnMr47Lh55wEiYGb
	yoSSxVdNA7iXSkaE6k/02fQ==
X-Received: by 2002:a05:620a:4589:b0:93e:508b:7800 with SMTP id af79cd13be357-93f57d7628emr374396985a.0.1792572853041;
        Wed, 21 Oct 2026 01:54:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:93e:508b:7800 with SMTP id af79cd13be357-93f57d7628emr374394785a.0.1792572852579;
        Wed, 21 Oct 2026 01:54:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dafe2sm610154a12.12.2026.10.21.01.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:54:11 -0700 (PDT)
Message-ID: <b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:54:09 +0200
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: glymur: Add CAMSS and CSIPHY
 nodes for Glymur
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-1-e7b1f403146f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-1-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad87db5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Yiy9HrlOpii1y77HuFoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfXwD9J7sp0deB8
 7wxw8o1tXoEv1aNUoRWQWixPaBg8JYZpTd3P4A1aXfNfW10mledwGE3/4Est3fP2M5vDtkgqQvF
 kqxhqxvz/mvUCaJiB2DFibGMeqC3dZ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX6+v7thjf0i3j
 ufZ82hpW42VdF68sLfjm0hWSpa8acL5L//Lklzjt+YYSERbaP00Ib2bPfdivJb+kOoQCE31E2ke
 q6y9SFnN7F54aMwhQipyvHpWsU2pcZMLFsxyPPaFOf//eHcvYKiHCMp5uGN3dLAvsNjNMmXUJFI
 NrSuTBIKQ7/it5Ntu4OWD0dg0p0blc0U8i0yMnUkwJPz8mHKO2lXulxhF12LkYE1nqLLggne5cc
 dmUwCDoa1kMXxoVith3dfOD2ZRTVjvnNHKhm2rUfc6xLjF2LyrsRdMVl0UAcupp1ga2eC/8Peyy
 7B0nKX42nXVlHH9PMAy0ukgQ/HE18b+KfEAag34gLe3Fx7VZh9hkurSy36Gta0ReO+H/7JeNgu+
 gxEVtwIqCctqI3hb1wynQMjxMqeoIsKieN0yj18EGa2Sr9CIPFXLlhiKgSaY69BYVfoWmepEHYF
 /J8oxveSOMLgNsq5/hA==
X-Proofpoint-GUID: qqF1P8VQ3hU7pVi3BGduXhtqyQDu0DDq
X-Proofpoint-ORIG-GUID: qqF1P8VQ3hU7pVi3BGduXhtqyQDu0DDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035

On 10/15/26 12:52 PM, Nihal Kumar Gupta wrote:
> Glymur shares the same IP as X1E80100, with three CSIPHYs that use
> the new standalone PHY API. Compared to X1E80100, csiphy2 is absent
> on Glymur.
> 
> Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
