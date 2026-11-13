Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580563;
	b=pN3+bV5t52QrLNNFrN4ddpPc40BrimVaR/0e6otNnzII7b7AwKlNBicmZ5fXUnLIIaR+
	 3lf9npEGBgfJp7zfXRUdBRHHRnH8TnARDrsPXDJicSTecfTDe9s3cci2/trHkkrDWIaJV
	 sASWyWanx5lNcgNGIDqnhC0ti+WvTPSiJZc65ubqwRt5xaYB/g0iAcSTt9vWUE37SGVMY
	 tOwH90txXgbwQBaYgD5eVwZVGKihf2XDtIN1f2lWM/rOw9HSEkwPLGSavSPU4u7dFfFPY
	 l0VZBHKlCgLe1SYUo+WI1J4SqVT1JiJb+REiD0YDvG4187XHA9ep22hVzecC4O3OzIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580563;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=;
	b=aGwVvly3anICuM9gWKbUfJvphDdDUmjMU0wu1KQofk/RAAU4gESQwa5xNIA73kxkwo9F
	 OprujmDvqoJeyQ86XxvP3dFZgwQzzZoBotAGty0zF0yitLX8i6xKi63F8i+F0OkxNxZF7
	 R3tgua52YGpvhwDdC5x1kAeC5hzBuRH0TmCsFfvKJ3HssXbZkdIqbtncsHQDc5Pn9wsfr
	 GwJTKLKfcRhdmmP2xLNUDnKMDjPuYZFPy/F7C+1gzx6GR0H3Zoz9DfsAMDjCLQWv6q/sI
	 AHN9Qr4ncrlVkQ7TbBOZkIitKXBP+La0JihPX8z0aie0+CXoIadtVEaCcxmKSw3aVxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxls12BC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxpF8k5M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2316606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2316606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxls12BC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxpF8k5M
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJSYW1227168
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=; b=kxls12BC/9ybMijj
	R/yv3Lr8wUQxobhd0fgl5nEnfr6KyG9b6pff6WwhWO3ZCkGqig0W/RAf5o4P0871
	tSdHCf48qtBSzX6S5kP16n/2pezZ1uMFy3RXq87xxnjpzxrGkXhDLy3MpFF4bnAE
	7Osov5+6P5Hz64cwA6LeUrSWt6D7s1RQOj4fPfEF3/A54FfqJqvgdXbh19yZ8J9r
	1fWKFerXbz+5q42S9NHu0HHk+N36ne7Hzys8XYUQThNbN2uk31Ykx5rQsrciG62b
	45+KKsgIy+n5nh/SzlwHfyJaQ1zT+Tt5bhlA03KmH60W7Z5BS3YXfFa0VN/XjcxG
	m5xuNA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp8qsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:36:00 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece5510b79so1140481e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580560; x=1795185360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=;
        b=LxpF8k5M3czBtCGqcdZliENr0XbS5UUzUSOujKzVAXK1v6oEczDMkyx85Lv/3LFzRs
         lVdtqoy0NfMLc7jgumS8zfhHcWYz1rbb/9mwmMqSbwP6WIhd+o22TlMx5F2pZmOpeCRH
         ju9ragy22PtS5wNCgZMHQjtf0z2QVRDRhQ3J1rRSKTF3VrZ80v08CKJ2CQ3s8niJbtSC
         OomrB/TfegDV1NzBDMehmWVnRlp3CvomGOjuBCAUSeCWIY5mDSq2MP6NuVrvyMtUDNdD
         ICY9ayKxjbWR6MRAc6WRjZPuN/qzAwQwMbeOX4OvYTSymGCKaQibCk0L/tNeJevAJ+YZ
         73gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580560; x=1795185360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9N3Xm60xAl6wR1Ink0ENH9O64HK75M5rWTZYwH8Na0o=;
        b=fjLV7skA0Xsn1JiKp/joVu5KAQhKKgqs1R3Vj+cTL4W6fIuD902NzMTkwcFmpyNJIg
         CLRgR7KVAHEFs9xnfPAkIYRWKoX6UP0+EPQMKTumhAv6fv3JHct7KwiNhn3UX+qno0A2
         /d0OOE1c5Q1PCF+B/46hqyieTdso4y7BImnT2DVC+22jg1B18H0SC5bm96DZhttNk+te
         GOlFsfVcj3Xh3z7ZvMeVYniU8YAlByljwb+uhWr6qssapFP+swiDf0IZNqQT+ZLKImZM
         PhoBVOHfovdVUbDua2PkiPu7fpObBVvuZIISJaVBd/NiVG+qYRpYn+qg5jfL6jYB8DhG
         rHXg==
X-Gm-Message-State: APuU4Z81fapXbNTrfJf7O8BLAQPh8NoOMzuY1OxsLFQPjutaUNqm+MOB
	2p1IAwPj6ePty/kk6zrXdu8B+dKlEx20GlNTN0ClGa9evLPdN03KNWYLcB8WAER4iWoQBgzD+NT
	oC6aIZedS0Clqvt7XACrmJ9XOXXrJo2bxXx7eAbU8qZ+I410wVLp2crJg5IEX7wXVnOok
X-Gm-Gg: AYBFou1KeEAq6DIz9sxpRguV2TCixSYngLVZcibvMxqTbk+r4NQKn2pQTyxCb2deqXQ
	8hg3PIb0Nc1/cIF0iDMnpAmIVPiv19MhST2qsSAS+73q2IDFOFTtHMWI5WFzz5tObiHzJowqiYR
	2aTgFrx93TL/AQGNBm0cHpXZFawtX9FovYZJut5O/exJ+cmGvzUOimmXYHsue6SpZfHGm+niK6e
	LNZp/kZvSXnqvP/9llDW/Nlu2tB/6pH6lWYPVj8OtaS81rBpvgP0uFzxtTSmhyMny2qrE75Kc0v
	kNCtkgDz7QaM1w5aMUhpL6NUljXq4FaeLniVSYAHy34Kf6DSwQl8E0glXNUBIMuW8lUr3fhla4f
	J6onN4v5DtwSRLmjTCX3eJY9BSOwPQRK1/Sz3HmdbLppr9az/U5eiVEu17/vaRJs2ZnxeIXFnEb
	f6
X-Received: by 2002:a05:6122:552:b0:5ea:e17d:fc73 with SMTP id 71dfb90a1353d-5ee3466f8e9mr884654e0c.3.1794580560039;
        Fri, 13 Nov 2026 06:36:00 -0800 (PST)
X-Received: by 2002:a05:6122:552:b0:5ea:e17d:fc73 with SMTP id 71dfb90a1353d-5ee3466f8e9mr884648e0c.3.1794580559595;
        Fri, 13 Nov 2026 06:35:59 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34d4ed43sm1387544e0c.2.2026.11.13.06.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:35:59 -0800 (PST)
Message-ID: <315d7bf0-352e-4dd5-9779-89e8ea75427d@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:05:51 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af72050 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yyvnBEBB80qBeyI6t6IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: XoPcTQUC8mnjebRQqjk6FfzLTrdGPX8-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX2rCaAylWq/fF
 /5YHMSyEWGmeq0sJ8sd0canRSfISWZlvDQIp53Y/JqTi/Q7TI6K+OoIATpiI8g2UdmwYFwyNdHI
 CLEGWmBXZ3HHELOz36D8iA9BftaMSZs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfXyB5bTWVXTP1i
 ND/E4Wkom9nr/jXOuiQbsHySQzpcuedvLuQ/IPa92iyTfK/+OghIkyaKTasVirp8VvLll4zQ7SQ
 MNEhPJoto1u9ijLeEhv6AB3rcohpDrYJuQ5AkzD7IKFDeRdfudEqWXRMPwEZIoV0kzDCiRrTeW5
 7J10nJxzOtvDbtNumrPbXG0qA8/t+fufXYm8bFKSvS4gwllUQgHCib7vFpcDDI3nrRKuArntrsF
 u3gm21M5duq7nIXyzKZ0CuMepfp2ZmZplsrZGFNRjdmnW4FwHU60rZrUp27z6wcMpd2IZvRv4RF
 fZW+Azj075Eys/UXGnEDBDswd/Y2I2Kjnh0dezomPbQVW6vmDNiQx7Gmsq6XLcJRa4paMit2Hci
 QJmRz0EMbfYxPmuMLYcOfgkj8Iy+Jtxf1qFAS+I8o0uzZjy4jGuyqFnfoYH5Q+DcXTUVcn7puQL
 vIL+Z+JbOq+ojXfqjQQ==
X-Proofpoint-ORIG-GUID: XoPcTQUC8mnjebRQqjk6FfzLTrdGPX8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130058

On 11/4/2026 7:33 PM, Komal Bajaj wrote:
> All existing Shikra EVK board variants boot Linux under a hypervisor,
> which means Linux typically runs at EL1. For EL2 boot without the
> hypervisor, remote processor firmware IOMMU streams must be described in
> the DeviceTree consumed by Linux.
>
> Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
> produce -el2.dtb artifacts for the Shikra EVK variants alongside the
> regular dtbs.
>
> This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
> needed for Shikra EL2 remoteproc SMMU mappings.
>
> Komal Bajaj (2):
>    dt-bindings: remoteproc: qcom,shikra-pas: Allow 3 IOMMUs for LPAICP
>    arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
>   .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
>   arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
>   3 files changed, 37 insertions(+), 1 deletion(-)
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

I  have addressed these comments in v5, which is available here: 
https://lore.kernel.org/all/20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com/

Thanks
Komal

> ---
> Changes in v4:
> - Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
> - Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
> - Add WiFi firmware iommus to Shikra EL2 overlay
> - Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com
>
> Changes in v3:
> - Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com
>
> Changes in v2:
> - Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
> - Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com
>
> ---
> Komal Bajaj (3):
>        dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>        dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
>        arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
>   .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ---
>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 +++++
>   .../bindings/remoteproc/qcom,shikra-pas.yaml       |  5 ++++
>   .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 12 +++++++++
>   .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 12 +++++++++
>   arch/arm64/boot/dts/qcom/Makefile                  | 11 ++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 29 ++++++++++++++++++++++
>   7 files changed, 75 insertions(+), 3 deletions(-)
> ---
> base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
> change-id: 20260918-shikra-el2-ea8969385c3c
>
> Best regards,

