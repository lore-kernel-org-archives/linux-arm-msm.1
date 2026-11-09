Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214265;
	b=IlDCV/GbmkLBPzAcRIj6iQKE7YWPAGpdON14lKGfD9PcPTz0IWDRxoXiOph1UL0v6aoi
	 zA1Jn706Kp37XwsWziEqxsgBbPVvs1DPOYU79YmttqlUnOx0lGfxdK/EAAZuwBKyZ43Fx
	 VtkOUIj0u4hg+DXAwxF0F9KSyE4mh/W9JCajW7PPQWw+Rr9dwETbWHSDt84B8u1Hj1z9A
	 gYYLrgwulFjxYxHwCDBSeFJI3bU8XbVmzAFMGxOwY5NT0MBd9dyxc6UfjvnlmK7+zxdIk
	 sOeLWw95Nt13+FhmIbxo8/DE7jslhrHdkZvOHxaYb0+JPg407ygZlguYGNRLD5KW0yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
	b=I4fTlmWybSwEhmR+BZSHdisby+lYMGMt9SCBjTUXrAIdWuPGi3qqAXGYY1G1+mzyaD5+
	 g3AMbLj6zgEqsLAmDlQwsrRnnnykRc9EawA/NB216ZyHwBBwT/RT0HSz+FVzh49l1gLed
	 0RYxwYhbAdJdYmgsx/oL68bmebZviel4aw0vkW5YCCNkEkZGyfa8ft1H/8BL5jqbXitrW
	 U3urOYcG6vUFBM8xVeciY9de3PO+nV+fVgOqjVItdjGShfF0VIcSsNoK9sX+9oWbZSLcL
	 c0BxeaqIgD8KvJYXlTnjs+YXj0AAGKl39vyNNGVnoncTXgfOO3aWs4ItQ7CLFgnhVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjrSw68y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP7EsUHX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB4C606EE9E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB4C606EE9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjrSw68y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP7EsUHX
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969vPo401457
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=; b=cjrSw68yVIWyLr/e
	xwi4uJeVc9sKtHO2Xr1mYmIH7z5SlQE7UxfRuNJs9f9tvHYNZ1YItIbo/mB/V3+Y
	r1Ztf36xojPxSquwT5XIpkJzpVL+7W5IguF1hckFJtVxPYWG82pSA2Nq/q4on1cK
	5wwkarHShHogSjHBittWPna3/BMZt49ns3QHBpYNixfjFm5u6u1FXt6XezwDRXsg
	ptskg9C5EwJSFo9bCpTTYXt1Jmjbvnhgf9YECn96QMFuX7JFmJ8GKdZY1NQYPW3u
	bz+lu+ZJaalA8mHfH3r6h0BknwNXeRZRIsuLr9o1CO+Ue4O9wDXOvc1IGo2W4XA3
	U9iXkg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf5u85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:51:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36fe0b57d91so784005eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214264; x=1794819064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
        b=UP7EsUHXjxAcRBKAOoYsVd+lU1C8nKSBhoGcKyHouS6aedfgJyQ9vEAFNRDag64F+p
         WjdfHa8yd/sH2luNCUiMI6sNI1nlyHURl4nAUlXVcZYz6FsDybgoj+ur9CcmoWqOkKSm
         ykPNUSs1oedb3gttjjxNIaXpLb6QJRFzjIBccr1gXE2w63q7r3/M90mf1vbna8Sqv1ih
         GYIMJoWcoY7n9tPHc17nauv8brGEJTM/K/DkZLqr2DNyWU6++20IjoN1APRM4aGLTm4b
         R4SRy50Rx6Cq0KkA8O1IC4wOtSzhWG2qRWJmSS91L6IjcWFn7iUeaAdPQHqFo5wxypPB
         ao0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214264; x=1794819064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
        b=JKfh5U48ZLehFMFN5uXuIibHOyNruYUBf0uBs6FIO3fZ4NE3+l8JwXFqYcRSvLbXCk
         qcHUBaeSYoId5oi8zbVamuAmIPGQ6X2rTGBUFWc9TEPu08KXXQunczoARBsbqXoQBzlS
         4SD+7imJLdnS2MyjGFwd6m9jEUC6NBh9dHYxvUrhw85s4RdVGJZEIFL2QJTx6UsvSabP
         fV//uinGjhJ7QSV+5WIU+nyAEfQowdUSn2JDCUxHm6ZFD3H/aLRdLqnbnkyzCJ4ncw4/
         XLZsm0qUg+nCXa2EDtuRfwtCci/Nu/nyaOpgzTI24oJ3elM7NWWVUac2uBK2UC9tkPwU
         lM2A==
X-Forwarded-Encrypted: i=1; AL+hErELjeQlkTVgNtco8ZFbkItRy7f9sT5pGI54MbpZza6zXx08J7+qfJvtXBRnjRerlvtxxuulPAwFygTl9Md2@vger.kernel.org
X-Gm-Message-State: APuU4Z8g6OdOEbzoacZ4j+YLBXJPsYKGLLW2c+Hirm+hJtjwxNo7NSB4
	9dbLywneumf4sfbj1qCr+vztvF336ggI99dpJQDOCbiH3b6M+iHyj93XJJfo/bCuMd4Ey0eacW1
	HytidqYsgOvWwzeV4i2dxt0VTPaJUQCnM6UO6C5icm1Ci/G/D0MZ/JSgg789zennXnzLC
X-Gm-Gg: AYBFou3dOI9rn21Q0pvBav+f+Fjy7ZA0QSEWbEMlubjKC/w2F5ZJ8Ba3VOER6Ar1ZU3
	9vaj+n2JCIdqobi1u9JmbTM9qDnLK52aQwrmcrD96WdOyT2nH+caQ4HvZrzG84gFSTxdtGAA3R9
	gnT4FCVrgbDgbXrr2O9jdr9OvEqWGEnla4O0edVXXYR3+fOXd9yQ5OxuyH4EOZ4gQsvYOGzpp2d
	KllLlek/+v8qwwjaixTmrClR6T3eqaCnsL+G9ee9Fr7gqcI2wXbhwY70A0yI1f8ft8LXaH35sv5
	iaA3H5aCMtqQdz/MIhkONKZSokDYfZUZS0aiKT57k8DwITFW2lrOj9syrQ4wHCL0OiWN5SzSI8A
	pR9xnE+J1dnaJwZ/QG3ceCwyns9CY+R9VqQlePNmHBny1GrPPVcVIqkCLgnmvR39nmbwtiHnDt4
	B8
X-Received: by 2002:a05:693c:87c7:20b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37256614e85mr6020755eec.11.1794214263846;
        Mon, 09 Nov 2026 00:51:03 -0800 (PST)
X-Received: by 2002:a05:693c:87c7:20b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37256614e85mr6020716eec.11.1794214263258;
        Mon, 09 Nov 2026 00:51:03 -0800 (PST)
Received: from [192.168.0.195] ([124.123.199.27])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372656187f8sm10575336eec.5.2026.11.09.00.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:51:02 -0800 (PST)
Message-ID: <a7228569-c78c-4262-a9ba-d355101a48d0@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:20:50 +0530
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <20261027-inescapable-rough-viper-6cd56d@quoll>
 <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
 <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX1f6QHABvmn2R
 0na3qiielnrj2jcFfiafuQst6Kwy6Za+DIhx52wBgovXc4fVuY+VbnMMLrbpGVqDYCrH3octsNR
 BErpb/8PBwxDLSPm2xlw5+UCreolgkM=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af18978 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=kgg5nJQTCQF2KXP9n8GJFg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=IYge48onPvb9mXducVgA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ZT-STITMy0UqVJHhmc6EQWWnPpYXnO4X
X-Proofpoint-ORIG-GUID: ZT-STITMy0UqVJHhmc6EQWWnPpYXnO4X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX9yB72Dbk7zmv
 c3/ve/wuFD2fTwHRL8QfxinYZ/RQEBAbiVWYi7gBS/6EoCV93rPvUOXR0FHT31IsEQxnuFqsl0c
 jFbykS6kF8LO/CGesDYFV8njLnXzRd7pNcotyURcdhSdqtIgGSaKqRSlz3VfTIt7KRfUPyLyjwz
 QCO++sIAMif1jxkhoIvUxBTXii9HYQ9rPFef9P347SL3lLyqv8rrT8lv3Sy3Y/RJWe4bOTWg2vn
 Aq+Y2/yt1demiX4tbKJLak7qxVjkBkc6hBWJnQB4MQ8mhdxAcZOBjdNwJTc5ShSuXflpI1orEk1
 Me4Z2IWI4b71qQYCMK86joy3Ve7GBDdR98F5T64bnd1IooKK8TZ3G2oczK4H7dV2UnW4uNowfFK
 LQDUvV8v0cUi8sqT/2KWPP5Kz8fCpUD9nE8ojcrQ1FQiAFH9B0Nd9HW8DgblHBIIjgdcdATomnw
 2xA4A8Wdt8VBpgMOloQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090035



On 11/2/2026 8:38 PM, Konrad Dybcio wrote:
>>>> +  assigned-clocks:
>>>> +    maxItems: 1
>>>> +    description: Parent clock phandle used to set the input frequency.
>>>> +
>>>> +  assigned-clock-rates:
>>>> +    maxItems: 1
>>>> +    description: |
>>>> +      Rate for the parent clock in Hz.
>>>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
>>> Neither assigned-clocks nor assigned-clock-rates should be needed.
>>> Parent clock is outside of scope of this binding.
>>>
>> Sure I will remove, but the parent clock input is a requirement of the
>> Hardware and the output of this module entirely depends on the above
>> ranges of frequencies mentioned and that is the reason to keep the rates
>> specifically. I will capture it in the description and hope that should
>> be fine.
> So this is essentially xo, xo/2, xo/3, xo/4. The gcc_pdm_xo4_div_clk_src
> you added is defined as a 4-wide divider - do we need to limit that
> divider's range, or would div=0b1111=xo/15 also work?


Konrad, the divider is valid till 15(i.e 1.2MHz input frequency is
valid). I will update the frequency range in the next patchset in the
description if you think that is the way we should go about.

-- 
Thanks,
Taniya Das

