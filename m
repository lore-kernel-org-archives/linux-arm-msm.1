Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8A46F494
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845628; cv=none; b=i26CXoEIEw/8g2Y1Q13N+E6Fnd5MSjl2M3wbl30yvyjog7lZKHrFUUgC4Yln0OE3mw/o8LAZQm/HVqRe5czjfw8oTzTCsm95cZSBYP3cHSla22Pz3gv6/x6AFBxwrW7hE9a6ROtwFasmdPSMr9wvP1JeLLYrNRhMV/tUryl9LIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845628; c=relaxed/simple;
	bh=xxINYb7KRet9mOnV/OAdNEkf2LjfFUGWBGdo/w8M1Bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzD+3AGuijhm53kWXAWBQEfIuHE0zQ5KPzixJvsTMDujmEXVR/JvyNmEDGKMb2kBDlJs5t/Mq9QtAhlQ7/LauAAbLFY0wFMrgOYSdrkT6x/UAFRjwRJq1pCsepq/4J/jkelifEo3uAg7+sROwA7ZmaZ58L8sqIhPYEr91sicpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOLLa0RT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMeS7TNB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOLLa0RT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMeS7TNB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xawp962445
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 09:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m+xEd6CKXKcA4tmdjetXgdA/2bmdstif2pLe355Exqw=; b=EOLLa0RTYRvY6Huc
	mbIsw8fBa3/+QjNRKqUH8/rAKJWdBWbZ0pAJHmLEn9hqyEV/rxVFkvmTPD9TjMKi
	gsFVeseG5UHUSwQCvMbPrpKtz+i9BsqPcjTsarUaq7KQHzxeI291ZGb/FDkixYJa
	KggUaq1Xt/4s14dD0Hhg29FRPXY97IK6zMTbt0CAojDSuukCwyewkI91d5QRRw/+
	G8mpGvMt9TKMo0+HHerbjOIv7P0p1QrbNVZJUEelI6zmzff540KcvowyOGOd1Eg9
	SFyK2CjmLFuBRs7TI9AuVEQC7YUvUZPM0cudV11ZkR041HZ1QMj/xYDZdBsWy4aR
	wBrBVQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcu7vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 09:07:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91202bb99d1so10005066d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790845626; x=1791450426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+xEd6CKXKcA4tmdjetXgdA/2bmdstif2pLe355Exqw=;
        b=NMeS7TNBOmLzP9ovh135t/n7humiRek9cQzVCZoGgKbLuwgAg9CEZLAzjXAEGFzj17
         +/uMcFAFR8Q5vvRiCegrHzZkpl7+isqsLW5PkJbPCvyzUa/ZzzR45KDPj17MWTm8JcuJ
         bTHuqoiwoKTHwAKQl/LeX2bWB4xH5/kupvZhSocLurIMG8O4SoaSoX7LKwCvWZvahD5U
         VJJkMwjFVH6e41hq+ThUdqpmCKq+gPnLs3WW1rRozO0+pKA8v8eLZxezHYpmb26iUwiS
         R2B+OKcay7DoVaLD71ywQuDOYvSwaJL+/OUrILXg9Y5xS91p20mzIMOcWpNVtWlIeetw
         +65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845626; x=1791450426;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+xEd6CKXKcA4tmdjetXgdA/2bmdstif2pLe355Exqw=;
        b=TQGAEcfbbLOvHk0DKEna1vGZ1SMai3JU2rxWItytnFEY4VlSrXz0oPH9NypeH+Cvc7
         f0lPwxGo3WWT1/u91eeVhJ6BpAQfCsrc6KochUXU2yDzFGQG8XA1WQY1BdKa1umzRuOT
         uHssYg9e4XUYLoOH1bQjoE2mTS8tgK4LHG+TE+QI+REzCUTB3FCkY4vL9H9ttKUbmLEy
         EBtZxAOAewNzy7Pml60C4n63iu9xVTRiiSxxA5XJ8HBaXIXWNT+KgdNqjxnGfgZztOiQ
         L/WTBf5TCXypqq7tsWTZIBTqACLTq7tM/IC27qrY0uyzQtTAy0YKPchbNNvzcyyyV5q7
         VpTA==
X-Forwarded-Encrypted: i=1; AKwUvBxMIQ3vhA1MAtXZv58b59kFpy8VTmkuA2X9BmhY992RLlsBI7FPzFEi/HMsWkp86APKlQUQzltnAKpc7wVx@vger.kernel.org
X-Gm-Message-State: AFuF++l9w2zU0ChLT1aGlUMh4N4AASMWj7NMk/DgrLQAgSJXlidNFdRP
	c6idbO76yIHfkS+V7Jxpt3fwr3jJ8u+4v7VC3lDzRoFtRufvmH5UcpBuR7Z16B08nbL8HLGQyLb
	LvVOJJaOOEdZabESXsbFyT29akdUUkIVCwYUO2tSR+D7LnKWWOSEoYO/joVdQRBe8c/EE
X-Gm-Gg: AYBFou1ViqzPd7zjJ/g7qWtfshQKgyxY3d6dUA9Nv+BVqmBBdNrAbWLB3afQPZuyk1y
	zz/9B/zaQvy/snSpoViDAVDXaoji9SA6O/S2NFOHtOjc+vDaSDrcJ12Rf/6FL4IgZt7H49t0MOH
	UGwwCQYLCgPMiONzdnUJnPQJ+80XxOJDMfoU53NK4jHpqaQUT7cmj3jXA/RYmTPGlnpSm/r5Rs6
	XAIVzGJhsdeJXZAAL6+2Ge6Ud3kZh62G6yU/FaYrJpri4jlew0kb/XJP8jL71cpwtdLIFusAs88
	45pH/QDfjgQm2C84NRT1qXtwwpVP7vJwvzze5QLm9NDa8pfEvxb6TJXBfmpwvBtZda8cdu5v7dv
	9Ye/gslttZk/R8S0sjW84wg==
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr733564485a.1.1790845625558;
        Thu, 01 Oct 2026 02:07:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr733560785a.1.1790845625116;
        Thu, 01 Oct 2026 02:07:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d3f98dsm117803566b.40.2026.10.01.02.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 02:07:04 -0700 (PDT)
Message-ID: <4905ba01-7b74-40c7-9f99-513b26a0d9d9@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 11:07:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB
 support (peripheral mode)
To: Reza Kurniawan <imkyufie@gmail.com>, Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260912-riva-usb-v2-0-997fe0171ee5@gmail.com>
 <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNiBTYWx0ZWRfXw2kTubnp+JyV
 q1BOhzHD9y7Enr1Y2JtHNBWlu9O1zApiFWEDZjwcl33QXHY/jQavlel6pZBHnqf3MaVGkwWQiB4
 0cyM6EPDHNw9Ks83W5z75T2m6t2U98K3EjB6QnPBJrd779PsBX2CVEK3G7LkaeORjxkFtjGH3Ao
 zz83H8mgDNO5DcaNJsZuHSWhGH3+uEkOfMPhO5FxnpaQQgjGjdkvOm/a9B/VzjcRIiGJYTu2y+f
 MrbOH68xUQLfS4RkoHYasF3g/9SufRPltRGsIa/3zKksVSs0sD4i5LREBA+h6GBTtRj66uPmL8B
 bHkIsAZWY8Ek1DXAkXDiNRtpaYjAe9NPV6Wr6LUEU8fPmFMRdLjRBStDYNcWN+HNcIyUkpqySWG
 suaDHh6IAW+EVoiL6xxSHfXdo4vhCQCFYlBEQYwOgcz8qdl8kaMLIxy8qpiha0XUsebiTtI1vEn
 RhrmjTK4Af29LakrvGw==
X-Proofpoint-GUID: JSdE4gMbh-NBOkiPKgDcAcqI8N2SiBVD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNiBTYWx0ZWRfXxihwJIh3BnHk
 W0sUHH1BTf8/vNj4AwlactG+NY3BZ42Yu6p44S7W9+0XLXAgy8QKpWH9ZjJtP7ewiiZmqmYs17x
 wb3R7SdxKgqg4UMcQLVsWwpw1XHoJMc=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe22ba cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=AYGg-ij1XDh01NWh1ucA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: JSdE4gMbh-NBOkiPKgDcAcqI8N2SiBVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010036

On 9/12/26 5:18 PM, Reza Kurniawan wrote:
> Enable USB node and PHY. Since VBUS is wired to the charger IC, also
> set extcon of the USB node to inform the USB driver of cable events
> emitted by the charger driver.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
