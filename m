Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504677;
	b=IqD3eDgkbkqTF5K30YpITmNS5UjhBW8WiOHduBKjWda9DeFcheWnjBSg8SQdamVlRPLu
	 tS9i1zpDo0bjGkoTnM8hi2PO7PjPXx78Dsg+RnM2g3cUDRAG7z8VYkLwlwJWtdEwt9oWB
	 0B3ne/nKHLTPQXs+HGRqBfjv6EzWawOOg/sgPj8lHd2GcCl1DpFbDkgsFO+UPLTEePfvo
	 IaOWIwIjKXRZga/NE2EmPBy7SmS5LW6L+0A8WLd2PFQGwoN7DDVcI+x52pMzUkD7nKZ+r
	 5kiR8J+1Oi8qCB8J7OrbfvaedC7oK7JvIhNsAxDj4YG9fFq7yDOurbXW7KMq8Tycvag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=;
	b=DXf2jSxgOO99CbPQeCCk2JeYScwYUAz14qTKi2YB6XJtugpWHoH0wKuj0qGx2QEpgHGW
	 uTpqV90Scb8Npfy5WgSF9ZJDDKurTjE/+IHIIm731/3Elb67sMsVWBigC3+Yz4wGVP0G5
	 pbhHKhbKTLW7meN/F0oOMU+nsvve2wLUZLH2lHKnU0P/MyWKYp9fK69dg7EiSHfx6HCK4
	 ZpkE/9uverOLihGl2vef8Clx89pnvGfka+Y74FYLVxZryJkkZRbgUbfExlMFkNXv1iwRg
	 YajoVdMbesGTTJ7LYL7nCXB9cfl6lMR93zc2hixHSH9p812By6hnAqNHw8dPIBkVmuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCqur4cz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fT0F+xNf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D22606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D22606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCqur4cz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fT0F+xNf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9pqG2845534
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=; b=OCqur4cz4ubjmA8w
	+41iJPhJIEgZYmoE3Uy6GJXEMEo85yC73Op892DT/BvvNib/hma0n1shks8GJhRs
	Fqg5l3MoNf8FY/65UqUxvEgeO907Vg1jJ4CsHocBVJyERluZszAipQhSvu9hkVls
	0mSEiG54/UmuQEjYOI4Jtaem/mEU1JQZhoTBpZOUb8l5pN35iVfQwFaftcT368pq
	40F/RCr02Rm28vdR/EYLDcjv+r6+mC8hqaW1aWh9xLVt+42BFMSoU5m5Fk0tlEAH
	6TtcSIQ8PravgzbLTesKuZQgwAIamFbAaD7quKzB2W1gdkwPJ7DmlFbfN2nN+PaE
	Zxgtnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5naqvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:57:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so67327085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504675; x=1793109475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=;
        b=fT0F+xNf23pA1+yxowZian5AyWet3pSZS1TXxb1rszdB4bP4dRbhTWzNz2lGivCHNI
         ERzRX8gmFS5FE86mKM+EDoQVsy61Yr7E3Tmm9XTklos0hEDdJMSwailJ0FG2WhB6PtAu
         kicZiZjpIdwhymLSE6I9yAcjQrGJIhrEPsmCbtiTVPG4fBuwfhHf5A4q1PQIZN5HIZZd
         OKa66tihrrlX8xJwAIIhmWqWR9SlJqIE9RFffb4S1d+EuTLTYXpH5RpCB15v58EHxqVf
         JgwQQT2VriiNN8Nwn1paU0ZCo6EtlIRUCAo3w+MLg2WWDokGZU33QjHhD3NVyajB4bWp
         XlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504675; x=1793109475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=;
        b=tYvU6RPSmwb4Y1SEGFiPIu2ZkHnPGzup+HSokGHVeYHUqHaPcnYKdQA0bxNk4hmnYz
         QlfAmKrqrJnDarS1cJ64xsxrItfOeDWnkaU9s0A0J5u+F6SPKbuKXMG1evapj9rpx71g
         I+5r+LiLlnsw83yRL0fWphJa6uPZrcOfY/ovGxIO4XJlKNhTIiCllrPhLxNNFZa+N2vh
         1YGso7/vf9jk9EXPeyztTes6cKiWCZaIfqUyVr9Hkuva9l0cy2U329smdXN6U1UTGmmO
         a9ZZBIN7fd7MAyZeqH+zt2gmNKOYRZQpF8qC2gQNVkitsaekwAYW84UlHyYQh2A8UfR+
         YLJA==
X-Gm-Message-State: AFq9FYLjvzHDgZLmdSn1+KrVogrC9QbYJ6K9Hk6Xb0VQT+f2BOJEmMwK
	pNvZ3CVfomTwmlCBYQxQa273scdJtYDUAhTRa6uiYWw1Cwdv0V2fCPaE2g9XslAYRoyIZ5pW/Wo
	7127M5eUJdgY+48AsCerNiXWNvgJcm1MnPyXy53hIK0Fxn0UA+TECeROdvSRsKXvSOKhv
X-Gm-Gg: AYBFou1WdeXWIfgbO1VwcFy6rPMsTToACH0j6FExcaEGwZKunf/5qAaCFlRq2oIDsMF
	CpGgNCOCemqAhuhpmDJHRhFTVwc1h+8bOlnjpfjgskX8+WSKSApKIR/KjOdlN1eItpldGmXDUVm
	Fb/JG1lm5zCq15M11Jd6kvrM42fLamf4nm8dYpyFjZoR3+U8HuOB06o/JCuPtRhNn8iOcOztkQt
	LtAkaylK33hsFLHWyRwSvcgLV73peZYDHYZkMDhARnrsxKGVNsYdMg2EaoeiJS0nBWdBlJ68cOC
	3UCblubRd3Oar0hRF/Av8j+Cx7EoqvOt9N3dZpVdI49Qf2eEUIXoH/vdDAAcYp3MBrN7HQDx+de
	8GCHEO8cG/Uc4KZUUd8Bxvg==
X-Received: by 2002:a05:620a:701c:b0:939:8148:1e3d with SMTP id af79cd13be357-93f29bbec19mr2022154185a.2.1792504675415;
        Tue, 20 Oct 2026 06:57:55 -0700 (PDT)
X-Received: by 2002:a05:620a:701c:b0:939:8148:1e3d with SMTP id af79cd13be357-93f29bbec19mr2022149085a.2.1792504674838;
        Tue, 20 Oct 2026 06:57:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1c55sm490932266b.74.2026.10.20.06.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:57:54 -0700 (PDT)
Message-ID: <e4501d93-7781-405d-b7e3-99d21358d707@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:57:52 +0200
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
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra
 phones
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
 <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xT4gdSJsOCcMKSgNAk-TyDR4t19BRuLu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX3iHtOWI+8r8p
 QDCMzizJDLHRVKgDVyOwwHqTCnBc+DijYlLgjdvVKkpnOIYUL5RU8wSbo0nP2fKyjoWantVYukO
 doQef9QIZczLdNcNMabCzaLFWmrBVijMTlF/27/mIxFf4/W8Thv1Qe3OV/h/YNT47mn5YOaIKWU
 /IA9T6F7f8GWzJNKb+7f2v/g4THHaMsljgW0Gk/XPuQyH/mfzqH0hwJuYRjd6XWzjPW5nh8DNNm
 RV+e7R5MA9P+Yptit9l2ez7HPQYIBjeJpVT9VD6PvsVhonOEI7e6qwqelmQj3ckUnpQglh/WtyA
 LqKDF47po+tcsov22iyykSgqNLyeTZ13HrwEqdfzl5tuzEgtgdMw907vu0MUyBmFxf+775PDISz
 cZ/EdEvX2GqvKG9Iag9Yn/ryMiUEaxOQ0KLBnnUwvASgQY/FI97a2SyDHWS5mCmGwPujBhDPORT
 IWu1Ik8gfU2AjqMsVkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX5DNgQZPq5yms
 G4xKZCdZhrxFco1GQfpDidiSZ8COwSRHif7HttnGYjFvm2ITqUcISBnRO7Want8aXSJ+B8/IrHX
 8oyggAjqs98kJvvq/maofjCqEqEdydE=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad77364 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7urghiclZBF5WMYhkxgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: xT4gdSJsOCcMKSgNAk-TyDR4t19BRuLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/19/26 5:47 PM, Igor Belwon wrote:
> The Xiaomi 17 Ultra device, codenamed 'nezha', is a flagship mobile
> phone released by Xiaomi in 2025 (China)/2026 (EEA). It uses the
> Qualcomm Kaanapali SoC.

Nice!

[...]

> +	reserved-memory {
> +		/*
> +		 * If we do not have this exact region with this exact name
> +		 * present, the bootloader disables the display panel and
> +		 * for some reason it cannot be re-enabled.
> +		 */
> +		splash_region@fc800000 {
> +			reg = <0x0 0xfc800000 0x0 0x2b00000>;
> +			no-map;
> +		};
> +
> +		/delete-node/ pdp@81300000;
> +		pdp_mem: pdp@81200000 {
> +			reg = <0x0 0x81200000 0x0 0x200000>;
> +			no-map;
> +		};

Please check if your firmware automatically carves out
0x81200000-0x812fffff

If not, insetad add a cpucp@81200000 node to the DTSI that's
0x100000-long

Konrad
