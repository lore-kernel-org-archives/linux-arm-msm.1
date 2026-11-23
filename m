Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795470346;
	b=L9YIKGNRj0xhbAVZVtbfHRMJl8Gt4e8/ityy/TwHX7YQbtR4LG/4JM9M2ROQk8PKjAFo
	 /UGri2sHoHV9R6fpx6egPR4RcTM9nZ+tBdkcnt43SAyg/ODkOZihetYvD7Wf7ljYX2Frf
	 AQw/I7jgz8TzCc2YtnV7wCnj/gRgWpYF6/4UIBlZLQqREbO50JX7n+N9Jz/ierHWN/s27
	 3rZWIIcXuJXxPsBAVyuk7e2zuDcGYIA59KPL6wXapnga2jsoImVFauilzhXSarRRrgkI4
	 wOctAxXDiebCxu2Q2n9UwrsKmIZneRnMCKSnGqDnC3RDJGVzJ21r+T97ZAwNZ/67t+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f8CTs4H0e4+xV/JFm+XfAOVDKNKiSc6f11sR45iH4HU=;
	b=Ek6YqLrjk9a/I/BOrYabsRKQLKDp0wl6pwr7a8POUa7jpHry4SiHoniAAOakyiEW/3Jn
	 IwBee6MN0ExW2zskYOh1SOcDoXxbXOdOdozsc/VrPmJkfsufcFGvRwrTYtLoTVPppLRm+
	 XJRjvaZm+chG0dgrlGwt++VVafNlsiaSLGMOmYKsVtziJYxDPniV/33lxNdBNFABOfBVV
	 fDroxdwc0w92mAkipUS5/KOdXGuhAO1XB1EldO1pmZ2K1f7rEEzqjFFe8pFHs0vHWEPAv
	 btWTJKWSGmbEx3pTTc8uzC2s+Z/Gk2MpYdx9Z3i0qaAcQiBNVEf1onXvVI0EBtGcIzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grRu29bG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKu7qd4W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5746606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5746606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grRu29bG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKu7qd4W
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuYPT1579777
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=f8CTs4H0e4+xV/JFm+XfAOVDKNKiSc6f11sR45iH4HU=; b=gr
	Ru29bGUeD20KN15hfdTn/v0tDcsuI0iM4aVP34KjIOqVlJ589XfwK0rRJ9PRxYhg
	j/oQV/f4gL+HRYAx75aI7FJrTvxi3/PrY0LLPXMwFPR8zWzNnySCrt84iVe2Latp
	slWABwSdOefa0MzvVtR+BIyPkFUlROB2RKAE+5icheqxjRYxJPep/me+ukfClyj7
	aNh+4VpO1/Ecoco+CGRKaaVIBej+gEZdAQo8ZyIBUpueTJrT3F6nQncdjdDqiPL0
	VuBFXnVIhvDU3y3iMcjlWw7vgyYYYUErrM7iJQGubIrkwyUsRqj9ewqz5EzCEUCC
	fCePHonyWP62mxUs4lew==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0tgxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:45:44 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45e6091d8a1so2822130fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795470344; cv=none;
        d=google.com; s=arc-20260327;
        b=skFNBWPt6RdXmXLYf4hDmJMwFOZ3mP+DvF+Em16rR+UBsWwepBr0zobxomlxtvyYPz
         edEb8urDZnrl5UOscDQmbvl+L5V6so7N5K2jC5c47DOf9wVXr6pxqU9lpJuNg7SfTc7K
         jo3PmQsrwTmZ9sFyTXyXDY61aTKjUkAQwSIOg07UO7zAGMQ45tKNE+N5g6WXgob84GU2
         4TSvgUKVh/l5K1Sc+aN8i3jD/mL44VqrRDNE9y/nYrAxH+/F5EcjqgwRZLT3f3dPOiK2
         OyILw+NCH6ck6tHQbnPJUUcWf8kkY7jUzJmNXYZGfgV5+TKFCnbl2M9Lor7Fqnfm4Boe
         WbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=f8CTs4H0e4+xV/JFm+XfAOVDKNKiSc6f11sR45iH4HU=;
        fh=0ZJ6nOw/jJ0PPf64jFYhp4Gp6T/Rw0973swQdLAtubI=;
        b=VrBP2YyFUyEDG4v4PlV3mdYEi69d4oc2cL/VxSN8DgNMQpZV8Qs8B9Ei4u5J8WBslF
         RiyIu4UD5MVsShhrWa49FIbxCgu1OpshjbkfWA9OvUF77ttCPq3YYOQDdMeDwWMtV75y
         XfofwIzrQfx94RuSBj14fPMadA5IEG/l4F4AoQnPpLmGkd4yP8nBHTlFUBEi+um+IxEh
         iXz1t08xaxKt9rq5uk4hPV37LbBpSBiOg2EmBfKSIDll6ndGtiyKZ2d01zcCMJSWxch+
         YfhvsYm6iATUErU/jKREOyRA+auRXIOuBFXUcRcrWVXRixC5rTEEhBaeYzvPxr5z2iMT
         vh1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795470344; x=1796075144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f8CTs4H0e4+xV/JFm+XfAOVDKNKiSc6f11sR45iH4HU=;
        b=UKu7qd4WEbSKPsNFfj+pHRYixCa/7b6VDiWTtOWAll2AZw5y//VVdKPNcPX8MmDI5o
         lGa1PY67uXz3olImtl6TKpojqvebh/rIl5cVj9a8zcCWLH4xzc54oIhjO7T5K1hLGW2n
         TsINYtVfh04NPCFLUuEgqZbWs3+7ixdXGqLxMHyc+f6LfydTn3jQIJxiaWk6UGgTe3wg
         wzZAtwBMsoCxzAfU3iuBMh5ydZXWJDPewH0vTmDcnCFGU2XdeP2rMiq8UDt9LD9MWwgk
         zavh8wgcBSypsZXfxe76IaNKtO1JepoFCZ3gsFdI1udaU9wguas19FykSCaXYh1ls+e9
         twWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470344; x=1796075144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8CTs4H0e4+xV/JFm+XfAOVDKNKiSc6f11sR45iH4HU=;
        b=MLvLGHJdFivGQKTqSUuholvn5w7r/YasApybaD0uL1LWBq896n47OseWkCRLZJOuR+
         m3amSjrv9WBEgh2z+4TB7IMwG6sWnnl75i4yQfcF2SxXY6PYC2ymMNn9TgmZrpI72A7c
         FNMPMSu4zB9j2/V/hZKW1U8xCYzLhL2q411XRSa6DzLipryhI7hwX5tfPsRWczkrQOOy
         pRcv9WM3Ubqr4+fmJRsXsk6B7IqJ29S3B3D3ey5gt8fbGNhkFjVfmLlOu+/N1P0bZ7k6
         En4J/SAeE49vm8nZlaPwSRo7VtZhX7cVp+2xPlMUkIp+kgwT0zx/qEBp3SHkuSOJcWaj
         tifg==
X-Forwarded-Encrypted: i=1; AL+hErEgmkwykGmLfV61rGhokr1splM6wy7GbMrp1etPjRlHUfcmvjYopwSyoUtH5QiEGNhm3PEzsZgXqBeppqw6@vger.kernel.org
X-Gm-Message-State: APuU4Z+oKU8Wjf8Zt8X7JTwUkFYJht0SECOjjxe+ZdKqUJxiRWQUHd9C
	RdTpCY0V3ZBJckS8FXssXJQr7dP29jmAxCpLywi7aXk/4S/R9W4YDUI2sa3EzA7gKmwlgNlVtqa
	vHW6h9wrBMIsBr5uFijOcrdDBDqBMOCE4UtXsasV/m+GZAWXbz7qeh1xecdBSI1Lv3MGHRdicYu
	iZa84Pu3hARiGPs6S95mWqqWSHOE6Yy0MYjSe/Ki+n/8tEhVVLs0U=
X-Gm-Gg: AZFdTZdpUT4ORwhvOLBMMc7z2OKi3FIq27D7CLvJWkg2UmZpRd0EK2vWYKu9NZDD0xp
	W77KFgGatJT2Y04WbhUKLf+hpk0gawvUh9QzmMQzWcQiAluuhKQwdpfgJycyUi9DhoY3fwXAhJQ
	kIQnoUcj6+x089Pkhvi8dJWn0IGdaxVo14E8SJVRGW3gzL3Z5u85atg4NKABq7R/X5bNMt0OBug
	x/1Iyey95+Y+BbaMJmztA==
X-Received: by 2002:a05:6870:5b9a:b0:4b4:8c0f:40b6 with SMTP id 586e51a60fabf-4bc821920bcmr11250540fac.20.1795470344114;
        Mon, 23 Nov 2026 13:45:44 -0800 (PST)
X-Received: by 2002:a05:6870:5b9a:b0:4b4:8c0f:40b6 with SMTP id
 586e51a60fabf-4bc821920bcmr11250511fac.20.1795470343685; Mon, 23 Nov 2026
 13:45:43 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123181306.420017-1-robin.clark@oss.qualcomm.com> <e4ecc291-026d-4ae1-a391-5f3856df8ce1@oss.qualcomm.com>
In-Reply-To: <e4ecc291-026d-4ae1-a391-5f3856df8ce1@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:45:32 -0800
X-Gm-Features: Aa3M54rCKbnTmosWYAIUHrhm3070EypXS245eQnX6lbW45gG_2uvaZLev6Ye9i8
Message-ID: <CACSVV021qzsi-s+9GfOqx4syzb0=eAtv5nTV7u3thOqLrRa63g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/a8xx: Add missing preempt_record_size
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 55dyopIOf7KborAPeZ845XIazr6fXxrW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX2ycCPkAtlZoF
 EBJVP9dfI5+mGeHdFzpGDwcK35VGdgXEOVawPRDtg6d8hiKDsyMKNijraIXPUUVr1d7MRbvdmad
 ZIjamC4+PtXCUBq4IOKxt6CGkzsGCKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX5Zbw5jBx0QGz
 fqBeYYpkfxru2xXXrZv9bhq6Cu/MmZPmHJPaTGnixVuewrqHRtNOkc1qTeh9nzJwzQp21mJyCzP
 3XGFPlrNxcRE/oG9FzUd5vuTv/bIEcrOUQ07tsyTAi1k++zJSN95BoUMeTxephPksL2jOethz90
 sxf/p2912zoba4YkzVQ+i13DiuaHSXU1fdDPIbMMEtx/7bw8SNgnkChAhfNT5qCif+IpNDLZtsv
 RNvwmtFFPXIMfV+xZ9IWpSyuNsbRAUfbAD6y/VssHQiXGDc/4dp6Y988U13OhvEBbWC8dn3WU72
 ZzXNJd/nrI11KF+RTVu/eIi7TQGqLiegMyzMOhB1U/y4UkgIIvKLBqStE+LLRq4/MjvAi8V2r2+
 gyKMFhpfrw/RBti3/JCKNicnKVQlm9g4eewTCJXdcef93IHpeUblFy2kmudXiongo6Q4G/y0BZb
 /obKdQmDiifMP53Zkzg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04b409 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=OkJ-WEULEOmYfeJtPDwA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: 55dyopIOf7KborAPeZ845XIazr6fXxrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086

On Mon, Nov 23, 2026 at 12:02=E2=80=AFPM Akhil P Oommen
<akhilpo@oss.qualcomm.com> wrote:
>
>
>
> On 11/23/2026 11:43 PM, Rob Clark wrote:
> > Somehow this got overlooked, and Glymur/Mahua were falling back to the
> > default 4MB.  Which is way too small for the amount of GMEM on these
> > devices, causing faults in cases where preemption needs to save GMEM
> > contents.
> >
> > Reported-by: Connor Abbott <cwabbott0@gmail.com>
> > Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
> I think it is a good idea to add a WARN_ONCE when the default size is use=
d.

More generally, we should probably just warn if the preemption record
size is less than gmem size.. (we could probably also make the
preemption record size smaller on ring0, I think?)

BR,
-R

> -Akhil.
>
> > ---
> > v2: Fix typo in commit msg
> >
> >  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a8xx_catalog.c
> > index 0c6dde3cbea9..20fe93b83c0b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> > @@ -1337,6 +1337,7 @@ static const struct adreno_info a8xx_gpus[] =3D {
> >                               { /* sentinel */ },
> >                       },
> >               },
> > +             .preempt_record_size =3D 23088 * SZ_1K,
> >               .speedbins =3D ADRENO_SPEEDBINS(
> >                       { 0,   0 },
> >                       { 388, 1 },
> > @@ -1469,6 +1470,7 @@ static const struct adreno_info a8xx_gpus[] =3D {
> >                               { /* sentinel */ },
> >                       },
> >               },
> > +             .preempt_record_size =3D 17712 * SZ_1K,
> >               .speedbins =3D ADRENO_SPEEDBINS(
> >                       { 0,   0 },
> >                       { 388, 1 },
>
