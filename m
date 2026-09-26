Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7BB2D23BC
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436239; cv=pass; b=eCYUsyeGOPncQhoHwh/NdTzMtlCV4PWaqLo9LsGTx/XERpfTFFLbCuVRV/ZG0qooWkDeW9Zr5bVekF5zRqgiOFYpFIg93EE5C+xfpp2C3aGv69YnaatmTLjFiK49BQFklJntnUv/qkYxB5/MiOFZfxy+eNNzPSvZUxztmhNCSdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436239; c=relaxed/simple;
	bh=ecMAlZsbu2E/3TSAdvLiw+iTvs6e2RkSHx6GibJf5lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vb7YBs08LAAoleLAYwMlS26ZvdjSCDipmzL4koldT1EylcQTNFIjEkMdOT3F4BKJHGXJIcwPZoY09xJou/RhDCbeEMwcQciIbwmfmg51EUq5J10OFpEnqMAyHDZwPFswUghQ4lPgWJ9AkXKVSaskRpDeIE4FwgLXhzRoQK71zJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ju/jyXMr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HA5q2Q1S; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ju/jyXMr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HA5q2Q1S"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QDeQiK3407011
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 15:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=kwRYD0lg3ABAu3cXBo8DfhKih+wg0SWi0GfEDlQ7sK0=; b=ju
	/jyXMrgh6sOhp5pfzYpboLpZbwQkSeNZqeqFUWFTMAzlCejoUEMOb0agvTJVaKr8
	7xZSKhZS0iKaPsHuaJFnVH1MgOtt+T4a7GsAa8vi/qyARbtF9fqmjAfCecmWg1bx
	1H1r6SxQSyvYEFf7g+asXn7RTxhZ+TFUIHVNLnXtYY1vSM1cUWcI121E0ItEhMQd
	XtlSuVoRCGEL1qYxDZT5vUONEeK8uura4F1qnf/wvEVTpQE3TSmPxLi36ab3ZQzB
	p4YiXAZ9YMHzowRdBDhyOESQWuPImBQkVFqoYqr8amc9cTElcqgBBcuxLmjIhwHW
	geqzr7CAeMDLP/QsTX/g==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9ryyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 15:23:57 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46a5954cdfcso2102049fac.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 08:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790436237; cv=none;
        d=google.com; s=arc-20260327;
        b=IxJ8Tc7ZLA0y1jz0fjIwhOfAx3BfQEi6fTY64Szi5In7V2cTd7+egOKNRqGSmU+tuS
         Ylrbsy1B88fIDJN7164E15/LgGOmzlx/azHlH/GZauZJI0vtWHXNjzZ9Js3VT0m5CBSM
         Lhjm/PkeYqI5SBuFhYKvz8GA0DGSLL5Pn507FGY+k232014RitRmqlWBe70/pvL0ziZe
         17M0k4ZTqTobFGQYMJ9ee5Apk2mbEfBGiQzD0W/CBPbO2OybnJ3OEQkX2bMTqd/J9Xul
         KCKCb3HbG/1SAOiRmyJMwl5KlLTecHUk0WtA5bIzFowbr88tyKGLArle++hHchzf9TAQ
         P+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=kwRYD0lg3ABAu3cXBo8DfhKih+wg0SWi0GfEDlQ7sK0=;
        fh=RDydl6LfQZRD5Y/uAmEy2xMaESN/EuBAoaDuegXP8YU=;
        b=VyPwD2eQZf0pjlqgFcwxtPbM3Dbwhoo5RdLI3y6tTqY0co6PdsohYvVFqstxFyZhGs
         97ZqHwZ7K+Ufng4xGwy/bu9PrbVadZ/H+cjMduPooxxPX6Oy4m0qAkeY28MDn7liak7m
         fNouDr7flISg8riRJi22sWkGjrJh3Eqissft/hsIXeyAZJyjYTfK5EABI/j2pnhi6XNq
         JR8foJ5h8TgH4PEbfrtiS4j2toeS6MIJXOD6EFeNOnyXzFO6pf/y+59iUgR8RVweFNG2
         mJLpspKG4sX5BHZgY+FdRC5DQ6aIknsDItjQo5FrbqyKW/mrrHIc9qAFM3pw/rqvGlKH
         LM8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790436237; x=1791041037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kwRYD0lg3ABAu3cXBo8DfhKih+wg0SWi0GfEDlQ7sK0=;
        b=HA5q2Q1SCwOMlGFH6/REdkXbTGIqX2RVpwVvxebcLnFVuuHm956HcZogWAiNOevNI3
         l88UE0zwJctPlWRlFKXvY49Twr0B0FteViH3y+xhmvRvF7lo/5g6zScnD/ZF+JHFkx0S
         H6PvIY7TinXYGLC9xUgW986lKMQjYYIemCU4Ebbb46V8fevaLiZdVskWBWN1AdYuf/5M
         F6jivH8TxHn67KMK//9LugplVMj1uxSKggCcyZJ/DO2o1VLpBLKWiw0cisu+t6Y5yN94
         TaRBm7RYp0mtaIce9rLFvA1MWQ0PxfY8YdAx6dl5iLk5CEaRYVt1go75lFj5Qt9eb0CM
         thGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790436237; x=1791041037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwRYD0lg3ABAu3cXBo8DfhKih+wg0SWi0GfEDlQ7sK0=;
        b=HMgTBrChmcudQ6c/kfAoWuaj5S1RersR0J+230Z88j1mbi8AtLH6GplSZjjJON/9jI
         OnTyqaYsEqX2ri2Xkg3nRBoiMQ7wLAW0C6BUgVOycCqO3XS2/gIfc0RoApQW1j1NF0x4
         feDrYl8NkYRX4ZUFkPiWwBRqmnbr1uCvea/ZWtMD3XXs1xDwpOiAypVr8YEhBu9q4vE4
         7ZXEGGipEKMpY7HJXgMwXZi8gbFMku/E9qNVobZS+iAnlwkWxNSccy1v3s7eS/vHj2h6
         pxykirrpRIfnQSyMU6R1o+SmorPK8EQ2mro5Zm8x1DIY/LfYYLEu0zdbE+xixsboCQ0/
         0ALQ==
X-Forwarded-Encrypted: i=1; AKwUvByHEg8swHE2NW3cXk7hw/1b7etX6OZNhyhUvRgLLhEnaJIPYPP/zPGMXISY5ra5GfKjiuNl9rPEaPk9dZ2X@vger.kernel.org
X-Gm-Message-State: AFuF++kdyOXc7WNmwp3sP5iw9pKpCZE9FWlBAuhnEoFidzg9i9id8y6d
	xD64G3RNHwwikz/kttr0PTI0LqNkfanEgxDqB4wG4dVND2m+qxiQOoCpM8qHvNzj8mXMWQk0pKl
	EcH785Bfe9I9Zlcmf8HeyZ4dIFlwYVx6jMWCtv8OjCxBXhdWX+axX223kv+cCgJ5DmVo2G5OAm6
	Xr3rdf59Ps34IY24aaipu2E0iAbIA9yw84M5QZlWqbMQysuUid4mI=
X-Gm-Gg: AYBFou22IzSjneZ4kMpUPEv+hAv4ECmPIRr+w5lYLV2fp8egAF/9gMUP+2+gGOA7H0u
	CyinKsrEPpnoFw/Uu6pV4s56aIxIRSLj2BTrr43UQMwFh6j1ZEz4HwrrcxvvhH+pLgSvy16d0ZC
	D/pLvxTU5w3tleCOrDSvcTbnHfPYZ28Diyde3p6kHMbBsO4kzQrT5Xfm6m
X-Received: by 2002:a05:6870:8125:b0:48f:e107:9094 with SMTP id 586e51a60fabf-491ec0cb354mr8222542fac.58.1790436236818;
        Sat, 26 Sep 2026 08:23:56 -0700 (PDT)
X-Received: by 2002:a05:6870:8125:b0:48f:e107:9094 with SMTP id
 586e51a60fabf-491ec0cb354mr8222516fac.58.1790436236156; Sat, 26 Sep 2026
 08:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916175738.2089950-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916175738.2089950-1-vulab@iscas.ac.cn>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 08:23:43 -0700
X-Gm-Features: AclHuK-MO8yQtGnXizwPI78LElvu7aVM2e5_m4tfC0oKEkl4LViWX4O6Arj8prg
Message-ID: <CACSVV01+7xbVKDS1SOJOpuAw4WojvxRa25fUVZZT6o7hVcNOXw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Fix VM leak in dsi_tx_buf_alloc_6g()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        jesszhan0024@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lumag@kernel.org,
        marijn.suijten@somainline.org, sean@poorly.run, simona@ffwll.ch,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA2MSBTYWx0ZWRfXxicrfKQgp7CF
 M1sceJ0PBz2FhWFuNQ0I1U5uOo5eVE9GslFx18KuAbbar48h70ypgkoLNU9olmxCalqEvT+inu+
 a9cx6MLfL8sXkfo2uBXNfGMCT28HX4E=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab7e38d cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TGumlaujzOIqipXuJGIA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: LJqm8ohFJ2-OI_2dWcvRS6Q3ut3lZB_z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA2MSBTYWx0ZWRfX+g54cQFsGTOp
 ZLAb+KFIluaq5fN0De8DFrikFrXaeKrFLmJUzgOjgwISGyhiEnU9KcE/dk2w9FcANM++fPQgocT
 klHCF7vVcUSAvKHXWOFe42MLv8QHB3/uUtNmqCuQzFLjDpSM89O7lhPpMbiUjzWlCZL9wXaduFd
 cIlJsu1jULIStl772yDBupCXVizQRPseZ1+plpZybWU2zJZMmyp9KL/I+dRfen63DpGzhGfkubr
 6xtvqNdUyZ7xnVxY91Vpg8+f/DaKF2nRL/Yf4szPE0Fa3fCcEAd9VgYcKQszQ14QN0k15DIERzE
 OShiYcECIj7LWytWmM8Lyg4JZ2nKdte13Zbkk02Lgn1aiF3vn0E44wxmWZAqeQG4e3zzXB+UgJd
 XaJOGVMjgRionpojeWe3Tn7avlglH1XRXVTyB7xCZNmdF30MfegkZzhmwzfyPonnCQ2jGVfn964
 HxBK7aywQ1lsSycqg0g==
X-Proofpoint-ORIG-GUID: LJqm8ohFJ2-OI_2dWcvRS6Q3ut3lZB_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260061

On Wed, Sep 16, 2026 at 10:58=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> w=
rote:
>
> dsi_tx_buf_alloc_6g() takes a reference to the kms VM with
> drm_gpuvm_get() and stores it in msm_host->vm.  If
> msm_gem_kernel_new() fails, the function returns early without
> dropping that reference.  Since msm_host->tx_gem_obj is cleared on
> the error path, msm_dsi_tx_buf_free() will never see a non-NULL
> tx_gem_obj and thus never calls drm_gpuvm_put(), leaking the VM
> reference.
>
> Drop the VM reference and clear msm_host->vm on the error path.
>
> Fixes: 5e05be782645 ("drm/msm/dsi: free TX buffer in unbind")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi=
/dsi_host.c
> index 982abaaac00d..29e0de0e0c22 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1250,6 +1250,8 @@ int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_ho=
st, int size)
>
>         if (IS_ERR(data)) {
>                 msm_host->tx_gem_obj =3D NULL;
> +               drm_gpuvm_put(msm_host->vm);
> +               msm_host->vm =3D NULL;
>                 return PTR_ERR(data);
>         }
>
> --
> 2.34.1
>
