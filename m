Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9146346A0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307555; cv=none; b=u5I9DqvQqaz9IJo8hThGU7IpcZn5bXcNWOkvS+xndZKFqZEskZFeqn0I4kMHsBKZ0PYkTUB9unjvWAHZd/mMtcGiyuCnpGAI31Qqqwt9YTs6Gb33low+ueYalB6888EUAhTfVGuuqI0U7JRVQPifMkAsN0Kuzn75o4ZjOqmeH2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307555; c=relaxed/simple;
	bh=Psk19BWzuo/J6OEHh6EyONhssQgJNWwFWffG/8ZnX5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9Qrqtg7Csrkt1joNCoPbjX1oncgPLjalhRiGz4mRYiN70RFfDAWIhe0oOqZo+5LdxmVg9T4jDN7VNStTo0x0g8faeNUBVm2uPElySrb1kRSmXSEGsx9ekxk9nr6f/uko4e808eyIyiU9Bq5QzLI0MJQVgiPX3fNVkhJ3/v2TMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9ChOkJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhsnIdAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9ChOkJq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhsnIdAh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T5ggYg2055391
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ommcEVs2pnbfLRWZvQhPKGr9
	uDr7PuFiFOabR9Qdl3c=; b=W9ChOkJq04trbYAqLCkRfxJl6yYT8kh72K9i7ofE
	3gVkAegRhbblH2ERqURSl1DLjdbe/Sm487Cg+qulpW3fAZ4HR8il397Mt/kDHH9B
	5/5qWB/tA2yz++1bDK7KtYfUERDdplWHaPzS5+2qJjlJWhhMaYwqUwMMVdxBDyaY
	Dpb9t5A/bWObwqjVhdQGxsbM8J53xjouRrWY9ruHWHJc60L7E1aTkHDWuVA6GRJD
	48WemqzDcCqMnWZnoQQcHW3TZYyrHKXkrbEA/krj2n96RKluEWbLzEjzcY5DQmwh
	jnVYr0Yox2pV68UdMnjT3QvzR5Sk5GS2lAcufStK9hAypA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbm1g7vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:45:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84859a64079so929497b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 23:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785307551; x=1785912351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ommcEVs2pnbfLRWZvQhPKGr9uDr7PuFiFOabR9Qdl3c=;
        b=MhsnIdAhlUlY1vZppKnVZW19v97JtDugMmClgsBdvRNwaBy40hItCMLtAzH7P2zI/x
         x6HTt+ZSgMJ4Bqh/FZ9XSlM9AxlNLIsR1MSZOUU6FL5rKOB2E3RtBsLEnzoJhYtnLO12
         pi7Nh/O+wSLXTERSyu/chnKfTIAjQX+7LA0lkh/0wa497b3vlGLyJY8c1R/xORbjKgJD
         YNPKDj4hy3Ld1O8LvTBu2M+72RWwN4zetodQmjL6ofTrLVhwNbsswsdzMLMBTcBBVzJ7
         it6CEAMvqENcmb7i7ca9r7Y0T9Kyl385Ah4217Mtb6HZEYPJi+qv52NkfPgCbnecT0G9
         Ibdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785307551; x=1785912351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ommcEVs2pnbfLRWZvQhPKGr9uDr7PuFiFOabR9Qdl3c=;
        b=BGfkn4cOTtvSeGPUXiQEd95uxLM9LmvpzMY5x2Wv01N0kq0wyacpnCnvQDZFOWpJL9
         Dh/yx9BuAWfDKeOFBVuwsdLpsLYvinrZ1dLaPwoyWgA6/M+oG0HxxhczqF65paY5K92X
         kj7ZOzZ5DU0XiOmwyMKuP6rG80PQbgblLsTnTltij2fppwtWsWqVV2R2F7OVmueZwA7G
         tjoYfDOz9Hmk12th36/YPCI3NWyNlbLgq3Hts1GIFUEfPtwI1mSoGYhie+KjGNTkZOMi
         e+2CgThTEx2HPmEB7lF3lFyGGeLoG/oEtSx/dZd8Thv4dXlSmBo4AzYfmgDKZxRePzbb
         xYvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSLkKHzJ3aHijLC/OSWw1cyrRjGBK5AfVv5MWEgOw6hC6t6B7PRkVvBsa7o0QbLECX1zcIxPIWFCbKCk09@vger.kernel.org
X-Gm-Message-State: AOJu0YwItpnzpAmW4ob7sySbtBuj3JNN60fwu2V3citChXUsqFh7rxyJ
	gNLPw9CHu9V6sQju8g0H28vCbxWllp4nAeyAETsNpN2xRMOPlbgYtHDX2AWbRE8Y3tV3O/1UZvu
	Qu/8NbJxzx/JZcoenIEnkyrwZEDwh+3dE0d15rlkbvUs8vA5IsMamSdgrriRnfNfml9rPT/S9J8
	Bl
X-Gm-Gg: AR+sD117uWvgW44q+JNHJ6AroAIhOJ6bowOj5gyKV1d2334ykQYKP2/K+pju/9L1GgV
	Sy3TBiE+6ZiNbt6L38+fKLqJkOAS7wfjUZ+Cw9Rv6+KffuMxPEAIisPLwvRSHQzWE2ZIf/eEvTe
	w9d1iNm8xlbiBFKh2ckOuqqt7bGv6WK28KrzZ4jzp5mouV4coTty2+Qv1WIRaGlyp7pjyy1r4LS
	oK7ASYWZibxXgwVysdA9oVE/+sH9VyJQM+DzjGR8tJmW7W/X6WLW76k2oSkNdZxa4ob2RhF6d+9
	IFAiTJtcyKk8Bn82UU7gsNc3cPims9PHUFJ/zBSbzyp19diRZnRmVN243ObF+wzc0x4DmKeFl1F
	Sf4lLg8sobKXYCNeCksOfrS2MILnpYiMpT5WIA7MBLXqR3Oo=
X-Received: by 2002:a05:6a00:845:b0:84a:6726:62fe with SMTP id d2e1a72fcca58-84e932daa02mr5771284b3a.65.1785307551285;
        Tue, 28 Jul 2026 23:45:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:845:b0:84a:6726:62fe with SMTP id d2e1a72fcca58-84e932daa02mr5771258b3a.65.1785307550743;
        Tue, 28 Jul 2026 23:45:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03ca665sm872831b3a.52.2026.07.28.23.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:45:50 -0700 (PDT)
Date: Tue, 28 Jul 2026 23:45:47 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies
 for pcie3_phy
Message-ID: <ammhm1mnHhn2okgJ@hu-qianyu-lv.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
 <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1MiBTYWx0ZWRfXw7BefLgAX3d4
 tQktKz9Hke8vkUw/QYtXrbhnnuhs20s49NPJPD6QC2nuR+5JXs82qXJALeKl7c7s4PlGRFtK5G1
 dDkQSqCkYIrbnAzSGOGPhk0gHX3IdGdR31snAjJc+6YaQOMIr3U0KaTog1dNQFxVS9GtMkB2zWa
 OkuAZSzR+H6VqwB7LsFEzd5R8Nfe1alv5BWudK0jSEw5SqUTDbMUxTatoaZgasLfcolACW7E0tu
 OZqB1pwBl2DSq3k/6a+nZn3ZNfCTSDuk326OKv8TLj66xNuNNdB9LP1iZpud4x6LDIO6ag2M/EO
 hSGznLzs8CFJLmTgdkMKLsFWxzQUGd50+HnAxylZ+28jPtxEs/bKOmtAjZXNVXso67cCsfGA2GA
 dAKQkhtlv33790pE3An4+TSUABodyphEiFycD4txVzWoAYi9HgnH6utQMDZDYx/hhNV0/fC9P/W
 /QiOtCtOhHVqMfa9ikg==
X-Proofpoint-GUID: 0k3hbMAYXzNvQ2GPLZUBPm18Hi1mhlts
X-Authority-Analysis: v=2.4 cv=R7Az39RX c=1 sm=1 tr=0 ts=6a69a19f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UTVeMogfEYuOrfk4Zd4A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 0k3hbMAYXzNvQ2GPLZUBPm18Hi1mhlts
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1MiBTYWx0ZWRfX351ufES55Z/+
 CbSK7NCILagaYNE0jKwy+k5WVIo+25zqogk3wNrhnx8HBn78fMu3jo29M0Cum+Kf0d8HvraT/FW
 HHzTwSuowmCRDckDZRCqpQBpYMg+6wE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290052

On Mon, Jul 27, 2026 at 04:47:15PM +0200, Konrad Dybcio wrote:
> On 7/24/26 12:01 PM, Qiang Yu wrote:
> > CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
> > board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
> > vdda-refgen0p9/1p2 supplies for &pcie3_phy.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index 6125617de82a..0aae613a33ad 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -28,3 +28,11 @@ &mdss_dp1 {
> >  &mdss_dp1_out {
> >  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> >  };
> > +
> > +&pcie3_phy {
> > +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> > +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> > +
> > +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
> > +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
> 
> I'm guessing you also meant to enable it here

No, we need to keep it as disabled because pcie3b is not enabled by
default on glymur crd.

See the fake pcie3b_phy be dropped, it is disabled
https://lore.kernel.org/all/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com/

- Qiang Yu
