Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C837368D74
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269066; cv=none; b=d6Rba/qzHkeizkxc5V6YJksCk0LjX2QlchHSTqevp4QqkgU7ldCjtGj+JlicZDOljsU9Df4ohmVgf1wNK91c/ytPKqbWOIzBWXlCfldk37J5TR48KxP3/OQdoY4G2Yl4tUI78Lz1S0fKiBDBkjA99MO6cJkwgdx1j/hPbIze3Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269066; c=relaxed/simple;
	bh=doEy6iBYhjWO+1eu+FG4HEPb/8Dq/l4nV0w0yrASPyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6wnePwvtzU5ES7dvISZIem+jfMERIvYYhs5oDGY8dAX75/W7Mvkqpxh4AxyGQjSRj238KTYuxZjgdU5aAN+nuVffPAbUHAtx0k8f3OiFWScDyd80elhbNlbpCWPLGGQkZZH0VW5lbo3Fk8JFyTmA7hv5WGHKTaKLVeSS7fZ7us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtpLlFVC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrmMa2fr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtpLlFVC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrmMa2fr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJJjA1136765
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 13:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fK4hoq5TQDS3XikMTWs0aodegmSjlooccPriMdi6b7Y=; b=BtpLlFVCVUNzxEYI
	HgGZSJSdQOf5ayDt5hq+IOANbHz0Vn6pG9Vsq58d1AfZTSZiqYiuXyxygNGE3xQc
	lA+79Bw+n5jXcB4yipulo8IYpZfBSTTw5zcwqGhVdakj/DX98Vmiu3d4z+qO9kE+
	x2c/SHpr99RlfuLqxuZUCu9rWkkT4kUgd5+u8tfe7G8Jk7t4aWsPvApx3vW45Xba
	9Xv6iwLE5NUZrhOx52WIGQP0d785Wi7YfJStxsLwNoV5dJrJ6hQXKy1dYCU1dKLV
	dsx8pCQek6g1+g5gTB2F1gYPp65Rx0zxpVzPtIQxRzQego/2TRvjdA4SCH93liR7
	ESgwog==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsj1vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 13:24:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-784f9401a7dso127618137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269064; x=1788873864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK4hoq5TQDS3XikMTWs0aodegmSjlooccPriMdi6b7Y=;
        b=DrmMa2frw3EHHahTc1/8EMp2QTmLW0uSh463iIL65jIlJZh5v9W91oMV1gZf+9rbPw
         0hss4FVaHt5wwGb7+M+YEpWL79pGfTlxyXE1eigLMgjK1lV6FqasBi/PLEkglQ0v+mv4
         PbYxL8dY5T89ciMYkeIXHhlhTEAryQIVeH9u2UiT7EHUDIQEdjBYbtIyA1kMB9MSvzTT
         2Uk/FLg9BLiGUqIpui5rYpM3G0IW6lweonc9kR4EGP60JjwOsq1a0QNG6R792Z80yzhy
         WBLN+kZyxJIiYzH61irCsukKZm9IZZqgtKysqV5bWIqqR6yjvpvvfHN6H8wKit0apNj+
         kPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269064; x=1788873864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fK4hoq5TQDS3XikMTWs0aodegmSjlooccPriMdi6b7Y=;
        b=XaszxRs+SWjSesHRjl2drY9f5oBbexsf0ZWO1raXe8m3mXSW7ygtEVKUiZVgAjzvtK
         g+E3sk4ya61xYChexTy98Vn4Zlv56yaYnFMWiOQXf+r3ChZIzXpKu0GZSvLUPY8nWytV
         DMsO5RKGH0H/bjYDE4JAJqvqHuJg/rGGA5gkRQqud0+Udtvccwhad4vF1olKgJ2TS6ch
         4jYCGQExOsp96Y/5NRKNci8vC9OXNR8K6A7hVyVra6X45u3kVLmuArppNYbH2b71xbIx
         02PpsV+X5qxr/JgBlB4H5NAd4LNU2hJfRnQATeEStSREoYzaJkV7n8XdQKUf5p+LWdmU
         CrxQ==
X-Gm-Message-State: AFuF++lDv+Tz1JLLFDlA6AOyzTFpkhINnNtEF2V5UehrFLwHX0MtnzIo
	EKXpo166454oukr59cOZpGce/LcoxGnOA1CwvK5hYUsLpWU04hP+x4E8u1Qdp0PAyGTnj/w+fL7
	InJ40O/he8ZFt5YwzcV92rdnlG4u+FPRq5ZSkw9sFC2oDZG5WkER8m/hl+Z0ovsCEB2uQ
X-Gm-Gg: AR+sD11KWONDoETpKp9KlKEWOrby5V6qAfJq+INlgVrbJRtfEzu0u5sruRyKmDx1hEM
	WAuYfoZraO3Yz/xzUyHCSX/6PDWa+toDznNRJoK0wWsUjXlipZVsoAd5FSgtgbWN3dYqrzlZauU
	FILFAnwnK15n60FH9LycIKVZU427KA3XVVjsz4Q9SLOtBbk4pcjrUIwUrh4bnhYVVHA3k+j0wgb
	GCEBlYU+tEC0xh9r3KG5/6GCNW+c6ghC/aOHeneMNxqKd7XTP6WynZh901ZVrgVaGjZG5xvcIU8
	iPwtkeARA/WGcmSb1S2yd+gIX1clynS6xW77lFxYkp6j8KAAPDWSD0A69baMs6CMgyaRJhoZert
	mBZBJLGqo8il6eHA9CkrlLw==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4431828137.0.1788269063572;
        Tue, 01 Sep 2026 06:24:23 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4431799137.0.1788269062980;
        Tue, 01 Sep 2026 06:24:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5a53sm2874355e87.8.2026.09.01.06.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:24:22 -0700 (PDT)
Message-ID: <3c34164f-08cb-4e33-af8d-c5d19012a1ff@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:24:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: ipq5018: Enable USB
 Super-Speed PHY
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-12-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-12-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXwQqQfR/xBLFS
 gg/xoS+3jIga1aK/wGUBEUU2vG7iS0ALc5PLvz6Jd3UTGIhU9xZTUsWSNe0rvUAayzDwQq2VNqB
 1z6e+7XCZdlo5rhfMKbuR4/1+Kz8a9w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX0ba+zf/1yqOU
 F2Ko0sTvX+wgB32OlBvzGdUcL4b7lrFOhmJbw6EQ7jaY4Vl0iH2Z4suGrtrFgk15WFh3D7O8fHR
 ukJAXoily44V4akwQ0cSonys0hHLz519xKWUH1yLzya31GMPy0gLyILm5wot0LLwrOxmxIkRBzs
 bunqRsLfh1sSDljAjJg8JxrcCj7so8TtChNxGvFXky07a6/M8CW/FObH4eIh9rDeoqL+Sy68qto
 It1Pu3T/Y0w6ppeWu4yGa69M5KDNzc68bw4aCiy7G7hz1A+O4kGKVBeINt2WMmRwHfIbKtmJefs
 rWGgEN+Q7ELTuaOHVIo2At3MNsgqA6GbiseFW79f4zJ7fkI75hfLgvXp+HmmkO9JgqvtjYOhCLH
 reISESbaIrWOBA2EHjooTsPWMAfEdsItIUjzhAtOHM2ayiSZF3lE5PoO/XyRdXLV1LMasTINp53
 129UuD2K73xIo/Ch4wg==
X-Proofpoint-GUID: INhXNi78gfJOibUppntiKqthmEbIWe72
X-Proofpoint-ORIG-GUID: INhXNi78gfJOibUppntiKqthmEbIWe72
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96d208 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=_thwKDryVKp783wjlzwA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the 5V supply regulator and enable USB Super-Speed PHY support.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

subject:

arm64: dts: qcom: ipq5018-rdp432-c2: ...

please

Konrad
