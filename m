Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550593D9DC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906289; cv=pass; b=HYkdxJBY6XlO4LZH1+0QHjs/VGt6Qdv9afaTIprxcEgO76lN2QMmvNPNeuH9r98O2OJuLzoIeWhq0xcyswqmmll5NWh9/08ANQOlDMAs7kilNbq5PTpcUOiqMvrHu3LjYLAesPF0MKMM9AO8c7Gdrlg7hywKZ2PaU45mQVU0Zm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906289; c=relaxed/simple;
	bh=Ov7oNLMXlrDII+yjoRbu1WpWpBvD+/TAzTcydjCpFgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXEbfYdMJXjJ+FkMHbS/ibqlDcrqCU+i3PnuJZHNrcVelccLRZDRqpXCXWbMKHmFWFRV59ApL3F5NoRvo1cF9IQmaK3TpV0IZ+Sm3xYen2yND1amXozOVOXAQ8N9qZ58wO7t0x9VlXwxCzcbdqGilVoJDdghcrSn7lCvFiIb4v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fL9UtJfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiiWbcOP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fL9UtJfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiiWbcOP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66xcx2515412
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=; b=fL9UtJfQBopg+Dyf
	KjIYOkoCrV/CAztJwATKLOt8FKtaJ7OTm93FRB3aZlVth5qyY6FIXSIY8JmjQ/eG
	SVee5/Pawj6P5JoW4//IIEFaM8JMWoZnJiGH5KYqD+mhZBl21DGfpm7nykBSKuuT
	kGdDl5iAZ2UjnkzgVgURpSvsjBfsTEPDoQh7zgbcjVifKdwd6wcSt/KSJ43tkotY
	503Cc0f/AwnCNdLDIpjz3TqRDGZYaqyslyoZjMn5xPJpkhbLCiOndwzMQirsntZU
	l5ubctFuzWSr9Nkoggez7n6sLy3cyO7+J+2gexOWX9sHmswI0ad8C4kmMzOdn8vj
	Thhopw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n0q9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 08:38:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so103337985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 01:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787906286; cv=none;
        d=google.com; s=arc-20260327;
        b=OHUjLvNdD9bKgTtQXlxqtm+RFOTvcsKJuDMOeZnc7nKTeXJTorKM1okqOgXqkS8QUL
         gX2EEHSvFVt1/ilGwmlYEI2yk7gE0DXgnwvJURAZa1ETLlDqn6oHjPZKV9nn5S2/88Q0
         G4N7oeAk/9SmxjUHqBlv+DrcGfT0sn/KnydutTOMsOh8tjn0JaYVVmH+T8XZiI1/97/j
         LSio2Nask/MX47F4vfQkymUDptnew2WoDVHPySmfh5MuaqARDLcCEyAmRhpDF1Z45cAF
         srSPC0TtpXRbsM894lMTvZrGy0q2VpQsNA4OHke+klOK01uCX2Qy54ppJxrzEIae11RY
         LO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=;
        fh=R1IlvwPddEbgVBqMxIjLLYDd8cfsFZqXmDtHxKD72rY=;
        b=CS7pVNT0hsZ1mD0hoYn9Igre/nSTUqU1SA2YhpcvP9LIY/1e27kgUoHIJzm4frt93s
         AlYh2e6hU3b2sgXHTMHK3ouYLfUIzo0EIbojyiLFLFqoWz0sHx7qmBTvx2Mia9lelITQ
         KZAkriCHb8hTctJcVvwWk/ubvZNuiNWoZ123zVOvcUbzJpxqstNY36kRtsRQBj3GdcUv
         tWk3c70+Zm6XIxV8mcCRTEDPjqstBvYlfCzAJac70AyOHXazxBhWWeUhg2JvAzGb0OrF
         WSFtHWLxiHOI2TMh1WBrAjr8177WdThwd9TH0ZraF951dxq9DuySS9Tex6W8IZGX8GF2
         nkNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787906286; x=1788511086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=;
        b=EiiWbcOPXb+a2xQOewQEL0xw22PGH3OB8o9n2cVW1lmrJ7aLOQYeY32M0z8WxLXus5
         Je9IqCmhv7avaQt0ZW9BMPPavt7JYg7vtas7wgT4l0xJ921YPQkESHeioTXEREvBMqMR
         wvkCFRvCX41pMTTpjJVrDmmi4jKMh0wEiCD7KrHaD5c1dbJA++JmbktGQe5B9HtS9oiN
         PgLrxwI5X/fa4x77Cyc5Gyc7jYFtURrVxI+Or/3QoUYJ48TQxQSKSkX+x329tX+7FREn
         odiQ6gn0VL/2yaXEd5KjI7nA4jMLde5UcIM6A/fBcJ7CtO/11BTS5S+kEDSoxCgjlOQi
         7QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906286; x=1788511086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QaKy5r5sUgNHinEqWyUrjHzH93zojyTrqfcdfZ0ImOs=;
        b=i4f+SA+4o2JpgXkQVeZ63Ksvg9IJqIRoMuoNKteISgOOlp9muLvr83LH32WvfU2P0w
         0SzuZ/rg9m0Qmr55pv7ENXNShfCMDJZXVFhy8t7ZP73jmpNsx7t9P2AJkT0PhTMc+4DO
         +EgaF/JkV9i7Je2idE0fEN+EMQRWMft5vGiFMTEYPv3gdcpB6uce+ATbqweOSD5mk/3O
         R5K3MlBbgSGdjSLkXPnPQ4pGlSvMJwxlKecBxBOtvo78PRrkqCAwJu/mXIECPdN1sOnO
         YnmXTsfpAuNLZ4QGjOQhqT5E/nYJQKhpPsidOnFlfjzTGrBd8DO1TcPp4Xou8gxkW2NA
         Xr5A==
X-Forwarded-Encrypted: i=1; AHgh+Rpn7P6Ou+IKQ+77Hl3af20/8tDpS/7z+3fot1HLIzqy52alpPxPanmByRFVhe3cKzzSjYd4CwTKqeUQSXTb@vger.kernel.org
X-Gm-Message-State: AFuF++nqC1kk1uQxFbm66sahPgaGs860R7koMb1aImY+6/NHEGK17ux6
	ttVWrp5ZBNcKQuXgDlvHMVfnXuPkE177SKCwpwSkcte17WMs764iNPuQyjYE9yvugBa2jZaa8Se
	cKJjAG+UwVj4nZLStGWY1V8DAIxLDCdrX7h5/XXqunkiLNU3EFlHDj2hLvoxrmmSrOVr4XIpvRH
	/Za3Pw8RaxSqquKnEBV0s3UM7CbXX+NWWAkvd0Inrgo1I=
X-Gm-Gg: AR+sD115+en//n2JZh9tavt9eVaeUhq/RbZEL22EZu5UUm4BVhgd1R+bwqAj+wi+iV7
	wK50+HJv7CG2q9QZVfZ5zqF7fvPQLiBkP09EkKSaF1t7kwRWExjolPWpfolO/Ox9rSrDLkrVIOq
	gMzAx7lEHhYY9/6xuk/w9iylVXXF416v3YJ0X0cF1lz7m0ZnX0eiTRH842+ZObi0SajqO+M3R1Q
	hJDA/bbHWasJWDvGybRKhhgxM0VSczJJ1HqOPYOikeatfdeIiVIjeFAJQNpKa+dNhJxwgZ7oEjy
X-Received: by 2002:a05:620a:aa1a:b0:937:17f9:da2 with SMTP id af79cd13be357-9390016b299mr1349501885a.6.1787906286362;
        Fri, 28 Aug 2026 01:38:06 -0700 (PDT)
X-Received: by 2002:a05:620a:aa1a:b0:937:17f9:da2 with SMTP id
 af79cd13be357-9390016b299mr1349499285a.6.1787906285947; Fri, 28 Aug 2026
 01:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
In-Reply-To: <20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 10:37:54 +0200
X-Gm-Features: AcwNN1Xrc4yuLFTSexVNFwDPpWatuABG_1Mx8-1NlWVrfGRZ6KtGSzjHOyIqCdY
Message-ID: <CAFEp6-3O_L0dSqGWxg0TKOBTWMeAm8epikTzRBWa0DyJcQ3MLw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: agatti: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a9148ee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6amzoLWt3lXFUk3ngxoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: rPxOYbNCCV1g7vKikmBREw4WbOA2KYgN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3MyBTYWx0ZWRfXyx0JAevdY5Oq
 fiSE21P5EMafcE1Xyxo/Sz/BhiXGczNKyl/IREHHOS0RaHegU44He0hLeJRcJgRY2q7iNdKFpF5
 5kqXslPuWgg+EWLsTt3C2jqGai4+Zj4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3MyBTYWx0ZWRfX/sL7yxh0Y+AT
 pkQ0fuGQ+HvdLMSJPCNeurHx2Wjwtp2j3iYv3Tf0cMX4wZ2osElOcnkHtS+C499pwNsDLnIcfi+
 k0xBSVGOUStVjdbKfVamDvk6YghPh0nJE4esinHutSq2KUdvDLjAbQCVg1Rr4Gcv9DEqOdL0y8O
 WIefhh62n/7lGWgKbN1b6LlSSjfuRguVP+7Laut4UTZlTXDxbS7ILyQUxCldOHrod27aUPzUiqH
 8HD6Gh6cJmcbA00DFWmaO6NDC46Ov5ImNPJ/93EYKBe4zObL82Nm+HSaP+89mGp9GXGNF/yAv8T
 XeytrJsLC+3NHDDNVvgv35aO3nHmf74s1XWknFSgwlpNWjYuYDBQK69OzA7bTVcLxFGXnjcBYhe
 WWH4YUXb9/Qbj5NDkj3Oboit0Mg03QQAH7QFtG02H8hjtf8FaUVp9TMjsF9Q60cVx25+7jyuDR/
 jnwCD1miJcMP7SiS7Iw==
X-Proofpoint-GUID: rPxOYbNCCV1g7vKikmBREw4WbOA2KYgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280073

Hi Vinayak,

On Thu, Aug 20, 2026 at 7:52=E2=80=AFAM Vinayak Katoch
<vinayak.katoch@oss.qualcomm.com> wrote:
>
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.

My understanding is that this patch fixes an unexpected reboot during
the launch of the audiodp service? If so, should we add a Fixes: tag
to make it eligible for stable?

>
> Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Changes in v3:
> - Changed alloc-ranges to <0x0 0x0 0x1 0x0> to cover the full 32-bit addr=
ess space.
> - Collected Reviewed-by/Tested-by tags.
> - Link to v2: https://lore.kernel.org/r/20260807-agatti-audio-v2-1-3959b1=
ab8059@oss.qualcomm.com
>
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766=
cc9ccb@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85..d010ef7fdf8c 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
>                         qcom,client-id =3D <1>;
>                         qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMI=
D_NAV>;
>                 };
> +
> +               adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +                       compatible =3D "shared-dma-pool";
> +                       alloc-ranges =3D <0x0 0x0 0x1 0x0>;
> +                       reusable;
> +                       alignment =3D <0x0 0x400000>;
> +                       size =3D <0x0 0x800000>;
> +               };
>         };
>
>         smp2p-adsp {
> @@ -2348,6 +2356,9 @@ fastrpc {
>                                         compatible =3D "qcom,fastrpc";
>                                         qcom,glink-channels =3D "fastrpcg=
link-apps-dsp";
>                                         label =3D "adsp";
> +                                       memory-region =3D <&adsp_rpc_remo=
te_heap_mem>;
> +                                       qcom,vmids =3D <QCOM_SCM_VMID_LPA=
SS
> +                                                     QCOM_SCM_VMID_ADSP_=
HEAP>;
>
>                                         qcom,non-secure-domain;
>
>
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-agatti-audio-357bcd74ae9c
>
> Best regards,
> --
> Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>
>
