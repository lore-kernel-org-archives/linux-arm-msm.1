Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615236;
	b=0Zroge4oQPtnI/ffqAZQ5A93di76SqOkDGIweXmLmY5C32vk80jAK4NSAeGviq3cK6G7
	 LHe6E/LMm8A5HXoBGgxpE7TYBAnhwMUsa9VH6HQvibKvUC3Jhj9YEizSjceqpIA9oEL6a
	 ec+CjB7+0InSoLgV1YYH9DdBZH8Wd2j5W3Qrcz2mFrsrqrXZ6p9EAKdCVni/yx0ocmnfT
	 ods0K4WCIiFoKtSkooPnITxIq8kysQ/ZywDzqywIenrX8adYcHYCmuWakOmf922B2RFXv
	 3gdd62JMI8aDdxBDhFDk1y08GsPXmeKUQEX7JWhaNyxSUxFLRSaJZbZ88ZV3OmLQBzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ib+6Qj7A9ckU60iJXh6OYZ606g713kfL86TlY+QIpKE=;
	b=bb8De8DOuAHmsMdG+dwjLOq9Kxvge8sHo4PXJnok+pKU+2d1JdgXfWrt62Bz15l6d6/W
	 UVCZD+SeSFeqd+cx289b0hr438/Bq+C8CDH2P51X0I6d25xumAsGwDI4ReJTGq1fQ+wxW
	 EENNSzGUR2LZwBmqS4Zl642ZbhRgHzAcupoXvhLRecsSjCeyn2PtrGyLbP2ivhqU/+wrI
	 otmoPJ4aj1Yjjmns8JXnvHaAfjROPxVDfv6WfxIIwroZnmnIWGfYMggLveijNM3/PcIOW
	 kW+OBjJkRrTndBHc3gKievo6FZ8tHEiHs4RAIIiMHjqIDveoB4pkI9zi/PJQO8lszgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rc74JD1t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aP5/xo78";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C596606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C596606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rc74JD1t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aP5/xo78
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AP8X3086563
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ib+6Qj7A9ckU60iJXh6OYZ60
	6g713kfL86TlY+QIpKE=; b=Rc74JD1t5B2olBnDuJ5opJY6/MqRjdN48Vx1qN1P
	R70XIQjX9PmM6YzZklHy9o4Uue3mEVrjnDdMPAG6q1poitExPHeG6OeDhnMlQjEd
	HnyANHPJLaU4M76+gqWJEzuAyZeCwsiHD8Wz173LnqeyjMco2CgIztVdfxv3TYbT
	9/073vcVjhx1iFFaKRKqn5YLZzUmxbDt5h10v+95dN2zLKoKM1YSzu/aRYVYslE3
	W8kAeKAxccFyphpbkXN93cqof0i9IWlEEwv9zAetqpZlTl0aYVL3AyjTb/wvVZDJ
	WLuyhXSspFdewmB2+PhzBrDlwRIh3ZYGzbxpgypmP/AIEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61bc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:27:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso474875585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615234; x=1794220034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ib+6Qj7A9ckU60iJXh6OYZ606g713kfL86TlY+QIpKE=;
        b=aP5/xo78Q0tBWvCvUUQ2NGLBDH4xn7dj6K+9sWCgHpzIQSp/Qf2TCrGkpazh2SMjaE
         fyTeW2a2e25YnadxBEbHUt+lEpHQVfREH4DJpgT8aeuR07n2x5Q0ROkoSy+LBtPHyF5J
         GueHPB7pQSw6GwShyKszSJ42osOnQ0vAUHHikRLCiWfGn9TVcivQDY1VA1rfnTa40z3m
         f6I0whOKveCdy3uKz78CtLNObDGM2EYry8Q9mzlbs3i7grJTUfN3vlJfeoopLzfxBgbi
         7jA6Bn3v1ANqqcEQOwRmPHnrkJHPSZhlna8ajkGLWuB5Hi1ZYrcQrcrgu9/KGqB20NKS
         fHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615234; x=1794220034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ib+6Qj7A9ckU60iJXh6OYZ606g713kfL86TlY+QIpKE=;
        b=a/HB0IqcvuckU7X07A7YoMeEMPyqjpwLyL06DzrjcLMu4plCSvylL132A1u3CMy+2f
         LafBhM+JMlVZOx4b8bmMl2FzDsjN+/ArNEewpn71FdqEdygVpvF0BAoOKliFqS8qQuxJ
         akwHFMTzqe/0oBTObtEkA1RVW6CH4TE4wkJ5IyBLqGhM5gMxUpoOHzVSSsMDv09oZ1DW
         /6uvJSHq6qcicu0OSdraZaGw3HGntippGZD4nMqu54oPe1jZZ6FEIfOgdt3qgF65GrnI
         QFpqPAe3OxJNA6bVLwJSUwKG6rdUsp0j9hfp8MfNvHiEUA2r9kxRKLikWsrnNeUbA8fV
         bd5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVuBzMZIy6E/9Qhz6Rr7qgwGJqcbR+/iCmQrULmEKOm+nfAmriKT4tvO/w8rW9r22TjkHDY9KV5+matmDn@vger.kernel.org
X-Gm-Message-State: APuU4Z9AvRjw+cacXh6PLPLtZ/mEDMMj/7oPizxiXgG4FQ4ju5sqexbn
	Z/PFXDaJQbyuFQhMzwgGNNceaYGASFgz/O4GgnzgLw5+sLqAmVzjNrT9IqcZCrexMBXCNw/d+wb
	Go1R5TYVwgfbXO4efyoM/q2KgmEfzOrKEZ0tPuRmS8eXGUHnqmfFbDIuP1BlenvnoD8h6
X-Gm-Gg: AYBFou1TGfP5ash6RFWYIEcut7/eRZ3x8984v9McccmXBe4GTc5+nBrgsf3fk5QYGzy
	SpLXgJ+4MakljT6KLKocGiuCAb/EU5R5vLsrYQfaweA8drjKlT3hL6QOcLtjtEZIOjQfNaILLjJ
	swrPaLuv8GfTs0+1mhs1UAP2UFWL1cotobAmLsaip0X7iUBeQqPM9BxXUG3FngLUs7vOStSTrjo
	EUfp1i9KwYy1tOrTmdcNVCNejNPqlbQTSgcEn6WcHGqIdrTJWifEBn679yqIZpae+M6/TLdDSqW
	/41xnBwGfKqjben517FyJMpjmlYXGtoXgPQXL5qTYhjgEPqymmZYSMQlsSYDQ7kHXd1K172BqrH
	wzh6aWBkYoxGlusgJhpM/yuoMwdmkg1nNUQgCM8s+Ib3NX+rCdiItq8dZJUUl7/+nfJwryXq+aj
	IhUt6TQmZXpWWJ/KFdkdzIg5fNwpabpwVOxo6uvKliSP3+n15pdchDW9x68cOV
X-Received: by 2002:a05:620a:a295:b0:945:afc1:a73e with SMTP id af79cd13be357-945afc1ac08mr460188885a.8.1793615234360;
        Mon, 02 Nov 2026 02:27:14 -0800 (PST)
X-Received: by 2002:a05:620a:a295:b0:945:afc1:a73e with SMTP id af79cd13be357-945afc1ac08mr460186885a.8.1793615233931;
        Mon, 02 Nov 2026 02:27:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edfd3sm1554653e87.8.2026.11.02.02.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:12 -0800 (PST)
Date: Mon, 2 Nov 2026 12:27:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
Message-ID: <4wnqvr4dugximyavejigdvddessngvhgh5xpkvlpi4bvbsqijz@nvmxmmbmnwee>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
 <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ix5p3-mK5ti8Mu11s0hcLx7MP45c7mk3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX9NNzuzMLUm4I
 /4CgWnudLLoQtflnu56tNWPj4Mq4ZGMcB+Gla7+E7ff01R6oNw6LI6kfpX+WIyi7v5bQ/3bBpjl
 aTA0FfuzxWP2IQrjv6SCiONh5iqMU8c=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae86583 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NaZcOW_h6FOph8AvsZMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXzf3N3qmfW0ZJ
 pVHO7mh/zIYudyNoXpwh3I0fpcwf6WwDV3QNFlUTGWrYzkqv17/kX+4q/wg+TQh7mm4QtqKOgjr
 7HbhbM54mp2Kqk8YDb2yRwX2f+AoU8/sBbniGHmZ+AZw3eguX1ph1mtfbZNDTe7cVCAzCpQQztX
 45t2Ptk4M7GsN7b7FdIgBLw5qzLa41N80DvsND68olGFiY7kfAjcnI5wTL0t3yoemD2lqVam6/c
 hvYSbOeGXPJnDgkkMxbzrO2/kNJKguD1ZDnFpeWqhdpqQLS63SU7QgO8BpAsrQrAlYZhzSHo6yg
 gee/qFJqQHkvIHxO16xpswqQcXRazQWuR8Xi5qi8aAwRhl3FlA2moIRUHZrtXveiEUCbKjJBIG1
 WV1pFmsfkXrcQRSySggWMcAn9BMRH0wDOsuqZnYLxXwoHUj8EK2R8VnRRlAoVqGNSQQ976wvfpm
 qaUe286eZ4JmJmfnGNg==
X-Proofpoint-GUID: Ix5p3-mK5ti8Mu11s0hcLx7MP45c7mk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020041

On Mon, Nov 02, 2026 at 10:40:06AM +0100, Konrad Dybcio wrote:
> On 11/1/26 6:49 PM, Rob Clark wrote:
> > Use size_add() to guard against overflow.
> > 
> > Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> > index f687a629629d..16b3870d5e90 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > @@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
> >  		op->obj = obj;
> >  		cnt++;
> >  
> > -		if ((op->range + op->obj_offset) > obj->size) {
> > +		if (size_add(op->range, op->obj_offset) > obj->size) {
> 
> GPT and Sashiko are unhappy about what this does on 32b

I'd somewhat doubt that we would ever need VM_BIND on arm32 platforms.
a2xx isn't Vulkan-compatible, a3xx is questionable.

-- 
With best wishes
Dmitry
