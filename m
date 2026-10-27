Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793094933;
	b=c/CYHVRqukz/I/9B2pxoyjEKSHoImqiajkc9ucoS4sXYgaP9zpb0Xnf7g67l4PoLnA9f
	 pbg2M4KHqY5kGUAwrkco5T7BehAMEjr1MsUCBI5rtbVfIRsBOfgnBnGfkvYhnGJ4BIM2J
	 0HdTqflDliqbP4TQh92JN95F5IkATcQ7IlEYo9EsDYsgWB1uX7KUQDnE4q/IgWydd7pSh
	 hdI/VRKSuvwaB/EwZHg360iSrt/eKUd7ShKLcrJl+KWJXT6PbpHgqtJt2foZHYF4dkYtJ
	 E+e3Tv75+xKvZkfR3y8XXql0Gds2WdhbjqOU0rlUiWDu3YLC+vrOhTscuiifpWZHc8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
	b=Cc0/S4SFvQghVWZV3ofm8kf3kBA8sEayLgGnjyRW9LTsMnvT0KJK0GNr5JgLeQMXr8c2
	 xsb1PHfEqy25dKOsTYCDM03j3cxTH+Px/Pg7xQgQuXMg6AQIszlN2rzyx69swddbRFtxF
	 yO1IW7Qd51HrSnpuXSMKUNxMOtGDOYeHR1LpK5ijk/GzlFV0U10IG3sKsdO2mfy+2D38/
	 9+ewZyg8Lc2mQ0BqamiZP4S6uqwBLwveRGFTI9uv3Ou3cqS5BPo+o/q/ZG8Idho+3CX3h
	 Sp+Qxb9/NcRXibMKevKjLgjaPgZShAuMJtgIOfMVH4/+roroiE7Wd4l3KpyGIlbx9Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGVU2z5X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGNsLpU4;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C120606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C120606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGVU2z5X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGNsLpU4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gRom168798
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=; b=DGVU2z5XeSNhYIKS
	yfThQ5W/Fl7cOogg4qMa3jOQq/I+zQT+KPoV2DKRfPcrezlaEn7C0o9fTN28zDhi
	PzSOmZLvRy6m7W8CVlvWYDOvD9J+RLilyLePhVUlpl0UwNrXhY9+nUPDI74EQaI5
	WlXuqbwRTVaa0ZJZlR/KRwSuF9BNMpZtGzKRwJ2ERQ28p2bXgey64lnYMCZHsA3C
	o7dAUptj7m4UdfjxDFlU97ObXjRPKovx2RjLqvxmYd676bo135AXu7z1aKGmHEiK
	zXlmrUdqLcS6/SD4ad5OwId9hlFKa8jTSNl70Gx2w9STJJ7AmcaR7hulguh4wzz0
	bWvtpQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54k6gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:55:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e60770381cso39258575ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 02:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793094931; cv=none;
        d=google.com; s=arc-20260327;
        b=KrHS4gWL7LKIZHugoWLdFgAmAY+FPLGIdRvVmVUwA4EBji5Al8+4/po316KZxH7byk
         p3Ua8G3vn/9KZC8yF7flSeEKZYOk7IuauCLHHTOKBJqKYH01IPMPdyWmGvYJ3jcELDJx
         OtXH+Et55fcF3MISdPJEMqJr0kfw8ohHmklttktKPK/cOlrwUJ1+JmcjMZ/qVO7JplAp
         RtZYj8olwA2cyf0PgpKePm35oCx2mvmwAvq/FUv8wk8GKW9uJV4c0QHT1OYOP9UUHYZJ
         qb0TelvN/ceJJ0X6gjQP6OAmX1sotae3oV5OgUoAExe7d0o//UEXw/xsxzW5sBUUIn4x
         TPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
        fh=DgvvLFtgpHvf1cB0dqYE0Wy2lVoSu2et6RqO4dfL4D8=;
        b=G7r/HYZSDSMt7CbFd12nfrX8VHABvA4ml/BxzSWuW+HYqV4WjDkZ8zppeNx/HCSMN0
         5HGnb2sVRyizGGxL0Rz+N1UFXU9xoMyt970qNBDS/yWnoIVOCMk6PtoGYDDvy8l36lnv
         gBuzAfOlOTVzaObe8kgLaAhw9C2sInCOeMccyqu5ibmw4MpvyF9m/BF6WksBwx+gyLCX
         ppc0wnq4DFPqSNu/0webm80AZ7/PKTGCcnsMvyp09WHEPvGZRgVFMsL0oHhbZC33/PaC
         IGUx/ztyCFZn0tY+tcO/ntVXgvKriNzsuwhKvk7+usuvu9caPzyVZXQ6BATPKlicnY1F
         NX9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094931; x=1793699731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
        b=jGNsLpU48rqrrwG81MHZyHUAJA42yblEaFr5aCfLBH7GAfOEMXyf9AfuB6xmO3mALd
         pO6FCh8akvkJLsyrYGA/OxN2yKX79VicTdnRWN2FtUxYCb/lUQu5T6qo7dobLJsO0yeT
         S9xwmbH3Oxsht3L1U7qIanqqzT1bjLfvmczjFyr+YdLFx4TWU3zqK8dkGxQ/0Xpm26hV
         cdJf/xYFwer1LfbaKbGYWJkngbHhHbY2Zbrv3/lv23RjU64HfRoBniO0H3SaKntf9Bp2
         7Nae9p6df+qDkAKbQAy3akgVAII7wRzN9Z4IxndvUVtAA3ijfNFX4EVBUTUkvMvFEWHy
         4mHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094931; x=1793699731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
        b=CuJeu43mHGKErA3SZOtdo9qxHz9KrVfRovjfGhwnlTM51wT9fve6anMjRdaaIlw2uV
         nsUFJzb+yQKpEY3W7fJbJ7uyxPCdI8JRYdB0Z3mqPMepd7lzRZwY7hwpzFgaGY2emXLq
         c2wKxWaoxDJHf7Dj0JSfI9t0S7OYYqmQVvr9Z8iGfLBRl6opyOrh1OLhTeT3NGxT5qaA
         Nl3rsoYNuPdTSe1gAiIyHsfN4cbMduCiGdrvo8ZsduRQtFx6OO9gk/sfEUKrw/UJL6VQ
         zlrST7t8n36oGezN+Ms4lM9GSLB0UYugn1TA0h+gruRikaHnilKlPik+WdDWKIjYA9Nl
         lbHA==
X-Forwarded-Encrypted: i=1; AKwUvBz4m6kySqX4NXjRkyrWxq2AwcBNkBpAFFH0wj190OKfVeUouLf9LrbZGh+Gy2xNG2tspsH/CXs1bRuejt8o@vger.kernel.org
X-Gm-Message-State: AFq9FYLhElGdBkFRFKyjR8keRdOmeN49sNirOko9AMUTL3gMiSIn+7oV
	3F3Hp0FciZBoN4mMpBzx7v/cIiq95nmKGhEphedI46FDw6yYdIM0TQI8kFXHaHZYuwbZ6ajSDFr
	YPguIedLBiX19gMmUqOtgBshgHlSJVjthMH/Z/jS4/6XEEypETMaM41zShOIYWmWxf53iQ/KAIY
	OEh1T5J2eDWk1NQb1t17gJEccQfePnj5Yd6LRJ9v/DC4A=
X-Gm-Gg: AYBFou2sygNgW2HQ6ODQ685UVNHUNvPjaDZ4iIiG+elaEE/W0N3GQlWz/GNzIZECvON
	9AbTWzoDVi66JhxWgsviysxh8avdD2u8ekFYQij3DRrsA3Vfsq69WgNltpbd4eTYMys0QGkn9xU
	ocKd9OgFHLwyPnJnLfBQJJ3GRVbtSSMQq708sGxWxP/kUy8469LoTPW/gIDQ==
X-Received: by 2002:a17:902:d50e:b0:2e5:c563:c0dc with SMTP id d9443c01a7336-2ea9c87db90mr82695265ad.42.1793094930999;
        Tue, 27 Oct 2026 02:55:30 -0700 (PDT)
X-Received: by 2002:a17:902:d50e:b0:2e5:c563:c0dc with SMTP id
 d9443c01a7336-2ea9c87db90mr82695055ad.42.1793094930556; Tue, 27 Oct 2026
 02:55:30 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com> <2936b4ec-3203-4137-9d29-7f95f22186d8@oss.qualcomm.com>
In-Reply-To: <2936b4ec-3203-4137-9d29-7f95f22186d8@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:55:19 +0800
X-Gm-Features: AclHuK-sZwvsBwYWTk7rZbRPQQgivUTPs2rn8QH7Aeck6ZgfXa4-Jadwu7F_w_8
Message-ID: <CAFkd8hsoWa9t6ySWM4o-xgm=mO=_RFuWJDVrCb1u+Zg-eymTJQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM formats
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX6deHGnC0Yw1T
 91wfBq4tmbKv55lEJ3CeevmZTup2Aal9lP1MH5sW9ukOyqCOFQ/HuThauvlyta8ZTypVHOTNhyw
 r5yO/RGdRSYBv6Ns6VIJAP2/DTdosE4=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae07513 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KEe7bkdQAAAA:20 a=EUspDBNiAAAA:8
 a=hVUKjqsWo0eiZm92ZjMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: GZSfexAqScT8zdvpzqctmBc3qD0-X7uC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX84CVXOfNig4u
 FxZMqrw1di2NpqXnd6pkW3zFI6+uk87IKe6fk/nB2ByE7WHC1AugyHkryqx+kvQcDE3Pmtm4wcP
 5pxz/KpI1mvv8IdmkNeQ2RaRSoR7m38IFHtohEcjXT2a4GQnblpiLIrEqj6hPirLEvlVEeWSyBp
 QOvWW02pnaVh8NnXJ0M7dg+zOM1JCpTaOGNHrCpsUtUn5wvXTYmH+L1ZFDNPiVlC64tC7iJl2V3
 5R7kQWd1w+dsgjk7Oq7WV/g5LqzmAvNK4Hf//0VjM0gSY96JH/0wOAgMxUXN+51LxM6Hh/WDGAA
 aZuJnPIAX84/kVRWwyLwJzlcQFA4zxQlriMcmp+8OHrlwT9FxoVLqf6EztMI942bVD8kQGlUeoR
 Ao/USaOG0/VHyUpnNk5qLYUZ3eDLzF8ErHiJHNs29kUp3opqPrZeRDGFyr6oqCZWe/rF+VNjyAN
 hENo4HLCTL3Y2uh/XDQ==
X-Proofpoint-GUID: GZSfexAqScT8zdvpzqctmBc3qD0-X7uC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270039

On Tue, Oct 27, 2026 at 4:46=E2=80=AFPM Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> wrote:
>
> >   #define DRV_NAME "q6apm-dai"
> >   #define POS_BUFFER_BYTES    4096
> > @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_compon=
ent *component,
> >       cfg.num_channels =3D runtime->channels;
> >       cfg.bit_width =3D prtd->bits_per_sample;
> >       cfg.fmt =3D SND_AUDIOCODEC_PCM;
> > -     audioreach_set_default_channel_mapping(cfg.channel_map, runtime->=
channels);
> > +     ret =3D q6dsp_map_channels(cfg.channel_map, runtime->channels);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (prtd->state) {
> >               /* clear the previous setup if any  */
> >               q6apm_graph_stop(prtd->graph);
> > @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd=
_soc_component *component,
> >               cfg.num_channels =3D 2;
> >               cfg.bit_width =3D prtd->bits_per_sample;
> >               cfg.fmt =3D codec->id;
> > -             audioreach_set_default_channel_mapping(cfg.channel_map,
> > -                                                    cfg.num_channels);
> > +             ret =3D q6dsp_map_channels(cfg.channel_map, cfg.num_chann=
els);
> |
> |
> |q6dsp_map_channels()| changes the mono mapping from |PCM_CHANNEL_FL| to
> |PCM_CHANNEL_FC| and does not handle 7 channels. Have these cases been
> checked and confirmed to be supported as expected for AudioReach ?

Yes, have checked with Rafi, should be PCM_CHANNEL_FC.

Also confirmed from audioreach-engine
https://github.com/AudioReach/audioreach-engine/blob/master/modules/process=
ing/bassboost/capi/src/capi_bassboost_utils.cpp
  case 1:
         if (PCM_CHANNEL_C !=3D format_ptr->format.channel_type[0])

https://github.com/AudioReach/audioreach-engine/blob/master/modules/process=
ing/Virtualizer/api/Virtualizer_api.h
  uint16_t channel_map[0];
  /**< @h2xmle_description  { Payload consisting of channel mapping
information for all the channels. \n
                              The channel mapping is specific for
specific number of channels \n
                              for 1 : [PCM_CHANNEL_C] \n
                              for 2 : [PCM_CHANNEL_L, PCM_CHANNEL_R] \n }

About 7 channel.
If hw requirement is there then we can add right.
Currently no qcom upstream device is testing 7 channels,

For example, RRD 4 chanels and Ride 6 channels.

Thanks
