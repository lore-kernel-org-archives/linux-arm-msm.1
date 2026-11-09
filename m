Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794217791;
	b=EpDh53+RRUaf7WTm7vRs+OfOBo6AWS63JINawV3FrSM7+kdDp/z28t1a3KRRTOu1qPab
	 IyObiGpF7nFQyHMU41jNphN/CgaSQ2AOWb/MoTAZh4EJnwKsaD/4YV/8VDh1b6p4JVkw5
	 B5cTzDqyGEgwoTqL+FdhD1Z/Tm3CAJViZCGJXrf8V8abzd0ZdhZVxr0cbuXs/i9BSor2F
	 ug4lIrCULlFrLiJBHQIWs9xHVvj301JxV0xi8nLNhS8+rj5QOjw6e7HwMoD/zG7iTtp+D
	 /iHj37c44ehw4YyHfSJASPbc1k2r87TZi3LA0+U3FRGGKQp7BCI0Yrk8oJ806pZhTAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
	b=On/m1gvw/ANZE3n0VAr2nydQPN0G4ztnx6MsfW+jYBcJaIlg91pOViNJES43eps6WoxT
	 4BRoZtBchV1UqEk5k/f4zW1xTINPk7scbjO56xlsBjJsnYxae8A7ZvSmEudgTYoO4yqZ+
	 w+HjNXRWhdBf5kcBJ5gO1T+cYGjyDPdIku+sT6RoR36VfnK2Tbp3we+FqXoaw/ktJwrxQ
	 nvUYSZMIZFPFN2I3yQ4NOUMTxqfbrYGjL117LInxcgH6zWoEu8KWqJ4yLKWCFqcN9+KUj
	 hsSmB9E08NK+0zfHDleBcKjKt2RHqtD8I5uNwNhbqO2bu7plRbuXmiJ2pPfgwHYZKTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QbKCSmbc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="F9QP+O/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848C606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E848C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QbKCSmbc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F9QP+O/y
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A62T056071
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=; b=QbKCSmbcHpe5rKjR
	rn3Xi+QvzRzQ2oF/FbmooC6A8nmvPTqEG7BQu7XTYi+KHxes482WuUVJMcyNkcb4
	eCARzrZYFPpXt04RhyY7s1FsCO8YVJ4h2pAtnWumCUhtjBdZ6kz5pVC13MAM9wTo
	K9u2Aqm9BXloz1Syerp2dztmAOr/Ts/awudO/PA6st/r0/ebvYAAS8xCkF+BK5Wc
	0NqWlM0622MT27w9vsypZDFSu/YQRXgR9F2rcHxOpw1BoNP0zGcJO01cUizPwGuQ
	ZPX/JvdTVW7H9qlkRFOkDENoE89Dxs9MgoiOeAUkopN9jB/rrfRzshT7nFXwBaal
	1n+yLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2jst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:49:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53639e47be2so13445701cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794217789; cv=none;
        d=google.com; s=arc-20260327;
        b=QOwg8RFt1BInMqVW+SK89zUdKZa3hwhX2kaNLpT+LVlYhYMj3NyV+rKFZxZA9Cx9X4
         D1K/4LImQcLKDU/wfWDWw2UQzLT59LO0XEnf0o6LVdaiRKVo8JttPUgYhk3ZWG73Lmay
         5EWEPxc6JyN6o3sgMfqqFs5sNExERu7G52MBqWTZeuPGORic8M1hVgByaj6AotcDtTWq
         sNT4Dc8ZYvh0YwUnvZdCj3gF6Lf2qzrOJscTmIZpYunXQMexKg7fGhhWS8LMGXPkuWt8
         bYVf3UVTpRhkMkQVsp5Hc2gK9vJTU1mgjAVZ99OxK57G0VEup8hp+LiQVqXNc3PHPt35
         v2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
        fh=hn5M9TFzStop4L+A227hGc8g2IC1RRl3VGwN00X8WAc=;
        b=iS8JjFt8/4hVg/EmBc8Pii+iqQq9kn0kmutItBZ6r9CF2pB1J+xE3yMqYAhIxT6uKV
         9FqxFFPh1c4Ijg+RbbFi4pQPtANif7sTCZChWbKApmxupZOGaq8bGRvCzOEyAtLbgi+5
         HQ2OQhkx8mlood0lpd0vWungUbfz2BS2ULVf6MW9bMa81AjbqKHj1j9SE8QxdhMSCK2Z
         epfgz3tdD8b8Y4Xn7nsNNtDoK49DyEoqtiaRTp6rDM3t9pFA0zTOWviW7nS3bmiXf5OK
         zJ5H+pUIBUlZbYhqx4qVui5Dw8Jy5SXMaEfZ24RavWRvNsJL9XgNnxQEvhaLxr0zQppk
         84EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794217789; x=1794822589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
        b=F9QP+O/yS9iVqZevv379hLgKHHKukW7Dpl2CZ0z6vCwnZV8C4tB2gZfhuXjvIgVO+6
         Lki271XuK+VVv/3gWDrIh29puxB/AiJitkgVjDq0qDPQB7xRI0QhlTG0nTQBYVY/VsUB
         JaheFo8XIgSeapbDZ6u2JfDKvrh6fFEdG25+egX6TJg1kRwTCZa4O1PDGdyl3r6aYLtr
         ddqA/hN9BS6fmeUnmBihSUhIgjt972iSxV4Dl03AIjW3jZ5OUmuDvGor3lpIK9L1k2Vi
         WhAvl+yZsDTIOtIC4AOYp2NHPpDjACdQVw1IQdvexI4xvddnzhwG6rcJeK60Yp0pEmhw
         ylGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217789; x=1794822589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
        b=Spu1eAp+J/EPe9I0aLUFDdFYPZVY1mHhUXbnVrhjiGyf1Uz6mLGjf77lZ01bMZ5hR8
         nUemZ8L+0CBGc+LvSFa82SjaJe9Gbt9fIkqK/1MG2l47fLz4FYgFpYJ5iIVJO57YXKfo
         WkMD4SaIMx4xb3pU41OdPRbL/QVoqc1zBhEg1rhizBX8dMqT78SPfVoEd3Xr+/h3m2Pt
         QonFwST4a5YJ/Ly7uQ54wiMY1MpZtDTYM06yBqEzPRbWOukWN8nQ6zXxP3faJa+VXPfq
         N1eK0fvnUGe+nkTIWsEQ9s1w74/Or2VGgwEM9qdg+55axrn4kB4kgSIm97+33UL2td0K
         nErQ==
X-Forwarded-Encrypted: i=1; AL+hErH7NwWtuv5acNCCxLvN2JQ6PB9x+NdiykysVkxjQo0JASHEduvb1/DeQ/LXzAJtUPtFzCS4eCeUD1CWCFtA@vger.kernel.org
X-Gm-Message-State: APuU4Z+zFXfAeEt++MHJURhIMTeixdDsexdcHB+POSxtrNiUEZQJaqDJ
	SqoX8X7bxJi7puC29Mes79BPcS7NaVeWn9Syd60P0jxqdqIHOzzU5v8yzcwxQuE4DthIlHMMoBS
	NdQWtui4tOe222VOqFA9p89SDlQvKscNOXcG87KP/N2TZcrSdoVAs/yVfdNSwixmnUAh+nWoSvA
	CCRjcz4Nd0N7HM04yItNuOPLri6I+1lOYtLV8+p2qKNZE=
X-Gm-Gg: AYBFou1gkcq8+ghv3++4U4+WvxdwaSlVozbQICdg/xEQ5wnTvbF52bhXV7OIn4h5ey3
	y3koGfMrocYvXfYX7LLnnSXDiOQ/mvKjdmpplYyzRj4NzgoFgeK4jlYTft5RQ2MM+hKq7JNt2kS
	dAqFGORwkJT0f0lk8CURJO2adTeHjH8ITvV/+zCPaMABeyDcjK044AtXPxB2SRMV75KwI4kYNfP
	ohalkWKgm9U9xYNGj9weAAHVguakPPosYhfhHqGJa+UkxKMgGHr4iX8Iasir4vuGUw4+msqk0g=
X-Received: by 2002:a05:620a:46a7:b0:93f:2bca:2cd8 with SMTP id af79cd13be357-947842757dcmr470394285a.57.1794217788882;
        Mon, 09 Nov 2026 01:49:48 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93f:2bca:2cd8 with SMTP id
 af79cd13be357-947842757dcmr470392785a.57.1794217788415; Mon, 09 Nov 2026
 01:49:48 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org> <20261107-v4l2-frame-sync-v3-3-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-3-e5bf7073a35d@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:49:37 +0100
X-Gm-Features: AclHuK_y07fkzKo1YjXS7RBfNxjVDAed2Q4BKv9GuNKAjF7-rmkOWA5Yh4RIhYU
Message-ID: <CAFEp6-1tMwheRKaN=sEgF9abzNZOLS79OePq1GOwtm8JGXjSug@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] media: qcom: camss: Use SOF sequence tracking
 for vb.sequence
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfX6PsVx5H0GR/g
 cOUOQ26mLq7xjQlXatfNC8E/C7hu9Nrz3Sy05oH0EvB/w97yraDhzc3pYzHJ8BRTWLa0pAK8XO4
 LfcGCqp9bIuNzTMZNjSURUAY9rHeIgI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfXyBQpWWthpO7q
 +TxrIqoZ8W8Im1fKa2iHkaNAstfqihxEe8gd4hFg9/DPGWeMeVvu2gKbHIpJVYHPwy7R2N0CvrL
 cxzCU3cCr//dQ2JMO7nuB8XFdtszcG6roEuZWUnlqKKqpV0/FGiSK4hw1AmUDNjcSp9/sBVwrft
 HssJBip6tiNTlShKrYWLohyNTic5pF6nHymvqNr2wl/0rUC5X1YR3pA9406plEcaG7mZU9gvefo
 sKr5FTSSw6Xp2Jy2RoVPM0LBvK3ZpvCh0ZIkUX3FbTQMlfYLGjL0/WBIPtAFpxw7+0ifmkWCZ7j
 2S9dloNRhjzwT5ozcvRnb/jEWs3u7mKxPWPnUNDbLyXRENT2BKglAFAbr/XnUbucr1ilgP1kCj1
 Xt03pI0GwH4/B/qFJnPIbglJ/+5RNaJe4oUEZW1e/2+4n4TZahay7BGQZte1efijMqDMpYc0iIi
 opiejaXKA+IYy8y+A/Q==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1973d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=AFkX6LJAiSV6nzPqyhcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8cDFwkiFBpqp-jiL2hKv1iG4TI74ZdCy
X-Proofpoint-ORIG-GUID: 8cDFwkiFBpqp-jiL2hKv1iG4TI74ZdCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090039

Hi Bryan,

On Sat, Nov 7, 2026 at 2:02=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> We want to correlate statistics buffers with data-buffers. To do that we
> will need to have a sequence number driven by the SOF signal.
>
> Rather than incrementing vb.sequence when data arrives, we should increme=
nt
> when SOF happens.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c    | 14 ++++++++++++++
>  drivers/media/platform/qcom/camss/camss-csid.h    |  9 +++++++++
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c |  5 ++++-
>  drivers/media/platform/qcom/camss/camss-vfe.c     |  9 ++++++++-
>  drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
>  5 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 7f33fb81ca8cc..588122beec854 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1356,6 +1356,20 @@ static int csid_subscribe_event(struct v4l2_subdev=
 *sd, struct v4l2_fh *fh,
>         return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
>  }
>
> +atomic_t *csid_get_sof_seq(struct media_pad *pad)

I would go with a `const atomic_t *` to preserve explicit ownership
within the CSID.
This is also what atomic_read is using, so that should work.

> +{
> +       struct csid_device *csid;
> +
> +       if (!pad || pad->index < MSM_CSID_PAD_FIRST_SRC)
> +               return NULL;
> +
> +       csid =3D v4l2_get_subdevdata(media_entity_to_v4l2_subdev(pad->ent=
ity));
> +       if (!csid->res->frame_sync_en)
> +               return NULL;
> +
> +       return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
> +}
> +
>  void csid_sof_event(struct csid_device *csid, unsigned int id)
>  {
>         struct v4l2_event event =3D {
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index a9d88909d37fc..8edb258b0ae58 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -260,4 +260,13 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 =
sink_code,
>   */
>  void csid_sof_event(struct csid_device *csid, unsigned int id);
>
> +/*
> + * csid_get_sof_seq - Get a pointer to the SOF frame sequence variable.
> + * @pad: Remote pad of a consumer's sink pad
> + *
> + * Return the counter or NULL if @pad isn't a CSID or the CSID doesn't s=
upport
> + * SOF tracking.
> + */
> +atomic_t *csid_get_sof_seq(struct media_pad *pad);
> +
>  #endif /* QC_MSM_CAMSS_CSID_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index 62c2405359a06..4972d3ab65078 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -491,7 +491,10 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, =
u8 wm)
>         }
>
>         ready_buf->vb.vb2_buf.timestamp =3D ts;
> -       ready_buf->vb.sequence =3D output->sequence++;
> +       if (line->sof_seq)
> +               ready_buf->vb.sequence =3D atomic_read(line->sof_seq);
> +       else
> +               ready_buf->vb.sequence =3D output->sequence++;
>
>         index =3D 0;
>         output->buf[0] =3D output->buf[1];
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765f..da373024c847e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -474,7 +474,10 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>         }
>
>         ready_buf->vb.vb2_buf.timestamp =3D ts;
> -       ready_buf->vb.sequence =3D output->sequence++;
> +       if (line->sof_seq)
> +               ready_buf->vb.sequence =3D atomic_read(line->sof_seq);
> +       else
> +               ready_buf->vb.sequence =3D output->sequence++;
>
>         index =3D 0;
>         output->buf[0] =3D output->buf[1];
> @@ -508,6 +511,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>         struct vfe_output *output =3D &line->output;
>         const struct vfe_hw_ops *ops =3D vfe->res->hw_ops;
>         struct media_pad *sensor_pad;
> +       struct media_pad *csid_pad;
>         unsigned long flags;
>         unsigned int frame_skip =3D 0;
>         unsigned int i;
> @@ -523,6 +527,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                         frame_skip =3D VFE_FRAME_DROP_VAL - 1;
>         }
>
> +       csid_pad =3D media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_S=
INK]);
> +       line->sof_seq =3D csid_get_sof_seq(csid_pad);
> +
>         spin_lock_irqsave(&vfe->output_lock, flags);
>
>         ops->reg_update_clear(vfe, line->id);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/medi=
a/platform/qcom/camss/camss-vfe.h
> index ae9dad353a378..0e2dfa58421ad 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -94,6 +94,7 @@ struct vfe_line {
>         struct vfe_output output;
>         const struct camss_format_info *formats;
>         unsigned int nformats;
> +       atomic_t *sof_seq;
>  };
>
>  struct vfe_device;
>
> --
> 2.56.0
>
