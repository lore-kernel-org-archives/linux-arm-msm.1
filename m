Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957BB471404
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058447; cv=none; b=EN9nH6Rsw6fGiRodqq3g+o00mtIdLww9KoBO7szjSGOGaG77tQNlA5EipC+PZ6fVdRcHn9BWD070dQ6j7Botsp2/g0SfaAQdMgXAqdi6pNtMr7JNzBR0DCbFpcLnCLpXkpFpoBx4Zbiuz4LSLGBVHaTCfAfQwojUxYtfCbo1G8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058447; c=relaxed/simple;
	bh=fliuTsK/BPwnCwQ0bYrWsjoxZs1aF8oNRd0XItMwxkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3uiMsFpCLIWYMU6iavMKq41TKKghTLqM5vF7J3uILmBA4dUy4VWngW2uQMDk6VzdtSTkMCYwxRCOGcI4n6hmSPx/+aw4//g7Y07jDGzzlC3vLv9nu7CK/p63zPCuMXGwpNcF8jTs44CH4husfFKE3eowDWyzPPXb5XuUqqJ1ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSITYX7/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFB5/lFZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSITYX7/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFB5/lFZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABcIx1336419
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxJFpHpsVdgcJukWbRkgadowwJYA/kcIja6NBxo7lvE=; b=YSITYX7/I/Zmq5Gp
	EQAOOVs8rWKs3IjEdvl1f4780iMXtYqJUWdqHRemKtGcTbo6XQiUOzRb9rSqo53w
	9uWeTnZxgoHAwcqMdVnGWYgOpQdbE/p8rXc69zCEY1LaAFzIk4Qk2s7aQiFD/TA6
	P5w969GyyTN/WECeCWi8zWy+z9o+m69WazBQqLIO+VcPG5kX0IHs8FwjzRg4+hqM
	X7rnlfvIsTYAhyWRo8O+ePB9QfiHTHHMaIAp9++FziAlv7peplrt5fcPkrEIEHdu
	73wFTm8DQmkgUaxeeQULptp3hZPkJRlBn97FieweXOAcO0H1HLmccASFKyuZmJ3T
	zVjZnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp25f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:07:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93495488976so121395185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787058444; x=1787663244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxJFpHpsVdgcJukWbRkgadowwJYA/kcIja6NBxo7lvE=;
        b=VFB5/lFZklPGPArEB1tbO8C8sb35SUFdstHvcWsPt1euE/cOklY7u0g7DsbrEr2CWV
         HIQ/mYDpZ0G2E+rQvGytxqR0xkhP0dcVo7qYYD7j3YtdZeMFt2TWhDC0ne+qSFIJPPYi
         GqMRCTlvHvVYNHiDlrzeXli4qolIQhobGWiFM5Whk9wNQIbkb5kafhffzzFKrlx4HpR1
         7Tc6mM7vlgDzGu6TIbGtnC4Yo9gQBb9T4UHMxiNUkwAxCxq1Yt3WYOHARqVZYhbLNDvF
         7u0eP+YypHfu3MMsLg4yb3bm6nAHgW8o7zNnUh6JVgC+yQZ2qk62hfvKnhKSuhuIQPJi
         0Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058444; x=1787663244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxJFpHpsVdgcJukWbRkgadowwJYA/kcIja6NBxo7lvE=;
        b=ptXSq94HNtmAp+j0qT4GSNjz+AX/32tpnfR9zYjIo/0iv/ChpOIZWyHQLknWgjGAxs
         /dn/AQFvNoKRGd3tsTQYD3TVG2THTeCkmwzvac3Ch3/fMWMLFqMmMUYZR0DavDPCOnyl
         EApcRvS47YeVMbyHrZi2M9hcCjAnSaE6JIOlSHy0d5x/vamNIF/0D5xItNn7PntRBVbY
         peJnLOzOD5c+j/oUefwKaWcjDjHDDk8Mln3U64dPeOPS4ap1G/XtydA9SZx6nwdAYQuA
         Wcn26E74meOdy3eVi01rgU1AurLuj0fwz7vnpc4XQFaNH9P/b0150Ci6wgVbOYjpLuND
         OYig==
X-Forwarded-Encrypted: i=1; AHgh+RpvmyXT+6a2kQkYLVYevg7njM6qWK3gwqpzJdkYC6ksmokj+YOOxd0hdRzLHqX8wpj7A4x1zsq9FqQXTgfU@vger.kernel.org
X-Gm-Message-State: AOJu0YyZczwYhHkodRqeUzX0Yhb46xR3EYnLdCmoJb3IDl/JNjEIfwtw
	TFtfSZxcm3grizr+bfV169zGrO7d7wx7HrayPkBrZSN1f5JtbvktSZ9YQKLGEJrK776lBUxd24C
	HNMq1hYTYJTxvbQcPuCmDUAyjPwc6ZPZuUOJiDa+QkTsGgAwhlM+tgKrcyxt1exYXhvppC3JZ6X
	AO
X-Gm-Gg: AR+sD12CzBGmL/ocevn3n7HrpxScfs17eZLPAEia61kPIj0XGTNKCANws0OFAt66PVh
	N36dG8kKEBEl0/AghFiHaYWXXuGiux3nb28Leeh4C4QW2WJZHqPBuwzvrPyfOAW/xnieBD5TVng
	1HnbSbeGljo6EvFNmkogmnuCFcpxZXSzk2SpNT3EWnD02WJyA3l9xH9kAKGGN642n0zEOXjSGLj
	F5sDU8pdVhL+fYvDfk4BJGWZ7p2FQkNTgpAmC4deAerIIRGVYtgWdL2IP6E3CkJDBJLukEqXuLk
	32Ikr++KQuhsguHPPOwksXofkvVsmk1Hwcz6sVnkxzdOsBNg3MC7F45kDzA8EzsGqoz375JUxq6
	ZeyWY3osN2bGWgj4FErkOlMO+
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2368801085a.4.1787058443873;
        Tue, 18 Aug 2026 06:07:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2368793685a.4.1787058443274;
        Tue, 18 Aug 2026 06:07:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b204389sm12548431fa.42.2026.08.18.06.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:07:22 -0700 (PDT)
Message-ID: <1343ba70-96dd-4476-8bb1-0e81f7ffb3c7@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:07:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-5-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260722142342.990384-5-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lDQJ6D86KKT_jPh-5MLCsC98CMfo2Jla
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5NyBTYWx0ZWRfX2vDGUzu2QaoB
 QNXLc0ENJdDFdcEH73QageLbvRQZx47ganeK9xTpYllU1JG7YGj1KqYTj5xolL+BEC2naam1u1I
 5EF2k8LB/H80L9unXSyKTmJbZPElYDZCldTeJWYSkGxrJML89VtQCZcfSAZcNv01gObUMaSXLVt
 BUeRmMvjP3VAWV716PoQlHQ80QzuVTKO4gGBrMslBM9CyVGrZU9SlfeKycAmCY0bWloSdSwieVc
 SsBwK0yWYdny3ohMda9sw7SzD36yOdkSyswIn+phdI9aGJx6HQAur/jv8Y8wINwO21jBfvt94xh
 nHo4DyMpnj2sWjqjockrQoVW/YBi6UwnmIkZxjq6MLyg6D8CH0K1nX0iMT5+UzObnHNDfeHF2GS
 Y2SMaGYrPBgiSHoJG1XiGJ7+Y8OJqQVgN3jyvj9cFOdtngBvpVk1y5TzxUKdNRG9cQuzk3HxPHd
 JutbP1U49+NobKlcvAw==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a84590c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FZAofsGHiTNuLk9495wA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5NyBTYWx0ZWRfX6LKelHLvKj7j
 wJJ+HTXmzqgJvqQslT4x+JVWfParq0Vyu//eYwAdW2FEhUj0p2NLOMOzv7gUZr3b2ZHJMASto5S
 LYijrXrRzsTf4Xbf3DusaIO68tQZ2FU=
X-Proofpoint-GUID: lDQJ6D86KKT_jPh-5MLCsC98CMfo2Jla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180097

On 7/22/26 4:23 PM, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
> regulators and gpio-based card detection for the platform.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
