Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3B83C7692
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222656; cv=none; b=dbFjTyNgmOLJDgYZWTgAll2//8iilD8az7zvaX5m4eOZdOu4kQpKBbFcDW9/w+VU401QF9lakPjLfFk6wpnr+aMt9au2QolhB7rC8RxFCSFyGhu9fdXPsmsXEk6HzbYeueGpK9NjzAfQCj7t3n77K9fnenD0yndZnK7kYPU4o2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222656; c=relaxed/simple;
	bh=cutvW5uw63qXPO9G2OaOjEdyq+0WuOf2d/H/CLsiP7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAlv9aKmpYrSRbKZa1fLOxN24zDcgwNZm/dLiNybQ3j5CdUKbuT42EhB9Jp05SsKGcMyFAgwINTipEy9wb7G5/5+NYJ8axzatVmDJqqahx0eMU6jp1UQUe0tgkt0JFtz6KLkbdPueoLAmw1iJOt6ZGG4rB2lADOR+Pd+VlI6J0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLLBNyM4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXFI0ur1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLLBNyM4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXFI0ur1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3acHb1467192
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HmWG3QTmOnBSsr7ji3RsIoKz
	XkevaF/neS5MK/vu+co=; b=gLLBNyM488Sns2hlx6jFPKHgZvpN2pYKoAJ2SBQQ
	Qa6jVXobvr8IU9/q5KCJlifxnGvSpcQhMAejnB6eFB1pvhSCPGiSn+fUGoxzQPT2
	ekCl7udLoA2iK90njQB2rUZfEu2fEBYAx4s3lS018CPEwLOjpwLhjY9lOzEeg2b8
	tQupFcU5HadQLWcLRacwOZBPTplwwN+1w56DgiYAgLLvAd/tCkVjslD7mvWxRdZ1
	Op1Vz0TBbQbRxhKxQjaHlyLkhkAWdo9MW68hrTsYmUgk4bxJkuPfM0lBiH9C4kwS
	U1e7ewvQVVFzdXMGG5li0kTjKNlRmFc/CuOkcwBI1gTlqw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbw2be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:10:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2321152a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785222653; x=1785827453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HmWG3QTmOnBSsr7ji3RsIoKzXkevaF/neS5MK/vu+co=;
        b=bXFI0ur1bYyxi5Z3iA0Qj99+VSw0kG/bQ71AqvdQholEdKWi8SNqVuB+IEJI4a2oHQ
         QOzmX/CWCZwcaKyUu72rQA994F6/OcwGNtpdG4ZNBcc2MTRd+SOMiJYO3BV1kFWPSqe2
         ec34yTSbwG+leKcHUC1rUdU7twVv4skOVcO97NToUq5YWIsYiWjVlHMIP1jmSqlDJZ9P
         yWMC0k9zf+yAOdMLK9HUIFgOY8AmLsWhETKVyTgnmjUkEQqeuS8xPzIWehjBNMxQfN4T
         GhCA3TTprZ9mW6iEqMQrKnd4luy/ymQqxpNSj/R9c1JEr09tp5EQXAvt/VFsVejUSQDd
         AG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785222653; x=1785827453;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmWG3QTmOnBSsr7ji3RsIoKzXkevaF/neS5MK/vu+co=;
        b=S6+wPecXw9lLOkGTeI3dKGyC22krMF7XILcMu6s7oHDkIRjZEGlcoPset4P6SICrS1
         7qjb97LX+UyQKTUHbZgomT22JxzWN3a5D/Wihae4/FyB0wIzgV3zA2CGxICgmekA/7SU
         uNFlafCtAfvIxULySmeYGpkms5eFEM4eF3o8bojYEPSlctkkktqjtrDogMKVDb5a8bxt
         jQ1ewpVmRhkTBOLfzSBaLgILipvRoLOGwgBlNm3jIRqOBJccduq5S4NedhYLj2BLcIxj
         HaGv4A+c//dcnDswz7Te+JVjqbXaqtwjQnP2cBfuSEyqWtEFRVVbW7K2gQfLZAsXG+iD
         v0MA==
X-Forwarded-Encrypted: i=1; AHgh+RrDktpU0bm3DPQGPBdxXEPEPPHcDc9ImMJw/h/57KDfVP384+RNvAEudCjnmOOTKXMECuZq176Ma4fjVldM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1pMOwdVzwNjZ8x6BgV5+bX3o9kScUWfFrSx7Fv5MLYn/H0w67
	ietufPAFxdaseWC0PBekpJHUImUu5nJtKQ4zVAJJarC226HjaijtKbgD6VKOV3U5dpQVZGeU3Pz
	haH+71VOa9QFV71haekQVJo187OrO+auYbpsSd0xXaTLvQlzeTEKFlYgNX6qSFaiG+xn6
X-Gm-Gg: AR+sD13Pz/tzS3SuHIHxnedzJ2M7Xs7rGqdNmE7sVdVeYkTYT7wZ5krnIP4a1M/xNeH
	ZsWaeazbTyLIaXrB0a4ZbSuZch93xjO+8nz8atkiR9e5M4RI8IZA11JRvEev1pD1+NWUTKSsyuI
	3fR+PR35RdV198XPkMim7YOBZpkozvBUKuhq/Usy29RSMB2SRI76ggEQT8qh+kz/Oh19krbV+HV
	56thkWX8GrieBMD+s1+sRji3AHe6gkrBt+HmMJxpkYbuh0o/BKPxVBM5axizXhbmFNOxCWDedSX
	BAN6XXacRR1LCAi+VXuaiM5XpnyArmxby6JeOOje/xmwfBKW9c2QTpwxCMPX9CoRoO4DfCY4QEt
	Wo3l7LpuCdfT85UhukjHNJVIvNY4E0d7rxLIH1pvYItE=
X-Received: by 2002:a05:6a00:3c84:b0:848:6dd1:8195 with SMTP id d2e1a72fcca58-84e9332af58mr1188305b3a.34.1785222653230;
        Tue, 28 Jul 2026 00:10:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c84:b0:848:6dd1:8195 with SMTP id d2e1a72fcca58-84e9332af58mr1188280b3a.34.1785222652756;
        Tue, 28 Jul 2026 00:10:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d13f0sm3980391b3a.35.2026.07.28.00.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:10:52 -0700 (PDT)
Date: Tue, 28 Jul 2026 15:10:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Ignore unsolicited DSP response sentinel
Message-ID: <amhV90DXoo7l8XUD@QCOM-aGQu4IUr3Y>
References: <20260727130940.577721-1-shengchao.guo@oss.qualcomm.com>
 <3a83e00a-9e4c-4411-b554-1edb9d02c799@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a83e00a-9e4c-4411-b554-1edb9d02c799@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Isx_XVpva8bbic-TXNXL5oU7t7RXpgOm
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a6855fd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L035sEZy4BSS5_ho3PYA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MSBTYWx0ZWRfX3HSfeHcIRFRU
 eS17G1vMe7kyg/6Xh8Gu1mDRHrGhm6I/Pxyxig4y5Mp+eFdLSMrYW4s8spDDbb23HVaXiZXPoT4
 bNlv4i1acoOdaA7+VP+uGLe01tZUOvg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MSBTYWx0ZWRfX1TLO1+5dpRWb
 h/D3jUe5d200NXd5f4gKPdqRuUlGJx1+rUIOo3c5IQxW7RUfDb0w+HLBsVOjirKrvc+zZHe5/nZ
 8VQ/ER3/96MoWB2HLSdp/yGV1x13Z43AH7+P0Fy+PtabvYNcd4YUIoAYtWfD1m2f7BdKwVI5IT2
 ibp4TnUAbWDF5ueiTVYcj83gkdFiqgL6h4Tc2nc0p+eTc15Ob1u+6o8H62cOCCzdrUGUZwZM66u
 tDbpmy92/nX0h4Kj1vcEkMqOtTlRQpcY0wuGms7zWua3EByPLNQdslcagCsIXwf98BOEntre7ei
 0rP/n5LGR549SGhOvOyjQ91xlapppr9qeTQCF9l+XY4SrG33+Jt/yRbQ3+evU/LX8JE+uExRiBp
 49ftZLnKwBlBtJHJ9t2o6ox+8X2HMOIULoT/eGHFgo1RZciZuDh09gNGuN1ySMBNm1oTOAa5Caj
 uNy8cV/+Z3MsClUa0Zg==
X-Proofpoint-GUID: Isx_XVpva8bbic-TXNXL5oU7t7RXpgOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280061

On Tue, Jul 28, 2026 at 09:17:34AM +0530, Ekansh Gupta wrote:
> On 27-07-2026 18:39, Shawn Guo wrote:
> > The DSP firmware on Nord targets emits an unsolicited glink message
> > during process teardown whose context field holds a fixed sentinel
> > (0xABCDABCD) rather than the context of an outstanding invocation.
> > fastrpc_rpmsg_callback() treats every inbound message as an invoke
> > response, so the sentinel is masked and shifted like any real response
> > ((0xABCDABCD & 0xFF0) >> 4 == 188) and looked up in the channel's
> > context idr.
> > 
> > This is not merely cosmetic. In the common case idr slot 188 is empty,
> > the lookup fails, and the driver only logs a spurious "No context ID
> > matches response" error on every teardown. But the context idr is shared
> > by every protection domain and the listener thread on the channel and is
> > filled cyclically over [1, FASTRPC_CTX_MAX]. If slot 188 holds a live
> > context when the sentinel arrives, the sentinel's return value is written
> > into that unrelated in-flight invocation and it is completed early. That
> > is a latent, timing-dependent bug that just does not happen to trigger in
> > current test runs.
> > 
> > Drop the sentinel before it is ever turned into a context lookup.
> > This removes both the log spam and the mis-completion race. A genuine
> > response can never be masked: a real context is (idr_index << 4) | pd
> > (at most 0xFF3) and can never equal the sentinel.
> > 
> > Lemans and other targets are unaffected: their DSP firmware does not send
> > this message, so the new check never fires.
> > 
> Sharing more details for this context:
> 
> On newer firmware, there is a support for DSP PD notification where DSP
> sends PD state notifications on certain states as per user request. PD
> exit notification is always sent by DSP which is with context id
> 0xABCDABCD. As of today, DSP notification framework is not supported by
> fastrpc lib or driver and it's safe to ignore this callback.

Ah, great information! I should have consulted you internally. I will
update.

> With this,
> 
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Thank you, Ekansh!

Shawn
