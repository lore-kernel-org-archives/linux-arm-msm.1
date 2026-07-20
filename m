Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2435B47B403
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784586249; cv=none; b=ff76k0nRPwmVNMKpNN3JlhloCU7sJ1wOpriWx1imMO9yPefwjbPiyCeS7Lt+GE9zzPSnOaPxpPoBkxN7n6CrW5Qa1n5jhQaMPiTDoycTdCp8HW8Y72wsbfn/gHlXvWzdmv/NlUB0RxDNf3ep9dxXiYpdskj4FM/TDHmX8hw0VTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784586249; c=relaxed/simple;
	bh=a7NK/sN4hiRNkWniyf9M3iBUy5rI2JyLZar/PfVKIAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QX8cHVq2rYGTxFRz7UaPLIMqN3eILQMqPUStac/+4+ZC8JUw6qujOP5+Sta7zgFXl/5fqxlFybch7wMJTq+Rg+HkXxZlAPI3F93pdrgaam8O2MkQUi7uhstCZ5xn8OlCbGfGut7XP6yO44Esrag72Wvp0146REItqwetFd+1Yx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnLBpCDb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VE+uQt/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnLBpCDb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VE+uQt/2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTYrp3753234
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 22:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UxVovOePdJ7xF2E/PqcWDoW4
	EyLSREIDjr7ZgGqdxM4=; b=FnLBpCDb6YBrO7/4ypvTKe2M0yVgOw1y1Yk8YE6I
	kOPHsUvMV4viYDA/E7qUtO9r3Uvj5qLKmIXAvCUi/0Q1Vr6LwLhym0Z7Eh6GqJm3
	hcDCjTvpFdDwnfAH2I2k9OnfO8ZTK9fax8jK7ifnlhE2V6D8l3XLAKIWpMOFwQIO
	dJH5Clr1udFDMtAeZ+Qt/iNtQQcAKaoBsG7Ju2ocZIuc0V/ViqsynXGUEJeF3ALj
	UR6aB+6rEY00i8pQEbuZPlnZafoZ3EI6oVkFAE6p3hFq36D5/ahRRFqv5t3LQsDj
	8VeHlJpiW86OQyoHaRWk5PUXzNWVmFqbjTNNcu0fMq91HQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5s4vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 22:24:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07f25de2so100316291cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784586246; x=1785191046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UxVovOePdJ7xF2E/PqcWDoW4EyLSREIDjr7ZgGqdxM4=;
        b=VE+uQt/2uZ2uF+ZfaDYIpDsqxl5CL2wdp6HQbcd3jUEjeLP/sISPFkYqcrHd8v4CSF
         Huf5Wh2EFK6w2+7gNnNVvRJA3RbebD2IZQhYEq+rv6WQIJI2SSbU6poHK2e0k6UnYYZi
         HgZL1LGTmjfadsQ4twWjSGIQyHPhJLii0pj/6TBkF3Ec1mxtkXRXAyOUQd9Dw8PS43tW
         OfFrFXgsdzvpwTh1ButEIkxGdXYkbr7SisHz6R6T63q//qsDoRIkklEF7EvOgI0zMeaA
         dqz1wv4aF1tAoe0mxOExWvXnKQG25yJ8twBBxfKwzkiKJjXbDXeaKS24Y1Mi/Mhx85j/
         YaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784586246; x=1785191046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxVovOePdJ7xF2E/PqcWDoW4EyLSREIDjr7ZgGqdxM4=;
        b=F/2fpWJiMcRb3d5SdHFu17jP1R2rLklcmTM+EzUjnAehipXx/SKuWgnoaJNpqpHQLN
         PR5osbwg+EQUIlbW6qF9j2fG1fMa2An9JNRbSsN15OuCLWMRME6eqZcukEGK7XxmRlfY
         9quB9t6KjAr9BanLb0++mxjWO5O+YlzkR2y8bdUkW1S4DxxsTVAP928p4FDQhMuz9Vw3
         TBnD7KLabtgcZ4mHJvEBxMWPGz6OKvAEniB6sJD2G3z6AllfoSki8yJqsgmqBviuEoyt
         ChkBr+tMsR2PCONmsOxamYzF8ykyHao6RitEiRl9iWRMN3WwzHGH2tN1eblAMhSUM/le
         HybQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOaE7gu9FZ7xKxSC0A8MBekpLaRqqzH0/wV/J2FUZhwWd5IqzR8wJm0OmNwvF6oRGAtuaObwM0tekgnfPG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb+cZXF0smk7W2V5xYh7zdzZUHhMzGE5oqZiJqLTaexcpFVPpb
	2gLB8Jsb5iXJNIhsBWnn4D/TmHVHzbY2tTCgywUgMYi9aViM1Ec0NpNnLoU1q0nUHgotdr3A/Us
	5uUTy/Bcoy3/ObCUtuLaCU9EGaMbez1c1ZjZSQzq1VtVfKlMlOSYSYqk1b32DVzAowkaY
X-Gm-Gg: AfdE7cn53AAl3G8ct13/7G5N85BsDonvBQ1oI/VeIZIcEz2kh/WHtX5FV37W+wyj6VQ
	1hcgeonZ7SQK2+Gec58UTp/RRQ437QoJMBNQFcC62WI86/YxUOzDFU1jVLBfgmFaF7HrFYwnlHr
	WzUg3IFGXgqWTVZkn7NJIxp2ubJq+keFsNjkdi2j8GyUCh68PLEokq3q5RokelmwCCMWKSAwlvx
	lRnwCv5/a93bbxzufNoT68+LBufESTqrSEpOgSKDGI9I9Aa9FeTbR/nYAMQNxPkEYUix/HvSguJ
	mcCNtEwV3qgT6hs04ESLJEAnD2Q0Y9a4O/vWFUef368tsmP+Ue77euw1ccAN32T5fIv41BFKGvh
	FiMDlMsxnxh5evVV+DlGTID3QJi6tAvnU5ztzCGloC7cwIjmLNrm6/BRMQ5E3xOrg8bEHNiQIlR
	ie4LHLJ9YZcf4zZw==
X-Received: by 2002:a05:622a:15d6:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-5213cad922emr144364061cf.45.1784586246167;
        Mon, 20 Jul 2026 15:24:06 -0700 (PDT)
X-Received: by 2002:a05:622a:15d6:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-5213cad922emr144363761cf.45.1784586245730;
        Mon, 20 Jul 2026 15:24:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d8a46fsm2601531e87.13.2026.07.20.15.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 15:24:04 -0700 (PDT)
Date: Tue, 21 Jul 2026 01:24:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko@lists.linux.dev
Cc: Ronak Raheja <ronak.raheja@oss.qualcomm.com>, robh@kernel.org,
        krzk+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org,
        vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
Message-ID: <jc5ckw2gouz3kbblp4mm4n6td3warmxk7j7tfsg5wvuglcc42r@3rneedbxzxmw>
References: <20260508213234.4643-5-ronak.raheja@oss.qualcomm.com>
 <20260508232620.2FD04C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508232620.2FD04C2BCB0@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDI0MyBTYWx0ZWRfXxQdu2yYgBJQG
 OHCX/XHEeB4VmFdP5aXywR7T/uCcEpdfa0F9UFAE1RtXEVXAXxyskdjehy2kDGnImL8jFT7Puua
 FmSQUelslQhTo6s+K5u2Xm36qNQlmlPhOHWHfPym/nHvXdDlkM1k44rkymr6AJeN5TP0fHtYP3s
 MFbemCT2L7stCXLrvkcFbgYGyz5H8ruPG0bQzbuhedJkDVn5MjzuUOUshdybUpMKh9hI0Mbv9uc
 90NPy6/7wU+Sn9/Z5kEI1BdHr4uPxGHAptKmaXi2joxYZwFdM67QRogrtyhDrkiiZUTdZ/7e1sp
 8WcEYTyuo2kejpzMszIGodvUueNBWtXtvreLGw6JpmqMIM1ujwuMlJrvqyAiK8eekSJhlLca2Zf
 BBfoZPzt7+DkQpIvxLzylZKn/ixBEgHhwKUXpaqxfta3BUpxTsmkbA1tEUy+R3NkfZCAHfG24em
 WN/KKh8S9GIV1sD0TxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDI0MyBTYWx0ZWRfX/tvbnxeYvejV
 gdyVDxuoK9RjGPbng8J94Umez8GulHVAL62o1rqT3rkwn910Ol44v4KRZxjNOIGkWApT7Dd+Tlm
 C49+ndhOiU2pYxA+XHVFPam5t9UEJxQ=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5ea007 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=cO4G4PFFuWa09AuA6MYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: OqshalL4lSGc_K_X8Qha9NGncx9v0yDE
X-Proofpoint-ORIG-GUID: OqshalL4lSGc_K_X8Qha9NGncx9v0yDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200243

On Fri, May 08, 2026 at 11:26:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing DP PHY function pointers in `hawi_usb3dpphy_cfg` lead to NULL pointer dereferences when the DP PHY is initialized.
> - [High] Valid register offset `0x00` causes the AON toggle hardware reset override to be silently skipped.

Please add DP programming. There should be no NULL dereferences.

> > @@ -3699,9 +3915,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
> >  			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> >  
> >  	/* override hardware control for reset of qmp phy */
> > -	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
> > -		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
> > -		qphy_clrbits(pcs_aon, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
> > +	if (aon_toggle && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
> > +		qphy_clrbits(aon_toggle, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
> > +		qphy_clrbits(aon_toggle, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
> >  	}
> 
> Is it possible for the hardware reset override to be silently skipped here?
> 
> The V10 register layout maps QPHY_AON_TOGGLE_ENABLE to
> QPHY_V10_COM_AON_USB3_AON_TOGGLE_ENABLE, which is defined as 0x00 in
> phy-qcom-qmp-com-aon-v10.h.
> 
> Because 0x00 is a valid register offset but evaluates to false in C, the
> check for cfg->regs[QPHY_AON_TOGGLE_ENABLE] will fail. This would skip the
> qphy_clrbits() calls entirely, bypassing the necessary hardware reset override
> sequence and leaving the PHY in a broken state. 
> 
> Could we use a different way to check if this register is supported by the
> layout without relying on the truthiness of the offset value?

This deserves a comment.

-- 
With best wishes
Dmitry
