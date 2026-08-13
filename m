Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F96B35C6BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623875; cv=none; b=sU0yg7k4FpKrr1gPRcP+PkeWKlSdgghoZmPrc/d32tddhLni1YPoQlNItb2M3EKWtHc8xey4BLKGMNiZekHFmE7pjorE4L1s0R0EWCDDQ7gVwiheTy/PfMATwIqYKMSCtt/kcmc00uVdqpcHjWihd+2ldraAyd8T4UlECe8g9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623875; c=relaxed/simple;
	bh=r1lXpgScD7Uj6wGBac1+WChoSNoCqjdK3eocGD3WAGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/fm2L6Joa0BIUy9vU+TX8cvhuCD1ZFEpl1ZXiDUeA9M0JP9HK94pBwK6QBcsiAEu8NWw0MRoUt7176mX4mQ506+p3aYCbj2SxZoM1Ef7GpvlAQrNmDQLCnlULF842o1QP1Fpg8yUaSsbS668NGAyUCNctrmzn5cBJPJQgj+Bvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIKk9pXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3UakjGY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIKk9pXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3UakjGY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCJuiP3858519
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 12:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=70a5V58Oxb9EFDWPI7wl3gNe
	YE++PkOpB2yu4Gco1CM=; b=fIKk9pXCRSfzTQ4grazh2SeTE8+pxslz7L/Rb+Mn
	1Q6XTvd0VerTIPjs2oVnwoYq7zt29nbNIUIsr7eC062SXW4Sfiw9o+CzhaypdLBQ
	ggE7TX8egPFIYeRbZN8rxvcD691i5yez3ccZEwrQrO1FhNXntTFDVDJ18JCm8Yk9
	WDp7BtjhgUYq8FLfjxMP+uGV4ldX+U+qclgSFMdZbgN4wEOQYPvu8w9LZY8fwFcJ
	4KCV3SR+oLG/EVTcTvlffpizXHbTAMmDN5XH42MPKR8VSOJ6g8bMDzDllfXeK7IK
	4cRbVQ1Iv1o3YVamJPtOUnCMGz1KQR/e6Px4/rGLsplOiQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g152ma7jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 12:24:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so41034175ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786623872; x=1787228672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=70a5V58Oxb9EFDWPI7wl3gNeYE++PkOpB2yu4Gco1CM=;
        b=W3UakjGYKgismUUC++zAfxyV0YAnkShRJWA/wqQlcxVhRd25XeDFcYb6QgS08kUAfh
         jcMdTBTMmSJbeHmLtmWOVce7bZ10Bpl3WqQrxnB39KraYptSUStf5445WIra2dFj2s2F
         Srxtdfa3s0Nu9ilHs4M3dBW7tSGfOZ9yautSVZH1I7FFP0coICLFmjU8jS6Ciue0hY7F
         NWRAANYsMBj4jw6u6oM5oZXgFd+x4ZdLKnU25LmQbvLW8eF7U53avldcJUzpm3K4fPvN
         wLgXAD5f8sgMzPlZndzwMBKlG+DcxLuvouxKxFPF+gTO0+VeVCal+jirRFDkFmC9VgbB
         sOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786623872; x=1787228672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70a5V58Oxb9EFDWPI7wl3gNeYE++PkOpB2yu4Gco1CM=;
        b=pvTsHvidv+XBl1/KM52KOCDCi33o0cWEKa5BNtU4LJWm/pqlHI0ZHR87BuP8/Y4kVo
         N5vkUzV70kOAQ/2CX1QdehviHX2pnN/y+uVAxU20UGG33HOQZgqmgGiUsjJoxdcdNhl+
         73Bphx0yWy5WEMAZYbkWXqsDsxUM3IeVmHm8E0hj6dmZBS5GkCzItte1oh5+r9cjEp/A
         /2+VRyyilSLvumFhgfPeAU5tXWnYZp16LhSdl0fX8S8o1YRtu9cNH1Wv+MnhZd/GHumi
         HObEccYvwRimzKHoBsPVdl3rWGYRkcXx+hoOK3+H6uyhEJ+h5SFi197CIqz1RJLdaSel
         /WIg==
X-Forwarded-Encrypted: i=1; AHgh+RpHdgf1T4G1Cp5VwjQjuv779wQkG7iMdfuCI2YXyBxgDgvf12mRCoYxzFpLDUEovXvgnnbZbYiJJ8DAAAlJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRSCE/cXLbs+/8VhxDn9ctoiY1zaSyON5K4R/G8Nhio6eMgfe
	cuerRZhl/K1RlF+sV2q22UlNwtUWMSG3chTyXKRjQVscOUyMTZ2UTU6pJW5h0+oK3rFABQ/2EtH
	w8Nb9WigLg3+2vY3QUVpn3X2/WQBpDMdoNJ/2aqBqhF8fzPrLwNMI/J/ti2OFk7shkytr
X-Gm-Gg: AR+sD11R4ikgeh18xBM7Mh/sagBWetJfTQd0Z2OZLPTaFL048Ynfx4R3FkIbeKFQh5X
	Tx/AQ4ubNIuaIzlcosi0SfQr5FcckeFBd0oJ9o3Ape7/JHmde8gJSNMjs0zTAJn1CLVsOgGpc8Q
	+xujR7XWqHVDXZMvtN9LSFzv739hb7fIUByQT8LBir5kbbnAk8v/qnP4oOhJiXYFCSrImQiaR36
	uRpiz0chOUnVuDkeaXCHraxqVQ3Q7t+RBCwSRIy3iOEZFZEFqS2ftnJ5bEJ8SNOL0pO/EgF8FiU
	BxjSW55go9Y53eWWnPfLYlfyp/Lfk0WzemQo4kEd+waCi26yh7IRe8kUEoZvJ4AvSP4TAS5o8q2
	5uITYCeNJ6bcFWE2sS2Ue+JcQ94YgfHpL
X-Received: by 2002:a17:903:32c5:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2d37d57a589mr58464995ad.8.1786623872415;
        Thu, 13 Aug 2026 05:24:32 -0700 (PDT)
X-Received: by 2002:a17:903:32c5:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2d37d57a589mr58464085ad.8.1786623871842;
        Thu, 13 Aug 2026 05:24:31 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c49cc32sm8602385ad.63.2026.08.13.05.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 05:24:31 -0700 (PDT)
Date: Thu, 13 Aug 2026 17:54:25 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <an23eZWmtDVbfWEG@hu-anantiwa-hyd.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
 <eblai4d6apohd43uvo4kbm3y6yfkso7rd643ijra2awyguve5l@j7aq2vzzwmj2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eblai4d6apohd43uvo4kbm3y6yfkso7rd643ijra2awyguve5l@j7aq2vzzwmj2>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA4NyBTYWx0ZWRfX3j/X9PuP6s0C
 fCTbFtHoYtHkS4PKwMH0gHJtzXqjRkDke85tmaiVYXZKtLzBTWurx4BbwDlXCLFagi2jeKEUUCf
 UPp1KPnQngvo3Yq5/9Jqc5cmuLHf4aY=
X-Proofpoint-GUID: lq7tEe0Kq_tnkyK1k8p87XNGOb5Iz80Q
X-Authority-Analysis: v=2.4 cv=D8R37PRj c=1 sm=1 tr=0 ts=6a7db781 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=6pqXqY8CpGGeIA0puCUA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA4NyBTYWx0ZWRfX0d5FEzifTq/i
 Rc/72v9O0z5bdsXOpQf5WkN9z5qSXdbR5u/YophIhX1oxe1t1ojDQHlRMCAuzJ+IabivxPSG3LF
 DJ9OIlIISweWeMRUGwqqvK27Bo3OM027jiarts+on8vLt+IVpucqWKHZk3JDjFetTnr7k3b5xNb
 0S3ByqAmcoAiXr1inK5BR6b8Eg3MmF9fTxV4faTo6jYaRxDGWoVT3dzUtAvLxH9Qs0eeyDPusyT
 OZnkvQOtlrali756XqsWCzqXl0I62SF1slp2lTPJ1wJvslX2X7ZQZsTiOhJ1Ys/DkVm+E+RoCj+
 jRTopk6Tcvdwdt90FrPJTIYCwgPZcT6mYAKxFreA7o2Eq11ab+sTS+qm5mb8hEcy9EqiY3Spa6H
 NWfbXKhxqA2jMYkhXheFQp3fvntN+FKWfbBdK7GomvAB4pP3VKzOkIiAilNIjp1timJegjUVP9C
 4ZXJE6+yxW4Ef9/B5KA==
X-Proofpoint-ORIG-GUID: lq7tEe0Kq_tnkyK1k8p87XNGOb5Iz80Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130087

On Mon, Aug 10, 2026 at 12:04:21PM +0300, Dmitry Baryshkov wrote:
> On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> > On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > > variants and provide a composite DTB for headed variants.
> > > 
> > > To quote:
> > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > 
> > > """
> > > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > > lines of a new feature, there must be an underlying problem that
> > > motivated you to do this work. Convince the reviewer that there is a
> > > problem worth fixing and that it makes sense for them to read past the
> > > first paragraph.
> > > """
> > > 
> > > In fact, I'm not even able to guess what the problem you're fixing here.
> > > 
> > > Regards,
> > > Bjorn
> > >
> > 
> > The problem is that the base device trees currently describe the eDP
> > display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> > are also available in headless variants without an eDP panel.
> > 
> > With current base DTBs, headless variants are not stable where eDP panel is not
> > physically connected with board and userspace is trying to use it.
> 
> Please define "are not stable"

I did not see any crash in this case but in the absence of physical panel 
logs are flooded with errors, userspace is trying to commit the frames 
since connector status is always connected:

"
[   23.499621] panel-simple-dp-aux aux-aea0000.displayport-controller: Prepare 
timeout after 5 tries
[   23.508763] panel-simple-dp-aux aux-aea0000.displayport-controller: 
Couldn't power on panel to ID it; using conservative timings: -110
[   52.143157] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for 
commit done returned -110
[   52.175662] [drm:dpu_encoder_frame_done_timeout:2733] [dpu error]enc40 
frame done timeout
[   55.351084] [drm:dpu_encoder_helper_report_irq_timeout [msm]] *ERROR* 
irq timeout id=40, intf_mode=INTF_MODE_VIDEO intf=5 wb=-1, pp=0, intr=0
"
 
Another issue On Ubuntu with Gnome Desktop is:
Display's connected with other DP ports are only showing backlight since 
login UI picked eDP panel connector which is not physically connected.

> 
> > This series fixes the inaccurate hardware description by keeping the
> > base DTBs limited to hardware common to both variants and moving the
> > eDP-specific nodes into separate overlays. The base DTB can therefore
> > be used for headless variants, while the overlay is selected for
> > headed variants.
> 
> -- 
> With best wishes
> Dmitry
