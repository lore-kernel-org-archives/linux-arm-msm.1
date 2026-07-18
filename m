Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C3207A20
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784373859; cv=none; b=gnp4WCSQGmVxXUxG1DcaPsi9mzcI5WfWcMrJh8gJw9NPNEsgLBnOfz4awykfPkk9ce4qEUFufUKiFuwbZx6tTA1V33F4reO8YM4SHOzTv19ptwBId4NjYRtH5EUQ5bWI0hxXyJuNfXSTTUccAAbiY56zxV19IDWZu28oiXukziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784373859; c=relaxed/simple;
	bh=YWz9z2v7WyQPPaA42TELX4X4BjKpqR+/n1w7xOQyOWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyENMBaPGzyWsSmB+UsQiYJvaygwqpdpJgQOmXZZ2jmadVuh7sZMfEhWe7cDA5F3R8pLpTlfxCy+S9n2mzMKpl+DswHpwHvlLscL8/hYMS3raNoYWCC0jLGXLDXE7mGJP5V2WKLPkQekLCLLfIpBDYzH3sTomfmC9K4dpPKy1Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTlad+du; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuIiNoiy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTlad+du";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuIiNoiy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHWlt478185
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 11:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AzDUyRgvDHVngaIEHKVhUBdn
	DlQ3twYyLRSt0qfwN+U=; b=QTlad+du8edz4t5mWhtU68EE999fXX7shAlXVM+3
	DZQrkECFySp2MiS8s02MxAepe6UbG8KsqO4tlN+Ffp17EauptDZ//tNle8rI+cMl
	lY8LdxH3BQsgVOAqgv5yWw4XJVTm1dSGEJZBDJ6UcikQOot50d+ddmpe5KAFj0li
	AkXekdh+tXm5MtIboT0gQ8S7ZFzlAQAedI43zLHWDNGE7NgyfLiceiCP1zVLVstn
	gQ+/AUhOij1lWX/DerAq/P7RG5vX4nfBKpTI2BnWdEYuNTEcujZ0HRQqJy2/NGQM
	C8I7ixwr15b3uyrmjvbHY3Fe6KcDaixSpQRZXisKOaIBwA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af0mvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 11:24:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso5129617a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 04:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784373855; x=1784978655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzDUyRgvDHVngaIEHKVhUBdnDlQ3twYyLRSt0qfwN+U=;
        b=kuIiNoiygtgat2RDzEBqE6xb6D2Ww4qfUB1uj52N+WGB7ggYB8rF2sNkgUev7Aw1jF
         P35Lk+TF4L4d3BDlj/ZQs6IjAN8LcEIH5TYQ6+rHXkjMj6+BnGuYGkgw4gP1HHKNcyoW
         cP5vlnQrYmjZ++ksAaPVJo2cnav8eyJX1Tu4RxeTNz4rGext6W+oq8VPlBrHvUFiLdIZ
         bVL+tqGIixLPTUIEbLpsxBVzpLTQVYGrZYUbxTpiBkfuAoCQbD7+ghXWT8FhivgPEFvh
         cJyBsDKcx4zmnsgdACtGJqy/pwVp9OiaMUx0Hss43Oo1MDw7MveVYjT/wj5zN/XVRktr
         ByvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784373855; x=1784978655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzDUyRgvDHVngaIEHKVhUBdnDlQ3twYyLRSt0qfwN+U=;
        b=F3D/P1GAQRBbFsieDCRtLe/CtCOVK9/LzSkxumQLA/PLiaFmkI+zfnkf+8F2XJhxi2
         mAUXamRIIXTO3lHNc0ZPLmoUtn4dgrPWDzBA0PaXeYcP5HsedMrt3heKeOvJEwxqHc+o
         CGXH1CzVLbzYSNrw6TRK6XMq/3SIWHcd7DHqxkzx+MWrSfeMVvsLEJO3UmZ4p9WvVc8M
         OrM7Ye9e2uyGCrskPyP8ezWpEGCKJienOwti6w9uXBhRtc6l614MwvKw3dYIUjo43jMN
         Sd7zHuCmj3rU0aVCslHH75ULumaot7TN05E2MS+T/rjPJlkD2Cmb/EiEWiNwr3rXNvPm
         XQKA==
X-Forwarded-Encrypted: i=1; AHgh+RoO1TvGkZJ7B7agU1Sz+6HO5zx0xt83ClgcnQipsxy5pxS4iuEj8dIKZc5gIlO96QgmvL2urTIcMnOAVSJG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28b7WjxfEGS0UGeIzQL1EMp56tuAW+192JARYZvqDh59LxRcG
	ePFKBDK3TyLJ1xbhUCbLs++Ex8ezVxTJ94pl60r15drkbl8W5NOpMHVxAAQHevAEFffW5QrX227
	JdRL/pU7Le0SV7kLhQBsEqKoB9sr1kk0sOsrGTZqTWJQK9swlpS/VDBOEAlWTUfI38XWk
X-Gm-Gg: AfdE7cmhZsOSRiDTp9S46MVC/R1L0BNYt/pf04NVL9BEbf4iLU6DJCT3hZAzax2Bybp
	IsjVIAI2VllyhuXz78K9IBzWhCXRIkm+qrs7lpfWDjuScKb2a103tfLUaTTaN7aR7ksSmvrBLza
	Ouj/hllch5gpibsSMM2UnwArjiJ4InFK2sXF+OwEJOEGBJPehqv4CafSODJ44JtVRfev2FqCo7g
	mSMfBhvqe4XFwmN4dLPutQGBNJtAL5I7m8jzT4EsoVogvgN3XEja96LgQLB/FNymQbR++h1PC8x
	mE6syJfQYMwLTqqGQBKz2LRPfIl/tRpP9cdacw/sgXTgrKTzAlAmIFwocs8qvmnHhru7iTfOUf7
	hYd24PZfE0SBTE+uz2uA2mf/9TA==
X-Received: by 2002:a05:6a21:1519:b0:3c3:a168:edc3 with SMTP id adf61e73a8af0-3c3ad9717dfmr6290197637.38.1784373855447;
        Sat, 18 Jul 2026 04:24:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:1519:b0:3c3:a168:edc3 with SMTP id adf61e73a8af0-3c3ad9717dfmr6290178637.38.1784373855014;
        Sat, 18 Jul 2026 04:24:15 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm17579432eec.30.2026.07.18.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 04:24:14 -0700 (PDT)
Date: Sat, 18 Jul 2026 16:54:07 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <altiV4pSkfVs5UKM@hu-mdsor-hyd.qualcomm.com>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
 <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
 <04a9d8ce-e83a-4307-8b14-4afe739b31e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04a9d8ce-e83a-4307-8b14-4afe739b31e0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDExNSBTYWx0ZWRfXzhUXsWc1VO+o
 rnghVEWfPckiHZlPvj2lWZdoX4PgxN1JtX7566VJzd30/3N1J8LKuLCyOLssO/N/D0RZfnthsmO
 Y7+k6hCY5LEdxDBY13a43JxmnP5OlEs=
X-Proofpoint-GUID: idnzFkMi4YN9sgqpybfdoA68nAVs8nc7
X-Proofpoint-ORIG-GUID: idnzFkMi4YN9sgqpybfdoA68nAVs8nc7
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5b6260 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yFymH_mhhIGMXtPSOccA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDExNSBTYWx0ZWRfX3iIOwp9j27Qf
 wRZQZWMwmSDyCOWcDFV6TxPEv3/RtEE8SEIkhKfR17CQfOUEKHcpiyCQSViRJrqFinvGNR0ws9Z
 ALXTlXcR4u/JoqcJdgn1c1UN/pV8awtGyR/4QyrWYkJDm1XYBedrHxSvorAzDXMB7zgQAoRPO3P
 3Bmqp+oP/u3CGuj0wiLjLkWP8steUiEwZs+ml2VSM7WCbrD4Fy8aeE2dxkuz/OB9GDjJh+n9ZBa
 yrV0yygJcXCqYxy8E5ncGLo5Fm0AwsrTpZclH/f8PXfQMLgRRXltS3Z0HTFfKqe0dsFfalVS92K
 zVJ/kWCMIHkE9RNMrn7EojvarSZ6r/4abHm2kT/3bE4ir5+dxiupeDXqnIdoAwBL0RAUgIR5s7o
 yQtz2vbC922kZlFSv64NmtXDq9fPuj/BmfPzDD/gSSZNAuaLJZkYzFREofVeMOTzmjl9G8fvWSr
 +HGHvZX296AzHdKBLfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180115

On Fri, Jul 17, 2026 at 11:17:10AM +0200, Konrad Dybcio wrote:
> On 7/16/26 9:30 PM, mohit.dsor@oss.qualcomm.com wrote:
> > From: Mohit Dsor <mdsor@oss.qualcomm.com>
> > 
> > Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> > EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> > 
> > The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> > a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> > rail. Reset is on GPIO76 and interrupt on GPIO85.
> > 
> > The bridge receives DSI output from MDSS and drives an HDMI-A
> > connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> > 
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > ---
> 
> Does the other EVK not have this same hardware?
Yes other variants have this hardware but only IQS variant has
DS-HDMI as default, others have DLC panel as default.
> 
> [...]
> 
> > +&pm8150_l11 {
> > +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
> 
> This comment is superfluous
This comment will be removed in next revision.
> 
> Konrad
