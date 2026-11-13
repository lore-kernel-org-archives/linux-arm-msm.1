Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592104;
	b=IJr4JhSF71tWvO9bvug1DRFT9qG2RBNGJX899RwLvrxs0cNi+k+t1S+fJ9e75MW5WIud
	 6HHUTWmSCFSAMZJiox+gX/jPOxObH0hZLWhnpYE7xBVegwqsPuplxmeAvPfMlDlLddiQ2
	 x5m+5LqtdjVTqrqf3b30+mPcyxIK53S+4WCHSYLEwSYm00QClv8LGJwjCJDkxK5AAUd82
	 jO3Vdgms073wb+9lIeLKNbGBJVf5+8mLQqxEcAE64goUZnJJuOFCii31FEgIYnD+2W3a3
	 G3CoKKgtbUI/D6DZ7Nh/CKVH2LLQsjLklj5gCspKRICOF1JrwJkPrGZi0hseA4TFyXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
	b=ZrunQodHHAe3WP3DEAz+pGZf4R453tEgbnSjU+DvyZbW0+hPG/Ps0mbg23HKT70/RqrR
	 dvxbUvKeqtJTq1qHOAl9amCPGxfcD9GH7CcOt8DyZocFOY+mAc2/Y8X2rJxMQrck8g8sp
	 4Y+bPkfgjFFaVE4iw33EBqFXMGVztyS8T1nUxfbmTGCCLSR4RH+AokfZIhE8ho0+0+B7g
	 Klk/Pv3/1pkts6X8xJtB5e5KhkLDAIgKBiWPxLeH900ijQaXTcKryoWkG2tTIrcBhsPal
	 HvqQAXGuFppNximI0aCjy+TdJGWsGcIH96e3JymrzpRDMKDH5omb1PhT3GHR18mZWWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BMatpwbj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyXx5eHl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D98606EDAE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D98606EDAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BMatpwbj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyXx5eHl
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQpBO074616
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=; b=BMatpwbjJXhz7tmC
	ljasbfmlGO95hnJLqxJOCrP4eQA5/NxRquVwQI3nLTw2AQPvJfq6nrHByqab//Or
	5cbUlGEvb4Ay1pzSqsgpN9VN66PuxfhxglCSwt38Bcz5q4qZEJMmu93sMzSrplGf
	jpt5AhTtjiAuqNRwyv3gZisR+GTvitPePq3x637xstffZODbFPHWA6ygF6EFyNef
	NImCZYdSZCXJxJ46T/kfSXeFigDFJ/2LEFXabR7rv3oDAZ/HTgWrm08IPCrIHaAT
	ZCIYO+VDeRCRqlUe1Kgnhgr8042q0MdFVDTRgX5Ceh4yC0Ttwb4HqH4Nq7uJFu11
	UrX1zA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mtupj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:48:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso1037567a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592102; cv=none;
        d=google.com; s=arc-20260327;
        b=L+AXQIetUbQG+R+O2YdUlvR3n0dz8RZ9NT/pEI6zAuy4UcthkG6KTI69IoufJmIdxc
         jI9W11z6tHlWt9j4hKty6ZBQwPnXOD4zSM0GAho77iYB+euEEosTPjlPCMxu+unKw3/T
         jxRheWAcsBsOp1PRfN98iFL3ZeX9ElcItNxX0e+EHpQSeld7aCqo4lO3y8UB4lirPqYb
         IxucvusPyWjLahGo7Ey83vrx3UpFCnyw1i5bWqiB6uyif/N6DGhNIreOieqY+vY0FN9u
         deKx1sATxaHcHQKTA/7XbSiWqjJeBg7VsuZIlANJUXISIGwlxS6/q3FbmwVakIylwhiF
         XXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
        fh=J/KNkTQ45uTeCq5YqBPWlPjinx+fNp53GCGogE18DlU=;
        b=ilCoO+LHRdEwJtnhDNsRgOzAnbS+twLobjdfBkE6gU5L/JC4Di3DXlBIQRvBQrRL9d
         Jnm+1GDVq8oZ0o656REe+YxLBGJHBvx1lTxGNlbP76ArDUfGJTR6BzOa1wgH5/J5JHV3
         vJ1kbhoBuLA7Nkkp4DhjP1Yuc9CifpZnqeCwe0DMg8pM2LUCLcVyXKTFLCNNEckcCx1m
         PnjS1swacP4/e93SEY1xFJSiCpKxYFSTxxO3u7obIz0HI2C3Do+L4Mjr9ffXVFSk7DZ/
         mMl+NRJBMIPRCPgwZureU8s0LmbgXAoN7Qziuksobk5iVFYM/IJHgRVQfSXcOWNqzRDj
         j5Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592102; x=1795196902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
        b=eyXx5eHlWjvxQ7pOghP2ubvUgEExQgX0/gUBQbUpxTN49gYoxLlNmvm7INGY7PZJcY
         kT7DM47eXITsRGRSwJejVust9xBILN+xYTdIu8RgBgGwbzR38Hwe2paJ1xryS7cxdjWx
         TzD7+ZzmfWWq+wImSmNtgZYNhJsZnoAhWVPUf+UIdDFKkzLDQ6wL/g8gP4stJ740NlZ0
         +OQ2ucpKq9djWPRPDZRA7Pqs57bQKv17vgmqd31N2O1wHsu1lWeBnrkvTTEUCFuYRkHr
         tuEr0ezMWBgDxZzoeFzzt/TMipnZhAiuPIjCQdIdwfYtvI68mVtQmN5B/bnFWQhU1xd9
         INpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592102; x=1795196902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
        b=MG1HquWPDwuByd045ztOBUEop/q3n03LL4Eipas1JCoyMJsXcrKl4joyUO1dXMtCow
         4Hije51QJL9Xcghdpzk35aVZ1Y457xL3gRjqUwl6c+hA1YrMubwfLmfeuXJl0roCaDM6
         hnm+8P28baOkQy58OodBAd5DkoQkkHxTbo3HsvEE8czBxzv/2q9LXBH4v+fQW6Ov0c9U
         TQPcSYwPhMcHUHde1hEhCD05tPwpQTBoRx1n2K3qspwIUooO4d0kHUwnWlEgJoobxJk0
         a/UVCcXeM4aRwegp1T3coo7YmKiTVjLApqHXy8jSHPaenoGF1J5CwjiT1cRxhE2TTGJV
         GY1w==
X-Forwarded-Encrypted: i=1; AL+hErGkr6dgFi3EVGy9tbkrQXrhTpD8BOSUxKZeLJF4Lw1giF7pxhSbvjhXNv4uMNv71SyoHJ2SdhNNnuQNaAFE@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vm3Qa3C5Ne7RbM7C301LgMKT00kTuox1UeKpcAL7QkITrF9oT
	AtWuDr3kP55oegjds5HWBrJ7Pyb+YeAnfMiIGK3vIfuWZ46ZVu0xAgT5yaHW26YFeoDgs4QNHCm
	RS94GiKBIg5u97NOJ8HXOCxKW+GzMM4F5ek69iz/tJ98+8KrlbzVT2Nr4qrBO+vk4qcAmSs2MSt
	nFOcBsorTYcz39YLUvMgtgUZQr0pB5VE+5gh7i+clX/UM=
X-Gm-Gg: AYBFou1X3DR5FqJclusYGW3BigEusCzP3libPTxFtbobkiblkyt1/hqGS8RDMSJMBtE
	QJw7qSQHiaCL/+lgh9GPOfOnBp8yPvY9iHXQ9fZTda7YPOdmtL8Mjr3h8Jhp4QvIhGsZFr5S2M8
	sk4HRebwKyQql4wyA1CE1oQV2ux2LhqkLnaoJIkNivl1AuhUA/Wka+gpWXWw==
X-Received: by 2002:a17:90b:993:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b1b09fa555mr2052187a91.16.1794592101964;
        Fri, 13 Nov 2026 09:48:21 -0800 (PST)
X-Received: by 2002:a17:90b:993:b0:3b0:e2a9:3466 with SMTP id
 98e67ed59e1d1-3b1b09fa555mr2052164a91.16.1794592101492; Fri, 13 Nov 2026
 09:48:21 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021080517.2161-1-okerixx@gmail.com>
In-Reply-To: <20261021080517.2161-1-okerixx@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:48:09 +0100
X-Gm-Features: AclHuK_cX9nfIfMsECKx5geydS7UVI339oofu71FfWZMTLtQ_zkBB1Cw2kA9Opo
Message-ID: <CAPx+jO8N4yLD8pZ2vr9_3MD9==FFMdvQG+=1JjDoe2kG7DR1iA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before sync_state
To: Oleg Keri <okerixx@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Cxn_6XL731lhiu8CoSLeDgqWYJFIuzN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXye2O4zDSAS0m
 cTp4H+OKyVBk1BdCu02BLMxuN/eeBpmFY0t/shrOlxe8GNf/LO0M+m+WflWYIGUBFbaL8UQ3ca7
 OTlrelYVhGF3dQv4CaIJD51Xmfh/3aui6l3IBYL8iM67UfYMKAx8FKwxGEXrKzA9Ka739TFAJsP
 Wz3y5h3scPXtKpxwM4ql3G/Gfsb8oVmUSQ/01N29mzV25Bq2QxzXdRjP/oIhw9RVdymqduJb+0q
 Tmnouc2ofsUyj5KGavS1tcCKv+PL53+NZ1K2H6fQ+KfbnYWkuDllzPel222cZAJZYn2twumfOxT
 TS0Pv28AIN8j7rkvYy/Zwww97gA1X+NxXWWxGgGI45hHjaXcPPxWfMOx0LoIUXLrrpWTmC8IlUS
 mDwdnm4s0jHUwrHpjFlLXR49LBqa0xCr2h3UevC3WTRtg2AeI5gDhuCBpTJEU3/zY6o+gv+ERdj
 7B6b1WHUowmHTV1Nhog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXx+BIY6TUgB4u
 a7xpqrnCgv8nzkuTX9yGHFwRzpp5OlZLNLkdZg5r6FSIQIR3Li33yw1EEg+atoo2RrZk26ssp9K
 wYTq2zpVRgw/jSq5s11aPN8VPEBSqXQ=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af74d66 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=4GocJDDa9GRkIFf5CVIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Cxn_6XL731lhiu8CoSLeDgqWYJFIuzN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On Wed, Oct 21, 2026 at 10:05=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrot=
e:
>
> Until rpmhpd's sync_state every vote is clamped to the highest corner,
> so that hardware the bootloader left running keeps the rail level it
> needs until its driver takes over.  Nothing the bootloader leaves behind
> runs on the GPU rails, but the clamp hits them anyway: the GPU clock
> controller's probe runtime-resumes and suspends its GFX and GMXC
> domains, and from then on both rails are pinned at their highest corner
> until sync_state.
>
> On Glymur gfx.lvl has 14 levels and the clamp holds the rail at the top
> one, 0x1d0, while the GMU's own performance table ends at level 11,
> 0x1c4.  With the GPU driver and firmware built in, the GMU boots long
> before sync_state, and its CLX DCVS calibration does not survive a gfx
> rail held that high: the firmware gives up with HFI_F2H_MSG_ERROR
> 0x007306c7 (ResMgrCalibrateDcvsLvl), the first HFI_H2F_MSG_GX_BW_PERF_VOT=
E
> times out and the first GPU init fails.  On the Lenovo Yoga Slim 7x
> Gen 11 this means the compositor cannot start at first login.  Pinning
> gfx at level 11 or 12 instead fails the same way, level 10 and below
> boot fine, and pinning gmxc alone has no effect.
>
> Leave gfx and gmxc out of the clamp: they have no bootloader-configured
> consumer to protect, and the GMU votes them through its own RSC.
>
> Fixes: 93b6c8d10fad ("drm/msm/a8xx: Enable CLX feature on Adreno X2-85")
> Link: https://lore.kernel.org/r/179248663855.32151.9955864156939592299@gm=
ail.com
> Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

@Konrad, can you please confirm this makes sense, at least short term wise?

Kind regards
Uffe


> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index fa8fed5bd3e5..2c9d4beeffbe 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -1006,7 +1006,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *p=
d, unsigned int corner)
>         unsigned int peer_active_corner =3D 0, peer_sleep_corner =3D 0;
>         unsigned int peer_enabled_corner;
>
> -       if (pd->state_synced) {
> +       if (pd->state_synced || pd =3D=3D &gfx || pd =3D=3D &gmxc) {
>                 to_active_sleep(pd, corner, &this_active_corner, &this_sl=
eep_corner);
>         } else {
>                 /* Clamp to highest corner if sync_state hasn't happened =
*/
>
> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> --
> 2.55.0
>
