Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905458;
	b=jouldsXp7EqTa5INUpTPs/PlzW5RBQPEsutpalZ7KC0ISztLgTmYSFjdkLeyGqZNDp3b
	 tTf5HpjR4w/Zg3qUt0NL/kf/svT7NaM8FL+TM5lkaZk8oOjuG2qSax4Mc9eigiRiIelts
	 lPj6y+3o2Ru36j8h4AaYfsMwkSRQBtNtBKY0dsRaBjmGXLOTTbfHv/VmyFRfm/m2fTkg2
	 Ok0bladKdmbdPzr0jCkCHHcnepcdTiN1YNiIn9PauFjXYRpDPUkPEk+ODJZVXyHWMHpFg
	 LEpKcUvklIS50/SZkhFKdAYcaRVHjA9G9OfU+Q+ScBEUwa+8DGkx4JXeAobmoJo7ykw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905458;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hL9hddK73asRbtuhj4FvdSTnjK2vhO5tYp9ta4TqGcs=;
	b=LSlZlA1jNWZe50EYf3UJfSpAhGjNflCPe25m/rRgNvTwpn6K7SL2qPn/H9z7P3oKqBVP
	 eP1ES2Xeo9Rgf4T/p+hHSL5fL+doa52pUHDwnZbl+L59y1+CE8sKHqY2xGtxvsdmZwtoF
	 /RxtZUR0ygwH/e5v/MR9l+hc38O4f/3QzACL+SXP4w/ZO3oGuZW2CvTxNubBa6ybebr5h
	 0aQpQip6rbmSUVPxFvEDuqJ1zGUZ0bI6ahSTBbIMd1RVTfX6y2jyuZgdwwPkWGwDQgbC2
	 VtpunucrtYdTLtSd2Ien59HwAErCNSGANiCTSFr8ke45C5pokfWtZAVAmGB55gKiUbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y5uAdmTR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTH3momC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26146606A33F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26146606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y5uAdmTR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTH3momC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8XZox3624144
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hL9hddK73asRbtuhj4FvdSTn
	jK2vhO5tYp9ta4TqGcs=; b=Y5uAdmTRGT9dDM6+TuMXcj7ZLw9COd1hOeWbckR5
	a76AhGt05RVd1yIXSQMQgsOERTJyoZG4dZ137OjDLu4vmmZXhrj0CMRGinKscKJW
	wKAiOO2SQlGT8A2XANaYC+5BPs407fcF1Rd4ety0ZQ35lO83a+GVBUm6N9FPEZLU
	RP60LdxnVyX6paDQ4y2UgymidEmn0NLF83IDmXp29vmpZrfbIeqtrh5OtS/QruDb
	3bL638w0DVQriT55EMhQGZqD9i/f/RsFwnk13jndByb94c6vTEmo/M/vJKavoCg5
	N4RUp6hSLi3/J2CnNEqfEx4urPv2vi6wFKacwjMOhAshhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejpux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:50:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so738053485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905456; x=1795510256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hL9hddK73asRbtuhj4FvdSTnjK2vhO5tYp9ta4TqGcs=;
        b=GTH3momCXUyWekCtB4u2TZa5r9f2B1jFJfRXdCRrxFxkysHzR8ctI/0AI/jCxSBJDZ
         rEFLu8kPNEoRQLe33earEM5QL28eNpbhJ+rtCYOiwpPhWWi2F6BpsnCtLWS0STVqA2yL
         oQPqVwaP1vM3fHi2nq7NnK66W9XHS7yvJDtj10bK0v3tovWg6uLq3QuUP+Tqj0ky4PG0
         tkRSBfvNg1O+qwAvS0Zfli1YPiC7sRQTmeJ25/LdmNCvdRSnhjEXI0b7JrPWP9pghEGn
         FZGjuQrxTGU5Esbg35ql/PF1WQg6z4/o/5DSDBfjhmDcOETA2hUebB4TkCBvJA3dY1sj
         Semg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905456; x=1795510256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL9hddK73asRbtuhj4FvdSTnjK2vhO5tYp9ta4TqGcs=;
        b=SILTtGO4ECS/41KPmXeYMXBhT7dy4VK21gX18GjTlxulHL8a96hnwlp5BNpRwyVNiR
         29Dhk40qQL84APXTB0desBB8HW4CxISZr3oVCJ1h5DsnIeQfYnSzQ7k9ASOFJYxIXD/h
         iqTw+rEX7km4BgPxN86upFtimFXSPo0pFMthzero86CxksxYizd4ylx0VEActTsB+DIC
         PFYCPF5IOMGZCOo6arlCW/DXnt00DBLWK6yMYsA0FrYwGd+cbGI2kykGvJJupRt6nW1E
         D2bKM6kfOvwPqf+ZWGdh2PMDHM2e2tGMVhUWqS0dp0btDayjfg8HD1zrD46Hh5whOUCE
         XnGw==
X-Forwarded-Encrypted: i=1; AL+hErF4Tr7V4egSDyRiGeoFQp5If/tQG1rjVs9Juj/sfWS3sSr7sGEzQC2legrU8lIfCe4IoWl7olUz+bflirIu@vger.kernel.org
X-Gm-Message-State: APuU4Z+R11z8QWwbUOjwpe40kMTSJvG2JAqTlIMS6FuXtngScGWSRoHG
	b3w3oWrcm9MEvqTRcKOzfHBmsp4PX/JQWDw4A3ozyPPKMTf2LCW07ghwMcUAXWr/z3EZR2moFPM
	itET4D/vGpkGzOkMp10viFYnFTCQa0Tl+e1Kp+ZWrpH86hm89GapDKcHnv/C9cS45rUKF
X-Gm-Gg: AYBFou1GVwcQMBBhs01ekXn3NltuTxb2YaZ4XbjMBK/kZv87aSyc4ERl4tZy+lHoHq4
	XMH7q2qXnxotMWY98DntrlPrkgPfaQnoqclYR2xVJz8CVwpztOeoV3aJsiM8VisRKBQuYP9Rrq4
	ufd9JH6s9c7KS98+yjbX23SnigyMtbNFL2TQ1MWVYXOf3To2y3N+3WpTxqC7nAv06nYzeNOI72c
	ezdAk4+xlZd6tJl3xyUUwl00yN94EKncFFhKVuPiVSO9SsrTvn6MUtpI82DqcCG01n1DgI1niK9
	xJ02IKSU4e6F+sqETqGrZhC7JT8TsW1UoSU9FJk+JPuotmKaUi0ab2ZkUVsKjoFYuwPekAwQf2E
	zk/5Y2CiCAn245vRpGvlPXwdjKa/2ecIA+pbUA9YMyIAe8SI9JNu1PCQV9yWWBRm7
X-Received: by 2002:a05:620a:4155:b0:947:7691:731c with SMTP id af79cd13be357-9494bccb8d1mr2102672485a.65.1794905456396;
        Tue, 17 Nov 2026 00:50:56 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:947:7691:731c with SMTP id af79cd13be357-9494bccb8d1mr2102670485a.65.1794905455810;
        Tue, 17 Nov 2026 00:50:55 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566a8a16sm170923935e9.0.2026.11.17.00.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:50:55 -0800 (PST)
Date: Tue, 17 Nov 2026 10:50:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] soc: qcom: socinfo: Add SoC ID for IQ10800MD
Message-ID: <3cij553mn4idl6g5spnmerulglcgsc5s5nrdbg6zrcrntj27qt@mhrfwetsxxhx>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
 <20261114133304.989635-5-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261114133304.989635-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfXycEmnKPPK7it
 Pi7tV6FavUw2h/5aG6g8V07iaBb7qaKRGyJP7WlvYOIjXc0eeHZ+psqpjFV2YPBfFCyy1DAmrsK
 wH3bWdJU4EJYMRh1oUl7ckf+Ms1z3eY=
X-Proofpoint-ORIG-GUID: -H1ejPu-OhXn1MP-FghD4NGZZX3yHmlo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfXxei45J6xnZcu
 DFsjjlOADV0ChrqvHwuOCiquUaFXoya5NGTDN0hfxHtf7/Wj5j1ED5X3fc9EPJZKUs+Wn+1zseI
 0B0d7fYzb53X1kuKkxZKSviFzB60eebZixwfXheXwgcStKPtFSBp1jc7yUY59r434I332qaqNdY
 mj21/rzaC59yCH4FsgaE9X+HXFfXE4UyzeV+iwa3HNn0mQrUHb7ms+uMclaAoHzYOMzRDRdnJ6W
 ZqIhFCgSgPz3zfRY0tj8m1ib+5+SJv/g2EoaIyJPhta0gYWW34t81bFbuwExhEMjYed0MCbvQc5
 rShU9Ek6k/QFBvDb0ZFuujHj50mhAhxmPvzfyrVADQj2VDvNdBuN2IPj0tDj05NtnNAzQJ7d+m1
 U9IUhpIFDghzLgwNcksSbsRAhTXV33cp7kF5Y/pTrl13CDAFmZIowFcBPokUzREP4juWkdgnGY9
 BqnD7dA4T4MVBiLVcwA==
X-Proofpoint-GUID: -H1ejPu-OhXn1MP-FghD4NGZZX3yHmlo
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc1571 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hvuvgssclkmJWzRjKEYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170035

On 26-11-14 21:33:04, Shawn Guo wrote:
> Add SoC ID for Qualcomm IQ10800MD, the robotics SKU of the Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
