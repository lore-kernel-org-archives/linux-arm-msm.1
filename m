Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C604C3A1A27
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366479; cv=pass; b=WMcnK99z67W/PgosYJrAGcL9XVqg4zAY5o0tm7S+3fSgg/tuFx+vchNshbarx1/5138+GWebQ1d9kq5dzL+PY/grwXP2pAJoT3WBWjjmktkvxyE1MKwmt5cSuLp4QSo6QeWORYPQiN7NLLjXTQLl4RqeTvEnuKBSjCkkH45YExg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366479; c=relaxed/simple;
	bh=k4xfR0PeWNxd/reUF6upN1QRUBTuiHQNijGzhwYPpu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nD4fHkyqd5E3FIt+xtQyhLLsl1y2AT/i3+cSq5KO7YqcPSe0AVQk3D2UodqvryCg6IY+9ukjykOtsu6VlwSK9r4hi9NGwiIvDoWP0dD+7i6rFCZClI1ghLEWiT+Sk/hSYFIPH43RxZb82PLXN78H4DA22xrlvp78LAx74WbSPFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVYm0btx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bp/JhtEp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVYm0btx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bp/JhtEp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5is3Q4058214
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=; b=PVYm0btxLAUVEefj
	MFjGUCqMsofjo/3Sljg7waqF/TlsXwon5zrbN4AUw0HMwsfIIaT3VV3yGGto0AyL
	YZfUGZvaihpNmPvRZhxMMD/57MrPEbQW90J6qUO7ZnGwG1iJU0G8ilpTb6o+EKKx
	Tn+N6QQNqHqIFNTMMt5QmwR0sdqVU0KGU1rvmgHwL2ZplrGrnsZogvae2dSP4Lbc
	NmkLO9kohiV9j/LXb2V4u434iEJ3ZjtA6/ciAhqTpUgS0C4WXnT+OqlAItR04tcc
	cECi4WNd8oB1X2AOK03AhFLQ8L+rUU+VW4ZIYR4uTJ2Byp9slybde8bWBZzdoLIY
	OrGRyg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hss3hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:14:36 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8648f12d52aso42998947b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789366476; cv=none;
        d=google.com; s=arc-20260327;
        b=lWH3w1AXz6J2DUjgfGM73K1lvcM2+SXwwjfsJtskWnSFqtcTRRt6Bry252OhXhrLgS
         R+4J3JAeGOjOnbwmvbra9Y3DCCabFKg2oSyl4R90nb2jMLrefQ8Kz9f6mDmgbDsuK8c6
         MoFRCtTh+Rzi5sw3R7yJGfMhR59PLOE2+A3LYSQubtZo4ID3RfLjYJRmTz8mxqWfBf51
         w3qTKUvYZjaHl8HjaSq66QBwId8ci8XuBZqWVf1Bm9lLfwMReOk38lbl+5wfBVGbWT6L
         HbMrcUPide2T6V5iVdl2vGdUDXrpDhbpO+Fh5lBqhtjbXqs4cewn51kM9P7ukZcXPTYk
         x/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=;
        fh=oMOI6SEDprwsOlVPLM+dybYmE4wJcCl+xQKtcdKYTzg=;
        b=B3MpONQMsdPlhOx9KKa7JEyHlB72VGN3KNP8g0zXISv10h/IhKiLGsUVVH7+TjoW1o
         bRofdAjB0ury+KuXdtuiqOm5kspGNmweof8t/e3+cdbcpXHiaNpLwIhebvT3kmKVvug3
         XUoSnY22eLnype2wOpZmnN8l0jYIbkVmYY5+TcteiBIqEGMcCoo5OHITrEahjFlscYFa
         3zyCVnN/1RVDSOARuLPfKoalUm6Y8mzx2BJOvueAiaU9KIMv8/4gsGfD81JZjicK7gU5
         j3Ak8ccXj/bBp1lYV7oEkJ6ciDPQVi37KKENvm1p7YI1zYwXafEMJWCriXU+O3S/+b7t
         VSoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789366476; x=1789971276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=;
        b=Bp/JhtEpuCrjRDQP5EmYJHuPzIMOP5BSLwKCE3nTfm8adLme1zae+FeLuiEf/4PaIF
         NlVndRJ+qWgslH5JJkNr1u0NF3dgkRfvGJUd7a8yHUcQ0ImxxzOYfIAF2W7TL4WLViEl
         h8KOcu9KVBngi0B/rcVyNwAvJPmO0hrGRhT9J36mqHL23ZAc33Qsk/V6eX2fC9qR7Vlt
         tQ1f1wETRrWQ6i5HoZCwGnZw3xIFlaVDUze6wcU+8JZ6WXhnBPA+RsHovN8XKcDd95hL
         Ci2Jqbq7Si4QN0wCYOcUGgF/WFJQ77+ElZBVV7Tj97nerwwsSsybFXGTFK/HImw7elmP
         7aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366476; x=1789971276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=;
        b=abrdVGb5g1CtQVUxaCZ7th79AirdyzRXLfIhzTDuipqaqPUPd9dM5k7mHPTm6tvKrB
         VaMXNg3O+25m392gIDUeisLWVmNPL0kpoXf9H1jhw4QwSx2hPiuuZz7vkFq5eCTmi+PL
         t+a8/IY7xctPeLJaqiaozIANn3PmnqpP54ByHCI42ODmSRH6Rty2de043eZw3AbFTjB4
         wXhuWKAeNINVMHYqkno51ZQnGbJZlqa9BnKBv/P7UqyXZkvtBfKDGRUF9ktiDeY3N8vT
         i1UWrMb7Rupx1Fy9I5UqSr2EMPEU+LTIv7thypaviGCYmNYuCeQ8RyVcBWTD7T05tL1U
         eUuA==
X-Forwarded-Encrypted: i=1; AKwUvBxzT4csQLJinEN6DSzvwc7yPYE0mJAkrS+y75ri/3QCciwQ3dXj4TpxDGJYfU5gQl2u1n+o6i89oeGa9qtk@vger.kernel.org
X-Gm-Message-State: AFuF++m8wZJOhZL0HLNlHhuEM1pVJcv7REDgPbS0/3pCe745kLkYvxcx
	K4aIcGmCnN6n6GQINsNLCXVG5GQm9WOoWn32b/3IJlqvCCFj3XlW4meSf9gdN9hOGpW3HWEpBWb
	ZBFTCO7ZxXdwo02shEsAe7nlzV/J5UaePZpll/dN/73ah+g0xvB3whYOX44+XHC6jfQ2MvTI3NV
	HyUTO7kKk4mgefRi5EH9m01Utm9OZWbowFZjv3IS/OTj1pfRQo4bc=
X-Gm-Gg: AYBFou3O7p8/8P/j2xOliLfecszKPoxx9LI0gle4R5WpjiZ76dYjsZxk0GllBZ4Y0NO
	25U6y5PbJ26uNrNfnr7wC8pXzz/EAxOBMXd2/TokdXLA4+v0Na3G05+ZB8kg6Clus6PRxRoflSi
	ygrZUwcSEAUUnfnkUOl6a+yxmlwKOkddl9PTkOSVGsznasYUGqdWilcsC/aPg=
X-Received: by 2002:a05:690c:a194:b0:88a:99a:6ef7 with SMTP id 00721157ae682-88d429bc2cfmr1481267b3.29.1789366476024;
        Sun, 13 Sep 2026 23:14:36 -0700 (PDT)
X-Received: by 2002:a05:690c:a194:b0:88a:99a:6ef7 with SMTP id
 00721157ae682-88d429bc2cfmr1481177b3.29.1789366475619; Sun, 13 Sep 2026
 23:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org> <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
In-Reply-To: <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:44:24 +0530
X-Gm-Features: AcwNN1WMz2nu0585ncfAPT356zzZjVDl_ErD0iCxDirfyWquSHbcFRVIWjnzCME
Message-ID: <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA4NiBTYWx0ZWRfX5e99Q/EDmgbH
 vXQFW6UX5aYKNjVHHULLOJqZ5g7MbjnHDhB/SD4judz3yCvXISE9+xRbfktnF5MuZPUqxwMT6Q2
 zUT+knJQDQ++quxDBHNp1qUPhkV+rlmbO3VkYNAn92kaO+LaxgUSaJEf0EKB/dBDQ4Pm0e2Q/KA
 pjRAnDX6BCYwLRXunRybQvl7pf0qxbuBNiYMG/oPKsnwMoMWpVE8tS1Yd/yc6fPCw4JnlUPxFpY
 0P3I6n2kEIhcVKqGwsDgTrUnCl5BKQvy2tF9Os+7/g66BW2lmkAxSY0py1lqArugmQrqfeaM3T4
 N9zZQlSu5yMUNSRN6gujjSK2gvcdUhz+X0GIh4KSkypyvHChf/w82x4kY4y5do0FEq/KxPhHfur
 4UJZWQJ60A50EiBzBZfdJJbPOb1pgD/Mgqf8YrUzmoZmTqVekelea31eVuuLi+VrqARqXyx3fwL
 FBty6Z3dXSb3H+/ZIlQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa790cc cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=P_Z3VnmZX6NCh_LFz34A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: 0MDee0wPEedblgMJbGCI9Z9w2tx_Cerl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA4NiBTYWx0ZWRfX3CkQEVXexWX7
 WPUP0M+aTT5m7Z1EyPjXQ8jBsALgdPIda0BF0fzt5dAgMcClPn4ADjHMZ3FGwGZFOJYa+rn6Ph+
 IlNKr5CYgTKpb+JfyY8hatps0g0YBmA=
X-Proofpoint-ORIG-GUID: 0MDee0wPEedblgMJbGCI9Z9w2tx_Cerl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140086

Hey Konrad,

On Fri, Sep 11, 2026 at 7:54=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/11/26 2:38 PM, Sumit Garg wrote:
> > From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >
> > qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
> > with OP-TEE the TEE owns secure memory protection. Use
> > qcom_pas_get_backend() to issue the SCM call only for the SCM backend.
> >
> > Assisted-by: Copilot:claude-opus-4.8
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> > Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +     /*
> > +      * qcom_scm_mem_protect_video_var() only applies to the SCM backe=
nd;
> > +      * other backends (e.g. OP-TEE) own secure memory protection and =
do
> > +      * not service this call.
>
> Can you not just stub it out in TF-A then?
>

Please don't, we don't want to support these random SCM calls ABI per
subsystem with the open boot stack. All the config in this case for
video is handled by OP-TEE itself.

Instead we want to mostly support any subsystem specific TZ use-cases
as proper client drivers for the TEE subsystem.

-Sumit
