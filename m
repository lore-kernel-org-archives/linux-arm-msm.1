Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582061;
	b=CVX8baYfTTf1D0lF+FTd4x/5xxl1qbHZc7I12QzK6Om3OOasu2cia8R8Lh5Hv6NuMtxX
	 +hfBIHdsYaddIFD1gNHD6h8tFuwaTELhkKXsvX2NbGiExDQpTRj32Au3q1ebzveV7PZEf
	 ENiOQ1UkJICwC+pP+ot5JwyHDILckEqhRBmT87U+GrP4TPxNMeRyXmTTpTIWjAoN64RQ8
	 knSyCp1WbMEFcuKzH9uBmrHgXiOsDvDA0zwRx2l4NrblqbpHx4kPCn+YhewXDFpixbWOc
	 nDZ6dLcK/5PXEm+VsQ0mPFjN3v3RL3m4ULwGosLysGyx8FJ0lC8e2NlgD9qU9KBG/4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rSqkYmyNVoE9XBExO6aBoa6bFdUh2Fv5AJwQ5ckX7wk=;
	b=VitpxQT8t3K5Psym7Ry17Y2LsEjnzj6fFLxbPLYAoI8UOIfKY1ffqqx6ORR+rKi1Cql4
	 y5cpyH7RG8Rf/kWtEEPJsEzpovfCpX0+bkdNS2o4ZwPDZxqcXXM7e6MeoXSDJvUvZfpXT
	 nziSe6ce9B7irMhVrzvt011BoMl+PiU09b+f8/yHxotEcsCS4LEhzMPfZCOcRY4rizQ/u
	 xDaHqYh7dumA/mDIhPC3+MlY+lpfYbfPz9psk0tOqMYyFh1SHL5PPELjkHgc4I040K0Nm
	 qW/8q6FJoArVE90R6d35nGaoZfHE391wO4/mpfKPFEK1PmwGWri5/hPJTRVUEACtbKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iJr5sTRg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLO4CE+1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE2B606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iJr5sTRg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLO4CE+1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B9UH3014904
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rSqkYmyNVoE9XBExO6aBoa6b
	FdUh2Fv5AJwQ5ckX7wk=; b=iJr5sTRgejp0Wp5Nug0nKmqOkf4Tw8v5Z72geQdQ
	5wITPkyCcr3O/uBBuM8fWexRNQjSDWcIsOTQpzWywkp5iZfSFSt7ev4sYcMy8flg
	s0fILpEr1F2T3uFRvoDm9ncG+cHddeg2wcbHN61ul97Ff46ldKmmt/WoZo+sB8kC
	cK1QYGA61TQXtdOio4AsZjktTLT6LbGHKDgLOi8NMKWLj6UyKjbEXbXXdyvMvwsg
	tgDQPVf9gIqvTpQ+bCdkUyeTe91tja9CnoqG0qbWpfglRCkFdqCEpI/8Bvmsd/yy
	Tbp1XJpj+n8vqpewzcqhWg0Rnn41KcMeplVfj5E1MOKW7Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbguw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:47:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so5336127eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795582060; x=1796186860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSqkYmyNVoE9XBExO6aBoa6bFdUh2Fv5AJwQ5ckX7wk=;
        b=jLO4CE+1b8W7NZef2lkH0Vopj+qJFDBuzpuFH4tvHWafo5Jh+LHNWt2JzIdW8pp+rI
         EXVc3QlxxGVcr6AtUgraWAMavwG1g0PTDSsoEsIV9M6iucahbuguF1eIsTmEXrXUe2Nq
         Ugp6klwhQC+y0knRpvV2j1V7JsXctr8I7zve1AVUgGp8Hn57+6uIyiWS8F/n51/EjJpC
         4qo3ZZN017clVDXCXzeuXP3JbXZIM2i1hw2Lz82lr1BZZVmG9X/k92kPn3vfzeF6Woh+
         5G7U7ETeUt4h2an2Ni1t45Dr1YZ8u+ARntdaNlqF6krDxUhem8m+6PnFtKUiMuephOhc
         EwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582060; x=1796186860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSqkYmyNVoE9XBExO6aBoa6bFdUh2Fv5AJwQ5ckX7wk=;
        b=bOtoYYAIoYkfCen1SWXQ4j4c9W59fXcAaXtuDIcE7bkX+RBF91GBKlrBfG7GoOsBsp
         wCPfRt6Kz0x74Y4z8twwLLN34ZaWM5/635RzXQ3/6x91GBJO8HyLSWWqtKgEUY/SMru/
         anikc8qhPCg3zjYyyYg3V4n6nDCHTORAYhXgbZKwAuZaBlbJ8+B7jDogYYE0zNTUaCNF
         8OPMT7zdjP8hTbWo02IsHPtJmKvCPMi10zCjCPOUlOzzYlxfydLXVeyUXD8h9Q+Ho7wU
         e9vwsSjkBK54nV+G3AVZJ98jgftqy6WDuwr6caOyL7YLQQPxYUWUDXfjmmN+2+xDt5e8
         mK1Q==
X-Forwarded-Encrypted: i=1; AL+hErGdBRA3EXVMELhSP0UIxpFNIKNIy+HsE4MxOFBOMdwQP5VvPky2oK90mZuGv/9mdy/X60WD/RBM0y1HAzyp@vger.kernel.org
X-Gm-Message-State: APuU4Z+ScK4X4gh9VdoiQOsVf/ig3KdMpdXUe7rNMcJuZthY0RMZYD76
	fg9Sh1pwF1vYqCD865ikkbl7Hc4nQWqRG5qoocutPnaWkWWM+n+sXJxbsBNuFBvGhX1OllHdNB0
	VzR5psuWxKhkkoHGFmeoansCbJyDPUxI+bgKhufg5lMusqCf0LbET1pyRxLgPOfBTLbV2
X-Gm-Gg: AZFdTZfZGZLkKp+6BYM3/LOSE8Xlf9KRN856nJsNp8GMTNwV+Ls8atW7j8HCaCk6KuG
	mWQFYCQU8y94fgHcR9T7RXUDaSPayJb9K88OMlNgXzB6T9adhITAWno3dLoMreBQX2xe8LYgQuN
	jDnQq/by84IdXIKNiGt+wnHr2Qjr54Vn1d8wccnyTvHljs9UT8FtcsFCvbPFlMsFUj7Xnxwmpcg
	moCCLSUIlEcNXmcrgGGPmDi5V1gkAHTkv2ZahSec40iHg11uP1scPqZCVC3RYwVeTDc91bEklst
	qJ+yr1hAcKvJhb6F8aaOWf2K9aOfOQNmuRK7VedQK6e/T1+WcnZNJcXCGom/KTfGEb9eb9ZLf1g
	HccrmgGHYC64c48Acrjh3du2AZuusKL5lp+qPNpUXaeN80Ja6TYb7EGvJ9goylkAT7ZjPGlpBpI
	bB46eks4gBkXlNuqwbjCpH+Gc=
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr17165651eec.32.1795582059729;
        Tue, 24 Nov 2026 20:47:39 -0800 (PST)
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr17165624eec.32.1795582059154;
        Tue, 24 Nov 2026 20:47:39 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm61563180eec.5.2026.11.24.20.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:47:38 -0800 (PST)
Date: Tue, 24 Nov 2026 20:47:36 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        "cros-qcom-dts-watchers@chromium.org" <cros-qcom-dts-watchers@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Message-ID: <awZoaJ6Wlfuxvuit@hu-petche-lv.qualcomm.com>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
 <avUMs981FKk7Kr3a@vbox>
 <avV0Y5dLG0HOD1ny@hu-petche-lv.qualcomm.com>
 <awT8VH-ZccQXmw-G@vbox>
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
In-Reply-To: <awT8VH-ZccQXmw-G@vbox>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxOCBTYWx0ZWRfX+q9jjSKIuxlA
 lZRgv2DWcgSr1UlHng4/E7yDlsIdwlFEzHcbNJ+zqwZag+1lDolALlKed5qHl/DQNdtA/X7DpXR
 bnLeX1v5nz1zcbcA6/mOzuU3JW/F96Q=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06686c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=2-JXCys9dqvgC_yrz_4A:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxOCBTYWx0ZWRfXy7e8kLTSZ/GN
 d9uzS+lukC9gtx9eN+pLW6eIh4oRU88WfYCG9xqcHVTS6ckE5SfX8fY+WZ+f2tzgq9wkgzDg5rb
 /mi2U5sq+EYTq4lsX5q4YMrGA61oDIpWfJMLTGNUvuJyPQxjmJLBs0R6b8hGOJDagkJU/nelNqI
 PnZ0edT0Siubi84ccxMaWivDU2wjI72ZxFa8OsyPr8OJF7a3sVv1OXUTdl7OSE0AjevnWk0K2xL
 ZVPhivZ2Pw2tvSdcmNr8aplvSCe+WLgOc46sxpIyN2I5du2kojW9gVcm1gTWWEpn6wyq35PlmTN
 AUGk0zegx8vy0hDjQ+oquzC4I+LChTPdZpSj/ctavbKSmOLD/Lk0uWvWA291Oja4Q7MDLZpphri
 QZcXzdZVg8GUtGRoqtBXSGpYUve+PDzA/tTD/+n3R19tz+BqMAiPeTF91/tix0EWebW+j+36YYS
 eTuM+7DyEZxoeiYUSCw==
X-Proofpoint-ORIG-GUID: krZVTTObAjpvwpl1mWgMTVDYgzA6WHtT
X-Proofpoint-GUID: krZVTTObAjpvwpl1mWgMTVDYgzA6WHtT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250018

On 26-11-24 03:11:17, Thinh Nguyen wrote:
> (Sorry for the delay in replying. Got held up with internal tasks.)
> 
> On Thu, Nov 12, 2026, Peter Chen wrote:
> > When talking about whole system wakeup chain for USB:
> > dwc3 -> xhci-plat -> roothub -> downstream device
> > it usually depends on user program (per user option), but not bind to
> > kernel driver, considering some situations that USB device are disconnected
> > and re-connected, its wakeup option may need to re-set, and one typical
> > solution is enable wakeup options before system suspend.
> 
> I see. Looks like dwc->sys_wakeup is already false since
> device_init_wakeup() is called after dwc3_core_probe(). Can we fix that
> separately so xhci follows power/wakeup at suspend?
> 

Sure, but first, we need to align what behaviours we want:
1. Who decides dwc3 core has wakeup capabilities?
dwc3 core or glue layer driver?
2. How to decide dwc3 core has wakeup capabilities?
Has wakeup capabilities by default (xhci/cadence/chipidea) or depends on
DT/ACPI firmware setting like "wakeup-source" property?
3. Default on or off for wakeup option (value for power/wakeup)
4. xhci-plat has wakeup capabilities by default, we only need to
set its wakeup option as default on if dwc3 core does the same thing
for question 3.

> > 
> > Yes, it affects all Qcom platforms, that's why I sent RFC patch for it
> > last week, most probably it have "regression" since it may never
> > be tested under the situation the PHY is powered down at suspend and
> > power on at resume, but that kinds of "regression" is the bug we need
> > to fix, right?
> 
> Yes, but USB wakeup would also stop working on existing platforms by
> default. Do we have acks from the qcom maintainers on this policy?

Bjorn, would you please share your opinion for it?

> 
> > 
> > I have tested at Glymur CRD, external ports work (USB3/USB2), but
> > the port with USB2 Footprint IC (USB2) hard-wired does not work
> > sometimes, maybe the initial sequence between power-on and suspend/resume
> > are different, it needs to debug more.
> 
> Which other platforms can you test? I'm fine with the change if it's
> tested enough across platforms, or if the affected platforms have a way
> to keep the current default.
> 

There are 10+ SoCs enable USB wakeup default on for Qcom, I think it is
hard for without function regression we keep PHY off during the suspend,
although it also should be fixed. Let's see Bjorn's opinion?

-- 

Thanks,
Peter Chen
