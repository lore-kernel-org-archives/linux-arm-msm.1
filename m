Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728752;
	b=zr0/bMe5QQ8znwNtaD42V+vM2L6v4F9NEGT51xsFydF6M+5oJnqz/TT060po7c3Zy18R
	 bZghhJm5oZG/FvkmluiNAQRttyT4l8HxPHd1XPuCW3gLUJxV1eaToQc8eekcj/oPmkIS6
	 yPGSzS90rg4vYNiNVW6W82PXlAKHHWX4x1cuvLEI6Zqum2qqdOQUxHBMof6qDMTwuznJo
	 NyHtV6fXGMnNQA/3M4cDJdXTn+rQJmlbM34pHcRJos9Zfw5HTC4JX8TpjyRC1lmRJsAYH
	 xnL97G+T4UmJegWzpcqQQgxE2azOZaEZ9XMVednJ728c7NBowaQvSP51B3uXVBdvCrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mWiqVESok8K3e9rRJ3g5fJGIMlnrH+fRsBAgdT4QzNQ=;
	b=5ikbFZ/4/8Jfam6SPTBD+RxhN7sehXFfUtjs3QtarQR5YZc6tCIQuJnLDUX3XH54vbUL
	 ZA2Powc8jw0k1CUP9W+j1Qq19A6Wfr7dfXQPnM6GdveH6AjWi/juJDRBFd/ejQstMQzyF
	 ysDJPqXotzbXHx1GbhBq8eoR1N66u5WkcOBpAPr8WJMY+gmqSROCLnozAIbk5sHj5ewfw
	 LG41XOlWcnPsgn2rX0KuqB/RbRz+Vl9lbdQSJZIHRlems9PaOsYHDKlEHbEPgyQAngIOS
	 mgmVXuYoi8jQOQfCp6/FEN7rjCceACEnsRBF0jliRSbuGEtcWKEm7b44HZzDp9ZT1KA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pqj1t6SN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TFpuBiHU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EB0606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 17:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88EB0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pqj1t6SN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TFpuBiHU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HffIs326304
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 17:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mWiqVESok8K3e9rRJ3g5fJGIMlnrH+fRsBAgdT4QzNQ=; b=Pqj1t6SNvt9mXeCb
	hNVopmbn9MiawHBmT2+h8CuwFfJ7Rhzss4hq0VOkFh5Lg+ssvczhD+M5RkNLLvQA
	EsOKJ3GPuAJuqm2uFam95CXwY+RgZ0MYSguXwq5e/xSkKzjJkvZc6YjhAr2jpaSv
	oH0cn1hoi8ikq2/oXwzCgk3lqTWYDTu7LNnDN66Q6yaEytKX1AEv3pLlIR3PJ1we
	w9CYirNzC5faq9nbYB/EJKt7JR+1VhJgC3iCjjs0gFQJVLj6z98EZ0r1zsoBvsz+
	1SNJyZjWM5eLiSh15j2tPTKPp2oaWsbFoRrqvumbfeM7QZQQJret7o11ZceFVj2u
	HLFoDg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pg4g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 17:59:10 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6795a39e53fso1573689d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728750; cv=none;
        d=google.com; s=arc-20260327;
        b=rVw1ljoIwCzlcglS26jDBoGPLs70jzpl8n6cauL8RyXVoWxFFe1fIaZzWT0UeZuXxE
         TEjHfjoiahXCN+0dNZR5yuAaOHOoFT6LwUKun0EWDEBgjpjN+y5+sZQFld5en8l+2pZU
         zvOXpQHz3TPmyeRmRcvduf4Ka4UDreZRKvEpnFYkZ0ZVUYaIcTGOistpAPmc+NOghykF
         jh0N2nuabK8VRgmZVNUsfRI/AQpCDJECPSGNBZcGl1BLO0R1jyc5PsI337T9uAAidcwq
         ++JiXiyTT8Zk+fzH2/dGZTiPqpm+/mxVBZXULN7K8ujICMpOoi66+Xy/dZE4Lwx7gtSv
         FYlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mWiqVESok8K3e9rRJ3g5fJGIMlnrH+fRsBAgdT4QzNQ=;
        fh=LGyrRuF4Z9wPJfyFqDBfmfgp+u/EfB6eFBlvN2TdUIE=;
        b=rqr5boMlHETl854uJUQrNmgix6jKtbA0yR0hLfczOzX4DTKBNo/fJuNq56CZGd6lgB
         eq7+052YEtL1xZFGNzMfLW8kci9CpjpCzI2UIvWZFxdiYOHw5elQ4ApLTMJoFUiA6khX
         vR1UhQ0r9SPU6bi9Fvz9wzcNDTI6XWW2MoW8MDWXJJgUGUs2zQGgBna91U2AoFoocXaO
         bNG6yDqL4/DCiVIH3LkRaVtuoy+8RakHqJBc0z5jHFB+xrr1UT4vgfrKdoSnMQiaC6H2
         pLX/UhIBoTwxw5Ga3o5g7QYJ3BIrwI9pvKkDp+a+AeHT559/ZKmjpnKM3nFHRjxbVclc
         IWFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793728750; x=1794333550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mWiqVESok8K3e9rRJ3g5fJGIMlnrH+fRsBAgdT4QzNQ=;
        b=TFpuBiHUEANusbS91C0W/XRtlMvP+CmdEiXMOarQ0aE818BV09lsoCkOgWuo+BPLYy
         ZR+eBhtEhUOaxrsgA9oD+A5MdUyBXYLE6C0dfl0ISGZ409VYCODu7teujNo5eGrlm6Y5
         fND+yHrwEPxPtn5nat/1OVrCXz3AjEadf4H0j68YQm/wzAFCSOYc1qlBCu0MFBzYRnu/
         CD/1UfELN3MnrO6Vy6oSanjYxBtICxoB2gFcTDgMrBJ6Hp3gIUFNho9ZVvqucVGnAJ1A
         Sm/uQzTaFsIuPuSg/HUxZxwkkl/jCYZ1HjXp2ID/3U7szAi7mdobiDT/rIKp/Md+OqiW
         /5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728750; x=1794333550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWiqVESok8K3e9rRJ3g5fJGIMlnrH+fRsBAgdT4QzNQ=;
        b=Xnbfj92RpSeNfdMeBMfM0JJGQQnbc+6QFGhLyR8qDpJjQ5M1Ex3vkFH81bYyr7gS3x
         slVy1T8NNdxXv65AlEHc2bK/BTe8tK8b5gn7eTzPc1vLX89f0IYVEXSAQ6yXMTKdcPtK
         JPtcaea2xwzRYHsxPefj3a5DbE5Nz1VtEmSdv06C1UPvEkLwxfdIwh6ok5Msk5/2D/lD
         SBIpDvNvmulTXvTqhCq9BOfsUAcBo+Sw0DxLEhsP09RfUNR63dLySzPWuaKrSqKN+ECb
         bJLx+S9cCU9tJIcShR1UcIAzzFiF7oqRlROl0L1MBYvNFgZTAruDZsYvQygdz58kyWlX
         oSmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmlH1DXBQNN5GTMRV3xNnzC8TGE3wPK1M1RwsAL6chdRecLttOTWOk8XMk9LMRNj5NF42muEou7V7ICgA6@vger.kernel.org
X-Gm-Message-State: APuU4Z9itondFUDJk6R1s4hEX9zuaH7McPhva46bm1KhrsIgbvWaY2Iz
	KpGrgU8OfBBlPELGMv8KM9LDBTnaJVTWyiys5JHJRqx0p0i73dDbR73vs/oKO0gsdiargmY82LU
	TNH6280viaVLK+D+UVXZKp3HMXDqM1UhzjQoA4apQgPVjL7/WUiOtW6ii29sVEqebzdmimppIJy
	gsGNb/SGtqJwXkmF+ZCFtx6MStf5xcRJZ8DL/ScC6atDI=
X-Gm-Gg: AYBFou2gWvifZv41pKVvBOOgvuY1DKQv6QbjurFLKn35/JpSLQYIA9q9JGJPq3ioNb+
	ZMwBZWrvluJVhPYdpyeJdzK+ZhaQifMcJB9LCGLNVutYq+W6wrCLDbWwAC4pBw7KI5z6EM7lGrW
	hNIqfW8DhvLR+S2xRJNwWLKZpTSwHfDJ6sztOK1UwEnjo3KwNwrjuhBsJZ2/iVxDZAqVtVIhQgS
	o+PtPNth9bzii2sGdQrinXZ1xajtx+5Szwz2q36
X-Received: by 2002:a05:690e:1381:b0:679:a5fc:2f35 with SMTP id 956f58d0204a3-67a8d3dab47mr11993844d50.19.1793728749818;
        Tue, 03 Nov 2026 09:59:09 -0800 (PST)
X-Received: by 2002:a05:690e:1381:b0:679:a5fc:2f35 with SMTP id
 956f58d0204a3-67a8d3dab47mr11993818d50.19.1793728749355; Tue, 03 Nov 2026
 09:59:09 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260730062219.2836938-1-sammiee5311@gmail.com>
In-Reply-To: <20260730062219.2836938-1-sammiee5311@gmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 18:58:58 +0100
X-Gm-Features: AclHuK_eyUJ4LVzmPr0ntwvbkf_nZEw5d7HFVp4LeIbjHcyHf9f2l13O5bkRG6I
Message-ID: <CAGgiveUc+TkGyGDxuuCLpHO=i22-4fn1CqjqnnmWLdWWYOZfPA@mail.gmail.com>
Subject: Re: [PATCH] tee: qcomtee: user: check the parameter count from the supplicant
To: HyeongJun An <sammiee5311@gmail.com>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MSBTYWx0ZWRfX5i42qLQg/1ve
 sZc9c+EinaUZiSm9qxAMUXAIVX5MVQr9bi2xhu0i+X05vx8b3wjJxoggix9dUmQJ5q8RfBtSjLG
 AXVl335LdCTtFmLi5kqSESvRXUIvrCf7oM+7NAVeyyOmL6pNV1JWVAwl4E2yg1RuOarwqZ6V0IV
 ERc0rJSwr5gpPU11YpRp3X/Dutg3EwnusqZ7UONszv5ZE5SKV/iONOs3s706KIQpEvi30i8p0OR
 y5TSydjROK/p7jojqGBlc3f0Vni9aM+HXa3cRjYZWYSCj7MwXXmP8pPz978jpoZKzaCPD74b9zX
 C+VI8JgszPdbsX9Z+PV07ByVP8+NzyGGemyqLVRFOw0pWcuPmcDRetJJbMucgRxCVPoPiNTZDaC
 UmNlGr9YwBR8CuPnbk/PhwCpGYG1GM5kp+ZEjajqcStfxc/c47pY9OAz7xghRZ48yHttup6eXgm
 CTYshaF8e0Q/v+lCn8A==
X-Proofpoint-GUID: KG07o0aNqFfDBkIBoHpG7yztkQqCLGbS
X-Proofpoint-ORIG-GUID: KG07o0aNqFfDBkIBoHpG7yztkQqCLGbS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MSBTYWx0ZWRfX74LeK9r4WXOX
 g2heBw4GCWZkPN6c8MC0t38hqMDg3hlJK4UPj8CmTZqdRoeQgvvveqg8ajUsqueCyQ15zynadw/
 sp+XPHBcV149Sty1m0kfmd9Mo2+lwdM=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aea20ee cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8 a=YeeCoqeVfiiWHf5BpmsA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030071

Hi,

On Wed, Aug 5, 2026 at 11:23=E2=80=AFAM HyeongJun An <sammiee5311@gmail.com=
> wrote:
>
> The qcomtee_cb_params_to_args() walks the argument array QTEE asked for a=
nd
> indexes the parameter array the supplicant supplied, but it never looks a=
t
> num_params. A supplicant that answers TEE_IOC_SUPPL_SEND with fewer
> parameters than the request needs makes that walk read past the end of th=
e
> allocation.
>
> To fix this, reject a response that is too short, the way ureq_select()
> already does for the receive direction.
>
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---
>  drivers/tee/qcomtee/user_obj.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_ob=
j.c
> index 10452fcc7ccb..2a594ae299da 100644
> --- a/drivers/tee/qcomtee/user_obj.c
> +++ b/drivers/tee/qcomtee/user_obj.c
> @@ -507,6 +507,10 @@ static int qcomtee_cb_params_to_args(struct qcomtee_=
arg *u,
>  {
>         int i;
>
> +       /* Supplicant can not send fewer parameters than requested. */
> +       if (num_params < qcomtee_args_len(u))
> +               return -EINVAL;
> +
>         qcomtee_arg_for_each(i, u) {
>                 switch (u[i].type) {
>                 case QCOMTEE_ARG_TYPE_IB:
> --
> 2.43.0
>

Looks good. Amir, do you agree?

Cheers,
Jens
