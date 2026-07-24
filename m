Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAFC41227B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895899; cv=none; b=oNYqWJnjnqabY/YVvI+zhMoAWd1J0dVsMivY/XUrBa2yhXjkk54OfSu9matK4PVIwz/mxyaPQYY6aq0hIrLFAMILO9cB5CJ9ynBKwlDAIVmhDTyAXxfmib6mfqRHIHPwtMoohqBM5njax1wz6wABCXZnDOll6maAeaepeGqAUCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895899; c=relaxed/simple;
	bh=y4lRSn/uHBv8saAZzIyjk5wh1VqEpnjmEmKa5ABxQ+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLkBJ+675UXY5oX9VWb4nkiOEdqfA8FPcfyFQN4NWZ5n3F5JqgFTFZjjy9HpWROKaC4YDaOUH+WNc1pDU1gvyjH4EpDLHfII7AUXYwQgKRaCkGImo3cE+wSStyMOLu9UnXS5uVZY3qrbA57nGP0a8DW/e5cexxlo+juPFLIbr1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZ5kC3rv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpgEOEkR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZ5kC3rv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpgEOEkR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADXes2478947
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8GNztDNcAD9DpHA1M/nq35zaZAtMJvmz4WZeg3Cb1Us=; b=MZ5kC3rvHHtaA7O0
	+zhVCxbIZRAPnztAxatFuI0EWuP/lbOvq3v33T52/uSK41bGAx/7vFkTlKagZwcl
	YON1Eill/tfHdkRw0Q2Mb3DFBN3gNKaomBghf+gsnTaf05lCTPWNnurNuHTuxNE5
	nr7WUJshy1C+GrxsyWIG0ZtjWUoSwfBCvlmTJIqJ1MhYJRCdq/N5gHbFLs+e2555
	3SVTKxLoq46Snn8M9WHSE/YUhHUTyihqUBfvCVNZTBC7X+CZMmjJmVsCYDDk6qSY
	xxQtIKNRMx8bf8P91pIrICKO1MAWlMxxtHGkS5mreh4aT4T5XyzYaDDJapvM+d2R
	KXK9Tw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx9dhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:24:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930bd2bfc45so3429185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 05:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784895896; x=1785500696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8GNztDNcAD9DpHA1M/nq35zaZAtMJvmz4WZeg3Cb1Us=;
        b=MpgEOEkR2Vl2c8fDbi7ktJs1TwPY77Q6y40G1O6ym0FzSVXORuX4E92javPmqQH9DV
         rm/1nhbzQ/5sAQGmHXYpirR1C0ahI6YEKuZ5QKt5s2mk8XQ3rtYxPbnzu8iCJPT6M++c
         GtFeZ9ketjGfIibMFqh7rXdTUeE1fF16ts4Ju7z5ovZ1ocjh804LOBajPGLJ4j9GwzLI
         pLUtyEulQrPMGHTuZjNMVlhLoDOV3fnoOZVgc9h2QbMlAzXKIvLXVzPqNOlIdVEtNETW
         xxDecmjrG3aUJ7S/uzN7jDfztKIAxiPQl8i2/YIUg+EOqOT8LlOf0RZx5eFRxiCUk9UG
         su/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895896; x=1785500696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GNztDNcAD9DpHA1M/nq35zaZAtMJvmz4WZeg3Cb1Us=;
        b=abfH3xq5wE8e0tHe4BfkhPn3lcBwoJN1Ng3YgKvsVK2O1eCE3t4wwCVzNhEo46Z1j0
         sHCBtTVEmsAHJNMBu1P9iy8kR/BFY+WCySzTTwP+njWcbZRuABvBYGUGKsvQntVRGyRr
         HW09SJ2ip9KUutVLhiCWen3bAHvlXR/y89sBNRCzLkRu4yLxQF+IgFnhAUUWKuLN4Zxe
         eIhNj2ancPKU+GDYbbmpYl71WF4uf7b61ZntYybKf9LRk1rM89yTOALRcDScjm8/+WIQ
         VDt3sNIcx21KqGMrKiMep4b9bMDc7BRuCuLOVP2Z9+XyAz60kZxfIwAFN5yEdRJnPb0u
         s/Kg==
X-Gm-Message-State: AOJu0YxpGMwIcc7oYGdWpaQUTP72BzWUxFLdV59Zemlg0W8Rt2g5odHn
	9+qGMJKxo62Wewg5iZj/Bbg0rjog4uEEdNB61dIRyF+t91naIhwYcw/AOeSGQ2k843t2MiRyzhl
	JCG9J3wJr/o5xs3Yh1OkXMxRFQDc3oGczaO3lC9lOc6vH3GqRmyVxALQ6mUmXGIlRCdNOXGDuVn
	/I
X-Gm-Gg: AR+sD114SYIqvWFlNqjiNCwnN2Jn7oRtVdRe/qD3zRo1vFsmTIpTGORPX1E2obYuxED
	CGLggj3jTaA02lW7lQ8Iw9hPJGeeAQLGs+7XQ/kkWoEo1EhNK3VV1S6C0L4/HzI0DFaRQlROFtg
	4gpPX6FCMGfHZfWEbTzmSZtu5UMJNV6r+CtOibYu4wA6SNxEl5lVl82uxGaZr5ljiGTjTiGltrg
	Mqi9uLvz4yN8N4ST2oGVnZpJsa3p9oDVIQS5pqRPEhZ1csM/k2VBLefGhz8Tzj4wKJrCvJQfzW+
	arW4fR2yhgNLnB8iwzw3K1Kq30L28sM8yikQzRB+RB2YsdMBl9/0VKU1swe4kuTXZmOF+Hv44sU
	D9R0g1+sMg/9Iejvep8xXtkRy
X-Received: by 2002:a05:620a:178a:b0:92e:601b:8d43 with SMTP id af79cd13be357-9315b4b0795mr327116585a.1.1784895896113;
        Fri, 24 Jul 2026 05:24:56 -0700 (PDT)
X-Received: by 2002:a05:620a:178a:b0:92e:601b:8d43 with SMTP id af79cd13be357-9315b4b0795mr327113985a.1.1784895895661;
        Fri, 24 Jul 2026 05:24:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1a17sm3189769a12.5.2026.07.24.05.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 05:24:54 -0700 (PDT)
Message-ID: <cf10b09d-06d2-4614-8cf5-038c40119477@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:24:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Rework fan
 cooling map
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260724-fix-fan-monza-v1-1-d1c5be947329@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-fix-fan-monza-v1-1-d1c5be947329@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iwFzUwv5tCo4HuA8EFYojtFD80JDAAbf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExMiBTYWx0ZWRfX0nvTtrozMmG2
 cNmw7r3gpRQ7un8tTSEYHgdOG2/y51h5yc590jEO891OY/L9+i++XM5MYy1TijDHqseMCiKNnxc
 hCaFaGJWyMne3C/7KCggNPiH3zATdw9SKDX13eTVPzI95TAG39ZNSzV88iG4XgHdlhNIq+As9Ut
 P1cm9lXZ0xNlG0VZXwY6upWw0HcRE2svE+w+vrqUCpSxvn+lCGPON4bIlDhGi2uvFOk0SrQtDIK
 GjR/dp/DWGb6zsR2J9zvnn1VKRKjUP8SXISpLb4kvUzgcBe1r/lXUWf6Fgh5tz0CS5iUmQKWXXV
 zhacfBJW70KWS4nItJk3LXrQGX6nTvEwAjAe0bSzP/jjcP43EZ9KosUGPIKS46MAs7bRy0cRYTO
 fTq1UeMl6Aui84Yb0CBrkUYyaVfsfWvOuWG+Ebb/SWVOi73E92POYH12fxxuKzUYetYM98qvKl1
 plRHQ0o/A9G4qkIIqYg==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a635999 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ww_Een7LsPJxzu7fvtYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iwFzUwv5tCo4HuA8EFYojtFD80JDAAbf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExMiBTYWx0ZWRfX2+tF1fDiBBLu
 jy6x2ofTLWu7RjbJonohA4FJqIXw8/0CzrEv9esilsGvgFkOytYlMO4MT3zf3pT+TnsMa02dCOE
 kNjteCe/JQ4LB9F1Njnjs2GGpTYJea0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240112

On 7/24/26 9:50 AM, Loic Poulain wrote:
> The fan thermal zone previously had a single "active" trip at 32C mapped
> to the fan over the full cooling range (<&fan 0 THERMAL_NO_LIMIT>). With
> the default step_wise governor this only ramps the fan one step per poll
> according to the thermal trend, so the fan speed tracked whether the
> temperature was rising or falling rather than the temperature itself.

[...]

> +			map-active2 {
> +				trip = <&cpuss0_active2>;
> +				cooling-device = <&fan 8 8>;
> +			};
> +
> +			map-active3 {
> +				trip = <&cpuss0_active3>;
> +				cooling-device = <&fan 10 10>;
>  			};

No NO_LIMIT at the end?

Konrad
