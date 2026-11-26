Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681347;
	b=T7rREwQ4IRdZ1426qMuzt1X7kl4JBrvUB2Jqs1nUxUqutaXRd+vAS4oosBee8zP7Jc5N
	 rgnU6iLOvlML/Xr3eGbuERTsBMupesZOrnOF3XWLHnnR0Ml/o3p1oV0j83QtL35y/moxf
	 38oQi5kHH2aevcg0CVvXMAHYVFB168mAYROb2NOupXrcRChgcw3Cs1WPgiF7Cuix/1mnX
	 t4eaffxfOxPwZ9p15RPf5MVCadyyhAqBl2RRVi45zNQPK8kJ06rjGupJ6fVZCpoaBeFCs
	 j9iAibTIqp888mWXuv/RMH1vCq3hjSgGUu0A2CZUU1zBepI6bzVDc8NMzZzkt/g8vTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2HrrrNBgzbWtkSpe+9TVW44m0QQJQ8DUHceGh1QnJJM=;
	b=LhYa8zgTqyXV0VNKfraqAGWzikv6DyQmfordJigP3uI54I9F0nhAj3+9EQ0aVomaNAnr
	 x9hJHnWFXhxi5FSFy1JxcsP+D+zUCY/61o/dVIpW+VTnqlwANeaTTwqEP8EtEuRiadDAT
	 eGYohuJCYVW1t9b9HbEGLHQgcToTgTHi54cbCfL/NaF8hi/C5HqeChVFcClFeNNBl7tu7
	 IEs0RWFAhhgri4FRwULSCZL6cj3lqbBV68c5dyNg9Cr5ZybB8+6pHPQtFqlBBX6VvXaDm
	 7pNKB/g+J+0g+vxhfsp9BcqT52iY5+oz85Fm6WGt8h7wJtz6pV4TzhOtkImdkRSir6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WIXojQRQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdoOoLRL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53716606A33C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53716606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WIXojQRQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdoOoLRL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B1pW2334995
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2HrrrNBgzbWtkSpe+9TVW44m0QQJQ8DUHceGh1QnJJM=; b=WIXojQRQ3Y5WGDbj
	QFZG/OOQ2BOqxylQTkThF6nZZN+Eji0XrvxkpwQnHG+2hRcbMzRGjSFR/PHFjEaV
	TCBFhEPn3K3YuG0CIY2q2vNEuf2CzsgLeSWWxsyKWevv3EEFwMjtsbyuI6dFG0fm
	iQqQc+klHA8LN1J/wfwVWhu7nGmzmTDkMwFETNjmQzvDRhqerbzk1/oBB8g+esVH
	Ajcx3eLDtQMfo58kgkgezgP7UJ/U8c3ClLjEj+1LBh9P1DN53tkpolZDIqnfHgbU
	ItSSaHZvMBB46u6C5mblssvKyGJQZepfyEUVhdWwv8g3SDWZt6MgkpTdkp1H46e/
	eSBHbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak01atd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:22:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495f7e03b9so70501985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 00:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795681335; x=1796286135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HrrrNBgzbWtkSpe+9TVW44m0QQJQ8DUHceGh1QnJJM=;
        b=GdoOoLRLgf+YLCleVYr7Lla2mDo6hari6tI1o/TIMWbQhtwP87vfuWJ4OnC+wcUCFo
         PDNu4BAIudswnZQ9QT4ND6w97dfxKRG67uk5hr2yVkhtCE+yv1LE/dSP/FonK4JBe6eb
         5tn9pnXOZIjWXAssuQCKzO0mLp76sQPyjwNV+fE1nw91+0u2gXDJiKZ0lHaBg35P1CoA
         TqQvpLwIUrCkSZJw/kxgjUcXoTXv7uIF8FWKN/ZbckWLHxtjlzzn+NBEomJQlylDXl36
         zAjUMfMvR22Wjx83IhiYT89sSPv/fxFF1YYrZaTDcgvP6yND6IgEV7mWGe0tvV6p0uUV
         W+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681335; x=1796286135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HrrrNBgzbWtkSpe+9TVW44m0QQJQ8DUHceGh1QnJJM=;
        b=Y82kajVLeQa4YOr1V8iUSU5A6vudY+NOBQxTfrNpa/6ZeyAE6fWZ+twaDAHMfctHK5
         tWUHeVj/J4Vx+18ADcFemJuBzdzYTMc1SI2ktq/sYbhfr8EXUoHV/3dbFUrAASgn4Fu1
         TNfIZTaQ7+XHyO3g6GbUqKTdVmeVDLk1lZ/fec79nFK/P2Mtf0K+BkIJO3TVaz4CdFXt
         aqGr2iGzSbHMByZ5EB91DNN4YLphJbDMPK/+S3udm0OaxKbfHd4QAo2FnQTs2ea49U5n
         zj7PR/6pGn0w6ik7Cm5N/E8++QcXBa+pEFYGEld389KOA1ffavbUS9/hE6nXforTfXyV
         OsYw==
X-Forwarded-Encrypted: i=1; AL+hErGkE2DJsb2FRUqEnmbtBW8w59M7G5QB+9aoIyyKWoc9AJbz7dCg4ABNRKTkP9jFNgKtNPoYOD39GNKAiGBR@vger.kernel.org
X-Gm-Message-State: APuU4Z8OOPcU21GGeKvKcMTeOaUxBqlZdNP11Qcfco9+Lg2X6i3KZCXb
	fyeMswbqhASeWBQy870hZ6ktd1jFNVP+h/8xHKg1craenmpi7n0UY8twXS5AYiPrm6da2HGPM/i
	bxsXG0Jj/WIUvN2xHe8DpeUiwYLgY+puIv0RjtQvpnfsw85y4DM30XWdyfFxGebQou0pi
X-Gm-Gg: AZFdTZelKILJqHctcaLoRgITVyzT99jHJHiSHdCnNF4h2csCM2D7ZHs9ndkqdoiEzck
	RUlMatXpKDl4/qxKoqkTUUNrgrUDXXcWyrUO6r9k6U6uX/6a+AeT2m1JHlKu1NpqHCh03DzY0eK
	Nb4afw6wqgz82RiO48k8/ORJlKDyoPFHYUAtamKRI13TWCHl/hIwI9xt0WuInKMnMm7CtrXcjhH
	C3eSYHWHuy0Xitc4DP7PDcc1j/kM2MZcwYLiN9HhgUthNjp8Ivj3WBy5Ha2TAVhCNcLl7oa1FPV
	N6VTN4QCeAL9PgKAZJXegPYcHjKcPiQpvYDt7iVr1ecnsbtgHHnU2CuEt2+kWUzgxnuJrgLu9uq
	PfYl9PwznENk6OyiyWO08bYJbFddEwhnu81k1rrLg1Wdd2O5yaA9vSdsI52vXaUb233H5aSQ=
X-Received: by 2002:a05:620a:2310:10b0:944:12fe:c8f1 with SMTP id af79cd13be357-949ba68ae5amr3525910985a.0.1795681335537;
        Thu, 26 Nov 2026 00:22:15 -0800 (PST)
X-Received: by 2002:a05:620a:2310:10b0:944:12fe:c8f1 with SMTP id af79cd13be357-949ba68ae5amr3525908485a.0.1795681335036;
        Thu, 26 Nov 2026 00:22:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cb764sm9672071a12.12.2026.11.26.00.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:22:14 -0800 (PST)
Message-ID: <1bbc9b09-44eb-4208-a260-9c6b5fbc2d3c@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:22:12 +0100
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
Subject: Re: [PATCH 1/2] clk: qcom: gcc-qcs615: Fix GPLL0 AUX2 parent of CPUSS
 AHB RCG
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07ec38 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CvmSFNv89NKuAaQCPNQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wBulC3BHZxIvGeNiJoj7MovdW3nVRs3R
X-Proofpoint-GUID: wBulC3BHZxIvGeNiJoj7MovdW3nVRs3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfXx71ZSc7m7JQD
 RlejDkSt1bZYz1GABXfOPDYCglAJ7CK84dEOEXbEeAVGFlqbf0HB+fD/jYfEwYHqqvHCx+Krbtc
 H0psLkp+/0xDq+cYe7SDchDExKY2Er4r5OrorcKNuWjbvEkwJr0Z/d5aArpaK8A0DdaS3G2B9CK
 xBLRsmeBSBfHXQ+KagHdRicdeZzUtdVVHTSBJFrcwwkMlZHcI0Otr0ROeNifL7bIx/VhCvGTxbE
 9tdJqIZxbyORBNpgbfgTgizT4TWrqJ2infMaRe2CVriN26EYObTznojxqBmSGBHDfvMjgI8+xil
 zCIzODZPfQVw/3hn4Cw9Em3Xcg75o6/YZwa5diD8uW/DSCJn9uClaHxoDz+G9748fx7wWh7QKb/
 zZGWd+xvQMur5ysXTbz6o7gEMRiurN1QyXUMBXuQh1TP9iX4BWG8zLoPMtkw9AgdnJnzb3TecBw
 csccvWhVA393aYF5ANA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX/O44k3qY+xIr
 uu3d4CfJgIOI2RaDPqhD0Ne1cpSu8xpPdIm+ovA5BDK7yTvArSj2i8ck0gV3kZSDiGpnIxX/3f3
 ZbR5KUrDxdr28+64hPUc9TxJt27hgIY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

On 11/26/26 8:40 AM, Vladimir Zapolskiy wrote:
> The always-on parent data of the CPUSS AHB RCG lists GPLL0 twice, while
> gcc_parent_map_0 describes mux input 6 as the GPLL0 AUX2 output, which is
> modelled by the gpll0_out_aux2_div fixed divider clock, and the non
> always-on gcc_parent_data_0 refers to it accordingly.
> 
> The RCG frequency table has only the XO entry, so the kernel never selects
> the GPLL0 AUX2 input itself, however if a bootloader leaves the RCG on it,
> then the clock framework takes GPLL0 as the parent, and the RCG rate is
> reported twice higher than the actual one.
> 
> Replace the duplicate GPLL0 entry by gpll0_out_aux2_div clock, as it is
> done in the downstream driver and in the other GCC drivers with the same
> parent map.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

It's not used anywhere but it's a nice find

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
