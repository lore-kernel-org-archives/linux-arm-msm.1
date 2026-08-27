Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C101F4611
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 04:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804958; cv=none; b=DGbyupurWtrz1uA99GqG6eezb2cPWW9RcufS5xDON8K2EdbU9UPclHyFy0r3pwNltE9Zfn8tZPEJruR/Hm3iKIuhV+uPKHRJD/jOxUHfbxFmrGOAPJbzkuo/C/jkZYNckplRmHEHqcqyIZEEp1y0JOkfS4iLSaKwDM0ab9X4/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804958; c=relaxed/simple;
	bh=WndD0WDFKtkC/iz6HWlwVmqlArMDCQAk82ZnUf/JwR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKTVR/4UYQaJfT2/Ujo2BPEVPYUKtlDl+l1rOt997QxcuwNQBtKL3MikEohBpPeY03ZuLTZAJgZpqOkAPMKix7DfuSY1pxwCplrAaZHUaFjKFnLpPF/pH/+7WPN2XZ+nF6Iai+gM5AqRAsjYe/PZ8mEV9I/Cs+szXDaWcRbWxwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgXC16Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dpo7GHQk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgXC16Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dpo7GHQk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3Iuij1740551
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 04:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PBQfXRXdbtZK5RC0SQJwvsCn
	/rM36L4ZzGVrHyQOUFc=; b=XgXC16FktSQa/UqUPSEbVSrpYisyPDeMD2X7EEVe
	JINfReQlMl49naK9CZbIU0IoazGhg62KSI7f8Dr2m56BVInzEj6LPazArqZ4B/VC
	RV5LrHpjaNVIEejYsODazVBneNsgN51SlCS6jkXWzXQWea8ZgvrJI2RK5aij3Ab/
	2ChYg0HO2o6wes2iuK4so2VLdCA0vfdfVccpzGPWJnTdKAeQCmtICwMKSmwaY7+P
	uFfOYOcYsfpt+WXu+aCnsGHLJOOXuvYuYOj0YSq6Ty4y00oojljtNqr/3KCvdI5R
	QYRBAF9FrCvmuOiEcnH218uDDR07vYHPTn74ivrlKntF1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t0je1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 04:29:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so26532395ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 21:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787804956; x=1788409756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBQfXRXdbtZK5RC0SQJwvsCn/rM36L4ZzGVrHyQOUFc=;
        b=Dpo7GHQkhohaZqT1AMIHFa5pDcytSrasgZL81uvlw5SbWiESfnJLm5om1fdPP75MGn
         8xETlQTJY874uFfqJExs48j26sSfGwAe/fzWnO0k5XFwNF6PUtl5ztdsqKEhEoZYkC9O
         H8Tt9jfAVuDItqJlqA/blcgngIgNarseWJHh5SsC1zjSKpLnYJ+IqVEsrNOyZdDLB4FX
         /aDMkL6DSFeGU/yfOHItzRT0uaCiu/A5CF/H8v+IDoJwQZUn6KqSWlOor/ReIjZQWuYw
         YoOXOcp41Hsm/2XDN3v4y52I58R4Xq92QpnElj/rs5yBFxPRdeL10kfDeytmBeuR3y++
         ORDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804956; x=1788409756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBQfXRXdbtZK5RC0SQJwvsCn/rM36L4ZzGVrHyQOUFc=;
        b=S2Cp8FnZfP1+dpbfbz2vwKE7lDpuN798uSGFzAn4fJW8u3hv+Ma42YBybU4zb7MSpm
         gNoaN0V5kc6Wvbr/6xtem8iJmeRu2Sa5dy5swfws9zDZYFmqSQwqTd2qVw4ekSnf+QUJ
         FjSgkAQxTrFfp1iguf/nSBinZ79FCBgFW38IK/QMeWLS0tK2/7c2DMPGNGiKY58IyMGo
         fDr1JEwGhjXJjGy0iO10ujSXST5ukKml4JWG42YPvS6OiMb+hNZqwyIpaTArcNIxQiaH
         nbPZTeNvLscqiOYMpK0IaDEy7wf8i8S8ma+W+iJLllYxE9/6QxLCrGr94z+2HS+/kvDm
         yAkA==
X-Forwarded-Encrypted: i=1; AHgh+RplQM87hvBlWcc3hdVZ+3O5E5gu4dycFyvAAhAZ6KFeTa4lbIw3nUV9Hi6SdeIE+PbgdqlWVHtM5jsuUHuf@vger.kernel.org
X-Gm-Message-State: AFuF++n1WKDLquUtmSsfa97isM8bh2llCRgkqfLXt974muOer2PpuZ8T
	eKUvfB/FDH0VL9RUQEUtX6+2vsKX8mSu91N0xGUayeVHw9b2frMLowIwWn73mxlJXf+AaintQNL
	UkLJTJEtR/xrW7QHpjlO3Skbv97iTsV9O2IQMzhFOwua5OYEQjSgvwsZ6gaSg3lZjf+Sv
X-Gm-Gg: AR+sD13KFro0cgdWSuOHlD/T5CV/a00RW3tiSlWuqe/tJSKYwvVF4o8ihK7JiENYdmJ
	mV+ijRx/Y2xcr0xy2tbXJH2k6u462aqmUezTN1nOPOGhwAfufLTIoio86cMhwQb1Yy8GLj8Qkrc
	0AC8ML+fFCD8wrBgFwstpFGpVlWaG8rnslgVkii1kQ8/AIQ8hggfiO9tyraLTPP5QRnervsP9pl
	VT9OcqYIB8fiwU730DudUcqOBgHY5a2QRzSUr82FyzEa4KeW0NGjXs9EZuIjn8pF+pMwUaTg4ul
	usIMOVfHGN//rXiwVIgzI3roTCkAk503mARFdYHry0HA9U4vTT7VF4n6FmzaotVFZ0aNwXcOW+o
	JRfhE6cH0l9CTFf3OSVisKkp7PjcU5fmD8PXyjD4KwlwxHx55bE63nw6nY4jwVDlDUyOb+QJ5G3
	4W3OqUe89nIJLyp9T0pYhcuaJVdXEf8Q==
X-Received: by 2002:a17:902:ef0a:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d707ba9460mr232937825ad.9.1787804955899;
        Wed, 26 Aug 2026 21:29:15 -0700 (PDT)
X-Received: by 2002:a17:902:ef0a:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d707ba9460mr232936955ad.9.1787804955469;
        Wed, 26 Aug 2026 21:29:15 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d885fb6sm13901932eec.14.2026.08.26.21.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:29:14 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:59:08 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] phy: qcom: snps-femto-v2: Move PHY init registers to
 config tables
Message-ID: <ao+9FOzw6d+hjDyB@hu-varada-blr.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
 <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
 <d3d075ac-598a-4b79-8d59-556657edb23b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d075ac-598a-4b79-8d59-556657edb23b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a8fbd1c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Bgcfhj6G1kAcdHnFx8gA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: EAoNo47m7avjwGpR9huLzwXBoyEV48rA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAzNCBTYWx0ZWRfX5t7rnVyrhy+j
 9MFkbJ5RV+0639rVGVd4xLQTkh0tM0aVD+rnYeWkOG8Ex2YW+48rfdlyqaUNtpwQoZvsM8RMzC7
 OEVJ8bwjePBJVZqSp9tQbekupG2UiJ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAzNCBTYWx0ZWRfXy1JqUu5YUFmy
 S7e/j+uy0M7hD/NIV6FFlQ+gsOdBZmLIAcQCEh6rIlEH94Pt3C4UHEjjXWKyppNrCvrWYgXNKzo
 B6/igeslL8haF6hPrKZSBS0zk3kUYTeS9Updobb2OU+TES1XRgox68cpS6a4kJABrJayAS8RbMt
 6Yfl324rOr4oobkeekO6mkJiGI90j1rReCNpn2qAWnq88gbmlXvhH6yeI1leO7FXEpdQOMYL+/3
 xwbM5/iGldDH/qc3uN/MqIjhFS7MxXwjdBXwrOkIKbf/rQheSdqP9Ys0KghlC1PZk9jcTRCxWO6
 KC8RRgmesbBDbN1p58MQjBaFiwhwYWgPz47K0eZGWofGqseZwzBsI8lfWV+xox2BDaqX6QkQ7rg
 1pcDJfXmaCUPLcHqzr8iAPrRTLRUeTAoujR34leEUy+8tN7CMQvZhUGq5es5Vbf4OR614BIopuw
 ikbNvNx7EY9lsdFHeHQ==
X-Proofpoint-GUID: EAoNo47m7avjwGpR9huLzwXBoyEV48rA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270034

On Tue, Aug 25, 2026 at 10:54:58AM +0200, Konrad Dybcio wrote:
> On 8/24/26 8:37 AM, Varadarajan Narayanan wrote:
> > The driver currently programs the common PHY register sequence directly in
> > qcom_snps_hsphy_init(), with the fixed register writes split around the
> > override parameter handling. This makes it hard to support SoCs that need a
> > different sequence or different values.
> >
> > Move the fixed pre- and post-override register programming into per-
> > compatible configuration tables, and keep the 7 nm override parameters in
> > the same match-data structure. This allows the driver to share the common
> > sequence while adding SoC-specific sequences for future platforms such as
> > IPQ9650.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +	for (tmp = data->pre; tmp->offset != UINT_MAX; tmp++)
>
> "pre"/"post" alone are not descriptive - perhaps pre_tuning/post_tuning?

Will change.

> Or do we maybe know whether the order matters at all?

I believe so. This seems to follow the order given in the hardware
programming guide.

> > +		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);
>
> Custom termination is both error-prone and memory-inefficient, add
> another int to size the arrays

Ok.

Thanks
Varada
