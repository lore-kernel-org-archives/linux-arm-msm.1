Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793892670;
	b=o6jiUFvG7Kn8XIFT6giI65tywviK+/Wd2/IbGTwRUS8rlAP2iJlQCt+0zTsFhCU5Qj1q
	 EmC7Vvg3WFQMWKf2b6jYW5Yiv8cQmMM8Xjaz9LW4JqUi/GKggqZ9gRDBCFmuXF3f5wTJp
	 LfnvbhLMXcMnm9YsCIpvsrlIT1lYwKgcDnZGvh6pZAcL6dW7QMB+NPt+Aij0XIeaWI/UE
	 RSzdzLUX69zcw/vlabJYVtTlg6FXeZN2hFuT+pverQJyGCCM8Glhi3kbpNdHPmZq8GSEW
	 WV3uNi5Hkpfsy+HaUBUcy5eNi+UpqJ9cOmPquFDA44ozZ6AAC0jXQkEwAj2+kpFE2PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UFkEAJQmmDemZrU/BtfBaBHBeF42rbbxl6o22oiQ2UU=;
	b=YWTs15I8UMGh716XI/WpYVyUJMBqMFRLCmzHtUMMFLZ7jGO+gEntAUxEMgGhhlFW0ET0
	 HM89R9hysgI0JCaMF2gyMNhlwf8oHcUr+GSCBvpnNHUIQmzLAh+9o1fuukw++2oFMPi3v
	 eqHv5ICqAsBlrMMUzfuPgxEuhfikA860sgnZpUdlc1kC+wPEOPazE0uEJKqB3RM+XPSZr
	 FcteJcjlKQWJVKEChQCvERJaGco9wwiJOQihvHXdHBH2PJsUovo3rjkclaHiDnIS47OW1
	 gq6EztDDN+SL4MXww2Uw+qFKWl+YEoHrDbszdDwU0aDGZ/OHFidmtBWYarsF+TitqEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YpCZaSlC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1a5+i3m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8FA606A33E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 15:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8FA606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YpCZaSlC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1a5+i3m
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EPrJG2081249
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 15:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFkEAJQmmDemZrU/BtfBaBHBeF42rbbxl6o22oiQ2UU=; b=YpCZaSlC/SvbpXoj
	vaboNeLLY7SdEf4bOTRfvamRZuigFq3U+/Nxx1QeAIcAJThM2ZYkET5hrzc8pD1X
	oBfhAh28sQUJJ2LQOD6VpslRnfNbeGX6OojCu+RNYCyhd1EaFq40FG6NEfiVVgZ2
	I5C8epDQ31Mc4vFcAT2tPqpaiJIZoI8UO5mIR85e0Ww7BVILrWrQv4Kg/RXNrnTa
	iB+K7OEROkw9wzkZ+f2p2vhp/YObYBbP/5IQwpe8xqBIxbZjE/guDyGA3NfERPKc
	w72qhZ52W1j5muVx5ng9UqI6+qDwCOItEude4va0nyKepZ42K2Kht70wQUSWhpC5
	9YOWuA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraas6sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 15:31:09 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-86c3a053d9bso27801657b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 07:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793892668; cv=none;
        d=google.com; s=arc-20260327;
        b=GX6u+81yJBzyZJRqpbZMKLoP8DtoP34hVB8ExjaWhBiGQuxSjbmjBqPH7gY3yak2vE
         gVdiLZf/B9Jxldo+SZ24UiVDgEU/TFxadY3pEyqcKSSsBsuV3Kx4k0QiUyyEkAN/pwF9
         /Zt+KT95j72/8BwvMAM1SQXvZZMH9oS7JuXV3QO2hVOH6ReWwcn5gxpAvKkB3dz9zvYp
         hGZE7N6TMnE6D+znoqumrxa1/0s+kjwfyDG0Xc06yIcxalAyvM3oonErSjgMEO6cbT+n
         sdnkAL5ascQsFtQiQdcKmEq8d/GXWqOCkCkrIxkNy881n1WcJNLajQZjGDBkh91vUIJn
         ysGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UFkEAJQmmDemZrU/BtfBaBHBeF42rbbxl6o22oiQ2UU=;
        fh=GDsBrhDHG4+FD3Yi9RVlRKoii6lBbo2QCL3/2leJink=;
        b=PB2PwHTB7BRPAR5oGJE4MbMpX405cvjyLKhlxag4k3YQHfcio4cWh3rVRrcmYsuR1+
         AwvVPNiLfOeRpyR6zXPZYjY64lKe7k3TyS160nlOwbaicja75XieWj9xC5GpnNMuQz4m
         D6sYzPyKe4GV95lNekcJJL1EvVfX/3zjgznlpaNTNOXNVBeEEi+2m/Z3dM/7LIbJD7a2
         amk6ShIPQ5X1QZcdNdxhkBuLeMYOBnAsiI3p5ASPCbtaMaVJQ5KzHdZEMxizUF/vvDll
         /3riLASrl/pgSRbgcRlXWwpByfVjogw9Zu9/8tjM+em9+vzg7JrNa6tkk0bCN45AKVKg
         7rRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793892668; x=1794497468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UFkEAJQmmDemZrU/BtfBaBHBeF42rbbxl6o22oiQ2UU=;
        b=j1a5+i3mAxQvA36pIHOpnpGCeL0x0DnCf+RmYICQpIyBPXVPMNw4FHEL+adF4jTobM
         BBxsLCARA+AsqCfZm0lHMFnUlo6jFdonN1KabAX2RpT2DDL90o3C13iztZnpotVywQ+6
         LyAuE4tsKAIkoqO34TeZ6uA5qr92LEi7tolefgNdHStK2Cd7okgLaE2d+l7tIAvKKxXG
         SVVO+6r3NQWvPcfI2OE2a9gI74E2rHCz/KiQOGURdj5KHDmISJ4RywTWsVe3SxLvt3l4
         Xzldpuig9LOdRviiKodEpGCkMzl1amJrh0cNQOgwXj3H9vzyf/sEl18sEnjgdmWcgCMj
         8SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892668; x=1794497468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFkEAJQmmDemZrU/BtfBaBHBeF42rbbxl6o22oiQ2UU=;
        b=a6TaGh+wHSb100ksW1a3l699uZolywIpLjebosw2Acx3DAaQN3hSdFQ8R/r3OJ62rZ
         hz1HfNfDn0JK8Z2B262Zne3vTStbHxtg4twp3gnt4kMquqWTkIehK9NOtTlQhu9Jdxgy
         hACEuDSQMIULrXRBVg5patyCMjYxkDYpfSdYkgrrg1nVB0GoqFAJzQhHG4jwGcnn2/RV
         w2y/q18ypLjca+wSBDLncssoxYR0TcgsmM6nNPwmJNSMIJz1ZqeTaas0mVxQD/VzbJcl
         BPG/yx4cTxD0L5UxBr2pQveSc01giUWRcXz5TT4qQvRpjA3wTEN5nviiw0rarxPgZ7Ly
         NZEA==
X-Forwarded-Encrypted: i=1; AKwUvBw4N/9c+ALEPbHI8XYrSwPEdYjCPHqCp8bY5VGqaKxFTPANdPfl43XpaDJtSUFzzBY3vHwcJl4cPJll335A@vger.kernel.org
X-Gm-Message-State: APuU4Z8J60MMI0573XMjY2CQnqE+Rp0qz9j9r+TSQhj7UHPsMJz0dvvB
	L5hzvUI6n9vTonKxO4jRcAiAncQSi0bkxxGdKCHdd1Cc7DNQ9bT7q1CaXhNOlYie1IRZiL1fZ5n
	MOFSJadJcWvmJScou9FrPDaOWNpEKWSblc3Z2ZX8WGi6tnqCwlFWJoZWVSZuGtJfmfpFvkgo1mt
	fRQsbj3MqarGNZJBx/x3Hjy4XI6GjNXSCk7T2C+ZQC+kA=
X-Gm-Gg: AYBFou3VFNLDXT+2nXQQZrec4N6lmXIJKuLicAWgLo7i6qgDFOXN1GHTESgiy6qMcUb
	4SFdejynHJGmqZT58aJpSR9yHRNAR+zCZgdqNdIIQ1RYJ2HDfycYsW/KcCoEQzsMPyxC2VABIXF
	iiVsWOspY9zD+lpdRUJBmTX++3OsrkM9VKRAwwQOkZCCqziV+99RtOS1WRrpnHN8Dd4NIH6m5Cn
	PfmkXGcHAxax+GLHICmLNYQp3zMPcP+G89tsjVz
X-Received: by 2002:a05:690e:1207:b0:66d:112b:769 with SMTP id 956f58d0204a3-67ba4c87f73mr12304242d50.1.1793892668437;
        Thu, 05 Nov 2026 07:31:08 -0800 (PST)
X-Received: by 2002:a05:690e:1207:b0:66d:112b:769 with SMTP id
 956f58d0204a3-67ba4c87f73mr12304223d50.1.1793892667556; Thu, 05 Nov 2026
 07:31:07 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260730062219.2836938-1-sammiee5311@gmail.com>
 <CAGgiveUc+TkGyGDxuuCLpHO=i22-4fn1CqjqnnmWLdWWYOZfPA@mail.gmail.com> <6f2f8357-59ef-491b-95f2-d58feb362ba7@oss.qualcomm.com>
In-Reply-To: <6f2f8357-59ef-491b-95f2-d58feb362ba7@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:30:55 +0100
X-Gm-Features: AclHuK9ffumAB6FDO6iM-oNWXrLUTKEfi4aPTOqEms-G-2LHrNHJadYMbOC2DNQ
Message-ID: <CAGgiveXBc55WKnKiZwPvxZqFe1uHh6dFwSPwMRbFhG9yEFHwbg@mail.gmail.com>
Subject: Re: [PATCH] tee: qcomtee: user: check the parameter count from the supplicant
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX0TzbcEHEI/aB
 fCC6L35wfxlKUfPWCbEIUoOay0/S6AhPhrtteYnLW3JYuW7YLfxMbOGUSBYgWuG9wAdo4pfEi9/
 M8hYTxMispkzlHEpmnjRrEh+COP9nKs=
X-Proofpoint-ORIG-GUID: 5zjuVlTgayiRylqIk0tPzAeaIlV5H9xr
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aeca13d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=RNNYRmto68J4RoQH_uQA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX3owogcJJSqvr
 XL09S8vP2l9UUBifDkx4S3/7mVGyQlzMq9EKNDtL+airqFKukkWbpDFCZpn4urnnGN5xlrsPZE6
 m3NzyRqfSv8zJZIn/TW5Q+WJpAKnpyC5PHJC7ZQxT2onOEttZCys6dYfs5y6mfliUCmEoxvaLyL
 FRUR4OFup+sHQKi3OEPPZBk3D08FghU1/abpoxVxBiVA+XPTko3mJgMziD5FhMftDf/2hTfyayB
 vzwQuWJdlxdUT3DgFEqJFuoZ+QP0owTAl6jRRfcGVW2UnPaogneG9Am/jn0gVR+amFuY6K6Mn60
 rOctLBI/z2wL8U9DPPKi21MbvyL9ilpvQsun+7Bf0nzdTbssOuUsU/41TSft8z0fL/c+FLAvTKE
 fOMxXJAA2fZvt+Mja1b0tDG4zpWyf6S21wbJXLvSl47qtDmU85GCnQK73G1LaOjd0LTjNkTqwiQ
 nm2ZdY3IWo7ZTqt6N3Q==
X-Proofpoint-GUID: 5zjuVlTgayiRylqIk0tPzAeaIlV5H9xr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050061

On Wed, Nov 4, 2026 at 8:37=E2=80=AFPM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi Jens,
>
> On 11/4/2026 4:58 AM, Jens Wiklander wrote:
> > Hi,
> >
> > On Wed, Aug 5, 2026 at 11:23=E2=80=AFAM HyeongJun An <sammiee5311@gmail=
.com> wrote:
> >>
> >> The qcomtee_cb_params_to_args() walks the argument array QTEE asked fo=
r and
> >> indexes the parameter array the supplicant supplied, but it never look=
s at
> >> num_params. A supplicant that answers TEE_IOC_SUPPL_SEND with fewer
> >> parameters than the request needs makes that walk read past the end of=
 the
> >> allocation.
> >>
> >> To fix this, reject a response that is too short, the way ureq_select(=
)
> >> already does for the receive direction.
> >>
> >> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> >> Assisted-by: Claude:claude-opus-5
> >> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> >> ---
> >>  drivers/tee/qcomtee/user_obj.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user=
_obj.c
> >> index 10452fcc7ccb..2a594ae299da 100644
> >> --- a/drivers/tee/qcomtee/user_obj.c
> >> +++ b/drivers/tee/qcomtee/user_obj.c
> >> @@ -507,6 +507,10 @@ static int qcomtee_cb_params_to_args(struct qcomt=
ee_arg *u,
> >>  {
> >>         int i;
> >>
> >> +       /* Supplicant can not send fewer parameters than requested. */
> >> +       if (num_params < qcomtee_args_len(u))
> >> +               return -EINVAL;
> >> +
> >>         qcomtee_arg_for_each(i, u) {
> >>                 switch (u[i].type) {
> >>                 case QCOMTEE_ARG_TYPE_IB:
> >> --
> >> 2.43.0
> >>
> >
> > Looks good. Amir, do you agree?
>
> Yes. It's correct. The check is missing.
>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

I'm picking this up and dropping the Assisted-by tag since we don't
use that anymore.

Cheers,
Jens
