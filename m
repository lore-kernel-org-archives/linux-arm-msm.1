Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486158;
	b=qOvBRAaxuzFSwwwuk+zkE934dUUWpYCx8ui+h1PrlOusxQzYfJdkeI9ZnuqntTEyhr+u
	 beXgC1cS5J4Z97Eh4jfr9ckMLcBk0LEfhMoAF6rlJ6+etVO9+z6dFhP4C702HBNpWJgXc
	 BWvlTYKD5RJDVTONdlVcqgZUwS+XVgv3pwdF4ApZTzR01WM4cE0gVaCHXhk9GfctO/pj1
	 bVDpUApic35M7UR7UzP793ZKioAUh0dR3qGZxq6KOXAntwrbVY8xPfxCtp/H92Q7sgrDT
	 LH5wfEQB6ZrFjd76VPccq9YLIyeFmggKFuUDhBzF20NzNC7wIV1R1u1+LtgCvUUYVOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0/bwyW8UsnwQhwKI8DmK2AwaAcEZQ5pGOOAly+nFvG0=;
	b=Q/IZhhYR/U0wWNlVJXNOf4TLhDHJSBQPCodawh0YhrZBploOtFKlhMagPRvNh74Ql4/+
	 Oa5i7d3b/eok2XvA9XreGo1DGf17gfhSd9vuFfvPkUSmDUgt8KaZ02zEjj+WcIrcIsbFX
	 BT/VzIzqLo7/GhW/GK+ZpVK6NW/aSMKAp85OgYwPvXOUxMYYsK1ALp6aPVh1znyfC8ZpB
	 N8k6qewg39L3kyXWR4OaYwdtIUrokNtF3n3GksF917PWVDRAytSxFBWlGenP/NOBdmAJo
	 9747MfU4okFORzH0qsU8O6/jC0uCl6rNlEOO6Axy1h96jtG/mKb4Tx3lPGLVGo0jDcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GGApLlW0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCBr6I5H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0142560A2603
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0142560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GGApLlW0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCBr6I5H
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K83rL3185780
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0/bwyW8UsnwQhwKI8DmK2Awa
	AcEZQ5pGOOAly+nFvG0=; b=GGApLlW0BJVZ/RIvl5xIBB5hxywoiAKZgzOiFuLe
	11FLS0Z7tSAl2YgW8XgxLNpU279wunc6zotOOJqeUP07RhR/Hxpjr5P8CjFSLjxc
	pBGamxuNp/sCWgzJqSZBK3pRHCK/J4S/Un39tiiWb7jmIaeKakjJYmjMpPdQCBus
	A5nFCe4Xq/D1LmH2U/cdX9TelQiODCFeXLAx35U0wtmfTIRs5OmpVcYFmQORliOD
	Pxh55DyXxkP2DFPe/GLIAFH1d2qxt9elA5ME1RJ0LOfzzBTH2U6Jm1hv4hYdMqFO
	PR3Ee7f76k5kohnE1ElBk3X+dLPOOznZLjRch4bLn3I2+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nspwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:49:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso111736785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486156; x=1793090956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/bwyW8UsnwQhwKI8DmK2AwaAcEZQ5pGOOAly+nFvG0=;
        b=FCBr6I5Hr2wVo0qEh9Nr8JXlgXcpZ/shsEtkiOmr5tdXwdlSreHRSkv7Ytb7vMHRdI
         E81TgSUp49+m72MExovarVPK3scIHiFTUt7LnckMn6tCSB2yv+u+nCvyLiZuGSNPfm4v
         FagxwryzoP41Up/4XkqMmBhhdxMt/GwZCfipwtlk+z12yHk4Sesf1bkgy8ZmqLdZ2c5s
         jdE4mT+fIWwkRx4VBaPbwBMId5Oy1ZbtTU+t2L4bIxsf+0SPc+DR53f4I6o1vv0DHMm7
         0Tq8+RLetsbtXj88fcmB0zw/DtzmGe2j9Y7zTLc6A4jyJbx9LsAe15A/V1rT06QopF4C
         rzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486156; x=1793090956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/bwyW8UsnwQhwKI8DmK2AwaAcEZQ5pGOOAly+nFvG0=;
        b=oMB48L51/zaeV3rCntpMrQQEJ0wQfXj/ccXnt2mHjxdSlelstfw0R+toMZTmAoM3s0
         sHmPgSS8eMEE9e6wgv4OLjqoV+Cz2hxnA4fvA9deY7WVFS3SZjc6WwMZFb+N3IgX8FkA
         hgD0lyy+HeUrzV1rzPoIMMok1rrB1gJWyYwEYF0PGYStHFwhW50Q59Lc5dCIlbt0/Gw7
         zRaEhelRo8JAau7AKQe7JF5Hri/iF0oWoxvLMKpQk2k9XGgrk1x6iNNtdLvv6Q+oDJNS
         H6yC+rqHZ09T7kZ1mUsVvAPvXg3QQwKw1QYav9cpO3mWCFK4G803Asq5gVECjUUOFaRa
         HDVg==
X-Forwarded-Encrypted: i=1; AKwUvBySDmaRaCtN2r4NOpilWfdwWKZRRMhwIm13qUp8+ONqszGr23MXHrp5RgF7cefx8PQgZJEt0EVVcVqtp8Cj@vger.kernel.org
X-Gm-Message-State: AFq9FYLKaUXqWMKv0sM7ChQcqL72ePP7Cw66vxO2t6Nnsj3QSTuT8Xb/
	k8c09uyXP7tAwZknJCP0oHkaJncMf86Sbe/hg3/2c42QYk5xKJd0FQvS33r0Dd2TBGtqF3xIrK/
	U1Doxh71lfZwjvT2XzVfuHfdsaXqeZn2gIB2ZK6Wt3XSXn2GoLFLNYkBIbFNxhQlUQGlmDz+pFR
	j1
X-Gm-Gg: AYBFou1Fv48IbnfOz9YL8mnA7ZZCOLxLOIkqJ0QJ4PVYOocJqX/eD3hZrhINWbdcPLI
	iSJhHBRcLlHQQeGvjPGucLsbnYK+HpHnxld6a8Dy9X3qOaRECgG/7388tLVQQY89Y/Fw0LhjOrB
	tu2rO4MEc9v6ah3saNqeWJfswIsxyuDTBarFWa+V7IUD0UwY4Tyq4NfqPgzyx5cvgDQTxnNP24D
	Jkwk0VsR+gfJkXPxKXE8ArypMdso86GK9neiEEjzAWhqzAzOVNoAz5vlUKBgAGRTC4n8qqgxo6I
	m4Dlr06Wf0vUJYSbz6nZuVG/L0K4DJMCPDmP6MsPnpjDA3qb0WzPZAHnnQgLnN/DjR+KOKBk1hK
	TPgzyYObvFn0WFm8mOCUYWTvmTSuUng7fZYCEklfucnH5/qbtJ8Jtq/TiJMUO9Jeba9A6HOl1Nv
	Po214gVM0xGecs
X-Received: by 2002:a05:620a:3720:b0:93e:6481:c8e0 with SMTP id af79cd13be357-93f4c1c4284mr210097685a.10.1792486154608;
        Tue, 20 Oct 2026 01:49:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93e:6481:c8e0 with SMTP id af79cd13be357-93f4c1c4284mr210095585a.10.1792486154122;
        Tue, 20 Oct 2026 01:49:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm23596581fa.25.2026.10.20.01.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:49:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:49:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <ec2vb232k5u6w4pqoiqc5lhq2zj3xuf6yaifpiyzjjgaffpcih@ulainigpj4l6>
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
X-Proofpoint-GUID: Qx0ErJjua4qYOQ1Qr-2Te6EJdU8tzvyo
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad72b0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=aMj0She71zyoh_EkCE4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Qx0ErJjua4qYOQ1Qr-2Te6EJdU8tzvyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfXwvmDsC/vOiMN
 TkbA084SYAVWJsZe5qLto95i0BfKdDkFd7R5bblRNOnZuMydw/4dzlbe3JTroDa9SWupEzCeco6
 FuzKIcidweOko/r+SFKCmFjSvp0zzZyCNH0RLuauMsJxQavmcbmXQpahOqo6EY234OB73A4DywG
 BXOXdvtfx+FTmWoDH9+7JGhO12gNfqVv4IBxgokpZbwYpRWX+EiyJYgPiuifGqCJoR8jGWKeadH
 6YUrK8lIfPsO+L5G1FLj/bK7Lls5mNJM/DF6cgWCJ/gumnKIjatrunHHmvUH05e4vpi9MmqURm9
 lqGsojWMABN7EPOuKInAXbIXKIa/9RTHGpGuVDxWcdxkjZIo0xqLc34ioZire/M5RxIkK3s8QXH
 IrFk5BKURr8mQHX22EAeNhr6ak0n/goA0GpNB2ezOckzfEfNMFkV95gT/t7NpCN8KSh5axExD38
 Tt2eNmp53XMVTqdZS2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfXxvqZ2HS/P/5L
 9z2U2bZT7N+9DsTdi0yIjumAkwGBieDuyYepGcgiXlgXafhF6kd5vi6yc/qWGVDxcXBBWN1YrsS
 AcXH1+sG6iKBQtA3sq1fOVllSax/ibM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

On Fri, Oct 16, 2026 at 02:17:10PM +0300, Abel Vesa wrote:
> Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> the ADSP remote heap memory region needed by the Audio PD.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v3:
> - Rebase onto next-20261015.
> - Add the ADSP remote heap memory region (no-map) and VMIDs.
> - Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com
> 
> Changes in v2:
> - Rebase onto next-20260915.
> - Drop the CDSP glink-edge description, as it was merged with the
>   CDSP remoteproc support.
> - Use the documented 0x1063-0x1066 secondary ADSP SID values.
> - Drop the undocumented tertiary ADSP CB7 stream (0x1087).

Hmm, you still have this in place.

> - Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
> 
> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +
> +						iommus = <&apps_smmu 0x1007 0x40>,
> +							 <&apps_smmu 0x1067 0x0>;
> +						dma-coherent;
> +					};
> +				};
> +
>  				gpr {
>  					compatible = "qcom,gpr";
>  					qcom,glink-channels = "adsp_apps";

-- 
With best wishes
Dmitry
