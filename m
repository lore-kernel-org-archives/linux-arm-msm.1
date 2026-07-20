Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FB41BF33
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518153; cv=none; b=AmI6cyStt9ARuiSBGT2k8KMJVH+r2XPoPfUhWOUpTe56WpxzAbLkHCwaPZhCKBMeJ2uuv6SlI2UC2rsZ1FfX0hky+WqmJw8BEksB15i10h88kUdgVH5wQN930LTadk+XSXLT7vsh7qxzK5GaFZRGN79rfdsw9MlKTo/DFeGu32c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518153; c=relaxed/simple;
	bh=LyOe+U+IB/mkfF5Qrnuhg2LSz/dtj5ZK5bQNJ9Nib9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR9+2WU2F+SGeoD5pWuKozNMW8PqevTm2iuJlU/dxeLFfXiKiytpRl+Rn86HvQAaM2TnaCRo1kSydq95oqEONFxJ92TOyOK3fL0zxGRIxYMOGn3VDOtpqKJQuB5G+O9WZSil+9iRHB2o7adIThVWcYuArG5rywc1iHTF4sUyVpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIOmjqu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWaV1gb8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIOmjqu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWaV1gb8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsO0c1020261
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CelsAHVswbC6UmMeQa+l59jm
	5QZEZYb2NREk7oPpktk=; b=SIOmjqu1P22s1WEJ3nDXYl/sDHRmQQbPUHPAxAXH
	FzZ40wFLionA3p/Zd9hnAKnRwMgi+79M2l2PuBkiMXf2BoureaBRrMQhsBWQzD6p
	Su5rFlb8qgVXWsHc9TrUTaH77/3wPlod+0mCgWy3csqDo56/FLDh10Xei5Cg2tVl
	DR1M7HhhPoXI5kIriRxdhAK1xwSWeuihWhEg9e+BoAdaEUwQzSZBsrQd6xRkPwlw
	hK92OIuysPxm6aLf1lIpqJGeyU4O4PxwM2dCOdpo5C5e0Ka4nppMpT9cHqjtC3Ha
	XzBNHDjAcYe4yMeqiaSbLW6PD7g2om6+v+Xlsyq3lt//sw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d945fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:29:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so10715272a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 20:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784518151; x=1785122951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CelsAHVswbC6UmMeQa+l59jm5QZEZYb2NREk7oPpktk=;
        b=PWaV1gb8owhcfHOEWXf+bYkjjYhT5odAnnlQ5BYybH6ZvnGSs49mdvt66MnNPnwAFo
         znTnZOevvcR7EepBL8rTQeBMk0wI8mssglyR+B3miedK2n383Ar2mldmZACvPMgun+/1
         ymbkdCjjZp4Vn0p0koqwOd8MU2IS2Ma8LF9JwtIKmkEX7IOObxFkDwEfEVnjVfq79v0c
         zs6+yc3OqAFaLAfhhgKTBAJFqa6T/NR9fkoVmxKVM2dOT6V6EosGzcMCObwZL6mhwEaw
         LFaWtQ5feMP/wskLC/i8VZy00MgpbVMIdQL6lJmYmXKh/U6NYoyimmFt+u+jz+0ngcMM
         pXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784518151; x=1785122951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CelsAHVswbC6UmMeQa+l59jm5QZEZYb2NREk7oPpktk=;
        b=O0HuTY+dq7DnFNQOUpnQNfwbERX/0XWTnnbZUryYKj1iwkA+s/cNbeSlG05/L4Jzzl
         an7LfA4r/uOOXFZNEeYJRxUxJXQgm7Gk//KSOw2MSxBt9kZwLB0/0IpkzXlwWiSIhWhW
         5388eZ7VHRmmrSVOYejZ/7V859cG8GRoQWrKit1ymoDbeoNCldlulSrXWyvid0hKjcr6
         uGLmDJ3wJYDd1vaLUDiGmDf2AtScuAuYB4zNLja0DQiyK0CA2TWL7FFWfgqSMhW+KCiJ
         Lq/LWGcL2e56wPx0LbeZHw9AguuyV6RBhI4zbf/25xS58oG8xNCmQRTV99woZurGFLOw
         rDWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRm1GEqaPhpVjYUfPuOqM3j9RQ2RDgaJKZOJkyisw3dSiCrh7SQNkTlb75GANlzhGl8f2djJaaP4xogzxp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhro4WH7rD+L0oOruoky0py1MPUJqcHEdJYzmV73LZAnVjYyaX
	KRmFe8TkKA0EQ8m0VPNSZTxlT3AmGbi9fpl0Y1AY9lWDXR/t/WhJwfxebczv0xwBbj2lFOwg6Kt
	9Wz71MK+UODLLvVTx7vhEhBL6OMBrRlMBrsO8dMkrA12qRLrQ81ZFdC9GRICtqy0p0BwS
X-Gm-Gg: AfdE7cl52jXXEGMV1qoJvd7wrQcRtid24ZArBxn6kCoZwDtxXYFfSnHtyc1C/jTPFI+
	n1imGNmEHs7MuRP4LkVcD7aboIpSVVPBB2DAJMv5owAagm9muVnr51WripqL1C1jgaPchNIASTI
	UfEEyWeoNc3scb2EKVusjlFmoQxgdyUD1zQjPKVeov/oZjqugWQaNwvsFzzKQk49x0jhkMWBBzZ
	tfLawmEDuTYhsD7LHd4D57hvZc9x8vnwclg9gxObdurBv7aeoylevbKSZe6eMdLua7PNND0n/8r
	sbFSUc3H1ruqPhkieTvJcW0c6aTXS7DgyfTGXz7WlxWb4cpYpr62MtL3caVz60LiGUCOcntQGkw
	2vI3eixTeGqxDcfnP4GDI/+5D3/b5mPUBhpOubUK+9YEsKjM=
X-Received: by 2002:a05:6300:95:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c3ad8ecd56mr13612467637.44.1784518151136;
        Sun, 19 Jul 2026 20:29:11 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c3ad8ecd56mr13612406637.44.1784518150606;
        Sun, 19 Jul 2026 20:29:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm36664456eec.5.2026.07.19.20.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:29:10 -0700 (PDT)
Date: Sun, 19 Jul 2026 20:29:08 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add QMP PCIe multiple link-mode PHY support
Message-ID: <al2WBAAHsnMX7mfy@hu-qianyu-lv.qualcomm.com>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260719-beautiful-pheasant-of-variation-61b8cd@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-beautiful-pheasant-of-variation-61b8cd@quoll>
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5d9607 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P_9lKjKDqroO28rNP9YA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: R1T7sOxbx88E05bLUbhoOD8SkrbyZhhD
X-Proofpoint-ORIG-GUID: R1T7sOxbx88E05bLUbhoOD8SkrbyZhhD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNSBTYWx0ZWRfX+3LRM39dFqFC
 wloY/0MW6FXgF9ZZhRKsHTe2nf/vych8KjS3NcBUxe/ZIACdT4aibhQl7rdtdBeDBSUNNNI3BVp
 uydvnsM9QY+4kzC/cI7QQh2rEwEG8RwmMX7UClCfLBRuZVhPms7Y/cOM1mKi6RhO9JINSUHCzWd
 yJVFY9ySxZs6AC1RjIzRyIoTeAgwDvpfwTU2g2nsUG8uahekHJ5aqigEAfjH3EEkWyoAPChhmNG
 fJbO5rSj9RSqRAhvxyp+sMRqqSAsmIJi/pZNjZFsDnEjGfwa5LeU3vPbmrq7JAACCscZz00U3p+
 744o10KXs2KocLx+xv/MyyvmL2x/FbLS/w9UkSm3ZrxzmuD5EZqMqK404/pDrZiDCIA8KyLHdE6
 Nj0s+g1qAG+8Z3A+cqTDl/4jflcv4/ZCK+t0JUBX0f+wiaxjri4NeqDE2XQH0eScmuIBKIL98tJ
 utIWd7Zm1w+PhSfQdsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNSBTYWx0ZWRfX1uftZGUAUkAX
 evHiCfEkRb8Ho1jsk8rJsCuozvEduzMjG46tRaEzV/VEN+I3svtXsXkIprSdKTCzkU0Aab4+d1y
 sOR3tKYXasGx2wT2cJFaidBmBndPwK4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200035

On Sun, Jul 19, 2026 at 08:43:43AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Jul 17, 2026 at 02:58:32AM -0700, Qiang Yu wrote:
> > Hi all,
> > 
> > Some QMP PCIe PHY hardware blocks can be configured through a link-mode
> > register into different link topologies, such as a single wide link, or
> > multiple independent narrower links (e.g. x8 or x4+x4 mode on the Glymur
> > PCIe3 PHY).
> > 
> > Earlier revisions tried to extend the existing single-instance
> > phy-qcom-qmp-pcie.c driver to cover this hardware. That added a large
> > amount of conditional, multi-PHY logic to a driver whose data model
> > assumes one PHY per node.
> > 
> > This series adds a dedicated PHY provider driver,
> > phy-qcom-qmp-pcie-multiphy.c:
> > 
> > A single PHY provider node describes the shared hardware block. A new
> > "qcom,link-mode" property points at the TCSR syscon register that reports
> > the active topology; the driver reads it once at probe. #phy-cells = <1>
> > lets consumers pass a logical PHY index to obtain their sub-PHY. Match
> > data is indexed by link mode, and each link mode has its own array of
> > per-PHY config tables, so one shared provider exposes a different set of
> > logical PHYs depending on the active mode. The driver inherits the PHY
> > settings and link mode already programmed by UEFI, so only the no-CSR
> > reset is used, and no PHY setting tables or related structures are
> > defined. Each sub-PHY owns its register regions and power domain, so in a
> > bifurcated mode the links are brought up, and powered independently.
> > 
> > The driver is implemented and validated on Glymur, and is intended to
> > be extensible to other multi-mode QMP PCIe PHYs.
> > 
> > This series depends on a prerequisite patch by Krzysztof Kozlowski:
> > https://lore.kernel.org/r/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com
> 
> There was a v2, still not applied I think:
> https://lore.kernel.org/all/20260609141608.354186-2-krzysztof.kozlowski@oss.qualcomm.com/

Okay, will update the link to point to v2.

- Qiang Yu
