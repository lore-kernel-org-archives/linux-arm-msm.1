Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D9B3E1CE8
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 10:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986578; cv=none; b=mVWxf5hu/LTUkgzxEP/HiQvkQLLIraInDoOaou72QVwPv339J8ZGLlvJxvWUT+gb8zlj7dKhSNCF7c5Mlmqcfox9XHPizMW9mrTVGDQfL9hm5lQ87rhRbMaWvnixQ5wL0ElLAIAnRIPrmscbKmok8emc6B04MCEg5w2POmQlCpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986578; c=relaxed/simple;
	bh=zcOJMzXLl69/p3oVhEE7hTMKifMoLsS/KeY1YBgSWAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EM4qTU1X2cNjZv2OzsQZS7X9wePweDTQCZ2K1G734P6SIxn+6iIYwivmUaZz3TWbfq0S+mfTYVO4TCwumM0VaNG+zkh6fIIqaRhDRQ8GZGBbuaFbk9lq92t8UBLa7Ic1YbFqTuI/zyRFlYJUNlEkL8RIrqZrnHrV26uaCc7JB+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUlzHn8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OI6iOVCR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUlzHn8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OI6iOVCR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79sj71624338
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 10:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	er85m/VpcaNBY8p0HNqxGDH04XxFCaQjcVPnP1W36m8=; b=LUlzHn8YRnxEXbvJ
	XKG1aPrc4ADfe5ljDpO39tdY8iQBQj3etE36KwnOG7OI33BORLbPEmIHiIhaH/yB
	06UpGp0i0/pCDsykgV8t1r60dbrVjGREQesKRCOiGG5x1MZnkytdgxkf54fN5o/v
	rfZlF8i0nGphho/biw5plN7bUZYGqQiXW/Be+z7/iQrErwC29LTvBziqo3fCoyAc
	RWnwZMBiWo1j6oEX2oS/6g54pUVsXRfu0uNSZv2Prx+ubEwVyiMg+65Yo7trFjp8
	JWCenn1jAWhtKLKbTH36jlcybklQtb7+rtYuME5LZ59WlUHtCEh3aCZd1xXYUxg6
	YDegUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wsvt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 10:29:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so4349471a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 03:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789986576; x=1790591376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er85m/VpcaNBY8p0HNqxGDH04XxFCaQjcVPnP1W36m8=;
        b=OI6iOVCRiUerF/RG9pzGJtGCf0l1tU+/ilM2Yn0+At6WOYDjkzFoKh6pXax1Ffu7bE
         rDlyYLNtYMEL4QsnVb5zxEjuQvXt3PljUplOAXiFoElbvvmrmAak8TmfXTWXnEIANd6l
         /SmLFjXAG2tkmualXNtIY/BbX1XVlysNP1/cEVrLjj8UJEAN31fQMCyM7rUb5xeMBs9M
         OuizTns2gTzPxKCmrz4of5BV3EdEa6f73t0xxguWmatmZNjFlC2jbEeJu2HMfGjahcLV
         xLVAC2I5Y4HbwiUOmmzk77Xj9xY6IOONkYgtE9D4nwNnr9Q8OccvO7nytjwGU2VTQDdF
         ULAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986576; x=1790591376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=er85m/VpcaNBY8p0HNqxGDH04XxFCaQjcVPnP1W36m8=;
        b=WO7l8lZjJz1mQuUUjsutLuEiGTsXSrviRcoZOKQ/quVSyAEfmJJx1K5k7d4QhuPZRZ
         ULhOBH1meJHVi39YFzoFadzqEs3ret7m3kC55seL/jZ92flZHz7tna4LUCii1r55zdeQ
         nhaj3yKaoE+O3ywtRAEpxx5ssdcfYU7qAFhUQQMSJLwVDCvjshhFdWU/a3+WHfj2PM/1
         GdqC8tGf7rbyHhtQstvAV4AIgrjz3vP8QEb53jldjuiJTXgGULygmuV7xP49/G4R0mqK
         LFJFGHAaIqtuNXyx0QbA0jloQl1wjKdtgS7wLQWxXpDHFHT3c6qpBemVa/Sr1f69cO02
         MC6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzELqO13HCceVB8GcWWUE7Q6Tcf9V6n8NX8KT0EcCLrXokwLkp5Z83PrLGMimLAyDBCTu9ko54rRO7fuBSK@vger.kernel.org
X-Gm-Message-State: AFuF++lHte5fogA0H2qj3ldFGsccyTfcjky+IvN5fKfbKXI7wNlE3VNt
	Douur9VtX5762MQxLn2W1JdzoH8xz0LTdQX8iNrSAN0r5b8za3jqhC4bxXnrMTVhcoiEnGGQySz
	b5qU7z+H5KPeB41ACUKMzmlBP5SHWr6fKPLwYNVQO40GAnV/j3Jkp4+a/YAoRzKvpv6q2
X-Gm-Gg: AYBFou0wOFXVaR9DHMQLnOuLmummXyJpe0N9vSAGPCbZMxi5iZ3fqxCKzbM+mif5O7R
	pAIZopPYpV2sIv1iGV/ZWP9q1v7tdv6ijNgxeRNyJLtoYFJeEh4Tr+QwbDODBZ6NftGVYYIwcqF
	edMg7BOJNIrFkGLthYqdDEyDv8ieGMyu5cwnzCDZ2wNAZrjsM7JUU7wte6xa/rgKuDV53o7qrdO
	fVpLWUbvdF7ticAxyIdTku9wLz/Ch127G0yNrDnHJmxk2jNyhcade3xjf2oTUFqabE5WPljjORQ
	m5keJBfFsJsmWChBPtiIuew0h4R4zCynobplvOCgDe3UOeY/rdKyemL0fVUg5/y1oTa+WTQqK2G
	sN9lLgqduXuyB38UAd1i8Ov9PKkCXpc8=
X-Received: by 2002:a17:90a:d40b:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0574f5cf6mr1247978a91.39.1789986575763;
        Mon, 21 Sep 2026 03:29:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0574f5cf6mr1247934a91.39.1789986575299;
        Mon, 21 Sep 2026 03:29:35 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm29762133c88.5.2026.09.21.03.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 03:29:34 -0700 (PDT)
Message-ID: <0e6877df-0306-474f-bc25-aa7d3fd2f53c@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:59:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
 <20260918220634.GA2441717-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260918220634.GA2441717-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1MSBTYWx0ZWRfX8QF1LtNPlCqG
 r5Y9ToxEnKC0XVZoY5dVJ1Vl/PLkIac7RTMjL5Py5dmKWgYDkyFDqCMfwEMqPQYBZO6DiUGKG1U
 M57zx1AzOkvAHrvQ5qQ+4hhVnZzcM/Tp2dNHyRnpD6CLB7cvTlknkDu+9XxQMTKLmKOahKCcbrS
 +zlpJLt5nO62ugFz5gs9ieeqEdnLCB05Tq93xE2VEq++sWRpNY7jaWdv/UXlGi9O83e+2bVaBkN
 AuHGYdlfd7E8gehFzFWRWQ62mw9etYeQFtV6lwJPSUKNvcN8wyXT0tat36L4FqziFUddf8+MFBO
 ieS0Uo57ZM4BDt73+X9kIA6yOcemNejTFUXxTDqRr9CFOOYCnvCpDAuNEN4y/aFZqKvZiWQkgb3
 tU6PFIkivgOYuImlljzbt1Lpy3/0nMIFW1pa3X2dIw1QwAycJazlHI9Ay2iFlr2EZUIhUJo5V2L
 ItD6a4NUojaUV1+nYQw==
X-Proofpoint-ORIG-GUID: y51Q59UV4JilUQl726lzMabBiBMLZDtv
X-Proofpoint-GUID: y51Q59UV4JilUQl726lzMabBiBMLZDtv
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab10710 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8elzRJZBfmQ5qZguGEwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1MSBTYWx0ZWRfX6woc8xDLPhsR
 oViiN1XJTynn1RvV/tVAFS+Ne3jyjfgavqmM734kFNjxuZd0+w/wLqLcfwLE32brdo2b12KHUtF
 2+NaRvNmh+chRzKkfW/1bEeY1ErynaE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210151



On 9/19/2026 3:36 AM, Rob Herring wrote:
>> +            minimum: 0x80000000
>> +          - description:
>> +              arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
> Drop. Types are per property, not per item.

Ack.

>> +          - description: arg3 (cookie_lo in 3-cell form)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
> Drop.

something like this?

   items:
     - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
       minimum: 0x80000000
     - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell 
form)
     - description: arg3 (cookie_lo in 3-cell form)

   description: |
     Describes a PSCI SYSTEM_RESET2 vendor-specific reset type.


thanks,
Shivendra
