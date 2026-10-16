Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759EA287247
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153892; cv=none; b=H08qEwNNIsKvn896u/ulUNaEh8MeEyuFkU+br9Cg45XrI2Ztg4TdbTFav6FC3dLssTA7IpcsSxozanXspUKbBAD09gJMeeIvaxdd1wmpL5G1jcZsnzTCt99BITuJiSzbLqLt9rNKdiRH5pEiQIEaTFYegBxqMdfu4PUDn7QNAb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153892; c=relaxed/simple;
	bh=uvzCRxGuooRqn7FD6epZqB7NmrfzTcjHnLeWzrz4Tzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjSaNPsiUtM/RSfU0CUaZR1e0rwXn3hLRMBSn/+9rLSgXKiHjzAZM4XyZTnphJN/txzG7uSwtYpLwQh6mw9W1WCaoTezW5lrE/detjwg1Prm6ebm4p9TgRcSTaRz5TwBU0OfXQtgmh3QBrk9maCmLCTk2OLmGQVOHrXhslhkE7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZ96fk2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knqCZro/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZ96fk2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knqCZro/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA3EO942684
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvzCRxGuooRqn7FD6epZqB7NmrfzTcjHnLeWzrz4Tzo=; b=jZ96fk2DZK99DMCG
	2dbDYX+BmrDRCFD0Aii09w4b6OMRgmd5fkhApbmSOWDxLv39fkkPuRGhiSCo/ftL
	XxsqZYpP6AqzXGObAe1I9d1L3DJ5W4tbrCwQTizZLKYSoebm3mpiCUgs11va9bip
	aRa5M5m5y37xd/SdwFa3qx0akBGSguwF9nGPbTX875amUYd5B/OlVJLEKy4XQkpr
	ZazKoRztkvKZEn8BX1JMVSN/iD842raDeOfenO2LHX1WZb19iSxlvCFiWxKVPaOR
	Yv1N/KprMYZ1qgngnUbIVB7fKOz+wBAoj9bq7nTO0tLhX1lteDZXbCdX846SUqI0
	OLiVRw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur0fmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:31:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77f133855b9so238629137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792153889; x=1792758689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvzCRxGuooRqn7FD6epZqB7NmrfzTcjHnLeWzrz4Tzo=;
        b=knqCZro/K1iErJk95NWa552BYNt0A3r6eB5uQ7D2+zg/AwvKkwlkwHKobnQKpY/3RT
         n85R6BpdgiaXQbI3iU5smHsZQEZ5Ewe/agky9gt/h0CSoPbY7XsrMAuA+DMnuwZcqrq4
         Qx1Ce3vw7jWESkBaW7qRtEu4YEyyzfGNUT1KUyK+XkxD8m0+MVp+B/UkFtkYnhBx3r1w
         lo69Qa8cN6IxqPNRNeqj98BLGOPG5ijEX514GnzwG7Y+VRDoOAiGr4KvDX9hDKTSPeNK
         q9W4pd/ruS6hOVXPjzDkxVuTYrvgVTXLROr6CkYZxPgC27DtoEK/T7dmUVkeKKQ9UY8t
         fZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153889; x=1792758689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvzCRxGuooRqn7FD6epZqB7NmrfzTcjHnLeWzrz4Tzo=;
        b=bQHNqUiYbk/RQJKbSB4QszyM6QOerU6B2SlpyDSuLLAmb5g9oe6eYLVZYLmv6vUYZO
         q/GyWnNLrqYsUX7PGbVgRGWTMo1q+8vbEwX1AQQpqqt6Ts+6G3NfaFUIwJ8HUALt3CeG
         YUSrsSV85dXymbzSYRmQPdbfp4RKyGwN8QAwe5p0t/ohjkgqc/Pgj7aLWfjWFn8CrRPZ
         S384SJGRjk3jZonCzSxYhOHGf4n1s/qfXlz0p3fH1JFKCXDv8LOm2kOeu5he8ucS8tTO
         SzMvyXJoFbO/W63+0gDT8UBh1reD9xT0TJWYe3tdEERVFuvzylV+M4GNkteSpKDuCARI
         0QzA==
X-Forwarded-Encrypted: i=1; AKwUvBxJF9RHv5LEl++N1EHAv8WPWNtLsy5QxbjMZdtqmwk1QM3E2dorCXU57Zqlh4cRnF+OZdRFkIwlC75HaYrw@vger.kernel.org
X-Gm-Message-State: AFq9FYJhJAO6pUt202s9h8NQRqli/e+FWhOdoySTNWMmCsK4SXE9Ab9g
	R16v/FEeloEbDmZVINX3eL9BSKLdRGFl8Ow893LGQ4Ht2YAt80cTQoAfBdHqcOpiic0Fq44ZIhh
	4MOrG3q1uyIlunAXFTPlTB5GC/tOxqO+gPxwe+PC3tz7EQ8JNCBnJWYQIUVW7anU3poItwo0TpR
	eS
X-Gm-Gg: AYBFou3S/vvC1gASMU2/fE/tLgE/0ca7c2dyymve68WXvcA1Vle/IjJoZjh9KBqTQ2J
	x5vTWBd5W2Mkhp2VynprB+gxzXSqDwjkmLtRLOKvjkwyvEEWm1sGjKFF4CmAwb0ZU7qnSGMN3Gk
	fVfosF/gyLOmbnXcghEQp6Pxh9ynVZuxtUSzgv2i+S1js+WYdy+smF6b20BvQPo4fiXBUOOxAQC
	40gKplgMf83Kjbvc4dpYkaGB6S37bY59Sfe+px9Y8bI6OA0Tq3qJfO1YeP9MpajaTCKkcFSxNPB
	fxp4SZ50TcNh8PZRSMMUxQ5z8zkNom5L7NABeWinn/HHAabwfxh95P29MgjuGxAMxoRbEwpC99Z
	OSXquHq4cmFf0K6fkQ0EhEg==
X-Received: by 2002:a05:6122:4650:10b0:5d4:41cb:8936 with SMTP id 71dfb90a1353d-5e91f4ba58fmr5094033e0c.4.1792153889493;
        Fri, 16 Oct 2026 05:31:29 -0700 (PDT)
X-Received: by 2002:a05:6122:4650:10b0:5d4:41cb:8936 with SMTP id 71dfb90a1353d-5e91f4ba58fmr5093981e0c.4.1792153888906;
        Fri, 16 Oct 2026 05:31:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm66813966b.54.2026.10.16.05.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:31:27 -0700 (PDT)
Message-ID: <18d6a6ce-afc6-4590-ac26-0aca6dfafae7@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:31:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
 <20261006-shikra_qce_fix-v1-2-8ac54d81edb4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261006-shikra_qce_fix-v1-2-8ac54d81edb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0OSBTYWx0ZWRfX9dzKnUnTICxX
 IWryBT7HUIbLd7Ce+wB/NlIJ5TUxRNVikDcMFy8/fRsp+rdvCJiUSYh/EZpU/FF6lz/bkHop+7T
 q11T52Ria0/481BH20/l1G+9XbyPL/DTNu7pLnRXkfgrUzFWFD+Zp9tDpBu8I7qXi46f9p1RSGZ
 HmgcKsqow/bCFmtdHY3YeXn4qa6jWzFy8JSIBTptPaKh0SaPptgu/PsELQ2FT0jX8xwIZ3kkMH8
 9ggKPP/f7nZ7KTjZ92DI5X74S7KiVCZZOWu05dJglykjwSMn4JsVMQacpvWBc1huxLnxsfZ+YlN
 D5z3ykOk7oxMtxY6JOBr5xif6peunaTJ5YlsQW3QkvUAg3+ODUcod5GpJYga3BTQCBOgjzJwAyl
 VYQIirT2/2aT11xHD0HCdkYbW6kNPBeLJf1G1ymOzxFvgwOMOZfl0s2mo/UFXnl3IR7bXo+xM8M
 Wplf8pZlLurbil0DW2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0OSBTYWx0ZWRfX9BAnDhSnMOfp
 OhtncK9YG8c0OGzYVyu74/WrRqCAbnUrt/WE0+HNGbQt5X0rTFdyfzSNeNy9E2uFdQkWkO+TANy
 1ELgYBl4x4RVm0jWE4VMKGEXotDvy8E=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad21922 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=mSLAci9PSNYu4dxlomoA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: yXuutkXTHdXVW_nlBsta98oR6ooczNX6
X-Proofpoint-GUID: yXuutkXTHdXVW_nlBsta98oR6ooczNX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160049

On 10/6/26 1:14 PM, Kuldeep Singh wrote:
> Shikra is derived from Agatti and uses the same QCE integration.

This is useful, but..

> Update the QCE node to match the underlying hardware implementation by
> adjusting the fallback compatible and related properties, including
> clocks and clock-names.

because the compatible you switch to says ipq4019 and not "agatti" or
"qcm2290", the argument falls apart.

The real problem here is "the hardware needs a clock and it's currently
missing". The similarity to Agatti is irrelevant in this context, even
if true.

Konrad
