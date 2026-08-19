Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79D426D2E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130130; cv=none; b=BVRUcYgVuYk2y0E9tpopaWG6l/d8CZTTaD1kczcD9JE+s3gOlR/e0Mq1a7reozFAOgf7t5YjFvXQ4TfWjlR29WBrCGxvux0loYRUdIBKS0LXgLylDUD+OvfU/SURMT9GjWOnW86EtKOgHOBH4S3CmiRNrHXSsgcU5wTaHXOQfrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130130; c=relaxed/simple;
	bh=C2ElBitpcH0Y/2m4DlDrMTU8AR4F+16skNXfElZui1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1lxOw+Jvpt9RYKIbGCuODNgTmYS/OwTW5cGqICqisz4wR79FCKA2W12WiY4Da/vPK4HZD+dsPM6/C4UFpXGDe3TWT6we4O2riXxxxDVA97RYS9A4qrwlgkhk1T0m24k/xZy7glhfIUOHlJYu0J/A97EwRncrtYdv0FIpcufXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VojUUq/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elQNaVwT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VojUUq/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elQNaVwT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZN0m3589886
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2ElBitpcH0Y/2m4DlDrMTU8AR4F+16skNXfElZui1o=; b=VojUUq/c3qSYudqI
	7hU6d5ZoiE6pBU2hAlD4TQpLgDcM0NHvl6pnoSvSOcjQPn+4a782scrbdRoIaxRM
	bxBkUrY0SGKwJwr5pIMUlBB7RuWcdJvEckvhnLrNpSX0jxq0odY6ApJqENjbbwvw
	fRGB2igpz8g3j18K5CYZ5czevJZDAP/rXJ6iBa75pzExPa5XErIvICjDf9GuYvpz
	LtKJHlsQz2hROww3fXCr4h7l406jP1ksmluxsCPUf0ROgSYSbr4aby2OJx0QhJCd
	x5QE6QzG4xJUkH3FWdVxkyibinGOCKvtTHSrHMAbQOzY/Jx6g/GBu5JrGMd1eO/h
	5wuSWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfna997-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:02:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494b1e35cso17280085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787130125; x=1787734925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2ElBitpcH0Y/2m4DlDrMTU8AR4F+16skNXfElZui1o=;
        b=elQNaVwTi68l+OhToweso4iqZ8Ikwhy7auHe9LPDiW7YSc0fGQ/WpDqufd1ihhbijA
         hsHkcvrOfGl/5THtATz0lHOvFJmYXdJZAepP8ome0abZYkpKG50qWobq/2RRgvW0Bdjs
         u2r+GAGFha23QGMTgo5HDopF0bmmYCBg673ab6cy/Vhs7jKeiC40VE9qjq6jIsygvpCU
         BRqOfdndeaHR/QGDAx/xMpAaMOjbl9Elgb75rEfA/01mfUmM/TTsawEkoTbBdytXxNi/
         8X2fB0NlZTsHYakK7LZErYIkEzpUdyzMTh0UPs8zxU9oCb9FgCHSsRc4UmI2rJxV74LM
         d6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130125; x=1787734925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2ElBitpcH0Y/2m4DlDrMTU8AR4F+16skNXfElZui1o=;
        b=ASHnDrogEo0j8C8MqL1ULtZU0iy8lbjlBfVBBemOYWBux/lMHMWKzUZwpfV7lpCmUp
         AsXhYSCCUTnjMq7sGztyIAv2g42H1euXDDlmi0/oNUmjVeWVDxSu4c58VSt4cZ9MJW1e
         To4V12cg58HM+fEx2LB97yP4ZlBsHnIqIs/d9pvnkJJYajLUSx87KCLEIEgkVOs3MQoG
         SAqlBYFS/NdewP9OsdkJz667laH+qEH2SJSeYaFfWOFjznsgQpqSGYA5uW4qYLwNUiKO
         lyNgY/KTY9/Srx6yOg4ZtZHIKki4kge4Uk7IUp9k+9unH2poyiSf1q6phAuZZLpyjjLS
         rHbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0cueWEEY7YoUdcFOCPRTStwc4zSrzbmm+tOAMypyN5MfvGvTGGOHRImR7yxvIcvuWS2HOzVPFTgdFrZKK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo6fAIV6YW3/cx1zuEAvad8uaL7ezDVA2lwhHTrvcou50UWKNY
	xFdhldjAzGExYJF6Z/HFmPLqJNuc7c2whYDaYb2/Dvn4e10eCgIb0ATbhRsSM2pCoq5RXWrC+Vo
	MwELaVh1oehe42jwmdJoNo2Q+RgvJqNoa60xlrNi9kOBP0a7HMfh2ssxVMgkND1vqXZpBHT0Bh7
	sB
X-Gm-Gg: AR+sD12DLWohxHHba+qxcQMwR3TkkJ1x8ShXp9V85zKT+FyX5ldKxlCAWcXiPHjfeSr
	zrkCdnVPA3Y0J4ZJYfd32WF0yKtmjnctHxDjKJholuLe2YBeYhrP4M8rEZ0in+nnjD002d36wlr
	zMXQ+cL5Mjcsh/AdVo/0Z4+MC0DPtssxbVnqy1IrlUZZs8aNUEf5/4haB/E02WQOA+qdsPiQ1Es
	niHRZe8nP2rjT49LpFc9o/pCXqYWePBnZVzpkXBAjb6lL6M4lxBXLogBOUYwB53Tx4XFbRRvex6
	bLo9BnEy36o7OAyhgTCgW++NtcWSk3d7/7LkCjiK+fE8E/RdoDpVZlMMV1nU+mfBzTfSWrRfJed
	jUtFMRjHNTqnINvhNbzErCY+Y
X-Received: by 2002:a05:620a:4055:b0:92b:7420:bd58 with SMTP id af79cd13be357-9371e1aa1f0mr225177585a.0.1787130124698;
        Wed, 19 Aug 2026 02:02:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4055:b0:92b:7420:bd58 with SMTP id af79cd13be357-9371e1aa1f0mr225172385a.0.1787130124093;
        Wed, 19 Aug 2026 02:02:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7cf8a7sm46942166b.7.2026.08.19.02.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:02:03 -0700 (PDT)
Message-ID: <1286acb2-91ef-4c3a-a7d6-3161657a2b95@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:02:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD
 NFC
To: Kristian Brox <isyourbrainfoss@proton.me>, oe-linux-nfc@lists.linux.dev
Cc: david+nfc@ixit.cz, krzysztof.kozlowski@linaro.org,
        luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260818205940.1973944-4-isyourbrainfoss@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260818205940.1973944-4-isyourbrainfoss@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a85710d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=vAYhG2c651soA5ayOEcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Rlj07UZe9jaI9-8TNyZVd9eQKl6XXonY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2OCBTYWx0ZWRfX7cQVQNZ2fqt6
 rvSBj5oWyahYHJyUd8rfs8G21/Dqgn70GYtw66+Jfj1cZsLkkapryyAB+qBEDgVdjwHPi2wLd/O
 UsTgxE7+7vZDFJfexVOAgk+y9MAOK0U=
X-Proofpoint-GUID: Rlj07UZe9jaI9-8TNyZVd9eQKl6XXonY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2OCBTYWx0ZWRfXyx5rdaQY/vHU
 aSHFtlcS41z2hfuF5eJ1IDVdGYKKLkqWu3xxhvYDwG7yhv+fVFbNbJKh/MvfBdZQn9jh/xing0U
 qwNiOzIF/pUvxv1BeEHbzYPO5PbELY4PLaYlzDyBTERMgOhX9m6pCooggePx56BaiNDCIgM0cxc
 IOk4WOabB3G8YQoO/UDvpwYW9h09HWbBUitZPQ3opVR/4XkJL1bdx1ippXxrsgNbApQTOW61Lf/
 rmjzs2TrjH1qY9QbB0/vWLnQKHsLL+jU8j6bx2C/SlOa4dh/+pl+j2nRQKmA4+5Q8lHQTn16mC9
 22IaoBkEPrE0J8ePYSCtirIMiF/sRQD3YgSHyC5PnZXVV/0z8/npnXfPeUMUYxYeBPCLrtZ756x
 DEOP8lhfIQr4AQmBtE+PIfH8JLccvHpngsgZncZqAkUpJ6R59XdnIASpY1do8DaY5NTzhdXwRhl
 zN24RpMV2CVTZUqHfiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190068

On 8/18/26 11:00 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-high. Compatible is st,st21nfcd-i2c (raw NCI). ese-present and
> uicc-present are unset; those links are unproven on this board.

FP schematics are publicly available:

https://www.fairphone.com/wp-content/uploads/2024/02/Fairphone5_Information-on-how-to-repair-and-recycle-SCH-09-02-2024.pdf

and it seems like both are connected

Konrad
