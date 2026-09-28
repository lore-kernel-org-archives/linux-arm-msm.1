Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199EF488DB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586703; cv=pass; b=cbt9Ao8elaMAQhijP20TNzTJqdQMliVew2wecPqnf0EoJQ1Z/8jGUo+ZxUmIcMoUog7KQr6MwIPA39Ha62pwJGj+VppRNa7U8Yhye4VkAQZUas+R8Ir7EBrQFX80OmQDQnGdNtSqnjSUoI2zPkc3AHHCNxgh3ORDL4hTWhxl2fU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586703; c=relaxed/simple;
	bh=KTENyYqQEJ1QJsUU6WyAiz6HgJhYCr6u0cGxg5uGf9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWN9pspsMritEY0HRlIYWdzHKDbxAxfmHRj1s8RYFhYH7qOAemshWVoqaB/nB/fUfOXsocgZc2Wz1dbodLIccco7uTH6Kmtr2qKiwNYgV265R+dOQWgZzoxJBL6keE+uhds5zJLXbRpsTGB8r+p0E2C7ik3SpiWZi3bAC60jPes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocW9bnWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nixc8U/q; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocW9bnWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nixc8U/q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S97erS1570726
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=; b=ocW9bnWCtyfDOLpW
	24RrfcaBN2VSok9itSj+FdB/z1HwJYlh8mkkpzn+5p7KHR4dhU/3lspZwD4ofGpd
	bS4OkzdKl8YeJClO77+s2S1jlyVlR5kAVdWG1PRTHTtl8mrX+m35hjUXuJ6lfikd
	D7h9j6hbSunh8SQhdC708muRSNWCy9HHbQGAPqvh4owe3D7BzSPzlD7DMOqoM4gW
	8lDOlS+jWYU0O2672SLTPLUUNLfFXGG7F0BxDyo2Dfd/lKAIFyqWS8iEJhYHhP6e
	P5BuJBGbMApRNMWIo2dmVhlMHr/dPQNgYMFXZ/DGSje+3M/bahkWKArFZPwfqFkQ
	roBfNw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6g0kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:11:41 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-86e8abd7136so35651647b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 02:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586700; cv=none;
        d=google.com; s=arc-20260327;
        b=LlAkDSfYOmPPbTKJMY892ppfDRxyFdd1DIt87oGbdbDB9v2QhrXl6exs5z+zCyoPvh
         3B8+fbOjB+7oZ54jzy8NEYWVG0/CKqF3W77IOrKxGMzRp+1VULhT+vcyfPv+Nm6rDZAZ
         zpwcZT2OGniYuRr+zAU0EvbtAAKocsJOZBMf5YrK4CR1HVmRNLA9j/2TpuVdSRILRhpJ
         SrU6ugZWAeynh0l3eoSU9psZ7jj5V+MPFf7gAq2AeYRCya9pxhlDoW7lCkW7eStUXcUp
         TJCKpjq4kbGPNrQ8vw+lJZUUTjn7ITFlaqf4rTu4WJtruvyGlf3G5uDluZmyDIYy6/Fy
         fqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        fh=03T+JW71MDL+2YlEX1b8XYkiPELpYJ/1fWQMhoc+XF4=;
        b=Ol3CzIpiuXTEWrT9NcFN9HkAji9vnmYJnIA2JmYP74m+ERpn6DMpImA9qlEKFb5w59
         StG+L9PggfACsmWuRu9uf6AFdO/Lyfymtf4wuMnGq2GPEdm6+IhjOBEIThfHV6P9FWyr
         /EGFX+kTXF008sYz8UIwD6V494JuEfr0VLc7WtoMs3y7UNEflVa1S/Z8joGcVhDn0DYy
         SKiHX+zlEGlaHVnZhR1UdNlGVWzr4ELkS+apU4Iy2iezwmtkpQvFrZhPU59WXDQzFiMa
         lY2QVpirErG5K6e2NPot129vuqEJ4fzO1AXbliqLmKZ017oxPQJn9zhIjqRn4Zg0ezwg
         wuKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790586700; x=1791191500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        b=Nixc8U/qhB6n9qnty0EC6TNCzgc5b/Ls5dE82vee1i53LODYVX5+y4m0kq3p5Jr25c
         vYrJA6KLbcyLMB5RzjenpJiZNQ/p/3r3JFPmYur3U2LgicVdBTYrz+Buh9V9EUNGAb0e
         IuNGtU0DCaY+fSd48c3rWkJYQKFbZE9qSBoMEf6T/3QdUpzA2Yaptb+9XPYRJSWY2Lz6
         OWCoIaW601wzbor2krIBiRu9wy4Ipt5F9/cqtf9IUr4XeA4zeH4W8JthUXrj/mlz793x
         v5lum27xsDNCEugUmXhI+VZlvQC4CFJYhqip/4hI41LDA1ebt0bM8013r+pc8tyTvStW
         HTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586700; x=1791191500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        b=z8Mn5uZqZ/A19CukJ3+2afPW2iGoSfUaT7p4hlbnn+uS4QmEA10EdfqDYFed1Czgvm
         zk0MyqW6QwOokpHjpS4yAgHB/aux719I17TXO3IgZ30BWXnYgPl1i7BvDjjsbIdJAQTf
         bwLRMYaXluphqR6lIZ00J+w3d8yyPauaQ6GQelreevyj5X2QfWWDexM1VhRKF6F+ROzQ
         BXYGZqumij9PTSrIvlh6OCQf56kz4jD/B7iMeV1DQDALNxUvG8In+xD0xlCPV/Z/EXHT
         am1zjhbzlJeyBzNIo6v3PuRt9JloIed4GvRyMUZuPwLuz91zVAmI2RJSaFSAQARlsYk8
         zRlA==
X-Forwarded-Encrypted: i=1; AKwUvBxupgbIVgocarSTvM0kkqE5E33AC/f9xZ/1tpVMGmmQbZzOqi2K+413pR9plx+gKW7NQZHPLK7Wnbt+CNFX@vger.kernel.org
X-Gm-Message-State: AFq9FYLLu2AvHlEg5/FziOct9DFKMIHCk2cSQWSGhMXU5kr4ZgItdnQl
	DsLv2HNZta4rcPz4kMy6NzLKIYOya1T+3nlkm6zmzl2ELREyYXgjodUMM5OcV7W+W+Lg/OLhxzv
	mGm+cY92dZRcYc4qGmYTsdF2XpLw7CmqwI8wuD5rKL5C9dc8VeWklXuYAbj9iPYaenaLICPvl3a
	IusYkajJclkhPobcnXBhb9DT0lJuB6hpk8jHoCEAEjdj0=
X-Gm-Gg: AYBFou0LFNvb+w/vgEjuLfh2A+LJfQrp69QAkEYnaeZ4L8OsmiF6huUddcxcl5Owyjf
	srjOs/W1N8eWbILCZM1YH6x4SZWcsL2ZcoSEr3m6SWbN3DbPY71xFwHr3kqh+rd9JcoEN0CSuWy
	FSj7v2tzHq6fyfVUmFakqTwTc1uPAxO4nQszxj2JASUAH8A8LpKZufbNQzsjU=
X-Received: by 2002:a05:690c:6610:b0:884:c7df:fd25 with SMTP id 00721157ae682-8a64b527551mr64705607b3.17.1790586700405;
        Mon, 28 Sep 2026 02:11:40 -0700 (PDT)
X-Received: by 2002:a05:690c:6610:b0:884:c7df:fd25 with SMTP id
 00721157ae682-8a64b527551mr64705327b3.17.1790586699978; Mon, 28 Sep 2026
 02:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-2-d5b6f056568e@oss.qualcomm.com> <arOcDLy_ESS6Qwcs@sirena.co.uk>
In-Reply-To: <arOcDLy_ESS6Qwcs@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:41:28 +0530
X-Gm-Features: AclHuK9E6ayaYE_Y95ZKtkfHPWfcu5v3kwH1jhnosx1aL68qwy7Agii-WL47rOs
Message-ID: <CAC-tS8AbBcN98ceaLFJaAt_+d6T0C5dpSSkRz_9yJv64KhE3kQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] ASoC: qcom: Add QAIF shared data structures and
 variant interface
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfXxF7Qun9pN/kl
 y4POxoTr6flhvF9zdLrCJafb/Ko6aRKfoLGODztZqLeUx0hzN3AucpGFi8zZyHYRdKqTdgNxD7Y
 iFno2XER6qefBpyJtaLb+6xPOeIAN12DVFROxGQ1FcIm2bPjLkPH7EmsqRpoLfrEsAvt+NttZEk
 ixqIdQSoGjrrqDVKjP2A71dbdg+2YXRxgMQ8VESP/QyxbhAPcxAi/ct/SwAcK+5IhmuSSbKv9OL
 hoYiXnG3GWGBCz32NV6XKIWRjdUQV2MwljJv7hTEHhNgkLMJPlap9w+UU80OXU4mPc3U4qaRaYy
 gH/5WKpUknQ6LxvyFGrF+o7XsbyyYNX9usP/X1f4XxBwT0Aj0iG4uCtKbo/5vHdUrmH9Tp+2xQz
 C0FrFNyy4nQjhUA94DVnst8c3gwx+RUhMgamxAruf/3lcJsvQ7c03DTnZ2PfuRnuXYXb2mRJ/Vh
 cuuWbsyznzTPducypJQ==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba2f4d cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=_qd6ERi7e6bvJ_0A4_YA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfXwWtJu+ySmRee
 e/JQoj/lj5CzAJEnIv2y5PU8zquRjfmH0zKZwrBv7NP3HzDyC7eVYy5RUk7I0Y1Xsz55qhlAPJy
 /8+Qc/Etw0jA9/xX9dMKdmkJWHRofhA=
X-Proofpoint-ORIG-GUID: xwvykCvSuKaDAH_MNtpBD8ENEqefoM2F
X-Proofpoint-GUID: xwvykCvSuKaDAH_MNtpBD8ENEqefoM2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280036

On Wed, Sep 23, 2026 at 3:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Sep 23, 2026 at 12:18:22PM +0530, Harendra Gautam wrote:
> > Add qaif.h to hold common definitions shared by the QAIF CPU DAI and PC=
M
> > platform drivers.
>
> > +struct qaif_variant {
> > +     u32 rd_len;
> > +     u32 wr_len;
>
> Does anything use these?
Thanks for pointing it out, these dead fields were overlooked. Will
drop both in the next version.
-Harendra
