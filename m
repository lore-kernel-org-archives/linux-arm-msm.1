Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79956471244
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 09:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933139; cv=none; b=L/oJtvsE6kLWqdt6UBRv8aYDmnIuX+ykE3rZ7BdxF9Q+kggBV38zwRBhQQTsjZTx8d21O5LlHoQ6xbi7PqrgzmdkJfxzolW6nshNbKE7nf8KSE4D78YC/laSVXYSfExLftDXthDT44tDrHfVRErW5ORZ+GG0oKjTkzRGVFVNLyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933139; c=relaxed/simple;
	bh=q1sQP0jSMabqBLByS0JA+kIQop7MqbxWgUxT8vPElS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvbljdWlbVuBMg3I/6Hk7k6Lt7nOTlAs5hlWQtjaHpK5P2x8ccEZEAXbBfxEsvZw2arWEKIwqu+TMblR0AfUPSU6r/aNLapXEdMBmFOYFfjLANqbqKM5omwZxgRUkkswF/SUs7mAeswqwexf5lww1/r6C1mYiLfbjIcYB58o2oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=om7IpKFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RipdIxGx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="om7IpKFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RipdIxGx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jk2R3416655
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 09:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q7REW87UOtZN6GwDsqQZbkRE
	pngXVIwDCDaKGan+6pY=; b=om7IpKFEmXTPTkc25zFgb41CraoolaO5QJZcKEbR
	wW0nVib/Vb6FUDJ8Fz5xpT3ackD+dWORQSioHTQKlmbYOVzJ7cMCDgFU0B0YlCGX
	+y51iHjq1xKVNjsjHJyrTHQQS/Cn6E+KL9C6NKMGo+WdoyljPglnFi9iDuCmOpew
	MA+jfJ4H+dpvw1gEDQ6RrPddbaitP+sNuytQgktlFjNhP8Py5G9hagqMjX7IC5dK
	cOgYQ6djJZvQRaS2+Z6YfGSNcx3zuQLOHQXfmQI3g16rYE7sKRsBLzhkO/NT5Hrv
	83cv8cYdgpiAGsNnKXkl7larf/BGgOLyeIBfEdKRAtmVKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxeah68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 09:25:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso1439488085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 02:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790933136; x=1791537936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q7REW87UOtZN6GwDsqQZbkREpngXVIwDCDaKGan+6pY=;
        b=RipdIxGxF00wfrxLqSe6QHGdyWCzn39UZnKSwJElm1kdT3TV4+YbG1yDRbxERrnC0O
         i/cBj2s/9txVT3TdsUQszwMwBA5w/Dt+WIn8Jk69bAjktnAViwOhcMEVbWuod5l2Po40
         48c79KLkeARKpqXsmGdqoNBtqDhyBa4E5omdGUf8wB5vUY+4z6n0MaCbRrOReXE87Bo+
         /uvA8GLY4RmG5x9GTl/BcJw/9EBOXQ7b4q5idMQ05LxU1qC0y5DTnR7qCnyK9AnL6mWo
         tVT+EuLOx6vt2d4aJgT5ojLJ+rPeMXTvKuXN1kcKfh9rXQylWHibmw52411xVXpcc++m
         Soog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933136; x=1791537936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7REW87UOtZN6GwDsqQZbkREpngXVIwDCDaKGan+6pY=;
        b=UUnsh5mIgWAWrgxU8Gd867MXyweGZgDo9JXOX4dnwhrCbGlgvrzStQqJYo61sJTLJk
         2RzviebCg7dQCshu1rOFXrr5tq7unPdkmfZvedm12Ut9OGnHYrHshvhAbFl1/vdzDf9D
         qSv8RH9FuJ4l3bq8uSWR3PaiGozhcF3c7RJRnJSo6t77MPdQmH07k5LMUgi/T39R7sci
         QIvKglWY7X5f5w00TZv9alV6BxalU4oyoE0rlaG0Wjf+umAzy+rqrO2ZjWM3oVU054sV
         6F+XWMqRQHBJFAmakLLwZNJfYTyoTLhOzpcf/0z3yejS3csf9WwKjPpsrbV7h4/E3oR6
         XJqg==
X-Forwarded-Encrypted: i=1; AKwUvBy+2/tFfZrVjYIFTqyDRxTmwoPa8/wROgbRH5mPzvBUwwqK48Vyg37ZpAmEoCAgZQ2S9Xy8vztX+rMn5f22@vger.kernel.org
X-Gm-Message-State: AFuF++nmim0LQUDAOhD2dmRe3idVUp+H5ULRyjNL+aTGtlWjt5XXot4w
	pkZb7+4/N9mUhp+b0L5MLnb34MWnJb0vynozm8e/iDXZ0ztNSRGmccCJ5rpFe1YC7eLiikpfN8y
	3qUHIOFhxMzn5CG8VuPYfX/0xrcehdq00kWvc2i9k0Lv8GQeqP3Q2KcqkJV5OSwRfi/RT
X-Gm-Gg: AYBFou2cLPBcWZxR2kXjBQeFyNNhQMHcF9Cys1TZXvrJok89v9DTcwOV/F9uzgnTr2g
	/uXoh62ZBRtf1gW6eQ9i/pL4+02UEOQ1EDgHPavF0OYFluZNICkA54xJ439P2SG7WS83yMrh/J6
	g9EStKOXlo8u6USvvQKVZ/Q9CybIF+cWSqUVFiMTRJKCQ8dFX1iZENp6EqfCxC05W7pJSdst5Kf
	fXiFoTtxR6/wXVRoqTX/9WeKELJZd2ehXFhpVLwiaNZfvmfSVze7jFSp435HGOwdZfft4wqoKWR
	DsvZF0QqbXqIgJFghu+jtylqyWnOf5o/OhucqTCNib1Hic2K4OoGCGfjaMvVrXX4sI6jaJ/+zgx
	ThG61UAoX4inYwR0=
X-Received: by 2002:a05:620a:3198:b0:939:fde0:a71b with SMTP id af79cd13be357-93cda7f4455mr339642885a.0.1790933136154;
        Fri, 02 Oct 2026 02:25:36 -0700 (PDT)
X-Received: by 2002:a05:620a:3198:b0:939:fde0:a71b with SMTP id af79cd13be357-93cda7f4455mr339640585a.0.1790933135527;
        Fri, 02 Oct 2026 02:25:35 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02773ba02sm63067295e9.12.2026.10.02.02.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:25:34 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:25:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: Add initial
 support of camera sensors
Message-ID: <sy5wcnsxheed7dmbef3e2lfvyvalpzf6a7vfpb6lgrk5dlnkwt@tcyi27ubyn46>
References: <20261001145206.2442665-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001145206.2442665-1-vladimir.zapolskiy@linaro.org>
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abf7891 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DOqFjKOROhRMtuQJcjAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: t0TEJiKLWOnXnLvUFE-kted01wJr4s84
X-Proofpoint-ORIG-GUID: t0TEJiKLWOnXnLvUFE-kted01wJr4s84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX3PB5MKpGTDh/
 mKka5mwZDoicfU2jw9XLwlQrpKHl/oiTAAdgPfWjwGrtzDYfCN/fhYA5PjFBYekncp3OyMgDs/H
 upEZI1VQG2amsCawJ9ftb7G2pZFerGb72w4E80bSOu1VQNr2dIlLh20nI9KDcqhAqT09SnpULFV
 MrLiae6a/pGkxbY+ueFmNmLynhfc7LBxbNp1VUt93DVF55/jTTrE0rndf+VaZWpav0lTlHjGMcV
 ohqZw8lH8LdgM9qny9qXdLTvTBDxG3mku6CS1VrJRgdakIcmtyRMWB70KlyiXhg9v0pELGYnZik
 blC4XbTfbGWwTqsldMCG1kTPbkHpITbH69UqBTkuqwTW6grOwjab+1Z8aTmoUcY+H6q8fFQzJ0y
 JkuyDcWDMiFz8AChK/UZbkOqrkBFKcXRaKYBPH2YbCnivaLtg6RlgyERAOUHHDUTgbCJl1KY6BA
 T/5pirC0mOMaDGzg95A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX/cB29jkOqxV8
 TaXnsThllrX4BHYBtalintKOEG6Ov3SMKcj1nXihTGfvknN4y465tQh1cCLcGBKMTvmbIM6XHWu
 Ocbc7R9CjOzRPUYGde2EcNaN/3f1xRc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020037

On 26-10-01 17:52:06, Vladimir Zapolskiy wrote:
> Add initial support of camera sensors on Valve "Steam Frame" device.
> 
> The change enables CAMSS and adds description of
> - a pair of OmniVision OV6211 monochrome eyetracking camera sensors,
> - a pair of OmniVision OG01A1B monochrome front camera sensors.
> 
> There is another pair of OmniVision OG0VE10 camera sensors found on
> the device, its description requires a combo mode feature support in
> the SM8650 CAMSS CSIPHY driver.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
