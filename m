Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DF522E3F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637079; cv=none; b=kZ8gIDUAVfi6yba7KHtxWUXyhVMumskWfnSAAwhpx/P5LJFm2CbInhUW52TNaTHuGszEox6/ESmPBxsf4BQh3RXmRHIbgL8yFsC5JqjxNF9wqxtUBJMZV3bQzTb+8KUBRI71frebjtYaRPiJBdMcQVMgx+IVxjEV7/HHb4zV7h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637079; c=relaxed/simple;
	bh=x+cDWxvd6iFPuJlJCy4UFeRhkEaX3CqxjQ93xQaMjAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwfWA7pv3CqX4ueQH6hy+ltQa9ebfmM0oQP4Klmr/C9hmv91GaYlSJHd3yj/MkOv1ikPrgvwKmsKXHpLuuCB0P/oi0mp+BKSDVdRgjyU2ts/zD+mS8k3yhBPCTarpILV7vo1W/T/jAs4V6VtNRrk3K2nRgZVMwQVT68bBM4YCNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqNnl+Wj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDZzAhYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqNnl+Wj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDZzAhYZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARN0g945886
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z62EXaW1RVDbHshV45H1fxSi
	JwUM0Gou28eQQdxoWRs=; b=bqNnl+WjCSPD1v8OQLu9vvKVz0TC3IvBsmyTR7X0
	kJSfw7pjtlmqZIHR0u8d31X4FoEZ9DOu/ih5E1LAQBDzmCmyVvMOR5XJctyV+Wut
	FSJYAr6r7te4jk/cWy1dsmaIHrWesotNjjhE+2ICoxmuxm77arLqlqh210K4UIwj
	lgAiFZASCUBvQrmfzu7r/DH0yugxBWgYPHDm+ymqZxlNACDPkaaMJgbDx0H0PXwb
	+a62dppZUofX0RHUl09DzpD+5b6qqkLsYBjW7eVEJs8X28L0AxW8OfzC0UP+kGgn
	x9ZTDGWq31iM64wIC8nR3VK9Vr9R3dSmQeIMmAwaOUv85w==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es2akm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:31:17 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81eddfe28b4so123029507b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637077; x=1785241877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z62EXaW1RVDbHshV45H1fxSiJwUM0Gou28eQQdxoWRs=;
        b=dDZzAhYZ7f9qlNo88gORGq0Z7ifDlIDa/4lE6Ne2ldVeZRXwrdPm10HcsEXjYQc902
         bIXqQ43oIvkeIK722qfVX2J9u/BI5OILVqwiSZJLm91OeQvU2pnH2asq8d7uQJHm0mMR
         /kFesy31gEda2eH76thKA4kfl9cIJQ7SO0jjUdy+tSY1477Ls4Uw0RvYx/X/3mXV4XGD
         ClqZRLCQqMlmF88pu/8cwW0KAhwDCshHKiVXFUxQKQfmcargzSlmKD/vt0ADzlG3po+w
         cTvlADHX2kZAybniDQ4ImZHg6nOfieO+7J85NpeSktVsW8zRupZlyGQU0btwyH5YefgW
         ZegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637077; x=1785241877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z62EXaW1RVDbHshV45H1fxSiJwUM0Gou28eQQdxoWRs=;
        b=IdYsBgfYsAmvMhnFUdPAZLcTx3py1isTtp/EgClv0Lnq3PEOgJe0LkJ7Kyx1sztkyQ
         8fe01bj8wXqIRrfVPQFgenJlaeb5yq95BCkwD2Hx+8QOTvDOEfZaWrLI5Szgv70/bxJ0
         M98ZMb8Hgt+cdhPeiqUUodgefLiWDHaK55aCLxuBZEMgcJLSGVj4F96eSo3/C0KX309S
         N5N0oFXM2bgCNiPNFF9DWkyfGH+BBDS4IITb/8ssPQNe3Dlz5VL18ehih2PpAvTJh3Db
         cKkgPVKk9Yxl4cSI6h4l1Gc0V4IKFRKm5QwWBM/C9w4stYgnhvcaS34RU8gTsiVwZCCO
         wONQ==
X-Forwarded-Encrypted: i=1; AHgh+Rofkg1YAMqdrnkYt8bMbzhs9et3f45Gwn1CaFcZyVQmjYxuq61eSnuxElDIn3uAd49PeTRRBhiJqnUrq6hm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu8HcLXOBkmskeMUmjBdFAuFgseDmzwG5OhwD8s8WDDrV7p+/v
	HuaCb5aGQ3aZduo9X9s5+fP6cw0VrdYXU8szL2Ihv5XzoHpVhXgP3alkLJYQinDQeq02VmpZvDC
	m0jQxSAThz/USMGDJA0lfhxLKIwq6GbAk9k5PmIWz1BPhi31QyxoFvcqraiuTTBPlGoK4
X-Gm-Gg: AR+sD12k1Uclbdbfi/MmH4VgvsJ0RsH+DkB8XeGD9bW4frpTF0zckEam/TWKFCSlcPq
	xLMQ9w7AfgXOyK7/BSNEvNh7lT5fyqrNh7Dl5KCl+PWdqZwQ2i+mRiFQgADQ6Qa8Ze+6/R9WEA7
	c5UGkdPfb843UzCfAZLQm9TvHK9oIRlcH272S8PO/OLWkU6zufLcvYB6nd8Erz9ufRpalMygmzy
	mMioiHidHnTMcSz0t3ugbHJNRO1Ob/U3bOpe0l7q/qOIVuvGX/hTORLKW+uQKUAmKVG976on3su
	UX12XsKotXrg7H0GV1dlazfI8+nUvSmRl7Im5GzL7kqVf8HUHN/9jkQJ6nu0JoMqi4JrRIFy6oI
	bvGTAIcs3iB0JDw/3srdRZKwaeOl4uu3b9lXH44y0rZAU4yaR+M6CJvfQs3ps4UkTIHB6g1a3hm
	XdQ4ogWyk52tDJeQ==
X-Received: by 2002:a05:690c:c1c:b0:81e:8d96:a64 with SMTP id 00721157ae682-81ef256f07dmr57462067b3.13.1784637076716;
        Tue, 21 Jul 2026 05:31:16 -0700 (PDT)
X-Received: by 2002:a05:690c:c1c:b0:81e:8d96:a64 with SMTP id 00721157ae682-81ef256f07dmr57461887b3.13.1784637076311;
        Tue, 21 Jul 2026 05:31:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ee8cd70d9sm4444231fa.24.2026.07.21.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:31:14 -0700 (PDT)
Date: Tue, 21 Jul 2026 15:31:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] regulator: qcom_smd-regulator: fix PM2250 supply
 parent mappings
Message-ID: <asayt7nocnvfcukrjkkycbsxkgaqxyoqzefejvhbiqgzdaw5iy@vb3t5juxml6i>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-1-60ca47031b50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-1-60ca47031b50@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f6695 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QRU4spEsvDc2jYG_z8oA:9 a=CjuIK1q_8ugA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: rl_Rg9BPSe_S5zNBfd2BibqaOn6oCm_C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzMiBTYWx0ZWRfX0WLXYXarcrRQ
 ZuOLbUUtp1W10+IKtqiXW0UUlCzmZJUDzmVYYdjRYAkjO5GCJqwPppi4vFXmyokYMK/we4o0HSx
 9lalbYaH5vlkBg65mDV21fQxtxbLH/sMPFyZiQHrjYXJEHGDM0YaEp6zzSB1XWn/UwCPvaf6x7X
 iDyzpTKXcrbbf2F3ukzi8DQGyJtxT3OJjxOB+DXcW3KAc3v+NBjiRTlgj8YyjiXaLPsn4En+5VI
 OSjFlsznfP+ZJReaTk+H2x1+HVXW0KWoM2KtZKnDbzzbgNivwCHQjnc1eAH4dYCrYa+S1opot/v
 Zhjgf0efYMoJyWfmBAdi4qQ1ZeBlO1H6xkfhTrbc42Y5pl4mes+COGgONkbaTNU0HiPJan9Gm84
 RO7oFA7I1JzBALaAFVcapjkTa4p8lDuvFuRMNnAU1U3jjNdcrAJJZ08xq5FblUti9CrYsgm7rY3
 p4TMyfiqKz6tHwS1qHw==
X-Proofpoint-ORIG-GUID: rl_Rg9BPSe_S5zNBfd2BibqaOn6oCm_C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzMiBTYWx0ZWRfX04pXDMiD+Zsl
 Ob2AMTHeBhuzDAYmqAvkQvKfc+JrRLTTQ44RRUbzlLB7hxM+2adRf9YN8AkSURIzXSEYAkAoQFv
 ZFCcfDunO0ppl7zSgvawUWhI810Lfm8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210132

On Mon, Jul 20, 2026 at 04:25:04PM +0530, Rakesh Kota wrote:
> The rpm_pm2250_regulators table hardcodes supply parent name strings
> in the regulator descriptor, causing the Linux regulator framework to
> look up and vote on parent supplies from APPS. This is both unnecessary
> and incorrect for RPM-managed regulators.
> 
> On RPM-based platforms, the parent-child supply relationships are
> managed entirely by the RPM firmware. The RPM ensures that parent
> rails are maintained at the correct voltage with appropriate headroom,
> based on all active child rail votes across all subsystems. No explicit
> parent supply vote from APPS is required.
> 
> Furthermore, the supply rail connections to PMIC pins are fixed in
> hardware. The previously hardcoded supply name strings were inaccurate
> and did not reflect the actual physical pin connections on PM2250-based
> platforms. The correct supply relationships are to be described in the
> Device Tree, not hardcoded in the driver.

Last phrase is incorrect. The driver can hardcode parent supplies (and
it has been doing it correctly for all other PMICs).

> 
> To avoid unnecessary APPS-side parent supply access while still
> allowing correct hardware topology to be described in DT, set the
> supply name field to NULL in the regulator descriptor.

Why is this touching only PM2250? Should we drop all parent votes?

> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom_smd-regulator.c | 52 +++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 

-- 
With best wishes
Dmitry
