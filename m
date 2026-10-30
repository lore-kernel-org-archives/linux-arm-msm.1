Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350152;
	b=er1bOTCyUroOEL+sgfprkA4jYAXs4tgk2mZIroZ+KoWyva3mSpK15L+39x2Tpk05YdxO
	 LosHDDUUC3zaqe9w4fq8J+XXPc9M587ni+P1lvMuGftr8c3mo9sKQaUvUQVDA3Rya3v9D
	 sve0cns8PzSlCo4NVgeceVvC2ni16tyJPRPiH/6flI5SxjUBEISI7YLK9pyXLhzk3S1Xn
	 6n+2Ns4YtqnHh7AoqP4fd0lgRbL9cOPibiSxdyEojhLSL+0ynrG0eUsoZwPxlzsxZgtJe
	 iQA/YXVDoVA6oFPm2NP4l3ijU7DOSOwOKSu2ATQ1i36YrbB0x76GRzQ9a6pg2rakYmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=;
	b=SAn7Sd2dMsUuWRQVaqnDl51+2jDQqGJ+gi+U5q34DaoThowcrkDGeg94UR/1y6FdPXLD
	 OHjS1+cRoa6kVfjQo0k6HXM1ozIIoFOjaz5sAEA7hTpXnIRzGL3VaLCEvSAD+O9dKc5mX
	 eabaBGxb/+s2z9XkUnxsHU3p+vEG1mxTgyPm6CmDJ0HBUZ+OxMrE8dupc+1NjRmXwtWti
	 FXqkxJUlFzgXaNR8qKOGWZgI0mf6eSo8buf8AohuRm8y1kTW06KMdX1VwXs3fGuwupoqn
	 j3vwyDhaHk00kzmJ+fqmgF//a5O1gDOYYMn4252gQ0yP1RYpaCGxko/ua3I+y7KnQcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLz5zqHz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKQnPGIg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FBD606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8FBD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLz5zqHz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKQnPGIg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9EI2374177
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=; b=TLz5zqHzA7ZWNCgv
	0X4ObSt4y9gdflINLP7FvEwwrQvzw+UEEUZmiCqIVLAe2ByuN5lQ3Kq6WmGNRGN6
	QAmaAH4b9etrBGWfFjrc8CW/A1JrjTT0NNUDI+VrOjy9gq5hXIC7kc1fbhpY3E1j
	/Z6AjHMZGHjGcSiuvnuumia0cy8GN5Yiq7NI3tIHzVvFV/lnHvjYe/+z2UvurD6Q
	sexfC9K3jsZuiReCw8LjLGPLPYCerG+I2Z4rKdOlPvB23N7Vvh6XRUo6xGYB67ll
	peb7hOeoJbQxaf0K3rKJU+8WmRR8Oshibt9ZG2zxri9P2aW3BPad98hLUt0U9yNm
	rI1jIA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj2d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:49:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7fe5576bso3067446d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793350150; x=1793954950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=;
        b=YKQnPGIg3B9XF16OOeO/8TU7SmK+jfEeZAx3vHh1zyH8cEuKScFgZNQ+U6+2O/FN4i
         /L360K9ARlHfZ8foBc1SFWqjDUAvAT5VtEN5DzbZGOpPB99JfmbHDpdCT+17DVQovSv/
         oNWI6rU3NRvqc0JJOt61ONiHEToxliG5mjZRfcqhyEY11AVAIgjNnHZyUg88jOZ4Qb5s
         /HjMBKbA57yGE8rCiTqOc0W9Sa14KF9DqzGCbQSkmY7dcp7wIWZPXGqneFrTBjbijnvj
         iPL7wqta2iPoRo9SfPAoAi5VSJUCheem1ekA24BmKgJ9WW8q+aRyKvemzKjU5yQYH5+c
         SugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350150; x=1793954950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=;
        b=oFP0RFKSa0bTz7vIJR32VmpwZEFrtjxB8yQQjOKyzAhmGe1ozt0Vj9iCBxkEyXCxcB
         kAwssUO1qjQzPIoMAXFas16ChcrJvKrWGn0TllONC5bN1oENRo/wLyVWleet3/JecVcd
         NYROhm0maJo5XpiEkc7X+hOKM9brmH8F4rzs6GDq91id0vBMWj01zJOEAGLRhYKVyKhQ
         tymfiNUhJHeB7Qm0yYOXvmV7BRVkNV4oMx2YDas706N0aHIVIO+HeeV04PDVEn+Tqntd
         SqpujLPWjgS9vjo/NYixxA+RLu0I8HW5WXCWTCSvKYfxu+wuXXt6rHlZpRaKqktdszNP
         Qlbg==
X-Gm-Message-State: AFq9FYJNyf857yXADSFKfy7aY470Bnzr+bOGU7XWnPMwqbTaKRq56kRm
	wGppl6vIPeS8RxRRKUM/fkKAtZqYtR9farxXtUYVILJQBY4eQXirjoProcNKut5Cm4qvHK+J4ru
	VhgmjJM5siPe2NrfHsWyMgLihd+02OkGunsYJbjCiqsJ87HKO7N7+RSxAQQT2xCNHBdCM
X-Gm-Gg: AYBFou3vta+zTQQFasa1ar2iiSzvsGJ9+Q1mLsUAB/Dd5P7kPcWS37A+QTSfYY0Tizm
	d/N7/L7Q41N2G86UkpR7PJ6NUl3079A3CYZLGJ1G6+2+zG3yTwBXgjDzGCq1K9CGwLVettDQ7v4
	qlV+X0PWmAlEVWRzZ5YXn4K68LmdLBYt8+SZv8Ur4cEL5xSchvlcL8xBl5kbhgmGOA2pYhbOFfM
	jTv0Sa8wAMNGgT9HTmsRjO7rmh0xtgQdPGMZXZ+F1P+b+kt5Jueh3GQHZ8apL47S2JaaDHHZXMd
	9jFRD4LC7VdiVzuAQzoDIoRjqJHUW9xyKOd6DD+B/iiY9zfsV73nSXt3/ihUEDirveWz+uizPGk
	af5qKnZujmjgVLyNd1thRpuGSPOC+AxUBM/De+n4b+Smoy5GF4hgqXTan8uPYHRkmTd4fhHI=
X-Received: by 2002:a05:622a:e18f:10b0:534:7732:a141 with SMTP id d75a77b69052e-542b443eb72mr25306071cf.2.1793350150302;
        Fri, 30 Oct 2026 01:49:10 -0700 (PDT)
X-Received: by 2002:a05:622a:e18f:10b0:534:7732:a141 with SMTP id d75a77b69052e-542b443eb72mr25305731cf.2.1793350149640;
        Fri, 30 Oct 2026 01:49:09 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7a4eac5sm382210a12.5.2026.10.30.01.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:49:08 -0700 (PDT)
Message-ID: <36a18bbe-7a2c-422e-82ad-b9d1d87900bf@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:49:05 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: msm8996-oneplus-common: Drop LVS2
 voltage constraints
To: webholt@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261029-op3t-lvs2-fix-v1-1-42ca9d992c20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-op3t-lvs2-fix-v1-1-42ca9d992c20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae45a06 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nlTkBPkjGgE2AyCPopkA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: aQrhmEeKQdg3HWlzwbjpThLNgnZOPWAn
X-Proofpoint-GUID: aQrhmEeKQdg3HWlzwbjpThLNgnZOPWAn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXwUiucGWVzXZf
 OXsULIa8nE/HXVli7RYsUShiUOLdxyZYxkN8JJiJEnGOaRrIro7zcBgUDK2qYAGH9QvQSjgo1cG
 vxbhQ2/oNP+0Wqu1xcEljc51yEQDBbAUKm1E1zNW0gJNZ1fEPI9iUpsdXVPOoaTHU3LyeJjVyQB
 KhyYBBrVn2njDtguaJ7qqlkZjco0Bo8sTEZFPbBxcd5BiH8SN0t4KU79L4/TIZwoUPs6dwpsJs8
 PRAIRM2aQ9BwRS4zKQuAQhbG2xKNOIZkC1lyiQ6lI1YbGOw0xMV5Wwz/H/mLUyGmVAuMUA8uEue
 rrXYTsuXu2uZCgdHWnknF2tV6BSICIo//O1mOBY7dto0mxLpDg3X6n3zffiNzWsSzGjJwNAz47b
 qcuN51mNIMn7TcECzZaYEMAnI5PXKAG2Itmdy76SpXw979nYv7CfMQA4RrcZCL1ciBlwYm98dtE
 AnBzh5eYkI5qd6cS+6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX0A9BJwsfDsKv
 ztheeengHpP4arLn0bErCfYRrHfdoQlByQ365EHsbDmSuX5bITMlPehGidkqrhUf9QmkZtIGopk
 FDoZOzJqJ5uyMfUYdq/ODfWh3tyhM5A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:12 PM, Vladlen Grachev via B4 Relay wrote:
> From: Vladlen Grachev <webholt@gmail.com>
> 
> Since commit 27880745470a ("arm64: dts: qcom: msm8996-oneplus: Add SLPI
> VDD_PX"), OnePlus 3T no longer boots: the PM8994 RPM regulator device
> fails to probe, so UFS, USB and the display never come up and the phone
> hangs on the bootloader splash screen:
> 
>   lvs2: failed to get the current voltage: -EINVAL
>   qcom_rpm_smd_regulator remoteproc:glink-edge:rpm-requests:regulators:
>     lvs2: devm_regulator_register() failed, ret=-22
>   qcom_rpm_smd_regulator remoteproc:glink-edge:rpm-requests:regulators:
>     probe with driver qcom_rpm_smd_regulator failed with error -22
> 
> The switch LVS2 cannot report its voltage, so the regulator core asks
> its input supply, vdd_lvs1_2, which is not described on these
> boards. Checking the 1.8 V constraint then fails with -EINVAL, and the
> RPM regulator driver aborts the probe of all PM8994 regulators.
> 
> Drop the constraints, like apq8096-db820c, which describes LVS1/LVS2
> without them. Keep the node, so that the SLPI still gets its px-supply.
> 
> Describing vdd_lvs1_2-supply as S4, as done on other MSM8996 boards,
> would also work, but it would only serve the constraint, which has
> nothing to enforce on a switch.
> 
> Tested on OnePlus 3T with the msm8996-mainline kernel based on v6.19.5.
> 
> Fixes: 27880745470a ("arm64: dts: qcom: msm8996-oneplus: Add SLPI VDD_PX")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vladlen Grachev <webholt@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
