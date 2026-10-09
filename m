Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591A8397338
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 23:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587351; cv=none; b=gbDiGbwDA5B7/v2aXlaONBIe0YgnSkjjxRJPckCBk5ZYHAs0VZStDCFPwJ90YDxFY5FHAzIEhk3Ezb4Qh/D0PgbpF7GWEwZpYBhZ8xaYXqykBCuq4BVVALa3RvjIODlTnzjurL4dl7S8TZx0yAPq0uK5VAyZ7qIn3iY3a1rgWmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587351; c=relaxed/simple;
	bh=Rd40uEn2aGwiiLsr15oVuQdMEfOU+oDPXaASOpjIWDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIhtS1GGsLfiuM67JBnkKzmr3jTB7NwNLe3EgTZtyvLERoTT5Az1FN0erUXQilpZm8pDON4uMA7uaY+E6O6HJF8G/m6Fs7r4dyJaTkvmBGc1X3BIKKFyLTDCXFOB1XRTk3Ym7bxCXXIBzqRnkuuzQkAA68aab594aUozrkwzisU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X24Q1Fp3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YE/pp5TN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X24Q1Fp3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YE/pp5TN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699KhdUr2857853
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 23:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xSGqqaD+HqzjVuxc27KH2WeAXhL0TG4E9SeBeSeo+MI=; b=X24Q1Fp3tHgtoz9o
	QU2y5YDvMjRhLtw64Xf3UHOYje2TYLNz9l8TIy92UMIhKIzxwopofVHIB2MRCBbI
	qfm/Zd0Vg4UQ9dT/yv/L6PInM0TMntIELb/SjUi/DQWsbkRAJ7X8SPC9Bzim6P/b
	k0dDyjsIpAwLDDH3mo5cnR1yiF8cogHk6he016tRiKxuTun3QkoaOELmk5ft9Fgk
	uISv6pNlqWSXMwTVeN3sCrxEY8f7c4D6r7kxhBrvWHE9zU5F1AMKqdQaC/IJwwAh
	PQfO2ph8iZv00hQMC2/dUuO65akws/cqi3+rneo32h1LNXr0yRzZL+ffR0ZQUEOX
	R9gRvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t890yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 23:09:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea9ea9d13so31409585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 16:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791587348; x=1792192148; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSGqqaD+HqzjVuxc27KH2WeAXhL0TG4E9SeBeSeo+MI=;
        b=YE/pp5TNiuQDOST0Gpf2TFeXF535xDo/Jhl8qvcdSM5oiYRPUjnbiXU+ISgNf5jDja
         LMa2Ez6VHLBPEAbvHCyXzJcZeyYGnIU/xK//MAe00P5paqkLXrzKZDV7rWJBiGMOerYS
         LsbZFPoheVnCaemFg1ydVN46pDnvi3oKJQmlrMcItD0Ed4hLaIIi0BQn2aIpUK/SN/2T
         G4j6VM8ibtaQI2UEjSipILH8sZFRVpu1Tk5ue64dguPtpOjk1gp+1s6D73/jKmkT6eTJ
         o3yt64qyYWKIswr/eI0IdXbtea1qhYA6GV7IJBjvYrUSTjTa2uPqcWU5AoS+GsxxTL/O
         fZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791587348; x=1792192148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xSGqqaD+HqzjVuxc27KH2WeAXhL0TG4E9SeBeSeo+MI=;
        b=bBstS2YUT8XLuODp044PvvrkQZn3TLQFbF/lNKI95weu14gUmf3/dSyKzQwVGzN+d0
         lvKjYR3evI3pE+ejzhV4zL6f6EL9Y10yW1PMB8srH9ixcM/pxNvTk+gYdqWb72A8iHzN
         lXQ0tSC1aZLuo0c2mez8IGYmB4xJ1iJFc4VpcsefHqgDT2LKuTkxlNuWSX45VRbXnL16
         gqbM9IMtB5uBJwAz6Zv9AxwaoNqNwzwl3C1e5JScSWCwC+8sueS5Gk71um8h74r/ro39
         iPHapsc5pLYJYECH9QNcN4tN287Ea5h2CmmCePs4YO0aAqSDf8cdYuUj1KUSi/mlZI3g
         aojQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH8mJkpg1Uveh73Viw+WvwQFSJgJH9Km/U2OmQgwf8wZvgbZFyKzYPMOywQfVfUtOaxzdNAehkaCHFn1GE@vger.kernel.org
X-Gm-Message-State: AFq9FYJvImGR04gJx7Phbhyw0fUQFXOanhYwKJwcC8ZWgHRx2kV1t1ZO
	udqLz3XYdRp1SJtz+06UYND0Kit1BkWeoppGfKJYQGWrnIeKXFpzLxTVPnDwu3FnzWAPMPVps6u
	lSHx9r71iCNGqDJ9szxj283XIzUqc9TQSosnEPtbQlmihCf4cI1aVU9umjmPzvFB/F7YS
X-Gm-Gg: AYBFou1ewElumNIjnI/6fac5cCMcgfkwqnNTwc5eKB4cd1/XCEinNJ/odrzureg/kIP
	PT32XXLhazs6/Fa8u6zhvqphOmSgbupRn9pY2TTBb4V7ZxzX16+I3c2zOoUHfKWchklacYwjRqV
	150uQxWG5U+tEN7YVmSpx3jqPx9Lzk2P271iwVA++CQkQhJEOFiNExTWhlavV1Mlpplf8EbXU84
	Lb7fwHBPmTt+VU+vLQpVBR2r/VyvzdSFs8pL+SKHvn8siR/748IX8jTTRQUJZD9eb9wF7vNNm/v
	nWBw55tzyhPJIulrwXLtNCqcA1WP/sSGFQ3goSJa9zNCtfRmqxoaFFAoXIFQp7rq2nEikFAqBa4
	iRN7bXRhEQBDfV555DTOCpA+qD2CsOmQ0FOrgb/s6ajTAQ/upLzW3t8N0kOzBPRKX3b9TjWFGz0
	ZRe13usZgAZBp/
X-Received: by 2002:a05:620a:800f:b0:93e:c12c:9b70 with SMTP id af79cd13be357-93ec12c9f31mr442672985a.75.1791587347593;
        Fri, 09 Oct 2026 16:09:07 -0700 (PDT)
X-Received: by 2002:a05:620a:800f:b0:93e:c12c:9b70 with SMTP id af79cd13be357-93ec12c9f31mr442667985a.75.1791587347039;
        Fri, 09 Oct 2026 16:09:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cf5903sm11083321fa.42.2026.10.09.16.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:09:04 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:09:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Split out a7xx/a8xx device tables
Message-ID: <zsewft5gviv45ks3xvrxoso2vhxa7eeyrxznwhgnnpjjyyngbn@czuyvv2wwdzn>
References: <20261009131927.551319-1-robin.clark@oss.qualcomm.com>
 <20261009131927.551319-3-robin.clark@oss.qualcomm.com>
 <7c9149f5-b1fc-43f1-9f4f-299767c32a90@oss.qualcomm.com>
 <CACSVV01j14Ew6BQbW47vzy6OBDcUdODBT+J7DqBsB2geJRnC-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV01j14Ew6BQbW47vzy6OBDcUdODBT+J7DqBsB2geJRnC-Q@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfX1NHURfGX8u0d
 xFuEB0owL+y0QrCk6jIPkpEiJe92/hPbzOsh0ujU4n9NvrZwHChdL9/6mbAHQvLq7rQz/dWgZ3z
 L+BWwm8FmS55eaA4ZY2mHB9hDBk4BOI=
X-Proofpoint-ORIG-GUID: Mqc2KKn0mdSSZPjIidRjV7VEMoywC4R6
X-Authority-Analysis: v=2.4 cv=D9jSufRj c=1 sm=1 tr=0 ts=6ac97414 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3T64X_j-PjA9zNe75B4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Mqc2KKn0mdSSZPjIidRjV7VEMoywC4R6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfX10HfoffygZJU
 LQvGr06Xa/XTR9pvv9Buzw6lJ08bllAndVosPfsvo/IkQriXrjkf1no9fJRwrZt9qA86Do4ikJ4
 jb0dzj7ihME3umJomLg8eoOUUN2At4JHuxtfENGke3J9pOCbSdqHViklFsXvMb0cKaIDzPwSlhT
 Kc1yn5XUC/dPvCrJ3XRdXyjT7wyi+ZC6LZCNE5tbdCUT9xuYtdCLplMPaTFMJ793L2SsKLgninE
 3ti8TPy8QKR9qcOxlbQ6kScC7xOSduemgx7kMNwG9uqFrFISXYmaNfZeHYkuMDt6kOZACJL2a0/
 kqkne75f+wXB1MBtN1SJtlYQO+TIC1WFXhw5EgBc1du+MTWn1EvLnfPRBvs8A4wi4KE/7oJl1Zh
 p4ciMgKbTahtAXJ0HPETR5As2fyA+uWGxXEJ5J3GxZaeI7t2MrBlpEXMZfmOKWZkHlym9p+w+we
 FBpe5C3gwYYENEH7P3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090092

On Fri, Oct 09, 2026 at 01:38:19PM -0700, Rob Clark wrote:
> On Fri, Oct 9, 2026 at 11:55 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> > On 10/9/2026 6:49 PM, Rob Clark wrote:
> > > This way we can start including generated tables for a8xx GPU snapshot
> > > in the device table (without having conflicts with earlier gens if we
> > > eventually try to retrofit this approach, or later gens in the future).
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > index b44b0fd916aa..66c44cbc4d55 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > @@ -670,7 +670,7 @@ static const u32 a690_protect_regs[] = {
> > >  };
> > >  DECLARE_ADRENO_PROTECT(a690_protect, 48);
> > >
> > > -static const struct adreno_reglist a640_gbif[] = {
> > > +const struct adreno_reglist a640_gbif[] = {
> >
> > Is the removal of 'static' intentional here? I think some static checkers will
> > complain.
> 
> Yes, but alternatively we could just have a 2nd copy in
> a7xx_catalog.c, since it isn't that big of a table.  It was the one
> awkward aspect of the split.

I think it might be a better option.


-- 
With best wishes
Dmitry
