Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C4441687B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376291; cv=none; b=g17LdcPXpfrkh8GyJiolxgHgQ3iVvt8KpzLJQYFk353tqnrrLishG+kQYJPXCu86L6tSQhVny1lSB8RkuK2ptSJBpqtnoPkF9989qSVaUPsOr7gELT7gYwbYCq7FT2Yy1sGqyeZWj/Zn7HKxDAv5R2U2gR/8Zgj4vFqpC1hZJxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376291; c=relaxed/simple;
	bh=4d05JrXTCB6W9rWQXzcDKJORFk324K5v5YiJJmweohw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4gx15kWdQTL3PyrNdw/7oR9dUtNRIK6XnscxkSuSiYz1AhxFqpUyWpLqDPXqBcZbbFJ8Vllns8M5RO94PczG4ZfuYE/H4yGPX1MQsLmeE0k7aHxfmnCgIOtfXybLtrFxrlS6LVhRfwiedfiqoSFbl78KRx89nmvP/IYinyB3sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjRJKOlW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5Rq4wcV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjRJKOlW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5Rq4wcV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8ScTI594663
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOL1qxiUp5Hq+8glsgSAv0SI8u3+DeCr04+MxHvYHK4=; b=WjRJKOlWIyp+M89s
	zQWRyG8WPM+mlOhn8c1uoBXcvExKhTkYEvC65LLaNvt7DO+MN44ef32bHUjCTXB9
	VdbBZuJQ5wogM4C8aKw5CnlpzFFXALQy1pz5UPhygUIxpu3QMH56TGpEshBt7yA5
	waN/VFXmC7UXN2PQ9EwFAdJsw74AiWQ/9P8QJWyfRjrl76U0C53aYsnK0douK6ff
	UgA1DENksk1GBRFRS7IHh5NHHFBdnLPw1R9FUtqHLusXdnUBL09I2oiZ5XB6yi30
	V0VdddiL2sglf9DrjVmi/2F3ASKFrJknCwjnAvZkAzn8E2QQksRwEQgHWJ3+DDKM
	0GGLFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevr39g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:58:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso47747185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376284; x=1789981084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOL1qxiUp5Hq+8glsgSAv0SI8u3+DeCr04+MxHvYHK4=;
        b=H5Rq4wcVCRA/NjV6SXeeGdOZdljRL66U9gKL0vJnHGur7O9WanSQnFWiAFXEjoa96s
         XyzDxrga8YwrWpGOOwPJe4X7O2jMPlJcAYGFQZPsQJhmHFQ0ufk8XIQx2a9BGPJZSkBA
         +wDQ7IXYjVu6JFiD+PUwkD3fXMbhBCa8K9Kwb7tLxUY8bPWWyNNsV0a6NOWj95y14KNp
         h6OAXIwdnoOJi+qw8uImo7QwdA7zDoKf2AAXS81j096K4xs2wfuPPdM4Gfpu2EbAhBpM
         xBa46Uk4pCMTHyh2Ks67f6bqGgzUBGzVuxINoZFSoUH2goZD0N6ebGz8QYUrqvyDPWrt
         lqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376284; x=1789981084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOL1qxiUp5Hq+8glsgSAv0SI8u3+DeCr04+MxHvYHK4=;
        b=fCC78pASy86cOc7ZaGUXvCGd3ywrqQoqW4miVrB1nxwUUqsgkTVKVMS7i1ueXAKiaA
         NVs0wCKcYlR1NkkCTx37OgjzxyS785aWnf/2YN4xjcFN2q2tVXsDDGEW3+6o+8r4VJTR
         2V5gIl7BPM6jU693SXqhuFjHM4W36jc0V9UCce1jYtOh1kOKlJAAIMAc7X2u0BUJBiqv
         K8Nczrkhvo6tpXs2IdwRDqjOoxcGQurRWjY7Unn/kvoR4RAwT2OjvjAwvAVQzSsyMwqF
         fQ2C80drnnpV8qayMU61O3iFeVnFpabwCyugefoif4R9bD7o8YbsplIg5saE6ME3Y9Qm
         /WWg==
X-Forwarded-Encrypted: i=1; AKwUvBxfxSLVpTiy7fvpOvlYHr5darSR/oQ0boEoNCJwZ4UzvnGVRmw/8GvtugWNQIi4p/CZ89KOeNAy2/bS4cfb@vger.kernel.org
X-Gm-Message-State: AFuF++mSzeK74LkiH32aMbmMj2jVIBRPclByF1sZdrTakZjriSD0WtpW
	LqnN0hCTwo8x4s5/CWJDHxrIfXz/fI2Z/y7NrbWHgNxo9Xc1w1c1oZSgzNeJpndWI1VnZbsh6Wt
	TaZkEyYC+36naMHvB3lPc1dLbBbB1jqYlp2+/DgHs5p1ItrHX1TP3sMLW9d/9HalJTZPM
X-Gm-Gg: AYBFou2hl4W03jB+0qtr7dz5eIRBy1M8wblZ65TQcJeGAtyT37O+zp1ttHn4njwUxRT
	nHzyCoH/QQCI1UWC+E/kidCB7bmmqDC45W2Tn66f5i7RiW2kdrNKoYPq7oudaZP9SV1hkUH1hov
	7UpBRaAyUza77emP2beX7EYGemTa9J+QK8yyWCKHvCiGL0WWYr6VP5otNe7htFtvSppZKcHNLmd
	TZBR+CpYgqCkq5srH9WRz2sh4I1ao4zzookD4WWddN4yZ7PtP7AfEozduLYxUbSApwtW92tqR+U
	McE8b+0cldAiRP+tkfuko0eWqyWIwALQ3aHDjFpQnp43+/3FuFN+nbHHpkZbAc1RqSDkJpMOTJa
	faexQWpca9gDqICP0Rqgz5A==
X-Received: by 2002:a05:620a:258f:b0:93a:14c:329c with SMTP id af79cd13be357-93a2979a599mr197331585a.1.1789376283883;
        Mon, 14 Sep 2026 01:58:03 -0700 (PDT)
X-Received: by 2002:a05:620a:258f:b0:93a:14c:329c with SMTP id af79cd13be357-93a2979a599mr197329785a.1.1789376283524;
        Mon, 14 Sep 2026 01:58:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4dfc7sm392151166b.4.2026.09.14.01.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:58:02 -0700 (PDT)
Message-ID: <0956417a-f91e-4ad4-8f88-2b9602af8978@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:58:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JoLkkDHovaggqwWKytAnGU1kfUNhJGhF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX/4qVMruMCGnR
 5h5RhNg1QRJJIOaBPpNg0CSlShz6KpTpcAWAFsVpWoQ0K6ZIRtwP/GfCouIW8hovcKYQnZfNxmx
 VkBQqVqIc80086RXTpD0NlxknvcJ94k=
X-Proofpoint-GUID: JoLkkDHovaggqwWKytAnGU1kfUNhJGhF
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7b71c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yfiF4Zao35L6hQxt72EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX2SBkbLGWOGzD
 9YsCyNZ7CW7QjwYrMByoIACl3SdTNXic/SlyhYzu1ENqw5uiskJzeKZPAEaVquDn+9AKAxS1k6w
 p9K2pSv56ZiK45KtVj9vJDA1jeEDoKR0rdweVrGE3HV+rO8o4rHiB2eyTYs5QvmIUL1QIL+SxUP
 YqIh/Iq/fxwnlgBUYbXD5hcmN+OI8KpyOJyaJ2j7RxpyuIv5Gr5SaTDAJ9peBxMUKtR8Gqc6P+P
 thwi9sk+MWHTCuWdBVeETQTjFSPEhJHxNu5FhKK4qD8ovWQ3zXJvefbfhHaZXKk3L4Wx1LtEswG
 ZIrcFCQkNTUonKYp9fhRohmC7g/nskE4fWy7OFosTkMziXRS5hHOsGutvR31pdUvVQSAW82GgWc
 1MeRFLEhwUdWjw8Yk+xXuPTBn9ii++n0iblSBwydCRXztUNUKJAGHaB7HV7PWHp1qys760TgsKh
 O7PvqSo+MSfPlUClbCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140126

On 9/11/26 4:20 PM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the platform resources for the three USB controllers on the embedded
> Nord variant: clocks, resets, power domains and interconnect paths.

[...]

> +			port@0 {
> +				reg = <0>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* Same as usb_0_qmpphy above. */

Hm?

Konrad
