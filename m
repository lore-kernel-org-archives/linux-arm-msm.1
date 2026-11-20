Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163980;
	b=GaDbpJZK6sWX+L2CsCCzWPumLvZ8ltaO8R5hA91+APi7v/QAeXcGJKs9lkBPanrMar/4
	 0Wn+BXKl56qoe/6qF7EivimdOeNahPN30kHMRqDNlxVHgG5s2oo7tYTkGYRNm66lPvn6N
	 kgisrIJ64bJive2v3xgxkPOezEKHkzYwAHHYxnqHff/qfb/7M7FThw/SBo5XZQWO1lbQa
	 6N/yUfE29SBVBY+GcRhiYFPVD+WOPPVlVqfe6a2Rg0kBCwL1LqCvQzx9G/Nou62pGPHIE
	 j1oeA+sha6hrmysngS965dh2SzE6iA8mHWLGwsusDyD8k8yWInjFlS5GE8sK8l14SgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r+JhNs/hZmUB32T/4fK4AcrAesi5EoNhHXMKe2hgKWM=;
	b=w3c9Rs1/pkkPlXWNMgLgRExMl2wSDKzbXv5b9IL1FGHL1GrNa1aczgdaFhc0vajgmBGt
	 sZDxOkm+VdmJ5TeEW+6BTKCeHVfwtR182+Y0EHEZzj9QXz7ftJBb2qZGnHFkejiSNY6+/
	 gLAWki1ALn//7SO/+MHMlsbGwbhJRVNwRNzU01qIj2eJOJCuJbKz2uY6WfyvwiWnl4gQA
	 pJo5PR42ZR+2Wt5lz+8lJcCbm7u232lJIJa++DJLsQBUFZLcQQE5Jm6VM3GjuHdyy6B0p
	 RcP28MpjFM2jzo9bH1QyyPQTbamSsG51ZMCyvdc14GPhgX6hW44TIr9Wf9N3DtZvWaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGNIqfNo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i919bdSq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1561B606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1561B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGNIqfNo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i919bdSq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fDk73320736
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r+JhNs/hZmUB32T/4fK4AcrA
	esi5EoNhHXMKe2hgKWM=; b=iGNIqfNoVZ2GCLVc/iSdDQdEWKccbAIVyLPosy9a
	EcI2rFgZGwOKDn6Kbyqhh2ZdpxCBnAHiOtoQEtPnwZeCJmlwKl6JifwsUVD1zckn
	S1YTiIYhOVDgMasD4u6lURu9PmmbB0QhrhaUj9N6Xhl9Jg8RkDx1bnfbcMwuPzhl
	2Ke9MC5DxtnaBp8d1l1jgQI9Pv6a2E9CuibDfZcxw3Iq+k29HZMAYy6dI8jY8jP3
	0scZD3qqzbc9DnOSF5QuXlVfoBiuCNfkxzZx2JU9tba2nLskjYKNAl9usR1EhbAz
	lMGWqUJQ6c6sEhIuLIjp+/Om+o/fSEVfLS/b6TSGOkZ+rQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2frhru66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:39:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so130303985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163978; x=1795768778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+JhNs/hZmUB32T/4fK4AcrAesi5EoNhHXMKe2hgKWM=;
        b=i919bdSqoAW7AvaV4+DpLZlocwtPaBxK89F3Fb1GxIHQIdYxUQJMnvbQTyUwxnIBJv
         ZJlRdiBCokaOHhhFcZRbsqt65T3clpmBBkr5XcnvzjU2tDTR/ymJZCD2BchxLLm+TyjX
         1sAuDUi+X+hnOveMoR7uxzVmJgRWOEYGEnynHGhw3fhArnBZleGxJHbYIuarjgddEmdQ
         a++0GgRISI2n/yk5AIb+OZapoyjRCRgoic/YcipzuK6uvtRpUiPIgcVSxpcAxt1tDkqa
         U20595w1mP256AEjPnk+ucjiazJfeitROC5Hw/ODoqfg+mulkLeb4+Ufq0i56Mhq+EJH
         Z8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163978; x=1795768778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+JhNs/hZmUB32T/4fK4AcrAesi5EoNhHXMKe2hgKWM=;
        b=naF/f9sybi0nwzFbOGskeAJ/zesY6Vx+8BPkZVUgsyuCk5im0ZyhFBA013dAhQDqjX
         k0EK+ygkw8EDkcfsmYfEMR0feRAi2QMN1lGbaFRcMbsnq2neLmDYDkYk909gnjVRRobu
         IexbCOXyg9eF0dZUhVCYV58l8hn1wXYjYxDFAZ+LlOjm6NNufoXNdiBo31N4TSI0/AM3
         4WsriTNNhuT0d5Gib/uIBv5GAhNnQ/ZNhnu/O/sy7eV354f2ENeCkbANlEqc929GkRNN
         5iIWbAc4IW19FqKHZavrGcRWzumAvfBs4CLsHlYUHiA/b/+Nj7do2OLS7urkPin4LvmF
         oGHg==
X-Forwarded-Encrypted: i=1; AL+hErEz35tHBC0u3IXefMXQETqkGfUhN8vUxcNHPwC8WUtX39uIn2GJixwerpIYK6WkW5XL0d3Ms7m2qTDQjEQv@vger.kernel.org
X-Gm-Message-State: APuU4Z+u8ooCaKBFGcXvPl/pNOT4PWwBJOLJJThAGEl3jeRAXgUucfd4
	9LMe0hrgNhO6V/pCPd3DUv2ryiYy7O6riin45vi/ODfAjCG1ja89Ghi2+OJobzbGUJiShkrNHwN
	ae06a7R8hz8Gu+MJtMmGvdr5yvDgzfnOkrSt9usKW2eW8P4uDwRlDA4YSccx8jBOMtN7m
X-Gm-Gg: AYBFou0nGb3T4hkzGEpl1E+BR3FXEYhRlt9b4e45UsEQ3UGcODvBdoBH++wDhDyeVrl
	0zy123QkaJv9Pmc7VFR4+T5vgUnHgwt1AghpVc1d0ttVpToKd1uXmPLAoJ3bxAXBgI/ry1uaXL2
	zlHpbpuTdMHXkXKCwyRBm6diBYhHrcEOxZaSgmlGBBtHi/gfjznDIiufGGYy/th6oTCDVRc7RQO
	BfkF05iaJNcfOdpo6ZJS76gcVeMIvf2lr2aw10s+afmyRVzBhy507j/cNj5FN3wh/w0D+rzrff2
	Nu/yAhO/VKoVPugQss7SiXXOXmI8vt4WUJH/lJoWjOJA1tAeuxINsZoOaG/YQNd3pDriMpOV97Q
	O9WB8zUe4CTrwHEYmrmWVx52wXRsxYfdeb/MIHtdiYkPm7M6NXneGtaAxX6nv0/bT
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr362655285a.61.1795163977948;
        Fri, 20 Nov 2026 00:39:37 -0800 (PST)
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr362650785a.61.1795163977329;
        Fri, 20 Nov 2026 00:39:37 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm111790855e9.11.2026.11.20.00.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:39:36 -0800 (PST)
Date: Fri, 20 Nov 2026 10:39:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8750: add periphid for traceNoC
Message-ID: <f3gazpnmbfqjukqi5wetqokl6l5cy2xtuzvdtayft32qadbg6p@kgyw2kcgvk6p>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
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
In-Reply-To: <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX3s6mALIlQzkm
 ZmCjkNFEoFchLrh37PyZ+92rkjHi5qarHSW2/2JcgcfEV/HsJjlT9QgP8MZsui1nmyH2wYuDZ/L
 PrA3fFiR6hJeVO1el6lCrTkDDWP1K1g=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6b00074a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kDRJwTVxGBJz2jiGre8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 9-i0PT4toJVWEaAXadaKHYEUWPkTYX-s
X-Proofpoint-ORIG-GUID: 9-i0PT4toJVWEaAXadaKHYEUWPkTYX-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX7RYG/kXjfOZI
 SiCBuqrLx+j+LwXqvMWYg/zC5Qbllt6MqwQ4sq4G/64u+4xSIZREyDqTjzsyN0+NBDqL1S/UKvf
 tR0ET3iRjw5fY16jRpUuf8MWFW4oL7Xs5ufbK/sWmO8Q1ly55iR23cPKGeqOzz4DAr22UidOKve
 /ZVTYMrpxvw9omwqoJahL6f52IUw9VICBzYotp5UNBpqa6cL3lhYInYtg2cbZEKnbzQmcZ1Xwyh
 FqRqLlg0kEoTKwtN/CLIthZ5MXegx1LLpl8P6pQ39pDpX6fDIGtMiiDQFBQOXIuPWysP2PoYi02
 jfldl0ufqU8JA2+b92OtswtNR6a3csbcQV9ukcLPMdRmdVCLTA0/Nrn1RfavdNeHUZggxGncsbw
 Cyle9XIRuZ01yExi8qvPuaSgSF232fAE0eMkNcDdzSbx6AkiPH8me1KwYx8VPDt2lM3wS6bhQo4
 tKtAqPId19Hzrbglikg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

On 26-11-18 15:01:45, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
