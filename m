Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792697743;
	b=qucqy7lfxJI1/kyh2WVQAYNqcQxfZBk0k0hRzT/l4pCi4glw0ANpmotCySJKmZaumbXY
	 cZMwt83GlEIE5JQRkbd2cKPJtqNWH0uHBMsJw01+S/4Em5jFe6pcx9qV0tFljxWs9L8ej
	 y7oGcOlOBzLm6678BzzYnJrjpPnX3rNVKLeNpeBdjmXOFB/nBVgdC1IN9xZp7lMlFX14C
	 Xrd6y6zLojesshuFk/QG2A/pUkBfjTLq2j91xlgS8jO0tSg0pVk2fVsxdUzSWzxslb2a0
	 Q4qnvkeTa1XdVPfKO7PiPhc0lphLLsqjEkh/+oKSqWHptziwyaHFx+iZaF9G/uQTlsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3SwfJRNDSzVGJ7LqS7tKEPXSzOdbiOhYhtULwpRYw6E=;
	b=v28WvYGy/n2yTYJwGQnXvtGix5F/B46l0TNG6eNSPTnSO1BkYeiMKgBjWxLCA091PmbZ
	 aXX88bniunsZjoPsTW+OwX6U0K9ovzNnb2O+wujDHK1gc1Rw2wjBVZhH4BAcIlIszRmIH
	 roInnfHb6ODooLpknArtqHA8DPyxaNYlq8BypBCYfbN9IDiaU/fs28fCEr86tcm7Rz7MM
	 QSbsrPYsZhDc3IQPc1qXn2Me4MUGh+vvnCPSbewg7PtuTiWyH4vFVrGGOp9aPgMj9Rj1e
	 /g1b6QIB3l9Kl1Pn2jmFTA8SrhVPrAw8ecWnsoru8hwsoy5MrPNFfDYhDgWpEFaVCxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJj+keHN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gesej0k8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED83606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED83606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJj+keHN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gesej0k8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MIHOVu4086860
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=3SwfJRNDSzVGJ7LqS7tKEPXSzOdbiOhYhtULwpRYw6E=; b=mJ
	j+keHNSH+HrHtN+S66aCnd6SQzwd3tiX/VF5obf+fngzx/S+z7OA8AXuiilvwpNG
	DlJ9STTNLb7RYMnqMyTqdaJxMHURtiYZBb1ZYF0jm6/zGNM1kFrlK0MJyiQspGlP
	qf7yy7K6NAc4sursKCyLXsXCm4W1pFsCOHBv88pAIfLedsZKp0SqsJu7kMhb4+JA
	cRN1V3kDfHthFho+/6LFKhipbzLVrdmUnE5dahRmK2z1LtkRuV6nhQa8WPXwEYaU
	08CmpYyoIzSVv9PT75DnrbtXmPDoL4rQOGH0l1OGcPcHFmnGi7gQ0rFCofXkets3
	XeNAEBt4xA43I4Rrzp5g==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtr937-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:35:42 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-448d51840c4so153487fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792697741; cv=none;
        d=google.com; s=arc-20260327;
        b=GJr6wYTVsdgGlwVO4XDU9s/dMiG4spEEQDhTsaLKgEQtA/aG9+UNTAjaVh0qMxS2DE
         5suVQ9F0/JFcGFkt1/ZLFt3rLdYykIcvm1gnOzxd1kfMk/ifjExKMSDTW4TIFdj8lQ5i
         fGhFdbk86jm4neLV1tdxt2LEIgdqWO3bfUxLnpwsF3R7d9QQq7iwgMmV13v7bPzEMWh/
         U40eLRHK4NX416xEusmVQiHCuPzcOs2XeDdI5mnV9/USbH44RDjWnWwkodUv9V9U3u0/
         XnQ1ODaL8XQy8g8/OjfCoQBcW12iAw6bLGHNRkiadTxebxGVkKivv/u6FB6Xh75VFpp4
         yxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=3SwfJRNDSzVGJ7LqS7tKEPXSzOdbiOhYhtULwpRYw6E=;
        fh=YtujNNLBZPbNEgWSpU5rqt1qmP79bN7v8YEzkiz7+CI=;
        b=PSM3mDBFuN4PL0ucbEU5Owv10qRghD/akkute9Q0ugbnosNA5+bkax/0DExCuGLrva
         7ekzTfsNnfyy4dWFDQ5tMG+L87W8UVSzob1RpiSBDjkIeOkDC4SnZy0Q815PrJmk4h/0
         ELJmahoSWIeRzHzi5J79hj/DBhQM5WEqrxTNgIhbQ/bmFB01IgjcnSNzmSUecOLpVBuD
         +0Jl5CL578bVyAvY80Iwy0GUQLWGQSPR7N7FcI3UTZssgxGuRMuHCZ+wreDQFja7UH13
         JIn1H7DaDK95GSeS20wgPP/N9EwLgKQOP6noWk/D5uK4Agu12UfmBuRYhrtug/qgiGkk
         N+7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792697741; x=1793302541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3SwfJRNDSzVGJ7LqS7tKEPXSzOdbiOhYhtULwpRYw6E=;
        b=gesej0k8xt5oBHOLKpngwvYAf0QLIMg4AN1lHh+56NHpyDmz7KChyJXvJMHeTv798P
         9/kBzrqlebqSOuOpWRlTk3L2vdctpWArnqHPMNOMcJQJnzGaDqoTHlYnL9M5LzSl2jL9
         3TPb5CegbUmicmwDmxRBoJfrGGVydO0AY64/m8bGQqGCq13pNif0avQlqbVz8V+YhFTO
         DY1H8BpnDpDRIfLfclTVsme8e7T4rgn0W4wb72HP6iYXdRislpI9U1nQWuz1KUMkc1oM
         9gbq6pxribgYN5qgarB3ARDI1utpPhtvPQjOq9DgDHgdiIXpj/OaC2l6KbdFWWcpunRw
         mGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697741; x=1793302541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SwfJRNDSzVGJ7LqS7tKEPXSzOdbiOhYhtULwpRYw6E=;
        b=FJ2EQ41SNWhIvHrLThThaoXsktgdBOvUe2YTl3xds5nPlIxg/3pCA8IxByqchqUXLj
         w9KAjsHdHpjUqmHF+uKFMgCe9KZYzxH6RsVgP701DljrG2PCbg659EsSCCF4J3WR3D8V
         SB48ZFA60YEXiAsMuq//ysTwbc7VS48DMi0seNxUxwQPi+TLgZEFfXWWD1j9FQugsYL2
         Qsuxra4JZSSIdKr2tzh15g7ONbSwywDqXR0xSEpiYd6NB1Kr6zWJybNx4FgWaAekRPA1
         k3ott/CYo2s2YAPunmnwNxwL/w3+rs+QUe5jVaU6XL+90wxaAVZwdwpUk49rem1Zz6rp
         BG5g==
X-Forwarded-Encrypted: i=1; AKwUvBxIH9nN95F0jINHqbzri9gZKOQfaMx01JQ6BubHMfC92Ggwo4egbtCsoxGDa/k8ilPGRkccZ+m0xwlU0I+b@vger.kernel.org
X-Gm-Message-State: AFq9FYKrTjLE9VoGPKZ7P09wfYTHf94N1DluX7DAI7+Cohxu8ethus1j
	kc8eT4jOKaeqstUhSnrEUWTAtkR3rEknTM/cJdtTnFYOgxOBWjMW8dgOhbgUGzVdpjNkCVA8QL8
	96W26oHnmeyvZDjTogJ5Ai0aahYAI6wISMtvYX9OwIJGDlVWolcOrH7cGwWmxXiYCLidShZzvPR
	GQDmREjrLBxNNQOZl7CvxOM7lHTUC6TAEwWYUSRomjgds=
X-Gm-Gg: AYBFou2PfD2vOuJ7UZpToF3/YtbSp5GZYX1KqLzajjf33/pijijuLDcVZkPSuazkH7y
	O8oZSx6osilfwjVcvXfnFlV9Qogh327JWvZiHtSyr0OUXfcF28ZoZhKWfofg4mqim5tFWgvF1no
	A64YqOOBtAWibVytvcU6nEg20M9jrDq1awU2IsBRAU/G8tQd/RIE3XqnPA7w==
X-Received: by 2002:a05:6871:331e:b0:4a6:8af0:74b9 with SMTP id 586e51a60fabf-4a7dc266251mr4232375fac.48.1792697741428;
        Thu, 22 Oct 2026 12:35:41 -0700 (PDT)
X-Received: by 2002:a05:6871:331e:b0:4a6:8af0:74b9 with SMTP id
 586e51a60fabf-4a7dc266251mr4232363fac.48.1792697740950; Thu, 22 Oct 2026
 12:35:40 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
 <0e5df58a-e97f-474b-bd3b-9b1a24ae0c03@oss.qualcomm.com> <CAAnD8RZ4+BFkE_dubDr7cj14wUaOfYUYWMw3_cwS5G0SrTsU-g@mail.gmail.com>
In-Reply-To: <CAAnD8RZ4+BFkE_dubDr7cj14wUaOfYUYWMw3_cwS5G0SrTsU-g@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:35:29 -0700
X-Gm-Features: AclHuK8CVLxn2BPN0B2O3IHYYGVSXhUdwy0ODXqj91_c3jnfjNgQbjBJyzPiIqA
Message-ID: <CACSVV01Y6jJB1YcJhYOUR6oBZFJ2Y0S92ZnDYH9HsziKg=9RmA@mail.gmail.com>
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and questions
To: Jeff Roach <jeff.roach0@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6ada658e cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=BHDWyJbENOWmE-A1rxEA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: cft6SOytGxfaxBKiA1qpzncEItvXbT8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3OCBTYWx0ZWRfX/uLxBqlHOn6e
 rWs3gPHZ+fwqMrICVaN8m88QQSZEOSk2kYDg7zlJUYEEE0x7Pv6rBo/z0SPNbUvEADe7UO4vAJE
 bUASxjPUckqCYMcPDN7E3NW9lvQO2SO6kM37wf+JSVRqbYcjwYE0QdAwW99aCxn+zUB8QRiqETd
 DNFvTVDfebAlbDWs+wWx2kZDpciQjmXlIbTRkTzhNpsA7WaV9Q03EhiDOwM4BwIiklKKmG9+0qT
 mMr5Q/iKuUlQK8Bv3fw/cANbcoL7hHKBi3mPoJHlT8Qe74WSKJ6dKxER/RE500CncGHWCUPa32P
 h1R/gyk6Ey+fu/Adytlu3NRYD/nxiu3QlURO2mylb0JplWsp+gHTV1xPUnuxb/KbdukdYjm6NQF
 8hGET6PaiLOBpYzN9OfAcVCHW1521NGyiexmBS+4ubEJ9Gm5ZGtRrtBsnEA0vTwkjudhNf2NXba
 9k+60dm5kVmWoncVlpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3OCBTYWx0ZWRfXzd2wbecCBUsY
 Rc3G1XHuSFko/LxXA3LfhZAFSc4cUBODf9C07/uiMNedR9sShd8giv/lq1xS8ZtcJ6YycguaF/b
 nb+ovE9sDmLZWlKymsht0dB5sQNR+9U=
X-Proofpoint-ORIG-GUID: cft6SOytGxfaxBKiA1qpzncEItvXbT8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220078

On Thu, Oct 22, 2026 at 10:46=E2=80=AFAM Jeff Roach <jeff.roach0@gmail.com>=
 wrote:
>
> On Thu, Oct 22, 2026 at 3:30=E2=80=AFAM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>
> > >    - The pm8xxx RTC probe fails with -ENOENT because this machine has=
 no
> > >      RTCInfo UEFI variable (qcom,uefi-rtc-info).
> >
> > Remove the property.
>
> Thanks, I tried that. With qcom,uefi-rtc-info removed from the
> pmk8850 RTC node, rtc-pm8xxx probes fine and registers rtc0 (no more
> -ENOENT), read-only as expected.
>
> But the raw counter is not wall-clock time on this machine. At boot it
> read 16385826 s, i.e. 1970-07-09, roughly 190 days of uptime since
> some earlier power event, and it ticks at 1 Hz. Since
> CONFIG_RTC_HCTOSYS=3Dy runs at registration, the kernel sets the system
> clock to 1970-07-09 early in boot; NTP corrects it later once the
> network is up.
>
> So whatever the firmware/Windows use to turn the counter into real
> time, it is not the RTCInfo variable: that variable does not exist in
> UEFI on this laptop (checked via efivarfs in DT mode).
>
> Do you know where else the offset could be kept on these HP machines?
> If there is no known location, would you rather the board DTS keep
> qcom,uefi-rtc-info (probe fails until something creates RTCInfo) or
> drop it (working but read-only rtc0 that reads 1970)?

We're going to need something different (not efi vars) for RTC on x2..
but I don't think it would change anything in the per-board dts

BR,
-R
