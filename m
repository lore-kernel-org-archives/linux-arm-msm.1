Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A7033BBAF
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024672; cv=pass; b=n874nQJkZDpV0YIJYE4YeNrhYKLKBYs1SrbGWhIDzB61k1M8mUwlqXyuqpis/3PycDywAAlsiwvWA9FwzCsACFt73dLP3d24i4Yrr+32vIxS8PCRld6yYI1Nzm/aooPcADxLsbw+hcYiOWelgh0lRlrZy3zSdUMQwoZi2GnqMbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024672; c=relaxed/simple;
	bh=J+5HmMWHTPUIIDyo1zzgj5/rZka/qV/yDfHnmjzm6dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=suO2UM9DgOjd8gqCfC6VQkcjx0GBzUKGdf1+zA7u9lw3uhZkSdC7qaHFsEOFDK0f85WTNh1k8hl9Y5uPcqxGQJypfPjBa7f392P4aWTL0pYjoPsGQe4SlyMPFAS/8gvvi4xqWgUNQAp+jnOyMWTnNzafnlaZClSiWT+41ljHLAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SujvsQho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkewM1bd; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SujvsQho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkewM1bd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gxs54142698
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPXV2IPz4DQlXA0mox54ItIhAowagjyaJjdgz17okD4=; b=SujvsQhoH0Hx1HQ1
	JGjgZWhOEekSKYJh6bBdeuvGY/YibZ+AtMyQLvzAZcVaJuyMNrzBYbQ1OBvN9RrB
	3FOaKPkwvPAPwwOBKi6k9p+xUCGhskdP3Is4bFeEzngD/BN6DxReHoKWoKDO6pxW
	3A+lMRd9XkY2iy1UsgW0XBQ0q9DHlSK5SADR2PT+V8ovscv2M4Q3rTBO4fHQWarF
	9Pa9oIp4VkHul3nJRxM7yqlQLC5vgLkODPrPcthS0POGjzLwxyKkOstYfsj8Q7UG
	re4HQ1ISJ46r4J+3+JfZ4wbpPD4FfVn2DQjdJRwleWweY2p7B0TIe8wu00OtiMDL
	rUkwOw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd2j79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:17:48 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-881a45f96bbso20087987b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789024668; cv=none;
        d=google.com; s=arc-20260327;
        b=Fj67JtJAZd04k1LmlLz7kt7e14jaeVe6eiAllxlfVpvnr8e9X5SNGMs5MwVW/FNFwW
         Js2B0h+t/mjjiMBE4BDsMd4yr9GIL9EZ6NktV2qssT91eI+zthXQp8DTIjTmjSaUsVbQ
         gXtTFoBPHxdiNJtrBoq9Di1N3q/Y2J+WDJ13EC91nOK1qdW3W+TSS5qCF5aRNpDOEiTb
         8IsWda13dnvXxlaXtLbCLLdyu3Okxm/83jgoeszpHsBK4emG4NzT2vrpZOr37/WNX+sS
         zvNmYRa4dvM9PIcsESpp0nsOKU1KA2CSKGeDnPrIlmyt69ynFoaGAZhivmTYoRSeTBPW
         qr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DPXV2IPz4DQlXA0mox54ItIhAowagjyaJjdgz17okD4=;
        fh=En2/49LZ6ef4HRrYY4PR1M0Si8lLDt3+C/yH7kTNOvA=;
        b=ehJPeuUfjPzO2C10CZZ/3k5jHjhTZQKB3uGjyA+Pfue2kP9xjQx6PvwViFY6ju9Qrf
         YhAphvmOeW+WuldZCI1SJFJNeGZ5fH5swgyfAXQpFzsNlMVsSu18Vm975xp3ob+I4AdG
         lyw2a9wMQEuXZU0LhO4ZCWM10fBKVzlBwYjSNHSoDwpslNNkgw+O8z7JeeOkmIFO7y0S
         v8C4BW0z0BG+zg/gqMtGGcjXrua8R+Bw3OmTPuqoSeXSAxBaHYuZ55HC+o4vsB4JtCiW
         kooo2+WSnoNQDFrNfPhpTsTWTTfrWgEKXZCrjwaszUUQshwTtZxyt3GI9tiG5qSBm1Bq
         rK2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789024668; x=1789629468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DPXV2IPz4DQlXA0mox54ItIhAowagjyaJjdgz17okD4=;
        b=TkewM1bdo9yWkOaThexadDnmxR8/bqGShflirq68+54rmCwZG4Q7xWIGwtBKKlDlJC
         lDxxPNGkGfWE4Gy5mWmFvt5NfSrn38I4zk2CG1za/w/KqXhYk5ytGtVbJun/DXTUr11Y
         V9rDnxCIVnRoD1WMZTsQDUu7PO4U0I1Xy//NhO67DF4KiphmIkyTm+MKIfLYJVrBBAg+
         duwA+Vn94JbiMfu05LjZ7PZp1qWopwg9FQsH1AHqDmNsfXRt5butG7EC96JyreBLw8A0
         f8TurS3b8J2peidL1a/Lr8dGp/xovWdffftN2ptYOwfzBkwXkHfx7E3Zd0i8kLFTnpoh
         H9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024668; x=1789629468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPXV2IPz4DQlXA0mox54ItIhAowagjyaJjdgz17okD4=;
        b=RRIdFxA2lRZsJZAkDTiEggkikKJTF1ZTB1gFch1ZXsSQrl2R0DCyQoMbBToIMvMfhF
         DiDcAjtSSWBOersIyF4k85Iu003GPn9xmAZuq08scyV1crSKxSkqsacU3NDECDKwo7p9
         x9NudO/nPjsy+F8nSzb/vX6uVsVxx75MedEt5scReUvvyMg5xwF/P4Y/4rM3cIHEXm7K
         19NQda5QtKYap4kaTTYK1vKFlzmNR6vmzjeuccCnpxlE9l8JJF47sHLbVE4kVuPni5ti
         w/lFbUPHFfdZkSRoFSHiRUHDcg8KxPwVtGidCJqq+oueRQv9eQTsG+1bxBRVLgRd6Cp/
         JQXA==
X-Gm-Message-State: AFuF++myQJKVr3Epjax4rK0MlPWswIt1kKSr9W9lYLMetN1a4ij8xzA6
	9MgjGQsrtra6X9dOO7BB04zLUrww5HUsyXzPbAzYxHprjxbziTwQfmrW4YMDYwnMEiqaNwpwgtW
	Mus/GzGBDoK3csJ1hivDQe2K22jDCtRtpz1eRc5GwbQUbVP+KwKZYmYP9pcxl4FhAPeKXPfNjDs
	XlOVL0rU5FV7wwaWx/wPV9dbl1bebNplvsM3c49syKrOM=
X-Gm-Gg: AYBFou1G8cFfJ9hmhW2ekDOJiDqO9MaPsejveNWyoq6S+7jkMicTTqVIJXKNZEKpkxG
	1rpS979NVlcwqP4W8mABeucT+pIs1cC0I/FEzUvf4Z9Rk3QgqAo8zxWfXgkuD+d1KTFFixEvN53
	YP+nPSDUrJI9MV8UWG7iceizHwYB/aFA8MD7S5iQzRvhQjvA08hIhr/OBKJA==
X-Received: by 2002:a05:690e:b44:b0:66f:c1be:3172 with SMTP id 956f58d0204a3-66fc1be3a2emr11690747d50.73.1789024668501;
        Thu, 10 Sep 2026 00:17:48 -0700 (PDT)
X-Received: by 2002:a05:690e:b44:b0:66f:c1be:3172 with SMTP id
 956f58d0204a3-66fc1be3a2emr11690739d50.73.1789024668129; Thu, 10 Sep 2026
 00:17:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713045811.484554-1-sumit.garg@kernel.org>
In-Reply-To: <20260713045811.484554-1-sumit.garg@kernel.org>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:47:37 +0530
X-Gm-Features: AcwNN1WV5q95G7XrffbfBRtWEmjy3wrQFQOMsjw4phzZGEtXCQsm9wXfsECAnVg
Message-ID: <CAGptzHOofU-V+R+8MQyegvkYzGBNuPT62Lnfs2JUEPMwPCA7kw@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: fold tzmem into the qcom-scm module
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-kernel@vger.kernel.org,
        bartosz.golaszewski@oss.qualcomm.com, harshal.dev@oss.qualcomm.com,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: swNYDgb8-e8DsLUUu-b5OnXFVOi9gWEt
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa2599c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=zymMkr7Cd1_EJWXWWGMA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: swNYDgb8-e8DsLUUu-b5OnXFVOi9gWEt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3OCBTYWx0ZWRfX4m3HVPPpFqfk
 RWTfDHzmufmKmM897aYrcd+2ab3IYIvqeargAfgtfHlgFGdolCQSxuIsS3PoUxtTlVUC4HVXR59
 SJq/Owd0PRLPTl07Jg3dIcnO98mCcmM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3OCBTYWx0ZWRfX6/MJKjoYytUf
 BAjY7vZmtQ2P7ixszEZvYtUuqFDjry4RZ391bSPAz0QgdwRlSX+Kz8hI19Je4BDwT5bJUE6oBF1
 SFsBqsg12bd92nyAx/xa40ORVsn37H/6Sn6gWAOy9G0yXP+ujkMn2OuvoRl2t++nRPE0gSl/JH3
 b3QPGJVdoJCfpNbBiHXnq3OKk2ANL6kevylmypY0R20Pa/F7WkQ5wfoEHs9wYDqkvvHPhs9BdWd
 i+CHfLRA50hRBxjdvOFshXHpauBJ4sxkt+BHjHnpw6cFhVfu7esEsize3hDA98AA0b+HCJP08H1
 y1usVErQZajw0Cjkm0zL6C2dA7zp+Hd0N4mIP4j35VqqhkoByQXbaxOnQmRnD11ZWhsjBxUXhaz
 ZG6+t5xMj497aIk3LU2NNrn+zCYUKoxXwEM1GXuC7c1rtk1VYVvXkU046uEAT2YCaa6QSGsdZC5
 2QEetGyPtQFpCmxufhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100078

Hey Bjorn,

On Mon, Jul 13, 2026 at 10:28=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>
> qcom_scm and qcom_tzmem have a mutual symbol dependency: qcom_tzmem
> calls qcom_scm_shm_bridge_{enable,create,delete}() while qcom_scm
> calls qcom_tzmem_{alloc,free,to_phys}() and qcom_scm_get_tzmem_pool().
> When both are built as modules this results in a circular module
> dependency and depmod fails:
>
>   depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm
>
> QCOM_TZMEM is an invisible tristate that is only ever selected by
> QCOM_SCM, so the two are always enabled together. Build qcom_tzmem.o
> as part of the qcom-scm composite module instead of as a separate
> module. This breaks the cycle since the mutual symbol references
> become intra-module.
>
> With tzmem now internal to qcom-scm, the shm_bridge helpers are no
> longer used outside the module, so drop their EXPORT_SYMBOL_GPL() and
> move the declarations from the public header to the private one,
> alongside qcom_scm_shm_bridge_enable().
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607122327.3zkZCUaB-lkp@i=
ntel.com/
> Assisted-by: Copilot:claude-opus-4.8
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Makefile         | 2 +-
>  drivers/firmware/qcom/qcom_scm.c       | 3 ---
>  drivers/firmware/qcom/qcom_scm.h       | 4 ++++
>  include/linux/firmware/qcom/qcom_scm.h | 5 -----
>  4 files changed, 5 insertions(+), 9 deletions(-)

Can you pick this fix for v7.3?

-Sumit

>
> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makef=
ile
> index 48801d18f37b..55751d282689 100644
> --- a/drivers/firmware/qcom/Makefile
> +++ b/drivers/firmware/qcom/Makefile
> @@ -5,7 +5,7 @@
>
>  obj-$(CONFIG_QCOM_SCM)         +=3D qcom-scm.o
>  qcom-scm-objs +=3D qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> -obj-$(CONFIG_QCOM_TZMEM)       +=3D qcom_tzmem.o
> +qcom-scm-$(CONFIG_QCOM_TZMEM)  +=3D qcom_tzmem.o
>  obj-$(CONFIG_QCOM_QSEECOM)     +=3D qcom_qseecom.o
>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) +=3D qcom_qseecom_uefisecapp.o
>  obj-$(CONFIG_QCOM_PAS)         +=3D qcom_pas.o
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 1deee6aea387..3495cd8af715 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1813,7 +1813,6 @@ int qcom_scm_shm_bridge_enable(struct device *scm_d=
ev)
>
>         return res.result[0];
>  }
> -EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
>
>  int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
>                                u64 ipfn_and_s_perm_flags, u64 size_and_fl=
ags,
> @@ -1841,7 +1840,6 @@ int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_=
flags,
>
>         return ret ?: res.result[0];
>  }
> -EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_create);
>
>  int qcom_scm_shm_bridge_delete(u64 handle)
>  {
> @@ -1855,7 +1853,6 @@ int qcom_scm_shm_bridge_delete(u64 handle)
>
>         return qcom_scm_call(__scm->dev, &desc, NULL);
>  }
> -EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_delete);
>
>  int qcom_scm_lmh_profile_change(u32 profile_id)
>  {
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qco=
m_scm.h
> index caab80a73e17..0e7cd1e31d6f 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -84,6 +84,10 @@ int scm_legacy_call(struct device *dev, const struct q=
com_scm_desc *desc,
>
>  struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
>  int qcom_scm_shm_bridge_enable(struct device *scm_dev);
> +int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
> +                              u64 ipfn_and_s_perm_flags, u64 size_and_fl=
ags,
> +                              u64 ns_vmids, u64 *handle);
> +int qcom_scm_shm_bridge_delete(u64 handle);
>
>  #define QCOM_SCM_SVC_BOOT              0x01
>  #define QCOM_SCM_BOOT_SET_ADDR         0x01
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmw=
are/qcom/qcom_scm.h
> index a0a6bc0229c4..b7d5f30876e1 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -133,11 +133,6 @@ bool qcom_scm_lmh_dcvsh_available(void);
>
>  int qcom_scm_gpu_init_regs(u32 gpu_req);
>
> -int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
> -                              u64 ipfn_and_s_perm_flags, u64 size_and_fl=
ags,
> -                              u64 ns_vmids, u64 *handle);
> -int qcom_scm_shm_bridge_delete(u64 handle);
> -
>  #ifdef CONFIG_QCOM_QSEECOM
>
>  int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
> --
> 2.53.0
>
