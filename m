Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793249008;
	b=QUQqdhSTvP6/NsAnq2fFVLuIg16QpjPQ/XK2MKRsNvnjQjBSt0GHiUR6MoXmIhMV4Ru/
	 X4XVFLhGQdoxuTKRQRFAMgyXJNlgaYW/yIMx+Id/XrIGurE1rD/jaceWTXEF+driwHAWN
	 H7iacgsGDtYP5hd6oWPnMXXWpDQKx1u2+DgP40/paDii6qRC5dMuGENDiFCT6IBjceMu4
	 F+Xz1GLlvt0Z2ehtMYmm2sRTln64wrHdCdF+kLk4UJNXR6e1fe6leJz00yLRbCtoyR+Kh
	 /4ktfqMGRbaTzCkxKy/0tMr68F5Uzoyu+fkYONganERHluu4zqNzKSCODeWBHEj2fug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793249008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5uHNMI+mYwqaa6AkEWaTgDK6tIel6I/W1KNWIPq9vxA=;
	b=E1Oxl1SN+d2AvTp/6VehEg6d1aYGVnFGbVUCLfN2cz904+hTHOXQ+EHePKVvcoLEqssJ
	 qQDQXs4SReW5+G7Pc10kVRC9+NGeZbGAHOUebi9i7Zln0K/mZw1dZ2kaCl5DL+dRJAzvr
	 JF+uqsbF3FHOn2IoaiLsfoqhaVDQqmUvfD6rUC5rzwRs9gfD+cZsCRPEuO2MZj4u9CSQh
	 iOIIQ4woofYrUcCsYh268TGNFBJftJBQnvqrIpfQbowWoAoV17iKowt+DY2IvVHnyHSil
	 U6DCBfWJtGSjDxIyM/6sCHDBRqBKCo5hvGL4Hhmop2tccDNQCLsnQfZYEABGctQrcOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1QNesmO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5IRYPwf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A30606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A30606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1QNesmO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5IRYPwf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jhaE3920500
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5uHNMI+mYwqaa6AkEWaTgDK6
	tIel6I/W1KNWIPq9vxA=; b=L1QNesmOMfxm4HJEsyioci1+1ty8vabSyp63YJc6
	Y0pm/BVQ/U3WktR+OmxynvrRZ5nseI1131WcCB4gQkJaF96caniWT2odYjmk7ApB
	8Q7V/PBVzGsbuvxswjKaVvmd/UpzxV32KFcf8cnr+grakLQgMiilhj9XrWHhnJRu
	D84aIsGpIJetIyhzEOKYA0GbL7/EUW3Hv5bNRymyOOfN+v8OUBA6jecrcV4hxV6U
	9zQu5Dzyo1IYUjx3cTYK+YLa6cRVcRlC7uoy8hHlfxKEzXZ2qtcUBrErXpNdSPgp
	OVfxm5VRg5jcz1IR9Cg56PHx745tEoxNBwB4P0k1CP2fGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehtwc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:43:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso1510015a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793249007; x=1793853807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uHNMI+mYwqaa6AkEWaTgDK6tIel6I/W1KNWIPq9vxA=;
        b=U5IRYPwfyOuGTQIRf2U+4vvD0FDb2PNkaf5zse/xHRdpM8SuqIWcd/9e71zhEIHcbV
         A0SLfHpIDsXs1/zBmbexZktGhuT6WKtxrKXfwc26OtOpVrU+Sh2/rP1oxuoMBD7dL7QD
         tQ839aC5MV1K1Q8syJvyYnvyXSf68a0KWPvFKtnX5HCkY7s99A8xKx6uA4qp+lFQEFvH
         F7E9M7LFj+FcleB+MjQfxIv6ZcVSBECLdc4njTWSU1xPONV6H1BxRxBim8yTzVw4aebB
         HL/R0Tc12aWIXNHKURYapGqmcS/kzYcvyvrjXWnzi0uHTNYH4ktHjauAV4XvGJ/SGD2V
         n1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793249007; x=1793853807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uHNMI+mYwqaa6AkEWaTgDK6tIel6I/W1KNWIPq9vxA=;
        b=gWLfXm7Vk2JU+mgi+egdbMWmnCTmk6hxvWOw773/nuxbNWcA7xzlwOnUlDoQIg5z16
         uzlGyuEkLt6QSwdljtYXBaXYTR0s+dIvXw5umai6BVNTTYsYPjDtT9uNBTJwNVRMi6Zm
         F73G9EsHHBWnknCw6nOib6q8tcX6GMzRJ3dh3K0x7aTsGblpgYN7n3u4yxge8wiZmF0s
         h+lSdEuE+AbWVMpLiCQONNL3RdTkQKD/z3W6lg31iqcW7D51xE4Y2DyZ/EwHtiK5ktFZ
         GTXjb+7UnGi2IblThKtls/LgRh/L4ffVt2cx/tb+XwTu55CnNvJDMYR/TfXpQ8YxcOBc
         1BUA==
X-Forwarded-Encrypted: i=1; AKwUvBzz9id97VhEWj4CEv7MgDxRQruiLsmWRiRk4TE+02tkSfopYw7XGf6hKNA0wDZP6Rmzw9k1nfAEZ66CEwkV@vger.kernel.org
X-Gm-Message-State: AFq9FYKQIx25nrcsMeqXzrdoelxNAtibn45xhxHHonvzjZaP4wbc9Skh
	/253eqQSVp0SJGb00nFmi0KYRxc+o5QxuY1/pa/ePbbIPMoJvBcB0Mro93fQYvA+J1GmuUIL0fD
	b33ViB8FwVcC92UF/V4zpm2iE2iNTQN1Z781e4/F/D2v6Jug7127GXyvzK9+uxaLV87lxhk1Lc2
	y2
X-Gm-Gg: AYBFou0FarN1Bm1ZhMr+DolRoopK0RUl+UPaXVwXnQtJT4eh/p4LF36FHEtNPkxrxRd
	0nnTjhh5jAjks5e3rCQPc55haDd37LPj1DwowLay2W4EEmBhI2v57dgKFMzPhuzNBFQtRuZe8dS
	TEJ/jvgS11fmLukfJxeQyA8lL4R7ZB2P/M3eXpJB8uonEAXA6aLILGklFrcDa3XHao8gVaOW/9F
	Q0vEtn8AX9K6dRpgDPBIlZqakdgFpwszFZsYfWtEnXVjr+/3+UMBURsAhLiAYM9IJ7Kt11BlW1w
	WLzxe+wlZTSDRpIJGV2V/3HpFL/KSqWhjD6mhHYiTxHHRQvzYrofXKEQBJYpfyf0mN4o7ypMmpM
	CBc+k+9WGcEGXfH+zUKDQrbJ5hD4yPlnV2DyPrO0sOaR3Zy4/mx2xqeg+pCiLwQ==
X-Received: by 2002:a17:90a:e7cd:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ae580a0206mr3341873a91.36.1793249006528;
        Wed, 28 Oct 2026 21:43:26 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ae580a0206mr3341852a91.36.1793249005981;
        Wed, 28 Oct 2026 21:43:25 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ac878sm2108575a91.4.2026.10.28.21.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:43:25 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:13:19 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] phy: qcom: sgmii-eth: add Nord USXGMII support
Message-ID: <auLO5z9kXDaHl1ka@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-3-f8ac1c487882@oss.qualcomm.com>
 <179318601645.5872.14222392238387100610.b4-reply@b4>
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
In-Reply-To: <179318601645.5872.14222392238387100610.b4-reply@b4>
X-Proofpoint-ORIG-GUID: IUgixbImAr_15om-Z_sxve8Dzm1RoEsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNyBTYWx0ZWRfX1kjTjaJBz+PN
 1+W2r0ACvujw3MmLtKmQsZlmF+Arvlpek0Hms5eP1FT9mcb6nR3cJ60PP358410s4f1Q29UmGlw
 DnfuinA8W5gAvlG0Gd8eRp7qzWEbwS8HxlFmMAuXVxa1uiW29y9nOu08pLpRbrX2447nGn2yyrv
 e8+MgWNwSv4o4DCe4CbphHD9yiogvGt2vnuJiq1n1A96M0Gjs69FSSPx1MWpIss12UGerMtyp4K
 Lvy4FmjwBe+6zeUl9hrLqDTOyBQS/Gu7ruc/z4Hm8xxhixWEojLT1K8HE7KRQeV2RF759pKPfz1
 mnl7dWhJdheAZWAtcv6Eo66fwFDrjG+8z6aKLI4ZVKrPJSDq88C0bwJ1rtconnqM4+5cs5b1kFN
 ST5Dsrix1tdHR1OyaaeCbq9Mm/Sp2rMAUBhn0ZlQZDxHlExl8aECK22C3yGwvbw2De7PfHowR0D
 aUg4UKIIj/3OqZGwXJQ==
X-Proofpoint-GUID: IUgixbImAr_15om-Z_sxve8Dzm1RoEsO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNyBTYWx0ZWRfX/7wVgcHLCSsR
 t1c8Ekg6kwgBwc1/JVPmDP4vdX5zBgvcS6CWH3yMmUOgkEmEG1TuIT79MQbGWzDQL6Ujn2N6s8h
 sI6Djrl4GSbXy6uO97t8RrW+YmaQxBs=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2ceef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gdjW7vFeMs898lxTiF8A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290017

On Wed, Oct 28, 2026 at 04:43:36PM +0530, Manivannan Sadhasivam wrote:
> On 2026-09-23 05:34 +0530, Mohd Ayaan Anwar wrote:
> > Nord uses a QMP v7 SerDes block which is an updated version of the
> > SGMII SerDes PHY IP.
> > 
> > The SGMII SerDes PHY supports multiple operating modes by programming
> > different SerDes line rates. The driver currently handles SGMII and
> > 2500BASE-X configurations only.
> > 
> > Add support for configuring the SerDes to operate at 10.3125 Gbaud,
> > enabling both USXGMII and 10GBASE-R PHY interface modes. Finally, add a
> > driver compatible for Nord.
> > 
> > Select USXGMII as the initial interface mode for Nord. phy_power_on()
> > can run before the consumer calls set_mode(), so this ensures that the
> > first calibration selects the 10.3125 Gbaud programming sequence.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > ---
> > ...
> >  static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
> >  {
> >  	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
> > @@ -275,16 +419,19 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
> >  	case PHY_INTERFACE_MODE_1000BASEX:
> >  		/* 1.25Gbps mode */
> >  		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
> > -		break;
> > +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> >  	case PHY_INTERFACE_MODE_2500BASEX:
> >  		/* 3.125Gbps mode */
> >  		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
> > -		break;
> > +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> > +	case PHY_INTERFACE_MODE_USXGMII:
> > +	case PHY_INTERFACE_MODE_10GBASER:
> > +		/* 10.3125Gbps mode */
> > +		qcom_dwmac_sgmii_phy_init_10g(data->regmap);
> > +		return qcom_dwmac_sgmii_phy_poll_usxgmii_ready(dev, data->regmap);
> >  	default:
> >  		return -EINVAL;
> >  	}
> > -
> > -	return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> >  }
> >  
> >  static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
> > @@ -340,7 +487,9 @@ static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
> >  
> >  	if (submode == PHY_INTERFACE_MODE_SGMII ||
> >  	    submode == PHY_INTERFACE_MODE_1000BASEX ||
> > -	    submode == PHY_INTERFACE_MODE_2500BASEX)
> > +	    submode == PHY_INTERFACE_MODE_2500BASEX ||
> > +	    submode == PHY_INTERFACE_MODE_USXGMII ||
> > +	    submode == PHY_INTERFACE_MODE_10GBASER)
> 
> So the driver supports all these modes for all platforms? The commit message
> sounds like only Nord supports USXGMII and 10GBASER.
> 

That is a valid point and something I have been working on for v2
(Sashiko also raised concerns about the possibility of the existing
platform using the offsets/programming sequences intended for Nord).

Going through the programming guide, the existing SA8775p PHY (QMP v5)
only supports SGMII/1000BASE-X/2500BASE-X whereas Nord (QMP v7)
supports SGMII/1000BASE-X/2500BASE-X/USXGMII/10GBASE-R. Therefore, we
need something like a supported_interfaces check for each platform.

	Ayaan

