Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477009;
	b=c86oqsJQcvWbfkkuHHuLlAsg5lJQtlFK6KzN3qIPuUT3RfHLD7fH93GyWl/LSBj8cSVy
	 Th8mwAepTxWh/pE46YdjlOF0TMoz219Iu+c3vZMYxjGO4H6oe820AShbYAGwrRsWbcdR9
	 Qt9+9yLsE+7TeOQrADANYLRI+XQ9lZgoWsaj3w5b96uprqbG/MuSQ7mF8SIp9uca8sAd5
	 d+nzXcTk2PhGTHOIDQPXfj9zksmlkDrtA/71MTyhbX00y/8H5zUIhQ3MDUV+tVHPt3rGB
	 l1rSgn8vCis1uVHrTARMUw0bhN4O+t3a6I6vKz34e59ix8hDRkEIG6r/ZDtDBGkPadQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yCyj9Uv/I3cJ5AJk11HV61SjvlAanpJ3mDDAS5FWulc=;
	b=Huc0hIg4XKvJYuPo3UWGhkr1loQknwyB+hMQ+nprhpI2oEmj6YCpnFgxarNx3PbfUeAo
	 OnK1gQ6SSleQZZzTFmazSWNZZW+v/QsNmt2BCzgp9gHEFJwMqxf3MaW4ZqTmIUVV9GD8e
	 LhgWPwRinbs8XN/R3iTds7rlyZ6187nLhY6juIX47oHklrJHQhRN+X9Zk5MEN35me2n8K
	 vquc+ojTLu/JqSLNpGaHDybubT1X9BHF2jok90I2ruYxzrBjCVRZwb9HioXUmb+6lK9VW
	 vLTj3hdaW3KqYkcCNlq0J2nrw/uXzBrxqApB+A0i/TzRRlcjF2LOWXy0+CCgBF/vzOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gNUvkOvm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PaFMb/hs";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6D606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C6D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gNUvkOvm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PaFMb/hs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5nmIf442019
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yCyj9Uv/I3cJ5AJk11HV61Sj
	vlAanpJ3mDDAS5FWulc=; b=gNUvkOvmqou/N739X576Y9GcOyLlpZGaayy5WwrV
	iVoTyscancZTueLdwBhOZleco3OBYFoGfA9sAJKSlB5ogdF4AOewrgARDfOAzz+5
	PyZq0kr1ewRvDudryhevfTQkJHs0zf2T8vvFEVf8wH7nCFGyEf0pbp3iHJooHBHn
	WiGMbEU1KsU9hfpnJmGyctKs/QxB4NUJ63Pitf9ZA90sq9b/FH6pc9WDkinxbtxp
	7BD/Omt9Y1iaOd53rBMJXDspQnHRDWEi09xT/RltEI4z4JVeIBKIViLuIU7ma+5K
	rieftMMhgqXDmZOd8aAIP50hdohWQTjj6gKbrWyrEs7H9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0vt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:50:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea4a2210fso47214536d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794477007; x=1795081807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yCyj9Uv/I3cJ5AJk11HV61SjvlAanpJ3mDDAS5FWulc=;
        b=PaFMb/hs1SMsiM0trj1W4qowQ3+LXKli5r68tzyIYr5cT1oz23ZoHNRrDWH+cr/Mgq
         uWJjXbHEIIHuAQBPoXpnWernWtWzi/tTlo1iqMGvwKSVyLOM83rx5cv4c6wanjif/rxD
         /oher8LB/eAST6t47aSaVVktOhOq9EPtX1ddD406y/zmx8Hgzyvxf3DnhkUwFV118sG2
         tBsZIX/W/b1rR69HsPNlXi8IL/6R8esotd4pd+/1Ck+xqko5CkRSpu89Kfo8vzRygPEQ
         MJ8QUWX5dFN7AsQkfYto0znWMyteXXoIJLPJ+Ao2ljedwEmreMEbhRp0psbyvN0dnHtU
         0Zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794477007; x=1795081807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCyj9Uv/I3cJ5AJk11HV61SjvlAanpJ3mDDAS5FWulc=;
        b=TCCDx/hJvmgihieq/TycdhEkgJyriCmytSaEqAcN+krD5FNfuS097oktlfGCy4e+oM
         PDFlbI7J8HEBzQ2wbvMxp2Rxqc/v2OIMp0ZMqbZG7V41o2sAjU5H80GCI4fJi6Y2Fm/P
         jDwjsURVctFG0XPYIZOTn8tNbEU3w4VGOOp2IDpeuD6tUWF7aqdVzi0D/Wa78WFn0ZwP
         GLz39nML8p9NWOrxgclfzCAkKF3ev8o/EFLo5UV2g0MutP/AMhSYVuLgpq1+4A2DCc5a
         Dfev5i4kFLGEC48mMp85do4h6ATOVqmY7uxMWTEdvxO6aNzKuwpbyWu8xGqHpRUR1uR0
         QLxw==
X-Forwarded-Encrypted: i=1; AL+hErE5MMLn+VnOECWPxWJsD9zEKvKQukTmsCU+xV0bsBKZymYbcGrO9j7ohw88gW4qo0pjZ2jCmFSstDplzah6@vger.kernel.org
X-Gm-Message-State: APuU4Z9H4zh32Z7yOsHZtY/yUpnrKK0SGPBkgGR+LA+kcOPVLRbC/ZfD
	tHHfquuGtyjXXNM9z9J5pWkTV8Zr9bjfYVVv8657xOy8BOjbjqzWuXjNZVQVdGAaKSEwp+tXklr
	hHpY1aEdKlZVlD5BuGWCmiIytmn3fHpH21BvFPtP8c2A97QsXFmb/Q9/AJmNVXIJsQWrE
X-Gm-Gg: AYBFou3O7268Z7h5JLGmF3/RxcP3LcgsCg2UCcMnhUlM8/UlvSjdJmKgmcUC1q+RI4L
	GeydZJ2KHJCPkt0H8HMilLirr/In0HLGand8LbAfgMfKW1jIUvnUdo91pH5rCsVGF0o153D8F6E
	QRFTSofLz60js7uZx1liDf6Zzdq5PesSvDA2xookL5LSJfhyuQdkegKrumqRv0HXBayxJUHZQX6
	1AWxPZEbSEiG3Kn1Ih3PuvF3rkmlHztUoOK9KID+pGQ0241TK6JGZTWIaz7/ywcvz8vn9f/oFYi
	ePE8V5WpY/sd9johHy878JpqnyHpt+w5tf0xM9M5/B7hhN1aYurRgbxdBXUwjWvNfxQxqgRn4SW
	K8Mb89sJQk8wRsv3FZ6EWVK6584ON5bJeeYOy2tYxi5xBKChfdJrktwypJLdZBlwv
X-Received: by 2002:a05:620a:4706:b0:944:2f1d:950a with SMTP id af79cd13be357-947affdbf4cmr941055185a.47.1794477006788;
        Thu, 12 Nov 2026 01:50:06 -0800 (PST)
X-Received: by 2002:a05:620a:4706:b0:944:2f1d:950a with SMTP id af79cd13be357-947affdbf4cmr941052685a.47.1794477006075;
        Thu, 12 Nov 2026 01:50:06 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb51de7b91sm24994425e9.6.2026.11.12.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:50:05 -0800 (PST)
Date: Thu, 12 Nov 2026 11:50:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Ling Xu <quic_lxu5@quicinc.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Remove secure FastRPC context
 bank
Message-ID: <4newiumsdgb57suqrv4dgbr5tfkn733cjlhn6va2xvrpmjbft5@gjbsuzstqxif>
References: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
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
In-Reply-To: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EQzY-qRrqOO-4yIm7LuMNle7CSNyj0mL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfX6t/HyjTl2XGO
 2ebY/EZ7kwYswKlUWcnJjjlULOvAG3sNCKGiq4gygiv4PpiMujXZj1fwheXl3LlJKUxglpXpo5l
 UmcgJlY3yBfB5MzQ9iiW+WkSQnffmd0=
X-Proofpoint-GUID: EQzY-qRrqOO-4yIm7LuMNle7CSNyj0mL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfX/K29doMgWKjQ
 UHZfaoyE8w1peOPZVkWXPHpFlPqqnZiBMCUZpj5aYUpmZNBbRQUrigXEnCu0n/slmfYyZGSdNGv
 w00vMrd6Wmqn2m3HILPqdXiD8SygM6X1gCkVpp1LVSmk2FBT4NDjOx4+iKH76xgOrjUxhQmywi1
 PwI9Za1fHNwtYf2z4949AJNiJ65rlzF+fitTXOqT8MZaamMpjBqZWmPGkeLSiMJrOl5dN0LOnf6
 cnctjLCGMebMdqHA4vfZYIwnkoJuvVah014HahAidWEDleYjNtbn2qNz/J32CT/F3R227biaF3C
 oSSOLPM9oisGkJDWoZG7Yx6fihUFny2aCED/ED5bB5fm1hk8YHW96RVHTwsNM6xJQUlSpyRufQ+
 OO2+aZ/Qz0SsBLcRvXgVOwBXYSurzm+LZ2XdiDy2uMWoXnmfnxK3ncbIqsGEI0/jy/JMJIXdDFI
 PkqZ4wwquGnpK4TXhKg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af58bcf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Vws5O8NP2Tv_UqLHoggA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120039

On 26-11-11 22:18:32, Ekansh Gupta wrote:
> FastRPC context bank 10 is reserved for the secure PD feature available
> in downstream. The secure PD feature is not supported upstream and the
> context bank must not be used by any other PD.
> 
> Using this context bank for a non-secure PD results in an SMMU
> non-secure global fault.
> 
> Remove the context bank from the upstream device tree to prevent it from
> being assigned to an unsupported PD.
> 
> Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
