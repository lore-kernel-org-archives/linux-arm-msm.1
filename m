Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41375522EEB
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694333; cv=pass; b=kua+T4p8IKzOTaLAJW5VFleqTL6ou4BrSJI0b2LATz73KkxvrhFjMQ7d5agJKNX8kS7d48IQGVNJqrUgQDQxQYImmx748J8HvI8UX2MxtEq6ZX/oaRj70JL5vlGr4/BqzK+h+0ioSbQ0o0mZKq9OGeZ8pwNAr4JpgYV8v/nVKb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694333; c=relaxed/simple;
	bh=FeWUS+Q6rRQt/exe2FmXZxiieY1gab74/3uvCwXlE+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a41JhyWTwHSsoqKzgjsJIXnFwfmOosbhXD7KDVveyk3rWEHvS+zDiEzKHJnhLICmc1WW3IUGMKUUQPJUy7L8Jq5dzpzCgqUjEc3alyvQlRR6dFKeXws/PC2pumrKXPHlhmwesZEiVDjPv75/Ii4zpupB5S83N6i6Y8XaUIgSrTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVtttBKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ui9xRSyt; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVtttBKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ui9xRSyt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlxM3936936
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lin7ry/oLwtfMeL3Cn94jsgt
	01Sg93DuOFM6kwK21kw=; b=OVtttBKTgJcLF5WQkPHVSSphYWtWxp7DYKs7JZj/
	dWbPx7fmXepg/KyJhtEc+8BTojaqsqnOa2En+pEkHNhqoUC4R11ijBqrGHzC+4xz
	AM1LQeMJiQ2V9y8FvKMABSTbwkud4zngzTEV/8sNyvjHBP9vuKVDAepNnjrL8sNh
	yXIzdpQGx8V/rOe6juaBO4bxeEStanDY/StRQaIyy8F0++x7IPAZaOqkV3lAJpDm
	fDNFAaRKX3IK+9sCeHTWso9YiniDwK+7f9f8gj5MF8J4iTOSF7g7zaW4hI9b3MnG
	O4+J6+0d8aLrxdWDqDZf3QdQ4jiADH1jnbC2ZGe07BI3RA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1h6de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:05:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so3040604a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 08:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790694330; cv=none;
        d=google.com; s=arc-20260327;
        b=AQ5sYRf/zUARcwLj8tLcFe6hljEtAblM2ReZdFIRZmstt0+JLnxA1boRsyIFNBlJdf
         oJ5rh7m5S6W+YeTNOHsAliUWbovIDX84zlWin08HtIqUE/3ki3OMW0Kg2+ayKICO+Xwf
         YtnSVgA3R4mTkhwtzJ1tqiAoAdGKsoeGAgdomEJucvFb86vsssMzuAlkp7FhFD0kz1TG
         raDp0F8pOAJkQrxHgRmq9k9hHA/hyOpylvxm8UoE7fg1mQHVJXXtzzxzzHLFxM0t7X5b
         js8YKbQxzQccanyCMMwWzRNLwVo/zb6h8Kf77W8FFVYIN3FJsJK2mqTBhegM+cDHQcxi
         3YgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Lin7ry/oLwtfMeL3Cn94jsgt01Sg93DuOFM6kwK21kw=;
        fh=MMZ+OcGKlCCPW23mFUqZZbG6WoI9Qmh2idGKko3TiSY=;
        b=BYzwSTPnzXMjh6f0OSV5NV2T0i8jXAgusEVUqY3XBP93yf2lKNsjme23e5O/mzSz0p
         bJoiLpTnmC8VHk932gUcWZz/UIETc/CacerMHPFT3iagu15/0FCeJnPrX5zdQLHePmvP
         zUKJhncULO+cpAO2YUVqV6UNxy/1bkT8NNv3RosGG5XZqkGVpfYm736OD+CvR3IFnLU5
         pUoF80jEdKZ0CYAge5bNP5Fa/yWfGjhASRTQVRUPYncpkh0N/yhbJdfsZNuBJS9Xn+4U
         mNcmHh9EFJmgWhE1adCE1BtsgM+36nsK3skVJhdeb6QQtNV/ZSVU3sVlFo+gbFB32UEz
         Y/rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790694330; x=1791299130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lin7ry/oLwtfMeL3Cn94jsgt01Sg93DuOFM6kwK21kw=;
        b=Ui9xRSytSAZYJCOeKQuez7+NlxHURgls5C23Yo2rFbTQLZVzRWRkgOj9isyKdo93GP
         RUbmVspbSNAczAjUckq9n3ePaeStMccaF32Cou8I/KqkTpwytHOps8N1qe0tuErV4avS
         NImZeoAg+L+4rSjF1Kyn1Zak5u2bgLR0pYlDE2+h88mTaOwtgg77S5Wm6Kc3J6ZKfxtF
         5W++IRX21U7ip2uto4Px+S4GVNz1clYktBbuxeVnHTDvrTKbTUe8NLQP0tx1Zf4UdcdJ
         FFJdHP5nWdy3IYnnRqW9UqGS58p9mwHU6asDrtOG27SozUOZfCtM/PwtkY3qi63uJylr
         ATBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694330; x=1791299130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lin7ry/oLwtfMeL3Cn94jsgt01Sg93DuOFM6kwK21kw=;
        b=bAhIlFTGA9pL0brqp3k9Gw+nLbOAF89N1ypmHgOeQcm/ruGl8d5XHLWBlulXfEU33r
         UMM0PnvSl2SJfs/MFcDsoEgNgEVQYH6QtZ/0KSOlIRD1m+2X7FBhoeL1vVtt6QqbiaQs
         6L46JVnUXW8O0YZ5q/ZCtkLKWYWbOGwof79mXeGm+7dAnykx74KW3p3RGHBRkXx0uenH
         OF1YHlDBwRr4WLpu85u+elSRLfrp8Z1hICozclzUx4T1TQpnhixaD7y9oc6tgebpX5oE
         NOqhBx9jonxErpRPClK4B0wl13xlsoxtjq3ttK1i4nleZE7Jiq/6R4S19klsScOa+LC/
         vWyw==
X-Forwarded-Encrypted: i=1; AKwUvByRUvZ1aEVE0Nn7Ivkqg68rL7YNS57kkYxmtcvxH29bdPta73ZxTQ/F6VBU0JfOaqNEBsaEkoLVkQBOpBfj@vger.kernel.org
X-Gm-Message-State: AFuF++lwm8Qik6iTMv6DCIbm8V5/ntclgn87Fc6oCcs4LkZbt1SJXIkF
	PKvRQut8OBkmGP6mv8IpeW32RUsIpVAnjzByW7Gy8378k1y+d9F7dMQordCUNM/yly+ivQOcDL0
	x2zS1+NP5u+tW2JrBfKTK4tCvex/nnsfO5+x/My8tyY+kngp57ExfS4AfSXMk65BAMA7jYFpXPq
	UIkQkGvEOp19IyK7qlkwZmKLO7AsXbXMZe/NdzC3L30Hg=
X-Gm-Gg: AYBFou2Cx/yxPRTTJ3B0F994oOC1SZrRpwWVUa1Wmxf0CE21aQNnf23iCrsKzYmtJCw
	+AHie6lvJN/bEkfloKszymP5UvyCBycenL/eOjnkUAxeeqCa1VqI8DLOJX9biRoNxweuaJSluS3
	lA4zE7JOyBw7e9KbwnpB0b0cZ/jnJrrktVxSu7l+cDaTwY4El6CeBi5AmG0hMrwtTD6gx1HZI=
X-Received: by 2002:a05:6a21:501:b0:3dd:a197:735b with SMTP id adf61e73a8af0-3de0e86f5bdmr16216859637.52.1790694329648;
        Tue, 29 Sep 2026 08:05:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:501:b0:3dd:a197:735b with SMTP id
 adf61e73a8af0-3de0e86f5bdmr16216826637.52.1790694329185; Tue, 29 Sep 2026
 08:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
 <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
 <jc4vctqyyrh7gvoxv7h7ioqnrv72t73trgesscx3xpd4xwpj2m@m6no5tnmet5s> <828e8a38-4d11-4126-8f77-04e05e1a94b9@oss.qualcomm.com>
In-Reply-To: <828e8a38-4d11-4126-8f77-04e05e1a94b9@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:05:16 +0300
X-Gm-Features: AclHuK9z7LRIRsWkSV-6zc2nCOLL4Q1345PFz3bZTsnP0_j-k0noC3SWULLjUv8
Message-ID: <CAO9ioeW_EabUpjDZa6w-60=CbDXVgGw0-N2t4Z5SpJPrrhcrtw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: iris: add support for vbv delay
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MCBTYWx0ZWRfX9WaamzoXKLv2
 7vwnmL8I7/pjmBJPBrmsbuYVny8gc5DHiAbNJqcneEPe3zskeQe7kC7euDk4R+TmwdxnwBK3IcK
 PEwXK6Ta4iuGQsL6VELHGqbi5/yLhc0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MCBTYWx0ZWRfX73ftrmAfbEV3
 A5GMmJzWDxcyg/0bWCXPby3tI9lPUhd5X1eZFXZUUtU3xZnvgj6+syR7FVcRHZ7ipdCoEGnAtJF
 f9G9uMJPjj1qNaG6WCuby/2jfjwM978bHZr3wQLzTV9q5ZZAxYuXZDqpIo5dBHO45d0i/oqiHSy
 XAeqzcdnAy3crSh5AWDCtpJGBsEKsJPXar+LLTLlYkrDdGbpIU0aEVUrRzX4vQLlzAdSpZqqHZ+
 IOx4uVlSWnDZ8HVbk7fR6ol5nPfuZ31cHHxtc+heDGSIzTRlE2QtoJOg6uvlUw1LfHKFh7PeldN
 0UkgtqktM1bqgylgJQIrMnVGYMHdtp07OaH/KIyI6xmp+77DzHGn+io07Jo06atwiSjTfUxcAWq
 4AvWwPF0g1Tl30WdQ0F8orKJRnau3jDe5J6wsPyQ4KP+M8zA/GNRfxVdcFnc93KwyDlDgCz32D3
 345hzPWK4Toi0IK9lsw==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbd3ba cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=lQF29MC2Urm1tU4UuJQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 6gcSustMuPddfI2AKUB1ljX9Z0hwXT9Z
X-Proofpoint-GUID: 6gcSustMuPddfI2AKUB1ljX9Z0hwXT9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290060

On Tue, 29 Sept 2026 at 14:54, Sachin Kumar Garg
<sachin.garg@oss.qualcomm.com> wrote:
>
>
>
> On 9/27/2026 11:55 PM, Dmitry Baryshkov wrote:
> > On Sun, Sep 27, 2026 at 09:27:46AM +0530, Sachin Kumar Garg wrote:
> >> Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
> >> exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
> >> HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
> >> is only meaningful for CBR rate-control modes.
> >>
> >> Low VBV delay values (34-100 ms) require the encoder to run
> >> with a single video pipe, so extend iris_set_pipe() to force
> >> work_route to 1 whenever the configured VBV_DELAY falls in that
> >> range.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> >> ---
> >>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 37 +++++++++++++++++++++-
> >>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
> >>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++-
> >>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
> >>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
> >>   5 files changed, 50 insertions(+), 2 deletions(-)
> >>
> >> @@ -541,8 +545,19 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
> >>   int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> >>   {
> >>      const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> >> -    u32 work_route = inst->fw_caps[PIPE].value;
> >> +    u32 work_route = inst->fw_caps[PIPE].max;
> >
> > Why is being set to the max value instead of using the .value?
> >
>
> fw_caps[PIPE].min/.max/.value are all seeded from the same platform
> constant (num_vpp_pipe) at init, so .max and .value were interchangeable
> before this patch. This patch now writes the applied pipe count back
> into .value (used elsewhere for power/cycle estimation), which makes
> .value stateful. Since iris_set_pipe() is re-invoked on every resolution
> change while streaming, seeding work_route from .value would let a
> previous single-pipe override persist as the new baseline on the next
> call, even after the VBV-delay/CBR condition no longer applies. Reading
> from .max instead keeps the default pipe count stable and re-evaluates
> the workaround fresh on every call.

With the .value being written, does it need a lock protection?

>
> Regards,
> Sachin>>        u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> >> +    u32 vbv_delay;
> >> +
> >> +    if (inst->domain == ENCODER &&
> >> +        inst->fw_caps[FRAME_RC_ENABLE].value &&
> >> +        inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
> >> +            vbv_delay = inst->fw_caps[VBV_DELAY].value;
> >> +            if (vbv_delay >= 34 && vbv_delay <= 100)
> >> +                    work_route = 1;
> >> +    }
> >> +
> >> +    inst->fw_caps[PIPE].value = work_route;
> >>
> >>      return hfi_ops->session_set_property(inst, hfi_id,
> >>                                           HFI_HOST_FLAGS_NONE,
>


-- 
With best wishes
Dmitry
