Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874653;
	b=2dOgHLrIEHD5YavKoM3rkt81PRmq5KyNX4rI8S3EEQR7fwL5pihtJIR1H/ANX07fi9LQ
	 7PHVgKHJjXcCtHkw3bR54zm1XdFDxaT4icBmCIMzRFpilYzjDlV3guRdB6keaV/IZINUN
	 IDas3vY/XsfiBYlruBAkvu9ZmidgxAwxWpRtC9yQO+powF2hZbbjBwGCNZwb+/4aSItmk
	 np2NJ/kSLzakKK4pSq1oI2R+Wnm601ikg35UlT5AQ7XhC61rVQ+y2zRYQPxV6YyxTMXrW
	 SplqOzlbyx0iTJN0kr8929ayMrUrhRlneQFOkUo5NBovACBswimbNjJ534mmg6spLnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=;
	b=vmNGvmBfD5r+C0x6Xi2G0rJtfBuy67OZhhFCkIL6A+BQPjwbFwG0p8auMxZSn8R+i6VG
	 S5X4WAFpkGfwZUl4iszIWRooJbVrCb5pKa45PqrLDyXXdRCzVYPptdWuO7PCGjD555/Fd
	 P7n4uOjuW/6T+kID2rilVIY+ukfsTIXsNJenKIaOzh5uNkXLu+6c8uBHcwvFvuEAVcMTD
	 w7qyAiBoZ5vJP/N0/TJ2KJKYyioZMy6Tk/t9Ti7SFEFtvfb3UUVGXhTUcdRQuv0sPsfAm
	 ADP1TTvWohHuBkLLPK4wSrWm08tGVGgYgb6QSMFpc9FlATk+CNb6ytPYKaAhF6G+bZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nwAkK7cO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iaFFcR1V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67736606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67736606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nwAkK7cO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iaFFcR1V
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tW7f4084645
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 10:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=; b=nwAkK7cO6SzNaNRI
	eWRZfMBrewvD8gZN1WvfIQyNbkUSb4wBs7PsEeYlWpacGKmt8gvqjN0hP1HggBsr
	VfTmzWqzU/Z+HANEZmH6NtLJ9TZrd6ydK94eJRoCcR6ZYc0YKvQwamb9xOxLSmq7
	XySB7fzbxESdJPAYSTFif3208JPPqt7bUOMOd2KRjCF79f/VdCvODj5iS7rmdcU4
	F+nDSYfNqP+pEs8HqwH6P1mo1WmGJmTR30FScrUmjlwE9bi+rbSF5k+Qv3naLvEQ
	2Q08KJjGvVt/gZxwv9/vMzVM7ffI/RH4IWT0LiAO3W4/HpyMWdzc7ugQ4Qk0DvRR
	+8ckFA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr50c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:30:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so1613658a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874647; x=1794479447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=;
        b=iaFFcR1Vk8m+zKODmIzMhEgra52DEYtUr+SJsMQPvhXcDaxu8Eiau6WLq6yn6RCu/5
         7eCwNYzNqQzmgDNHK3bdffm9QRqPdf4SPVHbWOyPvNK5W/q/GDj3VoScrf48SB5CTycc
         5ttQwioQ6kztqb5nnfj956Vgjf4IGd4X0qLUL89knBtw12P+kONF9TTmDL7iUEyySR85
         Ym/UA3xKRnV2xOHzOFaxMdnhSvnPw1+rjVOn2rULFPLSztM7etUvGxZKg0+FwPr2vsMO
         qgl2Qs/yQ7SUpKLoy4Z0OuZntWBo5EdRxyOdvNlUl/tfEODQK3GTgF3S8cznK/ZhtP3g
         SesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874647; x=1794479447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=;
        b=cNjOOrG23ELOQ6pZ6tayo6KqJyOSZ7kIq5esyC7GIgzGoCyk3Mcn1x9U0KrUyFa/AK
         rNfp4GYTlggRPq4DtUYKa/TUuw4MPOy03TBLhmXcGjcSgULBnHvpkhSZNiphLGpiPb3T
         bBik32C1XR5AKv6J12vZFpQTH9rm4qpVl3XFXh/Focczk6bSDEi+Co1dkXs1FxmOIwWk
         +H1Yjks9X6HUzvE6hw6jTCE+Dmktd74KiiVVognMe6zHTWHa+S/21jXtkLGupi2El7eH
         OMYNKGITTIf8HMRtySbsQ4HfYrfp8mad1+SsKY0zQFbpRab/EVmpGLE+h8ZgBoEEEG+8
         6sXg==
X-Forwarded-Encrypted: i=1; AKwUvBwkJQeefxtlFFDUE+u9RipvYq0YDPoHYV35FXJrhCTybyDhTiqu7jg9uSCUV07g+2ih9KY2SYmHY8Nxg4aL@vger.kernel.org
X-Gm-Message-State: APuU4Z993nnEGniHYnpM/MAK8Gkz2yChR64p+hXlP04hMicHI+H7TCfI
	dotVVd64I2wi5gfz1Cqz3H02XZ6aHjyvQImHw0lffwX2wNX56KWULcwUtGjWG8xDRXXPXgk7t6Q
	pmBbyRVCRAWh/aNlLf13f3EVxiXdaUwU1kzhmJa6JRcPIkSR7Z1ytEF5ZCjuCcNG99E1S
X-Gm-Gg: AYBFou1AYMl3tfsklvKFlgpNXBl3EwNdOpNmqI9D7cZ7yxvRVOj8S1DwzsLvRhmBDbK
	Juf3yAfdUbnHnbphZeaYoFIUtI8C63YjaD7Op88/C/W1TpKQ3na1I8ZNzYO3+IoHXpxQz2YXAC/
	c9CC8Mv7MbRMek8RLJUsTocxRatDcuBVOuw+zrqcLAWpdKEweadBCKcOZy2RyMRrcrJi+XBNDBx
	estGyChQOOJYRfd62F0X7+9L3QSvg8r75Wz3M7vwfxuHPIgfIXQQNVvbfaWlQYz432iZM06pI7g
	fjbFIEYeAYaUqbibLHZsJw4ihGR7HbA4kdn9PizDirxghhHJyixz7qispkqRBTAKLhSFPWa7dbZ
	gFmTE+pN0IR4w3yE4pkR8U2qgdzrRaart8RrrLN4HtztwOkAlWEkUnXyP08c7jEX85AUXeKkHrP
	s7JM16Uw==
X-Received: by 2002:a17:90b:4d01:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3ae8970ef3fmr15692704a91.18.1793874646788;
        Thu, 05 Nov 2026 02:30:46 -0800 (PST)
X-Received: by 2002:a17:90b:4d01:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3ae8970ef3fmr15692668a91.18.1793874646235;
        Thu, 05 Nov 2026 02:30:46 -0800 (PST)
Received: from [10.217.241.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cd6c0sm3232520a91.13.2026.11.05.02.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:30:45 -0800 (PST)
Message-ID: <2b5c5216-40d6-41e1-b79a-76c56c702348@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:00:40 +0530
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
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
 <20261027-talos-lyra-evk-v2-v3-1-658fd5a7ec99@oss.qualcomm.com>
 <20261027-whimsical-russet-marmoset-f248ba@quoll>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <20261027-whimsical-russet-marmoset-f248ba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX78plhI9PmKTv
 VPjpSCtwjN1f2Ef9JC2d6XKG2r+24hsPrJoxut1v+Ci53ntKBSIo/CGUy7ISiyJ1msJXbHJ4zv/
 hlQ5107E5xIIS3J+wgurLI0k4ouqMYQ64AAfXxGPd2ZXLh4unE33dwwpTqnVBuPpZV36vANP/Mq
 cP6k4vVB19rmNe/lSzx6blLX/wGPLV+zB7DN90dKE2yBiiTXCKm/3kqLZqxOqZqJ8HWGTAtZ3mF
 iDX8jlb8SjAwHBpIvn6930QpfC0uDA+2OORZqzbWxQ5EbQo6lrkIsLLyiz1BTFVPutaqPl308po
 6SB27/+iBu3CiL/yjJkdDRDc5wFrX0i5mdELcmDZpyMJ+l66rjMAMi8fsRypq0uhBJLSQt504vL
 U9kmEHHDIT9B2a15nFwFuh89nsb0X17GoJiK/v6zl6xFvuOC6hjOg19/xIUasLpImmuEmQm7ZfW
 v0FZasCLDssFBZWvr1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX0N9oNdRd3leO
 Hz1NT6KxcxCBKSXVzhAogGZ81+QbHGfuvXDmyuETDZfzEmSddH3XpXIQCaVSHm1VkvDHkyyGO1G
 /7JBTBZ2YpfQrUNP3odbPle+tXVXikw=
X-Proofpoint-ORIG-GUID: Qpa0gPGWH3G-yWEwddWZo1m3QEnW84YT
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec5ad7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OzfGJC1uvw-XEFatyoQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Qpa0gPGWH3G-yWEwddWZo1m3QEnW84YT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041

Re sending as earlier reply was rejected due to HTML formatting.

On 10/28/2026 12:11 AM, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 05:01:55PM +0530, Ruchira Revdekar wrote:
>> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>>
>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>> board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
>> The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
>> qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
>> than introducing a SoM-specific compatible.
> I do not understand this logic at all. Usage of same SoC has nothing to
> do with having or not having SoM compatible. Every SoM uses same
> compatible as some other device, so we should drop all SoM-compatibles
> in the future?.

Thank you Krzysztof for your review comments, and you are right. Sharing 
same soc (QCS615/SM6150) can not be the reason to omit a SoM compatible.

v3 commit was misleading suggesting that this was the reason for change, 
will fix it.

>
> So if you have a SoM then it can be used with different boards, thus it
> should have its own compatible.

In v1 patch, the EVK root compatible list also included Lyra SoM 
compatible. And as per earlier review comment that there is no value in 
EVK claiming compatibility with SoM, we removed SoM compatible from EVK 
compatible chain and added qcom, talos-lyra-evk directly to existing 
QCS615/SM6150 group.

If there is no value in EVK claiming compatibility with SoM, then is it 
fine that i do not have a fallback SoM compatible in Talos Lyra EVK root 
compatible list while I retain qcom, talos-lyra-som compatible for SoM 
itself?

>
> Again, explain properly the hardware if this is the chosen design.

H/w toplogy wise Lyra is reusable SoM containing SoC and module specific 
components. The Talos Lyra EVK consist of this Talos Lyra SoM plugged 
into Talos Lyra carrier board. But The Talos Lyra SoM can be used 
independently with different carrier board.

We will take care of above things in new patch.

>
> Best regards,
> Krzysztof
