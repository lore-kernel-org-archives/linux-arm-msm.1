Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EB32D7DEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818007; cv=none; b=l+qoyksueOOLumbSeoEDhINKpuFMsS3qm1IbSCMnGQ7IfwnUVbCYKEDfm5zJzBjoDAc2bDTUKdhL8cqHOld7sf1CBPmGbX22FHWhUaL9kq7vWIZi35gfWNrleN8tGcWDC42NISfoiZzMtOcotpYA2Qf3zoJlTjzqKcoGU5i0d2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818007; c=relaxed/simple;
	bh=VU4TKSqEqdPzpKL/vrnFYvQyEafE7LqTSA924z9OF4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+I0roydPk28PmTlEiTNYrYbvcwPUkjCHxxsnvKk/nzrllKJyBLyzsFnHVCQdcDeq+RK6DG2VmoO1E92bejLUVok3Xh1v8X5kPl1kOjQWFEWE83/rm5M94bHS7hm5Gg5ulyeM3ufunr8n06eXfDNr8ZG5yF/+lq8plLmINU3fQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIgStT47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W67VFY7x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIgStT47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W67VFY7x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvdsn038283
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sI3FJbWondD2nkr78gzMhxoD
	OIU48NccLMlqvMaraaI=; b=lIgStT472fWGi5Z9LTE4SW4t3i/+Yk45sjzwrixx
	2PXRCZm6ZJoqMNponwzr51ORZJsyENv9weQdhIvnljKcwUDKm0zbUGNMwd+8dbi4
	deL/fo/VcGeTcl53j7JVZRmprUcwfXzoYxq/RaKNadgE2BKhmNh1eXuyWxm2Ne6B
	68LXyHVGjYEoLs6roNfAzR7/FSQBEu8vN6nYclVIDIqzDk7J/E3HQOF1fzkwpUBL
	TwSgHlMyqKhq9WwzX1ok+6iECE7iskN7I/QfDOgb/SBcymSr6BRjHlKxW7Mb6wUc
	7aMVe8X7anTm3y+JuwXz/Fz14SxhuMT2d9otknQHOy+Ncg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc3tqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:46:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9d953b71so1378391cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784818000; x=1785422800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sI3FJbWondD2nkr78gzMhxoDOIU48NccLMlqvMaraaI=;
        b=W67VFY7x7oI7OmQoKwbpfxWW12Han/lW53nGywoSwYITK7QrCLFYdSVviwdiwm5vO5
         /WtAviKp7SuLqqsPeP9w+RvmA5sCAzActegH0006cOmNR7j2Ff3LYfDQeHiAPYpb2rft
         e0HySUajnZ4uekCq5hVsCjYY4afY6hgH7YDajJuVJJJGN7/j6+3aTYPkgmgut/iPZ5tG
         xLh763JmTr8Ned2DOxz0wQjsO9BWRVSEWIc9rRtOkdC6tadDCyHA5/8gQ8v0JnodVdq1
         JdGe1gGivqMoBS68MvhmNSPnS15bUXYHUBPQiSfwergKRMKdUZqb1W/Qk55mklbXLWI+
         QcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784818000; x=1785422800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sI3FJbWondD2nkr78gzMhxoDOIU48NccLMlqvMaraaI=;
        b=lFEIfeFKK9fyoTdr895I5jYCu/kav/uOrDCA/0t00VQbOceWgtk/fBjiFHLvcbC+qP
         z16ohIj9JIG3lZqOmIBRVNZqxmv3C0ISd0n7n0rddRzhH1tuUIdBe5CaTUlR/XnheuVP
         BPd5XT9HsLpTy7LcqdYiJnub0QGydxah3FQxx1NyYs3c4xrCQzb0ojQJK30uWcGwXN/s
         5omfknNWEXzHK7JQDamajmJsgCXZS6/s2dh4X4jpKbhqSEZO29Nt+9YWUk92HxiVkwBe
         trK8aZVLC9b4Fy/Ix5/PtncLiLc64dMSOmQGUxyPLKgCTnlDLz2yDEX3Eeos+CTLBENK
         4JFA==
X-Forwarded-Encrypted: i=1; AHgh+RoxnsPSkR1ikubFjtdFrR9AmSouwffiBFlRt9EL1rqsXTiNJEx7+fvnAotu3BcDaeE7wzmpAruzNkkHjLLI@vger.kernel.org
X-Gm-Message-State: AOJu0YxjGpY2cR+1Ldp85Jkl7cpgvL/TYYEvSwHh5Y08s9RgGIvA+LU8
	d7YOE0ENQgmY6mmjbVrKO6a7yxPhUkRz76N2TXtMKm6UdW9c43v8jkLI503VzF0LWEwEAjuh30u
	CLWW6tiyf8sgbazES+oNcEolHyoPGsNjHUw+glhLMsUOA/ykbiwQK+MuXmJvnP3pcGzCI
X-Gm-Gg: AR+sD12fWW4XsmQwE4j2Xq+xdj+CWABRzHmJkXQTYR+zPAUNFJlWXS8jS6Tlw1uQmaz
	vniuYzo5w/itBVypjnif7HS9+sxC1gd2ubZT+Fw3WfNa0DIZYP76LdfmFZrFUAve9ZCV7lveWbg
	dOTdhbPI+cDKAbNs8cNRkeEQcQfBMRV9NFs2gg+0CTlnfSL0tf83L36yvxDbABleh6BCfoWeG/Z
	6H7ubzqvWdT0AsSyvRXOhMnKC9NPhMnhTQcvxjWL0+NXDge3CUhIlgWyCb/4r3tWORyaMoXX7Zt
	eefMpKdxZOLzeTM7TT1M/ZIhJ+h9ruzWeC4wuYUIsmadg+jBjQCGYHt5aFRZjvcsHDLKPUSBmSE
	sRTvBhjMFrD5caea7bXDhZrPVswK09BhDW2Y+BVqJ7MJkO76m6auS35Hu6fiSyNDo1/9oN9rwP1
	eVomQh3UqA9iW6NTeHpLhz
X-Received: by 2002:a05:622a:840c:20b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-528474b0ec0mr5761761cf.6.1784817999513;
        Thu, 23 Jul 2026 07:46:39 -0700 (PDT)
X-Received: by 2002:a05:622a:840c:20b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-528474b0ec0mr5761561cf.6.1784817998972;
        Thu, 23 Jul 2026 07:46:38 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9badae1sm1072445e87.28.2026.07.23.07.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:46:37 -0700 (PDT)
Date: Thu, 23 Jul 2026 20:16:28 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Message-ID: <amIpRKHXYKxvGCej@hu-vishsain-blr.qualcomm.com>
References: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
 <20260719-lvds-support-v1-1-1f1aca3213ba@oss.qualcomm.com>
 <b2pbwtqd5mf5d3sbbadx3e5o3ohys4mmjv5dxc3grycuuqjvgg@rh5veftljlrt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2pbwtqd5mf5d3sbbadx3e5o3ohys4mmjv5dxc3grycuuqjvgg@rh5veftljlrt>
X-Proofpoint-ORIG-GUID: m0GitX28AhAmaTX1wC7O_CS_9nexFcO7
X-Proofpoint-GUID: m0GitX28AhAmaTX1wC7O_CS_9nexFcO7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0NiBTYWx0ZWRfX3a3DcymzhD7v
 XRhRyO8b09AikjLgtuqbBOMfm4ksJi9ZmWrdL5/zJYN4UfD12FCs2S9HbrXau/+jglAPnAyZu8v
 T4n/OaaDMaczrKQIug+tBFz0qYTJTd4=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a622954 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w-N4q8XgX6vL9HKy4AIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0NiBTYWx0ZWRfX/j9ygFp/Z9e/
 YsZVj2cmNHVB9BFbrsZgwUhR73vOflu9YPD88HQzkeZiuaKV2a1HbR+JFE27K9J1tFXkSr+ljSB
 zU9xs/L4D/tKjy5/UwcDAtq1F+jEBGoheK234SEpgHX5sQ+kYNS8isXQ4cSK676dia0NohC+x1R
 0z+eTSRGls7EUfmow+7MwToxsEm5nhIpSdD5+8Cz1xYIpcMl/HBcpVfAFkhNexMqjdFfUU15/HE
 kb3wvlpr05SXEuqYFa5YFqEvS00Qg+j7psteKiKke9jashktSpk8bP/UCpMQMjhYe5zt7NdZ1XZ
 EIQp9Qd7XQtXWrw2U2PdsBkYz1WRlqKf462Y8ZhGS13/PvSAnbAxm1eWDQiDVhzUV5URs9bnxAe
 zIQnOpTld61YQfue47YenLbBGwih2VqDaediQx2rfWna64NzMf8VYaqVpGsuqD4H9xd5qzKg77R
 hQY4C9GJxuDLteQ0hnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230146

On Wed, Jul 22, 2026 at 04:44:14PM +0300, Dmitry Baryshkov wrote:
> On Sun, Jul 19, 2026 at 11:35:06PM +0530, Vishnu Saini wrote:
> > The Lemans EVK IFP mezzanine supports LVDS display output using the
> > Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> > DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> > VESA-24 mapping.
> > 
> > Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> > up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
> > a panel-lvds node describing the 476x268mm 1080p panel timing, and
> > an LCD display bias regulator supplied through the GPIO expander.
> > DSI power is provided by vreg_s4a.
> > 
> > The overlay is built as a composite DTB combining the base
> > lemans-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |   4 +
> >  .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 127 +++++++++++++++++++++
> >  2 files changed, 131 insertions(+)
> > 
> > +	model = "Qualcomm Technologies, Inc. Lemans-evk Mezzanine Lvds";
> 
> EVK, LVDS.
Will correct this in next revision. 
> > +
> > +	panel_lvds: panel-lvds {
> > +		compatible = "boe,dv215fhm-r01", "panel-lvds";
> 
> Thinking about it, does your panel have EDID? Is it readable from the
> device via the I2C bus?

The panel doesn't have edid and not connected with I2C bus. 
> My major concern is that if the user changes the LVDS panel, they'd need
> a new DTBO.
> 
> Would it make sense to implement EDID-based handling (like it's done in
> panel-edp)?
Your concern is valid, edid read will not work for this panel.

> > +		data-mapping = "vesa-24";
> > +		width-mm = <476>;
> > +		height-mm = <268>;
> > +		power-supply = <&lcd_disp_bias>;
> > +		status = "okay";
> > +
> > +		panel-timing {
> > +			clock-frequency = <148500000>;
> > +			hactive = <1920>;
> > +			vactive = <1080>;
> > +			hfront-porch = <88>;
> > +			hback-porch = <148>;
> > +			hsync-len = <44>;
> > +			vfront-porch = <4>;
> > +			vback-porch = <36>;
> > +			vsync-len = <5>;
> > +			de-active = <1>;
> > +		};
> 
> [..]
> 
> > +
> > +&i2c1 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&qup_i2c1_default>;
> > +	status = "okay";
> 
> Empty lines before the status property (here and later).
will correct this in next revision 
> > +
> 
> -- 
> With best wishes
> Dmitry
