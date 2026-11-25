Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602834;
	b=jraZwUSBoG0wy2yMi/dAHcrJgKdj+yoMWLURnWhInQU/QJvDnsG6zA8FfUamjlp489Au
	 w6D7gZID3iDAQY6fdWXS/0z/k4TqfX0HvwTRkDT836b4UfNxsfnbR59ommF+nYFna7tbZ
	 PUAlvpkYxCN+DZVT5dAjjGMWYDRJnPRqadJsTsusp/p4PnyWgwUpPeHUgZ2rFo5bMbas+
	 KUPjSIh+ZX1vaN/ovaVoz9455vvBWUNbtkyWelmQLShDp0kKLe157OU5vEmg93z2YpyB5
	 3f1EdGocKYte9qAWqy/ghEeSerYJbtlU5VApAQjv3D5g6ZduMA/mfGIVsPyV707MnXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=;
	b=HUkWaxmpMvAFz/hIWG9vG6VEprEfVdkegjfGgenphGBU3nbf6DCfuBJuqhWRdvflPuOf
	 Hfcxxv+wGMRf9GL8riIYcjjeJ/ze1DAvaayl1Z7knedsZTp0pl5oVJcFaEfvKcNFTS70i
	 D6RW/csU7ztOiVryKMK2yPQlDZNudY0lJZoX3w8WpV0a/C+rdkKSJI0RqL1+wFQdfsn5n
	 Ub611aTRmlt26KBtAPxt5XO7b79n7noC9YDFEdMC0/YLs7qowfcX1ruM7X4bSZ8pSHsag
	 HQLWh7pS7AevQXprGohNOL9cckfQ/VEfodqYQEIc/v7ZzlwLyU5Q+16jL3IYquX5jqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1jkhZIa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RaKf96Gr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9FD606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1jkhZIa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RaKf96Gr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNQh2356523
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=; b=g1jkhZIayrjzYxTj
	uUBCN5a/x+W2VAyWny9Xm7cCzFFqQNiQpJ4CFS6NtKtumxvjuhMrm+y1eiktdRf5
	o2MlhaQAlF813ddB1/efHervQUd/jA9kj+SVq9ZAK5puN9Yp6M/G3pdXzMILDVUC
	MgEPRlyZrMpFP3qV7n0mvkzgAo+NkJFjH+l+ygH18hIGU4kPxS4i13SAwTWBjphk
	KgvWc7W8ofJbN7EboJCKUmJTfrnRrdFZHuRyxK3PNbzvGJOXxjpW+bwt+0yw2bNU
	CvMfNamR9lCjwRYqAp4X46/uVC8JEH28eNIDuwmO5dhRyn6FSRM+AP0mhsq0Q8vY
	IHz4Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6a2va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:33:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-550b1b21674so12548921cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602831; x=1796207631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=;
        b=RaKf96GrG6zG88VXlSI/sleEgjHzkgXkHYjLCw/XlKaQJfB0xDKTAiWD97axAeDlgn
         Nsfar/VVWh7/mCzZRp5aFY8u75JBRBX9+uSyDy0bF2VY7WplYRi8kBviGDrKCjgpZmd4
         8RyeK66n6pP7w1Vm7eNDEcGjkcJXeRtWSdrMRIAvAr8yKTwG/7r2uz/CoL0eb5vMYGPl
         ujXLPV02G7VKHdIl5nirZLLPMuaJEirM2rzs6/ScNU7ZibMXaDhtCjLYk4y/Rz+w3exJ
         Jz2JzJPrgaNb/ZhfVnUbfFebKLl7NBKeIMr1qHGc32dShdw5ttQPcG7HwoDkfVe0nwZX
         mdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602831; x=1796207631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=;
        b=h1GUViy4F0KamN+uxPH1UPxCcxoah7vuAlOfMrYb0b0u3qZbmohTldATIjdBht/xhl
         rb9K7brZ37N9fvgo7kFzWdj4N5NLwMAseATZWxQVvZEr0yJfUvdVjqEeeHj5b+lMcf8s
         YTLpqJL8D3uAALJKGMXJe0N8IPDjcFNv101zDegKn/vJTGfeLeY0/2t8KOVi4vReXM2t
         8f5NsGun0a0AstaulDIiC552jX3XqqGU9vFHuuO5tWNpZ+nDQ2RnRPCF5MXvNjzips+l
         ThTcY3zuAZmiZljlQCz/suctjNgn+HlH4ms8jfKdsdCOUJBRuaf5vlvPSK9OmlfY5mye
         xnnQ==
X-Forwarded-Encrypted: i=1; AL+hErGderMnx6gesztnMLNoj2g+GGPRSkCmaWdELfonShSlEFMpd6CUx8hBP9T597tEAonccty+b8fYeqWHVIB3@vger.kernel.org
X-Gm-Message-State: APuU4Z901dLNtH0rMB2QOyUDnMp8xrTmw5TMphaB0mDhtOdORJXdcLAG
	wBjETdo5i85ts91i4c0QftjxmT+RG2+5QmOYBgSNJWzxgzkdCZiJza6/9rjI01vMS0w63Qgtnt6
	iQc1aj5MXPby93595JtT055ERQMrUESQLd8Hyqy88M3wQ88SwMrKgtYHi4y3wIdgdchw5
X-Gm-Gg: AZFdTZcu75DXto7o3/4/jbmnv/BJPbyqpgXWcC9bbt9dlO39y1i/YB1URFIlUbGrvTg
	LBd2hD2oqeSjUFOemv9CW+tnfDgArBH8emxNRaqrSgh8uTUjnCszYa7aJMJFiCJaeHHLBfIr+a0
	CO70mLgxduxpKsuW4LzIb3TBShHW47I1G2Izn8rI0AFVILb7MEes38MayENZ+hslRJ5xmZ1dKF2
	mApJuldb7wXDTik99AmudLaR/Gh0UOTfxbD9hZ4sYqX/M3QgvvcfNCdWyw7pL3pzJJixOSvoD1+
	somLUxZSnrFFq8jIiHyV8Wz3eMl1p3udDN/BrOaEofzuyuUBJ0QU+/XbzJQonJhFt9ajhUK16C/
	MbDw18cIJc7Dlw2ovq5BDhZs3gcnapa0XQ99oQHprVOZlJLEamuuqjA3XL5afuxSEmPJyDbc=
X-Received: by 2002:a05:622b:113:20b0:55d:36b1:9291 with SMTP id d75a77b69052e-55d76741cf4mr301146081cf.0.1795602831428;
        Wed, 25 Nov 2026 02:33:51 -0800 (PST)
X-Received: by 2002:a05:622b:113:20b0:55d:36b1:9291 with SMTP id d75a77b69052e-55d76741cf4mr301145681cf.0.1795602830983;
        Wed, 25 Nov 2026 02:33:50 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm7990385a12.18.2026.11.25.02.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:33:50 -0800 (PST)
Message-ID: <25ba0a24-85e8-4aa2-a2a0-23c64729fd70@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:33:46 +0100
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Describe the PCIe thermal
 inputs
To: manivannan.sadhasivam@oss.qualcomm.com,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261125-glymur-thermal-fix-v1-0-b93a9feae156@oss.qualcomm.com>
 <20261125-glymur-thermal-fix-v1-4-b93a9feae156@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-thermal-fix-v1-4-b93a9feae156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eXpXX1wID9X9wkhdJ4ZF0bZ_V7xTXcli
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX06kbTUaxqTgp
 q/d/pik2jI9XNfEo5WnzIj+a2KrB2cQUd+twTqM+/S3m8VtN0GMXBCOt0UQZ1cKFR+dMLLFuWgB
 ZtG6/n0ALFsXAs04zA/vIfqrpqBNmRA=
X-Proofpoint-GUID: eXpXX1wID9X9wkhdJ4ZF0bZ_V7xTXcli
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06b990 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TtJGJgRM3qr-9yLlEbAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXwrhTrTs9LLsV
 smpxYeqiA3WxfAZQvDHULCGDrtmawc25HR8J2uexiTp73CyFansOK/M+FiynbB9RdSl7ccaA1r9
 jqbU+2rsgNkZv8OKDMklvglIqVqvqFcrC5+8unqPFOQDHGmxF8K/tS+7unzjI4Qh5R3kbdBGX7z
 azRLsHGBKmaX0mR7VKf0kGV4iMx13UIbGp/2pk3fci7jx02RzwSgKsto5xlRjsaYNoDaVogElIo
 S8XdGLrUt0bzHsFjuqdkTwwU+1DvoKh3Wwy3Vy5eoMB+ZXLsmu5rmNMy2jeib6Lq2bA8YecGRTB
 mOyHlFKn9LUmgU8Jvx/KbtO1qLR7kOjzdlzs8nwJBO3ivx7/XXZWGwOIbddUHkdK8i2xe6axnB3
 0bQ3F2szgtRXzagxcgJFn+xpFsZmSJrNfJ2qStZ1Dab5md9xvcpQwxSANW54Tc/lmfifQ1ek90Q
 6zZLfd+deV+QoZ/3WIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On 11/25/26 11:17 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Some PCIe PHY instances on Glymur benefit from periodic recalibration to
> compensate for temperature-related drift and maintain stable link
> operation. The controller driver triggers the recalibration with a link
> speed switch once the temperature change on a polled sensor exceeds the
> defined threshold, but for that it needs to know which sensors track the
> PHY temperature and the drift temperature.
> 
> So add a property to identify the relevant temperature sensors,
> 'qcom,pcie-recalibration-thermal-zones', to PCIe domain 5 pointing at the
> aoss-6 zone and to PCIe domain 7 pointing at the nsphmx-0 zone, as those
> are the zones whose sensors track the respective PHY temperature. Both
> zones are allowed a drift temperature of 25 degC.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
