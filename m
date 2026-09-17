Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675350E583
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665045; cv=none; b=mLOcoMg74n2MzNWq763clGkjwBQV48YHdqWZtGqotVkMR/mYQnM55ABgn0xTy1SotDWbTTvAEDLE4GilCJcxi2ELYDAeJxWAW+EEdi6GKwRG+Crmv9D98796txnMVhRxJTUQt9UGWznsIMalN9ktZfg3bccF0uZyt6IJ9oNuX80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665045; c=relaxed/simple;
	bh=dIYPq5sFKIxLtUGNP/CZRmD+OSboHKnYdjiQqfxygwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MR0ePQPEzW0dcdDrthaBTc5EtYIA3wwBUUy7q8AFzLiL2PeCFp1TqP+TLqianVaVaUF54+/7EJxUP+NM2wcplZC5Roz+CRkSHnvgEcUas6paiG5jGhYiBj+ukPe8qJ0K99n4F/a+feJTJQLrjJBUcf7Opk6TYxeXylQsG6qAOVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADMf4+X0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIJJI/bQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADMf4+X0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIJJI/bQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5VNf2887078
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 17:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOIfBhA40d1n8PGVV7JnUyBrJvf/oegeKL4mbK8Sj08=; b=ADMf4+X0VvIg4+cY
	qhFgvhbSF2+YOJgeDEkgfW/y63HwFyW4u4joRNohoaYUKHcjP56NMONMo9PKl/Dn
	btkNJjvOGRR2bIz+jYyJJerhy5I11WW39CxkcAzs5RRsrRWUS95QNE5BqJidIgEA
	vZIou+/eNHJT5XqVWIETRD4oAbGGwIZRUSLTRRhm3zJP6dJQXQclNGxW8Np3stCI
	Z8a34uWaEhytiLJZdqAOxjbBv2OlcXEf1xUTkn5eFYeS0f5Tdb9fwcVLJ5kl4s2+
	M6KBOvQpjwm0buH2Gu6ogijiIy4swqB5cUwJtmigVVBJnzTA/vVXdrL1pYm5Gd4f
	EBkeNg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6gv0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 17:10:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so1872446a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 10:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789665040; x=1790269840; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOIfBhA40d1n8PGVV7JnUyBrJvf/oegeKL4mbK8Sj08=;
        b=DIJJI/bQN481uSuoyKlVig2qT5cSU/fJb8y1ZpYRxjbXnb+MV/QJWzIRxNCrgGPHGn
         M4H83T3EUDJMUpIm1cZj7NXCViYPbgAluNodXV72hTjb5m04kzeEGf9KPK4tJvDh4uK9
         3z3rIgFMT+NWFBpJvD0I+8oc4GOYbF0ud0Vx+v3QYKUGDFwy9NJPcYOhUDKxu4J8zfrF
         ShnQ+H+RBiL144sfauKGFOpqvtm6HAFWDT5iLSDqo/xq67aF0jktQsBZxT8F9HH/2729
         ejrm/ZWSy7FSV+r5EQdBs4HAY6TBe6Tq04kyQCUc9yQ6mW/YK7hJ/zXusS5Numtkv28L
         cN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665040; x=1790269840;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UOIfBhA40d1n8PGVV7JnUyBrJvf/oegeKL4mbK8Sj08=;
        b=Bl4vUvRMDCS+8El/hLcFGv+H8QyimOAh0nsNHMVK/iIHNX3ZQLPpwpJ5yJyetOHFKe
         q7y9wq6EESwcyXtrmObyWdZgkruV6lgd3ytNOUB+dftNYo8RDBtYSevgfOANXYFFaao1
         Xycl1CQoBU0+xjoduRHRcMBe7P34Mx5G7QVY9vMSjZ8wLZwrtTgXVUzsABT11N2KfFVV
         LtF703E0G7tUDuwptt6N3CAp+39+FvWy+x0KV6CsgP7FTNkS/sZykcmqCLF7W8rDgwAt
         g2sXLWXNAqBPECinFR7SUYGQ5Mgq7kdjfXRDYdBe7vhDBl5VpB5c/qcMojZu2yMD6IcI
         1U/g==
X-Forwarded-Encrypted: i=1; AKwUvBwb599zbot3ZlsSwdrrYuYkswhum//d53yqwEeQ2uwvf2XtPtfQJlmO1aTvMjhMzfF9Hli2fPjZEkp7ORNF@vger.kernel.org
X-Gm-Message-State: AFuF++mPwE1W4+bo0/OSewNwyCSYBWvaJAbgjyFEI4/GG6cZSbFQzZ4/
	r9d5PgsIV6DRU/U/KvhzT+QWGQYHjnHyynlXN8t1gmY/H20EOn0VDz1oEb1SaYspdsvrsHeUwb+
	JB0s7L6H7rRTtaFw/Hym7i9vFy42a36zgmbgQOKDg4+3WsqX7GDREjvCxgMUoNWCNjck4
X-Gm-Gg: AYBFou0r5JjlzkiyOJY5F1LBZ+pitvrv3xXqTqHlRQcUuWXUVrDsOtWHxujamGrH8MF
	OdfPaeKSxAxyWypjiNduNAKwy5C+6ugB25k7QpXFAizOysj38C3n3Cl5YSJG/G+8vOgacrKi792
	3G+eH4EwiNOMpHJSZ39Hxh+L60LbC63d9IwiJpV8QplLsRVJFjo4e1RH6BkRFDilcP6Ru6GEvUK
	piFKozZYiNFqW5EYthGqhYm9LX/ZJEhzh25+6BhyLV2wkW0VpbL5hD7PK6VVM3DFsT/2AzD9foj
	Ycgxi6Rm3Ang2J+hc3+6wux+k2HR7puN4QPKFlLZMJChcPucAcpWZtXrA8C8rUzXTN1Icfzu4XI
	4MzqDBi6LPIq8
X-Received: by 2002:a17:90b:4f81:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39e1e4e354cmr15686528a91.22.1789665039926;
        Thu, 17 Sep 2026 10:10:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4f81:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39e1e4e354cmr15686474a91.22.1789665039322;
        Thu, 17 Sep 2026 10:10:39 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35df479fsm6065347a91.6.2026.09.17.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:10:38 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:40:29 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk, richardcochran@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        joabreu@synopsys.com, maxime.chevallier@bootlin.com,
        mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 6/9] net: stmmac: qcom-ethqos: warn about
 legacy RGMII PHY modes
Message-ID: <aqwfBZmJehXB8d8U@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-6-bbe3389d0652@oss.qualcomm.com>
 <178912591683.219967.17377991068527504766@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178912591683.219967.17377991068527504766@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0NSBTYWx0ZWRfX9DhG+3Z3Kpn8
 w8uFRcszKugdFsfzgFG/3wTG8tBkJ05bxOh5OWDDmfsH8elrq6Hb2vXkiLhl78DxkkKEN/4entV
 jH/7vJIZne0GrMvIm4s809TWcp9Yz0/RG0FByhQimgL2V9kUqw+NEsZ211T43XQss3nTJ7p9+ku
 4fAI/vvWWZRjapvbZUiTwTxFWidXMbHxzBZYBxBkDnrpQbNcbh6fR7NMd0HVdrpytoydU/hwEN0
 kxN+xj2VN1b3hi9ZCabOGNGuSsqu8kIGHkmR3dSfjESiQ8JXcY0Gnk5m+RcJ16mWJEW9NRQbRrc
 ScRdKtEHOIyhkfuiVLzTg6A71FKn1n61T+ykoSFBRLt2QU1BlSLtEX2aLrPnKiJrrDqIMgCd7R7
 PuiCcZO/ygHIAI1sZq0M0Q6bDMlLB4VgZ94NGYdEFFeunCNTsORaTpUpyKcEcw0S/WEWkt5igOT
 pV31v1fomJAGoJs1fyw==
X-Proofpoint-GUID: G_NbTDoS8DQFmEsiYr4BjXiPQBybGv9L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0NSBTYWx0ZWRfX6gWjt956tRk0
 BKiqtF/8k1bKj/UAOgjwaaJhSFY6DUVQjnfJ242hdrT4hSK7ioLIQqKnxZUBlvG9fnIDTMMUGbM
 uymlbwV0GrmskPl0wRVsilMdkTfetIk=
X-Proofpoint-ORIG-GUID: G_NbTDoS8DQFmEsiYr4BjXiPQBybGv9L
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac1f11 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=bzSRg-MVb8Bu9kwduOYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170245

On Fri, Sep 11, 2026 at 11:25:16AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> - [Medium] Unactionable boot-time warning on every in-tree qcom ethqos
>   platform: the new dev_warn() in qcom_ethqos_probe() (dwmac-qcom-…
> - [Low] Commit message / code mismatch: the changelog of "net: stmmac:
>   qcom-ethqos: warn about legacy RGMII PHY modes" states that "existing…
> 
> --
> 
> net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
> 
> This adds a probe-time dev_warn() in qcom_ethqos_probe() when the ethernet
> node uses one of the older RGMII phy-mode values, suggesting a move to
> "rgmii-id" with PHY-provided delays.  PHY_INTERFACE_MODE_RGMII_ID is split
> out of the shared case group so that it does not warn.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 53fb9de4d92c7..a92bf4a6a2dbd 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -764,9 +764,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> >  	ethqos->phy_mode = plat_dat->phy_interface;
> >  	switch (ethqos->phy_mode) {
> >  	case PHY_INTERFACE_MODE_RGMII:
> > -	case PHY_INTERFACE_MODE_RGMII_ID:
> >  	case PHY_INTERFACE_MODE_RGMII_RXID:
> >  	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
> 
> [Severity: Low]
> The changelog says:
> 
>     However, existing DTBs use "rgmii" and "rgmii-txid" and must remain
>     supported for backwards compatibility.
> 
>     Warn when either of these legacy PHY modes is used [...]
> 
> but the warning in qcom_ethqos_probe() is attached to a group of three case
> labels, so PHY_INTERFACE_MODE_RGMII_RXID also warns.
> 
> Is "rgmii-rxid" intended to be declared legacy as well?  The driver does
> treat these modes differently, for example in ethqos_rgmii_macro_init():
> 
> 	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> 		phase_shift = 0;
> 	else
> 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> 
> so which phy-modes are being deprecated seems worth stating exactly in the
> commit message.

I will make this clearer in v3 that all non RGMII-ID modes are being
deprecated.

> 
> [Severity: Medium]
> Is there an upstream DTB that this warning can point people at?  No in-tree
> device tree for this driver uses "rgmii-id", and this series does not touch
> arch/ at all, so every in-tree board hits the new warning on each probe:
> 
>   arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts	phy-mode = "rgmii";
>   arch/arm64/boot/dts/qcom/sa8155p-adp.dts	phy-mode = "rgmii";
>   arch/arm64/boot/dts/qcom/sa8540p-ride.dts	phy-mode = "rgmii-txid";  (both MACs)
> 
> The binding example in Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> also still uses:
> 
>       phy-mode = "rgmii";
> 
> and the binding carries no phy-mode deprecation note, so the documented ABI
> still recommends what the driver now calls legacy.
> 
> Converting those device trees is also the only way the advocated
> PHY-provided-delay path gets exercised, since ethqos_set_clk_tx_rate() stops
> doubling the link clock only for PHY_INTERFACE_MODE_RGMII_ID.  Would it make
> sense to convert the in-tree DTs (and the binding example/text) in the same
> series, or to hold off on the warning until a migration target exists?
> 
> > +		fallthrough;
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> >  		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
> >  		break;
> >  	case PHY_INTERFACE_MODE_2500BASEX:
> 

The plan is to convert the current DTs to use "rgmii-id" after this
patch series.

	Ayaan
