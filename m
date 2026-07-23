Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D94908B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833599; cv=pass; b=jweNhORihurMA8zeoL7xzdnmM2pevYMmboIhkEPHMXMcR+k3bQ3qghKQ+lzQ0pZszbtsPKyt9De9dLZHmmHGwq3qdHNA9IeRaHZ1aJ//WBqyTeWsprTUPSfEnqudsLawIv6kuEdie+q6kd0FGuRjX8XLVTf8FsH49aHG/ZtY55Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833599; c=relaxed/simple;
	bh=Y/A1YXrnSsFOvtrkcwA7FhGCqlf/x13V0ef/Ni5Yh4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K94/pyVs2VL2h2785UrnJrVLEEJxjnTGh0uTnpDZcIIwYn0phhZqF+TKI9MzDt7QYZ0Z+VoesLzajwIOf5b9Dyo1Sa4/kq6p/f43rSuCjsrn6GMk5V1+s5pYz549PgTizywx/Ds9ZgwemKA9+rzw9AVEXLhLZfQMhtNxCHv3t7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzn7J8RJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlvLpTiz; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzn7J8RJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlvLpTiz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImFE2840406
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=7H8RTaDppwMMut1xQuRrh5WiHZ8qkbLlNqzSomjJbd0=; b=hz
	n7J8RJLcLfBEIXkgm9XQ36qVYpiutidxvsXGDdsMi/CrWWlWAURd4dTy1OsbUfMx
	20QgtdE02gO5Loadsiz8P1+J4WjmjIvQJy8lsQwkSg4aJkK1xu/yiGKQjWJ9b+K3
	FYG42ivP1c48pVMsD1XB3ACqoItP5nYRw3KvIoq02A2dIRjiyIbwcw4fvbIZMxOS
	vlTHrDEsR8LgL67kwYRlmm2JlEeTmdJQ+mF3qGDDOWGT/Ditwlv7Gz5DyOy5huDf
	pASlWbNq6c/9So+VRVK8pWIjObXnBbGjmxB/dWoMy5HfpixQ77gNcNI1mwzVd/XR
	dvqM+Ifw3eRXyUuR0+Ug==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa18ecy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:06:35 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-44aeefa1a30so1576649fac.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784833594; cv=none;
        d=google.com; s=arc-20260327;
        b=kcNNEIBJpV0IozrBvMNwacL4niFI+pwPUYXc797d6g/2tzzA/JrFXA9qc7atPISFCz
         7KcxwPonyFPjQVE5p0UrlWSE5uIbBZavj8MG/4hNBjUiNiwtyY99AtKbq+s+vA4wTAHP
         ueOKFuiBKp1zB4++U+SLDH8JVOJs5QZYOcGk2tpN8SBF2ZHttIbbY1RMlN4yNUXoqbWr
         DrBp+94r/bJGz9tnrA7RsHpE3nWuIjhhep2K1Io6m7bU3qKhMYqnCYkWr4v7wcPK3Tpb
         MzhPvao2zGZLW01C/PhtMUwGiBHiAXQdP6X88/R34BtXoF+HcLR3OY9479Rq/qfg+aA2
         YijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=7H8RTaDppwMMut1xQuRrh5WiHZ8qkbLlNqzSomjJbd0=;
        fh=Z6FMs721yn9Ad5Cu4jLMDZmgFAkBUhzF9GPTqactyUg=;
        b=GyQceNTOpw9dqIxHS+rgLPtjFaDIiUPF8yur9E8sabC2jBOR8Y+uOdkInmhTTP02EE
         kchudPLJX++Go6R4NbG+17epRzvnmmvh0pNI0PoBoLHG5jD/t8XDoYcgZFMgrm0TDnlU
         u33986fkpqf+5rpcjqDbHM784I/Y20Z5HdMSJrHfQADAWzteG7iAyxafFWfyUrfuqvOk
         JcYGFjNfTc3mpi4nOfdKh20JrCD5FDHzyFKANBibzRhptOOd2BZOYFe21QKWSeOg0KkX
         zkfx+tte7yaCaUdFDqd7JJD+9Ss60HUiZlOnBoYEWZbBJvp8zpS8NBEZ3Erph2zVCtTh
         sg2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784833594; x=1785438394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7H8RTaDppwMMut1xQuRrh5WiHZ8qkbLlNqzSomjJbd0=;
        b=dlvLpTizxpHTgJ7BsGV3lEETMhO6wPGFon22rHDCxUWXF8zXhyiLkjAOdEHye/1gdR
         iV5Tsq9MBHGlY7vN6FgMLnuPcC0jo/yuRWIi/8VUMwEoNrJPlIelsIPVHVeXsYMBbPDN
         LSUY4hnKhdQfiXzD1ZQ0HBg+gKMG4WHfW04DU7Yg4sJ+RctF7baUb5Z17Aq9h1qdTUqm
         j3IdjiVPBzJ2IZ2L0T+6lN+2VgU7JMWdX+JbQ6lb8J6vtyR82Uh3gQQr1KviNWDuOcIl
         O+eGb+n0xv0z0Gy2WlSB29l1vHCOtRVEtlM/pILe+LztjLh+0D5ukjg3kY2dc9raXpxQ
         QOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784833594; x=1785438394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7H8RTaDppwMMut1xQuRrh5WiHZ8qkbLlNqzSomjJbd0=;
        b=oF/zU8HaURqoaO8r9oruczuI9iSAPeuCKyXiVc0986cPTryXqRYfidbQw8kGQKjGDg
         6yb5GNUwPNd2ukzgQq+yRwMpJEWFYLtdPmF/EhMpPRghrZ1i4l6x4XDwpzT2dCM31dWh
         WWenDVN89K1LBubzm4qm+HpdcCGOjIZZJMS8AybLS5uBMlUcPKUosyRjbNufNg358WZV
         izjL3Dk0W+oODNydRZt08mW03ccChV963OIytW1KwjsEndd0gBXX9zha5lmxU8Dl/ktk
         GaALiFo8VijAAKKUCY7XY1Dky2//4aGbdrWOsTzQ9KJ1YHaKvJ8q6jfMeSumPuJOX13a
         9yPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWldcF1vv5N57u5a6UqDMJ2UzHB4xV4qLEeTD/cCUcyEy+dVpRNRsjtWTSshIwVaC7S8IgMJ0ehCvLnID1@vger.kernel.org
X-Gm-Message-State: AOJu0YyUAcrtLmdVsOJmJiECVFg9yy+wy9hEJY47vQp048suSXrJEWx2
	7ndpP/Od6id9zUSi+iSXBkmfBh3r/qZpjSjHeW+ur/fO/+2dM98C6OHUtqbW2Wo3ItUxWlJyb4a
	Kj4/HztS9Xu2dUqzXkUpDYWEVsAv6HWuhjA2zTRiBlduaW1M6t8kNvQI66yc3/2Y0NsScMoonAf
	ydxLzxamx0d5bJl4Xorq+Po/KMH8d/7h1/+m4U5qb4ScMxUKZtiF5IPQ==
X-Gm-Gg: AR+sD11+fqlXx+3slA45uweuyQueW6v2ixGuJe8d7UsmvzOr5VRv94QO7xqk8P5ZTAb
	BN3iZlmzAD/+1v60tp18QVH8VUWLP77sh7iBRlZ0KJgbsGC69wnf5QtaHou63SeSpycGS2e2tOu
	zdap0KKr7L+RdQ9XsumIMjBFGkmktS3nzp58pSZ/SBk58M5pHAERvNdA7F
X-Received: by 2002:a05:6870:e129:b0:452:213:bd4d with SMTP id 586e51a60fabf-457a0cae0d4mr2152610fac.17.1784833594665;
        Thu, 23 Jul 2026 12:06:34 -0700 (PDT)
X-Received: by 2002:a05:6870:e129:b0:452:213:bd4d with SMTP id
 586e51a60fabf-457a0cae0d4mr2152594fac.17.1784833594209; Thu, 23 Jul 2026
 12:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-evict_list_fix-v1-1-1a1d80bf61cf@gmail.com>
In-Reply-To: <20260723-evict_list_fix-v1-1-1a1d80bf61cf@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:06:23 -0700
X-Gm-Features: AUfX_mwAHIQsars58_ywT15A83BfX3jiyvn7AcK-11XfI0xkZsPkvTcS4M5MF0k
Message-ID: <CACSVV006P+eNKzMbr1+YrqJ39PqFzqQ9L7gj93NdqCyD_UJZDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove objects from evit list after pinning them
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 2W2Luq927yEDKOTnR7MTVB4FZGeBdvlI
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a62663b cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=r545bymZPMySM2Oib8AA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4NiBTYWx0ZWRfX/1O1YMnzWWPa
 kjq65zolsFISEbipR5yAuLMUIXxbJBsNgT8G5U1AV6MzJDVA+N3POWWSo09Tld3DLiIuPVxiCuJ
 i95pg663m5V0L7gUm0/dZM+/UXSAp/X0VeMhVmqWN3gDi/TqZYRDY1mW3W8x71/5owXBjlWpm4i
 FjrKD3vRQwjfELSu6Gz6U6DGkVwWffLbaBv2yPawbZsKst5MheaIwe2P1sG9/mjQHzt0W5qGX4n
 ErpyUtLz2vtM4t42gfkemymSU4rwVB2oQS8h+ZbHmAZOk5X//B90OlScIHnm6XkOYlBjj8MJpvE
 j8cemJcnrvAYKCIZGQf5b8dYD8GtcMFskMcFAIFHC96DXAWStxX+jjJjlFrzPNZc+hqCuO4Zyk7
 fBMe2QmMEl3hiZkUj66SmO0PaVejkZv6fAm3r1kYqRTfEBZLOrMAyQlIzIOi1ETaJApQlLWSPeO
 OA+flC5xUmrHzMbFz3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4NiBTYWx0ZWRfXwwnynpTJwTK0
 2yLELCsMk35Kr78D2TZPttI/1sHJ7QNtSRS6R2wyL5iAAPnSTxMbjAWG09LXC3zpy4ioW4YZhPd
 bcthbHO97ayIDhRtPmi3lsYTt7vkgWU=
X-Proofpoint-GUID: 2W2Luq927yEDKOTnR7MTVB4FZGeBdvlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230186

On Thu, Jul 23, 2026 at 12:00=E2=80=AFPM Anna Maniscalco
<anna.maniscalco2000@gmail.com> wrote:
>
> Once objects are pinned they should not be kept in the evict list as
> that will cause drm_gpuvm_validate to keep ieterating a growing list of
> objects needlessly.
>
> Once an object is pinned remove it from the list.
>

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")

> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 1a952b171ed7..4422677f095c 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -458,6 +458,8 @@ msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, st=
ruct drm_exec *exec)
>                         return ret;
>         }
>
> +       drm_gpuvm_bo_evict(vm_bo, false);
> +
>         return 0;
>  }
>
>
> ---
> base-commit: 9a967125427e03c7ebc24d7ad26e9307e8403d4e
> change-id: 20260723-evict_list_fix-1da92b2627aa
>
> Best regards,
> --
> Anna Maniscalco <anna.maniscalco2000@gmail.com>
>
