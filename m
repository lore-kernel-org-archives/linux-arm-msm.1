Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FA330D41B
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 23:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790984974; cv=none; b=uACdGR+skbil2Kc1aq918kwNAZn7viDYnAkhETeeZeSl8sYdEoF84ZNq89We7QcqO6EuIAOHHF/7Y21JAwFxpSsU9lO1y7Q0qcv5UPqLigslcavZOIrSOfpG3xpufPyP/fIEYeRKvhsIjSpQqMRSNeygnwP2fTUDohuwUzh+E6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790984974; c=relaxed/simple;
	bh=r+LRzTtHv9vz/zL2VnjLXm4QX8ZFU7I7GYsaxhEJdRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3d6WQxvHQOyptU4i16X5BUx3MQJ2u/0xSbRBWx7JXFPXGVSGmS6qxfkb1kUZrcMle/JVmD2LHrXzoPREfKBeHs3AFgMrYC161JvrQxrE/shgdoSUnCpCvDNSZ2T5aT5ftHR/ea+J5dojhw0JbCBFpR5+FtNlXHsSm+qegcE1Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ogc1zeQ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D08/p0Qh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ogc1zeQ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D08/p0Qh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeCUo3884489
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 23:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bLBRbVjauRRI7q7UjOKnZctg
	JtzUCDz3Cs9ztedyGrI=; b=Ogc1zeQ+P6nm8k5MEBUmW/F2abR13RDGbM0EOUxK
	HeulK984U9JoQw5A1anyORtqSgEJMVzgJlUYxtvN9jOd3nEWlf8+jVEiXxUX5IXT
	o1iBsGGcs4J9ebNutX4eXGqoozdognG4O0kY60g4/EqnGH5Z8rjlI7t+b3SSR5g0
	N/rxEDN0WYBeUvbQXqSepgsamIuc0ziBHndb5xL166qQTituUMs+bi01l7X7kLfn
	JW1nBptm9Cgyv8XBnjZGMfZGfwXQEcnCUxhKao77CldyD5VImyUG3TtFw9r8wy2l
	4PQghiOR11bL4xSYIhu8k+1k/LyeEhq7yXpg0RgzvBYGEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp3wwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 23:49:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so7306785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 16:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790984971; x=1791589771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLBRbVjauRRI7q7UjOKnZctgJtzUCDz3Cs9ztedyGrI=;
        b=D08/p0Qhs2c8OpO/mdsxQDt9OJz0ZTAjLuSBWSRrJC77xcXdtsz4AwCpqUufI/2wF2
         OreBBfiPJzy4/pVV8/ehr40TITPg3B91zoZe66MP8E7tPH0YeLBDAMTHk7+2NfQWezLl
         e0o1Aeq4LCTMJtjiLtJbV+UEF3AejdueFBdLfnSVXzKDVja8ryI2VmEQdTNKzzj9gVZz
         sO/UihBiJg70S7tPDqG7qLBE5X5c4Qwx9N3dADWO73xB1mnbyuQijyw7LRkHnMcuKSeR
         FoeHk6YsKfztJhJ48oUoLsdcivKuEBWPVhm+f1c+f2BU1UUZCrarFIdS/hEM0KHIpRsT
         eYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790984971; x=1791589771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLBRbVjauRRI7q7UjOKnZctgJtzUCDz3Cs9ztedyGrI=;
        b=ncNdz1e5W1pGsjq2WUEOCeqGVt16PXQoYrX58N7ZhdxiiGz9IpC44x2u+5qIhGv/t9
         Krb4GI33CesXRCRSPVVacREu376F9beQL1IvRE+7fczW3bXJrnA1UfKorGM1ehTbeAvA
         WVFKu6fGX2zITyQZLgsjX9APQpbDIiWxSeSJDP6F42w0MoOieXhmrLQnx8khz9nK9S/a
         X8MmOiJqqXu+4NB0eNuh0UYO221587HpEvgZh0kY7yOUb9I22qxfK8mr9nUwYb6PR7hv
         XvHzsdpWc4NWI1PfVlEZmrXKVkJDepywGvWR/iSfqg+l7qL3KiNgb/75v4aczFONncHC
         nqWA==
X-Forwarded-Encrypted: i=1; AKwUvBxQP++n+T1Rd5yugUPyK5R7Rb3eTXQiDdzj+K/CiEi+GtmWxs+vzZwHAmsnvgYqg3N0aZnRczRw7ocF0+Oq@vger.kernel.org
X-Gm-Message-State: AFuF++m8qt5eIrSkEJVihn20Jx0tseYxvpXDVnD1y2E3PRvnMbk4FeFS
	i+qAJ4kCeo5Vsf5zi1Zz4dkr0n+6yFNeAWOskw6fgVIrKwEqQp8wxf4twxjR1OYMF40sWl3IzZ8
	GbjQXv/MVjzL53k0/1N5DXictQPmCtWy7vqix4oqU9xzFqJ9JjpcxdJRTVWkghFm1rz6m
X-Gm-Gg: AYBFou1s1wDBz+tYB+0tntbVLtozUKTAtYRVP8YjXU8TowFrP/esUh0370VI1hccW2i
	aMb0mQNEESCDdHkSlXju1BL0uq3mT5oVsC/JwWyiNyAbGQwCIjImQDE1xXMWg6+xZ340mjsgkca
	G2hLvFWJoK4F9OC6DxMVmvkcxMo2Otk5O+2ocokLSl2MFT7sgMfINURGALiT5j5n6sjAT9tojxN
	jVAuk4fcaj3rR7YcVlYhnPXYjoJSZYvV1+F3WbDOgEEtd7ANbK2FwFHLDz+Z90u0BMaeHGQ3anu
	A7oGCPvhrL0fo5joq3zkD+e7kWEzhKzELg/LtypX1Uu/HJ+y9AkSmEFIvCt/PhrH4ZSILy/Xhs0
	ejfPcEhOQZVAHS/m+ipjWVSe3ASk9e6tolhSfiHY8HnI283XIzUnRCDt08yhM9d6yiHvJIY60RD
	6WwCOKwiYABkSX
X-Received: by 2002:a05:620a:29c8:b0:939:78ab:3c5f with SMTP id af79cd13be357-93ce7ab3b10mr873957585a.9.1790984971134;
        Fri, 02 Oct 2026 16:49:31 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:939:78ab:3c5f with SMTP id af79cd13be357-93ce7ab3b10mr873953285a.9.1790984970627;
        Fri, 02 Oct 2026 16:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e310343sm14146231fa.29.2026.10.02.16.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 16:49:29 -0700 (PDT)
Date: Sat, 3 Oct 2026 02:49:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/atomic-helper: tear down HPD/polling in
 drm_atomic_helper_shutdown()
Message-ID: <apoihcgomlbupimnlvh7b43jt4yhvcyrsdrfjkvqy43onjtbbn@gf37mvuz3keo>
References: <20260921-dpshutdown-v3-1-e456ff7fbe4c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-dpshutdown-v3-1-e456ff7fbe4c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6ac0430c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Xji6uK7NKlMfkFQx07UA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: euwbIAU0KZHoB7TbBi2m9iwR_ySGjEQ4
X-Proofpoint-ORIG-GUID: euwbIAU0KZHoB7TbBi2m9iwR_ySGjEQ4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfXxS41/HYujIs8
 +1nKKh/EFVFeqorw3lZGp5ai6DpoC2DTYVVKUwlF7frR8WjpC4bQGqgXdx+gvd/Xrx1rCO0xpQq
 AwOuI6CRLYlTEMhIdeikQ9EymmIil4c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX91mdXX4NAZFl
 hKjGPxJcE8rTkk+wGglGS3shZ8aWVZlZ/K/DK//VKiELoG71BfMTI1iWW+kPmo2F8gDYWatA6Xm
 qfZwQ4yFUKe72pLaBmBEzveIIsSJpQp0huVQ1e9614ch7xLouOIH2VOcuN0Dw+aU/JZX0pYkRDr
 xrnnp63pVGEOhq69HplrO0NsEYcnui5Eif+Hk66Bz+y54dm3acbVeCPAct4QU6728OhaDd8qla0
 cQbPszwsI/iyZH9qYW49ldCd2zrTYxm9pNIoUr9J8z8jtGVEFM/LiTk0kaODJET2iPZ6rPKx4XZ
 o4js7u1/LTWFrhlf+AG9FIbqhrviE4+Ul7mwPBdL/kHB4IFKuy6lAF0344LEJfjc/plDK/T6bP4
 BJI/fGCs+KY4MuKIVtxMwjVf1XBIr/STS9rfVjARn/or7xkTgH6yC0KqTLkBtO5Y6RAN5WWDCmQ
 aEyzp6Vzg79un1L3ngw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020095

On Mon, Sep 21, 2026 at 04:49:52PM +0530, Mahadevan P wrote:
> drm_atomic_helper_shutdown() disables all CRTCs but leaves output
> polling and IRQ-driven hot-plug detection running. On reboot, a late
> DP hot-plug-detect (HPD) IRQ can fire after apps_smmu has already
> disabled translation for the display subsystem, causing the HPD
> thread to kick off a new modeset that drives DPU/DP hardware and DMA
> through a stale IOMMU mapping.
> 
> drm_atomic_helper_shutdown() disables all CRTCs first, but a pending
> HPD IRQ thread wakes up afterwards, reads the DPCD, and fires an
> unsolicited hotplug event that triggers a second atomic commit
> turning the display back on -- right as the IOMMU is disabling
> translation:
> 
>   systemd-shutdown[1]: Rebooting.
>   msm_dpu: drm_atomic_commit: committing (shutdown disabling CRTCs)
>   arm-smmu 3da0000.iommu: disabling translation
>   msm_dpu: drm_dp_read_dpcd_caps (late HPD IRQ thread wakes up)
>   msm_dpu: drm_sysfs_connector_hotplug_event: DP-1 hotplug event
>   msm_dpu: drm_client_modeset_probe: DP-1 found preferred mode
>   msm_dpu: drm_atomic_commit: committing (unsolicited, re-enables display)
>   dpu_crtc_commit_kickoff: crtc94 first commit
>   arm-smmu 15200000.iommu: disabling translation
> 
> Call drm_kms_helper_poll_disable() to tear this down: it stops the
> output poll worker and calls each connector's
> &drm_connector_helper_funcs.disable_hpd, which for HPD-capable bridges
> masks the interrupt in hardware and then waits for an in-flight HPD
> handler under bridge->hpd_mutex. Suspend the in-kernel clients as
> well, so that a hotplug event which still gets through is recorded in
> client->hotplug_pending instead of being probed and committed.
> 
> Reported on Qualcomm platforms such as lemans-evk and monaco-evk
> during reboot stress testing.
> 
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Though I'd really wait for somebody with deeper understanding of this
part to review it.



-- 
With best wishes
Dmitry
