Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1918438A718
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399015; cv=none; b=M1fvsU4Qs4gFGZERildZbqD2yBjO4uLDM39e8egsLj9WWN1P9WbsXsvNLtXyISjv7A27XU2HF3IOOiIIt3QtFMlubwO23kPwFs6cy1ZeoTI8bzm+5yvXBXbwnNWGZ9YZmDd1mHbQmzGu4t3osD923Fw1A4jS0zpeDPMjE8/G+kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399015; c=relaxed/simple;
	bh=d614CfoqUwmmdWVA+RnNuWGs/iD13YDbKvsSUG5hI+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eG+6olVwzOtWmmBeGdPuQ/VACIeMSSfjHsTZ7DxBvMnNoCRAEv3xo3QevrJrVNA2yKeYI+KXA3pAghm5tw5QvlC88Yt1oORxaUr6b6ThIQ2MMgJEQ3A/PNu8H9eMmK6SXULzzq9Po6+aWJx7V0/4sZqmR0zzCQKp1Vdsmq9dMvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LB4xn/Aw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axKKVeQP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LB4xn/Aw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axKKVeQP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6acfh4139739
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z0EzXe3+lECsDpvG+M6a9klB
	0U0zMggC/n/VifZwVQI=; b=LB4xn/AwjCYFZhV9KXAXxeXBTARuXrkFvwPJ4iJn
	Nr8+2crGZP6foBmxvFct14cO4iueRZoTi/StZqHRyp07k9QHqbimSK6iAoeJp7sV
	N9nYVuIFvhrc63NuTHdxpWxThiX83nxwyzC+4Ofevn0zjlKaCexuIqHeRUeHZ2m2
	EhKRCiaXhybnUUphHD8blCbIqfP1hjFuftR+wex1DSPXAytocw8bPvpw2sNhDlx0
	jVRHBAurv8HtKmFZeSXqMMfoZX0HBC9xNqPoV+diJODUuYQq4YLP7P4ArLNAU/Sp
	qLFq2kpdvot5ic4FrvJi+4tbBN2inn7KwMko1r3fMsiEjA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr19grffa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:10:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso48845445ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 01:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785399011; x=1786003811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0EzXe3+lECsDpvG+M6a9klB0U0zMggC/n/VifZwVQI=;
        b=axKKVeQPo8AW5ezpjQyZLcMk7MpaVkx0XoxQcDGyuwaUqGp5NTOtDSn84wcwXCm1yd
         EU4Ve+NCp01UDyfnAlZyH7vtyZImu6FVzwwWxJCWwmlptYJibq2uM4IFrEHk/AO1AsvW
         2lwTH6G95JVfL9a8Fq0i2F8BhxcJOq/XCHiv+QIV3KVYQEJfKbXNl4Dop9+QHBb2uWBH
         NGNIhar2AbPa7SngY5d9UWPvrCbeE2JJ3jXhVx+Sk3s+/4sSTcB/s7Jri+dz9zrgoPhq
         pNXqIH3RQ4M9BcLdtL1zWroETh+N04Y0cO77VAcNpdhZBsBae0reSrQehCPfgat3PBzi
         D97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785399011; x=1786003811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0EzXe3+lECsDpvG+M6a9klB0U0zMggC/n/VifZwVQI=;
        b=ZCdfMQLTYDN02I8rBJN832t1+gxOotLkEDQMW+vXVnXozNGVHmzoLed8dUsioUNiZF
         yOU4bOA9h+D8K4N7SbwAi7QxzW37AVeZwNLDaA0fNGXiKqekWldcyHXzhRr54LV4PUFe
         R72/TW+Zw6JVINVZmgvki0iRJe0vMfX5Ui2TkMahS/FiKYUyORbCN7Ek9/Sz0dn/CIib
         TbedMmdcX64q8ZSY1ZoefG/nFLsSeAOzkSGpsOq/t0NwqaVRnUtZXFwHI/N+d6XSZkOf
         qltkJwgDAyav9UfXusOa0nni0Bff/kAqDdajV30ZFcn/rY9heDBCCdKOZUeZ1FHT6A/V
         d63g==
X-Forwarded-Encrypted: i=1; AHgh+RrchzJhgFYkO5iw+v22CGuycYw1qOGfyraQjUM+qCqlQchvY7OO4GNVY171N9l3wR4WthAy5LzeDvBj1cK7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywybj1pZY14llHD2cbMqnRwlP7njlsPNAob8rWrhnD/BefVK2l3
	9/Pe6MzVJGv2hQ3bvCemDhdXgfQ2ZYRIaf7SQ0NRT5dlHNlw3ydXHWX8ILqlMpKTac4Sox7nc3p
	0OC8NywyPMvi2c8Ln9f9UJDvwAZUc1pX3kb5FpJac6v+PM9VQYMyzbN+gCo+k5UqlnOiQgWi95z
	zd
X-Gm-Gg: AR+sD1361V+ZgfR+BnjJ5N1iwvOj0JjrJnL8rhsadFWc1mXFTrPoLg/8xhmy/czq1sm
	w4axJgfFRfWdyNWL31yhlvIfJ0BAFaLrTTPdHSSzM/v1Qy4FBToZYAukWH9UMrTKhnk/Ac0Sroa
	GpbQLbzV0WC92umWY9iaLGSK8vJKreNI/EimviWFh5yPRxh4gg1ijAH4yi6F54QRe84tBZSxxym
	gOtAdrxoDM03Z6khd2CQ37gAmM8/p81LOlNPs+tul9oOXaPHysTbhAsV3lxMFRMO5E6C4zVGve4
	f1BAAA4KcrO1PYch9k3+VsY1JBcq/9tBG2gTWoN9U5nsUeMo7+wMiCbmQd9DOGXZBGP713plsje
	gIYTzLVPv7crehj0VkCrqXlWtdZC/zw==
X-Received: by 2002:a17:903:b4b:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2d035b9b486mr16129605ad.1.1785399010978;
        Thu, 30 Jul 2026 01:10:10 -0700 (PDT)
X-Received: by 2002:a17:903:b4b:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2d035b9b486mr16129275ad.1.1785399010510;
        Thu, 30 Jul 2026 01:10:10 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc6d56sm22629805ad.49.2026.07.30.01.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:10:10 -0700 (PDT)
Date: Thu, 30 Jul 2026 13:40:05 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <bu2teppx5i2zuz5paq3gkdluizvaywbdtz6frhe3qwihrgph3p@kts2nhyjkbax>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
 <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
 <da299944-0093-4d1a-b092-f7857b101199@sirena.org.uk>
 <gaigrfpfunsqwuxf24uonw4mrkdse4ap3cywi2eg2qdyfgfzsd@hk6zghfqnkty>
 <amNfHiL2W-uLlPjY@sirena.co.uk>
 <e25dsbpp3chldtoh2awrtxfxkju3jevphn5pcoqvfehibwg2nr@yj5pfelpti63>
 <bc461376-292d-4550-8518-3b84eb4fc602@sirena.org.uk>
 <j2tncckz6mex4q7yqkw2prpi5yml7sdka2etlmnf3knyamvfun@pizpb76ilcsw>
 <791a22c8-8c3e-403d-9737-c5957ca2a0d8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791a22c8-8c3e-403d-9737-c5957ca2a0d8@sirena.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfXwAiyZvo+1UNo
 GFKShGBY8FvPEHbR42r9zUSwwfJFkTAeWu2fc9ixs8JNhWFrKjZyRnFYv/H2VdYlugHXRSf7Vgl
 K9LvGUkcNQPJ90rOevGbyoGkyqxqOknraFj8d16c+GFvzNQpUzRm9CzxWj13JuFietPwYWNhMQx
 HRJq/yhs7BcIuEIY5ceCX0aBfpEzLblrDV3/DWI3L3hCn3Z1RzXXoB2dP8CdYzrWvH+sMVcv3Fw
 h0sLIWD9dy9vIsfsqaClFjGbG4Evz2yUheDfMLnYKgbBXO2kFj0b8phST4t6FMKjtJJY1ZCb4vP
 5XPGEEpxj3ZEOpCO1oRN/uxRNPRcmt5WpNxbxhOkP3afArAT/nbWq9zKfm0rHoYzIjAQ/qx27cG
 /rQT3H6xCG1L0WIAPVE9mC4O8LQieeZ5xhmXhTc/iktqXOsf0u1hqXr/27W+OL0MKpRse2aT6SW
 Q61rxq2SDoLAcg5DSZQ==
X-Proofpoint-ORIG-GUID: wJYHi_aermPz709fxLwHv1p8cwj2m5Wx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfXy85r0KsiV7MP
 ObHnuYMKckXNqKt7kFnoKRUGdqjAxS+w9fDhqW2b3pqejCZZRJeLMCbZkd2PgqN1IS4RNruIXwo
 aASHPAUL1c69Rm6GwGvtIUB7hKRDqDo=
X-Proofpoint-GUID: wJYHi_aermPz709fxLwHv1p8cwj2m5Wx
X-Authority-Analysis: v=2.4 cv=d7bFDxjE c=1 sm=1 tr=0 ts=6a6b06e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qPKSEtB9KYaYJBVR2bMA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300057

On Thu, Jul 30, 2026 at 12:11:26AM +0100, Mark Brown wrote:
> On Thu, Jul 30, 2026 at 03:28:39AM +0530, Kamal Wadhwa wrote:
> > On Wed, Jul 29, 2026 at 09:04:47PM +0100, Mark Brown wrote:
> > > On Thu, Jul 30, 2026 at 01:11:36AM +0530, Kamal Wadhwa wrote:
> 
> > > > I can drop it. But I seek your guidance on how should i implement logic
> > > > to HOLD the enable/voltage/mode for the regulators which are turned ON by
> > > > bootloader.
> 
> > > You could cache the values currently written to the control interface?
> 
> > We can cache it, but i was planning to add change in core,
> > which will require get_status() or something similar i think.
> 
> I would have thought we could use the currently configured state here.
> 
> > > > Besides this, since the sync_state() cannot be used.. i was thinking if holding
> > > > the voltage/mode/enable till regulator_late_cleanup(). is that ok?
> 
> > > Consider what happens if something really needs a voltage raising to
> > > enumerate - if you ignore it then the hardware might be in for a bad
> > > time.
> 
> > May be we can allow the up-ing of voltage/mode to go through? but cache the
> > lowering requests for voltage/mode and apply them in regulator_late_cleanup()
> > so we are sure that there is more then sufficient power during this sensitive
> > phase. will that work?
> 
> It's certainly much less likely to be an issue.  There's some similar
> issues around enables for exclusive regulatorss though, and I wouldn't
> discount lower voltages being an issue (off the top of my head I've got
> a feeling MMC needs to lower voltages to up clock rates but I could be
> misremembering the use case).  Whole thing is a massive can of worms,
> that's why it's not been addressed :/

Do you think allowing this behaviour via a new regulator DT prop like
`regulator-hold-on-boot` to allow per-regulator control.. rather then applying to
all the regulators which are ON at boot.. may help address some of those concerns?

IMHO, from the design point of view it has to be either allowing all the requests
OR allow only the up-ing of the voltage/mode till all clients are up, may be needed.

> 
> > > Will the bootloader be running at the same time as the kernel, I really
> > > mean "by something else" rather than "autonomously" - usually that's the
> > > device itself (eg, reporting that a regulator was shut down due to over
> > > current) but it could be something else I guess.
> 
> > Ok, so is there something similar to get_status() that i can use to pass on the
> > info to core (from the driver) that regulator state was ON at bootloader stage?
> 
> is_enabled() would be the usual thing.

thanks, i'll use that that then.
