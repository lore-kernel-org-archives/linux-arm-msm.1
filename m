Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48C8395ADE
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672281; cv=none; b=BzdbIH84gibazHYdlTOnmnGvjN6xY6QyZVZytJvsf6Kj1JeuwNMA0cQcL+tBCgIdZLkENZLWOUh5j3+4I1abv3t11cgq/E1K2lhBNqNEAYLJFsFTt/SnUwxbVOwjLn10keO1ClVlt/qIh63tYLXO87AchmxtfHJiGixCNkvSc1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672281; c=relaxed/simple;
	bh=tTSV3+j96eWcnntmCZqdwhCn470mgOb4Ngl5o+ipm4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bz+GXSbnh8c0e2mFuLEAt6JJF1hoxQ5R14JUXVz9zJFntfStPO024DKGeSojbJSWqXwalaHqpYRjD82lRzTdi9T2mZnBCBAbzFawYRxTU4mSo+TABp8CBbWGbVPAWy3zdgZ9ink6OlvDfZhChlydJUTnsBz3x6np52NKF1nFi/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrSiNCnC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buxjLQwr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrSiNCnC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buxjLQwr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEU7LJ2221398
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AvkDRJZrCML6+GocQvDS4cvH
	5oLlZjtVzpdID5Tg2qs=; b=NrSiNCnCi7eJfmVs7srS1fnU6xZj48/MDmFrDZS+
	dEAdzRbqA4QDD86VFROWQ7GWNYbluLgke8C7EEVQIE6UV9e23u8YYNwYbG37dVif
	qAX52ktkDiWDpeU3CbyIAhXd4HG2TNeW7+zWGhZ/4CCzuM72OoN8cPYGSs0NdnDT
	1YgqryKdjfit2MZkULnhdfoL3Z4U3EkMULH7f7oa+/jEaq+7GoOnQlGvHzSpjfqs
	CKBhasv/rALmes8ugbABw/TfHk8nhf294Ke3UeOCj7C5lVjx/NBiOowOXZU9dhzr
	kIJ5Ixb9SDWrcbsS9DxDVaJIjC9bYCyHzklf6cjBt3QBnw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bku8rne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:37:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so51430051cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787672278; x=1788277078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AvkDRJZrCML6+GocQvDS4cvH5oLlZjtVzpdID5Tg2qs=;
        b=buxjLQwrLbgz18UwcFaxRFmKtgEJKvUASjzhWHqGdgMVnCDGzKbPwglEMPGaRPXzuu
         4PEq2oDUbhVBeIuv+2pXMVLy+OQYGFdLrjhSYKxsU+i6kb+rLgYLWUfeneseUh8PGcLl
         qa+J5dWS6RT2XONaYvxhqHSiDOy6p8XZ+4EC0ibloXDwGSq/nFwjnFYqyNWusXtn2AAe
         MdWvpmSVxglivHfoui7iYaJS9XJfyyM7Umar4n31SamOuJVfxxn7sjC/h58zgQP+KuP+
         baf3KEdaKmLu1SqRtCSK+8wwv33RTCO8bVO7nMZqC4Ry3CI8q7U0M4UobtS0fdt/T1W9
         59/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672278; x=1788277078;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvkDRJZrCML6+GocQvDS4cvH5oLlZjtVzpdID5Tg2qs=;
        b=gnntlXQknIC9wTW5rOENh0ynTjxPewtbh18yCn7POlXYL2wZjU+4GwQ7A4H3E5nJ9U
         Qwr9l3v+DGFYHX3NK6HtRHtLx0kGazrJCq6hDJZtyp+DrRntS/KOVXkX/2Xp7wST/L8I
         mB+53UiT37h+ayeVxzuOw6FUImVAfoCS6/zxeggaedMM93SJbNrp+1dVrygSaYuay18K
         gvG5F44j5qYyzn7l/lCnGOhY7yrcKtYqMjW8zoQ2evEGXRhfNRVVEtRUIqaSefooOsH9
         paICZY0RENsdqoN/5GXqpwZThV0OfB5+kRFY9mBx2tHjG96GxiOAVn8C9K5ymLqZ9Vlu
         Cgew==
X-Forwarded-Encrypted: i=1; AHgh+RoDhxciPQluqYd5aX/pwXGBXzsD4o92rGQ7/PRFqauJfQUfKTMbb0KddGtkI5foLH/LFms5Nvpa1k1gPFA2@vger.kernel.org
X-Gm-Message-State: AFuF++kQFORFghI9GFYS5rSNrwQrJeV6KD+xV5xNuU2kCh9B/f8wyb+H
	49ROeMG1FxLQvMPMCqe+XoM72y7eiA8iqZHG0MpfCsmFTyX3Umqgc0pkEdf+Ua8qfPFmdiu2n3M
	kc7NLtEsFOTaNUZrXbgDW1Vc8SbHL3kfxwn4ICLYuxKeeMmxeX3U3FSdMT9YRfLgYKTCw
X-Gm-Gg: AR+sD11BVYdNeFzWt7BmmJQdBbKPbC1nYaexJ1Ei2UWeaUhQnqAZM1xHGO+1o2oD1yJ
	fcCGUDHou7SwEhEffPEUswNkVBQTwBKRkyWYDPX1k6VM0j80i8GXZkrJNtYZvac01r5XWq2EPcu
	X0AR/m7i3NRzYP1n1v2DPfWQVPVYDYQUu0ARSGEwrJQlqv74kCrFMvt9mveDAxbsY6tAbmTVyiW
	/JpyC9dkYjF/Nd6SWRhigfN8iEdNwIe2j5HfhekxFlWwBvV8TB+YpfGLXc7vevFVMSjnJUxYkn9
	zd5HVVNTvee4sPRrB7LgFarz3lkEwdFxG9ToZm7SKeYAkgi692v1BVCSH7A7vGs4KWUiyBsjCCg
	+kMs/7iyeHQWAIg==
X-Received: by 2002:a05:622a:260d:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52e09cbc4e0mr315333481cf.37.1787672277890;
        Tue, 25 Aug 2026 08:37:57 -0700 (PDT)
X-Received: by 2002:a05:622a:260d:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52e09cbc4e0mr315332471cf.37.1787672277340;
        Tue, 25 Aug 2026 08:37:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9e96bdsm5339066b.55.2026.08.25.08.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:37:56 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:37:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <xmhintkzkhqbneo2edosyqaxznb2e7sak6oshydtvq5q4qctvb@7axbwfxghvky>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QZ_UUX8rpy_fB1J29lJWSh65DmOBjFeE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzMyBTYWx0ZWRfX+ZAggbZGpzyf
 OID9lQjqf7yP4AsPouaCUmB9SgL9GyxSdaCuHgVvaXgHFif5bj3gHIhAjnzO471mbeS5qdTzttT
 kHjOxOg7FAZQEkYX2n2/jW6JYGMRbY0=
X-Authority-Analysis: v=2.4 cv=TZGmcxQh c=1 sm=1 tr=0 ts=6a8db6d7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vkuWnLlI3icQtIAv_MEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: QZ_UUX8rpy_fB1J29lJWSh65DmOBjFeE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzMyBTYWx0ZWRfX1d7ulrJ03/v7
 aq4ebbtROoqfIFI/oBPBbt7fLFceVd9Dxobe67x1XEAzuPqR/Uc82Wzzc/RBZTtu34WEffCmj2M
 Vs3SSO/pgxLtchYOF7xqnmGvusVvAn465uT90je3XWBXJCf4qUS2jbXbNxGbuIReDRn1qaG+tq7
 OOjx9rBMfgUDRBpXUd6IxCYq4mgwZuWFaPCF4pZOZ6UlH9M3yyyxOD0mErHS4nxd6Qii+gIIZUS
 GTHxjObWuvbGvpDOozhHl18tZcCS0ELb9kQz1sy+dhlNh54JGI0ge+//edJsIwc429M/92lC2Xu
 OPPzGoMslrI4wYhECM0xUhWp8CXnzUHCSY6Q0aPvK4GIfegL/vgr9i5E8rY/xu14tu6/0TGeohF
 HKXjQ/WPCSi22JJBuVI7X4gxsVtbuQNMWvyiBJzp523C2UvOV1XBJ16kNzWOh3+TqgEnfI5zUWb
 O+VKzHIo2++e0+7PV0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250133

On 26-08-17 12:10:06, Konrad Dybcio wrote:
> On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> >> The suggestion of having the CX power domain tied up to the GCC
> >> controller started here:
> >>
> >> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> >>
> >> and then, for Glymur, it has been brought up here as well:
> >>
> >> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> >>
> >> These plus a discussion off-list led to this patchset being done.
> >>
> > 
> > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > Reproducible on latest tag next-20260813 as well
> 
> Yes and the ""fix"" is to disable the GPU nodes because the custom
> runtime pm dance done in the gxclkctl driver keeps a vote online
> 

Actually, what happens is that a sync_state dependency is never met.

GMU doesn't sync state because there is no driver to bind to. No driver,
no sync_state.

Then GPUCC doesn't sync_state because of GMU.

Then GCC doesn't sync_state because of GPUCC.

Forcing sync_state with timeout, allows the GCC to drop the vote on CX.

This is not only a problem for Glymur. I have the same issue on Hamoa
(XPS 13). I'm almost sure this is going to be a problem for all
platforms.

I'm looking into possible ways to get the GMU to sync_state.
