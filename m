Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FCD377A89
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170294; cv=none; b=ISFUHgpeLvndGp1djM9tt9bhX/ztEnUn/n9QZKSGcYEI15GHxVf9BM4Bo4GlvVFthx7/JaY+C0dSsxOrbEJ9/vOi/igHFDhI79uFu7kQbXDBbVSbsNgaNTs6C/GylyZWJmaU4sJyIxvjPIPFcF5AScWXkV/wBY+E8GgtzUPK8ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170294; c=relaxed/simple;
	bh=ASCO0Lh4SYfqFZo+QWVw9DfS6fnJxkZnm06PI6d+M88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNBE9cdKgqgZcqzHKOfIp8ufLyyzp11XJ8gvk4zxb03IQ8M9b7sU8BPLBcfT3geiZqtXmqvIq3DwUjluqgH8plWXOeE9qpg4AwEORt4yICMeWKjbAvqZU8ikZuF5ILTdWvqzuggiMBTSyaphzflLs8E1mNzodlxGPG9EVu6n8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xe7bp9sb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYriovbz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xe7bp9sb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYriovbz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUbg3413862
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qq6xeq+5N6XfyP0fS9pBoOWP
	w0EfK2lsnoPvPTiFh/k=; b=Xe7bp9sbIhdsqaUU+Tp+K0Y+SLJ+Vscvz99AoTUM
	JXaeKQTGH7Y2onQk0FVAHZd7oIZxf+r9U/22PbkJ+HFqBn+hhnY6D4NRMDSsOJjw
	UmFVWC+Ft9yf4ZBtuGLaH99BwdE2GIv9MMgxol+PhoYAk3e+VJtlPpSgUuUMNbu9
	bzJk2jbU5YYUQaFMoSPgyss/rCskrML562gC4vToTHNy/NJ3HS3zCN91njsZ5T50
	x06PJt34V+fDI90RaNbbz4mU0QlIuCsdg4w8tl+VVR8a+gzI64QLHBcVbkyCqon0
	V2D6Zd8YLVfX30mWUn5REjYQf4nFSXPfaOXmqy8XUhccdw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n26xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:31:31 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66fae2bc827so1160795d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790170291; x=1790775091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qq6xeq+5N6XfyP0fS9pBoOWPw0EfK2lsnoPvPTiFh/k=;
        b=kYriovbzX41ksgH3RiD8fBPLYA2dpM8rWtGplPzbDhBzYqkzpGkoo1c6ZdTLWVbyFv
         Wqxc7cZitQgASM8AwbDKfPWigqCPEKYCrgYjm1kX4BqkMBot8DIoHFbnI9SXqGKTVGh+
         jcn0+qBVAgilNSXtvRM5u5BMDRxhXk2mnpsOMqt4+2ijU9ltnqWo1S38bDm+HMGbFhvw
         JZPcuS6Sm6VaRFhzMtC5Asy38OJxKls28DtDE67NHtzWZhnr8ONcYfe/uKa0qVKfQW/A
         IFQk4Wp8jH8XAZ+OQEvtoy4cbW27G0CMdrYnaMFey+rZTaUzE3mZni3vvzApxgA8UhV/
         wJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170291; x=1790775091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qq6xeq+5N6XfyP0fS9pBoOWPw0EfK2lsnoPvPTiFh/k=;
        b=IuPUVhbZyp1a/LNHOLpVIPpezCoZ/Qk/w7C6Jjs14JdQPHaZseAMv8jWl/NaYPy13S
         seyJLAj1dLZCrwXFCmNDghq/j2txnGRXQZJuqQgQIsURrGSdGDQr6Rz40l+Sr7/5uffn
         VMWRFlXM0Z1IHQy5ex6YiH5ZTOT0o13x+VasEd4cCJ6UKYfEGcg5wvpjfvC9O1spw6ti
         0VndyjNLwiWwZh18fUfdnzuM4H1Nq7jFvsVgO5CkkJ+focol3xzmKN3BkCEfaa84JNMa
         K72g54qeXB8ABAl2DYsXOz8A6KekzMuG/fn4lnzDIS893EAD91fd5hGADSHFZbhGkCCT
         RI6A==
X-Forwarded-Encrypted: i=1; AKwUvBzYcvD8kPBjvWAAo6ttn+TeBOQdd6v/OXaf71AxePFKdwue4RzjCF2ZXJcrelmqXBD2igCJubqIVFdHgXos@vger.kernel.org
X-Gm-Message-State: AFuF++mSOYrxos4MMyp/6AnK6mn7gAb5ts4uZ7FanVt7yg8O/+NRxpAa
	RTmq/Rk5PZ8PuSuWqVNWE7p/fhr7+0yQwDmKQMMf5ZMcWBOqpM0Qah6KVkCNkIutQGewNKEplY8
	pR4QrAqRPbsV66lQdeEV6Rr3YgpQGZ6C9CV1oaIx/YDlr4JEVjChvo2wCKXYwZ+AAdIZV
X-Gm-Gg: AYBFou1QO1oTnY2jGPOO4uWk8lvSmsrLaUbzHqVgMMnrfk8MkhEtUEw+QjF271xQhdv
	lIHxUto24468tA6d4gRH7tFLMDR2qRysOFsjhR4fQiwIti/jquy7OWQQeNtdmaeKOgnfrKkmnZv
	QGOyhoSxkRa0H4YrptHzjTb/ihG/d6usJzwxhS5tJYvVG4ExTkhrNtl6QWoSAHoWraYSRI42XCL
	mNvj2JDdb/NiCE4QSYoJ+wXC1GXhcPytCco8iwqPCCBMsF1GU68jxlsqaaH1DfLjNiNXU3pWNHw
	25eNlYa4gd/v2jKIKUPhQpbN3BOwHSLRe79jZ3Dpqqn86Hf6JhSy7UJFAN6vXvvcsx4JVPa3GTR
	6rUagjyUccFDR
X-Received: by 2002:a05:690e:4503:20b0:672:a4a6:298c with SMTP id 956f58d0204a3-672d5728d7amr1011745d50.6.1790170291094;
        Wed, 23 Sep 2026 06:31:31 -0700 (PDT)
X-Received: by 2002:a05:690e:4503:20b0:672:a4a6:298c with SMTP id 956f58d0204a3-672d5728d7amr1011687d50.6.1790170290514;
        Wed, 23 Sep 2026 06:31:30 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c43b6dfsm20549436d6.31.2026.09.23.06.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:31:30 -0700 (PDT)
Date: Wed, 23 Sep 2026 19:01:18 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 2/9] net: pcs: xpcs: add USXGMII Clause 37
 autoneg support
Message-ID: <arPUpiLe/y/aKR/a@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-2-4b1c682af70f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-2-4b1c682af70f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX448konRMBcDM
 y0T2+8qmx+K2w0hwUFrcLtnIqWOp2F1QLoTNh58WEDZNe07lZhwNv87Vh1xtsgXEBdbRrzLKDME
 yRtwTxBYhE1yzDiqJbH9YLnCCU3Kllg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX9Kw435UWT/U9
 MTylXVtuP5cYOb85e1TCYuQlX+HHQbTMVswuvJK9yvaGIrE1Go4LpxRwkMSEurANj3xlsepQRgq
 EgbhAASS225EjIRRl0KjFHskEpSPm9GNnBzeccHqU9GYYto9hwmafyNodQ+u4dIYiRXuoBAmKbv
 2TgW11FxnzQAMxYx16wu2GS3tAC3EjkKzEmBsnFe18rv7gtU+nLvsBYqcW5agKUeMpxyG+ZN4N7
 VY5vqwet+mmKLjvN7Nfl5klhK9JZggUkg1BES/qHyiFdrneoYYUCduUZ4o5FVRUyooJh2qWcGX2
 Ge/W4Vl4CO+LBGR3RngAqwVpy1G7JSgnAtfSnwyciyyFLaseaW1BLEJPFJQlKFY1lwIQLhtFV/q
 y8JhJ16noP6B91vCcrHHJ+1sMq7cCXRi4wJCdp8abJ6NYVYuue67vtfzO4H5q6gQUvMCBBdUiwV
 +I3six8clvI1sNV4y3g==
X-Proofpoint-ORIG-GUID: IFF7VsinoKD6E-YxjWUkfb6bdeyCtw5f
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3d4b3 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=U1nmBBJXYHZWlwlGUpAA:9 a=CjuIK1q_8ugA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: IFF7VsinoKD6E-YxjWUkfb6bdeyCtw5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230053

Hi Andrew,
On Wed, Sep 23, 2026 at 06:37:28AM +0530, Mohd Ayaan Anwar wrote:
> The generic DesignWare XPCS support currently associates USXGMII with
> Clause 73 auto-negotiation. The XPCS integration on Qualcomm Nord
> instead uses the vendor MII register block and Clause 37 control and
> status for USXGMII.
> 
> Add a separate Clause 37 USXGMII mode which configures the PCS for
> BASE-R, enables single-port 10G-SXGMII operation and enables
> PHY-side Clause 37 auto-negotiation.
> 
> Also decode the negotiated link, speed and duplex from the vendor
> Clause 37 status register. This supports 10 Mbps through 10 Gbps link
> rates exposed by the USXGMII status fields.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Seeing your question below, I think I should have probably mentioned
here that this sequence is given in the programming guidelines of the
XPCS 3.50a databook. Section 7.6 Switching to USXGMII Mode, point 10.
states:
  Set bit(12) of SR_MII_CTRL to 1 to enable CL37 auto-negotiation
  (paraphrased).

So this is a part of the licensed IP, rather than a Qualcomm specific
addition.

> @@ -687,6 +736,7 @@ static unsigned int xpcs_inband_caps(struct phylink_pcs *pcs,
>  
>  	case DW_10GBASER:
>  	case DW_2500BASEX:
> +	case DW_AN_C37_USXGMII:
>  		return LINK_INBAND_DISABLE;
>  

This is incorrect and I did not find out its side effect as I was
working with a firmware managed external sitch. The XPCS supports
USXGMII with AN always, so this case should return LINK_INBAND_ENABLE.

	Ayaan
