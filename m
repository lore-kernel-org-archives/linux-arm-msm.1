Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170077;
	b=RjV7LiMFQWccHGluc6KNfWdJXYVctaGtIAPrOElyVDkpIXbA1dE5gCYLspa73yyXGfXa
	 xoj3DbBzT/bdDj9rBHaFUqzedvk1otFxnvwXSJzMMTHy2h5UcmdW8opJ1Sj9b19yKlnXy
	 4K7oZhgI9gLiaDxajCqywipOco0SIXJugpqt7EwJbDxQOA3mt+8Qv/16k0a1mhJIlCKYH
	 3a54EhGhPSEqajyzTMyE9JmFRpXraSRboay3+2ybsKlwpVRPdoTYDXuMV+bysGZueBQdx
	 FRAr5R66Tp8ba449CMvaeTp4z97ibG5/vFqYehm7sjZpvNtMpoAHSdoPYJuOafwOZ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
	b=qfYIK/nk3m1h7CFX58zfsEee1mVglHuVT5mAhhna9bWN6jndHWUw01eP5CQnoZFjl90Y
	 vXaldpr6eK2pCa/y3JhEir7Xxhrcuy1KtMjtY7g/EDmAh3lkSbz8pqapS55a8c3IpylM+
	 yjkJb8a8l8V8y1UBCQ2R6RQozZwT85JamSZyuQvqJUpxx0HaE8JkUtj7gPj18O7wgjNyo
	 9+dzq8BczDlk/wURTVSPAgRDqPDPQAXzB8z2dSu6M1nmg3vaXwrfQfIcElvZZ/pHkArtI
	 5QEPRoby7+uuPo0Kn6T1p0bptyJVu+hUuAMPKvC+/k/G2tbEXl18SSYawl4TE3sWPsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiQQmnZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFgi5Vhs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200FF606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 200FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiQQmnZP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFgi5Vhs
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7evgr605903
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n6xNjiXLI4ldZMgm9vuyivlF
	eIPVFifPb1EDl7UJecI=; b=CiQQmnZPTzu9L41uX++xGZzjLXHOfK8Pbf6a9gvv
	1b3ZmL84IQyGNMUUyQXpRlOPbv7v23GfD3cD4qderzPHqcNp0Sc/RelCW7K0YnFX
	/qBmQ19QNwi50g8JyAhmj4ClBHBEIfm2trb5SjhaSsUNBbjYrMHa1AY8TIuAAnM5
	dGgwM3Iqw4Wul05TOvDuZvhfKvgPydFUmoi4yje0wedMFLLGtlkH/UpG3rOu/kNA
	qSS57tfItpUDX1QVfovE3k692uv15pkjeWBQ5R8C0Eb8t3Jpk2ENdS37v8opHbTP
	5BuRybzmncizaSw8fbTOiIO6biDIp4A8WMvpC9+Bs3Wupg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs23s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:21:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so194546285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170075; x=1795774875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
        b=NFgi5Vhsn4vUb/dJrGBKsAI3iD6JYIgFx6PlTkCMFzalQnnNOBBws3Tt49vqVsO5uJ
         nuIGID8R+E8jWn5uqdILU4PsoLD4aGeJwqza5txtBrIFLzJRR9M74vfx5TvqodL3Jecj
         iB9SSLFMi36yt9yfyIgUVD5jddTPnfXcUNAEnsAcj3m//rh0ghlGbGRFLgZyRwX3f3al
         SwRgGD69gl0PSsvDmH2Z+BzB991hQBtpYLPhkJg+grUSSdc2QpxOQgto1/exSveWfuKR
         uSyIHHCEUJpVrl4MnDCywRouZUdekQkzz8L36KrEa6eFiK1hTZQmQpu0Uak0YwG+BPnw
         p1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170075; x=1795774875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
        b=B6HhrJKrg1nEFOXIkZNBmJ0FVkg4cUfqp2koNSYhyuhj0l8apQHDJmnDTyyJnpuAM8
         oWkBVj4JVMScjRi+tMNiTh0Xp2uYapatwgiqf5YrgzgU+LBh1+VwCytMEGd6CupRt1Yy
         6t0EPEP/VbEGchZxaKki1xs0MnheD5LXlnL2TBrOAT9g5/loBTNeRS0yl/t7xddE0c42
         tFkGcSSj+qXW6UCNMXkmesuf3F4z+diQCzN7cA5SEI2ORhEmWakUPDyvJXYa4RQSfx4o
         oCFhD39fCxL0epRkkxmC0Iv8ZpyUiYoqlJG/ihMtEvu9WIiCW23v3rICs9NvGDNKs11t
         E9hQ==
X-Forwarded-Encrypted: i=1; AL+hErHbmjLQfhXj7gyEvrPKici1J1tuC5H8K61JG2Hu3phEDPspaVuMjtZbPQ3n22SZh1uIaGqH6SyUo7WzTiHj@vger.kernel.org
X-Gm-Message-State: APuU4Z9iskprjD1J0jqJ3mUSdRAlo5muVLvg8CcizzVs1QcVBanmXdq0
	3+Luhr1m50VGOYKq9hzMp7F825aKCooWjU1JoJtl5FlbUOC2lvI4PIy+mUAc0yFLKLBK9KwZso0
	w+NV8qxtWwfiCxhzAB3cWKk2Gmpr4d0fqCzMM9qTF6REJWsRccBPdj3Po24QUQSo74qzT
X-Gm-Gg: AYBFou3CJkQe9zp3mM/gjnjfSX5yzGjgK0df1brkQMbhEVQTEI8V+UfU8lakCFn0rsU
	bg3u60ie3sCFyXV3u6JTxANTSgp54Gpe8G0DssM1gcMKGa2rxLPWMBQPWu+/HAJIT3V7hLRxrnt
	qI9uOPnNn12SkEIZEPkbgRMWLT5/vHB8TamLha9GFjDBJG/rr4rnsa7So+nR56rLpDtdtYMXPzw
	bngILx7aDW49JqT9/Npq/F9jsrt9fPr6nPQl7vsHYHixemU94rpsED53SvI5abvoRrOUUABZcdl
	fygumADLNazfJFF5l+a7/reCQXTmea6VB/2kJSjfU6njrq+jEs98jWkmFoEejgZQVRVOz79fa4z
	x7DCkdj8rrxLGTM3r+GucLLtCJCDbGaB4liE8O65SdrL7r3d5lrf8oy1Dpo041rZI
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr406230785a.63.1795170074885;
        Fri, 20 Nov 2026 02:21:14 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr406225985a.63.1795170074176;
        Fri, 20 Nov 2026 02:21:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm29150615e9.1.2026.11.20.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:21:13 -0800 (PST)
Date: Fri, 20 Nov 2026 12:21:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq5210: Add NSS clock
 controller node
Message-ID: <m77xx44vjdg7e5myewy63j6nhdkgqnvvdyhqnohmylnbputjwm@2ymesyhjurov>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
 <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
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
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX6knHFjeeDIIc
 UU8NqudAAxM0ho4NS/srFBXRGtnXobUx4dUNZNHXB9qO2cALie4KDKNGCQcOEsEmMDyfNacieGL
 aSVti/iWUqUov4TOoME68iTcyM730ho7Er3ugKQLZId/B92jI5fUEghjhKeW9Lh5NcWTE2DLKya
 36vvlc2FbwE+YZM3uFylzdZYtu6c1TFY5mI5sWF1k2oeSrLZPOF+yTHi8/XBYf66XiOfQxi/RYQ
 th/7vrpKwQNtIinTOQIxkRE4YLLfzzaPdVnO+Q3D3M+OjhkdMG6Qe7A+SizNOPBASKXoaZj0RHP
 UpPBilPGkpALKKnSANPAxUphk4MghPm1OCtO6xf91fDUYzVi//8oP0u6NVeeSm3O9gOLL2n+nca
 6SQi7FxXl8cgI45o84cSXqJZoDsjauCzKqiDlLfftjIHQYUhtFUeJCv6IjcWPXLyXTkA9ZWGEST
 5RVijkHy4XJczYvihXQ==
X-Proofpoint-GUID: m45SR1iWACZyaKmORwctZJi-28_tx_w9
X-Proofpoint-ORIG-GUID: m45SR1iWACZyaKmORwctZJi-28_tx_w9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX7QNb0VysxvQo
 piSrl4EC197jkOQPKTKcMQhWvAHUE4OaXztRVcePy62C5FMACqrt23g/gBRQuPTUcCxB5TXwymB
 R0PMv8Kq8ktd9kByyGehw/mUCmNHPJo=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b001f1c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=B4M9V4KaqHGFCjQwF8YA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200041

On 26-11-16 02:19:51, Luo Jie wrote:
> NSS clock controller provides the clocks and resets to the networking
> hardware blocks on the IPQ5210, such as PPE (Packet Process Engine) and
> the integrated EPHY.
> 
> Note that the CMN PLL output clock names are reversed with respect to the
> hardware block they actually feed: IPQ5210_PPE_CLK is wired to the NSS
> hardware block, and IPQ5210_NSS_CLK is wired to the PPE hardware block.
> Documentation is added in the DTS file to call this out and avoid
> confusion.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
