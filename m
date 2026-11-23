Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448378;
	b=ILkPqoGnRbEpsMvPOiBXZZ9RuXpcvTFcsUgseIdH0eL0gN2KA0AFgW6LcstMPm/3gqm0
	 FJmWwtOC+DJrOXbSibQRruffofqorwIHUIIiUaap8O45Xxt6MQVC85WSCpE12ph9zFKcg
	 Oj0RO9mlNrodKy+5ra3k6VNxZZ5aQrNjI+66+shRuG3Yy1u6H88e3UBUe1awVTJV52rBw
	 Co/q9/U6ngXr5V+9gTVCdXM13W1sgnvTjtiP81XqmObMn465IBjp/ETlheB4qyoKpPtzh
	 7Fdcx9CSS9gFf8JnTXcZBP9Bi+edYx/wOs2dGJMfP6JY/AjolF4xKUBklQpLhQLoqbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
	b=aVocHVP9LuXpuvykv2js02I4i6JqTLGhOIDkxiaeiR5bNj15cUuUXUO3y7fG417RnaGw
	 vLjsDNni1+p9E6HX/HIkDPrbR7EFIWPmMthENBcGY6xNFHXZzW14CjWFCPwiLA/Gf1S84
	 fWYQNRXdRut8emXnppJxRN4GJixgfLtQSkd5cLONgEEB5PP1iVJAEu209v7re1HKJ+/wi
	 zjmIEiKAWEcbBoOXUU7/UqGKfNDdILicQKMKbnwOOEGHvg20dzILHf5hh69KvbhoqrTht
	 eGk8iz3DPiqasRrWd9n2h2QzvxnFatpTeyVTMxhQSQjBPIFltkMI2iBAOZjnssG5faA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eThCyj5J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SU9L7HdT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D2F606A33C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D2F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eThCyj5J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SU9L7HdT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKumB3329305
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=; b=eThCyj5JdNxBibP3
	6Mn46VkvXbbU5MOIDoXPtfUQvk0/M0DvPuIiLlk9J57EsAu0TZabSuvy8wrHLq22
	rySVbHEnT8Fdgg/ry/BT56mtCr3m6HSbkEag77Osygb0lbATjmJrbmUj6dhHxFW+
	JOAp1nAU+Tyh2O6iw1iz5f9vNe4nZj+oiYkTXk7FMMRMOWz9JWNQISV+WzwNPhdj
	CPwfwHV1Sj47+VK3AnZfmKufp0V/QYY9Pwli2By2e21X4dm/Ge49auMZXv9BLdkQ
	vC56wi+KoF346ejDjvo7BCSonIJXEGUBh4ydB6613RbsOWHWFUPN45WIlwTgmZPB
	Y0gVGw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd24vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecba171914so99307e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448376; x=1796053176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
        b=SU9L7HdT33GJtLsdm1Gm9me3IELbRLH7k9X7Wtw2YoI+8xfO/1sdyy6GikzEguDA53
         Z8O88b9jlHd1e3sVInhEz2walGmme1gBHf/Ra3eE1tjubgxyNKcWU9WZ7k2F8glO3ngA
         Ubzv4f9h+vACPRgHlZzJ7kYrnSBrRAyQe1fy11E5zl9R2ie8e29H+jF6gC8M68WJRiWX
         5EE6CVho0x9CJeJ33vgcfIWPihbAz6voiFoDQjkXai//x2BPq5aZZS/MU/6+bQJs/E8+
         EInjQpibMN+I6nhjDxGoBgMuJrlLZNGvM9k+nBpimOEhpenXFQLLBT5rXPrkEB3tOLEW
         ZTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448376; x=1796053176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
        b=J61BhfceqpLivcpYGLEK2uCyqtz0ssDUvJzXcikOPHMuwlPISi+brSKuUGQGnE0p4s
         L2TVXAqO+2KkBgg9YJWT360xtvjA/48KG9CL/qcFxQ2vGXyvus1fr48MwV3S5WiQnM8L
         UO6oh4PGyyJ3TvdHpSj50sowV4wBdY/hykJEMy3DaSDxjPaDo0nnAonaKxcA52mCxDpD
         7t7ZVQOHmy4wT4PJ3SWTPSIoDzBYt6vVZEQuxdBqZ9MiHt+6hzu2DKjKktr33T/drXJn
         yH5wGqbwUl4RmhJVGE7I2Nk9omHth6nFmm8lZiaz/7DWqIC2zhbvw6dDtH3SSEXFgc1o
         zvLA==
X-Gm-Message-State: APuU4Z809wKv55mrR9a4aJdpAfdwMdGQVMKpwelZt/+K1R+dAeQoP9kT
	YP96SRlouS4iLAQcFLXXL+seWwBgaiFqWj4GmHoak1fXZzcTu5bEaMhKu302gLkwZV6GxR+eeZP
	lOxYnE+4lyGxYuiQnfWbEtmzKR07W1pyxSUlho4naIL7N2huRS+zfgYwwdKZEWtL2AFeA
X-Gm-Gg: AZFdTZc2Ts1J4hP+sc+hXTISefL5z22Ei7HZRK9/lKSjt7NqI5ZbPxgh9Vxj9imOOsd
	yUlN5FpaKdG6FxJjA6DJhhSvMc78WTb9fdlCOOmq4bfAkjUs5Y1DpYz9uaK788cPSHkDwt8Aeph
	HvTEcBmGChb0QOGddCNqiERHxjToRIormg3LC71fCgKyVrOU3HXJxrJuQpyo+f6BAu9dYfmgErc
	wv7RWNYp8yq2CcR7yovAK6Huc95zOuRj8nt1h6/HzVj9SndE8D43o0T0S415YJBBIdzYXaGqJBE
	mEPtxCYKQrzLzFyhNxOFS8YKTtQ/raVRmElIlRNI1igExEfqqQZuC4hBO522Zq/GyTYCkT/74cN
	rfRP7XAxKA8kHM5VB4JlWnNgjVCBccUHAIetNf4B6gANitZv+VcckSosywcJ8+d+g/6rGDE0=
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr8021129e0c.1.1795448376218;
        Mon, 23 Nov 2026 07:39:36 -0800 (PST)
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr8021082e0c.1.1795448375818;
        Mon, 23 Nov 2026 07:39:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm425248766b.63.2026.11.23.07.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:39:35 -0800 (PST)
Message-ID: <65e2907e-a856-4496-886d-c9c3e8ea3351@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:39:32 +0100
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
Subject: Re: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger
 type
To: arapaille@atlr-engineering.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
 <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dLqs1Im2MooW7k7QhIMKjC5xsUf6pHR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfXw5Xiezy+xO3l
 S1jkpt49KE8wxuCaY11igKvDLseBJFNcnwqBRgw1C+N9hMFXvUFZrzVevrwMS1W6pmLU65+wDWD
 GkA04rj4i/dfm+uujsarpUsZkV8vHE5H32i0g6MFXGVvldjVdQL3aWzEhHAuZmi33CSOOGMpk1Z
 ujGjP9j0iST4/Fgw9vaY/d/EO05PeuQ5v6PmvsgcJrhnw792XXN3XMe53meIbeHqa6z7MFcA6Pv
 CwoiltITwp+F03jfrchUZOJ5vpO4GJNTsU3J8Xp8SiyvA827lO+vJQHpyfKR86t14XS9poOuvW/
 P90RAozzpt1P5VzGbxmkz+XOw+nLZ4nxD8Izu07xFelMUOXrruTWTJsa3Ry4erA/rByjaDwuPWY
 ilFxGw+DEyHjzEGT7/Ak1ogWP7obwEioLZBNo8jmn2buGg7T76EHIXwIGoVet97lojRYBjB4erP
 Mcs/2V6zZ66uZCVYaiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX7DK82BeHt0Ii
 m4uskT/hdD6Q0VEv75uVo4YQTwHzALSeVRvXJr2ULTUvUuC/ZsKCidrQmasFZdrg3atcnypcmSC
 dqFP/NAhUcs5xiTOSxaNnhMTWktKeAY=
X-Proofpoint-GUID: dLqs1Im2MooW7k7QhIMKjC5xsUf6pHR_
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b045e39 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Knk3v0qlAAAA:8 a=wt33j95wQlzQpC1BO6QA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230062

On 11/20/26 9:05 AM, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
> 
> request_irq() with IRQF_TRIGGER_HIGH stores level on the IRQ mapping,
> which outlives the driver, so a DT with another type gets "type
> mismatch" and -ENXIO on the next probe. Rely on the DT as ath10k does;
> every in-tree qcom,wcnss-wlan node is level high (msm8974 since the
> previous patch).

Drop the last part, this won't be ""previous"" patch since it goes
through different maintainer trees

Konrad
