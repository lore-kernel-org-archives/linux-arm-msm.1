Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793283452;
	b=MJ6rMvihDVyRoqqUdn0Br/RVwRERi7yIHmJ8AbN99hZ4ReFgm4//AOuBm+EqiQlCy+/C
	 ZOc7yeOuvR63Z6mLCXa2A0MpahjT9rxqkSTjikLWjY58hshR+HOehJ21Ldqbb0uHph0OF
	 EdepPaq7U6bg4hwjNGAk5wX1rbet0KUCvIIcCVNdB1FFYw8ATo6QL8pC7GJcisyBbUQ4E
	 h8ASk/RNLVWU3/HcbWOzPbW0oERZlpbbiGf0+ph/SuTIoj1kCl4ao/5WnEFIbkz0k/6AQ
	 NnGUF5anXaSrZtRIe/DrGnsXSS9erV3LNIL7g5niCBgZ/6kOzQhh6huiOf5JCxsRWTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XePhe4mIyzoHuWMx1ZSPHH7Ab0CP3siwIwYmV+A8biQ=;
	b=DmpanKnw2Ns9sKCHa/V5LFNOAmt054/yIsGVJFFAlhKLtFb+c7xIi0lAIXjikpEMF3kg
	 npZZ9856ttojZlLQ34KNy5G/BU4fcpUzKpCNcGKFItvUHoKuWzm8pq5ZlQztgczQgez8l
	 xKAtTtjqm4URHZfbQrSteMpImF2H1DcGrMdILiR47K0ZwTkP/g/XnFYHBJraSwvhsvn6J
	 VEgY1fEQLLllRCg7FNRyG3yCrDMi1eX/O7kJo2sFzGirSpLMIby/VLKksNuvlcO07mH7G
	 VUjuk8mR1Oz2snzeacztBBN4+9I5BeAugD+mDExzgrYcFz/ZSO1smirHEIpWSF05ARg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQtlFtN3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Sw/b8bTs";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3AB606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 14:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC3AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQtlFtN3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sw/b8bTs
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe1A43943774
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 14:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XePhe4mIyzoHuWMx1ZSPHH7Ab0CP3siwIwYmV+A8biQ=; b=MQtlFtN3Sm1zrKcl
	CXdHmjk1+4i2GVB87eTjCAk2iZ8XgI1ju1LAU9fXlFhNV3lr/9IrVHRJwAFbmdkm
	Yz7HoDbI3x23yjz2RH8Y3Buc3UnPlD7fF/Ua3OZYZE3Q6G3I1mAxGmbI3ZOnuBy3
	eia7RL+aIosfPaxgTMXhqvIFStyY4pkAGFJOMM+U+SSBGWn6HtliMKf4PNqmhyFe
	fnPaDJzPbHlf5JWHqENY1GquhwD1AiQPuMErzzn7/YMg0dl8MXa+Cy/mnjFjGFeV
	QKy32Fe913pIGO8sJQKEwvtopj3vAplKqWNOyhSRzxFOIwTfa+59EEnBiURPWoSJ
	S55T+A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fgwws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 14:17:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd633da24f8so2684494a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793283449; cv=none;
        d=google.com; s=arc-20260327;
        b=QczLtxLRedqH+I0EjF4NuWzB/XaR7PbWEfxjVIR47DqEuV3lRJA9zJeEhRgREQf0kW
         suTqAX6mA5wNaR9GuvNCIg8PrnBYxVLOf8OYbDCva5R1z84LNTMaBHSCDdAEFPhSLQqE
         mv2uRd/irHAcni4hLoPK7JttcVhoj1NoPOU6JO3SrEbuMojdASEtn08/BEcC8rwTRUQK
         Ghc2tRlrhGwiIP7FPn57P/Pwp3iJsQ5McplqQYGcg2odIsD59yDHXbGP2v/NVaBXCqIe
         3FTcPYRiBi18t/XUt2+bYUADalyMbU3+Lck6T0aPZF26H9l/QjVAZQyJQ1CfUckFUlJ1
         1SKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XePhe4mIyzoHuWMx1ZSPHH7Ab0CP3siwIwYmV+A8biQ=;
        fh=QLvGWfV8BnOazK7chBHCXA7dSDY/3F3iDLzT1ULkBc0=;
        b=nU4A3ea01b7CLDQgVM11+GgZWyIz6vna3EqxJSMpnGDQlhvwM4KYcqF81Jlz2tUtR2
         w0mKKlmNHLSBtaW0Ztsel9fuNuzgNNkEzs/RnGxf2N4fHsu6tYejAgxaRW9aap9NwaSc
         opPNWh+QlgvfAoQliaVngoILzz5vyZXL6uf5WH9YysWSHq2fEbDXzk9xrtG8VHMjQGeI
         Leo3G/eoqP+6Xq1kb/7jmyHT4FIBMGY5NV+HCQWydKyByDZxIS56ngBISh3Gjt7JB0gO
         H/pVCKIZCJH2OjFB8r3GLjZ8hod9oq8EgCtFkQfWvpzb4WTfyBae1GGUf2Fun30LWvK8
         n3vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793283449; x=1793888249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XePhe4mIyzoHuWMx1ZSPHH7Ab0CP3siwIwYmV+A8biQ=;
        b=Sw/b8bTsQfxu/z+k24fBLGT07MMd7ACMJvRejrPM90Mr1uFqvVz16CsrSostXfY+eU
         iQZoq1Al076DAAb7Sv2WGFUUs5Sb+06UlXNNplNwuSV0RZ+avbRAKFBf0wZtrGaJPcuF
         jOL0yqyzDsgIkuQE3RuZMnpg5D3gWVYOxC4DelV3Fw9VbzUNdiKUSTi3pCxPAhau1IYg
         8COh687ecHXdvwQjXKfcfydzNMOJacKDJUV77XStTrqUobbXTaTjmAt9KHshYCIOFr/M
         kp99KYBINixmPgc+5RcfQ07HADZYh2J/S+fN/rATga7TVck/wS0LMmtXsUsxUJft4KM9
         V1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283449; x=1793888249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XePhe4mIyzoHuWMx1ZSPHH7Ab0CP3siwIwYmV+A8biQ=;
        b=tNVITPMgSupGxbV2IlqpYvtdiWdlYtBufnc91H3HZfgVRXjgYcZRODaqWL7J1e9O6T
         HOFcXwWJ/MChgX/OfGpqgBHXkBIv63FjAdwvcr9JYxO/cb1vLvnt3oiJOpzhHNrdeibd
         8uv4xB3sg9yM4fK1IQDI5TmNCwVAz7EiIeW5MRPZTr9OBfTlbDFRsDhD1As/Wdhrevmg
         WMdAlkDHPfArzk6r/bROElUDL2rTkUe43LLkLHDGDLX3jccRVL3BBXvxQkyJ45uTzPTw
         vpnvXJtizg3BALj2TrhDlPJlNWwZYM3ixzU2WcGJzbzVIUqy3fpfieD0ciz9kmQr1c3t
         h7Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzMcb0lKtnVKJDOMZ1NHAGwnj4yelZ1WMZnnJ7xCiUdYFiXlNusQ0Hn4A7qFdDOz0ov6EWAW9jBCwJ6qL+Q@vger.kernel.org
X-Gm-Message-State: AFq9FYIa6hfmc2PUS+B0xx2w5J/XOfuSnVXrb6OWevjBP6z0oihuZruI
	xm2CHLyegcaR7N58WVa2gwPSt5a9CjgMi2wOmtoYcFsJjuVvv+ZTd4wT0ugvOOo1XdeMnGOhWVH
	0Un49feq6iCsKb1aCtXVSHLkWixAehr//KAOjuxMShePPgBqobYHV20UytxvxSfKhJuacyb+kgJ
	QmOnjJiD+iBnYWL1oG1dXHKREgnHNQz0u5VXipIBiEoZU=
X-Gm-Gg: AYBFou3h0eRo17EKyjQJICjhQbqwzMyGQF5pqnZWs1eUktIlg9LDMXCtvqM1KwjtqBV
	cG4B2legUTq4FWGq55oWHpoQVGwlchBCoJSBNqpJYUYQ/SL8ym9lwoS+xp8D0HqcYWqzmWL92pM
	0pr5wcKlagBD9DgqJqrGavyJZc+3JY/V4nHZRjagtJhwbbxOBap0/2mc6VHg==
X-Received: by 2002:a05:6a20:6a0d:b0:3e3:1013:4665 with SMTP id adf61e73a8af0-3e90234d9cfmr5486413637.48.1793283448634;
        Thu, 29 Oct 2026 07:17:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0d:b0:3e3:1013:4665 with SMTP id
 adf61e73a8af0-3e90234d9cfmr5486382637.48.1793283448152; Thu, 29 Oct 2026
 07:17:28 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
In-Reply-To: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 15:17:15 +0100
X-Gm-Features: AclHuK-yG8GjI7p3wdC6k_i_FEVr3l0Mml-BhNjxuIZOPYfSt36zwQfp3z00yhg
Message-ID: <CAPx+jO_ywfJUAGs6Zo8yJyTpqui=qN-T9qqWN2hKCyeegAeF=A@mail.gmail.com>
Subject: Re: [PATCH 0/3] ICE: Enable runtime PM support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1NSBTYWx0ZWRfX7s4SO9syJT8j
 dFFad97Z/7AIXeXVcOqA+foXCYdN8i3irTiekkIgPyVtXfSUhaHsu7rxxvr1HaxbTl4ObwrDuGC
 bdkcHqZH3QMUn01ZlgM3hqSVYs1iX30pXponiy2uU11qf641agsNhhyypZP+h4YhEjIwL2jP60x
 XTTMFUvRJqcpwTr+0SHOrvG2mM3+5pGOm5FE+ggN8FL4SYa599d/pxBY+QxGoNduio5D7X2nWcA
 N5cfSO9nfkHs9dDI9ih5SFKDoJYKe4VGWvbuqtnUEvO7LosYW1e1Nr8W2dj4VOT+ogwBdiw6I5a
 dCIr6yDPykIYmtu+qh+SYaYeaNrcazj02oFWLSr1u4oVb8DUEguqPI01jrhVFWYYDPoJ36L/CUH
 5KCQ5BqIggTbofA6RbNma3MufOO+SAP23UH4cFp6FjZGgPjK37M+OLtw1BnNcokXs8Vc+Nf1AqB
 rJFxURZ1TOYh4ze6q2g==
X-Proofpoint-GUID: tgYSb5Hl9VkZ-JyuyY9kuDPFsKZRsVXo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1NSBTYWx0ZWRfX+Yn+1ttav/ib
 lZVuJR8W6Vaw0BM0M5VbYcr1KDSi+GQVyqIY8VhliWrHHq1Fib+TnsRAJln0BbiFI1hAMFSnW0e
 FOhm+GhKUo4wYXDurxL/eCCTK9MP6H8=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae35579 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=MNM1_axOnic6cDGTpHIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: tgYSb5Hl9VkZ-JyuyY9kuDPFsKZRsVXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290055

On Thu, Oct 22, 2026 at 11:52=E2=80=AFAM Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> wrote:
>
> This series fixes ICE clock lifetime handling when ICE is modeled as a
> standalone device and referenced by storage controllers through
> qcom,ice.
>
> Currently, ICE driver enables clocks during probe and keeps them
> prepared after probe completes. This keeps the ICE clock voted even when
> the storage controller is idle. Add runtime PM support to the ICE driver
> so the standalone ICE device can enable clocks for probe-time register
> access, then disable them and remain suspended while idle.
>
> While enabling runtime PM in ice exposed couple of sequence bugs in
> storage drivers(ufs and sdhci-msm) as any key programming call used to
> go ice and never complaint as ice-clocks were always on.
> Example, unclocked register access happened from ufs/mmc in
> qcom_ice_program_key().
>
> qcom_ice_writel(ice, 0x0, QCOM_ICE_REG_CRYPTOCFG(slot));
>
> Fixing this issue require ice instance at early ufs/emmc probe so that
> correct sequence is established and ice is ready to accept key program
> calls from blk-crypto or any explicit storage operation.
>
> Merge strategy:
> Patch 1/3 and 2/3 are storage driver fixes and should be available
> before patch 3/3 lands otherwise will result in bootup crash.

Then it's perhaps better to send patch1 and patch2 first to get them
landed as fixes and for stable kernels, then when that is done, please
resubmit patch3 separately.

Kind regards
Uffe

>
> Validation:
> Tested on shikra-evk, kodiak rb3-gen2 and sm8750-mtp.
>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
> Kuldeep Singh (3):
>       mmc: sdhci-msm: Enable ICE before enabling crypto support
>       ufs: ufs-qcom: Enable ICE before enabling crypto support
>       soc: qcom: ice: Add runtime PM support
>
>  drivers/mmc/host/sdhci-msm.c |  21 ++-----
>  drivers/soc/qcom/ice.c       | 139 ++++++++++++++++++++++++++++++++++++-=
------
>  drivers/ufs/host/ufs-qcom.c  |  29 ++++++---
>  3 files changed, 142 insertions(+), 47 deletions(-)
> ---
> base-commit: 9a482184d910775cf648863148944945b74e2815
> change-id: 20261022-qcom_ice_pm_enable-3c5d21b99e42
>
> Best regards,
> --
> Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>
