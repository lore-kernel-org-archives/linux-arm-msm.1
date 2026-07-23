Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD305470E8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801013; cv=none; b=nMB7Bb1MeQaBnQ6gkpMjPr0k9t75LKr5tzlSgWAIE4ty+tjdzqcVlo80Anwp1M9XxtzNvOOZHe58jX+AIjnpyISPbS94ndZWx7jY1Kb+m5pzT8oYoebwzQxp0FPbXpQgexmlmOdXaiUUri0oU4SEoF6odQWswhSCXrvcDQWJqug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801013; c=relaxed/simple;
	bh=V8afFD2W1M6xvgYB6p4r45dfdu5hamisHl2AIG19+MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEIlJj7byTJ89KLJynCtTFpUg8zqPG39O8ShX6qdCyviqD0fl7O8gPZPaivf33Z4Icr7BriRhZRb7b5ddPbC+H/Unhz9T3iPoZyufPr/+SfMZ0v0KJo/upbQjAmM6D0ES4F4j4K0nSK6uH+kglueLwg3kdL4ywGaBv1IyT3gdNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bN1SGZWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNfqOar1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bN1SGZWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNfqOar1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qoGH3668371
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Ug7bLBpHjX45qP49mU8fjcs
	QGVMwERqU7kYczg+3I4=; b=bN1SGZWZtHqfxPzfnWJn8XsbpIVSBzFjK/U8LRb1
	IBLC+uduGtW+znDgG6mAZy/iXiUTW7RyKAmbdKOdgPNNPFl7ZGbfjNfftbqmKseF
	zTYOyDchPPxnsV5V2CZWz5N/VfrSa68+NYJ4Prml3/OfM4qfiC5GBjyx+GpuzFx+
	GTtge9eQtUzSG8PWv/2uI2K39lKFK0W3grrP4wo/75vt8NqDkKjlZ2qcYrJec6aH
	oYGm0nr4wLwnO1XbFdzOB6vpJkrzUPqkX+DuVUHPJKIczk3ZqYyIk3/TPXgZju7N
	jd8H/RVkGQsve6P0SxdCYUZ5HTijG2I98T+2ZhJRwbkdoA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc2nad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:03:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7131849bso621232a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784801010; x=1785405810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Ug7bLBpHjX45qP49mU8fjcsQGVMwERqU7kYczg+3I4=;
        b=XNfqOar1xJCriIJLV/0fxG2avQR8p1DICDK/Q2qtd8cML/+9r9VJVKLiur/KkRGEMw
         oZA9721XJCz7DRHTnxRJR3W0L+RfiIcwxcmfT5SlXFcDzTghkvn+d3AsltVsKz/vcmJw
         GnBWzln5Jx566uLakHCma7PCN136dZAr7vPQjB6iPHKI/X4ymZSJ5qTCnTbVlH+YCbVS
         IcdMOOuW/nBBbJrTVCPFzi7/9Tu5I/BXfI/FnBFf2yuw+KIM3KsLwBlRzmmxMopZnqOG
         Gt+LpOKX4eVHAfOt3l4T85iU0VMJvO/og+PIsbhVye6swQLY77uzPlvJ0QxytKsMkQQV
         6M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801010; x=1785405810;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Ug7bLBpHjX45qP49mU8fjcsQGVMwERqU7kYczg+3I4=;
        b=bmwMzoD022U3kapbjaJsU0un0faUNzcFd48FIjpwtm8s6IjbmZF3SQSy2oQBKTacT8
         ISCQ1TawGWU5E8VHXPL+6FijtsrGYAOAJK552R05MFc8669f00e89lqIg5CQ07yBXzaP
         hXgMm+JdHtpIMXiQUJFBJYY0xF7rpG3bncTBTds7//dV/VnhJSXTp2Jx60hLVPjYK3mH
         cwK0kk5035tX/vXcicMc0o+q5PfZlZavo4EwV2UJAteAbWxa3Df58Tc6MdzMMNxZJFEL
         JMM+hjRlWsDiTNbL/VBeYbFtiw2wEJX2QLg0s6Z088ky3PCvDaEy3cp9F/8zm0glkqzP
         zIrQ==
X-Forwarded-Encrypted: i=1; AHgh+RphU17J8OzrW2obSs1QIXGkmvrQD4/Np79eOx24whxIwF45YCrZqBT0GF0rZAVXbog5Tu4PFMie0N43bq74@vger.kernel.org
X-Gm-Message-State: AOJu0YwSYmuU9LB/lqgYjEVgbjVPXC6ccdcWtvl6wZKHcm9NYAgK2lzD
	5wW2PwbXR64sE/8xwQSfrVD7j5lq0YHnX0v3zgnJhc8PfPRCVLigNubFlz0mTxBIqtyO0WGdzeQ
	6HP/f/Ym9TUVYt2wTlA5NyexxMk/wzYI17tJ3tq6Y68g9WFsoG4o0qXZHxWJu4Vu7vWJz
X-Gm-Gg: AR+sD12oYEeq/01XD0/CLa1ip9JDnDq0PZNUrgk4t1oG2cIuQAhb9CQfRiJDtjwk10I
	0WESsfodMRJFt6puFKXQICRmpjj+NcPQsIhkmdhDtEZqoZif0zrkNOv0VzyfCS2DindGEPYf7MG
	CuqDiQUTZ3Fq6zM2LWcULQ6tWAaBb83PHY3D6nuHf0TFXt9qkVbri9BgevEDxYe7IWsak6p7r3f
	8g07MMYjbnyS6zTyXGAovMv64ryCuFLywzvqY2m+KZJg0ZKn6CMC6IfMp0evnOdpw80dPljgYII
	RsZgHixk9Qi9ySIiw+PA/MoR5WoRjgmkPoJog+en/IDJM0b25Ej7A+nFJLNJ96D+bQ8FRo/jZVi
	mmYJofOWtkKtwV4TanDvj4NImXeYijxFmEA==
X-Received: by 2002:a17:90b:1d52:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38ec69575acmr2477447a91.7.1784801009222;
        Thu, 23 Jul 2026 03:03:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38ec69575acmr2477359a91.7.1784801008638;
        Thu, 23 Jul 2026 03:03:28 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f42bbsm15811644c88.14.2026.07.23.03.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:03:28 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:33:15 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
Message-ID: <3430f083-37c8-482d-8110-dd161ebcc269@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
 <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
 <fac2633e-db28-494c-9b31-358ed6d0ce14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fac2633e-db28-494c-9b31-358ed6d0ce14@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cqyK6m2SfDhaWtt5fbJ5eAAsbzrFN0Ll
X-Proofpoint-GUID: cqyK6m2SfDhaWtt5fbJ5eAAsbzrFN0Ll
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5OCBTYWx0ZWRfX0KmKQXKyLY8y
 4mrigHqs/GO/jGO7XwvhwDjy5zeCFUqJV1U0dwpA6kqB/XmVx3llKPnbrgVVoI2qMakbnWyN02H
 ItQfNZBWCMXZAjMEV6op7M41qK5P/z8=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a61e6f2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SS_D-kt5JMbThxPhXzQA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5OCBTYWx0ZWRfXx7Y0xoyuN6eN
 kbjKiTk609c+KcxU7CHdTUvUR3rkySoecQsxCEUrEACFcBJl8aelQz4A3/24Ky2ZDTYlTnv+uAw
 T1cLGiotFpo6rxPBpCb4mdpI3Rb5fxa7De/erEF7vYZKvIrLJ1nssTiGbkWK4yG8TJiaxnT4FB3
 JVvlv7JMyharLM2K+deBaDZkln+6TChvZDVtdfcZYjzMkQZJ4S24mVeWwZdFnsmTtFW47/zXNd4
 LeMEmFt0u/57h035P76QPFpy8TaqUZ2kv+Vi1VL4S883KJuAvMzfWsQ++5ohwF+n2elM2YYlhEP
 3yqiWPEKyZUWjX8y0UGPGxSleoFhGLHRC/0JcdPlovDFEtwr67HvcScfBEmyD95/5kkvP2K0Q3D
 tiAlBVU8WW+0A5gzyuPikk3vTKLWP6IPoIrprqeRn0BCD64RuA4pWlSo+EQR6xmkoP7FtOl7Eet
 fVdkyozjRcLNqV3TzxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230098

On Wed, Jul 22, 2026 at 07:03:22PM +0530, Shivendra Pratap wrote:
> 
> 
> On 22-07-2026 15:20, Pavan Kondeti wrote:
> > On Tue, Jul 14, 2026 at 10:46:30PM +0530, Shivendra Pratap wrote:
> > > ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
> > > cookie as arguments. This cannot be implemented via the reboot-mode
> > > framework, which supports a single 32-bit argument as magic value.
> > > 
> > > Extend the reboot-mode framework to support up to three 32-bit arguments
> > > as magic, per reboot-mode.
> > > 
> > > Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > > ---
> > >   drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
> > >   drivers/power/reset/qcom-pon.c           |  8 ++++---
> > >   drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
> > >   drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
> > >   include/linux/reboot-mode.h              |  4 +++-
> > >   5 files changed, 46 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
> > > index d260715fccf6..ac69b5f39fb4 100644
> > > --- a/drivers/power/reset/nvmem-reboot-mode.c
> > > +++ b/drivers/power/reset/nvmem-reboot-mode.c
> > > @@ -17,14 +17,16 @@ struct nvmem_reboot_mode {
> > >   	struct nvmem_cell *cell;
> > >   };
> > > -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
> > > -				    unsigned int magic)
> > > +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
> > >   {
> > >   	struct nvmem_reboot_mode *nvmem_rbm;
> > >   	size_t buf_len;
> > >   	void *buf;
> > >   	int ret;
> > > +	if (count != 1)
> > > +		return -EINVAL;
> > > +
> > 
> > The count can be different per mode. Because `struct mode_info` has
> > `count` member. This single `count` check across all modes may not be
> > useful.
> > 
> > Either drivers need to use count passed to them or drivers needs to
> > receive `struct mode_info` in the callabck.
> 
> will add a once more write function in reboot-mode to handle the multi-count
> support. If a driver implements it, the multi-count write function will be
> called. And no change in existing drivers.
> Does that address this concern?
> 
sounds good. it is just that `count` is not fixed for a given driver but
it is fixed per mode which needs to be handled or provison must be be
there to handle it.

Thanks,
Pavan
