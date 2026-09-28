Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C88637B01E
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581820; cv=pass; b=X+c906cWGhy0/lDujGLCka+3KXiQ8VHIp7jHmD29yHHoRAOG9ZUQoVpnVrc6auPw7tGRUbZlZy+wo/bAyPtIblm3l/LskBn9AQ1lej0JFHVcqO+9VeqXqiHzkk7kH54rOPigclu1n+QUaMhXMJ6vkl4kgqFtP1vjhfYeji4a9xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581820; c=relaxed/simple;
	bh=oM/kARcWbvXXKH9Xq2YfQCxMNZfj4FIob4Gex0PqaWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5/ImRRoTBgTumBgv12dh6naJw9/+L8MYHf6y3xPUPKrWwp6LrkbAwliv+tKlh5NmdA0XoB0AT7ymuszKJ6YcF3AjR9mVvFWc1xG6M8vi+NBmSd1GaRAkgUh7pLQBnDYAFs0RmW6NLkzdm7txgrlShDU4Ipuf/hN8O3YqEakjGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYT3RpTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdNu+Q8M; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYT3RpTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdNu+Q8M"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S6p2cL3167999
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POnKgmLt09qWE2p/7yWzeUW94w7CwA0WKPP2q2akDR4=; b=YYT3RpTkQJou6Zam
	/hJVzhZRRjMAK7jA5ckgI1KYWi4eEl5IzbXGSA9jUlcuIgr+l2ylCCyWd6/xmQ0O
	qcPmW/VLqqwOgV592wPHB+5mRV0WkIr1hF9n1cS1ehKvZEy0DGIifqIUKPpNxlxx
	3RA0sPWx2oFJ0FFoVu781GrIwYoYOfEo3CUMvqtyscdV3VjmHXrwV4HuxWttUiA1
	V4avk4ZlrXFG4M0ih5EdP7qQOFD4rH7nAE5MOGC4bJ2EQyq8R7PvBjjfkJTH11OU
	6aAiqzmhS+slpXnwbFGvn+H3vzllJqQUPTatDwuae6h+LJxUA2JkGQq5Xda1YlzA
	O9q8mA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jvyf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:50:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso653299185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 00:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790581817; cv=none;
        d=google.com; s=arc-20260327;
        b=qB0T3TrQoAcuVoWWwNlkhCtAmvZi+UNAWZ2daFlP3CtO8OhDNj++iOogaW0DJkYo8g
         QcKOFdIHdAi7UgzUkfyuLZ+VbnPi1wsrCAnUKZctU1p+RPJOB5Wc/ZHN1Q7YwIKOYcVo
         sbkcce+9TQ1a1+FjO+0dYP1OFKJ8KvKuWA58/Sy0BsrNHYP2vmp3eGpWe0EFnf+xi8c6
         FLbP3Lt9epwCXEhDbLax6GrjJVhQvjUuR/NEVRJ0ja7Pz/l9L/lzznrePRk5PtmUqsyc
         /Yeer3djvpzQathnUEcszkw/rIABNgVr6cGi9C4i7k3QjLz6b9ln2iGwOiS0SuC2kHc1
         3dUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=POnKgmLt09qWE2p/7yWzeUW94w7CwA0WKPP2q2akDR4=;
        fh=sxX5FNKYnX3Rmf2UyajQnPL0LugLQ1N4c0bU/DgdY0M=;
        b=knWXzWM9iFgWSsPTUiKCEnSWPFbfwUL7yYF2D9+SbdKwE8lWU/h7wRJ/DHInam8IQ3
         pt06QpzjRRAelgCAEjY6uqi7dcGKfPRpd518xGqTPgMpEE/QuNN+q7TfSdtHeOQeHixe
         CxFMo3oWSdmkKj/DoGeHt+RfO+UrcZg/NPVw+3VLqSXwciB4DQCsZYhBcgHBfuVDum7U
         Mhg07by4EdjXkN1g6NoXxM4vn/Z9LQq1e6o3z6iRzmpI7Y7H5rHt1x/OTxpnU7puPTxN
         yt5AdFmAY++JC08BEw74+NesvcORtWv2MHRDbq+HPqh7lIpOfZpkaxhWk0zbLUOzpl58
         UN0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790581817; x=1791186617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=POnKgmLt09qWE2p/7yWzeUW94w7CwA0WKPP2q2akDR4=;
        b=jdNu+Q8Moalborfq+C/0l7cEVgV/g3z46FZZd/aeDrl1kUtNSAWkkLB5VlJUf+gWBo
         fpNd9WnLJzZdWOQOI99F3Jf+2yv0JGowk86Wfn1W9+MCh4TB7TLx+nUGlGeWotzTjWc6
         t5jCpUE4UETLrcusg1pyfjsXOEnPr+Z/BbGM4ihxiMlJK0y2Q8xE3yfdtrEhzgSwk+nD
         YQrifNQ1EqBfWHSUUK67M4dLlkJ/12S4VmNWQT4PmyL3awRaeny8sDoitU8TArfuAvae
         9V8g+BnvRUCqN8cH7uxw90lntROLbBhldLAx7C2odkVzUWC/IFq1uABzUrVgS3l9VTNJ
         gwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581817; x=1791186617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POnKgmLt09qWE2p/7yWzeUW94w7CwA0WKPP2q2akDR4=;
        b=jrykWVZ6jGvjm14OhGZbRmW+R/d4PzUdm56BkGkWs2pgO8nptmVzPraVMKkyhVQjeu
         WH1oz/iz4NGgnVHcQGGtFHO8g1tIPthylCb8l6z+u3H4BQ8xYlmsOv6jq1NZFJ4+cTNu
         fxb5jSRC27avd66gY+OQMWiaBuXcbl7TFBt0W8k5cIjQqmzIKzGxCcVLaSMTy4UQ9Hxd
         PC5WGT8LjlsXeFFw3lD3Qzlx/bPZwEkY6xXEr1T6oQO/8oLmTD2ZNCj2ZiQ++OE2R/7+
         ILYy81pyzI8ABlriXfFZ+cdjVpbnR1AtoGpYqUWNxIFSbJn3Q8Sm3UiI0TbLd7qM0XTt
         K89g==
X-Forwarded-Encrypted: i=1; AKwUvBylMIySaZ9CPpGVCi6Mq4U7b1zeKSeoI6CNFEoSfAhQJmALXkeXXeyDTHiGlBlASOIjUhceLulyufiyRJHN@vger.kernel.org
X-Gm-Message-State: AFuF++mGhPWhU/e+1dntXKxp9kvTEofuYzMrEsRGnRo0+XXQzOMPrdPK
	rhvcSdT+UIFtbcNXnRou36V3oK2F12dobPl92MOKMn4+jlgXSbQwKq8m7+3lg4Nn7Sx8A1lACJL
	Q5rqEgEJwWqIFzFXj863YBB7gzTt0TRZIpXa42Ous9wYxUS86V3fcXnNVkrMV+oqddkCZ0Dji9m
	C28ribDuNy8GeLQDLD3+FVcWwEBAImG9vPinMBvB7338w=
X-Gm-Gg: AYBFou2s+FrWb4TWdZcA3JlaLVdyfhQpG7vGplQ/ila9fQKP74YX9M+ROyV2MnyY34+
	/bLWAh144W/YhfmSyYAyzRjQO7girmF6pDh0AiTtYBn8X36LrHlJotDDt+sfmWcvzZZ/L9pyCk9
	CX39KPBUGmPwU9/0IcE+Gy8i41OggMeTnnqVTgsoNuZZIxyYgy79g+DjVCNiXsVV8X+ug3EqMaX
	eIPpKcDWI6saqL9SGTrFNThpHXbDDaFF+8Ixv8YPAY4Z+rXNw72jD79fpkSuV4SFbCACHjLvs0=
X-Received: by 2002:a05:620a:471f:b0:93b:d7a0:d9e5 with SMTP id af79cd13be357-93c43d749c7mr1883509685a.63.1790581816700;
        Mon, 28 Sep 2026 00:50:16 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:93b:d7a0:d9e5 with SMTP id
 af79cd13be357-93c43d749c7mr1883507685a.63.1790581816214; Mon, 28 Sep 2026
 00:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064336.272659-1-hitesh@ebytelogic.com> <20260928064336.272659-3-hitesh@ebytelogic.com>
In-Reply-To: <20260928064336.272659-3-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:50:05 +0200
X-Gm-Features: AclHuK-1bScZDI2Kq8qDaDpz0Ihb6vAst2esegxj3mK9B7Q_HqIqbUAYq3CsyRE
Message-ID: <CAFEp6-1szHugZNKXpyNwBEREJ7au7F9F4qxy11X632C9h9q46w@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] media: qcom: camss: vfe-17x: Fix write master
 selection for RDI lines
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX/haa1W4Vac1f
 Xyd39Ymi5/RRqlRufnd/iUhYKyVbLhdTiJSNloXcP8bTqspfNMuNz9fQogjW5AQL4hoJ0vjapNf
 8cbuCslUcQF6oFzSLeNV1TlK4weazDE=
X-Proofpoint-GUID: k3qitFLYDGIZgm4rVjDhcqwQW_OO33Jm
X-Proofpoint-ORIG-GUID: k3qitFLYDGIZgm4rVjDhcqwQW_OO33Jm
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6aba1c39 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ZovgdgjKAAAA:8 a=EUspDBNiAAAA:8
 a=Pns92UxjTm5tqybKbc4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX5O4879H6GMFE
 f+SwBEq//1ZVwkz8kfhkT+Mp3DFsI+UkqF5QsxnmU3yaGTb3DZ7scTiZYdvOIFOvWIjfAvXf5OF
 gIGZjWftH3zmwz0Eq4FrAJb/WhBkpphzlatBusllRGURkFyMakGycwyfquC3sap52JgGAm1ADLJ
 Df4AVnpUJUCgf8MTSU1xPPFPpDGE5DtEXbnoffolmO+/eSZx6zALluReDec2YBjj4ZM9pUmwiKk
 GIjRe39SUnx9RItjPj00ai7Gcx0np8fMljsSzrI+aRkGGXZcvSjq6I/OBo2G/jeNecZHrRE1NS4
 Rpxyh8/lRVgb8o1omSHprj92gSoZ6fRCpCy1IJMGMSdMZXYPeTmgmlJlCE9TcB63zAZD67jjvnk
 8Ym6BQPzI/49sVb2kQnAzYP2jJy919GoyUtblmlYuDA8m7ln55tTYYEEQhW5ERA30aeuC5WL94s
 sxNfZio7DxTg5bSBZIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280031

On Mon, Sep 28, 2026 at 8:43=E2=80=AFAM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> On the gen2 VFE bus there is no crossbar between the RDI paths and
> the bus write masters: RDI n is served by write master n. The common
> vfe_get_output_v2() reflects this by mapping line->id to write master
> line->id, and every gen2 VFE except 17x uses it.
>
> The 17x code kept its own vfe_get_output(), which reserves whichever
> write master is free first. That happens to be the right one as long
> as a single line streams and it is RDI0. As soon as two lines of the
> same VFE stream, for instance two virtual channels demultiplexed by
> the CSID to RDI0 and RDI1, the second line to start is given the
> write master of the other RDI. Both write masters are then programmed
> with the buffer address and frame size of the wrong line. The frames
> are truncated to the smaller of the two buffers and the SMMU faults
> on the larger one.
>
> Use vfe_get_output_v2() on 17x like the other gen2 VFEs and drop the
> duplicate. This also removes an error path that released
> output->wm_idx[0] before it had been assigned.
>
> The gen1 VFEs are not affected: they have a bus crossbar and any write
> master can serve any line, so vfe_reserve_wm() is correct there.
>
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version =
Titan 170")
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../media/platform/qcom/camss/camss-vfe-17x.c | 41 +------------------
>  1 file changed, 1 insertion(+), 40 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index c011f64f63..62c2405359 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -382,45 +382,6 @@ static int vfe_halt(struct vfe_device *vfe)
>         return 0;
>  }
>
> -static int vfe_get_output(struct vfe_line *line)
> -{
> -       struct vfe_device *vfe =3D to_vfe(line);
> -       struct vfe_output *output;
> -       unsigned long flags;
> -       int wm_idx;
> -
> -       spin_lock_irqsave(&vfe->output_lock, flags);
> -
> -       output =3D &line->output;
> -       if (output->state > VFE_OUTPUT_RESERVED) {
> -               dev_err(vfe->camss->dev, "Output is running\n");
> -               goto error;
> -       }
> -
> -       output->wm_num =3D 1;
> -
> -       wm_idx =3D vfe_reserve_wm(vfe, line->id);
> -       if (wm_idx < 0) {
> -               dev_err(vfe->camss->dev, "Can not reserve wm\n");
> -               goto error_get_wm;
> -       }
> -       output->wm_idx[0] =3D wm_idx;
> -
> -       output->drop_update_idx =3D 0;
> -
> -       spin_unlock_irqrestore(&vfe->output_lock, flags);
> -
> -       return 0;
> -
> -error_get_wm:
> -       vfe_release_wm(vfe, output->wm_idx[0]);
> -       output->state =3D VFE_OUTPUT_OFF;
> -error:
> -       spin_unlock_irqrestore(&vfe->output_lock, flags);
> -
> -       return -EINVAL;
> -}
> -
>  /*
>   * vfe_enable - Enable streaming on VFE line
>   * @line: VFE line
> @@ -441,7 +402,7 @@ static int vfe_enable(struct vfe_line *line)
>
>         mutex_unlock(&vfe->stream_lock);
>
> -       ret =3D vfe_get_output(line);
> +       ret =3D vfe_get_output_v2(line);
>         if (ret < 0)
>                 goto error_get_output;
>
> --
> 2.43.0
>
