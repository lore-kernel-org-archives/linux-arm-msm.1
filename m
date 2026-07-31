Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9710B3DAAA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487173; cv=pass; b=Y4Nh8BEzSM+prS2tM5GXOp2k85VQbp96U4TASOBAVnTkKol8RtS1uAAecJbZlK0RUQeYKPhvYE9LX/HGuWxBfALq0f+Batgfm13EP/Qq+wk80DafW6J6trvrz6yz6ifHzwkiKLFzsZ6feAgVmjxkPVjXmLiHTowSkwcDO/mkOtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487173; c=relaxed/simple;
	bh=0nzV3Au5hKldE1LyXy81nTzzO98zLS+bllEvCWCXyh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyeAcng0pYPHjRMh9LFqOmf537pBfD6G2VDr4Tch1ANs6FxgT/n+qfFtpoFaQcCcu5Q0EhXfbPJ80oOorIWM2nHhH29xB+w0q0aWfucB87R/U8YXNeVJqUz9VlJ4zKguQJEbgR5zX9BKfGkEeyWztbdmyTEH+m4ut4qqbQqiAN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0426o5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zm+5p/AY; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0426o5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zm+5p/AY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8QYj53474017
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=; b=Y0426o5DtAmpV+CI
	pa9mC3woijvQAOSlCbxssCTGjzH/9SyPVjH1jOdc4ONy7HX2LtjtlCQZV+pBSORq
	BMyq/waKEb9hCO9u1nC+yzqk5caF6dVBfg39rEORc4E3d2GR1iJnWThRE1Ynue09
	5ebW5LPfCkp+baXesyO7CTvBAVuI4r+HRlj7S+l8tX42yRy3/qGBaS4hm4xnJapX
	zj+ZUOXWxFNFl6VWRYa89+uKWtPxfiYch5T65AY3hoQSRou9jxqZBw2oLajdiXPX
	nSwn4106VfDFAUzryNFM3GOgDiJR12oimHPrSoryWJ3NgQCOkmKERuam0pOUatkh
	GEvotA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frr6m01kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:39:27 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6fce9ed7so16881717b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785487167; cv=none;
        d=google.com; s=arc-20260327;
        b=GPlqAanhmHCHcy3jILwLELp/WIEblyXHdwkb/d2iYjq9JanI/TSPG2+a1EnQ2VY587
         8HEbYYTCEgoB+chzdQB9SFz8dNIu9NNkg+wRP6/iZ3PR0pmwWlOvjAEd/kbzMv3OiN92
         7veg9sdaQ0WTrEICA3tGHBILQLJyXq1uAXGodNXuF99YkztT4d6obGIUSRKEJ2PwUz7N
         98ZegaXu7+xS6PjvKox5HC/BmyJgVGllHhb66d8mwT7sV/3lCJ73iFKUeOx8+bEmLpQ6
         PtUg2QDgwHkzog4TLZ5RIkNUBcCFLbUQmmQtt7mh01vl+7uw3Gjx3EIRPNfFXDK9E9qp
         AHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        fh=rOFFQUrkizKj/MVfsX8KCmpI+DuOgYKnyKZOi+1Ka4w=;
        b=Q9QCMvmqzYGb0EdrIjtzRUsmfTEu9R1NyEgJEBwNxvlO1fmkBJ2bKY1IqYukJARvQj
         nQ0N+pOi6B/6hwpVMKuw+FO7HNdpNE84RwgW/rey7foVNbs3P4WelbgmHjDJbvQULauw
         p3b/3zhKt2+HpavJLDS84z54kvU/svei3yXMy8fku5vO0bc6PUk9SSYdxVp9tPCiMFXL
         SIbZinlAWbQDFwv40RpidrQZgJTY96qepsN2COait1zcGsYhy5eCwnoZVK+ibjwl1XsA
         tmDDB+moPkjQmKrS53dzKZ5tavTHAWcFfdTasw9cTzI3VfAK2L/ES/pK509FIJzPSS1R
         aBmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487167; x=1786091967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        b=Zm+5p/AY5vlVLVCNQAxGyRVCMoZhwl5WGrfKcHgMxSVizAIeQvdTw0SdY+sT1BX3DW
         TtiVSC65bwNbUOhY5pFU5acHiH59SZFjnktppBihXP4ok4vH2zcguIJQmqhZO13zgCRl
         aiAhh/E+Y728/pwAQRloKZKtb44xH7CUw069iNQqGBGtNCK125F6NbVMseKDorteVwd2
         WpVm7AyhHP29gyLvmbx8rvMuoZlGr4tw56jqW4zLE08uj13f7n5nC16DXZxYhf7AKHd5
         6SKpueDWvgKzRfP3tAx71AAGS3MqRDOCdXNGapwmIHBKcy8iTifzefRwC4wK9KSZHYoN
         HigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487167; x=1786091967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        b=Ui6CwgPXqW6H8Uy7I4BophPHbB+frr7Iex5uf7xhjkvqjiqmfhBDYFl8iSOL7xzIIt
         q6QWRi7FimWKCKGOXSF7JvTJF5z741SR8g+j7Ws+ZzTpyjUcTU8eCEEzGkXI7bWY6B72
         eFemUn5bhtwWJK7kiyN6RUFwH6gGPH1WflmfSD7lUbkB9HrtMHIneg4mrRbO8DFtDAbj
         RqYXzHMNFjGNZUsSPjrZHMCPB+LjDUojyRXIVsuxr9g27fMr6kHQqEi8ZxPG4sJKSACX
         iD2Sd6/7t5L1yUa16WJLNIpo7X4VTqthAJj9zeW2Xb0ub9lzFgM2jKb3GW9nO/1J0aiG
         jLBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMb/GIu3LP2nPAf1k0lWCR2r/FB+RdpOjR055l+EKX0nhlmM/wMM7ArQcNOZyC17ARoWktGqHi41K1eurZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6iVH5nuvvEkeiyFu58w5SbhscXqAX3nDz2jLMjKtAaMTHDWy+
	Pjup3mbSCTSZLDg5yzpMVe00S85Df7h6WHpTvLrF/47TW/+mQJZoAoS1J+SzPLguAUu+J4EgP7g
	dJG6LRmHhYMKZWXEADxZycv/r2pdG8oPO5twF5O8LFxyPk/cWtEXD2ZPa+McDocuHwYfX4QImXv
	FM6OPMg692YEp1MzFCIQfqPHN89fPaJXMFTxYe2rRd5ik=
X-Gm-Gg: AR+sD11fSKQI5HQEuSjqKdhaRP3FaPb++C0jOjL9Is8aNncC20+RSAVPphQZPJFEqNF
	rkVUboAyHtmaNPpvgnSpq2X1L5QSIjLhhDdg8/kz9krjLgxgygchAzf87GNH+rGWLctxVXTUPHB
	HkufvhAWBXjKyZ/VCp+DXI9T5dpzCu5GYhItmrkn5BFXCPN9eq8wsPzM8P
X-Received: by 2002:a05:690c:7305:b0:81f:650c:98ce with SMTP id 00721157ae682-81fcba86c09mr6967487b3.31.1785487167410;
        Fri, 31 Jul 2026 01:39:27 -0700 (PDT)
X-Received: by 2002:a05:690c:7305:b0:81f:650c:98ce with SMTP id
 00721157ae682-81fcba86c09mr6967197b3.31.1785487167009; Fri, 31 Jul 2026
 01:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-10-sumit.garg@kernel.org> <alJpc3nFX9D7_8i1@baldur> <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
In-Reply-To: <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:09:16 +0530
X-Gm-Features: AUfX_myayjkpJROHbmEgd6_YM-8VOlEVu55qy_zXpmBuYnmJ9VMnESXGGquBttM
Message-ID: <CAGptzHORxaftDtf9K5pCLORK0kpdfP4RGRSE9iNkm0Bf+ZqmGA@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] media: qcom: Switch to generic PAS TZ APIs
To: bod@kernel.org, mchehab@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: AeAKx8garf29OcdjmgNkn19srHi-B0ps
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MiBTYWx0ZWRfX9j8Jjt0iGqp5
 B3bxKtcMqc9kKPHq9s8Z+vzLEmKZdWL9lPExIPJty2MNjRf5sO4FxA8musibE1H1cEPp8zq0mYL
 uQaHIODBjClAK2QH5YbIScGuoTcBUXpW+mDG4OUw+Hae4M51P5qstOcdqO3+ZgiUiBGYxC38l+r
 98dY2DmXFuTSf3XqubBYKbDotqSyL5xdLGd51ADmR16RXChi1JgUcZGXIK4IHdmqx1WI4nO7EUA
 QWaAQwWLAl8d0KKa/Xu7jTH2SYw7r49Sty7PqaDF2lK8UDp511LbEDLFYrFXxHGO+qrjDp52yMz
 eeRoUmpsOc8vzEbaxieQVDlPU87CI2WzVEpBtwcOe5nE7phtbhjBVqQyCp0ojDeBRM+ZjlWRqir
 piEFGAEBxzoAJYmmgUQwx/750KK5aebY3qP1y/lLJKnw/kFqGILpf0/2+NItaCA/tJWVnPZ3p0U
 SWwQSqR2YzemPCjZ7tg==
X-Authority-Analysis: v=2.4 cv=CqqPtH4D c=1 sm=1 tr=0 ts=6a6c5f3f cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SwCItUvQPH3YegUC7JoA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MiBTYWx0ZWRfX3tKinwaAPaiY
 Pc613kUVvkcriu2O+7gzrvneM9ckTFKuDSR2ZS6phcbJRaKKVegu7bbbFL1q0TR15dVLEdGKuaf
 WBSZOrzbshtq3EgdF3a4ow+Bcu0Pm+A=
X-Proofpoint-ORIG-GUID: AeAKx8garf29OcdjmgNkn19srHi-B0ps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310062

On Tue, Jul 21, 2026 at 3:53=E2=80=AFPM Sumit Garg <sumit.garg@oss.qualcomm=
.com> wrote:
>
> Hi Bryan, Mauro,
>
> On Sat, Jul 11, 2026 at 9:36=E2=80=AFPM Bjorn Andersson <andersson@kernel=
.org> wrote:
> >
> > On Thu, Jul 02, 2026 at 05:28:25PM +0530, Sumit Garg wrote:
> > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > >
> > > Switch qcom media client drivers over to generic PAS TZ APIs. Generic=
 PAS
> > > TZ service allows to support multiple TZ implementation backends like=
 QTEE
> > > based SCM PAS service, OP-TEE based PAS service and any further futur=
e TZ
> > > backend service.
> > >
> >
> > Please find an immutable branch with the dependencies for this patch at=
:
> >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 202607=
02115835.167602-2-sumit.garg@kernel.org
> >
> > Alternatively, if you think there will be no conflicting patches in the
> > time leading up to next merge window provide an Ack and I can pick this
> > through the qcom tree.
>
> Just a gentle reminder for this patch to be picked up as only the Qcom
> media client is left in the next branch for migration to the generic
> PAS layer.
>
> If there aren't any conflicts then please allow Bjorn to pick this
> patch since the cleanup patch dropping the old SCM APIs is blocked on
> this.
>

Gentle reminder again for ack on this patch. We don't want to keep the
legacy SCM APIs just for the media subsystem in v7.3 release.

Can we consider it as a silent ack for Bjorn to pick this patch? This
patch doesn't make any functional changes but it's just about renaming
APIs.

-Sumit

>
> >
> > Thanks,
> > Bjorn
> >
> > > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > ---
