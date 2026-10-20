Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792481278;
	b=bUDdvHyo44+9hsO/Q20/0q5Wtw43XhovQNL33k8Zss/hckc4JxKVuRe6BsgYomT6ieXA
	 ZQOeA2lN816gVffyiT0GnWhnqRZmT+Q9OU0vdK+NerhgKWb2h5X3Dsfr+cqonO2W3Xfkp
	 sofAh8/wPEcjCFAr1Ob5xOMKopj2NA+alhgJaBtZQgEugky6NJQ6YyChNwWoxYGeMfMuW
	 MknC9TXYX6InrERS6ZXwQZ5DfoWbNojEPZ36Ac8CemCNoYSgK7XB96l6kcoaEDcC8QGHY
	 018B9eylCxl+yf8lIo3kMAh/OTyF/xD0uNRnR3Ku83skSjY6/6+hD3xy9QktcIwlz2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
	b=uYXD6GAi/o3d6qtiincsX/xk4vHjXb5L7tIjO7ZqXWuLMNdDObz89TRWBB2fAzsXasDe
	 TcuHBO2npufWMZOkbMvBSlV/eAi13PoLDN44OzUoswWwI1aYx10Oq1yAPUZeAfAET0U7v
	 RbuBROLXRE6pL4Pn8vUJIsuSXTLEvI5oGxxelewcqBd3e5HB4i2+3+I176NaTb4v11Gk1
	 +E2jAHw1ZqkKzmNJ8aAmjlAHPmCobIy181ZDv+aOaRCeRX7ACKlkSm1lJKfGyeq55RagW
	 qluPVIbjZfSAxYjV2H7qkQrQZN88EF53cMI1Iyvf+Qmc4bIy9w+aBdr9+iK+Q1Qg8cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGMTvWOl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsUUgMmk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80BD606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B80BD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGMTvWOl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsUUgMmk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tDJw3305464
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=; b=JGMTvWOlYgDWwsR4
	px87J5+exc88G4hmXIZIwtukYLxRO914Z4LsmKcoNegLaS2ElQ/TQ7t8F69p1CSe
	Bm4DAxTy1ck9PbnyM1mSBympoFSqVOkR3XNjstFzb0Jddht29FnN0hdAb4n0dbIy
	NpZTu0uBCXhwG2BXT9a3g8+9m1b7Futb5aSRY8x/W/R+Rb7wBK5HksyotzZBDvU1
	9zj+xbfHza6SMMsKlck/LOuqY2APMA94D3G7jUIMT86nH/LS429AmPyqGd/dIT8j
	ZmssFiysJeDA9oTvkU2c96rKltdnbkwBrh+ar+CgO/70aIW+1vz5XmB3+PlYwlZY
	Al2OVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ssbb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:27:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso341742185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792481276; cv=none;
        d=google.com; s=arc-20260327;
        b=ltQvWb46JpqZRVh8ZCR3NQRSwXA783yn/19f9JLKeMMaWQrNih7ojo7C2NLoi/1V03
         txm7pdfiYMxUqJQAdHEBjVDSj2dOvY359BibaegeMbO9mKXKWGi/CDqlqvXA2f+hxziD
         SsHYbPkh5XzctmonLjyLNuUw3Z4ffId+2XH/ocolqhL7cjiLKzxyvEorB0Wyc40PuR4x
         mKrSrSSIv52z8sCvhBiJdOzvHZVt4hcVI5Mt6QTlFTkr0qlHR1hnKpjCF0rDgkb/yQRc
         3Ze4UuesZJK2L8VZQ2Oe6kiXyG9Qmoh8jfdfZGtEXhfI8kMKrw4dWEKGkKTSViUf+hrM
         pUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
        fh=nkuhwSN7mDq9yHKozelyVxogwgDB+xO60Uk2BWoyLQU=;
        b=Go/mLMcFuDPQzqtOP9dAnmRtCx+I36XXmqC9IqzQPZVJ/7i8gVA5rrMtCzAmZMe915
         rOToJfp5oYKLIPwU14Pnl6C6jaVyGqnOZn0khgDjzhQ02D1oQZicvUHv/7tJoLudg+Bq
         GG9FzYsBTQ9xDktNEROQztZ9JhV91wN8Ke/tHxNum0wzO3rgQHi3ZNwBreYMkd0Eounz
         QEb3OjROevmwawkJW81gLL0VnT3EvkuYQHQoiup0sQNnfC/9ZzLvOmEav7XWhyOKxRIW
         RbMmT1SIx8in3A0GTV2s8VOtTRoH3lIb55ya5QJ4aIEB5VUVRd3l2G8ixzjYcknSn3Wb
         NBFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481276; x=1793086076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
        b=HsUUgMmk0b65hZxUGTsKmWWmrqC2vVSWE6HZ1B9CP5iTl6oH6q/SGCPnhWE0Py3czf
         nnh1Q7Ppqk3mVCFbAXqGUA93GqAucPNjq8BlkUJv6b0CUEhDS3vTD/7Jo96E0FhRE5H3
         nkTDlOw2GQZRVUV9lpXaj0mCYj1kaf1QAT7cJVi8VvgrLWXPhkGmesTWvKWHKLcXFao2
         UciWKhuFo7baRbNavt+bRYBWz5Ek7hrYpIK7Nr43lUbsoO9Eehutw72gmOaMWxbjBrXo
         jD4nL6ALeETVRi93zXkmtTuTDvnoPsTMtXU2YlfGnprkwze0/dEJbtSKVzpHfLUKvyf+
         EeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481276; x=1793086076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
        b=Fxtqv4jj6DhFaq4QdRaTgsDHZ1LzkCdxPuQm6GmUraL41dhxfS2CNnKM14joILrJkp
         gj44xgT0mqZSoAbwpX3BKUqbdDPoq6mv4IQP++U6qjRWJ01J2TLNLxJ//ZAfTkXrSfon
         tcpENjqhuGG8jGrdMjwJwJRqC2KxiIUI90xE3PSL665YFG003QjVfRGXxHP+yDi08Uka
         tWUgR1YnT/Gu4QPAtFFdahl6lH09Pyi0CkjCOjHcdR6E0iIMH9pbq0Xzo/cvNKwDweHK
         hiruvfYvn6qUVP0WltWkFqlbIJ0GAJ9IKIPeeEqqTGSQAqsLkh//e2qrrbfQAijbbjxt
         8wfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzClVSHt+M74y+KLu6NhKjNpKTc98NYYH0mqfAzSWX3t1jCow7MmoIiUvKtI1oyat62pO649HonYz9Pn/U6@vger.kernel.org
X-Gm-Message-State: AFq9FYJUYMTCDMP5IawMJbCtdl6G5ojAgsDchjcrkj0DxS2r1Cb/Yqru
	uttOac6v6chAcUNv4C1kAG2BLyOr9Eh2ZADD1MUf89ddWSu6Bsi7koSHylKXJfGvH6rdoK36+Oq
	6JWqWS/Uub2zTzldj19g8UUXJFd4MIyBCz+lHXgPOr+qsvcUtiJiFY6vv3KCR4ehLwnF9IPovyb
	t1KvJu2iDfXen/1Fne9mrcJ+nmaXDW1jU0xPB6LhoHzAc=
X-Gm-Gg: AYBFou1/LJHW6xg3ULFJYQOOfZcssoe53BVOIHd3uND158uz9y5bIg0JZoaymnLEZLW
	+bULw6HlR7lyNh2GvoUlNkvND6C07V1Adsvne8actB0pzPDi7sKeJjn1j7eo2k6yAxHR+pRQOyj
	mgW5FmnPzdHDDRLn+Cb9Ky3cpkHGfzpPiR7BxOO9o3Vd9gezFkHuoPVuMsulKHXREmgrAszweGf
	N/9ad+OiXol8KLBfvwB0qiyz9BGRp6NLML6vvPJfgSAGRQRcUwoenMpkfeCyrGT1CAAr4HlLw8=
X-Received: by 2002:a05:620a:2990:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-93f29b7fa60mr1609173785a.12.1792481275969;
        Tue, 20 Oct 2026 00:27:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2990:b0:93c:62c4:e2e2 with SMTP id
 af79cd13be357-93f29b7fa60mr1609170585a.12.1792481275371; Tue, 20 Oct 2026
 00:27:55 -0700 (PDT)
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
 <70714501.3175.1a157532149.Coremail.slark_xiao@163.com>
In-Reply-To: <70714501.3175.1a157532149.Coremail.slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:27:43 +0200
X-Gm-Features: AclHuK-6GBMcAS-d0BXDcZveUx2q3Jcid6zCI09TYG0U3nhdIt1a8EQqHNimECY
Message-ID: <CAFEp6-3o6gCb61hCQTJydiH2aD6CBVRa947tpmLe4L9j85Jg5w@mail.gmail.com>
Subject: Re: Re: [PATCH] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX/xuLzSvwJvHU
 jlQ3Dd7lurdg8pu3kOr3J4mC/z59cT7MbKg2MMwXO+0/LHw5tnb6T7Nr2RkEpXegbovkSX4ZROR
 Fqa9GAG/TCpNzrtNAdhQ1avmPE/oN0Fy972CNf1ovRXg+TC9xlAyhBmqOQV/33YLcHsdIaRPLs5
 2lmQ0E64LkHg3gbXCuqt9ukYogUsORKvACWM5gCVGAw4d8XOBgzaiBnkB3fhUa4m+hBU3Omv7Vv
 g0iZIV6GZTc4bYAiMtrskzIT5uFt/QzIyRQcATStrT2YjXMA23xoYIESnF7WtYYX2ZXVYBho4l8
 9NEVah1Vj526AXNrW0z/qxf1OlmDlXcEF8Jblamfd0ZJrVJjhZxu6W80E+oYlj37Is7aNLprqON
 Wf5Z45FFBxP2ef3fDkZbu/b7TMfsrjQOowE2sgJRFB6Z7kQ0gcaTcjjL2REQHC8sDJAk7RnEdl2
 iY1lID2lYcR/OcRXoSA==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad717fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=8Bi4WqdHlDIZjTcgTq8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1hZh13IXrdn1-51B5yIXB105TehDMj0s
X-Proofpoint-ORIG-GUID: 1hZh13IXrdn1-51B5yIXB105TehDMj0s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX3xbudbzNmIy6
 xvkR80bGPNoPgT4ENuvsoI2f5AXWWVjY7NCVjyR2tR+EOTtppbI4WZd2+LfGOGyw+a7e5pBR+gv
 30a+5wxSl0yaoZ+CdVqDQzmHT/55kjk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200029

Hi Slark,

On Tue, Oct 20, 2026 at 5:20=E2=80=AFAM Slark Xiao <slark_xiao@163.com> wro=
te:
>
>
> At 2026-10-19 15:41:27, "Loic Poulain" <loic.poulain@oss.qualcomm.com> wr=
ote:
> >On Mon, Oct 19, 2026 at 7:52=E2=80=AFAM Slark Xiao <slark_xiao@163.com> =
wrote:
> >>
> >> For some MHI devices in some specific scenario, the default value
> >> of autosuspend_delay_ms may not enough to handle last wake event.
> >> This may lead to some unexpected problems.
> >>
> >> Refer to the Qualcomm's Windows settings and we checked this with
> >> Quaclomm over case, Qualcomm recommend us to set this as 5000ms.
> >
> >Qualcomm
> >
> >> Qualcomm also suggests us to update this for all MHI devices.
> >> Since this setting has affected some existed kernel versions, it's
> >> better to be applied to stable version.
> >
> >This looks more like a workaround than a proper fix. It would be
> >helpful to describe the underlying issue, including the timing and
> >sequence of events that make this necessary. In principle, either the
> >device can be suspended at that point or it cannot. Relying on a
> >delayed suspend feels fragile and may end up masking the real problem.
> >
> Hi Loic,
> Honestly, Qualcomm has been analyzing for over 2 months and still hasn't
> identified the root cause.
>
> Actually I have explained the reasons behind the events to Mani in anothe=
r
> thread, you can refer to https://lore.kernel.org/mhi/20260919095506.9570-=
1-slark_xiao@163.com/
>
> From Qualcomm's perspective, 2 seconds is not enough for their default de=
sign.
> They recommended us to update this value to 5 seconds and Mani checked th=
is
> internally as well. So we decided to update this 5 seconds setting to all=
 MHI devices.

Thanks. I'm really surprised we still don't have a more precise
understanding or description of the underlying issue. That said, I
think it's reasonable to proceed with this as an initial workaround.

Could you please send a v2 that introduces a define for the 5000 ms
timeout? It would also be helpful to add a comment explaining that
this value is required to accommodate the 'late wake-event issue'.

Regards,
Loic

>
> Thanks
> >>
> >> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime P=
M")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >>  drivers/bus/mhi/host/pci_generic.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host=
/pci_generic.c
> >> index 7193a384cca4..40735beb46cb 100644
> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> @@ -1483,7 +1483,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, c=
onst struct pci_device_id *id)
> >>
> >>         /* Allow runtime suspend only if both PME from D3Hot and M3 ar=
e supported */
> >>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> >> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> >> +               pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
> >>                 pm_runtime_use_autosuspend(&pdev->dev);
> >>                 pm_runtime_mark_last_busy(&pdev->dev);
> >>                 pm_runtime_put_noidle(&pdev->dev);
> >> --
> >> 2.53.0
> >>
