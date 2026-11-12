Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473736;
	b=MsC8lXtTvkGxJTf10zGSSE94MZKUZP1BRx+c2u+DMNcYiTZEeR8ZQ6e5cpUuzCeuM/g9
	 mGkNYRm67+z52F4v3X8Ar08QtYYrg9juFQyufJM0PhRmeSdIgIg26LnWrh6FlAMgreUrh
	 c9VGbTy00pR3EWPgaRgl4bKSWlnBQIeJmEVqRWPyRsLbzQZOIEfa8fv6kMgSey9pVRkVJ
	 wna0d0Q8rj0Lk2EkfOp1VP0anVw6dELDGzavZfziptQ3NhcbrP0T2v5nqlmtq/oPmV7Cv
	 1tDWxqAJog/PNLSCQrOMMIAwvmFM6NH7sh1zIAQVcC0e+DhyGoDW4V4c3EvIlzyNaCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=;
	b=2NkRzadVQ+t+4Ki/GokvpQ/+IFHu9P6dmfdcQGHXvFIf8eWjwjig5OCbJuE13iF1tvOH
	 WLixxJzITsd4Xtp1NXFskQFhWVFfBWX6F9cLEhc8GxYjgjyEdfL8hRx+JlzbOhVn4IwG0
	 vfnYrKytTcbS7kkw9kVBCHTBPgPCNEseBDoBJJpclNFX6GymjxtymjqSzqGmRuH7EqaN8
	 clplOaFZw7sVN2G94ktgRix77rAPwROngt8Te9Q8rdv44vdpUHK8TcxUCIb+jFbXFg0+8
	 Br70RVow8NNshHcP1XFGELTMznx346QFoODkbgqf5ysIidQaqb2wE3LcdY8wdXca1OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nD/N2SXN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TenkQfs/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACBB606A332
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACBB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nD/N2SXN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TenkQfs/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oWJl2818507
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=; b=nD/N2SXN55lL3V5r
	D6GYiRrgBHy9LM8zBSmq3npe50GHV5M9UxSONFkfCmuBWtpnR0yQ87kAtOd09uBn
	ux+FxY3b4uISVao0kT75UqDC2pDCBMy+gGcir2FREBuDSfOc6IAQr79IsEcbdWMh
	rbyQbCmm/lSnS3Vg6IhCWft5ynEciNr3iASUs3dYSbM1xlV4NNC5Sf0WCWbhC9GS
	90U6EDf+4ngzyOyCYx7CzYgQKK3sf1c1Qkq0aN1Epqd9G14D+ntq1dyFPgUkDLI/
	vAeDI1DMg2Rd4/DPRDwhnZJV89UZSocOlkwcQiJ2MJE6OkqjwmxJ5XcEZNH9FjQv
	R3aNww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1883n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:55:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso30792785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794473734; x=1795078534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=;
        b=TenkQfs/FnyeTgfnvl0EA8o40J/pZIM1q1GLPZm3k0TZGqkUh0pHi3NAE5ObP/Ab3y
         Im6bMqK1NNyyI5+9SeCjp5hqN3Fd5Nn/x3n8XB+438dlMPbAcTMD8gceQtZaV4phD9bI
         C+LS4nZFj1dI9U54mAxBYxC3E/nFnJmaW0Ss9ewsZMF5yPOVHlvARWmbOwwLWZlpVvS3
         CuYj4baBG/opjmIHuw27MGK3DNMpdXECNXR1wevK2vBcltp38qBc46eBgtV48fgMNfWr
         H7lLb2eTLUiyrfJdUJB0T8S71hR1ZHw6R/qCaoT0OtVvYI/dc5DPQ26+FQhtqsfUVtHL
         OQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473734; x=1795078534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=;
        b=e4nslrBqh3GEhtJG00s7IWQlDHYT6yalDsOZxQ4jKVc9Hrhsg+joRhz8f9555p3sd8
         zmeFoxdRID1bw5Jit4XGR/sbdz2IqrtpyeNUJvavVHQXZAOuKbVLp2OYm99tASubasqL
         AGJmc9kbXtYaHgZ2+WC9Z5QPXnMCLU2W2mYNbOnE/KjcvgIXOkG9oYt8yCdWPUvmd3xM
         IO6RUwuPm7DxDcvlyCdhunAMPNFGa0HiRt4PyTxLxdzd2WWj/eYfVJ4HViuHPllJfwFj
         h9ZFj33W6eqi1b1wZPRHTWpk+0F4xwmIN1PXh2uxc/Y9MOMV05g0pgNJ0aTuu2brnfJI
         Ye+Q==
X-Forwarded-Encrypted: i=1; AL+hErFtOZim+35GLdNLIf05r0oXwrOxVc8UzvXbAlWKhbWNuAuQEw58pVP6WlTQ+F9Cu0ldU6CpASb72JH0BLb5@vger.kernel.org
X-Gm-Message-State: APuU4Z9RmMkTe90AVheTIqHDQYMpeYKyKyfm+GOMIsqz9y0olYpqs4GB
	cfrf9U6GCIgbSjXnC8tLauY/2y/2g2bqe52U7q7o+bAHfAsw+kdO+CTYskE0iMoQZKGQbsODREp
	Fy11394zr+QsOSspxMrU+6TOeP1wVfTTR8AymYw4+mreC95+SwEyQzI0k9VXk/lFxzXzp
X-Gm-Gg: AYBFou20wIOfILfQ8PSzf9U4Y32VKf0W/gX8M6pbvslkpv0PbRHP4w+4asU7HXAPSn/
	KaSaEmNlgh7QQVQ0ZOBiBfCZmnD4Gc9Z26sjl3fLIZnOw8uIN/he9l5ubR4j9nGt0hgRRL86teQ
	1HzLrbHpm2kaVzn2DYOhGOyF+I+HFO5hbP8eDhh23IlROmIbSzheAV/gq0eMpCtTsDCMYMyiO5m
	Z3iMTxQmSrL1wGmIgAp7/uaAlrmWOos/7SgkjT5AbcARYKVSELwdLDuZukm6U+eusRApBbi6Wdq
	0EyLfCssYSsBPwM5CTmpAmHC6kLq+2WgqzXzxzK4u3EE2UlKYFE2cZpv/A8lvbUVdMVmVA4/+zT
	cWGEoV/haxlhMgXFs8/T/nF23g2QdDmcgil5Cq5u2RtEIAmfMWwMKAPyClTcM5RjKs8auDgI=
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr842046585a.6.1794473733705;
        Thu, 12 Nov 2026 00:55:33 -0800 (PST)
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr842042385a.6.1794473733043;
        Thu, 12 Nov 2026 00:55:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a63f8bbsm317160966b.60.2026.11.12.00.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:55:32 -0800 (PST)
Message-ID: <6a1f3aee-6e5a-40c4-94a6-5c523116bba6@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:55:29 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: nord: Sort adreno_smmu_0 node by unit
 address
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX6jFlqdjPCHMY
 TrdRO3S8CFp/bqZnzBGb0VpDsVXT4V6Eptnn/mKCyplYFV5ULPonblBrU+75wn3TSXAak3LON44
 XqyW8KMZdj7n6LOOnBW2rezFJQafh7k+W3w3mTwaGU92o66oR2SD1o+QzUmCAwthHR5PaTNcV9n
 aXJ+U/DV5Lbr624p81SReZPeftOYOXiEjknSizOmG4TF9e2ijH4qPOVp9RbxK2bfOoExPOuP1fF
 9kdpXMtl/WPm7/eqQ+bRgyg6E6VM5IAjHMV3SK2/NfMu50FPc45rIonzACjFOxGvfd0gjMYcsV9
 aBk0ENzHqj2yREMns2UA+UV+KibPy25CNuNoHNx2Zibp3lEWHeAKidLRFYMI84ZoTOozmLGnBPM
 ABHdU9lV0uv1zcif3jfhUQV99SLKJRI0r/lu/ySqzOt74YaI1oLJx/txzzjQYmVlB8ir/vR058c
 fWhmbKAgvFdvA1J0iVQ==
X-Proofpoint-GUID: 6mDwsIlQk2nqOSnOPac2VQTGTMfJkAAR
X-Proofpoint-ORIG-GUID: 6mDwsIlQk2nqOSnOPac2VQTGTMfJkAAR
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af57f06 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V6h-8VdV8C8-G1v_c3gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX5VPCSwDgSLPb
 4z4mORewyys1ZrgTTHj3KfIUVwqN6CcUWtgrr6bCqfdvNnK/c+rf7FNBoU86bKYupI6bGbyBCKd
 jjkB4foEUo3sV/4TbMIBVgo1H1G667Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120035

On 11/11/26 4:47 AM, Shawn Guo wrote:
> The adreno_smmu_0 node at 0x3da0000 was placed after ipcc0 at 0x9007000,
> breaking the unit address ordering of nodes under /soc.
> 
> Move it between syscon@1f60000 and remoteproc@4c00000.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
