Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792496585;
	b=e9HitbGuPyVt7+wLh5lvKbCoSNXKzteJV+Z3ZtpDJWsHDSHrrA2Ja0bQm4E2MTGxNBCb
	 xnaouHLYl3UlQk5RsIoqGKyliWllUupnxebo7XN9pr9v0ZkJXxAUpIMHCNhTxZGDbVY1m
	 gUYGzHekqI5qyTDBOwCwJkccqyflrLb2BKnfo1/6u08mPeQJCGOvso0q0kAr9JvZn8rYP
	 4WCUqlDb7mSOLhIE3hY69Wl8aoNNUR1QZ7Sldk03wdWIdZjPzCiNaUpvX+X3nwHeImXs7
	 V9CvV2n8aaKa4v2DQjPlcyPG3hJLqNUA8vojV5dnAUIdL28vVsGou4E/xhqjOJ6sX/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
	b=IchLiepiCnypKrTFQT2cCsOv0HnJ3ryqABkyuckmWwKbqyi0wOudaIs9N9zM+XYLlAeE
	 maMe+NNOI6yAv+GjkGyZVj5ZC9zLOmyddm+CK1BB/ZS2me6BcD6N9wML9YmHSzpkaR5Tq
	 0pKN4jHxW3prI9ni0vut1T9UckNgh+0dRxY9bakUElSyJgWSzRCAKd4u0HylCVWq7w52j
	 xvOY4Bg/wKnR3JNObVJHCoSB/A5arXM73e2x/p+jLcuptSZ46HVXEW0lmo6QcUug4ez7S
	 v6mJsoy8+AidOl+upCpnvGp1iVtpex5ZdJX8tdZUmP/hdDV0eBrpI0RGr2jClJKllNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9PKX0RI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WKcKA9hU;
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B08606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18B08606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9PKX0RI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WKcKA9hU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxXB71293275
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=; b=k9PKX0RIS1XqcBpu
	qa8Yj1xfUwMHMkwx6UGmrUKVIFrpZSBmCsgxlyls2gW4q3j2+fgLzQAV6R5OoAFr
	/1vddzq+CbUHecPgU85Zmz2XN0LC3O2x/n8wmK89eqIDqGCG7w38HUfLj3Gwjzjt
	5hqGTf7DDpK+eI8MwCRzId0GXyAZD7+HuA5hyMe6OJm0O1r3n2fsZ52/9cSBk+27
	27qdk5xYbXmkFrWHm7BlZYmezMLBPGB3AFyj6xZTmdjAKRbdEICJXyScr4h6HGFD
	XJFphIhQ29tiIreRYTyLqv4GYVaGBnbQdumMQfz9Za27zVZDZiR86g8AxZydws0v
	LbUePA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n29qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:43:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f54f15b9eso14936385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 04:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792496582; cv=none;
        d=google.com; s=arc-20260327;
        b=J4dOxfgzimtbODpZ+3GpVz+92yXw5ds0/dOwb4KT8ujd/yMjK1g7r4v9ekmEovRfUY
         ieGsBmuw/Ec3eh2V6n6qSuzHp+nKSj8KyNLWD1ZkKE8kmwMxwC73hG44dMhIJbRpeYX1
         Il1SNmriG1MKsEYIKR0tt8Zy2SkUfmZV5zXgN/mwNQ6o5zzl1sAkaHbWEu+zQbLBhmor
         Pdk1PpHfohLpgVdxhmBrc1kMD8+W+gOsB9lYZ443Dqwuua5wqi1d0+MQLS33NN98RngJ
         vv+sgQ1nZeTNYqPjCb246p1lsaKvl8KIwWf9viC+e3viHxl3fq8WJIUXrxBDvL7EG1fm
         i8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
        fh=kWBvVExpjQQBi/z5M8f0kQis/9Z8Fv5o6tmFzUmC7uE=;
        b=ilORM/9JPS2wpVTulC9HFX42kUQdqPArpg80SfyBo6YXewid1Z9LyOOBYXWA6htSAH
         GSWlpESrRJOAxs3xWXJN/mPtpCG7PHxqKd7u5gI8q5KiivQCgibI7fmMb9wUHVmfzVKm
         gtLw1Z9As4sFtCMml5454rXLa2n0bGqt/rtkd5EDl1Ud15GgKmxBciu2xh3jxaotPiLP
         ZGOWpCMJUEF3IGzlZb6qGgQe2WxGrgNI3/lRJE5PYTCbDOJ6f3QKEEFGOw+NuQImq4oo
         SYP4dx5D36l/9dcOeceRdr0HujfBEChDJgdk6Az0SF2WxWxRYlOrYhCcJneiYDG6j+Ot
         tR4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792496582; x=1793101382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
        b=WKcKA9hU9oHBpj/2Mj9p5SA4pn8JQ3H148t8bOHq7J1mc+TdPOItWTSnvvdgT1u2/3
         gxSEI5JxUvfVKEvR5RauLPGBbFyS4GjY2S4WlHsuHWnZSaXH88g32/saBqtHHeyz6iX5
         LH/j18YaYvuFOo36OqxS+50LDI+5mR1aUVstxrsVZL5ue7hycCj8fbBoepxi8UQbcCKM
         L3dZRXlUe6LP98vibo8cUEnh2hivgMkD16V3BAdf5w90oE1+53gznCZSAPjwW2oe+smq
         h3rAriOfYnVvMk58rZR3EZbKgixLJBIM1q+dBJNIxQbsINiLsPlN4Nu+DQzSSeNbsL3j
         0Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496582; x=1793101382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
        b=UDmR4Uv0QqN703PZ/+twrlxapynJsMHCkJGKH6pPDr8ZsjcsbNmXkUNq4WjJRFdz0r
         SnHm82b0gcNS0C/7xOL2qq+LUNY44TciYJeiDb52VkGllIMI9/sbACSvhpy8hkJPmrh+
         fE/BL78G6z7GZC6gvTcPujtS1ahRs+NGhDcpVA5EOyPL0OZFSpB1v1iH67dCdiaddM4r
         0HNiQYnrpI/eRGLKP7U+dJYJv+Hh5ml1DQaiL7s75XWk+lMwMBxIsYGSVsBB5Vy1/kEj
         Cy85YGz37lig+OgmNAFGb9IfihanmKLBPx+t6LPf3uBsmll425SqMRM8VM/lQPYUVHYw
         u+kw==
X-Forwarded-Encrypted: i=1; AKwUvByAqZROK/1ejdEhdkAz7Ap7tX5naN79SZthYvc+iFqkCouwtRE6kOmnnXKu5UH4YiUm1qfrp6jeNoZ2OJ1u@vger.kernel.org
X-Gm-Message-State: AFq9FYIPUubc0eKcDmptNLPF/eSqF9e/ZL9RaoxGnyWfpz5V9m7UILle
	EFZ3Evqxwg0ecP0+akcX4kJzAaJllcL8sMoNmcSZ44FIipAzEnd6m0cZPkEpiywNbRQ0nID/ZBo
	3ReUKqI4m05i/xSJUEvoYJzFEMipbml/Vf2FpWmhpQ6m9X8Fu8zYttM8bL/2DevQ/uDkwz1okcm
	LgdsnpymyjL97i0mLfx4TLeWMsSAtR5MvF96DIJiH5/GA=
X-Gm-Gg: AYBFou2Zz+1H4vJxeUcb6SXEYGZlFIfvyorVJOf0fCCCdyYP8FHygSNRB0ikzIUraMt
	jTC32R/JGUhWIau7tnyFvtTlwmuMFwPNe8IQh2Qo1nFBFRcR6e9a+FmwpoKN/p6bOz4LWqTfCQN
	yZ403y407J5+BSbGNo7nmixHdlnANox4ieWyWoClFrGFkGBJZxi57zG/pVo+kyBVxLuiNeeFR/A
	4jlvyv9XR/atMysOtQj1eS4bruBZDaQUgQ1NU9QKVUmAZafl2dx1XJ7hgIDs2hnB3PjRRqN1YY=
X-Received: by 2002:a05:620a:294e:b0:93f:24d4:ecf0 with SMTP id af79cd13be357-93f29d6f5fdmr1786550685a.47.1792496582362;
        Tue, 20 Oct 2026 04:43:02 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:93f:24d4:ecf0 with SMTP id
 af79cd13be357-93f29d6f5fdmr1786547285a.47.1792496581916; Tue, 20 Oct 2026
 04:43:01 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019055109.49922-1-slark_xiao@163.com> <CAFEp6-2XUE4AQPm5hinnRGyrrsHok2ftsFXragiHgDSKKtKWow@mail.gmail.com>
 <70714501.3175.1a157532149.Coremail.slark_xiao@163.com> <CAFEp6-3o6gCb61hCQTJydiH2aD6CBVRa947tpmLe4L9j85Jg5w@mail.gmail.com>
 <65d8a1b5.8e5b.1a158ddc4de.Coremail.slark_xiao@163.com>
In-Reply-To: <65d8a1b5.8e5b.1a158ddc4de.Coremail.slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:42:50 +0200
X-Gm-Features: AclHuK8BuO4jl__rRfhaUS7jXOaRUiW_m7JFZ3VPSObwRmR_MtAJEM7HTIQLf14
Message-ID: <CAFEp6-2LSJaKHwZdgdHUzJpPF0H+jGXpHgy3YEPzJR4oAFUTgQ@mail.gmail.com>
Subject: Re: Re: Re: [PATCH] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 9g9qx9XbflEUut0VnGsRAyZpwuMdce0r
X-Proofpoint-ORIG-GUID: 9g9qx9XbflEUut0VnGsRAyZpwuMdce0r
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad753c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=aMfntx_4cxk6xlV4G7oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfXwPAtRECcgKv1
 FOAP4ET5w7/eg9lvPQz4vt9bPep39FSYqJZhPdOlm/fYxtTrhBGCCVUhGZj1plGDEkTh9as3WUC
 +S5VMV0YF+6jKPq4zArRtRjmO/gTO33XfJHt0UXG1cNOPFoRL3ySocoD89EBe3Lee9nR639w5IO
 Sr2/H/NNqBU2PAoFCNr7IAIQCEOxaQQEIBebuxUKDkzn1oSKYjcIwaPcWXpAjbr7ww99Kd9i4u1
 csi6WkvEqrI7q4UtjsNRpo3Ism3jWbxx6H3lni+TPk1i+EvelOmA1L3tPlf4sM/5s6R1x9iTGwf
 1ONV/GFkk45Q4VTt1TaRIg764mQ4EDBh5OfFuQxSPbZzbjXXs2wjVWy/Ndw095E7cxY0ovmigbc
 UG7TP+6QKT7NTZZv3NiXxyBYABtdPBTVJe5wN8USj0K5heMiE10eIx/4hgamLXRwFcyTUIhVEHp
 7RtC3bHMtWMx3N56Lxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX6/6MAUNtvP+w
 7C5IU35BJSVFYe12IBTYxPP5pFpPlITi8QoavQJtol053G/yrfTbq4QCRuVsG77JGcr2XkiPHqC
 LXQ411W7N0BN25ExQK4L79aKxweoos4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200046

On Tue, Oct 20, 2026 at 12:31=E2=80=AFPM Slark Xiao <slark_xiao@163.com> wr=
ote:
>
>
>
> At 2026-10-20 15:27:43, "Loic Poulain" <loic.poulain@oss.qualcomm.com> wr=
ote:
> >Hi Slark,
> >
> >On Tue, Oct 20, 2026 at 5:20=E2=80=AFAM Slark Xiao <slark_xiao@163.com> =
wrote:
> >>
> >>
> >> At 2026-10-19 15:41:27, "Loic Poulain" <loic.poulain@oss.qualcomm.com>=
 wrote:
> >> >On Mon, Oct 19, 2026 at 7:52=E2=80=AFAM Slark Xiao <slark_xiao@163.co=
m> wrote:
> >> >>
> >> >> For some MHI devices in some specific scenario, the default value
> >> >> of autosuspend_delay_ms may not enough to handle last wake event.
> >> >> This may lead to some unexpected problems.
> >> >>
> >> >> Refer to the Qualcomm's Windows settings and we checked this with
> >> >> Quaclomm over case, Qualcomm recommend us to set this as 5000ms.
> >> >
> >> >Qualcomm
> >> >
> >> >> Qualcomm also suggests us to update this for all MHI devices.
> >> >> Since this setting has affected some existed kernel versions, it's
> >> >> better to be applied to stable version.
> >> >
> >> >This looks more like a workaround than a proper fix. It would be
> >> >helpful to describe the underlying issue, including the timing and
> >> >sequence of events that make this necessary. In principle, either the
> >> >device can be suspended at that point or it cannot. Relying on a
> >> >delayed suspend feels fragile and may end up masking the real problem=
.
> >> >
> >> Hi Loic,
> >> Honestly, Qualcomm has been analyzing for over 2 months and still hasn=
't
> >> identified the root cause.
> >>
> >> Actually I have explained the reasons behind the events to Mani in ano=
ther
> >> thread, you can refer to https://lore.kernel.org/mhi/20260919095506.95=
70-1-slark_xiao@163.com/
> >>
> >> From Qualcomm's perspective, 2 seconds is not enough for their default=
 design.
> >> They recommended us to update this value to 5 seconds and Mani checked=
 this
> >> internally as well. So we decided to update this 5 seconds setting to =
all MHI devices.
> >
> >Thanks. I'm really surprised we still don't have a more precise
> >understanding or description of the underlying issue. That said, I
> >think it's reasonable to proceed with this as an initial workaround.
> >
> >Could you please send a v2 that introduces a define for the 5000 ms
> >timeout? It would also be helpful to add a comment explaining that
> >this value is required to accommodate the 'late wake-event issue'.
> >
> >Regards,
> >Loic
>
> Do you mean something like below?
>
> /* Add define of  initial autosuspend_delay_ms to accommodate a potential=
 'late wake-event' issue */
> #define MHI_AUTOSUSPEND_DELAY_MS 5000
> ......
>  -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>  +               pm_runtime_set_autosuspend_delay(&pdev->dev, MHI_AUTOSUS=
PEND_DELAY_MS);

Yes.

>
> Thanks
>
> >>
> >> Thanks
> >> >>
> >> >> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtim=
e PM")
> >> >> Cc: stable@vger.kernel.org
> >> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> >> ---
> >> >>  drivers/bus/mhi/host/pci_generic.c | 2 +-
> >> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/h=
ost/pci_generic.c
> >> >> index 7193a384cca4..40735beb46cb 100644
> >> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> >> @@ -1483,7 +1483,7 @@ static int mhi_pci_probe(struct pci_dev *pdev=
, const struct pci_device_id *id)
> >> >>
> >> >>         /* Allow runtime suspend only if both PME from D3Hot and M3=
 are supported */
> >> >>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> >> >> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> >> >> +               pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
> >> >>                 pm_runtime_use_autosuspend(&pdev->dev);
> >> >>                 pm_runtime_mark_last_busy(&pdev->dev);
> >> >>                 pm_runtime_put_noidle(&pdev->dev);
> >> >> --
> >> >> 2.53.0
> >> >>
