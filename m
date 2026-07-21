Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20235372075
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641262; cv=none; b=l0jA+xEoenGoO+hXpKQxBPjbjnr0++XnYoJa0flLDvOLe1as+zBmiQnRemdzqRt3/a2y6t7K3S8VdvUmuHlIc00BP+avdE8SX+2pEVtkBD7XIP0XZr1VC4O91hohdbCDps61qU79o+baMCC2x0eAZHTzyCL6SY0T5CMMvibnQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641262; c=relaxed/simple;
	bh=Lvcl3CRfeVXVAFghv3svpdGw2qc7DCUrpgugO4Rld+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXKQMuBXuVOLamPV8s2CR8NgSTERKikeWKfYEZ0P8lar4fEAGAL1dCJ2mmZ9pDMsPbfz/rg2PAvGegc96eg6hy+7SHGIonpL609guoOub2AaF1BfbTqSqh7bPd+TM9Tpbwju4gQqjVw9w2MTzl6VWJN194Yj6AOUCAzs21X5kDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIOpLeQU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJwddpES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIOpLeQU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJwddpES"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDM31H1660333
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k4E2eWDKLcnSPoYw7vDjCZz9
	5PSBT94/QtIXEfEoZP4=; b=XIOpLeQUBLN1jHSc3o8d4n2p8dbHRRcsZ2CL5Se1
	Yg0ZCP7vik8xr/PBR5e8+E61kbHwgRONOJNvwdiCsgW+RyWeSZJRv7WPOZIi+pJy
	aeHfNn50ey3dSDLSpg+SqmDrZs+rsSlrpJoyQBY5abLp53dj8FWTA93EmKfeCHlp
	d6TOitrkkM332gnzgL0ZhjQKvrFvEIwpFW5ojD0Ygh4ymXHgV0o5R1J6irtCuTaL
	fvTyoXEkXKCU2kR5mgahbPQIm/QaXDas81igVRaJqmXr/T6NmL78BOUIoFF0gx6H
	zgeY6TQ0TJWoSB/gjnHjl/Eltnv2f7m68734N/ElRqRWjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae85kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:40:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c110a3b6aso128761511cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784641257; x=1785246057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k4E2eWDKLcnSPoYw7vDjCZz95PSBT94/QtIXEfEoZP4=;
        b=kJwddpESCNVm/kRhuVY7chgvfDce3IESeE03KQrExu/cINNmfYLTRs3Xpwg1gC0+5j
         nqTS9tdUGyuGGJQbpQNsHsmwPdHrpWyxKSiNhLGu55IcV/kaPGBWM8YtVJ3+1yeMTqNr
         tfFWwsQ9WOFCR5dfvJRCxPaBVEmzySqzXnkzfOtXB4AELgpwHZCEqNVKPdbC8D0Fe+km
         V4b9Az0oVuKC3f2P9ryOBeym7UMefzbOsEl3vUQhlCpwoDD4fPl8+mvGU3mtJGxEulZM
         F3/F4cNmElSZJ/3ZBUeBMTY+htWiAkrXJPHGlXY4yS+YT27SJVS+t2CwwolOSuhpKCq/
         O8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784641257; x=1785246057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4E2eWDKLcnSPoYw7vDjCZz95PSBT94/QtIXEfEoZP4=;
        b=AWbWLP9VetH+bV4V6BCHrwR9RDpTHTw+V0+5qIyyqlZ36/FQ0FlXjzssWW8IfCrlXD
         jNCCWZPWNzw0Anv45pVIJI2bgmpTtBwMhPq7o+PFHbb73NN8zjyY6cRytnUukSBP+LHE
         Z9F91C3PrCK9JTLim6EeablelfXnBpi2CkgULAu+Td1JRfvHJ7eNir8KbIO8Ok+itEdF
         OFFFWGdajzlDSNPkYYpuZYSDUhYBuMyU/IpkW8bWlwVTD/l5tZEsb5ZJnI/Rxo36G36d
         2y8zbYtI+Ba1nCmWzTVpKErxiwFSiIk0Hh/vdicJNEcc11hAm/+xgjLP4R/ESuOdsLZx
         DxDw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+WBsLcdk4Mocir8yBOj6FBALtaoWmDUX3XDxhglidd0wyOVNRTCNrMah5lUajJGv00zjybJEmptkOMMTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxmyGnAB7W0L7HFMeZS4kCRlqfVm99rNmJacuKP09/OoCXSKRlv
	tjY8xbspoKusxKTuCu12dOTELvkshuW2G7AU0KaRJi2koj00Wub4W4+AfKjQdL/Od9uFG6her5q
	Hs1zv1/RWJtf5yNDLHAsE7MPclckGwyD13WCS+8Qwod8xfu10L4cAprhQvRNBgKSTH7fG
X-Gm-Gg: AfdE7cmJ/BFBCV2V9W8LS0EX0plOOpzoqfNWUB/xhFFQoYVD60YziraPnzSA8IDbXTe
	imqfLXIWx73K6NjHmiM5nA7rbf2ddJ0dpOkWpB1SRMaYiHKitmRV6WYdOija1sa1owLu6NXtbZH
	/QqWk6qBIMt0o5NsuJ8zaTUDRPmxtTng5r7VaVBkKBXJROo1VXq/d7eKBSlBZTg35lIzC+iTQAl
	+A/JQ+SgGF+xlgX8eFBJwvJCja6ToM3NjHYb8RHO1P/hWsZ96dmfLzIlJQa8ysai4XrifIWm89e
	NAKDNPM+9IKa7hcczyyp/zJ4qp1Bkzd2PvdUiSEhFUBRl3oGEwKAnUZik3vReTA8ocFYZCgTcu3
	Ip/sWBCbD+n+rCF4SXMBrqYZ/gV224tZ2RloZfKVtvSPx0U2sGd3yNvIF62bcPf1r6P98BuobLU
	CkBlhGnnw2osR2Bg==
X-Received: by 2002:a05:622a:118e:b0:519:75f9:e874 with SMTP id d75a77b69052e-5213d2b6d47mr167997991cf.10.1784641256466;
        Tue, 21 Jul 2026 06:40:56 -0700 (PDT)
X-Received: by 2002:a05:622a:118e:b0:519:75f9:e874 with SMTP id d75a77b69052e-5213d2b6d47mr167996461cf.10.1784641254232;
        Tue, 21 Jul 2026 06:40:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e1949csm2902431e87.65.2026.07.21.06.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:40:53 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:40:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <6rmntcmouwenb3t5xk5rh2rijd3sc3re5m4aeuqive3wifn6ux@hauua7ltycvj>
References: <20260721-topic-smem_dramc-v4-0-748f992278a3@oss.qualcomm.com>
 <20260721-topic-smem_dramc-v4-2-748f992278a3@oss.qualcomm.com>
 <20260721124005.E00041F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721124005.E00041F00A3A@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: wKuSTPX8Gr1FRQvDWjn_YxoizaJoMvnn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX4HoSRTRQ/5oz
 P9Bm4wUInL5ugPSQuNB5IlizuJE4O820FtwBRUPQmFH/SR6yHw7JvauYeLcM4G4e49vNzGfFBHL
 00X3r7lWlKRt1/fnOEkQJda4WgVB0tc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX5U3DaH2YFg2a
 +9UNHb72APHiRSLYy3IUa0rNWlIo4K6Lsz/z6I92mmEjv0olDid9tajeTfyWEeBjrL7Wly63zNB
 yqE2nq5wwJDKWWH7kKO/goX/pmprXhCxncfjsmDaHoiTallxmfacJJ/u3zPzZf1BAiOevtpJQzb
 Kef+PDUeZt0E93l4AvFwyge009oJRu4BY+Bcn3b5mGY7CEkF0z2pmpUQtWb4+Nb3CUGcQAltDHP
 960mFUxDSQGdcHa2SqskgtYDNPCRvTG6Q9ppJVeNh3ejOdJ2/thJp0+vOnh/c6Q8yn4bNj1G8UT
 czZKO+pt8STOra19ifO7bT7fXS9FV4o4FbwmkyHVMHYbkjHg8B8fj9L7je/lE1Pu4Wq7x6bTn+6
 9PC2IFnw9aq8HivjPAYBkVhGQhQ0rta1FQsqVnnJ5kmhpx7kkt4FUlWAF0Y3wB8c3pyw80FRR5F
 qzcNKYJvzZki8BPIvbA==
X-Proofpoint-GUID: wKuSTPX8Gr1FRQvDWjn_YxoizaJoMvnn
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f76e9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=x8C9OYS-9AN7LrXSNBgA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

On Tue, Jul 21, 2026 at 12:40:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] A race condition between SMEM probing and `qcom_ubwc_config_get_data()` can cause the driver to bypass probe deferral, incorrectly fall back to default UBWC data, and return mismatched configurations to concurrent callers.
> - [Low] Missing Kconfig dependency on QCOM_SMEM causes linker errors when QCOM_UBWC_CONFIG is selected but QCOM_SMEM is disabled or built as a module.
> --
> 
> > @@ -178,9 +195,30 @@ const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >  		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > -	return data;
> > +	hbb = qcom_smem_dram_get_hbb();
> 
> [Severity: High]
> Can a race condition occur between SMEM probing and this function, causing
> it to bypass probe deferral and use incorrect default data?
> 
> In drivers/soc/qcom/smem.c:qcom_smem_probe(), the global __smem pointer is
> published before the DRAM data is populated:
> 
> drivers/soc/qcom/smem.c:qcom_smem_probe() {
>     ...
>     __smem = smem;
>     ...
>     smem->debugfs_dir = smem_dram_parse(smem->dev);
>     ...
> }
> 
> If a driver calls qcom_ubwc_config_get_data() concurrently during this
> window, qcom_smem_is_available() would return true, but
> qcom_smem_dram_get_hbb() would return -ENODATA because __dram is not
> populated yet.

I think this must be addressed, the DRAM data should be parsed before
setting __semem pointer.


-- 
With best wishes
Dmitry
