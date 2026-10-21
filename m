Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577190;
	b=OYP/2IruYRjNY49SozjJIN98UrE5hZUiSmO6KAplai3izJNb3EMWHVpEKOLmA02FZ2u7
	 amSq+fGWtsB7mZP57q5T+CMp8yRSqczPP2FIVX43ck0RH5Xrx365nqU+JySmnWC08Ea+r
	 Q2Y+Phzm/v7UIcgpDwYEAsp0f10i9wsMejT9tEkAsetaDDMQBWAwQpCnjbbyCBkeYmx4j
	 dOLKAAEhImOrQT0d2c/trw+yXSw3jCejCQZOCbz2Q7ONXSijsnbwXopDxCIXSDHenMHCR
	 GtK8f4i2efl2Czoxv7FtBOTVVMPLBenM1xFMpKXnILrH8iTLiJCEdssYejU/CQSgo2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=;
	b=rOypHeC2kY1/mfjIhZrCPzw8V1o2lspo4POwl21yzm9YzdEd8QCJDuukzBeEXfpQq8XP
	 PHFDnRTXM1HnH6knL2uFyQ8qNOR09WApQWYJSvNmdPiV0iTB0aI/UdJ1qYiwAekQcmEOt
	 PCgVt25Gf5aV5ArO2lHg9wihkwyxfa7FxciWi/Yks9Qq2w982ha3BZasQWhABh8bhaX6W
	 IhnhaDDSao+Avv/nd2Mc7Lt696BOxYIZJj8yUoixYbnx0Tw77KavQE5zhVEeErwchSwVy
	 GKu4PvjuTxs+VozE2BR6OX+hdyxZm6MDW08XzXidzdtP18aiSRh7q+ZZlsQVdkyJnmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aF9HjXVd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HllQlJEE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EFE606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32EFE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aF9HjXVd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HllQlJEE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6ED5848878
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=; b=aF9HjXVdVXRObLw0
	WVXnKJimB7hnAxD5r4fKqgXYO2WWVp2aTEziVkE3lkCzdXPUEgE5FvlCgn063/QE
	A90+SCuU+PWIrl9x1nRHh6tDuA7OHgcrvnh0prwFpo+pQgFvuiVfgR6tdZA8fw6V
	yYN8c6hSXHsFo4r18387JA4r4BpAkwKZalZVydNFDH59Arb9z8aBSOsMRwvw3TgW
	utr5OmxzYqCARN5j4zG5GX+jiwPqUNU7NsX9V1H5/FpCMavOGQdvT1BLLHQiKcYg
	Co9pkU6K3Sww8JATdou5694XVHRQ86q33zcpH1+8bXxqri4B5QC3fgWV8Ev8MhnF
	08/VBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkd5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:06:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso5164985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577188; x=1793181988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=;
        b=HllQlJEEGBXNv4i94MKHJq6UGTfIEW0H8kYbcm6/92LkqFCk6ALqDdfl1keHWTwDqT
         N3oQY/2w4OK3NhMm+Ii5lqp9nq6Lr5PrZKqXdQBkL1ihFy+ZhUolw1QAuWfc6I9fM0qT
         /b2QTfB6JuS3eDQJhUCLnXYRckLMgR3s86KDUNKN74+BFpdBsRxuPzozjJrk9iAym3zy
         dAnTMUcQXG5H1VxjDXxHkrCsQSvCT7snTKks/toXcg+t4+aOBK1B+Os8CaswWBSbxWIa
         fxdeTXQ9W4gvzJg84E3qk4/lRnWc3VUZcs5NLtc7Ln8Z24dOAa00MnFUFYOcN+VACO7+
         JnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577188; x=1793181988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7L7auJZ784UGFaVop3WOyp9HDXHbqOIgfmUYN5iyHAY=;
        b=P+U9dbayeRevIfj3rQBTUA94IqnNBz7K4TrJoRzHqGUtH16VmyjaH8imwfr9+yeyas
         X2ThI4Lfb4t+Nt4AKorSVby9G7+u5/fXQbQ3Z1IWlKgyn1R3VL290/GRLfFpOardlEMt
         3/xIOgZ+CyUxvdlbPpWPbMFjEJ82uazmVv9IR8biNmc40mCLRhS2ibVPosJghhv4Z6NO
         1AvxPxNIcMKwzyijnYYhl8UFMnDyVSn26QBZaf89aNq1IH3jkGBk58BSECCasLikywMb
         1TKAN/C5A4Cc6ri4uG0DAcUR4gc2uSbsYT37om+VRa75WPHFi1unPfOVwMo7D1coqcjm
         c2sA==
X-Gm-Message-State: AFq9FYJ7rxIfR1oOZj8RWjpFse88/VnMeIjAtlxaS0kJRQNxoluYOKEm
	2ZhgOFLbwC1mH6RqKKM4jiIt0z5V+bg81/KnWSqTy4T1IortzJu6z8sOLgl8sqxZWPvbcXiwMMH
	lS01EyGjQZjj/oGucZ9J9zqcW3y+7gVfhtpo2R43IgB9jdt53Hw8rq7yah++cPTXuqsyx
X-Gm-Gg: AYBFou3oz/JESRJ8Su68SBoQiSVJWgkej5O7OsrXEIsMe56fwA9HV1T0J/y0fzIXwk8
	feHyuYv2fqimmNGyxPhGVkdRFzu0rpE+23k9IxtXIUu8xyE65rhb+CHt1/iUleMfDOZqd/O2a3t
	+w5vJiK2jvUOsqVXojhjlebA+/UBQkIW90ZCC0EDob2Z/zVXA5Spz/hsdvdNaqe+Krq89GZ/gTw
	66B3PSIytQ2si/KqPrU0x1oT/nd2PqmkbuevVqV4YGWUE/hJ+lWL2x/GALwAegmEAgSmMxop+MW
	pDBdyXGDTJkoDslhWqyCsCqqYlrUcVstnkdERNZ/3EDzVEYuyDg42qhwjUOiyjmydbHrv4CV/y5
	I9IS/Hzhs+0tG7r0YlZo1bA==
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr354619585a.6.1792577188344;
        Wed, 21 Oct 2026 03:06:28 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr354616485a.6.1792577187926;
        Wed, 21 Oct 2026 03:06:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313258dsm679293a12.28.2026.10.21.03.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:06:25 -0700 (PDT)
Message-ID: <2196fe69-b520-4d1f-b04f-e32808b689f5@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:06:22 +0200
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
References: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
 <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX6RgnA+aMqauf
 qD5h/PweaiU6IPFeZJPcrFdtcjkdG56PtOwSRpKUHknHNpM1w5KQzlMZ6BIrHDKBcUjShiZFy2h
 5W1o8XxDSaVuOS1Xhux3asXKGThYbrFwbUTk0EJ00bYSKMPcvLvZxVMS2wtvyENJ7un82TkMieI
 JX6GEtHTPVonRk8JYyZOe2omgb7tPtMfgoUAflGZd48djzknBK3VKecTlSbbDYIAUsm9fRmKWam
 RGoXN0j4OkZfZAtGPfKW72hE953sk9r0GbZT8kQr58w6/mRwTCQ6yQlxwVbjPuLwU5BRqXdIhqJ
 eqvqRaADVa7uWXKCGC2bA9Ki3gCKdFT3VZ7pY1zSXyLzmQ2xjuwTrJ2h/P/1/DobIRZwCLvOcc5
 qA2s5Gikf1LZklh8xm90XP3tYPbVTpEjjf41fO3RrquWuZ6eqQSOBsGSoMBMzlG2gNwB5RYDm6e
 n/I9YuZVifxSS9PHbQw==
X-Proofpoint-GUID: jTAk1oob-lwzjATsGkcDi3Dx2x2a1law
X-Proofpoint-ORIG-GUID: jTAk1oob-lwzjATsGkcDi3Dx2x2a1law
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX3kQwN6k43zEV
 KY+/KMWhJws2ZSYn40dVsnkvb3hGTkfKDfOXaWHWauddOyhoUPwM6n5Em/eKSFphwvFaGF2xJkl
 73PmfFclLICJ+RK344PNM4g70Dg2E88=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad88ea5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aQ57efiQKxvF-d_-SPoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/22/26 12:42 PM, Anand Tiwari wrote:
> Purwa IoT EVK variants are available with and without an eDP panel.
> When the panel is not connected, DP3 is unused, but the base
> DTS still describes the eDP panel and display path.
> 
> This causes the eDP-panel driver to probe an unavailable panel, resulting
> in AUX probe timeouts and missing display modes. Userspace then attempts
> display commits through the eDP connector, causing repeated DPU vblank,
> frame-done, and IRQ timeout errors.
> 
> Move the DP3 and eDP panel specific nodes into an overlay so the base
> DTB describes the configuration without the panel, while the overlay
> enables eDP panel for boards with the panel connected.
> 
> DT overlays cannot remove properties from a node defined in the base
> DTB, so keeping the /delete-property/ of #sound-dai-cells in base DTS
> where it takes effect.
> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
