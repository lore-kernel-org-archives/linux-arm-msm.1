Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806923AFB18
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025239; cv=pass; b=QZCBsw3b3D6YraBdq7IkuuJfC9WtnXotIFkVkBUmYBWGL6nViUOJ/n3ziB3yNfIyiYgnX/RJCPMED3T9YwIfDJTj77vOUmFSlOi3mQeVam7HsX920/kkVhW/Iw/dzT61z99ViAFyodZsZD15NMlCqaujciy1HTLnbtyYHw/oPRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025239; c=relaxed/simple;
	bh=bZxWK4/oaCwKffC7eILmS9hf1WFNkZfOkRz6Aks28xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSIqsDbQ2vaMT+xl65c2HbclSYEsDkWe08fS/qPSxed1dwlHfi9t2nvKyUHheHYNxEWNHW7MkcKI4hhm524XehqlzcKdP4Vwh49BWJ6vode9LHW+RjBMO85NS5YAPujBp0ptXqSjfjRBwYo3vqdbxsf1ME1uQHbEJo4V0HaF99g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7I/PT09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEJ9d5VE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7I/PT09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEJ9d5VE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5H0lj4142903
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taZQwJTu7Xj2QDuBpgX98mgl88qdgGujFrGGLJjeO/Y=; b=R7I/PT09opctkmDP
	AtysNWExZ3Hw0+R+zBCwUyJ8Sn0N+LZ1p+JCqyJXtuKSJY1XwAeJwx/QwWWvv3oG
	e4f5kj3ra2K5GX3nwyrdemh7pdQRA2dkCO6dxjaknGFVceuypSuwYvIIr3UEZgKF
	witAiNhxaN5ePeNxct7pd6lpeiHLRHHCCWLfLQcNh9gSsxDcEWKj/vgrNgBFgcNh
	xSNDT6X9eBd34ghP8DpkY7qJkwn14h9MSFgXjt256gXtweedZkiTRFgGrDFQS/PE
	Y1GuxJiAfSRk/zdi9JqCqDxm5xmUw7znzIZij+yW7nQgtiYC5uVIS/ANxJvS1KEX
	E4U5Pw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd2kdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:27:16 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66c767e23f6so7868001d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:27:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789025230; cv=none;
        d=google.com; s=arc-20260327;
        b=mYlHrn/oYXb1UGCEHAhmbDX/V0+eyOhgNAXRsh58qONOx+I9FD8VTQ9kk6JefMYtBF
         +lO/Z0zoOjjgEPyWx6rnyFnitT78FbPw5+Jpi1Is2wbAEtwFky+g9i9WHDeNU9/QKktw
         bJNpwxY+3ZtXq1KnWeTc+6dpeDcULaRl78laFqUFudbQV9zN0rTxuVzv9HphFcBWFbi9
         VkFJfDeJ+nAhPze8ItGQZ/0f5H3NG2pOALYZESIWMtJkK5UtV2X5hwiIHzlex+SRYGt6
         TRi/9Hz2taI0+eQ9SnF7oqajPOfAfFbBlMXLKeIfPJ+EQQ+eEZHzK59nV3WHkdyx1wup
         pGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=taZQwJTu7Xj2QDuBpgX98mgl88qdgGujFrGGLJjeO/Y=;
        fh=IC3JssuQkF4A1JJ1Ves5kvuRsmS+cc1MmGalSXy/pD8=;
        b=Z50xW76D8d8x9uHwjQ0hM9uMBOZMyp1HeD0+0pEyDPkuVCi7dTyLk6lGVYCboM89LK
         PouCvlz8m7JlMaLKlCN92rX4puFXLQYFtC4XwLn1r/+eZlatehSQJ0YnebFzBfFpYeys
         LIJhQzJzPU4+uoc9jfKY9hU5GsIocfaBsmJ0d/lSCnT3DJq2b4xQtrhOcnVqOGeF+cFj
         /TE35QMDLcFznLyffK8mGlmYY3huSz82bU7GWLMq279YKVoV5Zwg5fSUSjgX3R22jMO9
         oDk4I6RasNycMTEhx4fTZNM983u73/4bNObH165NS+7eIAd4xwjeCAmdNtzaVcNh5XFC
         z4Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025230; x=1789630030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=taZQwJTu7Xj2QDuBpgX98mgl88qdgGujFrGGLJjeO/Y=;
        b=HEJ9d5VEkO2oKknCn1tH1/f3rbbmic7IBHCLN8IAUqJa8R9ehJrrXXAWOfYScjXvkf
         YBfNru2XeEWSkpLh0U0elO5q/TngWrn6vgbLWUeuro/3i9//qubGj06BlRDSPxt+99nY
         hA5TyziUqsoxwr5tRop6SE5Bhp6pFk0XjFUsQP6Z2vl7EUuHevyp6x873qMZe0mnIC5W
         0lGVfuviFetrDtKAbvx7mcZxCP6vV79OllnEaKqZBbcDSlja3kt2YkPjZAdzO1Skdbsy
         5vkoJL92DAu+grfRzlY0LdCkNqs7iuCIJM3t5rPZ27QCR1jcOEdvktBeAb+vgedvi6Ru
         W0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025230; x=1789630030;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=taZQwJTu7Xj2QDuBpgX98mgl88qdgGujFrGGLJjeO/Y=;
        b=kw3Mp/rtaRguuSYRqr1bucb7tsIoVZ4N99Hno36r4O/JmQmizWq/POs+zr9liKT8ly
         yfE+d0QZeLNhfbtt4d6Op4Lw7YrNNGd4xyvnZYxfrrVsySdQ9sM5R7ccJfRnm7mFqFoH
         7/G72la8LOj8Ng3gBLVi7Q8NoDfAu4X86uaKk6Dd+x/9LgRQ1Xpo+3X7DEgveYOWHNqo
         jvzQgGSj2gF9VUNLVJ+hWn4CcpWggZEK80NNC03HJfA9y4RFjoTGGj0qq50aDm1BltOa
         mJ58sjq9YyNCIy732AUEPpB6BWuhCNOlEHDX6xXH6Dk4KcckmVeuvZvB0qZSKPJYJWhU
         /Gew==
X-Forwarded-Encrypted: i=1; AKwUvBw+6OWge36ppLNf7smVoLoqfYsaHLaJfZVCY/fY8mRBS2vPmn/qdG3OdjoVOIRpVfRmM1mVcM7nbem7pqao@vger.kernel.org
X-Gm-Message-State: AFuF++nkhBKkx7AZDyXlkfKHhnX9S8JiRKmMN9EfFZKr/fp93OadcVHL
	6yd7P6vRECdHPzCh84HhOWC5O9RUCoTtlQZoOBTpTH8BU8OElWp6ZhK7hRsuhUrNo1mQBLVcSjY
	oYTxNeM3ee04TW1k858k417eIiy/cxedHALikqtyTOWgs/w7w1O7Dt7PyrykwlgXdoeDK0Zm0Z6
	H1N2w9ymA5sm9aITREjXt6s5l557o0WFIpsvkyU83xdog=
X-Gm-Gg: AYBFou3hCE03uZkf/fIJFeYG0n/H4U0QMnxcQVQZalO3av1lDmSXrIWPpDc/K2/HCny
	uCQqINwyOlBgaavORBf3pB/YQllPYdQwNyUEWLYzpR/srrs/qU3hlTWvD+Q2QCVAB0Q8g1+NoH9
	A8bdul1xUEKIao/7EUb5hmp+HrSGIWQXvaV6BOwnGbdhQ8itkmaMCsPf2w0A==
X-Received: by 2002:a05:690e:4188:b0:666:396e:bf59 with SMTP id 956f58d0204a3-6710feea457mr1891098d50.1.1789025229999;
        Thu, 10 Sep 2026 00:27:09 -0700 (PDT)
X-Received: by 2002:a05:690e:4188:b0:666:396e:bf59 with SMTP id
 956f58d0204a3-6710feea457mr1891087d50.1.1789025229603; Thu, 10 Sep 2026
 00:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821081325.89088-1-phollinsky@holtechnik.com>
In-Reply-To: <20260821081325.89088-1-phollinsky@holtechnik.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:56:57 +0530
X-Gm-Features: AcwNN1Vn6UxHVxU9O2c-HcaEnhmPjnjZ2yWHOjiTvHE8Ao96P_jBheKuiWTFEXE
Message-ID: <CAGptzHM1tuR+JPoT4CmA9fO77pheTq6d+14XnpxtNysrBW71jQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Only check for PAS when a zap shader is present
To: Paul Hollinsky <phollinsky@holtechnik.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BETg9sPlOBft5NG-HP0sGxCq6pJCYJC0
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa25bd4 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=8dbcrQVTAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=L0M3gnoWJ22_1Ho6GyMA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=2958AbVqUNA9gn3SDOjC:22
X-Proofpoint-ORIG-GUID: BETg9sPlOBft5NG-HP0sGxCq6pJCYJC0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfXxoEVD5s6A0Ds
 Dw8tfCV8u25V78SKHBoe7f6lvWJhgffokxChnkMh4yeb0SA0cPHnmcDG8PYxJTuQ067bTfj+Nlg
 BwZhe/iQBTRhl2fna9HXOlg0g7Z1p3k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX8hTflWncKauP
 lttxwVV8TpI0tuOVp+cle8cKhyuxwiIvExLO99/jq/ImS0kXlkQYqhXDigTS4jCGjJAP9JttnT4
 +gyx3nXCHUO1L8Dpp7RUwq/vtwiTR5QotCk+KV8caBxZHaUGJcO4pdI3jKKXQlVtfrCv/Wxypkh
 Gr7UiBEEdyqQWQofEA4fjzSr0NE5NEF1ycxBrozUi7ss7E/zD6zT7bl2rK5eAIqfFtIbcERGzsy
 Ex1rPp7GQQz514wceCDO7lOqTTejCCynR4/nk7KBKeTuV84rjEkJYitzH+KJSDw59Z/uN2Q6yg2
 V+t5Jan7fqPYqDWB3QD4f5Nz64iUtTWz8gSt4Ij45ttSYrnJVho7RU9bqy2oaXvYk6JVb55dP1V
 lJulC6K6Vna4olDbCJdOeBp1lZJ8E2MUGJIcXdX3BhfHDndITecslRW5sMsuw9nhaiZCoo9MZHa
 0E7e0HB7LVFZtFXIbVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100080

On Fri, Aug 21, 2026 at 1:44=E2=80=AFPM Paul Hollinsky
<phollinsky@holtechnik.com> wrote:
>
> Commit 0be72be03ca7 ("drm/msm: Switch to generic PAS TZ APIs") replaced
> the qcom_scm_is_available() check in adreno_zap_shader_load() with
> qcom_pas_is_available(). These are not equivalent: the former reports
> whether the SCM transport is up, the latter whether the TrustZone
> firmware implements the peripheral authentication service.
>
> On SC7180 Chromebooks (trogdor) TZ does not implement PAS at all. SCM
> call-availability queries return 0 for every PAS command while other
> services answer normally:
>
>   svc 0x06 cmd 0x01 IS_CALL_AVAIL    -> 1
>   svc 0x02 cmd 0x01 PAS_INIT_IMAGE   -> 0
>   svc 0x02 cmd 0x05 PAS_AUTH_RESET   -> 0
>   svc 0x02 cmd 0x07 PAS_IS_SUPPORTED -> 0
>   svc 0x0c cmd 0x16 MP_ASSIGN        -> 1
>   svc 0x05 cmd 0x01 IO_READ          -> 1
>
> so qcom_scm_probe() never registers a PAS backend and
> qcom_pas_is_available() is false for the lifetime of the boot.
>
> That on its own need not matter, because sc7180-trogdor.dtsi does
> /delete-node/ &gpu_zap_shader;, and the intended path for such a board
> is for zap_shader_load_mdt() to find no zap-shader child, clear
> zap_available, return -ENODEV, and let the caller fall back to
> SECVID_TRUST_CNTL.
>
> The problem is the ordering. zap_available is a static initialised to
> true and is only ever cleared inside zap_shader_load_mdt(), but
> adreno_zap_shader_load() consults PAS before calling it. The discovery
> that decides whether a zap shader is needed at all can therefore never
> run, the flag is never cleared, and every call returns -EPROBE_DEFER:
>
>   adreno 5000000.gpu: [drm:adreno_zap_shader_load] *ERROR* PAS is not ava=
ilable
>   msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* gpu h=
w init failed: -517
>
> Nothing retries that deferral, either. adreno_zap_shader_load() is
> called from a6xx_hw_init() rather than from probe, so the -EPROBE_DEFER
> is not a probe return value: it propagates up until adreno_load_gpu()
> returns NULL. load_gpu() re-attempts on every DRM open while priv->gpu
> is NULL, each open fails identically, and PAS cannot become available in
> between - which is why the error repeats and userspace stays on
> llvmpipe.
>
> Move the availability check into zap_shader_load_mdt(), behind the
> zap-shader node lookup, so the driver only consults PAS once it knows it
> needs PAS. Boards with no zap-shader node take the intended -ENODEV
> fallback without ever asking, and boards that do have one keep the
> qcom_pas_is_available() gate.
>
> Fixes: 0be72be03ca7 ("drm/msm: Switch to generic PAS TZ APIs")
> Link: https://lore.kernel.org/r/20260808034716.58888-1-phollinsky@holtech=
nik.com
> Signed-off-by: Paul Hollinsky <phollinsky@holtechnik.com>
> ---
> Reported and analysed in:
> https://lore.kernel.org/linux-arm-msm/20260808034716.58888-1-phollinsky@h=
oltechnik.com/
> Konrad agreed with this shape in
> https://lore.kernel.org/linux-arm-msm/b63e93e4-2f4c-4cad-b726-e1b0565379d=
7@gmail.com/
>
> 0be72be03ca7 landed in mainline during the v7.3 merge window (via the
> soc-drivers-7.3 pull), so this is based on Linus' tree. Note that
> msm-fixes and msm-next both still predate it as I write this, so it
> needs a base that includes the merge window; happy to respin against
> whatever base you prefer, and it can equally go via the qcom tree the
> culprit came through.
>
> Tested on a Lenovo IdeaPad Duet 3 (sc7180-trogdor-wormdingler) on
> next-20260805, which carries the same code: with this applied the GPU
> initialises and logs "Zap shader not enabled - using SECVID_TRUST_CNTL
> instead", and userspace gets a6xx rather than llvmpipe.
>
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 489462065ea9..995161215ad5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -52,6 +52,12 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, co=
nst char *fwname,
>                 return -ENODEV;
>         }
>
> +       /* We need PAS to be able to load the firmware */
> +       if (!qcom_pas_is_available()) {
> +               DRM_DEV_ERROR(dev, "PAS is not available\n");
> +               return -EPROBE_DEFER;
> +       }
> +
>         ret =3D of_reserved_mem_region_to_resource(np, 0, &r);
>         if (ret) {
>                 zap_available =3D false;
> @@ -170,18 +176,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu,=
 const char *fwname,
>  int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> -       struct platform_device *pdev =3D gpu->pdev;
>
>         /* Short cut if we determine the zap shader isn't available/neede=
d */
>         if (!zap_available)
>                 return -ENODEV;
>
> -       /* We need PAS to be able to load the firmware */
> -       if (!qcom_pas_is_available()) {
> -               DRM_DEV_ERROR(&pdev->dev, "PAS is not available\n");
> -               return -EPROBE_DEFER;
> -       }
> -
>         return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>
>
> base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
> --
> 2.55.0
>
