Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9733CC300
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738139; cv=pass; b=lmqoOVE+xG+Lt2oqgp2BQE2woTEtV7jOubeJe7MTITJQqobzh8F81UhLlxWXcRo0NwqnwTQux2POKdjrtVbiLRrKcQU8HikQK4U2XKLEbjNZvMMbSpim/97ac99+jUw7ZOwI/846d1JKyaJkJ0E9eU0nCbUk87Bb7lI0sH3jSz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738139; c=relaxed/simple;
	bh=b3ei/scJgqf6mMPZy0JCl3AJkVZk5UcyBZq61g3/Kfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eixVo2jK/jZqxwfiFlfSY6o0+OsQoVIQUtDd4lJXFLK2aBvsOt+u52OkNaAdubqMfyF6NBX86OL32ozBbmSn+48I4Ow4KdqvN/CH/ilRYSkzt+R5Rw5ZInn082EYfzodsM+mWNijZIJzIED6f9gWi1ysZYS/Ti6ph/Te/rMJPGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/2GLpI4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPnlqtcc; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/2GLpI4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPnlqtcc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CXnD371454
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=; b=h/2GLpI4/WKJvtw/
	YGFKEd2wE1FIgXMBc8uz9Oa/LQNNavC/FHWVsU9LHeSx5xOuxTTNO31BXU1udSK8
	ZFhZzyXSonIO7y/DDZmJ+2WvjzKuN4ldXt/YXkz44Uah3R/93D1VPtM9CTIdHGMR
	y2s0lNnsKQ3rQbuNw+EOUMTBJoSKMTkDXI9Sl1aXPWnpsLzlSu3BHtw+04yIjzhd
	XY5HpIK8dvmJkjNyOHm7ele3ZJL6FIqEJB+wV9rEA15AoEO2N4h6n15ozB8xSdOm
	AkB3ZcAFKLX4M8K3oWE1Y92h3GBlQOv8wZL6bdStvJXkG2xqGjpgsU/u2t4Y58cQ
	VxBLJg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgpv4mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:55:37 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-858b746a9a8so8074387b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787738137; cv=none;
        d=google.com; s=arc-20260327;
        b=ffXRDVi9CmpkTPSljLh8soCx0SaQqjqGPnEDCyw6RhJMwaZeMbn2UOGv9ML+JtsELd
         KUQHwit02uoJ6OrJNRG5qVMIwJbOpGpbHACzgHSmE7yJxT7XSjZOH0lSkLxUD7PuMA01
         wudsOipCQJ+fS3zbsdA5gx3TDpk4n38M7ru4Nx6pXoC0KZuOvcOwTegHLjoU/IXwHNpO
         dZOGnXlr1CgtBGwAWPaht3vkHoa7WGdZTUnpYMzwjqaoK8WBtWOkAhrrcsnt0ZanAPti
         xoTTY7fO1BkvWlK4BXGFCyKO2bH6Z+JTFDxQaqDEC1+qlKVa9AchZcQtGxm8ELyWlTm/
         DI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=;
        fh=+E4zGJ8HQnCiuX4q3nMzX4EtrW/WESh4oKKYL9XsC7k=;
        b=bcPaQqxHYYMRQ374h8Ajkw0MtJnqYMSO9EQgr2iWptwKpBNCJOgL0DhsFkJTqAOsID
         Gq/oJxv1mEYW0ZQKliBQqQKTlKgepxLdo9+gewcWXahLgrSFn5KL8jlYp2q33Q8KYEQM
         gqJHyR5oIXwkBNpH3rzo/mnDs1sSuCX/2V5FxQsO7iK2XKN9zUEbGMG/dtei4/3DfPq8
         P28WocBlbvw8dmlLZdjbIn3dfdObOGNH8ATgsdNQHZCQJagxLwjjAn8Ijj7RhbT8XkWB
         Vm/2DL0rTZvZcV28zBP7qQUphn+qcy2sYyiMJbQ2o3j7qqWjUhp+gYxEtQj8G/Ww+5Ei
         JnlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787738137; x=1788342937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=;
        b=WPnlqtcckeQqCz1nMKclH0LJLERaEXrDf8JXG+Eyk2mqadC4QZusJCUOHdcwQ75rwp
         R7iwDd4607o33V+K+jUVZ4faKV+toeJ3uk87nVAY4qQ1yqD+GioRO3VbjSe1NfQn5khL
         U7paOrfjzgz/DLlBJ1pfZu2mAo7kFUNROczAoe1573fQQGE1Yn8OXzglNT5q2H70cpQp
         lxoYyt3goG4OhsEb2MIPoDabr59K54eRZF5pVhfO0NCwqDGZHy3L7C5atAobuuaRdaJs
         HUJh5VXERxlnyWRGCanDCp7jBWg94EuTD74nytnDFnAzHBoe2fxk/MyfG3pGm7nLT+wN
         u3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738137; x=1788342937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=;
        b=WHRSpVMX6cLfPUgwZwrlBm7eq3R9Yzbk4UH2zt8lIZFRcnaLCMEGJ4kFcjAo6dn7Qe
         jwtKU3Rq6TgyIc5+mN5TocsHjQA5NY8dCzmT2wAkYy6baKpE9ZhhziyzvEJyz+Mee9Jb
         6f1K8+eIFqjgTB/OK9oSbzlKmKtMW8mOn2ydznTQHVF4bOPhaU8PigKa5P+GLIUU5E40
         gY8bj24HgsFSgLu/FU0U3cVrQEVh3oGqSq/tnNxSMCAXnIRuwkXmo29dO2sJzYJlZPHF
         KEH+Ke40j2LFrccoE7RgchDMLe+ZMh0l+cMMrAekeCH1RgkgwmSMP8BkY7lP7vEWY7Xr
         yoYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rro55oUL9NhspnHJ5/nBiN4LVOUnpRW9KJGdtXD3cyisByvpoiOKIW38g50fNVCP3d8utB9sb38ycOnC/Po@vger.kernel.org
X-Gm-Message-State: AFuF++nUsy3peDkiNaAj50Z+2x3nfEhJgc9d9WhWaa+5FkwraW/GT32C
	qybNkacC9uRWL3xSWk80/RxFeIhi8ymJer7sI1igEFhw2rt6vuUE5JyyT6y14KFDqQFvvs3YT6W
	xat3XVf5ULB2PfAL3fjH+JMyvjfS/bgWXXObq6Ou4s1LvRRxRajTAjx0DAd2Z9nwmXZj2vCSYdy
	+RwRj2k476ZTOtmGqNNS2ln/iGxvqSfriAPaOFtumTWBY=
X-Gm-Gg: AR+sD115yIlBLi8DS/xz8bmevrH/T2N38Mjrtb2HHITuLzUEPALr0RlWg4gQf2Xn0q+
	sGV4fpEkW9xwPRT18j2cNymZuTMsRKF7BzZOOXTUIfIKQYJqqr6NauLlh04RnDlBCmOhew+ae6q
	gbzZtMJe/IGNDrhZcQjN+NiYxRw+1m7Peow1EalgD9+F7PHpTi4q4fn4/IcA==
X-Received: by 2002:a05:690c:4b8f:b0:816:b469:ccec with SMTP id 00721157ae682-8573cfbda13mr22927767b3.15.1787738136550;
        Wed, 26 Aug 2026 02:55:36 -0700 (PDT)
X-Received: by 2002:a05:690c:4b8f:b0:816:b469:ccec with SMTP id
 00721157ae682-8573cfbda13mr22927347b3.15.1787738135581; Wed, 26 Aug 2026
 02:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
In-Reply-To: <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:25:23 +0530
X-Gm-Features: AcwNN1WVFRPvlQgvshmc0r_etw3NSt1fZg4y_jOiN4z4411feqSqHUo8KXSuovQ
Message-ID: <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: cE7Wr8JhC4qRNxWicqR3dJ8gMbpWsRJO
X-Proofpoint-ORIG-GUID: cE7Wr8JhC4qRNxWicqR3dJ8gMbpWsRJO
X-Authority-Analysis: v=2.4 cv=I+NVgtgg c=1 sm=1 tr=0 ts=6a8eb819 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=0RC-DErAFZYGOsEwKv0A:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX23zMid/udLpZ
 Q8ze3mO0nYA9pXfanCCNp/DcV+W/dhOSJQ1svY5WW1Cbp+QYm6F0LLLk/KMZyDl83VgQ5IdHxiJ
 oYBP7sVsbqSBBD+VR0g+u63WPqUmbC0eyPWrSW8ip53HpfrpYcb+IhZpSbWdoHyHklfrFbsH5kA
 AkZOry7icPFZAGKUChQQH6efMbDrvxZYAdRjy1KxJr9jjC3pEnbJikNraNA2T2fF6VoB4snsm67
 oba8FEXS1n3ftP6himTvNc5woK8r7elIBUwzyPsk319lCm8UzcoGFP5y2g6s7SDzfkgip1NABPV
 9+r5V6umd1zn88KX9bi/t0T2UQzzsqSk1YHCXexXRnVhHSuXqay9kqflo7qM4PiRrTT7/ZUBJOc
 Dig/Z4fPaou6kQwD8bMgYjUgXoMXiAo1AtZMUOF39Uq16o8lQInNkwTh+SsnpaiK5dxAnFbAjPZ
 TxnaxH0jjB4tc2XfBnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX//FsCvzu9rpd
 C097V+ZIBzhJt1W4NMgs7vJxEdtZhu1s+aCbo5kuD7h+EIHbG1Nu14C4y6ZI9mnUBNKK5TT0Hm8
 IAVXzl9l8IxQSDUx8go6/C4+rQaP268=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260081

On Wed, Aug 26, 2026 at 3:13=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
>
>
> On 8/26/26 10:39 AM, Harendra Gautam wrote:
> >>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activit=
y codec.
> >>> + * WRDMA channels collect audio from the VA codec and write it to me=
mory.
> >>> + */
> >>> +#define QAIF_CDC_DMA_VA_TX0  246
> >>> +#define QAIF_CDC_DMA_VA_TX1  247
> >>> +#define QAIF_CDC_DMA_VA_TX2  248
> >>> +#define QAIF_CDC_DMA_VA_TX3  249
> >>> +#define QAIF_CDC_DMA_VA_TX4  250
> >>> +#define QAIF_CDC_DMA_VA_TX5  251
> >>> +#define QAIF_CDC_DMA_VA_TX6  252
> >>> +#define QAIF_CDC_DMA_VA_TX7  253
> >>> +#define QAIF_CDC_DMA_VA_TX8  254
> >>> +#define QAIF_CDC_DMA_VA_TX9  255
> >>> +
> >> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
> >> card registration to fail.
> >>
> >> Check sound/soc/qcom/common.c, as the current indices (246-255) are
> >> beyond the supported LPASS port range.
> >>
> >> Best Regards,
> >> Rafi.
> > Thanks for pointing this out. We can either add the range check for
> > min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
> > qcom/common.h to validate the supported DAI IDs across Qualcomm
> > platforms.
>
> You should add these ids to
> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
> conflicts with common code.
>
> --srini
Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
Q6 DSP involvement, would adding QAIF IDs there not be misleading?
would it be better to update the range check in common.c/common.h to
accommodate both LPASS and QAIF DAI ID ranges instead?
-Harendra
> > -Harendra
>
