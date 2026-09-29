Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB66839183C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665320; cv=none; b=Q1h3/laQ1TmIxrKBYeYHgH8S0CkQIdQcUmNZh9TMMGXnFl4ZytCQ6hEC1xYhYjCLJ+5WJOjBEkKl+U9DdyQxipxd0TddpCqo612hYQegcdUJprb6RlvCsZAthfHIpxYfdLoKp9517do0eZh6jwGJtNJ0+D205++5tcutRp0DA+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665320; c=relaxed/simple;
	bh=ug6onJikPynoPb1/wMm1p7ik/T9fv6Wx/1wYkf2VHzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjBZEbyoOem0VijmJGsBQXyPzeUfIv9rMyETzKw/rJzaUlBX6ID0YH5F+aLiPj5xUlj7UrgCagE6ulG/dkgGUrKnFFQ9cyXDHonRmw7/HifeoieLT6qCKJamjJATPo+avsJGCc1i3goA+gqYTdTncI+R7UHNO5kVo5VPBsubIS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irY5eqh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiVKQ6Wl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irY5eqh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TiVKQ6Wl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47XbF3654790
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 07:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=; b=irY5eqh8LFds3Wrn
	LL7dGqkqTzzsHl2HervKA/a8JLkEb0VPNMlnc7eUuIuk4w4O1Q1cezHOM3cyBZD1
	qyfkiJT05aunzs3UNulukqZfg7QYbjZJ9e0MdcWidmqrdWLbk7R+EWvLgOv3TLIY
	0ofVs73zKfZhLJjDQST2GqWiTP3g5SwO9K/v8dllOkgq6XP3BmjeEON+RN4az/Gn
	n9hfy9SZd2cQZ9950ILuVsWrpoAN2IyRYYjzp76vg3eHJZmXWMt9jGMGjo6jdNO+
	9TU/b+LW38jcOf8x8TAY2lpcK1xA/rgPDkVETvxrI2y76vgm70Y0cVuuO/jY/3Dl
	uBkZKQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew1505-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 07:01:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so37524355ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 00:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665316; x=1791270116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=;
        b=TiVKQ6WlLm05Hr5WoUT4k/jfY5pi/dKNHoOlDG1Np6rsaVn+inmBvckCaVLUK7ka5E
         Bx5qVQA5IJ0rPMNE98/wBrdIib5JETVU3S//uJgWmkD8re7iSfFD7Q9zLS+zr61TBhED
         PgUM7zKi3mYPcVDyxcl+qlMwfjONbuS5TTjmWkG28jhdNf/uEcMDX+Zz4dfpfgTqfAQw
         4Yq28uG0eaDT42iTDFOVG8gSTZqFmIwwjdV098W15GCE2ytgi82CWZ4la8H5BHxOHVYt
         gtfbR6e8rcFebMgCOfdouVp7Cgd56SiQqrN9DkuPx6jxbJiKAxOvl1nmLNjL7rAX11d7
         LBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665316; x=1791270116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svb+m8PamlTqsmvxTmKIajGp/QN753GcXO7TLKvbr4U=;
        b=X4B/XFscBhj6RXfGLKGLVS5+Z0whJVl+K5aMB8pIRG1cpFVjMdEAhD8+qx2TH1ujvV
         pKC9+B5VGaOMS2qpOAS7uABkgywaf5gv9fo2Bps66S48+4FcaSmYdqawYFH56e8ZSwxO
         L/zxEyCZbAcXJJW6rOjJ8yS7PrBggp6/znunkDMuQv1pGTZEg5o9TSudQmZm/FQmBPij
         DSXmS5/1EuLeq2LSG+/n/KcrYFv0oe0rrqFbYObnBff1xRwJtEimHJeQPuC1U2PmRlR7
         sso3SgwbCkfLlH6piVz3I0ST4pTVpih+UEIkziBjcEW42au+wyMTCSPpZPSioVsLQ22k
         rNZg==
X-Gm-Message-State: AFq9FYI+qi9re7koo5ep6SZkAELKriMyw4c7PZf9xB1237781d0AnhaW
	dLAU8PCDLtMg3eIOsy5kCPJasF+8xqoEDpXyzabdHKUinLNh+jEJLna2IvM5nqkdCy9NBzWti6x
	cRK8zVyDDJlks4bdixsUvTKMMJmW2yU3wvdZI8zp5+eJaJ30PrZaESeDqQ+wzkwwl29Su
X-Gm-Gg: AYBFou3+H+dCTZqO1VyIHXJjyX8WYHuuu96nsHYDfniLBhZbOaSt/qP7RXeurABxqff
	6UBKV758fmr0lg8AQqptB7/SMsb1tnqhole3oSLMWBGqYLTfDo1ja4fEJHefxiaUwcq1n2pckbZ
	m67MhZe4qsvFBqm3P4xkHhv0RS83wyefzDfg+zaP281yLBMfdUY5J/5Ii73MXRy+QkH5tM5p3aQ
	hDKRgQR36NyurSPIauRzq2ov0YOciNYJQ4SwfYe4KtK12DadGDBf8qDvvJX5dYUeCC8gl1c9Pq5
	1eiQaqtW5X96TCGeRLbMtsfMxrNGRSFxpSKCMGW7PHaYllAoK+50XJOYYSssqlwRS7CqTFINS9d
	mxHS7879PAVUkRawqPxbZ2yahzNrBFOdOhEYtcTaCQ1Gi2DxB1Sbk8HQnua/0HzYcaSL7cIiavs
	83cJ9Wu36NZAXtb4KOSE96
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr13031264a91.47.1790665315780;
        Tue, 29 Sep 2026 00:01:55 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr13031218a91.47.1790665315274;
        Tue, 29 Sep 2026 00:01:55 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497d9b117sm3763219a91.3.2026.09.29.00.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 00:01:54 -0700 (PDT)
Message-ID: <c29c1bd6-77b1-49e5-94b4-d8ec14346ce8@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:31:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX2AArS9b9zGEX
 MTsUri7QwyK4Gjvsb8RZ1ZWmyc3/AaJQ5V35tBQZu1XFY8WyoGR+SzEp9KD9N0Z9ghPQA4aj2rI
 sPUzq0izDmJWTkTMeaNEUB9GQYUDmLw=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb6264 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX8b6FJfZX4BN4
 lszlBBVeDbaXLyTgTOwn4OMaHHKhmPSqhGaBMToHK6e7UPW3ekfqanOSvLwBsCNva5NegxzKkqF
 9BIdsfpzW8oJLF4msYow/+P3KacuBVs/wz8AX6XmE+ftDR+cD2qtFu8DkitOdwlv63JU1ydHru/
 37oC4kkUxyr54PMUuUD3rasz6lh37WPcuki349XAhO8P3ueaa97iIzadG/AM5fGT174z2inNaiE
 tectx34/NTPSdcYLM9HoHt51GKngPVPIKf7YKZ82TPQlguM1yRpxw+s3t9RvHgjdWUdEwpxbbCc
 ElKgjJ+vAiJq7lCGZy01R3hoswLhKI/IiKb89dEx8q5YZ981Ljg+47lveY+bAJlCYytbHDElQVw
 JxdinCrYVjZHdCNIWec7anVZ+5SjHduVaHBdcdphKsnPB5RxmRsKpqKley6jkv4ovZgAV9fdCQR
 /dn4Dfn8jk5JEokVhUg==
X-Proofpoint-GUID: RD8lgvsEP6zMVqAEeIIQzU-7Yd0aTBPx
X-Proofpoint-ORIG-GUID: RD8lgvsEP6zMVqAEeIIQzU-7Yd0aTBPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290027


On 9/3/2026 4:37 PM, Konrad Dybcio wrote:
> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>
>> Peripherals included in this initial set:
>>    - Single Cortex-A7 CPU with PSCI idle states
>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>    - GCC (Global Clock Controller)
>>    - TLMM pin controller (110 GPIOs)
>>    - Interconnect (aggre-noc, cnoc-main)
>>    - GENI UART console (QUP SE3)
>>    - SMEM, hardware spinlocks (TCSR mutex)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
> GPT found the following:
>
>> +		tlmm: pinctrl@f000000 {
>> +			compatible = "qcom,kuno-tlmm";
>> +			reg = <0x0f000000 0x400000>;
>> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			gpio-ranges = <&tlmm 0 0 110>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
> This needs wakeup-parent = <&pdc>;
>
> Konrad

Thanks Konrad for review.

fixed in v6 :
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

