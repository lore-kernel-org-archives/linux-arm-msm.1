Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163765;
	b=S90Sh2j/Oq4zh6KNlUJMRhKdkmZLW6beEwpt1rNjqEdPjBktrtej0s16AByPEkM6bn2V
	 zKYAlI7vEmy+SumBEMUv8uheP0HvS519LDCIt5EDGwJt0MF7pj1SBtUq5YyA+I/HbgYo8
	 PTto+Vkw83Z/06re9e7S2PXO+9LnhqridK+R6Hp1KFERtivR5+kzi0sVIDsyEgewX+L38
	 VO30VKsuii1srM/eTIBUboNOyaP6pnBlFD1KgV/zmXf54ZUp4IBPARf08o7xLRluu5Bxp
	 ENYdbBKeJ0xkRkbpvLjgenWKdohHnUq0dEhLwZ7U+2N02x4aB6pPHgkfy2/BTseUDiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3+4kN8yRIr0Lo4zRWm+RqNkhZtxA92McvaUVhokCYQ0=;
	b=gFy3yYzbw3loQnHy9bhOmCvO0y2SOi4xA5LHTBiOUxq4pdaLdzSCh0/p0jk+4yZrnBLE
	 FX4NSwaT8yIh32gM4gN8r1lTysVCfukn6qYnxaHsSaGP4sXgrQqRoQKQZjtId+cppTC8x
	 lHuwAaGDyMYH1ukxZM4jX8AWqoPuVVcxivnLRwRZ/tDGBTLLOUUqF8bFi1OLvYZhYaPjb
	 z/b8rK4svRVIOYpNJZVA7MrRGzFkiHV8H0NroH+wQ/dQjzSWBIEhVfr7SN78avqJzfGOo
	 Y3CKY1fNanovSj34TnqovPB6uzF/ims+xUB39/CgPeFuvgJedVuF6o4BFI2Q1dPLaHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A8VVDOsC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IqRZFc/e";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F5606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 419F5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A8VVDOsC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IqRZFc/e
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewHG605986
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3+4kN8yRIr0Lo4zRWm+RqNkh
	ZtxA92McvaUVhokCYQ0=; b=A8VVDOsCPQY4o/tKtXsv2nv2OALS1GNJx6y3VFUL
	TSHuk2TV/8BaYcykEPQ5z5IdEm/PY2SFzAGFGuSfljN0YtWs1shRzWlrmmaUPXqP
	mzOELcCxdV7OMM1Bzhgjx4v3iJOca9NFyM6b8QcfdhKOEYcgOSv9oZYNPH8NOZF2
	SzPB1ti0Nlg9hc/VgweLFl0jE2jBIDA2XkkdiqcOv7FcHBwfh1lTxNBjJHUIpMlt
	7abL9d0elft/CgctEwLkplrVeZgIz6GhPZSOJsvQOSexirfBDOD4eZWZhKtPcJDa
	MSGB1JCz+crLCvaqnh6wY22CzuKCm8Dwn2CiCrOQrmrfgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrm77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:36:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so123872985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163763; x=1795768563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3+4kN8yRIr0Lo4zRWm+RqNkhZtxA92McvaUVhokCYQ0=;
        b=IqRZFc/eReF0BPaJSECl1zUY8OotV/Ci5y6n0/8t828cG0smmyOge6zlu7nsmcvyvP
         Q7TnyXjC1B9uOsKTKiPxX0JVCmAC9BoCyLlo/9JD/sT34Glkk+zomnsIm73lbtCmPxCi
         9THoXR1epGae9VlwACQ0vW3ENIy/KygoLq2olRyC1VDdH3iNjK0YRE3tc3qW6waPSdN8
         P1HDedNJyxdDxNA3XKax0Ogkcp+BFMhv+bzwbSVLE14do9QJMRFNMnKn3ZWz81zuUuZJ
         Vs3xZf/HLrmnMuGMWJJtI/HSL43+fctiVAxAwrMMbDS8/stSyycVMc5VT85LBZPrBTJb
         /gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163763; x=1795768563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+4kN8yRIr0Lo4zRWm+RqNkhZtxA92McvaUVhokCYQ0=;
        b=NK3nRXDkdpTFow3OtC80t2xk8NtaUorF3ZY6TSu2S2GSuEgVNaUISpTPoBrId1nF+l
         xwBjsl6IXoj0obaWs3p8NnSKp3JSlKP6WiL9oIEzTrycto7jYQT8yHfgvGy0BH/u6cym
         SbWXlkQdsKtViiLvRDoAG9hCCXE0tJ7z78H3fnZmCDrmATGiGphXx4bXrzQW0Fev4oiw
         uYXVK6U9y+LkJsoYWKVBpq2cLkyKc6spiYQmz+iYK+oGiGq3MVqfl/VxI4VzdoLgVRFk
         QEpDH2j+EIQHMNtTeyq/mCXmNZ2AzocnRO05yNIH1Ej1/j1xel24fZQsR2eEQWf5qvtO
         s8RQ==
X-Forwarded-Encrypted: i=1; AL+hErGyIjvhPiDnwJJYBizn4eO0lB4io2MRGzAYNSy9Fc3BZJMlJ3KKcaBS5wcQrzP/pajZB0arieMYrb+Vs927@vger.kernel.org
X-Gm-Message-State: APuU4Z+AY6AnZQtBT1VjPbrf6AkCbwjYqZ+6uZ7BpTcz5D5Wv315WT4W
	zLzVxNkRJFZ8RyhXWM8ReYUFIbOmJ+z9Eo0xrkIsyNQS8Is9c0PQfzhP9pVuWTlZosLIRc3mB1x
	cYNzbod+WI/auWE7JDLI1hdsc5V5tfMVRSGv8p9auACFRNYqYQ8zrQWhnBNS1Pkj1Hy6U1cQrGg
	Ph
X-Gm-Gg: AYBFou1xrOFPMhBhbo8/Bmpx30R8jGhgrnUxv3dHBovLqEf2HTYOTYJ0bdGMeCiBBTQ
	sSIP4pA1uF0GqP2g0c+1y1hDOfLkMOwHQnL5bWN8xbZoxXkdujj42Znuju10mCQSUyH1aQoBXui
	Z+lJv0Mr8xul3lr5Bd6Mx025Iw26i/QAwbX5EJtJJ5DSOB6XJYt0/PuCXu9UQJz+cHP5ihsOJ7Y
	TJwadHdHAzem4iyGP7IKrei8x1i15R8DeFt2AMHY9Z1QKeXy5Zu7p3fPC1/qJnlrJ5YJv1WK2rv
	B+fmrDvjZTR13ZzTDimGKtKq5SD2s2r2+YcBQV3y5qiDSX9z9ePQxNT7e5SBDRSaocWtB7UT69r
	zZ5HV/VVWwUoY2sOABVyQXuJxniLGHcg79ZaeafyraX6FCwamyVP/cOM0jPVT6oqA
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr373794285a.2.1795163763248;
        Fri, 20 Nov 2026 00:36:03 -0800 (PST)
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr373790985a.2.1795163762513;
        Fri, 20 Nov 2026 00:36:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm104400305e9.12.2026.11.20.00.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:36:01 -0800 (PST)
Date: Fri, 20 Nov 2026 10:36:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable pull-up bias for
 lid sensor
Message-ID: <dqomg776usbpt2efpnsq2ar3lckxxvzkdukvykirreqpfzi3tr@6ddatvjgvig2>
References: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
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
In-Reply-To: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX8ztvWLe2KIjN
 P9mLFcE2YcMC0woPF0Nmo4ToyhejUx0Cngg9Itqu9HE8cTtvVzKHdoLDTY5zJ1ryaMdO3M/sQlf
 2GNKXNaPa87XNeNN1dqNcdvPxcxbYAVamJYLGy6n/doHCzUt3Yg4/myKpnEnaVwfIoFnBXJXNKQ
 p/cq4Zq3lv+ryYn4vvZo6+aRe6oo/jawaSAuXkCq+0NtOz+6O2eacLKKxffmy3mBrr2ezv56PFR
 6rwOxK30ykKO50/zAPAL/vS0NZDvFZ8bA5FdEOQrKYd1iWV59C08xreFLFUTON+U9Xv5MnzGdcs
 8OTUMJoENUGYYVcop3ynunyqvn7XeKJvAJxctpPXcdjC9mDN+II8Qd/adWfdGle/zeHtsevhhyu
 qMSQ2E8hja5gMNxiw6hGmhfR6vJGkacW4MANzYpAzCKxe26ngU1pNYqjEKpskuevNpNdI2U5U82
 XaR017aep8ky9XRwdbA==
X-Proofpoint-GUID: cJa8NLwo2n7M6QkhkelT068zgMifKpzR
X-Proofpoint-ORIG-GUID: cJa8NLwo2n7M6QkhkelT068zgMifKpzR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX9fUYy4vyY9Hz
 TXhD0RVmjbjyOboW/gLARXbGHn3qj23rDnsl0lZ4ySs1KQT/cpLDqFDBERM7TGfqC6EJZmC8LV+
 dM1p/nZGPeAZDVPytd5D3FXY6ytTiys=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b000674 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-jGRk2uHz1iNabgFbUgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034

On 26-11-18 23:52:40, Pankaj Patil wrote:
> Hall-effect sensor on Glymur CRD has a 10k ohm pull-up resistor
> Fix the hall-int-n-state node to enable the pull-up bias
> 
> Fixes: 627aab9bfe03 ("arm64: dts: qcom: glymur-crd: Enable LID sensor")
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
