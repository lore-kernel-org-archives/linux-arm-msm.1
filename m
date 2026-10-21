Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572712;
	b=GY8/vdbN2EjI1Yl9aTD9pb/5/QpBSxkVYwfFH4AcoIlIeWzUkkWSS7IB07FHyeLSLbNx
	 BBa/Ud1JA/2JWUPnM768grBVE+BXIXmQIm9qQoe+5HsUOEndqEXgvmMMKvZLjwiReY0xm
	 hWIYCrhNZtddpHvSkfoLxi3GWBWN4kUvPhIyNyeyuDek2ZBKMfRMNJxLAhYz1GwRDDgMq
	 v5baO08qtp3hlgEVBD742PfejjqB9q0N8WMjf/jkeQCgasZXYTep4H70iQKhW3RxzlEwb
	 NvPEja+ujkt9QasF5Ys5mn7OC6x9lkrCigS4xCvwgWWjcUVxfgKiGBwDTMdwie6aasw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=;
	b=llDtejxKZ+nDPQugI8i1DvfEXHTz/mC0TlsUHaJQVW4fYCVD9tUcPrcJCyI/klhmxoU1
	 jD07D7qUzApnoWdlXpl8oqfzjElIOLWBbjOB6mAInZMLu8WayN5tR9ZhcbrqaSAPAUOgR
	 ZHRgAUH+Tqa/H4wCGcEMjDEshXUbpTkblrW1RAti0IJ8qqi9V8JZbggF4qg0Fg6TYoVaz
	 YjL5Y+e85PUi6DnVyoaL8oVEIKo5wWv9fIgnaBwwnAeFPW+cSFyXdvpOYqQ8J4d+bYhV5
	 6tXA2EmMKnUiLa5pfLBh1OIj9ZKhAOH5ci4Z+CKc0nxQ4buLH7stahDcsYS7371IMJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eevbGZx5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BuDyPL0P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC0F606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC0F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eevbGZx5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BuDyPL0P
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L83cVF560775
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=; b=eevbGZx51TjNI8eL
	BSAc+E9ZHVox7sAUAJAb6luMLvjAigyp3rJlTUZdPtYEvzH98x4xM7Kc/yewpMc0
	ITEhCIEnTVgNEu2fq4d9B67aL56zGvdxVllgf5kk54LjEb0ylXpICp3h+iONpxpO
	hTNZM5cAufuZ0thIDIxEV6Jw+M0g36/AT4f+1izFYUkyI29ajjwdRhbkHlQTN0fd
	KoNBfRiESnWM5t4aGZMvvg1tiS8I4ooCCYAXx94xNHV2eoa1axYYymobm7rTpwp6
	w9BFTSsOvtrW0qi7YpBffoc+X9W62iFG9y+iyEBtRwluIHSurn/rKRGOJfwe6KiI
	b3khEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk2ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:51:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso15417085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572710; x=1793177510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=;
        b=BuDyPL0PkJclgCfP6c2h8rXJ1y2Ugc8edlLuJRDShyIb1NZryrV0JQOEufoMYH8Itv
         BoH6dS480qG60HjaQlvaOw0/ZNd+1EJ0ifHAtYDociR2OO7S8CSvGzp+38Ir/LLb1dFr
         9jV7DdjrOTW4b1KD6CbpfAvhPwSyr27LA3o+mg+p1z6wh0RdArBS0o45jHydvGPO2obf
         mvvj/G+ihaeQtn2Wi+bYNXClrnwuhveavIIE9rzPa0RJJjCkJDIksWTEvKfw0TS8EJxC
         xM/t3eQLexxSyS7YyT67kgBr7gjDYxdr9Hg4nX3FPZLcOrz50OTv6T6D8fVc2x7X2Lzz
         2r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572710; x=1793177510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=;
        b=rBuFx5byWbZsUEvG/xdBlcBdG3REllenH88/1wp5CTl296C5zx3mjzqaunCHkFUtkG
         Nkd/N3fIwzu5uckEUOjtkGXKcaE2UFdfT9xHggQHhxxzSOqen4Ioja3vy1CA2X4RAVkP
         NGkk07nJct+rh+/bsZKTCB55izba4fJ+XV5eBcGubB7fNX9Vs2FfM1UO4COe5MSfZiKg
         BuKyIGSet0nJsCek2S/4lgjUxGFBKJb1ac40eBW7wauTQn/C4FnSTW0tAdgsAlRPi1hL
         0HAQFedGrYnc0SbODqu1udfQTeLXsJp0MseaBOfqEFavi8HMAxW+cxOjRrAlAmnOkkSn
         TSIg==
X-Gm-Message-State: AFq9FYIYL8ajPyjLluymlnAyCbN64gVNoTNdWIq3n3QAhJvAKhBZazqF
	NMlkHMq+6LP4QeEI3iQAGqjUKGW3ltt9wDEYn82ya9vRLIw9MP7JXIIeCNzxXvmD4u7JPYv472H
	89RpXoq0de/Tz+j2XeryL1Rv4drDQdGzmogcalH1pktlvSmSfYe9o9wUBS0BiZsD06qzr
X-Gm-Gg: AYBFou2Zz4OAzKalPOv9EzsMkpNzF7JQjBdyrjwkKyhz0LTX7h5aMwF9BNEkgeMeakf
	f32E/S3Xd3iGMMA6Em+Njjrjq95STJ46RLp0GizdFHqaxYAvqjzp7RCMPA0ZpMhruqbyP4yyLG/
	+4vt2syuj3YftMBN5O2+5B/FHoNs/DhxYYsvSzyBGa4cowg04Ks2sw4JubfjJCq4ZNtRFK8WYBx
	etH4wSmrI2+moqFfxXyOkjoo1j1m5qVfq1dNJLOVRPY9wbOli0k9vO+wZUDatuIEU4YFZqEL/rr
	uS625901bjxHmqjfMRsO7L1RZ6aCrlqG8QzKVSsNotAZlQK+HE16F+QZYxEydKBY5+RwWItDMqa
	CxO6saf0Dz71pmCXWpmd/ig==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr339635585a.3.1792572710044;
        Wed, 21 Oct 2026 01:51:50 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr339632185a.3.1792572709548;
        Wed, 21 Oct 2026 01:51:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c467900dbd3sm53534866b.81.2026.10.21.01.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:51:48 -0700 (PDT)
Message-ID: <cc411497-6acc-4320-87fe-481c3a904f76@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:51:45 +0200
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
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: glymur-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-5-e7b1f403146f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-5-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX35WJhScrXcmn
 9vKlHEawrSJ9SXLO4e4Qlpun5hQX7vnPlaZznYZVvgRuVg3QBJiwSxEqH37vOc+pwm43KE2C6FP
 P0Hk8CnVhldzbipG8On/aXROPDehefL5G5KDujrBdc0wl9YfeDpE85X/IlT+g8I2Hs7G9DzArr+
 HLkPqhyGrVWQL2/+hhxbEfJCAkuToJDvIMCdNpOeT4mj2OPv5XED0pCSMmZLRkEfi9DO+QV0r5G
 zLC/QGsf+keltmHENPzPSS3lB7uxPTAw2bsbZwCqO5dVqV1xVbKZCBogZgoAWyWtUAYvfY+0UYW
 FxFuZO0U6/8CycFSbr/wMvrm5/j/8HwJEnIUuOk9Oa9z0xsWfNpPM6jzKWYjN7KQbI4Kmo/pzTu
 gE94mqpmYFNMW7jXzPj/vNQMh6Kl2IfTcb+NY1D09keEouFkIjWjRUPC3o9zZC0KwBsCqc5Y0+e
 4ZP7WLBKaYlViw4jkyQ==
X-Proofpoint-GUID: rQDua4jBEtGrzn0MRfdx49ERiWEYSDP3
X-Proofpoint-ORIG-GUID: rQDua4jBEtGrzn0MRfdx49ERiWEYSDP3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfXxX+TedCj3ezA
 yIcEXhWNp4vkHN7tpJs6/PaFITh9Z75RzaVibLtY5OZD0RswM5ldcU+UHtoRGaOcE3YwUu3lXPx
 GoUUhZYE23s5fJuCqE3gklVCWrxv2do=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87d26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6BLq2ykjfKK3BQYAMXkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035

On 10/15/26 12:52 PM, Nihal Kumar Gupta wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor is connected to
> CSIPHY4 in four-lane mode.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
