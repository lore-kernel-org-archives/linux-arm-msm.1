Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370823;
	b=SfsGmWWXzqw1zS2cRhLoFPW3t0JIVY4AUZ9tOra51WqiRzzhR2hHkZ/AhqruvrUWQnVr
	 9BWqCnpMyUtv9xf36yH6jhLOMF+/zB1aLgreZfwk6Pd6eRxAn1Rz1gG1btzIzfaOPuTps
	 YJDE/IVprfD3PV3TXUThx5Jg7yT8d7+u/AoVMvJSF0xZilxtak21FobJixzKCtht+nfmI
	 H+exiH255GUwyAkr88CUmAwxEDXUFfaMSOT91cjmG7qUHf8TH7DiuWJ6C1SxH5SFmRBif
	 vrTvKoJzPtv+ZRsesg0rpFM/GgyKwpyAajLoausbkjzF0G3h2mBoN6ZD63miTyRLPbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qiQPn6s1q5c7xcpZrlCDQ6qpZqACFmX9HhK9uA8qPdY=;
	b=AEulOdaPouV5JYK58/wOo7uW4ofg/kVcVR2hmvd0ZkpbwAHgor+KYu1B/ZqeiJXXfC5j
	 KT0zOkEg/y/36OxtCLToSHndONtWI40sQ4TBLI3QLv0O33GDWzt05neVQYIUjN6sIdYBF
	 LZLcfQfU2VIljN53wRHcK1yWvcRVlhdnLeNf8alGujD8Fgm1ubhnAl+3FC6sDz8IeoPky
	 N5F2bDP65Bg9gDYt5w6kWHgCkYQaQ/H3UGUe/ophoZuFIDUfyWK0PrIGMqKjnOatzA6zw
	 6SHM/LD/0N4+KjbrHSbSy2aDKkiw1te20VfWaBTNLQWSIzfNJ0zRzWk5zr/xGR4cwBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ULCjX+Yp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFPf39c4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46D606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF46D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ULCjX+Yp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFPf39c4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tQwk3515872
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qiQPn6s1q5c7xcpZrlCDQ6
	qpZqACFmX9HhK9uA8qPdY=; b=ULCjX+YpT1XoRb4I/7NUSu+Br9zByaBZrGkR4l
	WORfsTnlT0Swx/97vH+YNKRXpTtyG0QbXZIHsHtq4rfaACT+xC1PFtx5JdShFb/c
	vgLhUc42hYGCNSN/ERDsETkDR+1OcdZuxY3/4z8bIs7Nrnp0mJ5lx4D0K628Qegl
	SrU1guiKUnDo74zZqfZFm8Clkj3vCYXDwxoIPvvHq8GMQvfK2VgUiQsyIljD5UQd
	QqViL4udGmIypfNKNL0ZPXg9fHkZSN9yCvZT+Apd7Y/S0aorpaNum/goDjO3SgXD
	vxjE8lVMxBmYHfLw9mrjfDU6D/f72tFJNuSG6/yokWiVVYhg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b31se1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:20:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so4871686eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794370821; x=1794975621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiQPn6s1q5c7xcpZrlCDQ6qpZqACFmX9HhK9uA8qPdY=;
        b=OFPf39c48lDfmKpGlBSLqwFsQojrn1lFGzach4fnaKQgvjQnVzrpR6VjPtkAeVulqE
         WJnW/6SQLOF/6do6ZNUyh/hfaXI/G2g9lJy/f+maw7idcnNSeN4FCoewxq9OwcbWR7a0
         UL4v8h/+IYRbTbUN4UuQwK2MifEcf+wqj7bob83P1MEp2AsrQqvIlMcBgEUYhBMjBjcv
         gK46N4xsf3LIFC+fXb1foTozPo150XicDUBDNhWLRiBlcspK9TX98NyfWetsbONbY3ZY
         drlxIlxYMUrJ7wHu8uhRIm8Ar3vFRCRf4PyEnk3A1OPU3HmJiASwrTv/ywmOoxHP/kJR
         qddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370821; x=1794975621;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qiQPn6s1q5c7xcpZrlCDQ6qpZqACFmX9HhK9uA8qPdY=;
        b=foQW8+hH1yM0QUiW88FYOGXOsU7x4I4tZJYLQBYymx91zpQ3uvrAza75PDxgjUnqkV
         Zbg5yUhwGgTQ2eI8NZcThMxUacF64XO32zzeI6PvaESvb6pzstfLIPaWx9pLCRoD+8vY
         Pnif06/j4pPazKO4U6tuAtMtcA7a625TNwRMoGhcrEtnd2P3zEgYl8yCYngp1Bcll1FZ
         KQudhD3bR+252S9KmY0h0Gps6tStosYCT1HHz98AvseXIcdCRMoJ8pYx0oeZf5nvAZfg
         GSO6VAmIWiJQ7KrU4VfEjzIiqoGbXeNZWau7PGVHRa8QHImK3Ahpkt148n3qAklMoSqP
         bF2A==
X-Forwarded-Encrypted: i=1; AL+hErFlAlA1mgX95luYu/t/9wjfUHhiibvt0mtXbQo87VnPDqVzhz+VDAXhoVQmYWSZqNFL7mE6uvBhBgQTJAGh@vger.kernel.org
X-Gm-Message-State: APuU4Z9bgKxUhX+hYzRgp5oqxzMd7wVBPr25SRXsm2YPl0OQwtaAz4l1
	vg+AS08Dl4C+SJAYASgJP3AGHP1Uyc0y4zgk6GjlM5NA506sdAsPWuYV/5Rx6Ix1aCGFGANiDXj
	cmIVQTH98ZRxUu91dRdGUjQPNMw/8tjFakLvZ6QheIGFLJ1gKYylnI702airBhrC0h5PY
X-Gm-Gg: AYBFou1sK9h3L8EipcR+fqCrhuujYRkDxPBQ3QDWstG6dqbX7sWS1sxsheL5f7vnPgF
	D0ehzHem4dij4Yegsy5cIkaee4eWHkWNBeXVXiezZq2IezRTGGiDPHpGXaD1vy7tI7MTKX+8N1s
	q3mAZgGeFnXYx7MUYMInFcKK6H3goOn0rDDQh07cA3yuac45zrtqmxmbuNMDhoaWOs4UsVIg/jX
	9fLEYanJwGAGdp4oL4bFEKPovtCnjUyCSPWMmuTuvM37e12zKYoishJaEWUJx9m2dQ/F0gwp+4M
	nLixNNEosGgFrbUySwT8N6gGAMVWkx8w/pxwdx8q3AL6EllDV/1CD/SRgi8D3APjicQOj/jzuYJ
	ecgAK761Kjl/HnZUmO92hE6EBvV6O+WJCM3NTFK7xBvdusQO1rKWpuicmSh0+Fvbr/+zwGvi90q
	HOOZ8dTFgzM3Tb0NaWO8T3NamFmc4bNnKh
X-Received: by 2002:a05:7301:b18:b0:36c:c483:7077 with SMTP id 5a478bee46e88-37686073d7cmr1891223eec.14.1794370821289;
        Tue, 10 Nov 2026 20:20:21 -0800 (PST)
X-Received: by 2002:a05:7301:b18:b0:36c:c483:7077 with SMTP id 5a478bee46e88-37686073d7cmr1891192eec.14.1794370820535;
        Tue, 10 Nov 2026 20:20:20 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm21690542eec.16.2026.11.10.20.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:20:20 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Date: Wed, 11 Nov 2026 12:19:38 +0800
Message-ID: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af3ed06 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cxXtml3fbL26w-N5-xgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX7rnG08lIjvl/
 220K3I7yNCjeRCYx43b4hAdycarjngvEe76zdkZ3nHt3yd/vp1SE6Fn/cpXK1wTdDJmjN9QPn40
 1XtnwkPXxoyYUhLBHQPohGw4Ucyt0C1kSzYNFAP1mYLRO07yH6gbzpmx1wlP3D0aLHn6ZsMfXGe
 lrDa1XWk0aMl6+5jkwGthdDJorYEsr4aWUwUGL55+O7OLaHd+edqTQGRp5fmDEoRON0GhAF/ROX
 Krvz7aiMHYF8Lw/BZzguOSrvZu5FNgMCiTEFw3Zzx2I6mhuw6Zpy2/ahS/k/jlisG7PaYeHnwQ2
 SMV6V48YrGG/ao1aSsUbkDB0OBs71/UhRv89fS/LsJQzU2WgrV6kj5Y9kZ/LccYGBLqvdC+1Qeo
 fCMoKINTo9X9DAEw/yqmKa9FMPfb/dRuePKXru/nll8vgA3U7lpOTJDF+RkQ04iWGydbkx/3vB0
 gdhaR0Ig2PbwaFHO0Nw==
X-Proofpoint-GUID: KYmURyJ-KTZpUI-pbaVf_efBQs_A65NX
X-Proofpoint-ORIG-GUID: KYmURyJ-KTZpUI-pbaVf_efBQs_A65NX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX401e4l2p0XEk
 rykdSb4ZoqDm60a2tXvDiydruGVPPIu6R/gYTqnXOjzJYJJjReJOvxOxYpEXmLN9m5vXo2xHfbq
 BF7tUUIjpeg0rXpbckKf5RMGJgVDJ+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110017

This series adds the CoreSight trace topology for the Qualcomm Nord SoC.

Changes for v3:
- Rebase on next-20261110
- Drop RFC tag as dependencies are cleared
- Link to v2: https://lore.kernel.org/all/20261028075044.431228-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Tag the series with RFC due to dependencies
- Fixed the ddr2 TPDM labels: tpdm_ddr3_llcc_2/3 → tpdm_ddr2_llcc_2/3
- Renamed tpdm-nsp0-cdsp-llm-2 → tpdm-nsp0-cdsp-llm2 so it matches the nsp1–3 nodes
- Link to v1: https://lore.kernel.org/all/20260922100850.527109-1-shengchao.guo@oss.qualcomm.com/

Jie Gan (2):
  dt-bindings: arm: qcom,coresight-ctcu: add Nord
  arm64: dts: qcom: nord: add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |    1 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 3088 +++++++++++++++++
 2 files changed, 3089 insertions(+)

-- 
2.43.0

