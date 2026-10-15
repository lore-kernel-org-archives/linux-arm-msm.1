Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176E6511221
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060822; cv=none; b=H7bItGT8wKLApwPxSM7RWHg+hiUiSIpbdZ70cGBR3XRnwyENhNfA5bGT0iwzTZ4n9kZpBHiHcWds5KwRaoA2ibX9FEMU/QXKXgTGTtRyIpOSaIay2PacgUs33XB3W5ffvhZxYA1TA1jLq+v6XHiWPbB3qpmY8LDDV0x4sXKGllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060822; c=relaxed/simple;
	bh=wSNftRjlmC816H3vVNI2YUYCRfcrqAPU8eOTfIKmBEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf/EMKdx2rmuKV4wwdmLqOkmgpV2c9oEzvfT7DRkbL9Mx2L3ze6ZQzKk4NYvEHinYRQyoXrCirNQNUSma9thH/GdlJgRUvCTI36vMsTeKoAy7zZE2lhcZQhEb1IaM59XlV2bTYSIIQB9OtmG/Ex3pZD/c7LBVd1zgdurS6Cc3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a30+kFIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iqw2fcKj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a30+kFIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iqw2fcKj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jnf23408836
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=; b=a30+kFIREsx8Qgbu
	iEq6xPiywjQNZTCmMZHbL07xnHF/EGA7Z6JD3asLsAygukqydnnOjWlIt6Gzn50v
	GwsgS+kghaty1SObscPu4YyZ+awnZWbPY1CAq2tjrfA0smLV6ChQ+2keXbgsG1Gl
	DwsV2Aa3eWa9pKRmqmUiqAf7np4LGVk8NQbSbXIGqxlhJlt+KhRQNDEqJ6G3T9us
	pMiaPBRoW7zwEyioMps7ePV/qG8LkWgoipNDr7w7sr7WO9FZv+amzYzfUMqITyHz
	11XDo+7Cs6cM6xKlnt9P5LqfmZXjcdGqzD1zO2h+rTg5/s/FbueOY8ZcGbk7Kf44
	7MAw2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2arn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:40:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f12bb489aso5263885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060819; x=1792665619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=;
        b=Iqw2fcKj2ooCBSARz2rhJF44VkPwItleNPr4EEtsB7qmppscFmKuS7hckCibEtvFVN
         zaik5lFfmu2bLjXne51i3DuaNVRPD1krIVdZ3GbC5o9TJcgA57H4KRm8HthJAB02OfHS
         Iuuomn+BwNCRJrD6ssg6hR3p2/Ep7Bv6v2VGFbaokm0oYSZFDWC043c9WjeCqds1d4m2
         vAknwoLp4yZOE2wb+nFGyc34ScYClqgCG5NmTqleX56UzlIBYp/UIBhGL1p2aV1Ks0n7
         f5dPWHO49QEr2qU4/xKazYvxY1AaZDAzMf5sj3I3vbVRBCqUDDjzyBJOkAnGnl1Kv1lh
         735g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060819; x=1792665619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=;
        b=KWnQvC886WFa4e9hvC8eylZS9gyjiGjzw30CDHQ5XCjBO6XSvMjWZKXWFqZwv1d+ol
         WeN3BW7lRf5ZG7acPuHFddMqejR8OA9Ib1F0iHUQHXZWJEwMBMpC4QQIYgJLnGRyUwF+
         gQU0LyPzF8g3umEKUEVeaT83l9hCmT9jWUPSeUDyrx33/iB9xjD5oW4oeusEOff67Svi
         OTslBXq34Y7IN4i1sEElUX8Pu0VTzedF7JP0B9eRdlaPN4M9iLdY+sYjnDPP6AS7LPaj
         xNjUTA1zyA+5Afqgm8dg6RzI7LnLGhSAHNmzVrapVMdkJzdLfHepoAsRTBySXKA5kr3X
         C5vA==
X-Forwarded-Encrypted: i=1; AKwUvBzTChx4sHXyb10gM7mlVfwUPy4zwYB7CQ42WFfIqhPY1XzwlIey4ER1CvMIkI9jCITJ1ezxh/FXFJIf7JSC@vger.kernel.org
X-Gm-Message-State: AFq9FYKC7ZU7nnMD+OdDRXik4oW+qDrgXqPh/bs8QvbMsY9iYsOEEUGK
	molbdugL/UA4vLCfrM5JBXIvLNKPry4tzZDWF9I9pYaEnGX85/FGG2m3Rx+GrAeyrN7Mvr12B6I
	0Et9mlW181Z65AxVUYxpkQLPUXXGJlWcBxRIdErV8114ZCbniifHbj+XhWG/cF8zS6eWn
X-Gm-Gg: AYBFou2X3sigUlQPypmj8TAcmizQPJ3AiPzQVwSlBlByRHf2FRTtDLI9STXMc8+ft/q
	TATao2Y0UA9d/nCzdeT9HZpK1UTmljD1TO0oEAV9tLF37pTwtn21tMmotgqTCBM9NUAikcmsHlC
	ZVXt3hZx5nlCMUMkU8+i2CddDcQHNsDolrOvKRuoV3GNf/AlLoXZflpPVHHN9B2kMWUolSceBrn
	9KVS/xlchoovQFbBqwuQp9fj2NGAdtcyRE8dZRJxma0p7B6bvx0ElMwnPwKTrn/8XJeq2XtuKi+
	IOBMCiEu27MskP+Ku7NCKb4U0XYZwUfpYWDXt4ebB+NhP6kABmzQtwmUnKbr94ehNo72WzJN/d9
	CJJOX6iTgdjKa+p1o+HAWCg==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr3396442885a.3.1792060818924;
        Thu, 15 Oct 2026 03:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr3396431485a.3.1792060817539;
        Thu, 15 Oct 2026 03:40:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3f0c3sm107372166b.44.2026.10.15.03.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:40:15 -0700 (PDT)
Message-ID: <890b127e-746e-4870-9a52-9b716854ba38@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:40:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] ARM: dts: qcom: Add initial device tree for Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfXzcwSztk7Tn/F
 CP0r1aR9+KES6fltJ7oiDRsDQifG6S8anofNdKKblFSJcml8m00cimOdbgKWNt22VOU2rdA8VDG
 sYHQpSavJseRG5NnTUuF5GJIchCgt0FESzswg0Nx2ne4vHS0SWiLgZLr0Wa0m4WII1xo+CCKRaD
 LnKpTCs59n4HzhskrlsbK7t+4cOAGV/92dQAjOZig8Pxqv5nSX/DV7y3fidkwbTWL+NMpOHU9lr
 ZiwsVG91yIj5AFvmfNeEaLvqHRrUpAVClM1ZosqKdaqzEsmluL7hPlNZV/vvONQLX1RbSaKgwZo
 0BNyVi/zDkCLNPV8T4MjXT4eoDfsaC7fwI3A3u2iPdoWhfMkQuegDtXJjwDyagC7ZwF4u6I0vnw
 eZI8TVoUfjXbWm/E6xuox+riiXrLFEjrn+kcrPrrfuo+xBS9rGqM4E4tBqpdAc3hSWKN6wlr0MJ
 Js3HHnXIZbMmLa1croQ==
X-Proofpoint-GUID: RglPi6Qs5NZoAyoJGybAg8qq6UhEyPAn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX8kbcyyWdKv52
 qMKas9ZMSpVvizPtnnOHitHiZ88YVBdFPpLMHLfF+y+mqdqe7i4WIfyCujIg0EFLyLt35jr1cMo
 PUeCWOKhdWoiuQKEG4YMfQFjlu6EKAU=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0ad93 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6qbC1cy8WFjiKmmiPwMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RglPi6Qs5NZoAyoJGybAg8qq6UhEyPAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150042

On 9/29/26 8:46 AM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
