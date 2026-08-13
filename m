Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893A71E5B70
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633215; cv=none; b=Dtz+yDWCPVhg1PrfolZkKXHLWEu9XfMp4VOLJ4FhiDIANOnlsYa7FosMzfC0L61qTOk9LDMe/V3yv0wBs9jJpvZNkfKkbQEqWhEGqoi+LQ5TeBFNKiFgN8QORyLpy6upP2KseHtCdHvXMfn2c3Bx+57K3P6gzhrjgLyn+KeozsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633215; c=relaxed/simple;
	bh=y8BFkiFZ1bhHz5V26X8XbwaP6uDK/0hLwpShUEY/OhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSTbbZdN47cop+Fd7cDykwEHPQPdqdLKMrKfKFZmxB6296ZcsqbjryzZEpGGU0AstxLe/3F4dXLeHN5WQo2B9eRmCXWE0VbAoWilbKW1Xlk6RSOXuB8zKu6yPajJufc12QrSGGzR4eb8GaKyENx5ptBxj9GKKEfxKmFFqoKblPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2AcQIXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3xQ7qGs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2AcQIXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3xQ7qGs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DECa1T2874739
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LZobNk5hrLgW88leDUTxSIm0
	cAW4Tyffnz+OKCklrXU=; b=I2AcQIXsgXsJf3tkSEfyStWQrSG7u8v5RysfEJYc
	4NUvVDr3HpUjIK/IK1WwSr/JVNTHxJ1gfslXy2A6CmnH+yP5HtO2PIbLhcrpX3qo
	utwY4WQe+0gNx7D8XCHJ3wQAoYAeN45OpwTFFY0IT4O7bOw4RmqP8DKIxjYeuIiO
	GKUhE8qS5u+0Y18k8eVLuGycdZK3JgHauVnuYs87SEqJMgR9IurXVvjKH3TWQC0F
	9yCukUz5TonoZwYG1oqVTlDDyfy2IECjla5vYQLq16g3a/ickFs+wKJwUBIbc7bZ
	MAnPrLEyLkjogUei7TQqnj61Nb8Ok4zsEKRW3n/XAJbJ6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3r7b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:00:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so92006885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786633204; x=1787238004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZobNk5hrLgW88leDUTxSIm0cAW4Tyffnz+OKCklrXU=;
        b=X3xQ7qGsbW+FkVGVr6BKoZ3vd9RL8OHu920hNP3HmlTPqHvfPqVEy1AlnHzAYT6UlG
         Iuo8qH9Y323qPhOTJiwwYOCj7bPwzVcmDsTrF3CHUNXoXLxFmV0FjzaGnwb5BpndW/hc
         idvuYm5t7iZ4ZC9mgo9Xhc2nsEzJc/KrYTVJegsGUdhGRqkzZurhk2cP5zF2gpbV7czA
         3ARyrVW9sd39bJ0FNyuSWzIz69pVBYBjqHzYsyHg+oN2k+g/ub/ghDprBlhY1ZABGcvk
         QUJF6knqMSkwrtgo8fwI2qeT6Lz+m/CS/sUWlGAgLY2lsxRGzr5PXk17E0YxFd2oavwo
         ZxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633204; x=1787238004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZobNk5hrLgW88leDUTxSIm0cAW4Tyffnz+OKCklrXU=;
        b=jEHDkp+hOiOzQG+JIyfVyGmfJkIlfus39EMz58FYzx6AmsUWnOMQHQgRkJieuy2X8Y
         jS5cVh8AXuL0iCq87nNOFYBvF3lfAdlBAiJ2LJMD6Ac/9z27TuFKcmtMIg9fGcN+sD7F
         7XbklDygkj21XbExxlkobyksc0xi0mO492d7v6fG4Zy40ncmdochDJ/Ptrx5jqr142Ub
         wfcr9i92rU402pijtRFQ22DNprIn2i+ZNtJ5wg9IMueklru1FMdXOxpnooyfIe3126z9
         LWqk0NErTNrgXpnY3TvEK1ABEMVJSNI+6VHRZOLPtDW9mocYbLKKOQ3C2NCEO13UZUHY
         fkSw==
X-Forwarded-Encrypted: i=1; AHgh+RrjeobysLxqNwTADGQOA5l/0lFnS2FGa8hOEmdoPQ1q3fLkMFjCsWi3PujLZRQse0m+fT0mWe/oBJWY+QoJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxGYdczrAhL1N8/d56k6UnRoeIC2CqD+zWrn2NJ1bV+2YIrTWKj
	Fa9aZUVbhD3cCE/WwhK6PsB0Fe35/+3xb2KwEAgkmnhPF3QOKgzAKzAqpeEi6nh2swzS2LYiu6F
	o+m63J4PzPWmdisj9wM88L6mP9AA+SSltOGg567c89K4XF3Nj3l6O6XHIJzvKSIXcn2cL
X-Gm-Gg: AR+sD12UL7ffaI7xLx/mpCWdfjTQY4FKA28c4VtPdZErBO/J7bi5kmuoAObPHvL7TG2
	kWgKLlg34WXZAacuEbn6DQdWCweM71baJr1ihx47IsIaRt+KNBIS531uieeN8vALyli9O/mR2eL
	SkIe6P8ajiLB/ZUQgrno9ZVeib5Da9bWnKoqKY9ZNFZkmY5tYW1SQODcZ/s31asJS1tWiMmed7N
	e50G8/u7DcLPJnsvhwM720JKTKR3OQBcGTTdmlofw1gEe6ZzCUOebws+0quLilZb+6rYk/vSSxB
	AotYRAbR3Re3FTWDeOZOZ90lybk7mSbFF5VXsoAnwTTW2La31EQAkCKKucD4JDxm5Y2YdBjvSlp
	SY26bGx6RNQsH9WQ8Z3UHGWGg57r0eBUw/3HtwfXNUdw0LEAkOB+X0cxhbKnoOfsUUXAAGD21mC
	PfZiwghht6M7Qd
X-Received: by 2002:ac8:7e95:0:b0:528:38b1:b54b with SMTP id d75a77b69052e-52d73d93239mr63800881cf.20.1786633203840;
        Thu, 13 Aug 2026 08:00:03 -0700 (PDT)
X-Received: by 2002:ac8:7e95:0:b0:528:38b1:b54b with SMTP id d75a77b69052e-52d73d93239mr63799871cf.20.1786633203231;
        Thu, 13 Aug 2026 08:00:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e1330sm524819e87.8.2026.08.13.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:00:02 -0700 (PDT)
Date: Thu, 13 Aug 2026 17:59:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <uo6y7zydgnxhz4bbk2bzlychhxcp3hbx23eqg4wihxkj3hy33b@h2pbeveq6tul>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
 <eblai4d6apohd43uvo4kbm3y6yfkso7rd643ijra2awyguve5l@j7aq2vzzwmj2>
 <an23eZWmtDVbfWEG@hu-anantiwa-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an23eZWmtDVbfWEG@hu-anantiwa-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7ddbf4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=ohoy1kE5jbgo51n5cX8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEwNyBTYWx0ZWRfX3+rsM4KaysCL
 KHK6V3s/lLchVktADn9XXBxFRXlaanCv0xZP1w9LjXV5VFXPssamSPnwR22qpvMTuqcexaWpHwF
 44ichxuU9iCFfaPFFcYFVHoY2GkDPgEtYTTW0FhqEl5zfJW3fCCk5YmCUuwbcKuPi0vX/duYNKz
 /1gtfbzQeBhXYWvlgwuY2IKoDxi+QDbFw+onNuOCKJUPlCqor94XcZgXFU4ESJhadPbFAoqAB59
 eM5x+MC99kjaHKFtLbbg9SmB7yRRBnvL1+qAOPPFL6NQeqkAjL61mnZfUOavuwsJEfh7z04e8EK
 ZNaBcM6PFpDGl22zM2Du9YtiP+Oc33p0L0jzuiG2qWLlgwWffB8HO8UybBM2lPBHwPAhLBiBduY
 +FkkVKaxha3c6yhx9M6TrwPLPcIfH3/T6CHScN6G9l8vm1XTc56sU4BD5tiiOzFiiTpBRx7P2ud
 Q6KQ/F+yDurb2+zhjzA==
X-Proofpoint-ORIG-GUID: jGXEwAnxyGaBJ-W2PPrJQ63REA2V8swF
X-Proofpoint-GUID: jGXEwAnxyGaBJ-W2PPrJQ63REA2V8swF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEwNyBTYWx0ZWRfX73MTt02xqmWP
 6iakuEArcQQ4hQdLoINsM/lHAu3M7k44t03tSYcupujl8g43gxIbzorwv1+6i4ijcroZ1R9GGZu
 ZuO5S8faQSvupTRlgj4dJXRRZfdQh9c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130107

On Thu, Aug 13, 2026 at 05:54:25PM +0530, Anand Tiwari wrote:
> On Mon, Aug 10, 2026 at 12:04:21PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> > > On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > > > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > > > variants and provide a composite DTB for headed variants.
> > > > 
> > > > To quote:
> > > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > > 
> > > > """
> > > > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > > > lines of a new feature, there must be an underlying problem that
> > > > motivated you to do this work. Convince the reviewer that there is a
> > > > problem worth fixing and that it makes sense for them to read past the
> > > > first paragraph.
> > > > """
> > > > 
> > > > In fact, I'm not even able to guess what the problem you're fixing here.
> > > > 
> > > > Regards,
> > > > Bjorn
> > > >
> > > 
> > > The problem is that the base device trees currently describe the eDP
> > > display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> > > are also available in headless variants without an eDP panel.
> > > 
> > > With current base DTBs, headless variants are not stable where eDP panel is not
> > > physically connected with board and userspace is trying to use it.
> > 
> > Please define "are not stable"
> 
> I did not see any crash in this case but in the absence of physical panel 
> logs are flooded with errors, userspace is trying to commit the frames 
> since connector status is always connected:
> 
> "
> [   23.499621] panel-simple-dp-aux aux-aea0000.displayport-controller: Prepare 
> timeout after 5 tries
> [   23.508763] panel-simple-dp-aux aux-aea0000.displayport-controller: 
> Couldn't power on panel to ID it; using conservative timings: -110
> [   52.143157] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for 
> commit done returned -110
> [   52.175662] [drm:dpu_encoder_frame_done_timeout:2733] [dpu error]enc40 
> frame done timeout
> [   55.351084] [drm:dpu_encoder_helper_report_irq_timeout [msm]] *ERROR* 
> irq timeout id=40, intf_mode=INTF_MODE_VIDEO intf=5 wb=-1, pp=0, intr=0
> "
>  
> Another issue On Ubuntu with Gnome Desktop is:
> Display's connected with other DP ports are only showing backlight since 
> login UI picked eDP panel connector which is not physically connected.

So, for the next revision please describe that in the commit message.

> 
> > 
> > > This series fixes the inaccurate hardware description by keeping the
> > > base DTBs limited to hardware common to both variants and moving the
> > > eDP-specific nodes into separate overlays. The base DTB can therefore
> > > be used for headless variants, while the overlay is selected for
> > > headed variants.
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
