Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667874;
	b=klrdAkgY3WpHFTBus7zDRgIGhIEmI4L33Nu9eqbwlfP3Zg+yIjFqBCBSsVXkc3bCm0vm
	 MOQcFvRFD9GKja8cvq29hPTbl87qzNZr74GlaJkcdTtji5iNpEySlW1kDWrYTycfN9+8l
	 TvXrNjZg2MEXUK/D5Aasdto+s4iZc3jHWu8wJQidcqVfbYoXEV8QSeDmi9DlCQSravRIc
	 kIKHLeRgFnQ4089oiTKcsmx+DqyRUarhIfCKIclgwa3ZnejVsQfGOfeneJw9m5gZlLyf7
	 Akz7RK/byNgQRNrYlN4qJp1y8J2+ZiEoZYla58OQGRoEXbVqUvgQ5ojGQkCASJ3rnqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W1bMu7Rz6hkLZBNOdVc9heqWFSUfEc1ukyfaafSeZk0=;
	b=vLhZxRq1odMXXmkinLwlmq5Xw1BR9KWi/ZPEGVHpf0BsqC7Jz7ATBkHS1kIAh+pqi4sr
	 0vDM0xfsJi2ykR8pipN583SMkwSWIQopAJu3m3WsyrgKdM+H9OKfjh6Ibq/yCva4acILz
	 stnYMUdH8R3LYjVduUIJ34EyN5R0MZ7WX8ybbj7GhMwjSmB0egLoY6CnJzwrUMh0S7Wff
	 kizVHf3WhvQptDkGzEnmGjgaT8224N8NEivRyB23oA1a9FmjsDIFl9FHZ/iVXi33qUVzx
	 Q9HNo+tUY5EyGoch8qRznpFqSCmpXxEfkgBF8Pud0LdxYLMnYMDBqNPvWUYs3I7MmeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dEu+KK+k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBxWbeNF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00266606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00266606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dEu+KK+k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBxWbeNF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDl0T21557145
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W1bMu7Rz6hkLZBNOdVc9heqW
	FSUfEc1ukyfaafSeZk0=; b=dEu+KK+kaF3/zaLi33d6Of5ONtiknj4t4Wbwkzx0
	mBJJ7b+Sv2qr02yCn1iZEUep/VOgqCKry2kSLU0/2yEc66Lw85xMHhsv+rlekphm
	IwjAxc6mDCu8u9llGXTjYdV/i+QvIcG8ew7a8U+Jms8iJyWLgsR2H34BTVGP3udS
	P2Ds5vmXTxwRf7ltuPjlIKSeaQu+ZwvWuK+pTOERAwPkn/zLAK73L7YO8QQ5jYSk
	ftwNABRvIprGx7/2743OFlNyHw+W4EkB9D3ypv4DdM8NTTtyh9YObpXX7RPFzNoO
	Kd3aLpKAv25R0zrGnlZmuOYWpJEj+pwFieRZ/9Ig3t2WhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8rybg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:51:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso91386185a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 06:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667871; x=1795272671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1bMu7Rz6hkLZBNOdVc9heqWFSUfEc1ukyfaafSeZk0=;
        b=TBxWbeNFMCKPHbzfZX3SScaitLr2U3VRpdHZMA7rRGJR4FGyKOYZdEHFJJo1fc2soX
         obSuv56jLt//1QZsf/HmyiEFNtVSdA3icjOu5XMS0VVNy0IExxV2RDaKQPwUBrT7Odt5
         LNOq5dpMH9XhIL3yRf/jOUKCjNMeavdmvpozsez0ess6dA+sA969fCGln47I3tNpU2yb
         6usyyv+OqV7L7wlLmJeu1q43NNgU81XLNZubtruQQwGGQEt9Le1RYmaKlVQkj9hfvxVA
         pQhG0WCDdYwfX0j9c1U/MYeAReCw+U1Y9o1Q0klT2bXDSVeD5aamtQE/JDf58mc6QvzP
         h33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667871; x=1795272671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1bMu7Rz6hkLZBNOdVc9heqWFSUfEc1ukyfaafSeZk0=;
        b=dTK/iUdpVgcwKF5MkydtCO/FyMGauYQXY6XjlqM16sf9raOjm6w4nt0tNc5GT6gVZI
         W3iw09bdSPe+h+rjVazelXw9KE2PBkfJEeHN17mRVTTGt3L0RwCgpAu3jJoW03vu/WCw
         y9SgJR53cYWtsts1IaNpuu1yaQN2X6IWrE8rWOg1km1v4VzZlg3PSCdKYc6N3/3Yhtza
         kmrx8RfuVqQhT1QEW2c7KV2WzRORbZ7SUVVDmPU1XaUanJ4U6pJsq5ZTvfZUttxV7/+b
         7Zd5Wk3NPo6CmA+GdF55Go6GjUNfjx0ObCwww3rz7MCHDae3N23FWveaaVBw9+edv/qo
         6Fow==
X-Forwarded-Encrypted: i=1; AL+hErGMit5SGtLQKdsYyTrrkDAcl6nn/2sFIdcG0puutAGBJ8oMVcmJSgnTvcoOrCeo54srWixxersI5w4H9cK+@vger.kernel.org
X-Gm-Message-State: APuU4Z9qVUnWJxF1w8gWJLnCREgIEdopUXyRKMLP+5dtgmhLEdsfd1hX
	AhmxbpSfjXAMPBrrwiD3eVO3VyL0LNIigJ+82wzeTJSKoGdgcQ4OlAchnIH9pQDFo2GsdD0Gk8H
	FkwF3zdJQLMo2zX1zqDyo64168zes+XcJ/e4NfX3ZzgTY3HoD8dQqxKDbEFhIQpc7fy/Z
X-Gm-Gg: AYBFou1haUAAgf2qd3iqlIuxluxoxUt56ZKw1X1nw39WzwQuJBUDV80SCSAAwMW6wrr
	dTbNso5ZwWD2/H/ho8kU/fEzRTREjx78hlIff7Kgp79Iyu96uQnZTwvDHb62/VMdt43E2rTAJZS
	VOycwcjADkUjtj8snx5QuF0PFNJTqqC4NLIw2X4j0rL9h55M4wB/7gHl0J/iMDw4v6D+URuLPui
	v4cBdtXhB1PxreHV8yZLH2KjE5oQc0Mri61grL+wN15FSAsipYFJzrw3bLUsjSPh3CO6eI2lVPG
	jxLDOD1/x5WAAjkXVMUACLu7+GMec45vAnDTHsLj1qKyzm8FUVLqIqsGa3wPm7yvONbi+9kocov
	MPIG0mUbc5zUP1MF22IfaDEIb5L+dctIcpaR7HUyYvjazdxrvyRmF2J1Po0K5H7nm
X-Received: by 2002:a05:620a:6c81:b0:93f:baf:279e with SMTP id af79cd13be357-9494b9c9243mr950600785a.8.1794667871079;
        Sat, 14 Nov 2026 06:51:11 -0800 (PST)
X-Received: by 2002:a05:620a:6c81:b0:93f:baf:279e with SMTP id af79cd13be357-9494b9c9243mr950596285a.8.1794667870373;
        Sat, 14 Nov 2026 06:51:10 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm12774350f8f.1.2026.11.14.06.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:51:08 -0800 (PST)
Date: Sat, 14 Nov 2026 16:51:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8550-ayntec: Use hyphens for
 nodenames
Message-ID: <ojcxlpuhpkjupcq6qnpcpox2zkn3jfmzdd74yyzqtwjsebtrju@6mv3wxkulmy3>
References: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261113185426.183501-4-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261113185426.183501-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af8755f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=d-X-sIwJgli8_2Se32sA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX6Qm7PQAOQimn
 C5EqwcgZBADGufLakrLCaoxelIRFU5SNFPjF3g7OH4h4V0RsQpAfdplKCP+ZIRZwAdW7G9LY9Ey
 j6glUXNHzLCmWiKMEgvid35F2d7t8qY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX2p+dVzWCn/Hw
 HZd47ZYsFCyYMcKtujtV07lPrFGguksPQZBV+IsHNUBK8RjTuyv6TZtXhCBTQbC+Y1GvduEvjri
 Zqrero7F9q/zIT/7aiIY1IQKZ+kPSyE/4AYi89lhy3/eTc5ELllw8c6teFMCWM4aCthM6nler7K
 GpHue5ahKvxyRxSsQVCsZFH3xC1/vQkVvNsvQV4rt2njJnd7iS4+/m7jXMFX8tSoPGzTt2cyNaq
 JFupOuKg28GX1mgvv33GmFg7YchyxNlrkk44HE4SqkjdM4CIgTEMh6cHs4KY9zQ2TgmThy3F8HV
 c+AnP+T+WvB1n0i1IrMeN1XObrOsD2N5AM190aS4XShy6kqGc/l7f0G4IDrZhNfzTtOnsQ+1dXp
 AVpmHRV5ySqtbFEP6DfiFHszouiXnLdI3l0qI66LL6Q/0RBhMC3klxX/LOK4gqIy2IBhbiN01uH
 nphbrv1E0MkuZayAuMg==
X-Proofpoint-ORIG-GUID: lG1IKTmr0_W5_i5E-r3UQ3QDY2NDlGwa
X-Proofpoint-GUID: lG1IKTmr0_W5_i5E-r3UQ3QDY2NDlGwa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140059

On 26-11-13 19:54:28, Krzysztof Kozlowski wrote:
> Correct minor style issue: use hyphens for nodenames.  Drivers do not
> use these node names, so no practical impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
