Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715268;
	b=q9LHwpgvC6ssz1a0SU8eiGQgm7L2KJIGcP4QjZJI20eydZSodxq3j3zIqCR+zkuWQ936
	 Su9BGP43DeigaObbhZtC2OdsQltmfrn4rveBHSQ0a6LpwPC/ET8gpj6+B4c82VDPK2CL9
	 /8bu2T0aR+JfaZN3dIwBhXxbCYmlGL9OzeOA3WN7vNPKj5SXgckooHZrRqS40vFdYAP/O
	 NAHkf497l8/n/Zp97sHEvonyGRFgbGJAaX7MEGMgVlHYbhWE3/a5XN5Tr7yimYlASUHiT
	 t5bbkuksY2t+APlX7CE2iSJXutLJljYn6eS7ze4gHM4JG/TyrIOltrjLw4wNpgyC0tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pwZoBqfoFo0YvlCchBXW5lqCWHboNX5xMKkZiBuo0BM=;
	b=ZaxzKEZ0C2ViP1gDWXJJfm+RprNlfynMKCf965BgKCKv6BTMTCmiNh1ZERTtzs9euCQ+
	 Lcxt5ylUeP/NqKd3RWR5et3dEkgmsJIfNeo3qSgB5FkThaJoyaNYamlw1JZ3HJuXvZPfZ
	 kwsPyx+5N0k5TSHzbm7pPuFVmfcEGfaVWFuEg7fDV2h45oXT9FIOWECDqgIvWSvgq06sP
	 r2znWhzTkcA73zfZKghMfa5zZDr1lUMr6IOgjBmWrBFnnJvCpxZ69wY+jlKLsSaFtFfZ8
	 h8Lv/m/oOpTepaW6kBXMhjj6Ti3lKIhBM0aoHTlYLn4ErINvma0tuuozTTKIIwVFXoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=alDpBw9D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOg0VUJc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CB2606A327
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73CB2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=alDpBw9D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOg0VUJc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9mou4049174
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 14:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=pwZoBqfoFo0YvlCchBXW5lqCWHboNX5xMKkZiBuo0BM=; b=al
	DpBw9DPHjAUfwbzkD0sAKBDIVF62V2+19WyArxit3bDezESsDCPMf1kSqRUhu9U5
	RdTqdILrnNSAjGmrOeLPaKWoqhwEv3Q9+sAAYbE3txbYTUjHHewo0gbQPAEqQo4g
	OpI7f7ghVq/LqZXoL1tyICHHw/E4ez5ACiB5rzCkKNQGnNXl6Aw6T72vIpNSn3am
	H8aXTxi3XvZFdhrwWGrIeiXRFBKsMWpMWZNHDi77WRiNauREEoedC/Z2UuY6Bp2j
	k13nSdOm5GIVu+nDivITx4PLxx4pEd4qWF/w48+KlXz6xfzKNNayfH2QwQdXVsFC
	Sj7cHzrlwKfLBrUk8srQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy381u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:14:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so17454557eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715266; cv=none;
        d=google.com; s=arc-20260327;
        b=iHDGcuu6UyewqVCKzzG2MAxT1ZfHDSXe9Sy8nuyAWJjRsDYyXYLFpIQJaR2+EJlShm
         XuMMpi24kFZlkGR/tuYksemv3+CvH4nWX9KjpSS2ClM8dj05Qol1scPJCI7ydUqEp3RT
         1EO7zkNyOrDPH1yiIF3TfUC8oHSExK80DYy+gtC6p2bEEFd0lA5dqMUW33k/8d1T5Hfa
         hIDs2kwY5DCksx4cYXmPlC0z7dbG0BsOFqVNVnFNriNS0ltJWmR71PMFh8Xf9/l0i2Kd
         g9wkZzZre4GV0AuFqDAhmd2coX8yCJJAiub90cJnjZCaeQCUgSDp5kOl36MY6jz34UMe
         K2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=pwZoBqfoFo0YvlCchBXW5lqCWHboNX5xMKkZiBuo0BM=;
        fh=sF3Fxpy4r0qfflQvszWsZOL/ZtIa2ivnu6avzz/V+zQ=;
        b=NKxkjwsDXXRu/YtfKkCeVHjC1S786dTL7DUsv+X0o2pKZ6lJuYTx5P1kA9E7/H0Z4C
         CBD3Qc0AT8k6ABUAWYY5CtK74Q4Sg58bZDH5LE/lLXURoyb0H/vQ/FV9LRI65rUjREu3
         KVSYdQnrElOFicMjpcXj9W6zml/jZANt9g3z6jo4gq5g4Q9ohY1zlEoz3jEXTrXfwolr
         qwAYUrHWME73GCiJxWb4NLTB3s5rvW5ny3gMKc/s9Uix1/Ce1Kl5dss0d0+yq8vTHTxx
         G9rMD/ldsXD7y7rI53fuWgD4KQuzguZ1D39cNCSN4TfFrFBV74gR/VMxefo46xLgNPFG
         Z0pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715266; x=1794320066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pwZoBqfoFo0YvlCchBXW5lqCWHboNX5xMKkZiBuo0BM=;
        b=NOg0VUJcU6Od0U/ng/VIjG88q7xad/yviyCrIFzRFErYbsjn/O2qyS6oHRau/pYE1X
         FACI3l93NjBQzCjqV0jwtoqANTqLKhjQ7ShTYx23ippNWtHY0NlNT6w8JcLyfvW5fmUy
         qfnyL8bNyrz725UI2W8fLwtHD7/a7LMFC6d5cJF6dD/tkpL8/+6xAFXAy4x3rh1wuSJk
         bkb1t2pEjGvSwIfo31kI6CMx8BVH4mwvDxYqb5BcaKV2QDzwxhA3Upd2srHXNtkKSqUo
         n+MPVmHIHnQb+0U+mTisRJyG1/yQsiON4gBWCL7WNHb2vHSUGMee6mJJfd5uJqJmIuUa
         jlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715266; x=1794320066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwZoBqfoFo0YvlCchBXW5lqCWHboNX5xMKkZiBuo0BM=;
        b=Z1GbHGya2BF4ANaCv9vFpPgKjKb7ezTBkcXnr46TVNheJi0xJ07BHGQALmoVgvlvBB
         HPkgm389EGzxPOU/d6CEb1wDDsfrBVXp9ECdxdlO5yEmRI+0sE+w8LkzhAaA+sEGY//o
         KO7Vb5zcUklbg8B8aYOCZZmRruq/THqBuymJ0in+Fl512BK9I5XipNCXR+SwaKmAcucG
         V4v2JlwXC9oC9VsJjECIuv6iYUIPC/zjahYGRIsqp2iuIivp8sE14AjtstBgjZNil3yb
         VW31hw2F+JthxCTAABes1OZDoYxo3ran5I9WrGgzm7OvhNWy3J+z/bQBLnC+Tm4RhpaV
         OTYQ==
X-Gm-Message-State: APuU4Z/F//Dyc2VJ317G0OItefl1hZFp8dxW9ejZ0p03aMYmZXAulnY2
	PQOD1NKfPBe4d2ftZ85vqpvIRWDbfZuXRkI+hZvMQ9btyhIgpcuSsw5nznB1w4nviAGzt+HBRcu
	F4ReLZ9q3t3ixRPr+i6NEsPD7ZMAHqrv+CUv73xpeWelfmuM5mRSlwZWn2V+UkR0cC00U4vxePn
	w29SmTBzB1Fn7m5uCV+FQy2tPyfmRzBdn+FYnAG/bMPe8=
X-Gm-Gg: AYBFou0fr9+4Cc72oDNrtTUj5vI0TFXkMV8DsrVqymsPe63Hf7QfXw1F1ezD2wD3OoP
	xphrvkEFkOdqXIujEPLSIn/5cQiK0fp4CrH3ZzUsf8XkkqjVIydPh78ppA2YunD95ZxopMeUGBK
	18XU66Q2KY6ofkGH+yGIuCA6DLdMtgsu4/K4/Ht+TAmT+12tm6lXbO671b+w==
X-Received: by 2002:a05:701b:2050:10b0:152:92c6:8b58 with SMTP id a92af1059eb24-1ac5c555078mr21077430c88.35.1793715265963;
        Tue, 03 Nov 2026 06:14:25 -0800 (PST)
X-Received: by 2002:a05:701b:2050:10b0:152:92c6:8b58 with SMTP id
 a92af1059eb24-1ac5c555078mr21077404c88.35.1793715265400; Tue, 03 Nov 2026
 06:14:25 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com> <20261102172001.508440-5-robin.clark@oss.qualcomm.com>
In-Reply-To: <20261102172001.508440-5-robin.clark@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 06:14:13 -0800
X-Gm-Features: AclHuK8L2yW1PaKznz8lmJSJhTx7osRp-6K0SX6zJK8oMud99n8w6-qv_LxHXDs
Message-ID: <CACSVV00rYMk1E+Ajv4mUCPEiBkaptqRFskB91om+uAHdc1T93g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/msm/gem: Clear nr_ops in lookup_ops() failure path
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Z-BsSN4SVVqSGIM_z93hr_UUaBFtsHdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX9MosnJOLEaE8
 N47leKZANnhlTOO5Ex0q2EhKskoPh3NAoc093VjobReiQGwOFyxhzL4EWCHdbHC+LWPWb5ozp8W
 ZwLQlo1rf2tb9iruFMmVfvlX53GbHoFLhx9Js2m9M4oElgsR/LPzOBpHddDpRxmML5pRSCM0TFp
 Lm4nmYMPJIsl6VSuH+zOd67+VpLbm9BFklG8J3S83KmSMPwA0GoCEzpGdQwFjIDOtWxgtoGwMvp
 BdK3tkgECmHdDsUV8LvceCwvYQHiVHt9dU5V/+lWO26uGLYWRhd66G0og3tQ19Gr30BXWnM6/Z7
 nhkxCuUHYwFpP+LJeOAZ0v+pZD2/MyEKfrWz7A8s46ojjW12NKTvUA5RbW0xkY9mgiYHKKmyoMs
 ZWKw23LZfE20IvdKT8nAlp3eWFmZB6RMTjS+EpLD24WH2oxYP/8ewhM2UgH7bAlqSKFHeTFb6sq
 HyhczJTTPBlt2H59ELg==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9ec42 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=b_1sW29P2VfG_wUA9JQA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Z-BsSN4SVVqSGIM_z93hr_UUaBFtsHdG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX+SAYGO86glIS
 TXz4MTHGOvUYjrvuXJSuqUr8+QX0koEXV9fxqm5U6ztGTJ/Ola+pImCtJs3Ekn2/YwQvNI+H/QQ
 G45WxWfNxZEn9SRpJCkX1uWsS0G392E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030056

On Mon, Nov 2, 2026 at 9:20=E2=80=AFAM Rob Clark <robin.clark@oss.qualcomm.=
com> wrote:
>
> We've already dropped the references taken in the handle lookup loop, so
> we don't want to drop them again in msm_vma_job_free().
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")

> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 3177461d7ad0..8b702422030a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1088,7 +1088,6 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job,=
 struct drm_msm_vm_bind *args
>         }
>
>         if (ret) {
> -               job->nr_ops =3D 0;
>                 goto out;
>         }
>
> @@ -1143,6 +1142,9 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job,=
 struct drm_msm_vm_bind *args
>                 }
>         }
>  out:
> +       if (ret)
> +               job->nr_ops =3D 0;
> +
>         return ret;
>  }
>
> --
> 2.56.0
>
