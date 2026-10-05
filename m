Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2594147CC61
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200565; cv=none; b=FPMrP1eIkZ8vmSBb3O/HuIYlLEMibNBTE3K/FHxlDgox+wOlUKtVL51b7XuarB/Nln2fvnApvYZCgjctVGVdhWlm+e1KeTo1yT/ffjnvmko2QhVNSmtz4dcJJJ+TFAs1sq/tvl2ZvsGbqBBIQ8f6hR2lyZ31WJjXBUfujpDhZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200565; c=relaxed/simple;
	bh=THs6bx1IoAxPAp4DnNJHxSRnux00o7DADNSvNshdIok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umn4nCcV1r3fQwrf6tsIt2a/zvqhOdFUDf7MHqxgv07f88Vk/4xe68xcXp6rGAqioSnikUAtSGacUIk2cSdjxSEqOBST/AgVlQYtQ15bY+s39D6tEcyPF6LA0kU9drHGLLr0/DXuxy64PMSqSC25HvwtzZl2udAmnFwXjlIznLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDTFF7Jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gM9/kq8l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDTFF7Jo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gM9/kq8l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695BTxd9973229
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 11:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=abOvEkNlOA0Ylyy+FBc9VdBu
	BuQsp2/yxfH7U5b4CZM=; b=SDTFF7JofAD43m7RDcTpULyp9Mjv9kjidR4NV+J+
	kt/NjeKtupq+LATZ76WXJty+h9l0BETIflX0cLmkmrRn5lWHp4j7/76P+5JzKiyx
	iX/OEWwfcaPKOu7cAM6GyCnicRC+OwqbPM6npK+hqxtslEDyR4D5A+zl6Nq/CW6n
	cEXdyrvR7S0P+7kfXsJl2thpN6bsboPcFiXWUpWpXi1d8yRgueOnZ10J/nrefgW5
	TIQkLcZvCgmbgO/4zgz9+ZXh+/mJ1I5s8WThKbAy0aegwFGyL2VE4SIlaJOfgtXr
	B16vFGQ62YB3nYL0KbuBd8SoXQ8JgjI2UxyIKTr9FUUDCw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08nj6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 11:42:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313d1015161so5058863eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 04:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791200558; x=1791805358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=abOvEkNlOA0Ylyy+FBc9VdBuBuQsp2/yxfH7U5b4CZM=;
        b=gM9/kq8lbLDScQm7SqGalgR7zhp+SGblfKTmssh14OKR7R0sK9vqTVgfK5BH4ytdbE
         SsR89I+SpPkyUuc24yZei38HPMwK8K0DmpMw0gb6yzkW2B7tMZFdb+z92Y8+JzdfFzVM
         TUEKTntLogGBT/Auss7RSqd1YvH3uojqzZy9SUJg6KsWtTpdtxra49tmTbVDTLnxBAp6
         KVMBhkTHi578iF8gv8PMsJZSr+criIayU3E+9UOWq+vPxRhoNDnYkyEqbZh0V23Bhyy/
         LKhh4T0bZd7IRXSeHPchqTrk3WIKHkghnEUjKEvBWjqwgEkOxusQh7n9xEahb6PKzsd5
         t0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200558; x=1791805358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abOvEkNlOA0Ylyy+FBc9VdBuBuQsp2/yxfH7U5b4CZM=;
        b=YcmlHlGgwAwOM7xXVNigwnhN00rnUpj6YqjKDebXUs4cWYKuKmlWVrctceY0cWB24N
         aPQqMfXGyeMq4ZM0HpalQ5MnTfAmlNyC0udLQJ47og16OC8LSU3UK8eLyVAi8Cl0nq3a
         jnb9R/QvQDKQc3Fmdvbp9Q+CtEOzkiv2F/4296dk2gkx9sbhLV8iO91v4LFJnhMcZNKo
         w95D7ImefRsO2dGO0fFTszylXBCKn8cGf20cMXr8mAJdZMKGNFFZR9YoAZ+hbWTIzRBT
         SATPQNStRfq5PgcBmi0YEBrQcccLIGycMmrvXrmXKZ6SagAOKiNPxXs0/1gVjEDQPldp
         TS1w==
X-Forwarded-Encrypted: i=1; AKwUvBy9jYCTVCFe5Z+fp7Y02Estt1d9HsY+nSBSG3YMvbFebGFeNTIc0FNY1LBAGa/degDQpSuLsTubqbF2v8x2@vger.kernel.org
X-Gm-Message-State: AFuF++loV+CDjBRu6mMJOMbQbeLL8k+/hBiw83TWVN/oab9tMtRuUWUa
	0+XdnWoWtJEz6w/tzcEi0atQM7ylxPEaUdwXoEW9MBo/VhoO+zW9uKfsXjeKg/5VaY03XCjWwph
	utPjLkg4d3dCgszww1YQvUA5NPYCf/BnyFjbDk95jxixb4xlzDDVdxOINJLLxIiyBvjXX
X-Gm-Gg: AYBFou2c7I9v2ffM52u+XEexvSi2/sN6xL2Wlm8f9GpCRVceuOo/qt7YeA/0cgx/h5i
	DbSLznl4ItBACbzFx+UIGN8eEl0cMdiJpE4yS0UNIc7SNMKbDwy5bCi7NrlaO63GFdwez7DXl9J
	qxuJeeGy7ZL5YJhAXLQNiNwVhaj++h5ZvBhMX6MhcPx80nHdPuaVE3z0QuB2nBr1aYB2r429lsh
	XfpTxjXDwjtZVNvA39iz3RaCARoMuxYcvlc7+dBQ337gK97YTffKynZLB1Ptni4RFI5q95bfsqa
	MNd3RjoztZdUff9k3gYSuXlazNNlMYBcWe4caFfPtgdmf1KE4J2mN0iIMFFau10EKJXu6md5xJV
	vedUxpo6B6ikMDcZDlINLkzW/ZtaGjtsJT5nAn8ipG5/VHrdJIRxC02q/IinowmF2Xxq3Lwurds
	bo+UXD9AyJLTgm2MPZZVnlMOH/uqHT
X-Received: by 2002:a05:693c:8810:20b0:351:165a:baec with SMTP id 5a478bee46e88-351165abed5mr8555586eec.37.1791200557413;
        Mon, 05 Oct 2026 04:42:37 -0700 (PDT)
X-Received: by 2002:a05:693c:8810:20b0:351:165a:baec with SMTP id 5a478bee46e88-351165abed5mr8555544eec.37.1791200556694;
        Mon, 05 Oct 2026 04:42:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127021d1esm14466025eec.4.2026.10.05.04.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:42:36 -0700 (PDT)
Date: Mon, 5 Oct 2026 17:12:28 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Message-ID: <asONJKiT8pbIulWj@hu-varada-blr.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
 <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
 <asN/uLBfYARYXlhb@hu-varada-blr.qualcomm.com>
 <lfs76pvsdpkkle3b75m2ez75x25xjqjkgbw6kkaf7rxqrc2plz@7sekrxlnqcus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lfs76pvsdpkkle3b75m2ez75x25xjqjkgbw6kkaf7rxqrc2plz@7sekrxlnqcus>
X-Proofpoint-ORIG-GUID: bx7vhNyFzEks5a7IPFkFXx4LsAufYVio
X-Proofpoint-GUID: bx7vhNyFzEks5a7IPFkFXx4LsAufYVio
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac38d31 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jxoNFKAhCVCw1AryeQUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0NSBTYWx0ZWRfXyCs8cnVDVDOq
 21Mq00NJdY528NzfAsPwT3YMdI3tbAFZ8Z6LcUDQhBM92TkNCs2FfZlZHZIBUkdVZTRoKGyX7hj
 x/C3ehFHIgul1AnX9l7KymemCEReInw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0NSBTYWx0ZWRfXz9LHnYf1f/wx
 oDEGxePjLVeI/miLn2DhtG1lPeos2qM+5vR0Mh+tc2V311D4bAzXRF+0ghd1N3gZc5t4rAo0gqW
 EKB7nxDyMhqoWGP3Vo1wU/w+uADNWaiBZ65qbtO3LmXIs4snKNbpTG6BmTFuFfMH6KA23P+25bL
 K5aVZnUK3wlRRSprSoUwcF1Nz4AdYCVGuVC4drJbDBAH4RNMeNPmHU5aJ3/w5XD5CMyXRJgVe3B
 E8TACPLL47RYO14dRKLtlFqihrm3ryBUfu3tzM0PKw+T8BzTcckDjmv5GyLpBhQTDYcryD2JDna
 SIyXzwS8mLmslF4VNnAZhg5jJpfh86vTQlTdT4bvuUUTRV5b34prUCiO8RM1Ykuz+0EWfnXZTcx
 6tIZW1EDQMvILMxYGcoPaiSvKlI7ZZbrFx1xMw2S1JCcoYWCTblhKnWTvBs1oBQS0qHhkTeK1IE
 V1vDjTw6HQeg1ldcNow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050045

On Mon, Oct 05, 2026 at 02:01:48PM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 05, 2026 at 04:15:12PM +0530, Varadarajan Narayanan wrote:
> > On Mon, Oct 05, 2026 at 10:17:32AM +0300, Dmitry Baryshkov wrote:
> > > On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> > > > Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> > > > on this SoC require a dedicated init sequence and override parameters
> > > > before they can be enabled.
> > > >
> > > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > > ---
> > > >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
> > > >  1 file changed, 62 insertions(+)
> > > >
> > > > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > index b6bbf2b570c7..8957f208bc51 100644
> > > > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > @@ -29,12 +29,15 @@
> > > >
> > > >  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
> > > >  #define POR					BIT(1)
> > > > +#define ATERESET				BIT(0)
> > > >
> > > >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> > > >  #define SIDDQ					BIT(2)
> > > >  #define RETENABLEN				BIT(3)
> > > >  #define FSEL_MASK				GENMASK(6, 4)
> > > >  #define FSEL_DEFAULT				(0x3 << 4)
> > > > +#define FSEL_24MHZ				(0x2 << 4)
> > >
> > > Use FIELD_PREP, please.
> >
> > Not able to use FIELD_PREP, getting this compilation error.
>
> Sorry. Does FIELD_PREP_CONST work?

Yes. Will post a new version...

Thanks
Varada

> >
> >   CC      drivers/phy/qualcomm/phy-qcom-snps-femto-v2.o
> > drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:449:53: error: statement expression not allowed at file scope
> >   449 |         { USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
> >       |                                                            ^
> > drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:39:23: note: expanded from macro 'FSEL_24MHZ'
> >    39 | #define FSEL_24MHZ                              FIELD_PREP(FSEL_MASK, 2)
> >       |                                                 ^
> > ./include/linux/bitfield.h:136:2: note: expanded from macro 'FIELD_PREP'
> >   136 |         ({                                                              \
> >       |         ^
> >
> > Thanks
> > Varada
> >
> > >
> > > > +#define VATESTENB_MASK				GENMASK(1, 0)
> > > >
> > > >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
> > > >  #define VBUSVLDEXTSEL0				BIT(4)
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
