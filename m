Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBCD48A8C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808163; cv=none; b=Ypu35Pmk3IUqmYAaHFmIVG/3YepfKVLh2VWap0hqZPtTdpM7pUgbEl8ez/4I5ogf98AhkdmYsz9OXDdFm4gaGxYmnSQAeSh8nwM81pBHuvC3qab0uhRtf77qceZ/GtN/nBIhxfh4/XukaQ2h8B9Trg85fEbzjsgZ7u2cjEPdQBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808163; c=relaxed/simple;
	bh=dJ4fkzQsGC4kTI6Dkb96kkhba2mYxjxtLEgKGipRuoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCnlnG5y+zjKyw8g9VI5VmmadAcPRm9Th7SCc3TENdBBCRvEzBsZVpkLho59weutXngiLtLyTEV/3MnJIpFO67ZBDJ69D7FfXPyDzUC47V6CFRA52u2vK4HffR2jg3LfRQxXYcpUnz9QyCtZmdhCNDhiop0A67o2fHuKo9CCGNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgD30gk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKRxor7c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgD30gk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKRxor7c"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxr8f3363642
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGh3quRT97rZURqNYAwwWrG4
	NLKQwQ2YdFVSfDU8n70=; b=pgD30gk4CvA10MNw+xGeIRxI1MoB3AfjrvELv+EF
	+evXdgoXWkie1VfS9L22Mm4Sicf5Uk1oibMDOseHqHq3pqOf5GKPVTuvwv7JawLn
	wU4xmvsJftYAmjZwkGHowsJWEnS/60U4sJ5p1PSDFXaZqjz+RaQ2ez8bbKUrA3x4
	FwylRmh2+0rHEHql0KC8/ptA+/Z56eZ+XMT1PZRhQrnAJvFzGcvsZ5+pf2d4E3Zp
	tLUcmKL+0PdZsijMbsFFbi72VMnaUgivEX8TV6UJIpvyCojnH8vutT82OBz+l3OO
	IqgWQFqxz/Hs9gFpFPHymqhNy0oa3CyC3UFpYhEp5Wo7Yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr8pvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:29:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso365376285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808161; x=1792412961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGh3quRT97rZURqNYAwwWrG4NLKQwQ2YdFVSfDU8n70=;
        b=jKRxor7c3RSu1Odce5sAR1PxZW9YVT1Sth6Q3ZwdaFzdlZIszUgyPb8fl6rh0xxcpN
         3hwiHm2XkznY2Wk7yjix3IOurvamfPCq0yzbVXu548o65fWlMp9lMGMjz+0iNJPDLAi0
         +zVJaNGeD9ki4u/D/X6jSkdwofXSHYc6/BB1ViXYL3NBtf0MPQ5H1DULWYGgahVQnJcN
         ++0b0DdH5kUbHypWqEEvGCT1hvaq8re4Svr9wddwAA0MEFqaCLYefX2YftXkm/bE02/9
         lXI+QHaAaxBpfUKLI1LxU9TQDYIVWOYWHXWltNesY5BxrrUFAKDu22b5inkxuRV1NG8H
         h9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808161; x=1792412961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGh3quRT97rZURqNYAwwWrG4NLKQwQ2YdFVSfDU8n70=;
        b=dscC4GRM5REIVnpUajDOt0PSN64hM93a/0s25eFolsrHV+gQheq83kzz5lSz0nRyRG
         Guq8WuWOyPWQ54jNB/iGgymuUSSPqKhWhCHt93FkReEfV36zEHT+Zkse8mhU+GsR5fKU
         ij9MLUB8wYTKBt1Bn7V3FV1C2CoUPnjTFmACyU1vCEdlH8MXZJVhZsjL1LTmZUHpUwXC
         ci5ukLVj+7yXjuNgbaSTt3h93YMRm0q6ojderAeW83riB7iYeehNBsrUt+EEQsVLzPJS
         lLgZoxIdDT1oDsMQONcxM6hVXGDkxlvlqaWC+PT0C8FuOFTG253EeE4ZfBLYA5eZgnhM
         Y7Ag==
X-Forwarded-Encrypted: i=1; AKwUvBw2BbafIpuRa3/2RbE9EPkNF0MBBy3WafJR2MoMlHTmwKkpF+QtRXKu6R/KkpivE9BOuG0l/fqH6uR9mIuk@vger.kernel.org
X-Gm-Message-State: AFq9FYKu7gUHI+mjwkxQfKyXPRZTcWA+eHYEBR+YC10AhOW3lMkqIZZ1
	AVnl8tlUGRKHeuLzZTmisNhwagYrtOrL651FIiGDx9wZ45YWxh06QFkcjmRGKFv/FKo5vIyAKdg
	/0m4bkJ4/sGWuFhaj+uXI+VV2d6hV2u+S5qRjFRmKOiBqQ10mJjVQPl7vez0F/dtm5vZA
X-Gm-Gg: AYBFou2oIwhG2Js//bFyRuE5zv4vzBzyTi1+atObwRbvMJzVJsLOwW49MXG56bbOVMm
	w1P/rCwpPZRf2LhGIEUvL1zpPODl+8DtQQu6VFUR/ut9tVxz/OVvYT/pz3WMUWxCALGBSvchmFP
	qvbrVpHikA+wEeYkEP0Xx+FBt30NLtfhTGZQST44VDPXdH8PBwzyVRO63TFAQ99wjGLDAsEYlgB
	LR6qca6td0CqQTFK3AOP6ODg8OxRxnBDdWIC270doMIMf0TagOp+d3VcoNIgeXpZWL75lb8I8d7
	SZJ7GhYSMXs8Hs09OQ36XcCW2FKfL6o1yGHNo2/II09Ul7tVB63WetvFeuzsazUynFJaa2/jp8I
	FDM0ljYG0dIz/ovtOmTkdRvGyzClmUgkQr+UGZyHCwUKc5BwVtX5b1rbMRqh54sPSKlzoxkI/oB
	CUzDsM0KbVLUFg
X-Received: by 2002:a05:620a:3728:b0:93e:c12c:f119 with SMTP id af79cd13be357-93ec12d0576mr1553343085a.69.1791808160809;
        Mon, 12 Oct 2026 05:29:20 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:c12c:f119 with SMTP id af79cd13be357-93ec12d0576mr1553328585a.69.1791808158899;
        Mon, 12 Oct 2026 05:29:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde912b3sm2765948e87.21.2026.10.12.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:29:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:29:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Message-ID: <tvnmnnneoiibvpvfkrhh4qoffj2vpomdh4jtmccrblylwbrur5@zvrgjapveg72>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
 <epga5fcyf2d3esucs5ulht4s7ixwpwlb35iygz63aqeefruc2m@mwmmkaw2z5r2>
 <d61fe4a4-7101-472f-9202-404de9899ec4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d61fe4a4-7101-472f-9202-404de9899ec4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXwoVW1ffRzyNu
 WEyEqReWbm6x/qtvNdj+D4fDRVqqBozR+NVz7LkWIwj8Wo2BEIJT5UgafPb3YhmFinpnUHcGjhe
 qQyIiTWsTIrZIy7YDmV+yU6XueeUCx/rZo+28Cob4jgmsVvy7YFULuHN5OTar8X5Dmxo8DBOkc0
 Y/rnAcv9zpx4IWgrGNGAlypG7no//L/q0xNL77sKHX/3AXSDw6qEFUGuGh7EhuMd1z1pQY2uudm
 EfMNyibsZveZ7Xad5mKieS/S2f0xKvI1hQSLR85tUEumSas4If4NmIBO8uI+q/pCec5b4W1dUC1
 s5ZPwkRJEczE9YQikrIHAJKUJuKl1yplWK+0qn3kUdw4et2CFQPpP/vjjDemzg7bWpWyTpNgIjg
 RVgbKkYHIoB8lNhAJgq/xGHHFUm2hiSRFi2RgnbG1VV2i9zpDJFTUl9KZXHla1y4RPEqNTVv1Ne
 IntlX1i82/IDpwSoMXQ==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accd2a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gfEjnI5v8RykEt6AfOQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXyBUqsJEGgPfO
 Kv18nyc6g1Stf/auuPMMGQQAfEqh3IUWiWZnJwPi6I/xFZW9oqRvw5UCYIZYaY2YZiFPYJMSQ7W
 yW9keoh6nixWFLhaB0d1NiCAWtAtNnI=
X-Proofpoint-ORIG-GUID: V_TWt68-vpLC1BBCh4FYN6CVSxgY12NW
X-Proofpoint-GUID: V_TWt68-vpLC1BBCh4FYN6CVSxgY12NW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

On Mon, Oct 12, 2026 at 04:41:21PM +0800, Yongxing Mou wrote:
> 
> 
> On 10/5/2026 9:06 AM, Dmitry Baryshkov wrote:
> > On Tue, Sep 15, 2026 at 05:27:50PM +0800, Yongxing Mou wrote:
> > > The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
> > > source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
> > > the display-controller (DPU) node, alongside the existing MMCX
> > > performance-state power domain.
> > > 
> > > The MDSS node's CORE_GDSC is unaffected, since it continues to power
> > > the rest of the MDSS hardware on its own.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > > index ace19b8b12d7..b3e3cd1d311c 100644
> > > --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > > @@ -3619,7 +3619,9 @@ mdss_mdp: display-controller@9801000 {
> > >   				operating-points-v2 = <&mdp_opp_table>;
> > > -				power-domains = <&rpmhpd RPMHPD_MMCX>;
> > > +				power-domains = <&rpmhpd RPMHPD_MMCX>,
> > 
> > Should it continue to be RPMHPD_MMCX or should it become
> > DISP_CC_MDSS_CORE_GDSC?
> > 
> It should remain RPMHPD_MMCX, as this power domain is used by the DPU OPP
> table for performance-state voting.
> 
> DISP_CC_MDSS_CORE_GDSC remains attached to the parent MDSS device because it
> supplies hardware shared across the MDSS subsystem. Since the DPU is a child
> of MDSS, it inherits access to this power domain through the parent-child
> runtime PM hierarchy.
> 
> Only INT2 is attached directly to the DPU, as it exclusively powers a subset
> of the DPU source pipes.

Then should we still attach both CORE and INT2 and ensure that
performance votes on core are translated to the votes on MMCX?

> 
> > > +						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
> > > +				power-domain-names = "mmcx", "int2";
> > >   				ports {
> > >   					#address-cells = <1>;
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry
