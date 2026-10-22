Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792674538;
	b=BGO0dKf1cnqcoJewBAl/JcPV2Z1r6Gkl0mMqC2BiUhG6LgFfoS9yHQyAA0VHgpY2LEjg
	 Xe0WxJDncN71OA+cUW9Z926I5AWepV/gZgilQ3k3fCbqiq9necAGLoRmQqGrAgOCvrx38
	 xaShZZY+3plKwM+tUa1flyhRkPXBUFwQR13wJxUWxdsNc+UNlqlb2vVIhYR0M1Tjb7NV8
	 M15GjzDaszVaTQskNRdYcebbIIY15xj0GAqzcgPfxN21hN3GOzZJXij82ChzFE+Svks6w
	 zV97IOlQver8epZ3oZdnEU2Q2ryvsYsNyFq0Xh7A3U4mFgR7m5/46AYFVANkdGJLsgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
	b=sAnFmK6b8GoMh9y7bwo9TNILGnkHxTXkovJaGC5QnxY460JpMPZmX2nEu7vaZnZ+cOxA
	 vB1i6DlP1ToDUtzqnB3Dv24rMRXRq0OxmJFRAWTZm+jylieILCXfJQ8nUY1jB59LhUCnL
	 HfhDinbLpy5vZEri2TgeGR7SZPCvD3woPvttfU1sNUT6xPXaB2xImb5qKwZslAiQQNh2a
	 6ERTCGpeN1DdBby+ChbyuLklegRf787eVAhtXTVKoucDrFNjlD/Dd3iRe9j/BOx2SigME
	 CrwU4yDr9mIINeXcIcc7qDOg7JwLIjzk1WbeGpnFh7OioEMEidWiCSVzDcUKAyko8QA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fFUlxMUB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dv3Mmo2v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081B9606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081B9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fFUlxMUB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dv3Mmo2v
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xwZn3478867
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=; b=fFUlxMUBQYcJI4dq
	HRjiZRyz+yWr2OWqoFsvQUGKPGs3TrfXtCj9F7nxrzhnHUJhNk00bA7ym+NGXlL5
	xbj26S8xDr3P7oYt/Klf0INzmZ1i5iFvoBOztup/m9Tq3zVEWYZ8Nc/7H7IyQKXx
	0ucCe/lvbD4CGrzQ7kF0c0rUgz0U4nUBE34r8hJMPgoVF/J8nnPQ4O2w3EGqt5NF
	N3YXxYOVhuFKuNRFgNwIBvZwMe/SVZSa76fWzLxXTizOl36SkvY5021Ai2arSRlr
	saakT0vvW6USlsMLajZnqqL21TAvK18Qh5inPb7eOUsYUEeL6Cw5BzbkkgIef4Dj
	+Upw4A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a3knv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:08:57 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2d1eb484aso2370798b6e.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792674536; cv=none;
        d=google.com; s=arc-20260327;
        b=HyexQgg1swHsxU+SJwUWq/PtHBUpYHn4/pkgUqnt1G5c4eonXkSFMl8rnLRuTibb8b
         SEdY6lSc5N7iiTWlUL/SN4wSZwfBj+mchpEXUScqi+2ZLlg0wnLX9nwmlSZkvokoGA2G
         yihOmwI/JpSkkQzYzSliTiPuFhhu0v31BdP7xtPprCoD83XJjYnw5jsPAE748LHJWNZ7
         VmSLQQDPJU3LK14STuJZka6UXGEyvzsxf5/bo5CGFW5eZSRqA2gJdePy0PLrZqAIOjE+
         AV44kt4MLOVGzWDLHL4CYGs8x9AYnHmDyPlB1BEekCRa8nMFx3rmIrieyjuYxVCUyycC
         M4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
        fh=TS+fjk5Y17XpuVwTI+Oz2vmbxOOf4W7KDakObiIwA+8=;
        b=DuAxDLtSxK/502SSlTqKvD7ymmyTGn+2mIpDn1twnE3L3Ofy0NEERtNzC9IlNN5/21
         226SR1VxDmv1T4/7D7hcUW+w4lHufEaiX3HcO93j6pT7IZUV03uMSfwHc+/FpJQBUfrB
         mMR15xP9AGAoEb4i5NRvfv2f5gKJIZcHZ8hNnoawDoQlREL+JcHr8Rs2NuRptONke84w
         95t/CUcil/9h9kdoD5YjksPUJSv8+TDnMPqbFC5eRQFGpBgacr4UYHftTi8hQBGKhZod
         h1jmneMBmnWbz/aPOHhE7RI/A8xKUQ3A4E9UPjWUJxPfJD/6FYromG/5oFja9B8eVC/j
         rvNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792674536; x=1793279336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
        b=dv3Mmo2vK5i/Cp1ZEEkeVIgMJgtWkg+miQhO8dalYRJ+TR5qGIuH/WQAplf1CFxrrI
         W7MWcY6FA0x3tVXVsOmcG1dr7Cn8nb/FV+e4SLQ6+DmW/Fk8nVqqlNwbjHcV/K12w0QB
         N8TbFkBFf2k5Nppr4JCBgUjqHIL8HWXbqoPYKSWX3+s64NjBrTfHEY4amcLMsLEFf4xi
         tn2BPggHQi6GS2NT/4viilSj6OI1hmu4zRlYU0s/Z/kJ0pRMWhQ3nYpG8Rq3R0Yue8/N
         kx433BhSfsPhI6lheqp4nBp2dg5dAWIRFPQndYZIb//OWMKJor7nshmMtooIM9bfBAY0
         tB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674536; x=1793279336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
        b=WZhEPU0kbunW+7EtOgWjcBDxE9nO1KHB5VrkgHnkimOZ3D+TgW5O/kDf6ezIjRbg7e
         qu3eJJ+kKXz3XQoANRipZEgBZl9DXrWyRCDUejAdVAmJTgYa+7L5lzV8wrW2+0INt1aR
         NFQXfcyPBrzpnJ+JFPoR0N8Q50NXopStNUm0easF3ShcV8N5Fb8NDj/jbNDvLH0THudO
         7GJs/2GkfeY7BFJyiLpml3oZwol6tJeBFTit8UAO96Z7jjjenN3+MtPOlCuMOA3Ln+YV
         kLofiS+H4YKJb5GbBVd8+vp2np/D5V7Z+fb3TLiZpeaOzNXC7vETFZxY7oobSSJVxBuo
         T8ZQ==
X-Forwarded-Encrypted: i=1; AKwUvByvg44BpzaKPPM9FLhxz7wo7zULyJF+JacV8qHrhvSN0DzfFCHpI9w+mxXZlGbfsg8ggdOHG7PpWoOnnB7l@vger.kernel.org
X-Gm-Message-State: AFq9FYJicMCaZMFTceTqLJ2pgsUXdpnZxfGitzdZdpi3gY3X3mtUAPwI
	tw5+Otb4vRaw2qU1623KX8FROPO7gPhpYSm3ZAk3h8HlZpY4Z20vTM5MbR8hO7Isb6ybK05hU65
	1bKEZy+yv2VwtVG79w2SU3mfdmVSQa33zr/xxU15L87VPdsZTLSNt00ENh93vvifzp5taeTP9De
	9pO9YwHSumyJeXcrfVsCzHxJDgwF2ogAUnmKKp7wiSNqU=
X-Gm-Gg: AYBFou2Bo+b1pZEx0bAwwTcFdb4qAhF4L0u0C2HzrpvQUKKbiMoKSQ0Sa1JpAB/wNOq
	XAdWd4z9YJ6YtIxGyDA7o159l5umX0OGB2zMQw/PDKZ+PZzfVcgRAs6dJATVKTvgUYLmFpHylMt
	JDSZqYava61EcqoLQfVF5TejWzDGqjXgONsSjim4Y3VlnJnq9eNOAZ1k2+uhloy1AjakWgW2oCp
	EQC65cCuGrWa2UMgnGcm4ThlY6eW+gazOs6dMysDUxIU0rnrZTtKmpRrIjiDvCOWhw0r/SJGYM=
X-Received: by 2002:a05:6808:4f0b:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5535818c38fmr3719763b6e.36.1792674536237;
        Thu, 22 Oct 2026 06:08:56 -0700 (PDT)
X-Received: by 2002:a05:6808:4f0b:b0:4b9:e65b:8c36 with SMTP id
 5614622812f47-5535818c38fmr3719745b6e.36.1792674535696; Thu, 22 Oct 2026
 06:08:55 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com> <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com> <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
 <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
In-Reply-To: <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:08:44 +0200
X-Gm-Features: AclHuK97HFIdPEr61N5bt2T_LHXrNyu9E7auEMGCcuKFJXvXq_yVtWyXBQ__JQ4
Message-ID: <CAFEp6-0b15kV6ehMN4Pv24UmMo7xFYr=H396dvdD1Teh7h+K+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfXyZWsXvi0THqg
 V4hK3o7xGm1Grhzyo2NBamO0M9Ov98bChDaH9zzRIqcjnWogMTqYjMKSLoyfnxwkWYwGwUQUgba
 6JlJ0hSr5h1B2HySBNuwvUSc+zsoJqJqI5iPJej2inIpT38IWkz4ViktTrTyGASQoJd4+NRy+Wh
 v06Nfjd1dqr6SBUA+q1ImimfawaTZR67rX9xKdVGY4o8nkHcZ57UMq1LlVbNMvzpn/kPnQOPIOn
 KuO16thYkAim6fRFdljJLHz6cEgpz5iJ0QP0sZUjRsCTOJg2MjToUs9+bKnKNnctyuz2PaNaok9
 6/IJfAdAl9vPMA1XrGOxbTD/Vg8n5Hc6QG9fcpMCQDlcwVinNqgljsRXVsJg8sKurJ8lrn6Dnpk
 Vn5Ez9aVEwNsT1+7PUymL3NCd4hwemgbA6/Xy2ggpevMBhOZzwsNWjvGue15IQlxpwkbjaKZPvz
 td1q9TfLuqxq6pqWl+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX26yD4f7OFTGr
 aqMGF7Jov3MzUFZKyIlTFsTTYdXB8ZyBQXv2lYyUfN2T9PW7Q1hVbScGvs5tUQFVIPsxTFlT3Ha
 N65FDnGzhw/BVXmhCwEGJOP/6C+WU3I=
X-Proofpoint-GUID: P1lg7i-AzdCEkm79CMuQiy7xqDPrH52z
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ada0ae9 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=8PI_4jS6IWSl88OZsVIA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: P1lg7i-AzdCEkm79CMuQiy7xqDPrH52z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220052

On Thu, Oct 22, 2026 at 11:34=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/13/26 10:13 AM, Loic Poulain wrote:
> > Hi Folks,
> >
> > On Mon, Sep 21, 2026 at 2:38=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
>
> [...]
>
> >>>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
> >>>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
> >>>> (monaco.dtsi) for clean DTS layering, so that board files only need =
to
> >>>> fill in remote-endpoint for boards that actually have an M.2 connect=
or.
> >>>>
> >>>
> >>> This means, the dummy port/endpoint node will always be present even =
when the
> >>> M.2 connector is not used. I don't see a compelling reason to do so.
> >>
> >> I don't really see a compelling reason to defer re-defining them to ea=
ch
> >> device DT either..
> >
> > Adding an empty port/endpoint at the SoC level is problematic for
> > uart, port is not always expected, this depends if the uart is exposed
> > through a connector or to an onboard device. So we may end with an
> > unconnected endpoint but still have a bluetooth subnode, which can be
> > a bit confusing... Also why adding a port/endpoint only for a specific
> > uart in the dts, and not for the others? This is a board/SoC level
> > choice to use a specific uart for M2 or not.
>
> From my perspective it's removing boilerplate. Currently all USB and
> PCIe hosts already define their ports and endpoints in the SoC DTSI
> and if they're unconnected, then simply nothing happens.
>
> Both 'ports' and 'endpoints' are an abstract property that signify
> 'X can be related to Y' and I don't see how that's a problem here given
> UART is very much expected to be connected "somewhere" (with the
> "somewhere" perhaps being external/a pin header)

Yes, but in the UART case, where the connection can be represented in
different ways, we can end up with devices being described as both
unconnected (no remote endpoint) and connected (via a child device).
We can probably live with that, but if we go in this direction, we
should consider adding a port/endpoint definition for every UART
instance in the DTSI for consistency. The same would apply to I2C once
endpoint support is available there as well.

Regards,
Loic
