Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618224;
	b=J0fEfJf81oY22xK20X5livHwe67k4Lc/qFMm/DzQB5U9GUc/nQd5b/LcznSy78pRo7LI
	 8TqXb9dNipM8BAgoKrsdIb+53PCvpqzxE43Cb7pcnFsh6v8QcdFNVg/3g799pLbfZDRm0
	 LDuV49taxrMY3gLfDChkMfVQqAL+gRTlIw7d0cFv9favc+mB4AGwaGdjdLTfRtJflQ8SU
	 RGKenBO4wftW6QCOmM7DaRxBnwIsMJkCIxOyzFcjUw+VpTWpLZOOGz1/pvli3hQnGEex4
	 wlzTdExz8cmOK1hnlvbFdlDlYPyZsrGE307jRgqqp0a/mQgiExHnod/9Hq5rC8K/CIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=;
	b=cHekUE7mCTIuIC5W4MyaVVLUz2plSzdg0wlZg4EmF81FVRcns/WIVSaazOpZg4S38UBT
	 V8SbwlSI/7hxi000CP+wDUzpMDVdo9nQn5xHSTD1lRHuJHutcG8XmMiLA/DfZcK98bCzY
	 jb/AdtT+Xv+1+DzmKkR5UmQu/h+/6CJTGVKot6fZsnaPkre0FBncHBaghw+oiW3tCvbpF
	 2MNdYutvP5bl0EC59/fb18rrwvsA7V5jQQhdOx/NLvk2hKfTZAzqSuqVuZlPnHoqZFSDQ
	 8XNKiqdRm4KDbYsSUL34nq/XOvtsb3oFTXHK/QOqoy6H03Hb2Fc1BNkmqKwwoT1ubug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R3Mf98He;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdbLfl8o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99006606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99006606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R3Mf98He;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdbLfl8o
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A36Y260569
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=; b=R3Mf98He8uDFPDkp
	mX0LgsDZpt4CIg2VXRslVcqCcaACWLnI/UNZxF2KwCuh63/pJnxjDWBolcvpD5ag
	jJf8OOnllV5aMs6cc6A7DvvDfRxGsHMLOdyvoJW+Lf7opkjK+su5soyayr5Ko3Kj
	FNxl6xS09vWsWBTEYoDGtA6w4JIVdzDeEjkTIbUgT0hqqLN1PCAu9dAV9kzwXS0y
	YHaiSu76+i4F1FYV+0kLr2YfYBll4tjiSc8SpW0GXaDgJzydZ2cCFP+tHRzhDWiE
	FrrVRgblbyiBsqQiDhj2W6QZoaRMwz7Of6lGr7Cb9r6+TV1VS/nXfpMFdE98F/CV
	ezJcBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrg7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:17:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5360b8cf8f5so6743381cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618222; x=1794223022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=;
        b=cdbLfl8oV1LZQ4T3hw1k+5zxYFpxPDIOz6grdIYD0tgdKKb9iFNXjQkslrDpxzHJOt
         6hprDcDlvK69X6yk43jdOHe6ZqoO9/rotka6WkwGxwigbDIcvpSA44hmmbotg/q79Vv5
         BRh4jwRKTcBgb+nKLc0u0M4Cm7qvcTilerYPEqtnBBnqMnMRjc4F3EwV9UmJl85nG+nx
         rZ6SCpuR4EdVa3rR91t4L6peUBedWcxlALqraTDLQpw8fwtgGxHk1JkXo+u1XU7oxeI7
         P7e5TNiKqLGg7x2RjoHpXBt02GKF5mia3i/nIVupNhZEml6WRkAruc3N3wzkYDpM+7NF
         1c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618222; x=1794223022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=;
        b=mRzKtWF37EEyh4VOnGRvZMWhos+jUY8Y6GfbigIefXdrvRDvzl4cgrGavEyccyEyxK
         g8YsGWFBXNziwRAWSiOJhSnvWbP6AvOny8VGDjupdQZRDm6bKr1KjWiHeDjQDnWg7Gv8
         0hbvfj/C/Ud+fVv+F4Z9hJ9AwNZJ5iD8PtPAXIT/gKYX0W4kluFLVZ+VEA3ZLfMD+J4Y
         hN7uDPBJTE3PFJ3FAQqqrc05V6mZDdBT+ipfOAN/ep+UGvSo0jL4WIUtoO0EDIAQfkPi
         Z2StoL7wXBYPthmu/VVlUR6o55x/nCo+GmDyqhYFXecRsT8uW9rhr6ST8599tn7SCY4v
         pUEg==
X-Forwarded-Encrypted: i=1; AKwUvBxSpq7FGoWMraIflHjp7iLfGW87LJZxY/t3FuIEyxMAa6I7Q/QslFTt7OJELotJZ/x/VgeWrlwckLENorcs@vger.kernel.org
X-Gm-Message-State: AFq9FYKHDRKoM6kDhW71JrUZr1A1FOveyxTdY7xoSIbEGA4ELToQgIbg
	m0pyRxKus3Zt8bJC3tGXrqy5RzjrOaM9KHwrhAhgYeyvpgO96iBnNjnqDT9o2kAhGm8ygFveFPJ
	XMiaznMxPhFjkF9Plz9hNozElKgAIEtw8pGQlc3reCe38D8CAzHL/+zEMLMnDUa2WBDGw
X-Gm-Gg: AYBFou3Vq7musCr5K6+B5hLbYNPm45fjOC3s8VSNRu0LfpffKK4vdd3nOkVE1vduXAE
	RNsVj+cIzVezcgkttMF/IW/oKGtAtPMKLQ/WRD/rV8w49Yy+DgV5Z6C4fRzLgNm6p/psYnoNsEE
	TydbAoF+esVMzn/Rcwx3SQ71dy867IlrIsB68pMoodp8r52Kz1yzGa7AYFp3Lvn0ZF/swfnztY2
	N1qAnY5fHJd0NCw6OJlQQ+2Tsok9tcPDvzNPjI8wxux/Q5hirVmLf8OvKdrfYyLZwBiNO0g5Cob
	nA4DO6qcOKdQJq/LiyifxxWu+0DuRj8wENoj2EYseTXrY2ivROGzVuVSoAx6Z9Svzm6ehn+sdFl
	4yPOAanjZYucAkN1iRetUnDx2iCB5ESpOIrs3DXLcqBgrmdYJV9i12EEtMIOAZjMdCS/XVO8=
X-Received: by 2002:a05:620a:1a0f:b0:945:c174:3d3 with SMTP id af79cd13be357-945c1740742mr45448685a.5.1793618221910;
        Mon, 02 Nov 2026 03:17:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a0f:b0:945:c174:3d3 with SMTP id af79cd13be357-945c1740742mr45443685a.5.1793618221402;
        Mon, 02 Nov 2026 03:17:01 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm375857566b.20.2026.11.02.03.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:17:00 -0800 (PST)
Message-ID: <5b0bf1d8-a0b9-4cec-b144-3fccedc77ced@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:16:58 +0100
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 WiFi
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-4-66a56c537749@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-asteroids-dts-updates-v2-4-66a56c537749@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8712e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ua5qo8SU9V0ZK8mivTUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: nzaKVVs_TNWDcAE8wK7tljuie7kO6k3X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX3tI16dY0HEtQ
 iWGTV79x+tKU80hW6Q58g5muAAWrqNtv7hbvmWSQJj5w9rxQeuETEVs9FDTswzYrtRmIYGEZyr4
 7dpE3yHRNMYpw1mUaILd0FxscK2rb14=
X-Proofpoint-ORIG-GUID: nzaKVVs_TNWDcAE8wK7tljuie7kO6k3X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXzMaP9PvANVUA
 iHcUoCK36Dl6FsVj7ksdswqbg7cQ87Mg4Zdd/d2wYL2IC3puTFZTMPGXusgGW7RuNiWpjCFVY7M
 bOr7Tjsdg78Lde1y+fa1eyPGMGv+ez8VxOWvFIxVBBYpdo07hF96er2GXSmkah20g/bMkzkZI4D
 etbpUZbQzZm6jyWzp6Ab4KYEw/Jt2JWDfn9R6s1tdq5jx8hyd0eLV47jlrcomq0FMZEscm7grJ7
 LAVlPjTVJnqLmqnHvE+bNtltS8a/gntOGqqEaRRCV2qMojKuv0NJ2sI5KQLkxlHsJdsQzoPUKGf
 JfzkPAziBac5b5KxP6nKMv0QEuUkVmofpum6ZOQhW1rqzP73Dh3zN4ngYTaxnyVzmJ9NedLeyMD
 rn8ZQCDKU9OOY7UuTvCrTLfD8gIEoemUYI34lfeu6kj9LQGQNZW73fXXkw6qzvhPVLlCnYsLZ1D
 eu9x5U8vrxtA538b1Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

On 10/30/26 11:41 PM, Alexander Koskovich wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
