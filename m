Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDE932A3D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152164; cv=none; b=Nf4T2rv/ZFlEdcLiRMEIqELTcdCn0TzsFmnLmNN7MnE4DMoRlpM42TOkqugwjFQ8fgKptj9FWtLlh5Hq1NHqUf52T6yJnEUpyR1v8hCgpXhXEHZ/4o1gJjhiC2KE2Rolvs+joYB0RoII2ccS1QAZ7QU+DY+3CovhIHv8URqV2pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152164; c=relaxed/simple;
	bh=wSE8pRRskqRuantWRq10cRfN3D/Rpt8MDjN7XBFv93g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLXVI2F8f7sEp1HEoGLYEIS3cO1V3P7b/shYguJyd1xHsxnB56r5ShO+cYNGarGb/EGXZ59gS5e6gQvP7SyvAAOAEyUmIJTqB4zxZQ1MkDk5bkOVHqlC9qsf8fZUTCy/xQDHp2V4+mQnSzbsuKh824uPiFD8hswRmE4RiAWC04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDjqaH/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROkDpH6M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDjqaH/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROkDpH6M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2BFL3606096
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wkhBnVjbM3JY3B0opjjjkl8FAhTrPiMd5ru7dvb/3m4=; b=aDjqaH/Zi7IyEYUn
	eXHJf5yG0fLQD+Vw0ezLbOhSJOuAbHnGa+J7DgmpQU0JQFx2gaE7o1ItDyfATt/q
	Z2v3SLcyLIwiQn3XZN2rPY+rQm7TGSmuBa2uyWTmbIDmxKmXyXn0QKzDiAnMQMLZ
	gJwWadZhshkHOReaugMW6AViCJuqo1Eu6DWKiXjhLrG0hZy42MlHwev/HVipCtT3
	wt46NC64SDM89ga5vY7CKSrIUrZRFQdIQxAIOH7hy5+MsoI/YQ4FcdHHMxXBx8C6
	+ylDzL20aTEgIOMb2xSP6uxku6QRvPHxqZdhObarQevIFMHhmxM3mP3Wu4fckkpp
	vm181w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esar14n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:09:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936bc854d04so14066285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152161; x=1787756961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkhBnVjbM3JY3B0opjjjkl8FAhTrPiMd5ru7dvb/3m4=;
        b=ROkDpH6Mmj5AkaksgtraAkyP1g41I+Wxa2nmyFyAn4p7ICuiqSxQtDChal4h9v7Co/
         9rKSOPIuoxHdN1srM0zbtonc+ExtL9nmGOzb/LW9fLQAKU5sYpCR6LgULBsc9V4YB432
         xp73H0rJPfVeGaqYEv+w3Rxqm7IEb9ujGU1N+GGwRGIwKTm5BgTD37yfbXIDiFJKfFRe
         xBsArXqQUJJgHZ7ps+qP58KPZi0eRXUdFpy0GBY1clonAW0VlDxc9gDGVttxAhfimo9U
         ksgD1nWHD/7ocNeJ+XNDlDHwpc/+E09wny7SPtfW7Q0+r9bqq4BhKG3Vv0pslpXUdKm1
         0jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152161; x=1787756961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkhBnVjbM3JY3B0opjjjkl8FAhTrPiMd5ru7dvb/3m4=;
        b=FvE00nwxpaGeo+dUpZUQDSEmWarJ+2El3uCxlOI9mCylxeyIpM7VQh1orfRkbvBX8g
         Y6quVQm73RqY0UAlqYEQphMmkZr91suuP2vgIipWigfPM/NPNVMSswzTAZ9WkkYXaD3m
         5qksbOLR6MfZmoqt8tmJfLWCiRbvhEm00aUz4PDGxZF97L3N7YexfXyY6D95WE+fyRCY
         z7VaoqIo5bcB9FpTyETmCMB3e9j4DKS16jwMAaHmDkzL0hHRfdsmLTau1ZK9S00zzlU2
         dSf/EmLhq/TL1l0BfGY3Rb19s03HlHgBK2GuNdFKSDTsPw3cN+LoKnTLVd1JX8dvEEZQ
         gGvQ==
X-Gm-Message-State: AOJu0YwdKHBadDB83dlY2PaaZBpySgY7WWQrFhR7lIUwuXsSatnnCnT1
	i607qA9Gz6QXdzNItX9k9qExXmUl5QxrsIq0cQxlFxIOjwsQBErMb83qm9hGOA90drutrQKehfP
	jNdRKlsccwfH06iwVWNZJdplgoShtjTpAA0NvqoOO1DVv8lRWmpCXIeds7ox3GpyweVGx
X-Gm-Gg: AR+sD110IFBcdrnni1GI4AYekKI+ThbQCChtU38oRFm+UkqfsbBD+SpjkPs/8lv6blR
	0tuLhocUXvg5juidGpjYv72EpJbRwyHOAeV2Y23QbDjLBxh7Fg00qFiTjX+C88VfGqyz8Iy12SS
	SBddG06QvNQelN6fSK/WKivaFJMKRTBwTGG84Faj1gMpFP8wWmgObS6XecTW9K7yLN2HBVdBFhw
	i0PGcrxD186Qkw6bF6U4B0JD08aZeLkk8GfhHaLuof92OuE0DRd/X9vDFWxBQcGbn8OCLbIXCY2
	L4Cadw3eYx4cIT4vmuD5Ku5clnHPpfx8K0w0Gy62+RNnbzeDFJKAE5G1YleA/BIwAAjcCVyZx3C
	57Y2x/oXyyFgzAoK9VtecG9Yc
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr338406985a.4.1787152160997;
        Wed, 19 Aug 2026 08:09:20 -0700 (PDT)
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr338401185a.4.1787152160527;
        Wed, 19 Aug 2026 08:09:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c244b6a5277sm21594466b.36.2026.08.19.08.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:09:19 -0700 (PDT)
Message-ID: <c71a82ce-b571-449c-bcd7-24f1315e96d4@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:09:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
 <20260727-ayn-qcs8550-v9-3-e3db456e10e5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-3-e3db456e10e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXwDMeoe5Zv1ki
 UuZk42VJf7/WPSGriJPGjVr/06E+g8g2CCoxvFqJPR+r/s1ISK8JZ8IzL6dfAcDAKCuBM8knMda
 L3DBhRtMeAtCvWPhEukZ2nwBqi/6gsI=
X-Authority-Analysis: v=2.4 cv=fKcJG5ae c=1 sm=1 tr=0 ts=6a85c721 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ePn0xV2wtYfU2OeEI88A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: zWq8BqOgltUuP7ZVO9TlaKcbEN-cqSLX
X-Proofpoint-GUID: zWq8BqOgltUuP7ZVO9TlaKcbEN-cqSLX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXwi1RqJxVwknk
 UX8PVZk4LVmPnM3SDvUcYa5IWGaJ1dxcZIivLjEIYNPp6nrwydVxIV9nVQ3yQU5Z2F9bm0rpOJ0
 e1VbipsuPV+llaQ1cUwJCyRDaw2vHrI8nFwLP3zlHecxFGgzjxsEiiZZsGnNfU1b+Q71PYta2JE
 Cg/Eshct+sOL0w4GkoYOeK31BcP9xt49S4pMVSVb+Ip0kAH2Gn6ExGVDH5LhIZIGv2UGkGbsGlt
 HCkdVL4fWVkZVgZp4uObhdUNQVLaobLf4qO6nC09L4BpG5YdE+VrukUsGvOs4ZhXWmDMEuC7BtF
 6zYQJtJ1+JIJfaNwjQoofJhJLafyJSSoD1HqkNnp5Cn5WCf5kwan469OBoIndUbDwJhmlKqTCUL
 IBr3Qzh/o3GLlxb1EZ4TDor0rHw2gPthGRvCzu5HQAB0YNXrFq6l1KPxY8oLz/wz8nv6ObTY+tC
 YmdFZBO5CabDNtV/WkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190118

On 7/28/26 2:20 AM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> This contains everything common between the AYN QCS8550 devices. It will
> be included by device specific dts'.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
