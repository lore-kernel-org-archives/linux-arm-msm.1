Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B44BB5D5
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446459; cv=none; b=m4A0moUmitiSQdXD1YwFaZCCYsBBl0H/UEdXuDw+d95G/zNqEqhExfAdtZqsQvcHHVVHrFkGfAwXA9RHEENFrPPUm0DpIerGIMbUxpfjSycFJJ7oz+Iy40U+d+v+F/H1vAEyi8hio46n8HcechcoAJX0ppzpDCPtPZtug95h4sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446459; c=relaxed/simple;
	bh=gi9mZjH3jh34DK+gNA1UPkWEDaxFzIUHDuBU6k1qR0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gniQX4MmeuGrUJ1DiKOEWgPUA39nV+grQI6QzWoBUnASdUQBwG3wjSxDUi5hFjAPFYIVqJKe6Jz8nXzucczxoVNC0tvqBpfHFa9IW0YPhUGV9YjWVCoNICxHzRG1aTEVLv3ZNV0KiRCkYVJHDWXSq3c+iUMuphJ44bM6JPpvN/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBK842fY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MabNpojT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBK842fY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MabNpojT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAa25539855
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 14:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=; b=dBK842fY8gNu9XDN
	zoQ/UYkuTkfbiLqEi4fBQCgGl9oyBZdCDJmCFcVDFZFjvnJRgMY9MPDQhoNDCwbZ
	y0mHOy/k4LNRG+bpWh5Df1Wb1ArEMLzE5G4brP2JMUWle0O8Rtgjdhs19Jdfesqg
	cDG8Oer+Vn53UWUFfedl77YW5MjCY7LOzVoIvj7Xkos6DqbkOI0j/TOqTGcwsXs+
	chGCtnybaWc+PM7RscvWvIspRJZLCQ7v03uOvljsvfCrHxSLyBHccf188DZwK+DA
	gExti/F1jJGJsFNp6vObuyiy+HUdCU13YOHDqYuaMxhhi3kNU80Xv1yVmTw4g6PN
	XbUPMA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx12m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 14:40:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7a0e125a6so52736e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788446450; x=1789051250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=;
        b=MabNpojTSNW0eohxwYVrIvbNrQybiLADBH/pqvYcZCYZQp5up5/ToENgZfN6GUiDgM
         CLoIOX/Ira4e+SfJB/i8TR+eKAsGUOUqR7I3BcoXLuW1383i/7Wb5tiI0XLgGcc8GxYv
         DcwCtDDycXMlX0Rl/GJfSKrnZXm/Jc5dAL8Liz1jWh8FNlWtm5j2P0xht1H9hDpIWWAa
         SCoxf9SWoXtsVrElm/LMC7yuWAkSN2S/E/A1PRE+303dSVGDgCfTBWUv33ojRb8ouZxT
         TxblCwGNVpl3xP6hxv4VtESNZ7lg/Z74ECIzfs7nVOZWdFNbIiShMSUhXrnKEObYP0d0
         LnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446450; x=1789051250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=;
        b=UNsBaSA+kV3HnXALE+s20CEf0y4oCl2HejYRqguqrIUleARDuiUIQjEr8UA2zkaGIM
         b1YLvY5H+xlUAR9j2fDa/UWlw1XHdlf2kLAHKrLTQvtaKWoK5sFA9FreVUi8+RSDgDUY
         5/QkuOzBqFgV17MCwXKf8Teo8Gy+XxN4ZvzvClBvFFJ5z0bg968J4P7hDtLXZOo943dh
         WiJYT6eIKEH70is//fUaRbs6AF37V9utwnWGyybwFBhp9rqtG5RV0zDOJwKbGVVcKYx3
         fvfEA28voex3feOVpQ/JUcD/MH/b8B5b92Y5tRCzuVrVxBnsDBFXcxsjYKCaFZqt0Geq
         TfVA==
X-Forwarded-Encrypted: i=1; AKwUvByuFV0lKeYi6dsCLR/YQ3RFp3UpOLPC5InoqF/ZG6ZXC1kagEeBboXZNz661ZkKz7MceEiiERnB+PuNP2Ik@vger.kernel.org
X-Gm-Message-State: AFuF++l+kLLC1qekPw/GZjJrnmXn9QS8JxteZCLh2MfRke6chTBX2Kz2
	6Xsr8aq3vdxEez1VG1bi5iHuFkDYK60mhtC+c2H3a5eeKsfChQd2erFJw5XSCaQKF/KwY0GwWaQ
	tLlMR6xsOOn/8/2WyqxlCdCKzp2vruikVVKIh5PUkxP6yiK9DkEKJtdR7HyXsl8p7gR4x
X-Gm-Gg: AYBFou2DB2SbdkhsR4f8Qvj57KDEJQFKWBUnGeGCbcfSpVOJt0DD1t4VGRsPhaWcnOw
	Tw9jlV7eph5XJb9VzWX7HGnLDiWngZkOr+89lcu6uyV6fv8ZZSJL3LfrsiFYIowdpgeDwUXUN5k
	yj3bp//zym+HWjQ0PlSKzZFysg6kQ0U5ixDQahW9zav94AdRNk2yW8mQj3VgDuQfL4pI6EXFHHt
	hpvacHn/tEQcsC0dmQ1Ay3rQKfOG31xjrviCOFCvPbIhDnM13MBSed4+uxfZqkdhVzkRiF5vBUO
	N/nzw3XNxUjQ0L4Hz60moJlHI5Mx2k1Xa6/tgQOglSIi9DHMm/J9Es8JC81DtpRzfdJcNlWPFrQ
	7aFqHr3NtyHI+ieWQEziVJA==
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr1626564e0c.2.1788446449937;
        Thu, 03 Sep 2026 07:40:49 -0700 (PDT)
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr1626554e0c.2.1788446449511;
        Thu, 03 Sep 2026 07:40:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705866acsm147251fa.18.2026.09.03.07.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 07:40:48 -0700 (PDT)
Message-ID: <a5d83aa4-7065-47c0-bbda-35063034b0d6@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:40:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: of: Avoid config reads for disabled bridge nodes
To: sophon@radxa.com, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
 <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
 <8c2eaba0-c1bd-4db0-bbc8-5ae3b3d9a13c@oss.qualcomm.com>
 <B4EB99E5B76C9F40+e6fdbdd4-5c05-4b98-867c-29c7178a0d72@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <B4EB99E5B76C9F40+e6fdbdd4-5c05-4b98-867c-29c7178a0d72@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TlSX9sIr06beA5WOeUahXkw1U1Xa3h31
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a9986f2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=z2R-DqfiRA8ArFDFZ6YA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: TlSX9sIr06beA5WOeUahXkw1U1Xa3h31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyNyBTYWx0ZWRfX4U44jBc3AKa/
 3Le/zKWQ29HId7PHUolqjZxJAFYT7I/uCCqrlxSPzlyf7ekuBflowh0IAQlIMN/LcxtM4SJK77O
 XjMbyBvd9P/Di+F6sv3uSNNkG76+xgmokyZhsTl9vp4syIPRkNwceZDa5tsvHNXvPdTkZmW1tAh
 Yi/VVMqvZGHPHmE5K31hZ74yvuFx69Guoclau3jSapR86AgbSOcXDNng5zVK0hb3LFoTvtw2Tjm
 /W3tQTjiSb0aebTa76/FU7V/5ydtiQqG3CMsOFD1X9lfbai6m1HjPObR92DiwYdeBSsbtloZdK+
 tSukvIN8AMRO7wwnxNSmrYXkApjw8u/fcm0xo+HCLBtjc9k2ehMFC9Sb3Fjy/ExN37l1SF65oK2
 Ez47xWL9isx6kAUBD5LndWpX9K/RwyVcVmyqQOMhTnTZvaGcr6v0I+2RbyopzO/pIjoBKlM7OcY
 8Ez8xTzUb3X12+aHOag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyNyBTYWx0ZWRfX3IALWUxIquzM
 5JUikNwl0XtmqlIjFWIkcqvcCs2yAJrzuwkOwdlgp5h1Kbgos8sXCycn28pkb5Q0wUhMrJ3VD83
 I6fpesowBLP0s30m6tpqRcb4MMnI5kE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030127

On 9/2/26 11:31 AM, Xilin Wu wrote:
> On 9/2/2026 4:43 PM, Konrad Dybcio wrote:
>> On 9/1/26 10:47 AM, Xilin Wu wrote:
>>> The TC9563 PCI power-control driver powers off external downstream ports
>>> whose device tree nodes have status = "disabled".
>>>
>>> On the Radxa Dragon Q8B, reading the Vendor ID from one of these
>>> powered-off port functions during PCI enumeration raises an Arm SError
>>> instead of returning an all-ones PCI error response. This prevents the
>>> board from completing boot.
>>
>> I agree with the premise of the patch, but I'd like to understand why
>> that happens - do you have any details?
> 
> Unfortunately, I don't have further details. The downstream kernel also includes a similar workaround, so I suspect it's related to how the TC9563 chip is designed.

I'm curious in why the port is still advertised on the bus if
the i2c interface writes some magic bits to "disable" it on the IC
side.. but perhaps that's just how that IC behaves and we can't
do anything about it?

Konrad
