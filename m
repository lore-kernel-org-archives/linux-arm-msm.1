Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C42481FD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466265; cv=none; b=Ag3ZU8C8QXwQkufXTWmyocN0S9cvVMGUVnS6/Nl6UEv0o2xgvElsDMcpsWmvm231aMukF5+tKlv6WocNSAeVDI2Jg3wgEp1he8kHNkxPooZuBcOKeorx0smbTgVORspJk1YcNDjiOQIWgpFG5t5jr7bC/i92votebiZZ/vzLF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466265; c=relaxed/simple;
	bh=V/hzdH2QkH3VAqZiBtIzZeWx577pOOceqTjQ9JXOVaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tENoOFLizHhEdht/F0JCSlo6ooIuSNZ7N+c1vkLjv0qjJRojayzBGkLHFanuCDq7eFBRosAWOGVypVkbsyVq+ojOups8wgu5SnFpPHXscSMjIMNeMKmD3FDUJQFbQPnEFk9gorcy11siMPTvosjStBn06WCUYG2HkqpBHcb0vYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2JYTq7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLjjAFNm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2JYTq7t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLjjAFNm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvWU2584537
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vHivB0Etmchj894r1qph40xT
	L7+4vfphDOHMRIbg5ac=; b=W2JYTq7tU/pjhrI/JNfOkqi7Z0iHotWtnxjjGKSy
	zhRFM7EvImD6HWCVv7sOG2AG3/Mo1TcbchrM2rbOA90KtE7OwDF0miG2euSHvGi4
	m49goRS3yR/8csREpKa093CtESrgDFhTR42mcpAa11J/bkjwRB9Ab3p67L6ovma8
	dYuPrDNyK4ogokfm50bCTR4VygnQG7XWxOfe4eyfnllJeck1bNhI4eF6TYVRH1Iq
	PoHIgy9MMqZ/109bJpNxlDVwuB5mhJgVCgOULiV1mmpkZXqgLPQF66gSbe7uJz3J
	emwTgKbNCzNzi+XCxHG/oMucb2Tr0oXuXT+uw4eUNExugg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9e6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:57:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso761455485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466262; x=1790071062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHivB0Etmchj894r1qph40xTL7+4vfphDOHMRIbg5ac=;
        b=iLjjAFNmXz8xu/ggwuL9VQlpugp86hANlu+HRQjCZ85mz2UyYbJT1NkTGZNGOlgeu5
         g6tWxfekjNqJe2gqR92Az2tNcAZw+FW4Y5kbIz/pJ+rSe22MCCJIUyyVIVCt9r4Vat3K
         MFlago5GN4AOkkfO/h+voHADxYsx0LM4NHwIRhIta2AELg7sgj7Ygg3a2XW1t7Ay61+H
         WpqBVF0s+doX0EsgQhE/JOQPNLwVP7I28Al6DWcNIaFueigxCBQ95UyeiSfSOsf9LPVT
         4K5OJW0V0+nDetg25itgo4KRbg49VO2fmhq6c0pEbVk0xN8NyDF0FhDLRjt1CnklQd+9
         R+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466262; x=1790071062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHivB0Etmchj894r1qph40xTL7+4vfphDOHMRIbg5ac=;
        b=RIyWAY5zi02SzakKy5/H2WMRgIj6R9IyuT1nppESUfAqNrYP1dxwG7GLATbwkev/51
         pG3rLXzOXhF59jEx6K4RzupfzoJmAGoJDHD4ImaW38af2u1KguYPTQrYOKZQeDa3qpYG
         k+nvxR9vczs/3jlb5XgF17jNazItkamEnRvN8ewsP0wMk8BB70xoCTLBnP1wyFNBAT2q
         VVQmdkCQe2i/YLH8LtH68BKnmKMYCgQQC9GhTXQ6Sjt2st/sgwFBWUUOSURLSwXa/LDC
         pXzHub6ySdAhNuAJiVLkJuqHpayzhUVziZWaIY5v7nXtZbEfhymR76YQ84n77mH/fcHW
         CShg==
X-Forwarded-Encrypted: i=1; AKwUvByun8NCrQxkMmhn6I+yIoMpq+IacAC5MNDwwnrFwyJDm5tzyt9KT9F2GPQ93wNKqE3+MBqCC4clvtjPS1XK@vger.kernel.org
X-Gm-Message-State: AFuF++mA2laXL/Xn+beDuLcz8bbjxnd0DeH8y9WoUIv4B2SZlr2XZLLC
	XFey9odVFmTnRg5rn+OQC9DeupSr58ot7Zn+g2vhBUi3WT5Y2O5PBq3s1T1QaNq42Yy8Y20geff
	UJtXgdU04IGOMNwz55HOGljPEkUN1P9LxQYWiw1ZAcYyZs9/ZdLl7/4XLa24Ka63Edepn
X-Gm-Gg: AYBFou3+27wMsd7hpqO2DmNnhDISbmxa56U98muQR5GKA++m4I+xZOlzkq6jWldInpv
	Ety+b4Pml3Usa22Ekmp2YRv5wF+26YfRZR3/9AhI6jb5l2yVagqQTWgkL2h5A2eUrI3YzK8F9Eg
	gCPDhaaI6fsiQFA1piSC+y0ul4LO8AohvjOLSMsDGnuOxVthOO5KldhxsXuEL/CEyRL/Fbj/tEL
	icpSKHXjvIHccgbVzZSdGuuWS6KxYYIMZggE0bKMGoPSWzIHFoGa5rKV5Czgt7j4GDVAaYl3bFm
	3hnaQ83i5JWAg2tLzhlpaecm3mXo6i+9SROInVb+Zzd8e7IL2uPfqNWA4rN03vEGuLORVZZKZeE
	mn6APdbWRboQXNg==
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr896733485a.2.1789466262041;
        Tue, 15 Sep 2026 02:57:42 -0700 (PDT)
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr896729885a.2.1789466261445;
        Tue, 15 Sep 2026 02:57:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm33238115f8f.31.2026.09.15.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:57:40 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:57:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: purwa-iot-evk: use on-board
 crystal for PS8830 retimers
Message-ID: <aczv4t7v6rk2cersl44iadrzvbnhyn5aebwn7jcjvo263au62w@2yccbdq4enpr>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX7tlW0MuXiZ9g
 aCK4t3/ILzZ/NIM7ZZ+E1jrnLiRIr9d4jzlyhw1/bpK8NAYkt2UDziyMRiG4p95emvPr3cScDBV
 j2J4JnF332qevEWDg1cJjOJ3pMwtLng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfXyLG+TITloSMW
 2e4deQatjg1Zoak9ZMDYoQP3bO2pHN/CaylMNJe26Kqoa2qRYEh+JMpjAcJP3i5ukcrnKtoWi6/
 YcPQiMnUzAqV6w/p0QVAtyrXYR50q0CEOiqyZTpxYW2Nh9o6E/8pUwZSI8o+XF6/Fd07j/gXtQk
 j2V+gLk8fFBLreISkG9mpW6bUVmPiSjVGq/BtEaXpf8ly6japPP6arTTINu5o4GNZ/oEhk+wOlq
 nAg6VO54SUjpnDHvQsfEUxHumrbfzxgris0ycudBc+jVxnGKTvtRCe05+Vui1QwFKVmpMv+qpp/
 yQSotsU98mnXTcaIIvfRf4jkZEOc7xuMi2vWYky1f8yMBtKPSPsa4nth3/d6F/Or5/TSQsOX6jN
 CAiNTzAs98Ff5XgDydLZHMkdzPx3jtl+xb3gh1pZAL2YlOmJJEv0BL/nPtFCW+53dKFxHhKnlqK
 C3PkKsl5p/X0zhd7slQ==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa91697 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=D9jnvxXfBeoGJ7MCLz4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: SNzwyQ2PpsE1NfKtyaS8viyBR5446HmR
X-Proofpoint-ORIG-GUID: SNzwyQ2PpsE1NfKtyaS8viyBR5446HmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150142

On 26-09-14 03:12:28, Xin Liu wrote:
> On the Purwa IoT EVK, each PS8830 retimer has its own 25 MHz crystal
> wired to the retimer's XI/XO pins. The reference clock does not come
> from the PMIC, so the RPMH_RF_CLK4/5 references in the retimer nodes
> are wrong: they keep those RF clocks enabled for nothing and describe a
> connection that does not exist on the board.
> 
> Remove the stale "Left unused" annotation from the vreg_rtmr0 regulators
> as the retimer is actively used.
> 
> Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
