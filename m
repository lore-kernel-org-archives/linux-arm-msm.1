Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437124;
	b=E6v8A0UWcIj7RL9h25VmCl5lUM5ZHhVvT/Orvtj7Ae1A8BAJ7xrgg2KYbPTqGnFw/RfN
	 GXeKJ+uyWVn3CBR5FjhJt1zMyafE5XW9rJ2Ef1lPnBvb62cWqQwo3rirAYTREvl1EAFmH
	 1uDZCuJ1IV1MicODkBa2NG4qGnu1fUuSWrGsPqPIze1yELY2oLwjJPtHP+e4agaZLoWm/
	 PMLVBw6gf/OzQ9k0WHztYxJB5VEyDM3VeIfGlIc2XTRNonxbxM9MPt/7k6x/b5OmVzIwb
	 Th8HPUXYzjWHMS8ctY2S2CpwtFgXqeLfbynyTr6j52ZxSiBJSr7sacZvNlYFbs0ktJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OnWUCT0nP14ewlYiMnjRm7mxk446HBoHRdssfYe4its=;
	b=W8nuKYJ05pOR+RHYA/hyJOLXiOIoTbxCaHAWVRNN+wTOoKrZR+vCna3LQQDGopVuSqVg
	 Uf0en3p0zG2dhyG9amnrgUreBXLnUxUzE5Hk7qr9pPAOqB75xwcukVT/sj1nmxI53GWZ8
	 O8KswBxqMNqm392qweUibBqAY/vnPIaCc+qkaxMzeg/IZ6m/pntYnPijHTsU5XlEvKBAY
	 bONzcCqVlYjo1pwT3e357WVoZ8vtzKd1cImZjOrAQN+IeJztV7HJrug6rPnwfrEug2B9a
	 eMJ656uDU7ep6IjEWtyR6L7tyguhIRGjYxmlUrzLGeCrtvyYE7CTJdcvgQWxxufxHZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A546CuQb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtOMQSPd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD21606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD21606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A546CuQb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtOMQSPd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aHoP595445
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OnWUCT0nP14ewlYiMnjRm7mx
	k446HBoHRdssfYe4its=; b=A546CuQbdAMLXraN1TIUHIC3ExCyLGnsvQ0lgo2K
	nu1eXR4leaDysTFV8YtULKq/MsfXDpBVUgnXfwmf6csQSB8HwaBoJcWVA1954q9z
	Pb5UbN7tlZpl9tHJIdGx2WlAyeBswUD3CyrAgCdlR7Yzc4eGKVZYQPHSJuYFzvaq
	0UqGdjk9o5lTtiXeM79EA0EirU9dNQb2fRTVHEPdwu3nAvqN/Y+1Mhkm/CU1d4U1
	UaKILiwd7Kkr5VsUW6YCK30UfjiQeABRAUslqxXx76DKApGxgrl/C9vStx0fEw0a
	fQbbDZkyrJR5v8UpQLiqGT0iqzQlJGZah7a6Q1kjUEm6wg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93egms6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:58:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3698bd5392cso1278172eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437122; x=1794041922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnWUCT0nP14ewlYiMnjRm7mxk446HBoHRdssfYe4its=;
        b=NtOMQSPdjV09qjwqpUf1aOreafMFrYY70hp+E0jFoZVj9p/U66GjVxocQVBBYYtfW+
         s+WrciXUFDV90qoyzUL2u5WIpKR1nvyA9p113fer3AtcFWuJ5t3IwmI6SNk+fL5X2wdW
         ULVCR+y9GS3tyZMIoV6AKH6zxQnWe7y9CrhSpNJrgoZGe42DN7KKkHb6xV3FrD5k20Y2
         GmHC10wYf/VN07VZIcPwoP0/Uj+k3JnuhllAdyVKBf2PlXCtLWmgAjhXkbLPO+B3MER7
         CgPSWPvHikDUHtJIojGvaz8uhA3U4OmQZbL9rFRBZDATB2vXYno7ywgmJTXNRKi7pJxB
         c9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437122; x=1794041922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnWUCT0nP14ewlYiMnjRm7mxk446HBoHRdssfYe4its=;
        b=lkFk4trVLHr05+0xp620IU+liJBsN9kKNJRGwGlwf+ClmE4yxVIkXfOUgJy+cSPlfU
         BwEbt/a1y8E4WEgB+QlMET3dTw+q3s6P3zpGySBg2yKVRJtA5qpiyM13umQyyVnv/hDJ
         1Xo5WoZXl+nI3Ubr5YKm2vR2lfbsDIWR30PwUAe1c6hb26AYqiWzOtiBYR4mvs3l0W52
         hOm4dR/3wobknfx70tCGzuXlltOW1vc31cqouKElmziMdeC2BnF6q2opSYe1Mn9dfioU
         n/QFsLtzoMHZ0cE9jDBSqnAMgVUCIhFkHt5+vzPIIySQ1eqIEZBbUIoJmeLe7ICQWjeE
         O7/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzhg6fTy4EzvRWbBwlwUhZS/5naO5jzc5WM9CxywAWv17HSVpjh0I0HmewlCF4awxYLxMZUAqzHXGIn+Mwz@vger.kernel.org
X-Gm-Message-State: AFq9FYK3HXVKj+Cf8fxPvyrgT403JpxFArV2IdcsJ+H6u1OFCZztWcA3
	KsuHDce5EEUaVHOsgESwG0Lxedqi3UY/tiEHZoq6n3NM8syduv60x+0duyg0tPHYui5MAIRcq9k
	hID/G+wGxP9mftjWv2SDgqbJ9ro5k+T0DPOg68EY8fwm9RhhM/4E+8fbppdxiUbC3jk81
X-Gm-Gg: AYBFou0ZoYBnK6F04sVjPpggMo318cLAuwEE5I0rQZDnNYqgYK+VEqTamEJy2SvwTV+
	Lb3qOF7nGH4spA2P5kGpcZBAjC+3wORYdyKFlRZtqmtRiTxYEMW4avQ7JDjOYKHmoYvDHgMJ5TE
	UsiQnC9JAbiGGORsG8XJ48s5b+0cSd/OZ3FaAFZBfppR3B5uQ8Di3SpR9Nd9IYsOaAjRo1oIVcL
	xxQ1/+7twA1kbhvQAlUWOXNEC94elF9Cj3Ar8LMIQv4RjAWFPo0XYZTZ3ibBjiUqSofler12dEA
	4zNq/HSEHVqM5S2tbNdfpP8nTsNnbIALy+jzAk+QIrS3OMt++KBRp9JdWatY+4CVmEaNtpnjwLx
	GMi51Zvby2O2vBVak5UkCiTbEt1PtUULn7EaeVsf1UEvKMYHl289BAZGsDUZ7HQI6aqloIsckBu
	A8okHTKOxu5+AcFE4=
X-Received: by 2002:a05:693c:8211:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a42340d04mr6795478eec.4.1793437122142;
        Sat, 31 Oct 2026 01:58:42 -0700 (PDT)
X-Received: by 2002:a05:693c:8211:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a42340d04mr6795451eec.4.1793437121608;
        Sat, 31 Oct 2026 01:58:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm14503095eec.19.2026.10.31.01.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:58:41 -0700 (PDT)
Date: Sat, 31 Oct 2026 16:58:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware
 and reserved-memory
Message-ID: <auWtvHZyuJz-Cvjm@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
 <rhh7s766m77am3yfktpeaikyswehfn5pa3l3hsbd2ugegmq4te@4rea24zv6an2>
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
In-Reply-To: <rhh7s766m77am3yfktpeaikyswehfn5pa3l3hsbd2ugegmq4te@4rea24zv6an2>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX+hZz+V9ejSOT
 dHXR7vW8jcIr7s2wFvqQF1hDjY853Ju1gka1vaOrWbkhMm/kWJWxPOXt8veQ7ax5674UBStiQUV
 Lzaqf+hCjFmVqKdy1H505wbqtG+5YOsIwasqf3EuFOEGPR+zW5+iyTjzTJ1elvm4bTPx2z387K2
 rUxpQXaiMn4WkFthLmhoijamH61EZX7oC1homUyHyy0l34pWJ9IakLD/+EMzmIchsSYCFnmNXxu
 xrlLrsdN6yvTIKG5xnlLF0NF+Gu9cNYAc0BOYS1AskjTYY7FO2WFKpMJFJIV4TMGIX4bl43kewl
 KN6UItrUE8MV5gUVsq+YMZSFwAX1wJL9B9ezSLErpTk7AFcik1azHMYYVnu4TOPL6gLoX5r9LMr
 AJw4kfuYZ7pLd7yyWwLiNLLJ+PzuHcPyROAiEjSg3jwA94JrCvEfRe6YlFgXKxHYpO0JhOeE2Em
 3g2WjmC3gbP/uxsMNLQ==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae5adc2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h7ndaOTxZN1f3CytN_wA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: rP_xUFUuv8HsmKcTTY1GYywo6cBnzbdt
X-Proofpoint-GUID: rP_xUFUuv8HsmKcTTY1GYywo6cBnzbdt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX0CVaQcT/Agar
 sfzbQfGF6UCVw393toOK80jVTW29mK/UP6WZJbJvtN1ugwfbKeHveO1KMWtTScHHmAm3IL6KweH
 nLl1qWSZD+8qNuPMr19ROghmq2Tqhg8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310035

On Tue, Oct 20, 2026 at 03:12:45PM +0300, Abel Vesa wrote:
> On 26-10-15 10:37:08, Shawn Guo wrote:
> > Add label for firmware and reserved-memory node to make it easier for user
> > to override the default configuration.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> This could've been part of patch 5. In any case:

Ok, I will squash it in v3.

> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks!

Shawn
