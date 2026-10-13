Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D00C5187D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904617; cv=none; b=VqUsV1owy5QXedaeKBJbiKObhEd5PsJFtPIIB9qywBmMxB3ZzDAjVqhi8WzY1FzFaMsUK6+ZJwsjAOmkHvZOacEjFsBaO+KNfqSoJMQgDvdBgFuIW/b+kBP8WPQglxddp1LA54XetzpA2Flbtl7NRg42d8c2aqeSgQHnqail020=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904617; c=relaxed/simple;
	bh=B7ktLQJ/pNrrqvewQaWggDr4aYPF+wQWTdWkQGGLAWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nMlLjwwrf5Snxn7hDejPVTHXCLf1ge9AAnR32ctf8v9suvBEEJjsso2I3X1yKBuTt/Zte2mqr3mnsFpMwguwrbFmo4gSzIlmfH/6SQKxQPuUmcSnGsEsqRJ8v05cX4D9zrIPrlzuH7VkXh/mmcG/HVnjZEJ8m2/a86HzJ2tTbg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkqT7zeJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJmnbFQM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkqT7zeJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJmnbFQM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3qMM1999238
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 15:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	El24uVnSEY32uH0Qk2AIcyciDDvjht45ElBt3XamHQc=; b=IkqT7zeJ/WV6RFxn
	8ALb8LMf3Z3JLflpolgcgstanzuAS+DR2dMKQ6gbYFPeD7WiD4dLmHdg1veRtWDi
	3mpI3GRfl56GPgiDFBEEykv3qsMg3Apej9+si01FB+BIq/AwXHahGqhvF2qjRaCf
	QA4VX2Yqk2HdJKEc5Hyi+qBzq+GOKzdZ0FgIVSgY9BzIZ1HTyi3I6EMuMO7eUfoB
	WQmP2KXMfg9ljxOHrXI/kQnPSvhXDeax7t4DeIjZmiv2b5mRZMKNOVyWjEFbY1g4
	u6miMTzH/O4oITWgqCAUD2aAVVm/lg8GZl+loXaWXh8IJMZCwEDa5+ApIDXdwVrU
	vAD1Gw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62aaq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 15:16:54 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46509ab0149so4233698fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791904614; x=1792509414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=El24uVnSEY32uH0Qk2AIcyciDDvjht45ElBt3XamHQc=;
        b=LJmnbFQMwaRwmK2L1unfuEP+TCW2WnN+B/XrWkczhbjO3FosrSNt4UV+ZvOJqCvUCK
         RZa1/dFD3dt9ex83UcGDrHnDnrCP8JLNwQI9qR32ssuVnIUTlD6m/rQmi9p8p+zVb0my
         ccys+sfoDJ6c94Mlg6Lb1JVBmaLQgvQdMJIoX+3ov4QerFkbOwSaClHOqFObqTFYb0s1
         vY6Anpe2Tgm7wFmx76nSXyRC1tosy1YmT2WGhJAifF9Bvx5tdqZ6Zayyet3CJzcDTgp8
         T+nN7L+15mp8S1QHK/6T56PDBVoMpqjQb8nW78p2mnzgMka7q/Hzfg6En/E4f4u7NMik
         9tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904614; x=1792509414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=El24uVnSEY32uH0Qk2AIcyciDDvjht45ElBt3XamHQc=;
        b=cO24qvoHD9TJk0D0+mT0BEIYdOh5yLtzhyuHOlj6CGpnXwPdmB8IIukSfle31wsX3u
         5yjR2WDOcx27DZ3VSVsuCFsVaz/iizYG1eo+KMVDkAO6C4/05ODkBNO63LsI4Z8BiNUZ
         nxRZESxdnciZBedc2N2sJmN2UVfmq6wjHg4yW62YMjWfCQgdyqhsIYd13up/0qQzWu5a
         eZyXbBkiaj/uOjflJqg5tpKCrwPF10h5qnS5/Gsu4izzdzWO/RiijLGKoWowF5016IxC
         GKeoZSUAtFV0gAY/JWv0xmsUfS1wAwu9X9Imnbqi5marrnlEr32Lgszx9vPGfLzlTgN5
         RdIg==
X-Gm-Message-State: AFq9FYLnlGksKC3nauxfoxn4fKY254W85W5kAhhDbK8M7qgC5LKQywiW
	6NA93nLIi9X9G+OsokmCtggZcRTq5iPPrZ1l2slcaMngaIhpWbUrOe1OW66p9d+CQhieym+cKyd
	qO/yAs0DCil6tA7ercXOBQwK5lJQv0xFhCyZxtRXMI2QjXc279ln4gTARLJQHMYFFLx16
X-Gm-Gg: AYBFou17AYDloqxq7mPdVl2hZxK7x3EoJHKjdhj8GtC9AY0ayGPVB2E9mgvNAqSuG90
	819JamOc0NW3TGMY4rXDmcVUboQtVo4pvaH5me4b9IA3J62kAwh4jAbGQiCfjKuXDRteD8d29XD
	eo5BxY6gkU9zuw55ziDlqATITacRMMBVJLW3c7/CKcShhd89GkmZcDcewOXiOJ1dtt2qFcslsdL
	RRpf/3L4fSvYMc5wNH7+38cdyIv3SxDyYr9BWGXgpKGr+ehsDDr0YHOqTCxYin1+tGRXsaRDjpt
	qBRHmmfzsTfA3dG1xMugKWujqpSBBh5tnaz5JaP26dWLo4WsdlHgTwiLnuTJi9/xbqV+Q4hnSpE
	8RgdY/hkkWs+gRuV8joF4nlFR7Z4251SuQJu1YCgFDnk=
X-Received: by 2002:a05:6870:8127:b0:494:b587:7fa8 with SMTP id 586e51a60fabf-4a2a896dfb3mr11952838fac.12.1791904613927;
        Tue, 13 Oct 2026 08:16:53 -0700 (PDT)
X-Received: by 2002:a05:6870:8127:b0:494:b587:7fa8 with SMTP id 586e51a60fabf-4a2a896dfb3mr11952794fac.12.1791904613437;
        Tue, 13 Oct 2026 08:16:53 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb4e92asm13166fac.6.2026.10.13.08.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 08:16:53 -0700 (PDT)
Message-ID: <78480c25-6d83-4e70-a9f6-826760046cda@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 20:46:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
 <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
 <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace4b66 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hj7ihxJC1nvnysMjlhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2MCBTYWx0ZWRfX38eY/3/PGuWy
 atKDw8gJmD6imNmznVyBgDcoGS8ytHD8I1IU21ixXA+A4dnLvw28/BHzh9e+z+aEwwp/Co5hfrY
 9JdtuhP60BcLi/HG6W9VQKwvulbItA4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2MCBTYWx0ZWRfX0H+THsZYryXp
 XYpu3jGmXX+F5QtdeTPJC7W1OjHf061SB0XtYpFvpi7FXaTDhXaVFvft4qElc2Sy/E0U/uAh5Cm
 5OC81bokfJ9kKoicEQw6+zv8LgX+7hP4z2Lny0kk1g5guCk8I3dWMeiNBvcpF+phz/I0Qj3mqIO
 hImdEEZM8dg2yJHXA7UAx/CLi64wdmdOp2k+Zo9UE70W1mdKx01NxhnYvUU7js6Q4I2MyEaYu6H
 RC3C7PkJLmg2ksEbEmDtj99YAINyntP8+KtoG2eqjybS8muH0ROfJM1IsHWe2TkvuG6OET+UxLL
 DiYJqDMyGAapIe9y06UdWbT8JQyp9rrcXju0JYzb3IseIZ8rc30PhkIMLbXBtEOmxUWRKwyxxqj
 MqYzT5GKMMlSMCVLYpfJS4aAZIB0sO3QR3jeKDNX+e8T1vjED2lZM9wW+WizS7Na/UFyx3VRX87
 q8NTcXMcbM20CAedVWA==
X-Proofpoint-GUID: lq4jurx_EelzJ0lEWXMbcv2p2QvpGVX7
X-Proofpoint-ORIG-GUID: lq4jurx_EelzJ0lEWXMbcv2p2QvpGVX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130060


On 10/13/2026 8:11 PM, Konrad Dybcio wrote:
> On 10/13/26 3:14 PM, Kathiravan Thirumoorthy wrote:
>> On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
>>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>>> share the GPIOs. The board has to be reworked to change from EMMC
>>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>>> and include it in variant specific DTS file.
>>>
>>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>>
>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>> ---
>>>    .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>>>    arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>>>    2 files changed, 211 insertions(+), 64 deletions(-)
>> [...]
>>
>>> +
>>> +&qpic_bam {
>>> +    status = "okay";
>>> +};
>> NAND is the only consumer of this BAM. Should we move it to NAND DTS?
> Can we enable it by default? (i.e. is there any reason not to?)

I don't see any reason for not enabling this by default . Since nand is 
the only consumer of the BAM DMA, we enable both nodes together to keep 
the unneeded devices in disabled state.

>
> Konrad
