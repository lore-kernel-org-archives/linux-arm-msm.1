Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699778;
	b=D5I8HXMZJ8ZMMgmxhLYpLdCKfmypA1JECceIy8O06efYnzrLmC14LsThQsxVyIeVnSqB
	 hLXZSqUr0XCkysLRW2Dgxw3sCXPK5V8mV2aP1/Sf7vRmots6ROhoL4D4gZBneNGf/pLMz
	 f7NE/PZ4fgkOcMRfXZtuX73ygnEQRnIj1ec6kOl9a6V4TUyxEybmwq1TcJov7bA1q71ta
	 6RGklldLllZAvhDEE5xiA16BIbjBqYEVkU0SV+IeU6S4DtYHpys/vAlDdZj2UKeAm5iPh
	 dLyJTFQqKQHslFZcIUyuje0hcfSuG9yz95FP4DjJstzC4CJpn8qSC2/2psvcXWTx5AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/hdNG9HXtDva252M4GklpccLFDdn1TQoFlQzO/EQSdQ=;
	b=ZIXv3MggIWyHtJdEVj8cN4NqUCiTLA+KQDAHPSvnjZIiRPkdBXQybuDn0puQr0JNtd9E
	 AXWLghUinZ/4IMOLl99Sd4Hc2wrwhYeU3v5UoOZfkrnvkXbnmI+k/NMhqg+LJv+R0Gp7+
	 thshXWerjnq6138H1Wdfbzme5e+zMdFZQfHfkgzvkxJ0pGWhUCDaoVVxv1luyeUd9xcTa
	 RYhiSaJ7VaFblMJs5F4d+aU2rXGPGU3NAEMEIFm/u4YCB6Jhw4bys3/vqSODvnQHav2MS
	 C8+oN0SZ44acTIDh6V63lCm4tMCRUgL2cNFbzvDvQak+x0e3XMh5srG1UbBhc0+J+FQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp4fSQmq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaioP0F9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6825D606B35D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6825D606B35D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp4fSQmq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaioP0F9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A358DqL254432
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/hdNG9HXtDva252M4GklpccLFDdn1TQoFlQzO/EQSdQ=; b=jp4fSQmqWXy84gYj
	/fDFYa5X0XZjOn5dngtI0HHD2qrD8QQ/RAckIc7sMci1ns/A55i+ekzyXzezkoK1
	NwXmaXnQAXX9GVLrpHTgOepgqgW28MhyQFaoM+I3/g9CtoKJktnWW+ZjrWF8MN0s
	bJfq1tr9WR3s94ODdQakHMOOauxH23RunYZwxR/NLefkfGSGFAD1mJTlAb27kuBD
	M73MQQt77wU80hfFKFuNcWyyqS8zvHRv93wSKhEreC2C7OjocCvUe7sPfXkxAans
	1S2QHT14DGihfI+trV2Ajwj10QRbvbHOAXE46EUIrm/VZBxIAL90KUD7lZ4FSGZL
	8c/KHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ek4en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:56:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so716061885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699775; cv=none;
        d=google.com; s=arc-20260327;
        b=hpW5tEtd+6u9stnGy1DaZZc6sNSNMRl9Snvrb3HJeHpsOyHbXug+dz+qIwZ4NBepm7
         CUwtltiuiKwk5sNmSdmGKjhv5Iyh8cssss+B0E3mXSCuIFa7RIX1+ImHAJgR8gbumnMk
         McILdDKJSGDrIiHD3uAfkLduz7YXP8e9juPvx1y5UlwlBSZtD5bA3pq7K0j6XFbMVEzR
         lELG3LYmFZhHRhMoA98NEMzyZhkIjU6oLVRsADMHmtFWPgjNvycwiuAMHZBRLLOuReax
         8hUOshPgvrau2XOFpVt3wX0SSP1M+NuRZ8Nw+jBituKC7UeALLKCSO7yT55ONJ0LRgd2
         ZLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/hdNG9HXtDva252M4GklpccLFDdn1TQoFlQzO/EQSdQ=;
        fh=oFMRxeGzRuCQ6DFtmC0SevWl6SpOlrKTU1OZqCYGd4E=;
        b=VM6bPBkqzRJ3rbTRtU8Oc2meTwDzAV9vMH6RWJlz4LOZKl70wX+dqbkKAEMot2Il9E
         5EhSRVztSYVDkpL0BJrctrNWZ2T5+Aqdp7dRh0hWLKpR5Qd+4FQPzYZarRSAYi7AcAT2
         OGA/TV9qUrNSDexHkMIa+JDLXVEIro13RPjOc11a97LE8px+CxPtnH+Fav+kVr6GZo8t
         kx+3xmMNPd6DanvLidyZHSG+hZERyjNiz+Iq6kt9DJz9Gl/qQUKvSJ+WKrJZ1g2A9TZ4
         7wDouChdD+AlacLvb5W9dgmuF26as7PpUQ/cdHM+ZHYjQZslO+Ta1apiObDX3v8I1+It
         B8KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699775; x=1794304575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hdNG9HXtDva252M4GklpccLFDdn1TQoFlQzO/EQSdQ=;
        b=LaioP0F9OB1A+eitQn5DL+QVLdRhbv1RIdx8clRnA5uafXMCzExPX7hOETb/4AdqKn
         EoknmucOa0roCr6iobXVSoJI+yztYxrw7z4a8tQ+EDmpl97CVA8zV5sf1akHQmT7h97T
         p7Y0Kd0B6y80EgxEc8ARbWJhRZpoLLvUx+AsjnFmy7OlF1Kercha3SNtMnMDTvZIUTtK
         GyUEK3uqPZSPv6S6AjO/aZ82FoC2wIynBBH4X1yg1QN+pwSBKQJxd4H94sE94vaXDhdn
         icC0iT4hUY+xilwfWI9DSyQGtFtreXrA0XcmA1AIl9+hs/9TCXrkoazZoLKECXoD9qIx
         HEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699775; x=1794304575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hdNG9HXtDva252M4GklpccLFDdn1TQoFlQzO/EQSdQ=;
        b=F7+B/6bzi8dNq6gUhtk6tXW50cYllRC4WD2Y0K89gBzmMYI/sbb/llV5au3louo5OC
         OS2tfMKIGa6vCQeSzKHWcXHb0Lp+jrZi0IT9GhSWJLlL0l7AiIgCYSsjma9LGJYVB1sf
         RN7mHlunlboFZi0Lns00XIRM1pFsRfKnrMPAdN3p/b4+UemGLtuGqqZCTWhzBKexcLSJ
         gKIGNdeStSwsbh+a1gwHGVs5q5or67Ip/SMSVUPg/UNhQkIaF4t8/EfvTg5uROF5f3cL
         XiiWWX93Hmq7PAt6uTBtZkqiyvdo0gF9ZGZ/nBuE4Bz30MPxru3z5b0JDdH4/8rxnfu7
         jGFw==
X-Forwarded-Encrypted: i=1; AKwUvBypuBLuxhbnEpWJO+BXCjtVdQuSc9191jxj3kRwZ59W/KO1jvHB1iHZpllLg9xvNPnsY+IpWi0TnG+RspcQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+HSISOyO8ZggM4qc/IIlbr6/cKOS05Pu5k07EyZw/cK2mPPpXq
	psejisZA57UgHjaMA2ibwsGRvGiplufHBhD1PwCaaYz+NaKKoPqj0yS82xqib5Znmi34uSBqhj8
	mh53NX7HoDZvOeAjPA2BaSveboi4+yqzJ8vKQ6M6QO4gqj3UGw5FlnhLxcusIqiJ8EiHClT+cru
	f0zBrEINOUXGUU9tJBs09/LNDPmReoATcM0RzrZgsI9uo=
X-Gm-Gg: AYBFou3FxGc+r9vDsCy7VNGgReyt0kMj5hlzN/OJmDG+YvgRgqmjOzZHCemYIE2kJTe
	ovG5Lo3+BcK7XX4RauxxxXE41w2hpE40q1d9NRceLKA0CNhHYgrDfdf1Q5qKDwWLsRpbPbpC+uE
	4NBUj/wYimtQOB/Dg8EEzhaiZsLdyMnkmJZ6Y9EyTqhZuPCCeukyEbLQ76l9+sTFHGGs/kX/o6Q
	TMdK311UZUDn63Yv+gNLfy9lsV8m9ST1qAVutRq+u9iqzS3zM6DgvPAhu+M44S4QCHkBTqwyuw=
X-Received: by 2002:a05:620a:880c:b0:93f:1936:b229 with SMTP id af79cd13be357-944217ee7a9mr1723919485a.77.1793699775536;
        Tue, 03 Nov 2026 01:56:15 -0800 (PST)
X-Received: by 2002:a05:620a:880c:b0:93f:1936:b229 with SMTP id
 af79cd13be357-944217ee7a9mr1723918285a.77.1793699775099; Tue, 03 Nov 2026
 01:56:15 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org> <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
 <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com> <CAFEp6-0RMZuQko=DdJmpGg64piMX-udW1ZG0jpGkHNTuU7ozqw@mail.gmail.com>
In-Reply-To: <CAFEp6-0RMZuQko=DdJmpGg64piMX-udW1ZG0jpGkHNTuU7ozqw@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:56:03 +0100
X-Gm-Features: AclHuK_pmqDcrytSHWMhzN4Ld6ZB-fkhi66IDifMLpwIrl2Pk5ie9f2nPiJJaF0
Message-ID: <CAFEp6-2f6Bgv3btgry=hjeNug5UO301-9a21G5VeiUsUi6P9=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX3ZdwWR0TOX0e
 8fimBiXroA9hTamRHa3/qfW8tJqrxylvdy84rCLGI+ZYjcS/egg7p4xFrWtlEuzMk5UNHyMY9VP
 1hu0reCKOtTbaO43shEYQ6YLse6NTyPJubvyjLkOCJOakY3RT/yGU62s8bvwyO83ZFdJy4TssWB
 BD/zVVPiR0xTH564mfrvZFY+zR/qcbnGCdF54F7A38wMmeScwacimEbKFvmXjz0e4q2EQDEGVDi
 vXP29ScwaEOqChSbB5P01mV++0TA8LKRsjZzNKTm1+tsYqAplTCASlqy4nbQehWHhDrO2CiM1Yh
 t8qW2yBNVTWMhPW9gnlrUSVgHZMIbkFBmhjStXdOyBPzty/TG7ILVUJU2qu8GOOOqQUlQvvjAFR
 fkvexX5TQa9nN4iB+9Frc5HiUeJ30lF4P4uHiIG3sVNGLRT+Dr3WvnD0neKjjVmjbkpmRCbi1Jt
 yHROv1Mpjkn/FewoZCA==
X-Proofpoint-ORIG-GUID: Lf7_MfXz3aP4Uq7s-YCbyCeuLvkMkdh8
X-Proofpoint-GUID: Lf7_MfXz3aP4Uq7s-YCbyCeuLvkMkdh8
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9afc0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=NQhdVlSQwCN5q0FL6oYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX4U9wo1f9MAXL
 gtAFYUsHI60ZOgLDu3HdkpGcVrqlPI+3vcFX3LgMeBqyg/Zz6am/JwJYYLlPUL5piZeYu+LPMmh
 Vl+qZJF18UKuvQi392eih4uz9XTw2zs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On Tue, Nov 3, 2026 at 10:53=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Tue, Nov 3, 2026 at 10:42=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >
> > Hi Loic,
> >
> > On 11/3/2026 11:33 AM, Loic Poulain wrote:
> > > On Tue, Nov 3, 2026 at 8:11=E2=80=AFAM Gjorgji Rosikopulos (Consultan=
t)
> > > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> > >>
> > >> Hi Bryan,
> > >>
> > >> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> > >>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > >>>
> > >>> In order to communicate to user-space CSI2 SOF events we will need =
to hook
> > >>> into and control v4l2_ctrl_subdev_subscribe_event. In-line with oth=
er
> > >>> implementations of FRAME_SYNC have CSI decoders which support the e=
vent
> > >>> always generate it in our case if and only if an atomic user count
> > >>> indicates it should be so.
> > >>>
> > >>> A flag in the CSID descriptor indicates if frame_sync_en is support=
ed so
> > >>> for each SoC that supports it this flag should be true. Since bool =
is false
> > >>> by default no negative enumeration of existing or in-flight CSID is
> > >>> required.
> > >>>
> > >>> Subsequent patches will enable on a per-CSID basis.
> > >>>
> > >>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > >>> ---
> > >>>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++=
+++++++++++-
> > >>>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
> > >>>  2 files changed, 65 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drive=
rs/media/platform/qcom/camss/camss-csid.c
> > >>> index a00791b00feb7..e9b399fcb9c7a 100644
> > >>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> > >>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> > >>> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *s=
d, int on)
> > >>>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
> > >>>  {
> > >>>       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> > >>> +     unsigned int i;
> > >>>       int ret;
> > >>>
> > >>>       if (enable) {
> > >>> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *=
sd, int enable)
> > >>>       }
> > >>>
> > >>>       if (csid->phy.need_vc_update) {
> > >>> +             for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> > >>> +                     atomic_set(&csid->sof_seq[i], -1);
> > >>> +
> > >>>               csid->res->hw_ops->configure_stream(csid, enable);
> > >>>               csid->phy.need_vc_update =3D false;
> > >>>       }
> > >>> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_enti=
ty *entity,
> > >>>       return 0;
> > >>>  }
> > >>>
> > >>> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, =
unsigned int elems)
> > >>> +{
> > >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2=
_subdev(sev->fh->vdev));
> > >>> +
> > >>> +     atomic_inc(&csid->frame_sync_users[sev->id]);
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> > >>> +{
> > >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2=
_subdev(sev->fh->vdev));
> > >>> +
> > >>> +     atomic_dec(&csid->frame_sync_users[sev->id]);
> > >>> +}
> > >>> +
> > >>> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =
=3D {
> > >>> +     .add =3D csid_frame_sync_add,
> > >>> +     .del =3D csid_frame_sync_del,
> > >>> +};
> > >>> +
> > >>> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l=
2_fh *fh,
> > >>> +                             struct v4l2_event_subscription *sub)
> > >>> +{
> > >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> > >>> +
> > >>> +     if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> > >>> +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> > >>> +
> > >>> +     if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->fram=
e_sync_en)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops)=
;
> > >>> +}
> > >>> +
> > >>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> > >>> +{
> > >>> +     struct v4l2_event event =3D {
> > >>> +             .type =3D V4L2_EVENT_FRAME_SYNC,
> > >>> +             .id =3D id,
> > >>> +             .u.frame_sync.frame_sequence =3D
> > >>> +                     atomic_inc_return(&csid->sof_seq[id]),
> > >>> +     };
> > >>
> > >> On first look this was looking strange because the id is used for th=
e
> > >> control id events not for frame sync. But on second thought it may m=
ake
> > >> sense, but the question is how the userspace should interpret those =
ids?
> > >> As of today userspace does not have any info for the VC and csid int=
ernal
> > >> pipelines (so called lines). So with the current state of the code
> > >> the id is VC which makes sense becouse the SOF/EOF packets are recie=
ved
> > >> based on VC. So i am thinking of two options:
> > >>
> > >> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-dev=
ice
> > >>    and will be well known to userspace for which line is reported.
> > >>
> > >> 2. Add and propose extension of videodev2 documentation that
> > >>    id of frame_sync event types represents SOF per virtual channel.
> > >>
> > >> Personally i votoe for (1) because it will well fit with stream-api
> > >> support and usespace will have clear understanding of the SOF to whi=
ch
> > >> stream belongs.
> > >>
> > >> Given this in mind it will be good to open discussion with Laurent, =
Sakari
> > >> regarding SOF event with stream api and GMSL cameras.
> > >
> > > I think both approaches can be applied independently, forwarding the
> > > event through the VFE as event proxy would likely be a straightforwar=
d
> > > addition.
> >
> > Yes i agree as well, but the first need broader audience and agreement =
what
> > should contain this id.
> >
> > >
> > > Note that the id here represents the interface index. While it
> > > currently happens to be associated with a VC, that is not necessarily
> > > what we want. Ultimately, multiple interfaces can be configured for
> > > the same VC.
> >
> > Yes and that is changed with stream api implementation, and the
> > following question: what should be the ID when streams with same VC
> > are routed in more lines (hw pipelines).
> > But that depends on what this id should represent.
>
> Yes, then maybe option 1 is the way to go for now.

Also noet that vfe_hw_ops already also have a sof callback already,
maybe we want to do something with that as well.
