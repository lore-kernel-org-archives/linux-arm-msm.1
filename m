Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699647;
	b=iy0LAfWZw5KM7PcrEbltIq6N39TfypEGii7yXPkPtJj1pyAc11gYUEl9tRpnn3Hi3ty/
	 +rYFa3mYtCmxEKPU9995Tmq56/OKSUrFfx67GooNw7dtG9d0c/0W1a9cluGiKEO19GW0G
	 oBYjqdfretab8PpnHdhbzNLbaUtrWUEeEbwqroV5sc9C+4mPpsE7NGBUHlHTZ0oNEbmfk
	 LR9LQGUutjO8D0+rvpPJhGh4jHzP9H0KOB6ogJt3LWs3KZvAb9q0Z43uEKGUste/lxgXi
	 0ixA17mjfFAMTXdHab/H9jG7kwYQHtelsvn1q9Vs8T211/HSmrhCy6FDAmTcs/EgVBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
	b=IaLl6ORFJa+HD+OFcyfaP+G5jsAOdC+o9ceMxARHkHRTk5jfCIfqunv6Yb5ZVyUy7dfS
	 IT32ZX+q0SgilFEU8PtABpzI/43dOuc18619FSDNrLmmngf5byprBmBStYVwMMfvOICYK
	 Fu+hW0MgNKORlWYVvsjMJ83olywa402XRIgGDXdQzIJOQ/Gx2Ehlm/dksf22ctQnh7zGR
	 fU3cNIE7Vg08LhH1Ji/xX/zJCpW8ne9uBeXJ/25Jtsxp5Oieb5RFDUAhPSvQC0waOlWYA
	 u69XGo2mHK6BqDyEV0yAlMb2p6petiUFI2WuwMZV9A8taTJ65pHbrmQ4Y/m0rISLCWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o/EQdLKf";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hrAWVlej;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BAB606A337
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BAB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o/EQdLKf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hrAWVlej
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37xOGV1431334
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=; b=o/EQdLKfs59bGx/J
	uKseIGakkcAjOcXXSfxoAZkvuoUyAK7dNIUE/eWrSXijZgbj7t6jFWpfi1PVZqgi
	myUsowxh8Sfos0PEwRvPX9eXjpYADiYximefN88a+aOatON8sAG6Ic+TZV/h0fpG
	/ucIqPtVQh1rsjhBSxo2l9akvayYckPk9twM5bZ+DNR/Mg54R5tWNdme7GtTobnK
	H5WLuvzFeOGybnF9iKFIXZmHXGBIyoSdaWUL4fhkfA60yZsNdyBtDjYxxvxbko4d
	xD6beOuV4PilTHwcla1sgwu+a6xrU6NzEmkOp7cm8nScrl52GwpU/gT+XZGVCt4I
	eVS2sQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0873434-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:54:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7bb3e2acso54894506d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:54:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699644; cv=none;
        d=google.com; s=arc-20260327;
        b=sYvilk2NP6vr1tPPLQ9asUXT9UATzyN/xL/3T9uGpagMoIYADPmejJVepSJ+pabNE/
         QFAHi+Dsr13d7B2y1jezlIG43pS6AZ3yaMkRILHKnp+fyCDbXdZ8stld9SzyFkmkxnab
         WgKRoHQo72eyWHsWrkonyEiZSydiF+t/YWvA2Y6J16PelTy9JRw5nEVjZd9irlI2NF6v
         9QATmS+pQNFcNBpg2CbwmOZs5HITSoA3f5XYltVSp+LUXlkzK+GULdd4vfComqr2Y7i+
         1HCjFkhi5wuUZ+n4rUp6ZRRArRqI/glbnw3qs+3u4WpVZFm0VjhZP2ZzSE6tsyXOkwpr
         wFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
        fh=ZSDDOzodWNRU8bqVYjDk9+UaNB92FlJ9aHWk/tZagdc=;
        b=HGPKqNpjAN1j3iUpHCAZgl5OhwxYJQ8BFGNE5ZyPYE/A94SQ5ZS5wbmAjv0KnDkTFx
         4aCk5Uj63mGg4irSDp8GHmBO8J7SDlKNfevFJ3pxTjP3T8faqXmqnxBjxKZTNNpgeG35
         pDpDMdDJasOeasX2k9Bf30PI2Q5V3X4OpFGvtd/ER5YT0hCpo6ja/8ZdMrskib4/PmMD
         yx38auW8+UcXTqM1qOBg6q8ZPc5W8/fhJHHHsDBMeijB4j44LSTvr95l1pEo0yVjGiry
         B8C2zf/kfe2LLjYQKZwQqaWQHjRGDcvtAHA00kQbJ3E47hWbdwHZRcif0vUuusaUvwZM
         COuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699644; x=1794304444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
        b=hrAWVlejvqXS1yJdkcfRcXSx7hNArUoeWMNFY0rhGJZbWJbAX0vx4uDrf0Pncwtop7
         jg9nfGdfGyvGrTasB1NdhzHEn1CbwXH01L7QD45fnrhN0kWbtwZRrYC3RjxPHDwNSN8O
         0xjAdsFJHXFfhWkBSVtvurhVcqPQFGVZowxDij1nx4DL8zUUAouw4xRAhKk5uW3Y7BgK
         cvOYZQgo0ywMT2ZpSvkKLChSo+TsiBhyaxpfX5vm1Q1qBNB9vqqBNUOGBx+3mmupSpIa
         vOJOvvM9+AlpRWuNOk/hOgjYyfYDcho1nO5kVT9x1CvB+k9mBnGLHuMyr7zqqiFFHEsD
         w0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699644; x=1794304444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
        b=au5QxvxBo5D0LmB6LDwMGU0AFNE21MboIRpiTEGsZWGkFIhL4AQ2V3iRPKVVckCgIv
         qRo5/IOcfDUAm/aJXLHmlfQF8ATugOiaowfVVnT5+x2Io85/DYyApKMnvVL4VQRe3FfW
         2puF0T5EkAoFIoFSlBi8FVf3gec5HgTQen3LYTDc9cKLsbkPOJfPMI6Fn4UaThwZYIvv
         Yban95A7bUQcyNAj4sknf+YP5d+mzkvFOC9gowT6ydPaAHtRl+nNNPiUcpsKJLIDQ59t
         dnweqsRrsfyWbsyie+iOJ9rngtg30d27bnrEgHEQ0HhWM/cTUq2coRob6Zp+Z7TIO/e+
         M3AA==
X-Forwarded-Encrypted: i=1; AKwUvByckHI08dPWTvpSmejQ/MV+251sn9P/as8o3GNsnwtOqHkNDS55NGTp0tkUbRGD2F9e0+nbYkAfRrOCDd9+@vger.kernel.org
X-Gm-Message-State: APuU4Z8aab/46hoGD1RMLnJ6hkgjFZF02H/im8K/lFIeICiL/PZFqbrc
	ITVMe3OECVEf0uNzOSzHO9T9kumpLvWGu7Ax+n7O+v/PLjDICKV0MnkIuCmsDnp5aBUlyfyE2Bx
	kHor99vIyWy4PIJ5E/k6mHVJPfJgcXVxAEpum+INqG9Ej2W3p/THbmzrpZB1Ghn/qctDG2Dis3P
	hq79KQMHJLkmd9Js+CI1Gjy8qhv2V37NrnFDZPQcRjoCY=
X-Gm-Gg: AYBFou3X8ymhJR4/AK6mWFnXj1p1P2z1AegxE4yKuUtEaWiNHkwlUBSbhHvinKkdJUC
	yoJug5ZHaR52jO2Iv9w0wjY9mDHhJrlme6nGLOOftOp9TvS3tYpyWVZMsaNkMjKdBR8I0zvPzY/
	uvMb7f+L52ZeYM59iHSRPuKKsch2kcvuzzYf0OfQZzvuVsivK1gzVTrLx1Orr6HWoEcdKxRK/14
	jXM6zJKeCFej/JdEMQX7pLl+pPL9+XvQnujt3FbfP1XcGcnYLX2UTZyPeFh58ze3b6o9cE6SZ0=
X-Received: by 2002:a05:620a:4153:b0:93e:f9ba:690f with SMTP id af79cd13be357-94421737147mr2073343585a.73.1793699644343;
        Tue, 03 Nov 2026 01:54:04 -0800 (PST)
X-Received: by 2002:a05:620a:4153:b0:93e:f9ba:690f with SMTP id
 af79cd13be357-94421737147mr2073341285a.73.1793699643774; Tue, 03 Nov 2026
 01:54:03 -0800 (PST)
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
 <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com> <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com>
In-Reply-To: <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:53:52 +0100
X-Gm-Features: AclHuK-p7UhawPaFx7F6Xj5AwKLrYkPyGvAGmkRSwY3CzgDPwBqFDX8qVO1bUZ4
Message-ID: <CAFEp6-0RMZuQko=DdJmpGg64piMX-udW1ZG0jpGkHNTuU7ozqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX9BOGYiys5qMt
 baHNVOH2W2KQn8uYoGC1kpNV7xPvDlJ6NLdZQ0ByvrCLpRuZwsq3qKqnULiOOG4UP7NzD7czaNw
 x7n33V0ln7sZMdkr/UljP5RKcR0OrL8=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9af3d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=GZQqk_n3G85zXuATzoUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXwBTP0Kc9Uzji
 rxjHeHwAJhYiJm/SIqrxEd2POz65BIaXN73WU+1AG/dTJ/+8cI82zqOj04sPGm1SiIY/VREiJ5P
 9lEOiSH0z84YjjRScgWI+bL1gRO5A8TydOnQfG6IbPzazK3jlJBf+0jfuTj02oCCM9h3AAdp1xL
 L06If7JQMaaJpX84aiSJiSeX5QGdauSRBvZXT2/x8PQWlNr2Joasm7GcYKOCjX06VnNiXFLSSBg
 B4/KJkrkr6x6N6yo+PSIO3hYQMfMK1U/7BY0wtatDy+TClrGsJqoxh0PUr09E8PPpY8xW3TDu+m
 8dpWlMStdWXGmu2kVGft2AxUTJ0pQ9ME7GMFNMMWuE6o/rv4KLEfhMpn0Bko7ogRnjtAOm0iz9c
 Sc2hQD5gbvJMTIk0fuSZ17ZFukZUDoHyT+fxxJ8Q63mstOU4O7rLJcjfQmr3W/bTnNCYp0bauSm
 hoxpHj8XaBfc32lHA4w==
X-Proofpoint-ORIG-GUID: ffVCOtPapR1c1_n8icpsTUC9spXBx5M7
X-Proofpoint-GUID: ffVCOtPapR1c1_n8icpsTUC9spXBx5M7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On Tue, Nov 3, 2026 at 10:42=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic,
>
> On 11/3/2026 11:33 AM, Loic Poulain wrote:
> > On Tue, Nov 3, 2026 at 8:11=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
> > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>
> >> Hi Bryan,
> >>
> >> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> >>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>
> >>> In order to communicate to user-space CSI2 SOF events we will need to=
 hook
> >>> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> >>> implementations of FRAME_SYNC have CSI decoders which support the eve=
nt
> >>> always generate it in our case if and only if an atomic user count
> >>> indicates it should be so.
> >>>
> >>> A flag in the CSID descriptor indicates if frame_sync_en is supported=
 so
> >>> for each SoC that supports it this flag should be true. Since bool is=
 false
> >>> by default no negative enumeration of existing or in-flight CSID is
> >>> required.
> >>>
> >>> Subsequent patches will enable on a per-CSID basis.
> >>>
> >>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> ---
> >>>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++=
+++++++++-
> >>>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
> >>>  2 files changed, 65 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers=
/media/platform/qcom/camss/camss-csid.c
> >>> index a00791b00feb7..e9b399fcb9c7a 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> >>> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd,=
 int on)
> >>>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
> >>>  {
> >>>       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> >>> +     unsigned int i;
> >>>       int ret;
> >>>
> >>>       if (enable) {
> >>> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd=
, int enable)
> >>>       }
> >>>
> >>>       if (csid->phy.need_vc_update) {
> >>> +             for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> >>> +                     atomic_set(&csid->sof_seq[i], -1);
> >>> +
> >>>               csid->res->hw_ops->configure_stream(csid, enable);
> >>>               csid->phy.need_vc_update =3D false;
> >>>       }
> >>> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity=
 *entity,
> >>>       return 0;
> >>>  }
> >>>
> >>> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, un=
signed int elems)
> >>> +{
> >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_s=
ubdev(sev->fh->vdev));
> >>> +
> >>> +     atomic_inc(&csid->frame_sync_users[sev->id]);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> >>> +{
> >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_s=
ubdev(sev->fh->vdev));
> >>> +
> >>> +     atomic_dec(&csid->frame_sync_users[sev->id]);
> >>> +}
> >>> +
> >>> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =
=3D {
> >>> +     .add =3D csid_frame_sync_add,
> >>> +     .del =3D csid_frame_sync_del,
> >>> +};
> >>> +
> >>> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_=
fh *fh,
> >>> +                             struct v4l2_event_subscription *sub)
> >>> +{
> >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> >>> +
> >>> +     if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> >>> +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> >>> +
> >>> +     if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_=
sync_en)
> >>> +             return -EINVAL;
> >>> +
> >>> +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> >>> +}
> >>> +
> >>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> >>> +{
> >>> +     struct v4l2_event event =3D {
> >>> +             .type =3D V4L2_EVENT_FRAME_SYNC,
> >>> +             .id =3D id,
> >>> +             .u.frame_sync.frame_sequence =3D
> >>> +                     atomic_inc_return(&csid->sof_seq[id]),
> >>> +     };
> >>
> >> On first look this was looking strange because the id is used for the
> >> control id events not for frame sync. But on second thought it may mak=
e
> >> sense, but the question is how the userspace should interpret those id=
s?
> >> As of today userspace does not have any info for the VC and csid inter=
nal
> >> pipelines (so called lines). So with the current state of the code
> >> the id is VC which makes sense becouse the SOF/EOF packets are recieve=
d
> >> based on VC. So i am thinking of two options:
> >>
> >> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-devic=
e
> >>    and will be well known to userspace for which line is reported.
> >>
> >> 2. Add and propose extension of videodev2 documentation that
> >>    id of frame_sync event types represents SOF per virtual channel.
> >>
> >> Personally i votoe for (1) because it will well fit with stream-api
> >> support and usespace will have clear understanding of the SOF to which
> >> stream belongs.
> >>
> >> Given this in mind it will be good to open discussion with Laurent, Sa=
kari
> >> regarding SOF event with stream api and GMSL cameras.
> >
> > I think both approaches can be applied independently, forwarding the
> > event through the VFE as event proxy would likely be a straightforward
> > addition.
>
> Yes i agree as well, but the first need broader audience and agreement wh=
at
> should contain this id.
>
> >
> > Note that the id here represents the interface index. While it
> > currently happens to be associated with a VC, that is not necessarily
> > what we want. Ultimately, multiple interfaces can be configured for
> > the same VC.
>
> Yes and that is changed with stream api implementation, and the
> following question: what should be the ID when streams with same VC
> are routed in more lines (hw pipelines).
> But that depends on what this id should represent.

Yes, then maybe option 1 is the way to go for now.
