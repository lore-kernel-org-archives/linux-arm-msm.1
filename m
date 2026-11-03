Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717896;
	b=LVKGEoAMtlfVHTJ4/hYHTHsRjnohJbk8qboEdIcmxCYLQOdQLBUCTw4V7jJ182Uc8Xq5
	 y3S8U4h0BJNeN/gPO0AeyD+cK0/Z97ezudFYPLMI42Y2pQeksraLwnNH80HUM7XHamX1k
	 jty2F4w8ne9uVoFtN6vfDzM+0CWwN/78lI+ilK39kl5YlCyBmNHU0b5WgAsYJVcKn43fV
	 ZGb/cFMP9EwyyM5dtOoW4hxENFbj03oscAafdgBjfak0Lk1teiymmdbgO7t1+1QEqi3p6
	 3tbiK+x9+jA9CexnZD6XX3OE3gxdgKK8nOu/UFUcPcZALK1vV4/jBEHKobNnyaZ0lcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bpod83vmD8+b5six8nkD+H3MifQwihy9OfP3u2dB1nY=;
	b=NDlNxa9z6giVsoirQYgka672RF6QVioQ4JT8ugo5qYjX1xmASuw/c/xWshNS8HbSuKfo
	 bTfIrCP27Ru7zhRx5+QedahUr6ToHyMjku6fDdgnfd39FL8Q9/44ZyM91u22iI+ykO55o
	 xJHHY0JxOTfRzyvWNqKxzwPr05VA09CcevA/IV0TOGcisJPetkuFMMINmOzfWEXqKpO4u
	 Ki5pbhcnnuELEcGlIPCV+eXt8Tq/FVYykaIRMxgGraR/7+H6PNvMKgSW4N8XiBDltzb+7
	 FV1shp9lD45GX4BFZW9Q4yhRon2Hn/iEsCievtv4jyvEjCOpxk0wwi1efYg+Qjst1ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TUE/mQJ5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IH3oAEdG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44438606C804
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44438606C804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TUE/mQJ5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IH3oAEdG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA71M3048981
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 14:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=bpod83vmD8+b5six8nkD+H3MifQwihy9OfP3u2dB1nY=; b=TU
	E/mQJ57EWkOciSfHqXbEljCXj4YQ+LeMzgJqnoGcvwiAjXinu/xJq81JNwv21b4I
	yu4Nz7YPi+aWs4zdITnRGhOrcV1L+3xxjLWleEKn3/QXCySfHcHjSyaGQSYJxia2
	/RyO5eO/wtFWE0BJOv/XL3juMHs4k6rROjNji6ved77sl8Vj8fUWGOMglXL+V8VD
	E+kFHq5rWwAGHhsWlPFVdz43RRWxElf5jrWz0lIk0PfoP7h2/0je32nj5E73mXrz
	RS72qMkRUOgsYSxFkN6M3SzMjqe/Cf9qrCPrCSbhxLbQNH1dHL4SNf1SaZa0zGFZ
	uzOFsWvZ2L2DHW0nFpxQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5k7v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:58:14 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cbf700ddccso3660040b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717893; cv=none;
        d=google.com; s=arc-20260327;
        b=ctmegBKhRRbQNZ2VkyPzr0CmiSglKVtN6G7FFXHF05VWDrf3XQT71FuUX8jgV4v7bU
         Poa4Q8crwbhbsOnQInKFLIjrH5CG0RwJ3R2yofsp8GauhO2XT+E06G1iSVoqSQaoEgHa
         aSdoiiEuVyk0jU7g2luvFxVPE9+WiGNE9d0VVQNjrH+8CzdG9g9Yxn70HGaxRkhU0EW0
         dPSN9iQ0yrnhCmO6gFqOzQbInlAPcJqKMvhHY5+TyKJScr9FtB85dmRTv+iEE4w3XRkl
         e86UzTIbhPXar7sPYGdmaDQdbySugHZtkSQt8ZF4yl5S7DBZEnDv2wY7mZGkeNAa9YwF
         hQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=bpod83vmD8+b5six8nkD+H3MifQwihy9OfP3u2dB1nY=;
        fh=THT42N/fYQDib41wHkBr7amO8BBE9cJPiBxbBje35o8=;
        b=Kd2s4s24+oS+YQbWhImMGh4SQjk1OJ5n91Gayi9VdvhDta2/6vKDAORse4R0eLm/da
         tj26+Oi/UCTahuYiRskEohjXUxn834znzOObPP9MKfkajEIkTxfEfRTaSfoPjOxNEksw
         RbOfILLyd56aEChn9tACEf3kqC2X7hJpiVLMk/tkxS3G5vmtOqI9yrEZ7NUzcNHRrcQb
         zuPCkFiw1w/K2gxn+5+DGpCz2pBvOhCIqyCyT7ynLOoSeBQQ40UP+5dSPALaGDEaLLGI
         0BanBeZrIm9/fshzRDiZ0djbXxEQVlrKsrhWCEfHv9uVN45zmMmZhbOQTp0srJMp8KiR
         BoGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717893; x=1794322693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bpod83vmD8+b5six8nkD+H3MifQwihy9OfP3u2dB1nY=;
        b=IH3oAEdGuo2ejEO1AQL4SaoY3ZS48tdPEYCyzNzxx4rt6He/EQKgCNrZwns/oHkNTB
         XX7HFIbs0LNZcmXnMnJMeY1GNREhadFwLEPVX2MFCeSeY96DpjvdIN//qOECQS/eTL+h
         nT6Y/d8PHrTCquszygKyd0vCCcIOtF8ANJqh/6UitNTeg+8gnxZHTP2Em/u2JJrzrKeJ
         fhsPCG+a4votOJO2tGtTBVlS0KuLUJM0CsDSCg5kfxSjYLaNLEjCqBw9NJQ0+1HYDl/i
         xM57f1uxSrQRZya5mCK7Hgwfz8eyVT5CYUTgklUm9da6og0FxNDp67wFazhmUVJxoJzA
         OLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717893; x=1794322693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpod83vmD8+b5six8nkD+H3MifQwihy9OfP3u2dB1nY=;
        b=GmMFYSCGrT2y/SQ/88BE2VFgNOz+9m5AqzYemcUrPnmFlMbu5BQgK45dqqJA7ah4sH
         8GgYlfsipqQg/rikpw+MOGAg/xP1KnuFaQGuXuIfLaclahr9iuZwrIMk5tDXGGythbzR
         DV/bBaN9qPUVjzwZD80FLYn/R3dIHWqvBrcwwOAPoZC+V8cKhSPH9a42RdlzJdCDlzqK
         buuybtdlW28UvSHnhb1YYLL9gg3BEQ4fswoGtZGK4mIN7lLCPG++uR/alAjpk/SoDqiO
         8WmDDzUW9n3S6WJFa1aZIg7aMbfJtZMPy7ftXO1qmaFm0GPKxnJpCe51a2UDcnqgI0oo
         w3LQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7Vk4HoScWHjRYmw6Gr/YjYwtqqedFlVOerpW1ov6yXthXp8wKqIUm3SvjLO1h7rvbx6tmTNGRBEO78WiV@vger.kernel.org
X-Gm-Message-State: APuU4Z83amVypmSUJNmfIGeIC4sojN9phb2VcixwpGSbxkBY1MN3x4RW
	MJBxRX5f7CvkRAKGkXQXEztkubMrObv9hP9/LfS0UfIP7RlwPjTNEbfsWQW0ExkbE6B0vmo8zIw
	zUWLNInqYVsGWn9iEWXzo913TOtEogwtTWTDMMAYKJTB1FrCuMsWETpgWd83BR5lmmZzi8mmWI5
	FcToDAAhbHq4isuhLthIqejvIIX3kmKb5Sy6O1wch5RgY2Hn8Sd58=
X-Gm-Gg: AYBFou2L3HOXKZcjdtXWk7AbPez3k2d7d+dXSCxQ+1RHm6P9f7qcloTa00aKV628l6h
	AbtWF6SN8AAReyu6Ychimtj7uhCdbzZitDS+Fa6ZtQSACR/UHzjqa+RYPZHR3AMw5E6U6U1Tcnp
	77KIZ3Cxi65XsWY74kDtYIcj1P/fpnCrNRzCcZ70M+DQkJE3JETEipF4eZnD8bRpFnu9fpYnfOm
	ryH9U52batIyg3euvP1Nw==
X-Received: by 2002:a05:6808:2207:b0:563:c491:8b5f with SMTP id 5614622812f47-5640de2851dmr8710149b6e.47.1793717893508;
        Tue, 03 Nov 2026 06:58:13 -0800 (PST)
X-Received: by 2002:a05:6808:2207:b0:563:c491:8b5f with SMTP id
 5614622812f47-5640de2851dmr8710134b6e.47.1793717893084; Tue, 03 Nov 2026
 06:58:13 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-4-robin.clark@oss.qualcomm.com> <a4151c32-bac2-40ec-86f3-59d4dbfaae62@oss.qualcomm.com>
 <CACSVV02mTpCPZ-JtyYrsTEsRXKyS3zuxTehx=c91NbxgQSdpUQ@mail.gmail.com> <d4b18854-0e02-4fce-b168-d4e80035aaa8@gmail.com>
In-Reply-To: <d4b18854-0e02-4fce-b168-d4e80035aaa8@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 06:58:02 -0800
X-Gm-Features: AclHuK8GTgB6Euj6Jgwafzumtco69LVrTffNhbBVo0jvz2_1fame7MYtQsB5bOE
Message-ID: <CACSVV02_vNP4wnSvk7GQF9oueQh_aPer1UdKcVHHjLg_0MYfew@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: bhbZRX8n3R3Y5Bj-pgh_I02wrOLRPPdK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfXx3ALE0S3Ibtb
 wEUqAqVFFBhBzYEc7LdLcvExD1/k67/H6AdMH2kEAdDv7y5gmeJVQyKIG4R48DiDj/wPQO42eWx
 /4YBmSsdDr1VDr1ccXJWo8uCAEg8c8HrSBD6Hlkezn7+1F0hGU03+PNGDSpOeLl8+X7PnH4rIao
 z0zr5LOUi7Pieg2IsoMwHo+xdr+p+HVamcz9eBZJ6PQ0xPrl+HG5xVs39FzAOpBd//GVvAebU/K
 O8Ut+LkUBr27cJczzqpsOmw7Ufv0UL9Fw5xkcAswU1E2JkRUllVbPZgySt6bOoX0EfbvAdVwagM
 3Vtm2O243JvddqZf4K0KajBCQm0ue+6unGAzA5EG9r1fM4QO3kexJi4Ja/Bv/RE8NPAL+7s/Ewf
 1xJO7GzdS+9BEKefOGog9xXLj8/GBBvikVDdc1NAbffKzqX4yfebDvFtPvhxslTmWTCfOQvgeB1
 vzkDrEJcX6pnbizQcXQ==
X-Proofpoint-GUID: bhbZRX8n3R3Y5Bj-pgh_I02wrOLRPPdK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfXy8L0EASsVQdy
 v22sm1F3XhO0JZtu6cpSTecuzl4XMtocjzJzOEoueTZhU+2cBPgr3nILucvjJvyCjnt31bm8cpg
 TcHMr+LJsO3joDBb5CxnxD1mP8ffa0s=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9f686 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=bWKnDnX5kYEKHeIC6Q0A:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030059

On Tue, Nov 3, 2026 at 6:24=E2=80=AFAM Anna Maniscalco
<anna.maniscalco2000@gmail.com> wrote:
>
> On 11/3/26 2:58 PM, Rob Clark wrote:
> > On Tue, Nov 3, 2026 at 3:28=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >> On 11/2/26 8:00 PM, Rob Clark wrote:
> >>> We need to move the gpu lock around a bit for the next patch.  Use
> >>> scoped_guard/etc so we don't have to make the error path handling mor=
e
> >>> complicated.
> >>>
> >>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++----------------=
---
> >>>   1 file changed, 12 insertions(+), 19 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/=
msm_debugfs.c
> >>> index f12701e286ec..aa59b28a3392 100644
> >>> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> >>> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> >>> @@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, stru=
ct file *file)
> >>>        struct drm_device *dev =3D inode->i_private;
> >>>        struct msm_drm_private *priv =3D dev->dev_private;
> >>>        struct msm_gpu *gpu =3D priv->gpu;
> >>> -     struct msm_gpu_show_priv *show_priv;
> >>>        int ret;
> >>>
> >>>        if (!gpu || !gpu->funcs->gpu_state_get)
> >>>                return -ENODEV;
> >>>
> >>> -     show_priv =3D kmalloc_obj(*show_priv);
> >>> +     struct msm_gpu_show_priv *show_priv __free(kfree)
> >>> +             =3D kmalloc_obj(*show_priv);
> >>>        if (!show_priv)
> >>>                return -ENOMEM;
> >>>
> >>> -     ret =3D mutex_lock_interruptible(&gpu->lock);
> >>> -     if (ret)
> >>> -             goto free_priv;
> >>> -
> >>> -     pm_runtime_get_sync(&gpu->pdev->dev);
> >>> -     msm_gpu_hw_init(gpu);
> >>> -     show_priv->state =3D gpu->funcs->gpu_state_get(gpu);
> >>> -     pm_runtime_put_sync(&gpu->pdev->dev);
> >>> -
> >>> -     mutex_unlock(&gpu->lock);
> >>> +     scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
> >>> +             scoped_cond_guard (mutex_intr, return -EINTR, &gpu->loc=
k) {
> >>> +                     msm_gpu_hw_init(gpu);
> >>> +                     show_priv->state =3D gpu->funcs->gpu_state_get(=
gpu);
> >>> +             }
> >> My clanker tells me we can't grab the PM reference before a mutex,
> >> as the recovery mechanism depends on the rpm count being appropriate
> >> to let it drop it (and kill gx this way)
> > Yeah, but we also can't do it in the other order, or more specifically
> > disabling ifpc needs to come before gpu lock or it can deadlock with
> > recovery.. but ifpc disable needs to be after runpm get.
> >
> > Re-working that ordering was the whole of introducing cleanup.h, to
> > avoid the error path with mutex_lock_interruptible() after taking
> > runpm
> >
> > I guess if you are hammering on debugfs while crashing the gpu, maybe
> > the first recovery fails, and then a subsequent one eventually
> > succeeds.
> I guess it leads to a sort of deadlock scenario because the recovery
> path waits
> for power to collapse, though it timeouts after one second.
>
> After that hangcheck will have to trigger again so I guess the delay
> introduced
> would be significant.
>
> I really wish there was some better way of doing recovery that didn't
> rely on
> the counbter having a known value.
>

Yeah, I don't love it either.. but also don't see a better option.  My
best answer is "this is debugfs, it's only best-effort"

BR,
-R
