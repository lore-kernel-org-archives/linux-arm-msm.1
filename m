Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC34B04A4
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786883820; cv=none; b=TN0GWfnPCSg9wQvowZ2wVtCNmGEnlff7ThXnKgyFjwNQlLzl61nYzHa98tELdCvQZU/o9JXhfwk2txzPDAgnzlW0SWmn7/S+DFHiLa6pE1gGR1KBdKHrkPr1Z+eSZ/wKUBJWMsHbQEXD5BVQyc2CeHt+LSYW8L2ThoxWzYaPhok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786883820; c=relaxed/simple;
	bh=w4Wb7i1tozAZ8EhR6+JLYaYlCgT/CnLr2HAujnUFLRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P5hpNXsQAHXV/kb/R01HWcKs3rMH4cWGZyKXQB6TWR+PMSj/ouX21czcrXRNMewula/soZiNXTfH3LpSxNzzDbFzn1ekerIpyOypb6EgxFGwKV8HqTZHvEM2LmAPeGR9ecbgsDUV82syRIHhEVNHT8AyFTie79uMSRjg9QiYJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn9PtPiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbvL0lp3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn9PtPiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbvL0lp3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GCHsbx3449348
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tPHVJ35gJCcdmoaUY8sfNymk+rq4nSTHJmJ
	XFFreFC0=; b=bn9PtPiP1JFXCTGygiUK8gAIaDNBiscyoi3i9J/D46jVBy/6dIw
	8xfn3RZ6y4mPTBZ1KrawVOhb8cK13SphTz17AumOlygqCRWAWPaBWMkofJMx4c1q
	pPeb3GVNsUy8Ngzz6ZjpNk0pKfkykA6HNiKflJCuV6Oe3op+XjsgvMtWyNHvOlHu
	md0m3Bs2AWO3DWDmAbVPtbmThLdoqQ03Uh/nYQsGzBL6zEPlCUh+CZyOVBNobjYd
	7T/Wef0bduNL9QPjD2Nj8mXdSVW9P9BQhCiGlF9ziWCdBbPoFYJTQfbugYPVrOqO
	BK+1lIB+fAZWwHPGa9aVDXv/9pS0oivVAsw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghekfke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 12:36:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso4798930a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786883817; x=1787488617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tPHVJ35gJCcdmoaUY8sfNymk+rq4nSTHJmJXFFreFC0=;
        b=PbvL0lp3PUzKlQzSuvXnWBlQowD5TfPBuNWySjpG35OXqmGzxcYO/byd6vriiScCwZ
         LHo6IsUTL6zFDnsI02B2UoCbEh9Rsp8WdoDjyv1PocCDNp117XKr2RsVTCjaeHLLhIBR
         9Gnve3dnXyLk1mWbckq03obedCwrb7o68pC9s74fda4TfJx1gihyVJsQzCbOob4eBTQ5
         f33Wep71Qz5TzT2uL3vauMe2Hjm51XiYD0LYedwpum2wNxZrt7w4x9r5jxv+/Z0rlEvy
         VZdLmHIxHj6xB8YIn5153T9tkBJjidRauPXkZCsdc8JIAiB7bEItaORpzwzPQwjl0/ZS
         ebVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786883817; x=1787488617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPHVJ35gJCcdmoaUY8sfNymk+rq4nSTHJmJXFFreFC0=;
        b=oLe1K10+fZxCIkLPIoo2UkwIdlIwe8RV92eyUTK3M3ZRPzIpfyMiNFGC7/3DcSbo/n
         bkeUrBomsYuhSSyTeh5dtGvGbbVWKXrRrnrRn8AhxsVZttuWG/WfdjaQG/ING1CDwtwk
         QRfJ/cJt3KbJYEHQl4CYyK4v6P0KsznIrI5TRmK+MSe5LbhYRdD5A/n6AAjARFrsb9g7
         cWQVHo7MWBGklYD0RabBnZ5BeTGt6RbvIzH6Z8kztKtKVmo26gfdFgiRtyjBH0urlpeU
         ghiFy+alf6rSJPpy0olhXOGS1sD+5p36n9C9+EvXGlSlKd6mRcRMBMtR2AEsQaMvxp4M
         X1NA==
X-Forwarded-Encrypted: i=1; AHgh+Rr64lzRzcyiQZTn3VbUBncMFy4jgrpvJzl9EQ/yqFnarnQdulRaEFa9AfurvXpMdQzFJ0snoSKJ1HcN8k7R@vger.kernel.org
X-Gm-Message-State: AOJu0YwPua/RwAmvdVXRsoG7XNpUk/YXQhVR8u86byKJaMzmrzm46Djp
	VN6b+O4us8tQ2vjBdbnmnXlMH9kDd0nnR2RcgTo53IQCSEy7+YpN60gu80dJ8DElnvfPlUellRZ
	3CaBgWLrzjjRbeasKEipCmhUJcxDcTzPkJ7VzfqOvDpO+YTqC0BQBTYVKlUzwAK2LXsPB
X-Gm-Gg: AR+sD111mtcLiJONPY6E3QHzndcvIvQ9jdwSIjmKS1YhoMgGt/DeGlrYHiPIjdCVM9B
	tbEVCRnpof+M3K762CPLBlbSwtw+a9MsIH92IfiHLIVZBMgsrjMEeUi7X20GRMJmqc0YY/LR9/K
	FdVLOLBiGZDmtG+9c/GpIXmus5qK13yuGP0spPq1NtFOMS3nunXtsUM+/HbZEyvHieTe9QwQRpF
	XUr0cZJX9DBwTeBetJzdJQkDh3EwHgHahQINh6iJEJHlFnyj7uSQTl2rg5buuz4dkglD37pvT6h
	d6sn7probh2ecilPbqZVa7lS8SCUbwtvDF17+BdR/hzUoV2TKI2o0UJuQpPka5CYpxAtVENCOd4
	oxg7DaDSTlbVUszQvp+fdCOpbuWrauTzoMH0xkJ759Ejmgnph8tCNDzUFjKiF
X-Received: by 2002:a05:6a20:b598:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cc719c7b62mr22079218637.2.1786883817216;
        Sun, 16 Aug 2026 05:36:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:b598:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cc719c7b62mr22079184637.2.1786883816863;
        Sun, 16 Aug 2026 05:36:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03f9sm26146956eec.19.2026.08.16.05.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 05:36:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Use hyphen in rpmhpd OPP node names
Date: Sun, 16 Aug 2026 20:36:46 +0800
Message-ID: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a81aeea cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=jYNEgCAaHOYc2qQ79HUA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA5OSBTYWx0ZWRfX7h9cnCrzIfhB
 dTe6g4mz/EqHr1XIptk2HClYOsyibkjoNwx6sFF/AHGDIJaH6mbgaIRqCRvMkMjgs/N5hw0c0TM
 tXxwDPCwcLaRZCv2ywpIlksNorV7Rd4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA5OSBTYWx0ZWRfXxZoF/oZqWkQu
 eGI/GCQbRk8sIxfumbNURPInBRiXb5Fic/I4p+NZV60Jz03MyRpIZio4EWHAUOLZDRi70I1YvoM
 NBJCCPyoPZKSQT5Ovxqi+w1dKNNXF9NobKaP7BHEnWeUnGkJL3GMJ+vtnkEn6JOTV9D8HARqz2H
 w+o3gtPZM1xqxC+ZGlRK1DNjZ/rRmvD2eX2+87nlsXXuO0uVpiKsovLGcAZDaz+QjTV3g87+tpH
 FD16TCTPahQYVfaofB71Y3UjUYA4xsGOR1/oLbStJRCCrMAIrivsTMKAWFUMGRav4Gj9GnBnbnU
 mZVrphF1B1SXAMcm4zkxBMxkPSOrhSH7svKdArZbx4TTf9FqVhq5WOkTWhBLOtw47qQeoMOeWWz
 bJG8f2Q+WtJpeeN5+eGB5gT9M6TRvvtvki5M1CCtv42NE9jnIXgi1JfU3mYkKBqp+I6FhTG0Gkh
 750aL+CO40N8WEHbDpg==
X-Proofpoint-GUID: y1ZVNNdt26mo-zAo2xrHXEF5zRhVjM4n
X-Proofpoint-ORIG-GUID: y1ZVNNdt26mo-zAo2xrHXEF5zRhVjM4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160099

The rpmhpd OPP tables on kodiak and lemans have some OPP nodes named
oppN rather than opp-N.  On lemans this is inconsistent within the very
same table, which starts with opp-0 and opp-1, then has opp2 and opp3,
and goes back to opp-4 and onwards.  On kodiak the whole table uses the
oppN form, which is inconsistent with the rest of the qcom DTS files and
with DTS coding style.

Rename the nodes to the opp-N form, keeping the existing numbering.  The
change should be safe, because node names are not considered an ABI and
all references to these nodes go through labels.

Shawn Guo (2):
  arm64: dts: qcom: kodiak: Use hyphen in rpmhpd OPP node names
  arm64: dts: qcom: lemans: Use hyphen in rpmhpd OPP node names

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 18 +++++++++---------
 arch/arm64/boot/dts/qcom/lemans.dtsi |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.43.0

