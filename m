Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905561;
	b=aPeEQwlPypZi8e2g0RJNQCS3OzW+SAX/p5cJNyBevhLDPSfRcTTF3d5DI00xG5Y987hW
	 r2Wbbmbpt4kHSwKSMLUFOU7K31BqkL9IJ5ETFXTHIiMeauE17BvrcWQdvH41Z5FxR9hfq
	 Mdgn1RxRflD/It+irvJZrYMbm3iYA/X9/RUjI5OMzGkQN+6CI14shEpz3/Kd29y37J6jE
	 7oLwqyUB/FesxRl5x+FWCpn0eAMnDdx/t59CycX04OceKkUI+yUkzZ9dZ4VQXPgEeHS8g
	 AG/Wdz+pn/UZ6tYSz/wq23c4zSXIlEqYdyXH1khqB3bvwad08elNR7Q53wxP+EawZsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905561;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hhed3X0YRZpLtQTvo/jhCcuIl7K8NEaUxlz07FYiPso=;
	b=x6e0Ni/7oCPmYy+F+ZnJqaRUSdQD95q5Mo6tZ/qypVmG6cA1xrOb02mWTNLhXvBpuRgA
	 UO1x/zZNbZFp8HB+UdHKlenaRpHzNd1Ia4m0hcLe5Pgyo8LHYpp1jTk47Lbao8DgLOuYL
	 g3mBGPLbU1Rptn/lzEDwLjCacAqsAlxJKOTkbVi+RpsxrbjYHXvaxbX7Dk1/8BJNoFBq7
	 NO9/BFS/KkWO0V3qM5zWPuLsYmU80/j4Q2PVfqlg3Dj9xDyxvQYb2bBkH9i8PYP6U3NNX
	 hEY2O9mdwkbBAgrTCGvUOH8Jwrk7qh4QbDD94ea7ykA1luCQF3zxXftpfDoh0k8/cGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noe5qyDB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRFsJLrA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D05606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D05606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noe5qyDB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRFsJLrA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8T21G200037
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hhed3X0YRZpLtQTvo/jhCcuI
	l7K8NEaUxlz07FYiPso=; b=noe5qyDBG+XwO3W0xZw9csfNryCz16p+L/v6AHeB
	1MpvdvzJv4dSypTHy8SCOmGMYIf8w+kL+YPhWCmSuoZXmR3JcsbVUELt7qupatMw
	yDcNeZPxXXHLwxHVd/P1mjjIwCZD8Ku2pal5yVAfYwD+aK9ILSGyV4c+3P53tIjj
	YE1sFkcUwXPoYrXkHufOPRf6eCWJHV/6cFbyfEGib4zR8Xqu3bbL0GSFDwFWp3AT
	yDa7Df8jrOXZ/9Eo9g92YPJg7TeUIPuDzlSPrK497ne1qfjnaVCo1dBf8j7vtj0V
	E8g0vQ/k7S6WISybfnVaGjcNqXxz8YnHQORQrFhYtDfbTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbw6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:52:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso391991185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905559; x=1795510359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhed3X0YRZpLtQTvo/jhCcuIl7K8NEaUxlz07FYiPso=;
        b=dRFsJLrAd1jPUHU/h1UWNbNr0RsWx8LcsMRP8niyPSODEg10AQ8rdjBFdepDdUlVwr
         /9IHomwSM37fUJvoPvQNLOLv+2dErZIsxzYlfOtkfU0bQVyUD3YSobeMZMdd4S2F+vHh
         CdUyxplE6nLgVlTE/1pl7jI9zR1NhhRRscbED6Bb16jFnNLHrqyOIWenKuMd/6ACoTqE
         jGz7h8miR0nqeaeLsAraijAM47DVNyO0LSpU9VD3zmMby57A0aEUFjNMhA7aeIq7BbtB
         xCeKukU7NcEDvEDzYgnuCW3FmZEI+S1amFpo+BnMxJO4QiJw8tYoh/FMdrFtXCQmBots
         LuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905559; x=1795510359;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhed3X0YRZpLtQTvo/jhCcuIl7K8NEaUxlz07FYiPso=;
        b=iPPOhtRoCtv4gXbL7RLMxXrv+om4UgEx49fBuFsR2A11I9l/zDtCSi2FBxV0vH8smm
         U0/8UjyrIgl49QaKc8RcfhCwEpXE2xLtaa6ObwruOEvzkG3xkx7ABPTa2FjICov+YSER
         hNlUYiaxBBYXL9ZrJmWHK4b3RvLmpuvZWYFkKPF3hfnGBeWdVKkpKnKhJUdhXqrcfK9b
         wONkZXZFMZ7K/WktbO/lEeDhGoGLnetSMpGLTdWpiPWZQFP777JvlP6NYxQGIhUGNfTm
         OUOzyKl/56N2CSEDVo/sWC/7D4dH4kVmFjmdr5J+isa+hByGrJtiNrUQ8FNJrr00+dE+
         Da7A==
X-Forwarded-Encrypted: i=1; AL+hErHdfSarkupqrqLAYkhCpTG2wTJKO2vxUrc19Cy+hle6GXX33DIlUnYNRPmkRAnd8fOjPBBcAh1i0T9Uj3QK@vger.kernel.org
X-Gm-Message-State: APuU4Z9IcqjwEUUCjTnMHzlwO4wTjtCwwH/wHwhNfNqrI3mz8tZKySBB
	YqYtIhv1D/zy5ORIXqFjEFmIaUxveE9xRg6cWzejxUGpYN9o6ief+ifwqUJr5oiO49zI7yTMn/h
	qpBrl49iIsG9Bihu+hNNQP2m57GThMV86kL8gwO/YPYH4XyRAdX5sOf+MsMEDSh4ThTl+
X-Gm-Gg: AYBFou2b6jWCRj9tCluUYz1Jdil+mfPTuiimAmO481SdWIzDQSbaQt2NTVuHWb57uTZ
	28rpKemaWvgw0IV+fw8ayp+twybwQ05oP0Nn2HjnR+EoLngIX8WCy1L5XnTOG2b9Urumb0Sq/M/
	C7q414aECVDLgRh3rrqiW2kX611ZrvNpHCqMpIkh8TrY+w3goztynH7BH+his2SppzUMSrEBDxy
	SS+jvNAwzyrG/2+Zy1aVgzi/nARcW63+QmRd7qGHHsIeQafoUlPP94ZgJhdBdObCw2FeEF1SJfQ
	gVqpccHJ5k0vW51y5Y6y/wNbMzbUUQRUEy0hdLsh3OFyP4p5L7x/Ff8VvFmHwYDGZHoDVxNVZw3
	2tD0tVRhC3vhJMJdynkufjrq8H5YzHrRAEC49Cjz4spUJLcu68eT1r83tv3hpO/xQ
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr1996837185a.9.1794905558668;
        Tue, 17 Nov 2026 00:52:38 -0800 (PST)
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr1996835385a.9.1794905558009;
        Tue, 17 Nov 2026 00:52:38 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm15117005e9.15.2026.11.17.00.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:52:37 -0800 (PST)
Date: Tue, 17 Nov 2026 10:52:36 +0200
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
Subject: Re: [PATCH 2/4] soc: qcom: socinfo: Correct SoC ID for Nord SA8797P
Message-ID: <qm3y3loq6bjchtt6xvcdnybh2pz6krak2srvbivtqnajti2iaw@b7wyan73npyn>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
 <20261114133304.989635-3-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261114133304.989635-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfXwOzuNNbbZTWm
 DkZoWB02t4H2WGDFLWNb2T9kE1Ltb1xdsq71s5ZIO+IbLRkzqdLwZk7ymv7WKC+fRl+/XM5J5MI
 1Ii5Ss6u5PrAOd/P17ygh7o6Py2Td0hurC2im2Ga8peq586IMx3727rp0GakG0fgMEdpdX5hG0u
 kTHErMf8+F52W3TD2lGfY0N/kfaBtQpG8u2c+TqM7WMZ59n6x2lCYfJ2vu6ptIgfVRRQUPZI68X
 twROmEO5W670dnhBDblV4198pCXF+v5zDmcZjCQcvY/79wmyGjQYcF0xdUS2kESTcwAfkNddfot
 /CctaJTOvSIRJUn/UEj6h9CKYgwUC0IWH85jkc4csTqKNY5dRBH+xvI+a2P6VWxiJYNdYYdWyp8
 h8zU0juLRdYIBeekIGvUj84CYHSTBpAKGDOJQueUWaGMoGuo79UW9gleFpBtqTaES4sqTNnfXOU
 u5+DNe5hml3S6PMwrHg==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc15d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lB4lvwQLOsKnOPBdp3AA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ysliZX4YqRI74Kwfm9_cI8v6qNorxLCT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNSBTYWx0ZWRfX/VvVJFo6X1hE
 q+X8J2DlH9Le4QVxR4Al3TVE0VZ6QYo0uUMMoiwWdF5FcDBIpslognmSx0NTEsxb4LGYcTg/sz8
 T67iEr9bg97MeO7Ip4JV7TSOq3k1N2k=
X-Proofpoint-GUID: ysliZX4YqRI74Kwfm9_cI8v6qNorxLCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170035

On 26-11-14 21:33:02, Shawn Guo wrote:
> SoC ID 690 is QAM8797P/QAM8397P rather than SA8797P, which is 648.
> Update the soc_id table to follow the corrected dt-bindings, so that
> boards with these modules no longer report "SA8797P" as machine.
> 
> As ID 690 is shared by both QAM8797P and QAM8397P, name it "QAM8x97P"
> to cover both.
> 
> Fixes: b0bc160c311a ("soc: qcom: socinfo: Add SoC ID for Nord SA8797P")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
