Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF34318146
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972237; cv=none; b=ijZIuicE8UEwl5XXpCHmoCBLD1vJjzo4pDl9NeQ0kimpsWn+KRlYtVACBQaY1UUvoM+lFgE3GIo1qu23H0qEdrvb/BOGvhPJ+jQ4Fv3qxLwGE84A3awU9kvFmz5EEBxpegJ544vqrytMkNed5WxZGLqyTZo2xHiEUhAIJmR0S1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972237; c=relaxed/simple;
	bh=ddfn3LbqEOO8JuUkBmmymYxPMCnLmvYpUAoXtX2mPhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlQP58hWOi8iFFxVO/C+qmNEQDyobGGXy/ugDfEt/cKrUMbNwVIAgLD3NHy2WH4Di+jHFl4Pob1qm/oCohW3s5QPs9T1ex+rWr0IIfKj1AnPuVVWHt6WOPaHV5ZGuBnhR0VX2I+qdfwGS0svJgm3bU0pT1XHCGlLnx01HB2qVcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7MeMR0K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGQtHowD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7MeMR0K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGQtHowD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z3Cb3550247
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gfTLiSXODMZ38Zdtd8E6UO7a
	gf75SjCHxDaJtukqv3Q=; b=o7MeMR0KyxgFqFNtza/daLmBomdhbj4Sn+qtId8R
	K8dt79WyZ06RJi0zGfQyTyL1+Es4Ux/OQyQGbSBEvM2t1uKqPeBjroWkc9c4WggJ
	tUltikZUPcp7i1q5DH99c6fsXh7Mbo561P8CfV/L4qu/T6wYy0hRjVor00550oxM
	LPExgWtFAJYRcwl/dHMpuSMJSoKPV11Dw/mKB2HxFzYhPtUvwXezKV5Mkn+3gd4t
	TVNO3lbswcjMKfibQDBujtr+tnyb/VfPsbLcWQeIsclbKPrkhsX8pYe43+IcN25/
	L4fLmTgsd/zcUCLHpsUDXrsxKCYSKyCyBcJlSqa8awp/Jg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs84ys5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:30:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3305439a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789972228; x=1790577028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfTLiSXODMZ38Zdtd8E6UO7agf75SjCHxDaJtukqv3Q=;
        b=CGQtHowDSOi4RAihz7Ll152JgSiatEADLGz67nsL5H2b8Jm2PA72xOf/xJYh/TLwvz
         dJEQCTGFIYsqK5UPNDKz01Imgjv8lN41dCcnDQqyUe6zux3Vbi2KFDyM8a8HhbcdueuA
         Na9Z5f29QHq1StODfOLGgi95vKp0xARP/hEawZns6ovePST6DfmyAd0bNGpvTl3L+4SL
         KXinn8M0yZt1n7LzSz6/9n1vaeUdbFhh9ztksDVR/AH+VqHNnSMKCWfJnSb+xrmdCBuM
         2kekdcn+2MllI4CNzIgXqfGEyy2kGKpG6hDsOIxxNGsT+OcMe7lScvG12SP71UEa3IFc
         oJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972228; x=1790577028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfTLiSXODMZ38Zdtd8E6UO7agf75SjCHxDaJtukqv3Q=;
        b=oLnlx4bnBgw7eZH68yiIrGrO3ZTZtU+klMx7xVtxvOHe0OeqTEyNA7dLUrD+UnA4VR
         b60Xsvyjal4FqDPg/6q+JLYMkou222kBqH09U0h3XbDMTNVB6LdMt6YnzGy2zbWf42SU
         KS8jlAHDZRfS0OIy0PtPXDAKrKCDKOi0RBxWY5dGrxf/YsJHALfCd+606qf7WO8fx0EQ
         PTssAW0lKZx+GnunEOCs2XliTm5kjZdw3K9TolBAy3f3fM2hogGqEk4MksmFX/l1+Pzf
         7HJ7pYVhP4635rGsJJoEohfscR7jcd74lmFtoYNQy/ZzWA7uzV1XEQ+RQNte0JZPRfB0
         cKZw==
X-Forwarded-Encrypted: i=1; AKwUvBx99pvTkONxIWAPCJDadLiWTQZsxVw5MXZp9lxDqvvvr01tpzyIz+OgdX0c8mJ22RKgn4FcpQDf0lcE5ygh@vger.kernel.org
X-Gm-Message-State: AFuF++mH6E3MPj3wXAviv5blApreAOr/DlNnWTqalp/btHJgLAeKUU0L
	/sB2wh1D/c/HjqmD0ongMo6cP0EL5e5ooX7VnTzbVV6wVxZ6AQwUltuBjdyn1vNK+PyntSw5aOZ
	5QLDk+0D7WbZ+s3PpzblpE6B/kgN+fEtLs7gVhvrCvuX7ZYW8RresCXi3LD3lvJoPyBjy
X-Gm-Gg: AYBFou25NIFE+x20lWAFZlLc44kU4tHdb44fcmg75YzStx3FK8/qiBVD4KjT8UIH66b
	GbFsgEPsG5QYmh+FiEqgfEIU6g44OoXY+449MjI74YIbAipqepiV28Bfe09VGX2cUUeYh3WEhdW
	MZwfq9Is7i8Rdihtn9h+sWBG17ZxqaqvfTa81a8JzUzYg1j0fOxPNDZAzyZJQOtsgX0ltQWU4sK
	ekTo+pklyH6AdmJQIEmxTVPxi/x4fJlEyIsvgdUHpfMBIR21RDXt0Lkx8mk1V3iJaTacSiZx3Gu
	FTvTfBH0WW3UOqlsqus9QdzA9/NsywosiLKfJCMOduWBXc5suDgiunSK7gM+nEap0TxSAshGdPh
	wiJJl2wL8Nu4oj8+Qqlh1cMDyRG/Np1R+JK60UD0/Asvq4qM=
X-Received: by 2002:a17:90b:384f:b0:39e:455f:36fc with SMTP id 98e67ed59e1d1-39e455f3d97mr14697480a91.28.1789972227601;
        Sun, 20 Sep 2026 23:30:27 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:39e:455f:36fc with SMTP id 98e67ed59e1d1-39e455f3d97mr14697440a91.28.1789972226826;
        Sun, 20 Sep 2026 23:30:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144df9ad683sm8871128c88.6.2026.09.20.23.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:30:26 -0700 (PDT)
Date: Sun, 20 Sep 2026 23:30:24 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/6] Add PCIe support for Qualcomm Nord platform
Message-ID: <arDPABIQl9wKYVKa@hu-qianyu-lv.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rsM3VwxDyzT1NTl2qUrRpIERZfRtV8yH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5MiBTYWx0ZWRfX4o8HlHv330is
 5kY10aSfYOX1HgtRmOk2Ldj5W7ROvOonY3gavIGPUqtZ4UcjudnvEh9eofwpmvt2SWeHEOTMcpu
 95vVXbYSWDsyxwjp3JsLP6EnRC3vHB8=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6ab0cf09 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Tp8Q_eIeZBUexgL1P5QA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5MiBTYWx0ZWRfX6uwglZYB1lcT
 xIk4JeYkBoFWG0F9iy1Q+GBHiJXIXTMs0AXgB3+aUJwxW04pT7i66y1eDNSo8F3bWQb7ZjCaHT3
 T+Hr7Td5WJfvS2rA/QoaSbu0cVVqBfBagsUJB++E8zZoZcvIxPuZmKnBGz6w889It4hq70+yF/1
 tjWY0ElXcaYf+WSjNzV5e5pPqQV5FEH/StX3JxxOykNkm8nMjPDL6snzRkG+/tpnhwdvrssnLvP
 J8BGmhMNXhL7JFIas3uG2mbuf8au0xx5f+vwXKxApJMSYwHDC7dAcEPvPrfcO8tltPnoOUS+8IZ
 DtBMKQbRPjyGUbdCV1c7ZLA22aLroKkybRuCXfkOTmtUn3rxFBX7iXTr2ERIDDjlt7u0/3MAYl3
 B2kTyp/QGSbmY9DkhLJ4Rc7Ra0P7FStvvahOOX7/vulpTNSTOO0EQMjScFPUR+08zX0poORzT+H
 yN7MfNpVx46BayW4MvA==
X-Proofpoint-GUID: rsM3VwxDyzT1NTl2qUrRpIERZfRtV8yH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210092

On Mon, Sep 21, 2026 at 11:07:08AM +0530, Krishna Chaitanya Chundru wrote:
> This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.
> 
> Nord has a single Gen5-capable QMP PCIe PHY block split into four
> independently-clocked and independently-resettable ports (A/B/C/D).
> Firmware selects the active lane topology at boot via a TCSR
> configuration register, and the same PHY block can appear as a single
> x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
> is similar in spirit to the Glymur multi-PHY support already posted,
> except Nord's PHY registers are programmed by Linux rather than by
> firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
> tables along with the power-up/power-down/soft-reset sequencing needed
> to bring each port up.
> 
> The series also documents and wires up the qcom,nord-pcie compatible
> (reusing the existing SA8775P PCIe controller binding), and adds a
> CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
> convergence issue in the PCIe power domain.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Tested on Glymur CRD and Glymur QCB, devices can be enumerated.

Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

- Qiang Yu
