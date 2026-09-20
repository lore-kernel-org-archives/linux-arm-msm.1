Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C21F2DF13B
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 19:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933762; cv=none; b=BmsuFtjCCiK9iBrUQc39yPfm8T7DCWNLRD1tAwnb8D+7ut9I84k5YrJXOAawucm8L4SJCI4VMTyH36hMlqTvvU7VHqsbCQ9PHeOK1UGoLrI70Py2stzERVLdgVSfHvBgIBuJhwbVbNA5vwTAfXAKv9739xHjKIFaWEW9riM6mYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933762; c=relaxed/simple;
	bh=quFX1aFkvJvz+T0VKtrji1oytkvEuBXXLDKbVGFnoQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOV4rE3IZar+OWceoYsdh2fiOWW5CXufc/fRqqcSvL3g93DfLUTspng4rI3acPsK1tNHSy7jAh5nddHUXrB6RprRaSZ097RbHKDyZkd+/FeZr1wnmB70U6nlauS/xOQhy1MVRd/Zn0uohbLIX1Ou+FA2U8E03D3N16bql4E+LQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYLvyAiG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEh7ziDF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYLvyAiG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEh7ziDF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KIPWIR3364966
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 19:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kN1XzqkrsnozqAy8F0wIjERK
	/nhOBPDqhZ16AqCNq3o=; b=OYLvyAiGpEm5YxExFapGaa2hZjkDLNSeP25nSuDH
	gJcxSManSNkKIVM8mt4BNxp1ot0rJvRYcG906fZxl4L4HMa40P0iFgtq3RitWJn2
	+OmW2ym84B6KnKyYHaJ/OX+FjZoG9Yz1QtAjRkPj5yvvVCgPk0h+qvpyN5BXBcAE
	nT5TGJJr0nQzUIXhPvVwmq6EexEedB9nc1dbO2YxtVkFgd+Y/fb3xRXmU3VWBSVN
	ydgMwhd5cJXqQulr0EK5Iy8DBxZm8tfKZ62ksGzz3buFQib2dDeev543C5MfKW8j
	6IchDEF2c1dZ/5GF3TWM0YBnU+gaiSib7T/odUwQCOR/vA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfukp81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 19:49:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso34627855ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 12:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789933759; x=1790538559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kN1XzqkrsnozqAy8F0wIjERK/nhOBPDqhZ16AqCNq3o=;
        b=UEh7ziDFcVX1H4s5sHCoXc+s8sohncCc1OWm2myEdvO6UVViIhy20Yo3xbdWIo/sKN
         nH84WDF03QJy7hid5yr7WOvfjqM/xQSfRkWtcZERqN4Xm7eyf+IzrOyS0Q0OsUMm4PJC
         OibpO3pISDTH5J/ULQkPZwMiqO3PYrm8pyQ/bCYqQiNlOTjDlrqdqyxoOkX2Vg/24LS9
         uzgrOkLvihr7USmvQBHLmdJ4LWXpMIjaSd31Ti/8GwQabgAGEX9hnJ2pryoAKM5EHhen
         kEDYsnOc8uNHcjfoILj46y//IzqxnEkURdTGMTJNyAupfLtZgykx/3OFiMjvE9XtNcoW
         e+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933759; x=1790538559;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kN1XzqkrsnozqAy8F0wIjERK/nhOBPDqhZ16AqCNq3o=;
        b=iqm3XbbxYqH96TnjpZc1UmjPWS9ardiehDAJ9tw2To6R5qQC//dFphEX+PsJWu3xWp
         81K3/j2SIjzXP1v8o+AuinuGuqTo085azNwJ5RdfP05JLd2YTggrjR1frdnslJQfW8Qc
         bJ1/Ov0Wor4Zsv2Dt7wHh6NfIjl0EW9wuCe3v1W+d19E1pCFKFjaZvwPnahQjERSkj3o
         yuHdIK39i67elVtiL4cMbo2POkbNf3v/0W/ulnQ36BhvC+rAeLDNL1V+Geu5z3G8I704
         k0BEwUhDspcMG+CnxYiZZxNYmj1z/TzaRcnnp+thdbZYkWDgFzySbeg/q46t2WR/c/W2
         KSjA==
X-Forwarded-Encrypted: i=1; AKwUvBxjJ/T2F0LK/E/0MfMdk/nkOeCh0Fu5IsdQKMbStBTsxu7Nh1YqpgNl0iK30MlfrHQ8FMs1q4JsoHVm0+4s@vger.kernel.org
X-Gm-Message-State: AFuF++m4RzndF1fwYKpZAmfviSX98PLyU4XErMsX77H8zSj25gkuzAb9
	1wFW3CjZ4dYXdxObRcjzV15YlIKy2HkqW9xOzI7UquVIY8qjoKxc9Tu6LX9x56kKyomf6PjKCwz
	RpGshp9xIU+Y3G6SeF4ykEZswA+XiIl3hc+XokNN0wS2cddGtaS5gZ1mrbkedZ3dQZ18E
X-Gm-Gg: AYBFou2n46Mp6MLmiwEDUrZoZV0Nm/cye81GzJOieuodsnjAB/D9UT1E9u+PvXM4GAP
	XZkZ0edhROaafsoaREOWJZ9mN+M/dJbpVJC7fJl09VRBReUt/CbWUxRhUvpBvASVSy0i5e7ykjF
	bPRq9q1I/mxnoDrCwCyXhKOOkmWV2dS+KUjD7cXj9BkdGxS3g1q+TunJb0+FQWSG0ImSohr+1SW
	o4g6N4BFXgzESCRMLEzsArKEEI4P59FAlYH2aZJQADmibZJgfOUMlqx2pmN9dEM7NjBqcS5zCDN
	EUhd+5R9oZtIKPXc+/1jvE8ad3xbvdgZilHvtn0xRq61RYtQ2rQmPRN8MZ30svsdpxA9uBsHMmz
	eRncjixWiPhHZlb94GD59+yEMcvi+Vg==
X-Received: by 2002:a17:903:1448:b0:2dd:c100:b2cf with SMTP id d9443c01a7336-2ddc100b3c9mr73133765ad.58.1789933758791;
        Sun, 20 Sep 2026 12:49:18 -0700 (PDT)
X-Received: by 2002:a17:903:1448:b0:2dd:c100:b2cf with SMTP id d9443c01a7336-2ddc100b3c9mr73133585ad.58.1789933758252;
        Sun, 20 Sep 2026 12:49:18 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33188f76sm12668745eec.21.2026.09.20.12.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:49:17 -0700 (PDT)
Date: Mon, 21 Sep 2026 01:19:12 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode set during bootup
Message-ID: <kw6zczrvk4wsww6og7pukn62ylxxpn3lj6weaslfdjkcmoov72@pyp4y5tgbeug>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
 <20260801-b4-read-rpmh-v5-v6-3-9fcb54928523@oss.qualcomm.com>
 <0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com>
 <nafsznahnfbnyza3w2cchxmv3qf4st6pxfaompntximnacjqbh@s5f5armjuhbp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nafsznahnfbnyza3w2cchxmv3qf4st6pxfaompntximnacjqbh@s5f5armjuhbp>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDI5MSBTYWx0ZWRfX8cEqLwZK13jh
 0LkVIQCN08sdPAzQW8+v4u8UGdTMU8cwNKN+69r0j+um1cWxRIGg0aNBCMUzC+Ts2XnxhS23lFO
 2K0zhbtWmr2vCg1Ereu9UJw0nNdap5I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDI5MSBTYWx0ZWRfXzKh/gKRJphiG
 v8EfdiNQfa+82Q+KxPPWV6Fk3eJZRo25TFUfIPexjZQ2g9xiXVkRVV7rXZZuQ2WHAhxUTWaAPzQ
 x3f+NoEIAbKin4PmSrDt7y3GN64u5sT1VcdI5/nKTnziALM5YVecjgJeYWcpuSdAU/egKqmQ2Lf
 grtZKvkAYwehTYO0POOU8uq2FzHqzhPoHoafQs6FU2Ooex7T9/te1/PubeRXBcdwkGWt6ba2szB
 mx3f1ipa6oS1fPHWn4fQeQaIWrbmh5qVYDddNit+Y9CZqkt9493/MlHKRCN0doaHeq1/cBxUnIn
 ZsA8OVKBKc24eKXGHBwhvnSm4CMY9/y++Jab9D++KNQj9A0SOSN6o3gnzVtAV8+fLuBJS0Doy9F
 rYREFT1DXhsqMEdzK5C2TBxz98FdFPIODyeaJAgYbTjybD9fueZeEVYxTE/GnDP45LMQeqmlbkq
 39LnK+aBBPcpZj8uYPg==
X-Proofpoint-ORIG-GUID: 8kR_o7xQjgL89wrjRUCpweGdVAgNoltT
X-Proofpoint-GUID: 8kR_o7xQjgL89wrjRUCpweGdVAgNoltT
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6ab038bf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l5Oa7c836GIkVo_eR0IA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200291

On Sun, Sep 20, 2026 at 06:45:13PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 01, 2026 at 11:49:42AM +0200, Konrad Dybcio wrote:
> > On 8/1/26 10:00 AM, Kamal Wadhwa wrote:
> > > Currently, during regulator registration, regulator framework sends an
> > > unnecessary `min-microvolts` request for the rpmh-regulator device. This
> > > happens because in current design, we do not have a way to readback the
> > > voltage settings that was set during the bootloader stage.
> > > 
> > > Fix this by using the rpmh_read() API to read the regulator voltage
> > > settings done during boot and make it available to regulator framework
> > > from the very first read after the bootup.
> > > 
> > > Also use this API to read the mode/bypass settings as well. This will
> > > provide the regulator framework a sense of the initial settings done by
> > > bootloader and thus preventing any redundant writes for any setting post
> > > bootup incase the same setting was already applied during bootup.
> > > 
> > > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > > ---
> > 
> > SC8180X Primus hangs with this patch applied and so does SM8150 HDK.
> 
> [    4.015947] cpu cpu0: EM: created perf domain
> [   14.216480] qcom-rpmh-regulator 18200000.rsc:regulators-1: failed to read VOLTAGE ret = -110
> [   14.216731] ------------[ cut here ]------------
> [   14.225298] ldo1: Setting 1800000-1800000uV
> [   14.230090] WARNING: drivers/soc/qcom/rpmh.c:441 at rpmh_write_batch+0x190/0x2b0, CPU#3: sugov:0/113
> [   14.230135] Modules linked in:
> [   14.247173] CPU: 3 UID: 0 PID: 113 Comm: sugov:0 Not tainted 7.3.0-rc3-next-20260918-g7afa080bdfc7 #5098 PREEMPT 
> [   14.257742] Hardware name: Qualcomm Technologies, Inc. SM8150 HDK (DT)
> [   14.264472] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   14.271648] pc : rpmh_write_batch+0x190/0x2b0
> [   14.276164] lr : rpmh_write_batch+0x188/0x2b0
> [   14.280679] sp : ffff80008180b740
> [...]
> [   14.357986] Call trace:
> [   14.360529]  rpmh_write_batch+0x190/0x2b0 (P)
> [   14.365051]  qcom_icc_bcm_voter_commit+0x33c/0x500
> [   14.370016]  qcom_icc_set+0x20/0x34
> [   14.373642]  apply_constraints+0x78/0xbc
> [   14.377710]  icc_set_bw+0x22c/0x480
> [   14.381337]  _set_opp_bw+0x50/0xe0
> [   14.384879]  _set_opp+0xd0/0x5fc
> [   14.388244]  dev_pm_opp_set_opp+0x70/0xfc
> [   14.392401]  qcom_cpufreq_hw_target_index+0x10c/0x120
> [   14.397629]  __cpufreq_driver_target+0x1f0/0x388
> [   14.402411]  sugov_work+0x58/0x80
> [   14.405865]  kthread_worker_fn+0xd8/0x4f0
> [   14.410025]  kthread+0x134/0x140
> [   14.413388]  ret_from_fork+0x10/0x20
> [   14.417106] irq event stamp: 40
> [   14.420365] hardirqs last  enabled at (39): [<ffffbf371a8ff250>] _raw_spin_unlock_irq+0x30/0x64
> [   14.429336] hardirqs last disabled at (40): [<ffffbf371a8e8a80>] el1_brk64+0x20/0x60
> [   14.437324] softirqs last  enabled at (0): [<ffffbf37196e8008>] copy_process+0x8a8/0x1e64
> [   14.445758] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [   14.452243] ---[ end trace 0000000000000000 ]---
> [   14.457163] Error sending AMC RPMH requests (-110)
> 
> 
> > 
> > Interestingly, SDM845 DB845c doesn't
> 
> Neither does SDM845 HDK.
> 
> > 
> > I think we may need to opt some platforms out of this..
> 
> Would you send a patch or should I?

It seems that Maulik has already sent a patch to skip reads for some platforms.
https://lore.kernel.org/all/20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com/

> 
> -- 
> With best wishes
> Dmitry

Regards,
Kamal

