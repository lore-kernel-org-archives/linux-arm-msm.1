Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704732;
	b=UCjmNd3mBHromcgi62x8VV5wPJYaZieA+//qu77itZkJ2x+1A9fEYwY3L3gm77Vzuc28
	 6xblaF6X1OgMaeLNms3peywfiQlrvU+q3SgiW2JPuSyZipLk0otz3mgeTn9VJabubNNsA
	 COb/po2Lgh22BS8fdTL+OHztLzPWXYwIyP4K6glkhCfXSwp+8gKrJ++v3EIcvcav8KaK3
	 RGorRB018kVZfKhW939Mt18rM085tDcXcAiEZxQMhu0SN8nncYkh8+QzrBrcWrUJL0evs
	 74Xn4ntdc3XwbgBcrMBogIwvuTGbNrN53KCuGp1EEJTL0vSXSGm+fuKa2ka6EjydAdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=;
	b=tmEeanOghDQRQ6L13m3kQGXPiWloQ5aCUc86l7Jl9ifgburJ5meqY45fOD8tfGlm3xut
	 0OioC8S69gxej0s4G4LpUFZYaqQDBrYemldwDwDn+FM9hUFxO6hMrhmqX/QlHWwRRpyeM
	 2GXIBvUcYPSmJKKTAn7SiiD/FAePxkFI8O3YA5swX8Dsyp0MTW037KqBLbS5n3lexm839
	 ysPGNI40Ffnxv7/Ljq06y9xQWRsSIfx6JzrpRvxKnJW7iHjuMBepMpqCLg3NMR5T1IoMH
	 pf2aH8H1UwOkFPAbFharm1yEw3xEnQYCiWitlBdionClXiMYGuMcYWLcO+uN5F4ZsxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DcH5s7q6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjjmxBUZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46620606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46620606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DcH5s7q6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjjmxBUZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUtM4088367
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=; b=DcH5s7q6VzmfovC7
	X8ERTzZzLQgE6u9cK21TkKmvdxx5K+XVSLYJKfmdBmOtOA45vbkf7+RG2WSiu8TA
	0hL4hjusjemQXIxZYXYFUlUFW5SNyxNHBnMDqeAnMeLHIpJ3a5+wrDSpzjp52WVS
	L1eDXaZZiJYQv1wYMupMgoeMyCSCpCl2j1pwNdczpm21ymlwZaQV8S0Af81gdHlY
	J128FRSE3Bjm11YnLUj+rV6oXoih974R1ozvBsaeyVBVlcX0ny1Q43yopRaDqtU2
	DxhjY42h0PurEyjxMEyu7X/q2uO4J6a8AS2VE5WDmKXT6ku2zly1nZrqKGTiB/gh
	cTQl2w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm8196m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:52:10 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecba171914so326243e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704730; x=1796309530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=;
        b=WjjmxBUZnr08pFivAhtxe90AaCOdH1YC/6KDDKC8tBl5EM12sBD8IGASoCQP5B7N2I
         FP29pUgllJSjTHRq3xt6YFLzJXt6pdCqEdWNnrDC5TSVhELv4JsjoUPmD5ATTM/lC0ho
         aWbZnr3mlFBraqMO4UrPlsdQ4cgmLupTCRlnEyiQ4dwj0cxDI/4zk58WtJG60YFPN//U
         IcJNVYeqHo3TezMxswaSRik8qMZRk0LzqBCES0csosTCOB/OOw5/ghwMYfHSezTTaMmv
         +ZrX0tYPH6oRA9l/mQQva66d7D1rqolBuGlhl1haXZnhip/Y4QAspvhURpzBIGHZ2Z76
         Th+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704730; x=1796309530;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H72KJoBHayhYZ4/SDSW7IDXdiM87q9Lxr+UY60gNodg=;
        b=BBupJx16AiNyV3xgdv1JjtaHKs0oIDfPr7uBBuEeFAIZhT89BVfngrU/E4HH73pSk7
         90NYft/1k2bLvVWipb6+t3zUZtzf128p8AToubNrJdRClrMeCCdhIxCVeU+QHGX2EfvI
         +Mq5Bg+L+rax1c9XnXRlMctKh0VToLYF7lO/SJISfRXh2qYVBp4VVTGNXyt0VqVuQdUg
         zKlYdOuduVnDF8Sez4g4tA/Y8cd5+tmlNnASAIRNUlwlI79ub+VeQGteRIGnjPze+WsK
         Dt/gqCuYHlCdzlV/pyECmp2NyeKE9UnWlTiG2pauv2p1wnrxjHF8/5byDGXpQfABJtnR
         ppVQ==
X-Gm-Message-State: APuU4Z+uRsGwUAi+eTaoTBUQq7j8B7V7H+FEB5T8QKAtMaqsBn1XcD1M
	HwAvoCcYC6uGP05Jzgodu1M5ekK7Jp7soMf9goUcsMchrp3Grdul4URYyNI3ISEgRW/QbFhNjZn
	N6jglkDQ9GlTjrQgPTSGuf55c4vtIMHBbuxt2wl/AhL1KABK7co2VM2VZd/iHWvwJdTiK
X-Gm-Gg: AZFdTZeSuLpcsmDYJNG2ymq4IvMwK27GQxy08DwOYyl4L/QZSbj85PkC36sQLxcoDQy
	nNIXsvHb4+gKFWGivTJ3RsJaR0fin8gm6WEGjwHq8bEp65rJQ3DaHqFxT4yr7dx3xPMkUVUdy6Y
	LZgjnYqzOahWBzO1+ePf7G4iLG+pIygg68MHWfHuqKSlkiavoDRKwzMajUj+JKHlhPt9EyWVEIw
	StbqUo9yPfG6cIwQh3snK5k53P960yV9rPtxwY7TWdzfPtQ8LLfBe/Abk5YjccDu4opzdzOnuSO
	quheMjkWFMXC/oyD9edolgF/vpK1eMBikkUTO9jwgr+Y50Iv/jYWeGDUfF/7deTs9/nYSnmIC0K
	maTG3kM3VZ9jHqXh2nOmzH1Dn0cXGrI4sGbHucPoms4XpYbjUArIQ2OuBvQ+dp690kmGEDn8=
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13243939e0c.5.1795704729570;
        Thu, 26 Nov 2026 06:52:09 -0800 (PST)
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13243903e0c.5.1795704729006;
        Thu, 26 Nov 2026 06:52:09 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b003eacsm750204666b.81.2026.11.26.06.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:52:08 -0800 (PST)
Message-ID: <c19ccf6c-f7b3-47a4-8288-27da1120585c@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:52:05 +0100
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add GPIO
 vibrator
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-2-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-2-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QTACdc3-rJbDFaVi4tKbsQXXGZ2uEsMJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX4S8pfKRRsKYA
 NtlA20J98QDKJoMtCe3TQUenAcpV2LG3TMOAxX2iyvqWUpDYIg3OUihPh8BRD51ThOHs3prSgBb
 /mJZfQoqExdOmt+p21+nQG8tx6B55Zk=
X-Proofpoint-GUID: QTACdc3-rJbDFaVi4tKbsQXXGZ2uEsMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX3NyW35JfuzBR
 xV6tOOpJbBB6fQ6cC0zVjkMXArJuFIEsp6IssCDDtHpXDUqj0RlZ/XeYhIJWL+a2Oswvzdcow1l
 nR3DrDzFE/4zqaYD0JNQdiuTR3uqXdjSPcH/pNdTtO7VLUphvGRP9FrIshf1biBtzdaqUAkT5gn
 V3gwiHCmtxju8UmhHDEcHfT3Jl3yqHacAyFKx4nxYfd5VLqpv16jqCESxBbEYGbVt+wZTK/HE0k
 VuNu4BVtaQQ1kT4x6u5mmOWygZxnV1B34vVEwkk3EfTCR4PWR6YoFPsKglK/1fTqQNSAjw3GzS/
 PSeXygavBlN5sX+cZ2HppITpojdYL6R/gke0o0IsOI18cWEUgT9op9eqzTVCnqpvNHxUZcktfsb
 SpqU0HlLGQW++nBAS/dD/b1YbFNEGsqyPTC1TCY3ZgKQRfkUDA3cf3+FFcBEGremtD8GZ5NFqII
 J6nkfvnuvd9rWMpTF3A==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08479a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Mq9dOPq6Hou_Oe_0EYsA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> The vibration motor is switched on and off by TLMM GPIO 18. Describe
> it as a gpio-vibrator.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
