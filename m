Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26F476686
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197125; cv=none; b=hUopmUNpUotudc4BF7HU6Piheskqz1ZH0sjZDrwQkvMrytKkKy3onnVLBB2rsf/V7B8A1G41vSABcUpt/9WbLAeZaKb+Hx+GKSa4wmmGj6qxVLkpQfQ8kYPSrkEK7Bjix20bDPs1BgZHt/0c3k9Kb7VEmTcAhPcSBnqunsO5VNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197125; c=relaxed/simple;
	bh=Oi22PG/2WusMu/4lVK2j2cf/IGBMHwO0Bsn1RuvnEt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STe61TY9Ia9ZHuX2LZunTnWAWPsDH+y3gUeD/P5HA1pIpIhxZq+krIVRMSE01LESjq8mLYGYp0nQSL6kjjdnOz9KEx5oYvwjxgg3IoTSLRx/rfJo8xc11AyB5eZuZJYC4SsQSwO7RnZh1UagaCW2g4NOvMrOutySKPeSfOZAfsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJR9AuEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZlx5fVZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJR9AuEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZlx5fVZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xnGL1802866
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 10:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pQeClRWL5fMnV+jW+MgQGB0s
	7nSB8YFmEBzlXVtXF7g=; b=jJR9AuEvbL0VK2nl5a38FNlDKkChzxp1nZsKcG/7
	qXezKMQxYRBlj9igqMX7mlEvTWA5ESLdkAAkBHthWwd2LPNlrmg7ODkkcXtQ/nnw
	AI2zPgwsm5L/O7LE1Eu7y2U8N6alJ/OX21qZWSle0BLV1fGACI6NOLABApPUNZCK
	4cExS5J9BVz5O0ri3GAoORoEytWMUHBXNgmJgoWIRhkjpszBftt/tQAKQrl33z0j
	hMDBuz9iXAjHEGPjx/2hNwhqArsjLovpSPFteMfjBmGYhKv2YnLiGfNlg8aH6a/z
	m4tuD4QCeeKOhhT7s88IazqzvDW1RyHF/ZS/XkborU+3qg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa5j0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 10:45:22 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so5762776c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 03:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791197121; x=1791801921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQeClRWL5fMnV+jW+MgQGB0s7nSB8YFmEBzlXVtXF7g=;
        b=CZlx5fVZQOb8klRHJpYygdeOtfJOKx0ERSWeJYcVq7mazinsfn4aUusLTjlZrz720d
         w5mLSyN7RhEzMxXmT6IV19brnqUlQD235p5d/lX7vNwelZ/uSOax7Q3CsZwEhhaZRIHS
         mGEafWqaygMrpPD+953jSZJD63893pj/cPlDs+ZsEkuzWAUZ/4kZwM6LsxQo9QXJ7ZMy
         oN0YGuBLuz1z8o8Gm1LY2w0ehl3bEWIZ/kIj0aMBc5ahyyBWLEXRgVp/pGuSabNfEqiJ
         fyWGWqWE4wjrHq6O3tEWiy8OlAoFDi0og3eLCc0J7Fzmqk05d786xCFoolYG2PTGCzvJ
         D0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197121; x=1791801921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQeClRWL5fMnV+jW+MgQGB0s7nSB8YFmEBzlXVtXF7g=;
        b=wi/g9G6x7xsVgwU4gWmGrrUzk8nmlEEsDMWvuELxohpColKjmnGB2WUu6ZJJuGFpr4
         GnSqekVe3apzYvMrDh0yIiBmsOoLgcUQnK9TAe+BGozJw2L5mKoqz53p/XrePoJqaxyE
         DD8WEjcahMlKHWhLps49yDmeVmvkDzjs/S6E4laXUCXZK67wY5NyDZ9TY7nqIjGVGT+o
         zDb2uMBvj5YZZqpXRC5SOY6ZrJzotzpS8G1Fb7G1d/EAevHlZ/hp2U4s5QC+IMg/BXXg
         V7388ZbHylEeAhddgxIKAEuspemqA+Cl3TrhSYNmpEtBZIb9/DTiFoA6oR9UROlfBHog
         jLIQ==
X-Forwarded-Encrypted: i=1; AKwUvByW9bxx5aZWfAR845XnnpE2qYifVah16wp27IY5Zd1hqLTwnzPF5tNuYt+ijLlKY2XtTWud+lgcON+NN+1H@vger.kernel.org
X-Gm-Message-State: AFuF++mUCYacmWV9Vr/HMLLN17rpepT57p6g/yhEhrmoRx04XUbXe7pl
	PsInn4RDiu1diE70R8pGL5sL1pu80CmFmaQ6Ys85Q1DSmyM+b01fILwmR0erUas+EzpQLH/rLoQ
	Xsz4UoGTDni2kE5ZwHO8QMCO13lKu1dPeLOCyuCabHsBuKvOHWwEjtcSn7jLHGbzFh3op
X-Gm-Gg: AYBFou34utaC9H7iNoMBQpiPjmWm/zCohNNY2jnu4N2lhiyh1ORJOO2k9+7Y+D9tj8g
	4TY72bo9E5XqTFCVep8z/UtpDXN6Xjy4Ikh06YHEm4WmoLKgy/0fG2N5qg+1w0g9OuCGnG80/IT
	IhQmOAIuZ4GHpNFKqsYsJMm2yc/IgpByU7CDYy3aD3tAqRpJvPbp8OQfvSYieu1XDTPHJ5TPDNy
	9uI4vn3Der1BqurJJ875t5faoCH9AO43kGP9nOqY5e2BNiA3/nCtp83/DTofYtgoCaHaAfND6SS
	p6+M0DS5O9ZU9AOzYqU85iQ7k7hMtxvMVYFIRkKWKOuO1zsu1vzf/KVr3noMKFoQQR1zWxi6pn5
	atEa/aq3e3Hz2dAOL6DzcrcLjrFCm2Q35qBo3ISEEXnbg/i2MfvjgbI1KZli+Ojzh6G/tHNtvnx
	su3R2EdhXY+OwX/bdNdqkZ52O5c8PrSQ==
X-Received: by 2002:a05:7022:b057:20b0:152:3812:496a with SMTP id a92af1059eb24-15238124bacmr9694227c88.43.1791197121016;
        Mon, 05 Oct 2026 03:45:21 -0700 (PDT)
X-Received: by 2002:a05:7022:b057:20b0:152:3812:496a with SMTP id a92af1059eb24-15238124bacmr9694186c88.43.1791197120458;
        Mon, 05 Oct 2026 03:45:20 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc3992b6sm24328004c88.6.2026.10.05.03.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:45:19 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:15:12 +0530
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
Message-ID: <asN/uLBfYARYXlhb@hu-varada-blr.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
 <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX2yhTbXfCVFk8
 Or4hJWNJskOSc3vl/kjoRBbOWs4EvT8uEloB76WhGgfMeyH4KR92D/PytWeRCuoVbyrqD0RnAJA
 LnR3MhkSH11nonvayvWpHr/7kqLTu9mhs3L6mSqfAr4dxkI8EfWQL/TQAm4OoPB30RAjrFOpn6R
 RMsXbhmzQse6T8hi6HgS4yz5LZ/uPtqQWojjrhMcRLrudaw7FOQo4KjBiN+vCDi59vAscFJdsI3
 fYibb5Ym/UXtmMAmzDzMdhx5yiI/m+wYVhJ995bMnlz2HEnt6YPF6ynNEXrEgWOShyqAMV59jvw
 YnaQ6MmkIu0BmQU3kX2i/vxl5uwB2EbYNO2G8HnUywOyb2SSARIUPPjU+OO7c0dUoL6SOvXB+Bv
 IYgpq4LCHR3/FE0Co7QsyAjrD+5P4rUbRtjjmL1C0xInIQwfVCALguqRkyKhDeiRHenL1cfHixN
 rfyAaWrcZ/Ee81ITNaQ==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac37fc2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3-y4kEJGFriZeApEiEQA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: OXJDLEKf77JGNE6XVez23WgIcp692DSX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX6+nvNzvqYGSm
 ANUG/6tmgWjAxontqHdbhSCMd6eMUghWiAHot6NOtOB8etEEqIsg6VQPpHnXSfa3zp49WgOHmnP
 XYysl8sQugdM6XJx+6Wv49v7FvRNE08=
X-Proofpoint-GUID: OXJDLEKf77JGNE6XVez23WgIcp692DSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050041

On Mon, Oct 05, 2026 at 10:17:32AM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> > Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> > on this SoC require a dedicated init sequence and override parameters
> > before they can be enabled.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > index b6bbf2b570c7..8957f208bc51 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > @@ -29,12 +29,15 @@
> >
> >  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
> >  #define POR					BIT(1)
> > +#define ATERESET				BIT(0)
> >
> >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> >  #define SIDDQ					BIT(2)
> >  #define RETENABLEN				BIT(3)
> >  #define FSEL_MASK				GENMASK(6, 4)
> >  #define FSEL_DEFAULT				(0x3 << 4)
> > +#define FSEL_24MHZ				(0x2 << 4)
>
> Use FIELD_PREP, please.

Not able to use FIELD_PREP, getting this compilation error.

  CC      drivers/phy/qualcomm/phy-qcom-snps-femto-v2.o
drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:449:53: error: statement expression not allowed at file scope
  449 |         { USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
      |                                                            ^
drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:39:23: note: expanded from macro 'FSEL_24MHZ'
   39 | #define FSEL_24MHZ                              FIELD_PREP(FSEL_MASK, 2)
      |                                                 ^
./include/linux/bitfield.h:136:2: note: expanded from macro 'FIELD_PREP'
  136 |         ({                                                              \
      |         ^

Thanks
Varada

>
> > +#define VATESTENB_MASK				GENMASK(1, 0)
> >
> >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
> >  #define VBUSVLDEXTSEL0				BIT(4)
>
> --
> With best wishes
> Dmitry
