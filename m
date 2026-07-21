Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FBD4CA28F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646611; cv=none; b=NMxbPPAA7z4f3GdWDpDj20ozo+YMyJtgSsSq/sqfHjqKo9rVcdTce0X4QIXC26J7W0tOn+K2P5iQ0cobly5iYTnquSO1Tclg+w0ffJUrDSnQ9Hql4Vvg+15oWsTj/8QZLXlKKUIH5JHSs1h3g8J5fAuOYL9RT/uPLy0Mz+YvC+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646611; c=relaxed/simple;
	bh=osUi5ANQSKW6zxpnFDg4GdYDSPknTXsQi77Jpa5yPUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLVKF3uY8Lj2AqgnrhHuyG0KXO+JK/ZiqYECVbLh3GiUmxh8hUwVkvwYe4mK6gLjEiuX0eTLLvY5az3GFYSv94gel5yz1uYkvT8RSjTa/e0gMpdkZWldFiuy/LDGZNifRbgLgkBQnEVwii/oPI1wnGskO+tbY2DeZNR/4IV0GXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSpA5Fa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESF8f99L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSpA5Fa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESF8f99L"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfp762962565
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15+AHTyLjpbpDshovEjtdc1p7nuqFsEDH8IjDdAKdfw=; b=aSpA5Fa8Al4wGSHo
	6i3Jcfqt6ps1SZqAz3aRiHcGX17EpL/D3euvYMUPF70+Qaw8ZI2h/Ropbrks0fiD
	2sjH85bNY9w+RJS9BYWSf+sL0+918bsbdh/D+4/Cvvo0/bfOmrOlFHXBQvlGggNU
	QjCyOOHdeITwIsVxaGWJMmGp2mMwN3q3D7CwniDCqBMLIfgNSaiJ+tOIkz0ZAZnk
	RRDod5MT4zIxQJWWoJZH4F1876OFKdpOCm2ttrJTws8AbadiuyB62A6ZEITRdBX8
	lgpy2nnqyc8e0AjtH8I8SmdwjjLomSGMr5lV6j4x2nnW+HMWeXJsF6EeO7/mz7km
	jy+ObA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nssfcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:10:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so178273331cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784646608; x=1785251408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=15+AHTyLjpbpDshovEjtdc1p7nuqFsEDH8IjDdAKdfw=;
        b=ESF8f99LEew2zewwqg9mKFdDkiLC1vuQ+5ybFIGIqC2xAg3jwBJN+2P7e0WRqHGgke
         xX+R7ixFBR2A/Ipx+6vF4iEuZXXjCZoAXHXXvammmWbdMLA/jFmq8ZYxOcQbpNXJDuaB
         MDWJP+5sWAu8d8Mws0x6aNKUoGAnVdMxjiP5OhMYwrfO4ZYeYwdnAocVz5pzNAH3sfaZ
         WxcSDTXVlkIBK4j6Kbr0khrWH2a0xOJ/UbT+lWx781BSm95Lyg+rn7mifRH2ENjb2IAY
         jZcJxjpT2Lq0U4TwJFoD73Gd4C1KYsC24o8iT5bT0tUmvEgkKq8tB/jFRB+TzEca1ySB
         rg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646608; x=1785251408;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15+AHTyLjpbpDshovEjtdc1p7nuqFsEDH8IjDdAKdfw=;
        b=QVAFN+Y534oKyKNN0S58IDqQ+yMo1AQLM3SV4F0oA7ccE1ldcJdYN3xmzewS8jwx5i
         AOUcV3JeO9xlm0Y9V8l6q8wNUY96EGXrKUVaTt6eDDecAPPrQJgMcEHOdocHRbHLu05o
         UFrB4NFclZxC4UMmMT+4do1jEPduO8dW1ZUWMe92C2Tg/CUJXygtNySsCWdhMVnlJae2
         UrX2H7sQk9I03iqysQckDIse6uE3j3FAqa2HQt3FmMrz+oAUoLP8xRn8ZLjoTaI31Yk4
         DDHCY5OSJwrV049P/fJSxMj7ujD1QhPViGL6BGiC/aZ5el99PsVqTQlVWHkDsdkcJQ/M
         /XkA==
X-Gm-Message-State: AOJu0YzLHH8MOSjgJ8oeJMprpkae671pbKEd22p5XxAUXa7pNwRDRkkp
	rBOtUVsYyxfQ/jlVf4/XaPZaXy9LOTMWN6QgUT/z82d00jYgGFOtGNoy8+JXFgpghKR+XQ8/m4G
	4RJ46jfZWGJjYN8VRmeTE24rIpikIrX3WFnbOh1/TNRcnB7PVB6adrljPVC04u5g43tz4
X-Gm-Gg: AfdE7cm2S0qN3tOH1x4QkrpdwcuIOWXjVu909CKmALZ9RwCylMJ7QU3Kv3+cR2VasEm
	sFb+XuqxqUmtIsh7RhWoizAjrH+puGkQQ+L6BtHAbgnzxrUDQlLMEa5JZVPp5jz+5PoofSvsYNm
	13uruTBWerDr2ZI3FnQC3ZWSLFL4sOlPuv8MONpR50hJmHCzZxiH5J55IIDn6TCoCI8xx90fa5D
	I1C0s34t7v5pp4YxoU80t5lmfNCQHb4aaYC0IzTa389Qxa/xOYIk9YXHMRvThmi8zwWSYEPNppV
	dDTQwZhLGesAQbQzg9GnkMX7Iy9hECX3MVkx7PG0g4HOSlzTUCLTM2ElKujDQsP6Aqui8wEm04j
	wg5ZTu5aYOrXIAov33IT2O+hT46niQA==
X-Received: by 2002:a05:622a:578c:b0:527:8770:8a51 with SMTP id d75a77b69052e-52787708be8mr5190341cf.47.1784646608361;
        Tue, 21 Jul 2026 08:10:08 -0700 (PDT)
X-Received: by 2002:a05:622a:578c:b0:527:8770:8a51 with SMTP id d75a77b69052e-52787708be8mr5189951cf.47.1784646607824;
        Tue, 21 Jul 2026 08:10:07 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49564011868sm88085495e9.3.2026.07.21.08.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:10:07 -0700 (PDT)
Message-ID: <8fa3cdf1-dba5-41ad-9b1e-dc5f77bdc284@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:10:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add fallback compatible for
 ADSP remoteproc
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mntciGOLIdyJqZdhdvKG61HskuwDjKOe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MCBTYWx0ZWRfX+7EWAVWNVR/g
 KxFiiAO4wlmHeXwNw2IwKVmmyZjrXg2vupzh7LfP0HKMHDLE37Gg0Q8Fxx93e/lgsQtmBK5P0AK
 E07I5Wt6WAyvneQIg/Duuz4SNDNMlb0=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f8bd1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pKSKXMcIEd6FydBdNeAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: mntciGOLIdyJqZdhdvKG61HskuwDjKOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MCBTYWx0ZWRfX7Ur7/XhiPdRE
 Yo3d9eIZzBdH4826SbUbDcZwOroENK9ZrgPvCRe9Fyy76YWBozWmm0lDa0rkCXFmmfWpyyNaf1A
 q3nOvPNmqcm9yd1mjXGQRwQaBYxrkifQxEslm8AUjU8dYIYZjCVT0yjB3jrCRdxoLpCK3hDLdmA
 ppHLMM1l/vhsB3qbXjUjBmBYbQDv4fxZS0aaSpP3fTAb75Ysb4mL8g0LDgN8luH8qn0cCmHig+g
 Z/LukQTI3moztgiJh4yBuM40QyrChdO/6m2EQ/P5+ruqeJNH4IAvc2AAQUEvRZCxCnXKrWhZ/U+
 l+yNSm3/c7hs81zR45n8xYTfwSUGmdB2NYjLFOn5mQ2YUmnSGEcGugaPLj4uXb4dW5kzE8Pc3Br
 N2qYsUWDS/4hInor2vnKkShBwmASLxhKBWIzUGL2WCXSdSDcaP4FNtmQpxttJx4C7wsiWG/mEkg
 TMyWWcXsJ7r1PJRBvtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210160

On 21/07/2026 13:35, Abel Vesa wrote:
> The ADSP found on Eliza SoC is actually fully compatible with the ones
> from SM8750 class. So add the SM8550 compatible as fallback, just like
> the rest from the SM8750 class SoCs.
> 
> Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
