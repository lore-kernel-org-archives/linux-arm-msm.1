Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170337;
	b=iFHjsAy/7nA75HBZBfrsCkio7weOdmmm+7LhtjPNmu3vQmhqD1zemoGJoa9kXnlRrvq/
	 ee+8sIUaAymRk3C3g1z6mvgPZXtyXArZ1pLXKgUWtVnVoy/U/eabZtS+cmDxVMLA7iGLj
	 yZNhmhmswDQBRP5SuuiE/1WSFSdKcapIvrIZ7LrsFBDVpuG7fLP9r2j33+jqQ0AcGFXZs
	 4B2J8xU+6x8+ZkXoSiFJ01+Sv7T4rDHBZcTFJu2KAPNHixqnLqhhoS6V3mUFmzVY5hjJY
	 pPKXkoOkQlqyIJXCv+3H8p5Yi/gJ5Ls95Gz64ZeX0gw5T21/DQVsn/eZPLxqaOJ8IXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ut2hNOaaHrPSnRNEPnnWVMx38OMkQ2B8AQgyQXg3fHs=;
	b=Xjgm6Bh5GmF8WQVQLCcO6MFAL0YU6ol3HeZXnDXuG+6xl0kDKHY/HlV0LgIuu+sDy8wK
	 NVaznG8gNH5AnRpH5ejNtR908JNjIYT7oVl7cVYgWPdkKqZJoW9572w11PujNYhHIfdvP
	 uwrjKQeIlBcLPt6Ir+LHPh1LkShPLe/4WjuPa4SY3sMdWzXaPbVM//Dzstp3w2RUDfK6b
	 qYrwxPvGLaLKjyG6tGk2DCCzdQ/NkY02k3Hr9lutt0fRAHWzqc7ED5E8DIdu7v8UFgCOo
	 FXdqYKqMfCWxtGJQMX6ioUzhttLwfmwITsFUFnclNVkG3iogUMGSn1Ls67LPXZDmD6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCE5KFU9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTyexNf1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559B606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4559B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCE5KFU9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTyexNf1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eu103575623
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ut2hNOaaHrPSnRNEPnnWVMx3
	8OMkQ2B8AQgyQXg3fHs=; b=fCE5KFU9/fiQGgHvP6sDlyxnB6IZwJbzQRfIffW0
	wSxG/UCKvCPEKDU461gqG26UxpP2qR+GUI1WowSvGonHtz7gjyq/O590nUOAlPlJ
	Z3dA6MFygSM/CoL0pAJdFwOhpsbVhkikqZ2zBMZL8ixJeYu9elsouXsCMQRglsb1
	d+K1em9x4BN0wGYb7cLifA5k/Ay7Bv0m6noHCraE6CGXIE1IBXSQuXiE9XbCeJT7
	fHF7gC8A6MTTQDFDwW5Y283IoZnGZUM6HMwMAAgYV60GYfNz2g8cSD71iSNMdG7S
	4vKqBO9DH+JdOARjJZSmvyT2Y3cUCZ6x3vA7IjsWl8e2PA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80y3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:25:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9211604468aso11202806d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170335; x=1795775135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ut2hNOaaHrPSnRNEPnnWVMx38OMkQ2B8AQgyQXg3fHs=;
        b=NTyexNf1+I4T/0Ml4x+nZRITzoedO2QcI516l3KaK8YBRWubLzCOpKgZVI1wcesPUH
         myZhsZR3NIYsptSOgo0Y3OXascRBtUCpFKEhJsCY2KDUltNnEEtpsrEJoIaL7hyn+Kdu
         dknRt0DevO74l5EgRfoaS2qt29IKcvr1Y/P/+KGpmJMoMl2k1Gst9jbLU4nd7CU9FTfS
         cB+QK3u7ZRcfVh/YnWDpxE4dinCTxMphPKHENM4QqOg1eeKBTZDhUAbpUEkeLc8+Ty33
         FsJHjTy6et2Xofp1MfTD0/laH60LTOmE2aYbfbpYdloTv+W7+IXUS1kftO2OaKw1+BJ4
         aOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170335; x=1795775135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ut2hNOaaHrPSnRNEPnnWVMx38OMkQ2B8AQgyQXg3fHs=;
        b=n7JZn9ujDiCRqCx4h1hSlYG2ifWEtyh/x3VeHpPUUvYPKgjFTpWzDDWDMuA8N+8Sy0
         cc9nKnpqJ/5Gaztqm644DCgcykwJnZjqbVuqx86wLj25cCyqkW2pwdqZp/Ucacuu7JGQ
         XVr9lbrm2ZOB2j/Xa7AABjhpW5AMuZG9W/CtmALyvmdU8bOWiyc49kLlUFKq290HTqAA
         /kBg6NsCIsEHEAn9vl60rr7k4A876LIfFM3MlEWsf1alnCSDiBF6fmCGAPhth9VPRidw
         7u+2wVWbgVqASUWITCXhUxbCipV+4uvg8uJLAotZZLffwynir+waTceibnw81nIg983p
         MBMg==
X-Forwarded-Encrypted: i=1; AL+hErE15i3KOhEAByTKiHMoJF5Rww5/uQ6OdbRaclOgnepPwdM/3T/aQJr8iU51eQAx2b3jUSZPEQ0uvTH1B9I2@vger.kernel.org
X-Gm-Message-State: APuU4Z+3tZ7aNZq24hFV67PDM/RJdbh68TpRQlEur5o0VWglXO5LZesu
	kpjtpn1cbtY3O9d7y5tVoheNSRNgWJH26BbFwSc9dhDVS7ZG83E9t3keiyTv9QxiPRvvVGfBDw/
	SjYl3APQLAY/7zs8BqK9SF8y5jhGTY/ltW7ZbMkHu6rQVMl80Z015WHxQ0yN/PyQ7sF5E
X-Gm-Gg: AYBFou2FHNCCl5Rod4hhw14KMc7V0wVRb0nWP8aS8+0z5+q+DLi7bZ6W6tRx8QqiLSn
	DvHfmQMX/UKXwP8cUejJiyeFbZMm6kKwp484waBoj9Ce1lZ359iqedAkPf4Rgh/JI1bQSz3F2xk
	zPoYqvmA36VDUf9ZkcXFn87xydaJgQPj57lS/FIWG4o3f5py//4amddWOh9ieq8H37IwNKdeEoY
	KP8RdfBmVmwY+g3SnyMzf7UxBGgEI5vkrcJmS4YOcvDCAzeVJd4mhhWexc234twgC/ZLp7x3V2n
	RYhQQLz0opGgddacaxUvlgW3q2hrvqi/JCtKQajKLO4Np9/OHReobjZqxLrtsObI/PtXWebD4Af
	Dr6fhsoR3sPR22dgzXw8YrXBRxUgXKjvRymdgzJPMT0pIdHLEC16oMkibg2VD4w5/
X-Received: by 2002:a05:620a:1725:b0:93e:48fc:aa88 with SMTP id af79cd13be357-949bab1293bmr416731885a.44.1795170334578;
        Fri, 20 Nov 2026 02:25:34 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:93e:48fc:aa88 with SMTP id af79cd13be357-949bab1293bmr416727885a.44.1795170333921;
        Fri, 20 Nov 2026 02:25:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm118841265e9.10.2026.11.20.02.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:25:33 -0800 (PST)
Date: Fri, 20 Nov 2026 12:25:31 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: hawi: Constify known static data
Message-ID: <hxvyvbjlv2k7fiqndvfhrgaec3355bnla7i5fmdiwkucey27zx@x7hzvv6cwpq2>
References: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX/wRIxvwhFb26
 fi79Rm566pgR+2RbnO4fXHWAWfWsepoXjANPt/AyC+UqugMl5vMwzMfdBIJO6VPKdyFhXotsiPG
 qHbLi2UnbH80UO7xaIYYZ8TC7EcuJMYSfaqACXZztJhK1r9ZM8XHBauIi12VK9p030a7ZMRuc7P
 5Wpo+0cq+NmoVCH4r6odAJV88ujD5lmAMtvOZ9VfwKT+yml+/RABid+bZ5jpyE6Ubk97oOhEp+t
 E599o92ZUtrIsW3CtjIpoDWsAKaqEHT96EOb/5go8gAIcwrrq94opQqofwUQjhB4b9KeJyR30AM
 6Kh2jtia2q5vwi0BNdi0vCiIuUDTATmsNqyZcGY58Wk9El1iLgTMCvLp5mYk/og39aGxNHGYDzJ
 kPQ9bv16vmXKiaPXaxFR3odKQ/HsS2jwoKUPfaJ9ANgQH3d29sxvgkA7pQGv290QeRhdPuTHSNT
 x19VKn3h4nTjQgn0x/g==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b002020 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=l5ae-HWxQjlzd3G8lioA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: n7xpq_IdsfnU_OmHs3BDkTwz_L02rROB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX7BjEUR7k7t0N
 4uupH5L4VSeYh25vunOT0O9+DE2J/zB15x3jLLzs57GBxE44uX967sCVFVPRwaLT8P5SxtWsi3N
 I5Vvze5KT5oBzHS6PDQIgQM4Qg+kmuo=
X-Proofpoint-GUID: n7xpq_IdsfnU_OmHs3BDkTwz_L02rROB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-12 16:43:58, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
