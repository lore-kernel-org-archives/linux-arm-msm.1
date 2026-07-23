Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1149747CC61
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808032; cv=none; b=TkKJcPxkcCclq0LWErrmv/bx8ZlDFuwLL9YtESNDSzmulOuqUqgPKvyj/Cs4/32sewNqnjzbp8GJmaVjhWAkaKRyHIArV35xP+F4ilLxEmx3LQGljAe09Ic0ItHvAN+M5fEkJ3fCTgU7Xy/5NQ1djCk7sSFHrzoOcOCEZVgkRgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808032; c=relaxed/simple;
	bh=ASZ5ohN5yTy18gTwjj32uTj76XxMTu8kKaZjkY0YGlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aj85x47HY2b0pnMmNAxoEhfJGpDTJJPfj7fcDwAGda1qzw3aC2rmleuos21t9Q1m5f0i0w2iWpteFUuuYIHeFxn+nojQaZL/OAFnDcEPIZTNrwlIE1fGDi4qB86zdBs29TlQOA7NeS+Q9up5oV/e9os/rJ6en7bvKb5iDpHwoHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFHKGniF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLla1Lhy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFHKGniF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLla1Lhy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWLE3648552
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZ09E1o1UpWUHsx21y+X247Kk7xKrNwhco5CftwYIBY=; b=CFHKGniFpOMeFwy7
	yxYXC4PkXts/zp/F2RN0nu6eRVB5cPisjXTPjmh8CDEJkeLhoMQUIx7gvK5RVjC5
	qR5j5ughCuGka/SQI1HP3G6zV3ByCqqZbytkOr01iiusi6t/Tj9KwlHECKjMXgB9
	i0M7cQ7smTOacl5pG8Rl6ZiS3Vpra2bUPHJlTN8mgLumwC6NC22Xo8kRTecFHO/Z
	ceDoxPaT/4LG8C6XxPiNTNB5BoK5JJzshhpw0EVUftNPvUv4MKbz7F5zAktvK94L
	258de8AxvCYYoIHu9IskaHmJ8UQZ4GC+nHFOTCySMw1TwQ/t4La5M6GRnBQbQ56D
	E590Hw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jvds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:00:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5276a49e761so1578891cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784808027; x=1785412827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZ09E1o1UpWUHsx21y+X247Kk7xKrNwhco5CftwYIBY=;
        b=QLla1LhyRpUuB8rronp01uC8fessn9FFNAAmVAn5BSZ7UmfrlaiKKHQIeJcwRYDqy8
         wJGeJHBvt7G9u14UgFxY/2lj/+bg6m8gIzrFQhEbmpFTQO7g1xhG+iwLH0pFd578ou87
         wRUlTsLW0k1fnuMPJxJ3U0LwV9iiyHgqzG9zXSN69HlI8g9EqM832WE1oOLNE4EJEkSG
         4wxhj4Yg+C9Ze/EI5L/HJwT7woKfp5zPYuAUCei3DylEKPRKn9kHfCO5kPomONsqdtdI
         NLQU8yQO3dfDx3Qla9Sn8uCiO6yPZdqh/s/fX5igcUZCX4A4D5iOLb4V74YjKI8QSH3d
         xj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808028; x=1785412828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZ09E1o1UpWUHsx21y+X247Kk7xKrNwhco5CftwYIBY=;
        b=csX4yMeTPRU0A0HAlki0t7xgQurQn3vu7ukNSlXDvl9gfH+6qbVbmo/vqnCNEpOstF
         J7dqU28eS5tcDPCPMgCtLAr/kAyFIPu08c8uAFO0DMldJJ4hjBYfXZUfsbkYQf05FYiw
         GU/yU52jsQ0Y8TuGbCAd9Xt5IQKeo4yNkMGYll5Gxp1hrBx5vBqVBjAtUSio4kGZ3KIS
         jWr31Ku7ZwZ7C/61IF27qTiK0VP28hULprwn9vEM/3eUYZkt+xWK8Kyx2ZnrIkgS0g1E
         bHpzS9GQgEC21SRw9cW66KYgGzzjHIbKuAMY9MBM2fNYjTL8t9/C4vw8J1b0vIc9hmLL
         VgKw==
X-Forwarded-Encrypted: i=1; AHgh+RpRTot2Pq5qViYEN94Efy08V6b7m4TseL36ng4o5xIZURvAgoFRtsFc1byHx9BpF0x/FfzV1IGsrkWTPFlx@vger.kernel.org
X-Gm-Message-State: AOJu0YwaGBIzktPktw/adO6fBb+PFutTN59W6EniycF06daUyUcpcIH7
	nel5Qx/BUsLKVa73Nk3uHaA079UqMVP0uTCCXXRvjZfJXFr5O/gY++V3ccLcs/tH+mPy2fE5/b2
	hWowf5a0aF70/WaF3cAm+ZzyA3i9bcDi3cRwWTt4anYjDMGJugNSYsR2Yd+oFJoKdf7fK3Bjc2T
	Nu
X-Gm-Gg: AR+sD10cdFMk/g82QDXJFeI9ZIb8UHsHSOMriDOk30qbcKgJH94tJ+j+jlDKOlymryF
	C/lud/LhbR9b6LpTgXd8V7GlntYu9JgOLOC7lmigSSQYNg0HFIAGqXdtH3wH7a1eJwh4rTI1mmJ
	8cSJr8O65nHGYn4CVQNuv7Iy6aIvTu/gEN2XyrF9emAg1LoyHoW4yH6xsGP2vHhMWOPUF3zzV20
	UIB9bpp8PMFO11yiuVe5ijzsyWpc7H8C8KUh5U+cakQ9v26myPLG7NtTvWjFzjomDKRwPqjCyCG
	xYKiUWAP2JtkEjpBrnhn4rHARqp3i/F8G4pbbXgkZ3TtPM7077UzMXMQuEdj8se4Izg2Fkx3nrN
	Ls/gP+y8PbeHpGjZcAnEwl6UH
X-Received: by 2002:a05:622a:1f0e:b0:517:6162:daf5 with SMTP id d75a77b69052e-528470df736mr1838351cf.3.1784808027421;
        Thu, 23 Jul 2026 05:00:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0e:b0:517:6162:daf5 with SMTP id d75a77b69052e-528470df736mr1837651cf.3.1784808026841;
        Thu, 23 Jul 2026 05:00:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af243fsm226702966b.26.2026.07.23.05.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:00:26 -0700 (PDT)
Message-ID: <51e3ac48-d062-45bd-b20f-c3fe29e43aac@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: initial MSM8920 and Motorola
 Moto E4 (perry)
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Catherine Frederick <serenity@floorchan.org>,
        linux-clk@vger.kernel.org, Aneesh Pradhan <aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723014627.63310-1-aneeshpradhan@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p_WGGkbRWZ_TCMpZp15S6rhwZLq_evRa
X-Proofpoint-ORIG-GUID: p_WGGkbRWZ_TCMpZp15S6rhwZLq_evRa
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a62025c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=hLbMPmW5DWU4JABURqAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX/fa2j3Bjwfei
 Dsfk4sUl4D8KfCNjjlVR7UW93kwzF4+bnbJc/GVOSOFFPCZBOoArDveGFiMH9EaRrDN07TMV9Yg
 oRHC3nso0fDJT/Y/LZOk26ArF9xO1Ww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX4n96/IvrFlS5
 3toDPCiDfSqIUituOg/eqz2Ytucpaxj4Unx0PJ6qrRQVhhoxX7sGbMiPsmFpQBy1DF/kNM9cA/a
 qdChZ3f/SR8bCHF7R0z4z2kOAp06L75obC3B52zxXiwq2pdduu47/TiAiBMkcqJyC14pcj1+iI/
 hvlw0ugSgveaP4c7gp+9e/YLs2CXb3fLmEmBr7ubKnx567NIYD3Vh5TV6fcJwqgmLRuSODUlnvO
 tobf7w5KQOwJRoC2dge/AWtHrvkGnsu+cWgmEFZPShTcIFXUd0Tv7pfHuuav/MW8GA1GFOQjbO2
 ALFVFxcJyZEL+jNXrvUaO77QoAe0yQT1CLiiDnf4c8rBEaA0Ve4Nc7X1cr0UjiTkpw48CaCAkwG
 oxDaNZYNHuJJzy5jGS6eqh4xprXvCGz8pFQDjdpKTDKG7Odw/aCXonV1wR8EE1eUanhBX+OdVik
 XtoEjm2Lh4BAB/jp6fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230118

On 7/23/26 3:46 AM, Aneesh Pradhan wrote:
> Initial upstream support for MSM8920 and the Motorola Moto E4 (perry).
> 
> Depends on the separate qcom,rpmcc-msm8920 clk series (binding +
> clk-smd-rpm) for the MSM8920 rpmcc compatible used by msm8920.dtsi.
> 
> This is a trimmed mainline-first subset of msm89x7-mainline/linux#48,
> rewritten so every phandle exists on qcom/for-next's msm8917 / pm8937 /
> pmi8950 (the fork DT assumed richer SoC/PMIC nodes that are not
> upstream yet).
> 
> Included: regulators, eMMC/SD, USB OTG (gpio-id extcon), keys, RMI4
> touch + reset-gpios, BMA253 (i2c-gpio), WCNSS (wcn3660b), PMI8950 WLED.
> Deferred follow-ups: DSI panel, IPA, QDSP6 audio, FG/smbcharger, modem.
> 
> DTB build verified: msm8917-motorola-perry.dtb + msm8920-motorola-perry.dtb.

Please send all series as separate threads and all revisions as separate
threads too. You can use the b4 tool [1] which takes care of that and a
couple other annoyances

Konrad

[1] https://b4.docs.kernel.org/en/latest/
