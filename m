Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BDF4AB1AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820363; cv=none; b=ED41ccIBJ99uuUgMTCh4nOolbzgP6MZXxzKn1hw8qIaC6aB3Jv4FMupfcjNfeWT7gLcp2RmNqoECcLBSA5gTe0jDaqZj0qeigLySwivaJyv59tAyrawndUSDge8AGDaKT8bbiQY2qXeVDHMZN/NMix/0h1sp+XAfCBnNX/cH/9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820363; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zcx1kHFjttWoZ1yy7aFFaHq/yKbxvg+ohPw9k5GeQLIyl1OeeKwnb4mJXd4ZgazBXvjpknmJuHeS/vwsCY3e8BrIiA/xtl3ck8Kj0Jd+td1QAIUwz5Xfg6/vdH5emN07xCQN9vckkcfr2IYl0+8Au1kFBSk9eH24y78fxohc5WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWPxwrMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/6L85bF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWPxwrMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/6L85bF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFeqvW3851192
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=GWPxwrMkEjVUKxlK
	L/k+OZcFrykZB4BugiKn/ftBWMLJxY3lDlLVBKvBfcA6laNZ+QN78Wv1irHgeELQ
	o1BLycTd6TlWuueXF29YsnTdErn1JyLC15BS7RmslSesQ7LwNED2b2uA7NoVR3pK
	eWYyAye6DQ5H8/8TMAF9P68gxi+8S3cfvx67wQotTy/wmZsO+87Ld5kEUtU5NP4c
	zMi5CYMiIbqlv5xWMF+oiRQ0ggXN9CM3MTjPiAtyiDVSEugbVYSpO2mEOsq9y+tf
	yLxVOc3ZVfHMeTdWSLwShG1FmW5VVggoNP5do+QsUnsd1uOj0XEOD2u6LAswMidJ
	hd0liA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9h6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso28100685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820361; x=1792425161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=h/6L85bFg0W3f1vjDgQ9LqdGvD+vt3bTEyKDfzzCMYD09Jmu9h9KPnz+US2vBacBIV
         wmHX50ZgiqIjOcefwUuXMte8xnllF5WzZbrX+muTz3iIr1N39Q1RtfsRyf7YHLDdm/fU
         PsCrnVBBdZaeGfZqbtLpAtqqJLQkuxd0mLq4508DZb5+WcASsPlkdXlEO1p5Y4K0MO2L
         9jhU9HCpTN++jtXelrW0zuYW0S9E0Z1uc6niYJRv/D7mmEv9IMTVajwNe+5PckHmC4pI
         ocfWSJb24iDYoyYVARDJdQlSrN5WhObBUl2X80taSVkP69mm9JhefCBTYMxmjU2+C0vG
         L+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820361; x=1792425161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=FQ6EK4d1BI2REGFARLDAnE4OphF/ukRd+rOE5zQ8Cr2+9GDZY4lCkF0qYjep8hwlzT
         xLELdRSvdCa4EeA3Pe59NhmcTF6Q3CDYBxurbVtgdOBttFo1iItrgDb/ZibJguI+x7Ni
         hRcrTvhXLwaPQRj5PRVuKD/xT6nvZmJIwr8LEz6t2OO1636q1ry/MAnYub83isYT9xvb
         zk00/knwvlDSZqlWuuvlw+768NGON/S4WxtbWhzNhaFgLj9CplMYp7m3j36WVJl+tEai
         uS+NM/rdnuEurh/LcIyytQ5pnbZVBt1lGMUHtXEwwiWcJUlbFd8svrW/HwhWzt7/QmNA
         9K3Q==
X-Forwarded-Encrypted: i=1; AKwUvByNEgWa9giOdBSPKfxsa9x+dxGX0ryUu/IKqEB2YibjHGwXnHzg45RSbBmOOrVErmRZmXE650KNUx8BLwRE@vger.kernel.org
X-Gm-Message-State: AFq9FYKW5Xd0djjNgn3YJgB981WexLYQkrLN8tkvZ9SO2yGW1uWAAkmp
	ldwBoLNK2ZYOMYBjbnnKzc1f3agBwirvS+P+Wq81eK8oJZh1s6D9EQv1dE1vJnIF3rSwbK0/Yup
	jRIse2WaYaJsyb/EF1lMlY6inGVtu1xLh5kN+GHiAviwzGduch9nkzolEBRu9PiGdFEV55z0ktr
	r3
X-Gm-Gg: AYBFou3Kbtblmtbeu6Mat5Y6+ZTLrKa+FeRU36U+RXsNlaOCM3XGxSNFcxyesSF7+Uh
	9oTD69M/JjywVOzsv37uEOiCwAYtsEknmW/rmfhROEWsrPCHPukxeejk0Bsy22bq+K7zf/xKEfV
	hfUTscTSwvCsbtShKDShjeWo7wYlpdBmLTnper+Wou30d5mG41L9Tp9S0cK5sygtSoOaT3OBbDw
	F1zvce4PkXjAe4VVoLNtBpaJ4MlKELMi3Jz1LHybkeAOCWOeyJJQT9Z3CYOCsl4lMahDMH3Kesa
	SLfjW2zXz89BdyVGspqa4PU/upDxhKqvtXHUHCsrLdLEUezPk1J6bZz9X1Lga0fRaeFJ8W0rGMX
	JJ0LrScLsoTG5AXUFOpilLw==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1908146885a.4.1791820361120;
        Mon, 12 Oct 2026 08:52:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1908142185a.4.1791820360671;
        Mon, 12 Oct 2026 08:52:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm480313466b.20.2026.10.12.08.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:52:39 -0700 (PDT)
Message-ID: <339c25f3-72f6-456d-906c-a6baf37257a0@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:52:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 38/38] arm: dts: qcom: sdx65: Align multiple property data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <d0585f480c491b5d58d7f73a7f4429fb4e35f67b.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d0585f480c491b5d58d7f73a7f4429fb4e35f67b.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX5ADGhMNQPPgo
 ktPU9zY0t2ieZZwoxvIQzociUA+HpnRX6GUsxwUJrVc5SDctpFVZ66mv91/BbFFYmRjNd3ay3Qu
 gfcJPHbEYMkNepU3+2s0jVxOMX/GQ0iyucwmbqMqryQ7mRuysd9zDv0tTn21NM5eXLQnYDTT4K+
 ePCG1kcDvat298ZVzXtFK64jAfHkoTWAdwyYCuKo5AS57+l5GRWM37ShCuVjXKHtJWq6+i0eI1g
 0NLGR8OdnSPSdRG6OHEd1g0aoSnxQACaywLYDDagp6EctedbKI1A65owtX5xC5QS9RRjD9eYMLz
 tfPqSqydkQW9dzQqAgLKKbKUauPhV35C3/2K9u7BHpWqpshUWTffDUkruM8ln++YfsHi4A4QSqJ
 fvC6LONPCr9vXpg+ZXCZZyDcbZbclDu5krrI8IXfO3+zvPeCOSEp6/V/yfceFGRD+QbEeHP2Kzr
 8syH+nrThrw3qTGID8g==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd024a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX/WTTj0fKbqVj
 /f7BR+c+hMFaD/LVoAwrWEiDsopY8b/5oBmt/K6tzbumq+0siv5TtGaIdErTZ9ZImIb+KqWI2xZ
 7ptjrKgBu0lfQR28qglAM/u7gJrjgR8=
X-Proofpoint-ORIG-GUID: eTibQXwOGrwUJDTR4RPcTDV8vX9x-XWF
X-Proofpoint-GUID: eTibQXwOGrwUJDTR4RPcTDV8vX9x-XWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
