Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181422;
	b=t8fMFpMY4hdDEG/OjPfLhMqR2WP7IrbVIcAv3+sKnrDvxDppfKG+XuB3APTV7PiJmPFc
	 K32NmYJ7uj8tprFjD1dWIMKpMfcRmHvq9vO7Hxxlt0Wzon5wphiWrBQIUOBw4/iClKts3
	 eT/tfNZ7u3UZbTg+tDWi2dsqIULdmcFNAxld1SP2wOAwNITWoB7+6R50lmo/+GPdv26VM
	 gJXBRbSJNSkd5Z98SEbM/pA9Qs/prR6j7xt+58NVanh8zcpMadkKb0sYdT35gMQVhNzgC
	 DV3hSlu18i1WelSKj1tY6WdH/DA1/EmwjdkA+DRem1+UoaZs3qcc6GTPGqtjhmFDbJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tM3hgV96NjuO6l8RrAIG2WV5+oJMmenUNkW7OKZQw8c=;
	b=KyoXurXWul97Q87zJGuemVJisfK9K8oeaG0gsYrUDwxkpj6Smw+br8LNwT5kdEdot+9w
	 R2r3YAb4a6bT2CljpKXYNLFT/kpzEkriWbhr+BOGb5nPphpf8ETUTFfVkrOJ/7pURUCTQ
	 8zlT0uD1avHWmdCWfI4swlpJPcKR6hWb868QGA8wZhM0JbWMq4NzNj4idhpMd1AAsj7RL
	 mkl72ZBFfBidwfu2dxESGmWsDBK+0csC4tlfmm5VoMPQDvj9Pm0vuUw4rnFRgTEgslYpn
	 1XsfNv8dAY0BTmLxPAiSKzf8UTvT/d4n1FRSEkCYU9BKKpwlm60RT0yJG2v7V5Z/jNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqPQBz6I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4AFBO4a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EBF606A33A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39EBF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqPQBz6I;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4AFBO4a
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjvKu2155197
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tM3hgV96NjuO6l8RrAIG2WV5+oJMmenUNkW7OKZQw8c=; b=MqPQBz6IIajWmb5B
	qa5qP1MsfTHrrSv5eLuRR7S8Ze+5d+Xs3yw+xObGQUzjMjtghwK6nXLBuDTFYMJn
	NUeGE8n+n2KEDGp7ZcZIZDp5IxCgJb/GIuVo7lXC5sJOvJb1OmMBR6C0QUELk4mb
	ax7UIpn2QJOrxxMvoASwRRADA35Pp57y+sbYi2JW6367tr5BHN4H9gODNJ9sVmo4
	1iTNcQazHgI/JBrncURweelvTDcgjwt29y6Phy1ZdwCCd1LCmJkKF75JAxFisNiV
	haJgLraVKT2AzJpf7dZC/cTC1f3J6kbWKcYe6JsaUN+2b10iKXs2Prr+CoV/iOcm
	1d1RDg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yj42h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:30:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1134429eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795181404; x=1795786204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tM3hgV96NjuO6l8RrAIG2WV5+oJMmenUNkW7OKZQw8c=;
        b=H4AFBO4a4ZYdYYkbOrMq/vTU6Ucu2x+OS6MUqtUIGX6GzcP3yepewoLvb1/Rpj/6ZU
         AM5j3I4aoSHe91Xr1SxSomq6EwDwpnI5nkBhk0XIQpd356fBGXdsv1gmeG3PNLAfqseJ
         IXcaDCld3KeenVdY7tmp5IRdNUfsTl0BLkyhpH3qWwD9MPWgOJyqRWcVCb77EecyHDvs
         +wHuSkAFsOlHzbQv2iTH4VJ5j/aI1NL8arg8xLMA3bOoEdeMlVFEmY3o5qAeUxmUKH9p
         OJPG/Cs7b5TdXqHzsX4IRZAJAQXyK8hn9T8RKNbz7iIplvGQfXwgK2Bj02p1y2yUak6J
         uMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181404; x=1795786204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tM3hgV96NjuO6l8RrAIG2WV5+oJMmenUNkW7OKZQw8c=;
        b=Lq+yqE28M74FnpKJaKcQvm7iDO/kDKqMicIbWzVIDi8lmCEciWxw6/IdKHp6/DFaHN
         GRQYAlXgb3RiL6bExRAfMOpwPwL6FeQTsUx70iYAJfPFn7kSuxpM3iaDEsQ7vhdX8b/J
         Q3JgpSUNrRb2iRYKoD7DLAWKfTjVl+riczlI3/G6/jhFswqf87be5CC3LAtiBr95PML9
         JMAdvLS6KCMpy9NjogstrcoQEEDCxC1gDYbVX6ng/vUWO9Sm9KZS9UFL/u16/NGCBH+F
         NGOaq1lHFCA64IZfEPwJzxjXffHWvL00Rtc6DQBcL5UkStEOfbAsu/sIMW60s3KOZFqw
         N9IQ==
X-Gm-Message-State: APuU4Z8h1cQa2F/oxbdcCJh8hInn80/sgp7r5RhyJVE23FEPhXxyMzkO
	u4jdCkxQTAuwP7j+Fn5WkatZnYM0177jsdnYa6mLO6pGx0JTYnLb7klBME7dwrhdoD7hTaFywre
	9xiNWFeNz0+gaJhCoUnsjqqtVvkUsgOyaZJwsLV9SJUyaZdFbnFXJMFYYS6lqLpQqaF/l
X-Gm-Gg: AZFdTZfBil1dS9zK48Lm4IKVbVJuKPh3lN4VJV66cUvBzgHmzR0GDak18hCZ1HxdLbK
	YBCvVrc4PoQfKzI1oqrIrlG5xyBBVUYi1iZ/nmmIttT0RmRvwIkCAGv00x5RLW65ysjaQJy93H+
	Q25cEeQOaarQFjqH6cJWUy5BgEYzhEKUUevMAXRESZ5up2TQTYQhY/3/u7RwtPnOsDCHHY5cG+/
	U8j3oxeV0/AOU/z+ymND9xlgWCGB9KDLcT0Z0qLmpIz+szdKG0vm2sDZU68a8BEIITrJmqqFX0m
	KAgKb1OLNQtqCjA2TX6fk6vhEDdxyFhe+GfVBAO0rJq+ZS0J7QnLNgHrhoUsTFGKeke9C7NXQuQ
	6R5sv2IsBgWVZ5lOT4AxvZaZAszALpCwdxinXjJtPqFQv8kvxw3Iy09sW9R7I/UEbbazCMpEh1E
	kbfg==
X-Received: by 2002:a05:693c:83ce:20b0:376:a04a:52b5 with SMTP id 5a478bee46e88-3856f65b3e5mr2992878eec.9.1795181403839;
        Fri, 20 Nov 2026 05:30:03 -0800 (PST)
X-Received: by 2002:a05:693c:83ce:20b0:376:a04a:52b5 with SMTP id 5a478bee46e88-3856f65b3e5mr2992816eec.9.1795181402873;
        Fri, 20 Nov 2026 05:30:02 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm7912350eec.2.2026.11.20.05.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:30:02 -0800 (PST)
Message-ID: <b11f627e-4757-49fd-9f7b-de5359273e3b@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:59:55 +0530
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
Subject: Re: [PATCH v6 0/5] arm64: dts: qcom: Add EL2 overlays for Shikra and
 SM8750
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b004b5d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Nh4slvnxYEQyNJDyBJ8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX3b7XNtRpJulc
 42ykYaxvYm2X6XLAynQZMVbLXjpmcbEItlXRIkZHa75hfIBG+nyKt3HQMlVALx7+X+q1pt2ebZ8
 LpVZ5SNyI0i7ngWz1PNYTQUlbuJDCd9fAYK28LIy8a+BcJ5aKP1Oqy+BnSsdTIaq1V3+xIYMZBB
 MGvz6hkC+Yhin26bYcyBCaYRJNEDlsjxG1uhaDKL/64WZphi2OwK2+niQFVEfezcHMPjMKW7Hgs
 ZZ7WB98yLpKuk1v/aBWuCZBnRg1juAqCDKTlYkpOBYivbuzTLJ9D3tu5HApnMGX++5iGNriNy1K
 dKu48rMtq+ijAJtWxPHqLAHtGyCyyAU7p9RCZaoAqwGBu+CwRjlHOgu4WCKOL2b+DcmuULVRo0L
 0OUdOxw41zFL7nNnYaPmRsrEY+ajQzKWKt57OwrtQPDnQUlENCQyR4QWa/d4m8jH/2/999mGmGy
 3r0qIQoXwdhAPwESSPg==
X-Proofpoint-GUID: 9X5tMvHi-5blVhBSA0IltpkIplyZuI6n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX4qP7nTr2c7iG
 3yW6V5TUtcLUKV7nhuOJUyMltur9eMZj8wtwssJOBkRgZJfE8v9u5JM4KtC1VrkK5+fHpbZgR1x
 16mi/5yXSIfj3vke1gzis6FhZV93XfQ=
X-Proofpoint-ORIG-GUID: 9X5tMvHi-5blVhBSA0IltpkIplyZuI6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

On 11/19/2026 5:13 PM, Komal Bajaj wrote:
> Shikra EVK variants boot Linux under the Gunyah hypervisor (EL2) by
> default, with Linux running at EL1. Booting Linux directly at EL2
> requires the remote processor firmware IOMMU streams to be described
> in the DeviceTree used by Linux.
>
> Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
> generate -el2.dtb artifacts for the Shikra EVK variants alongside the
> regular DTBs.
>
> Add a similar EL2 overlay for SM8750 MTP, which also boots Linux under
> Gunyah by default.
>
> The series also moves the Qualcomm PAS remoteproc iommus constraint to
> the SoC-specific bindings and relaxes the item limit to accommodate the
> remoteproc SMMU mappings required for Shikra and SM8750 EL2 boot.
>
> Komal Bajaj (5):
>    dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>    dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
>    dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
>    arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>    arm64: dts: qcom: sm8750: Add EL2 overlay for remoteproc SMMU mappings
>
>   .../bindings/remoteproc/qcom,adsp.yaml        |  6 ++++
>   .../remoteproc/qcom,kaanapali-soccp-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,milos-pas.yaml   |  6 ++++
>   .../bindings/remoteproc/qcom,nord-pas.yaml    |  6 ++++
>   .../bindings/remoteproc/qcom,pas-common.yaml  |  3 --
>   .../bindings/remoteproc/qcom,qcs404-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  6 ++++
>   .../bindings/remoteproc/qcom,sc7180-pas.yaml  |  6 ++++
>   .../remoteproc/qcom,sc8280xp-pas.yaml         |  6 ++++
>   .../bindings/remoteproc/qcom,sdx55-pas.yaml   |  6 ++++
>   .../bindings/remoteproc/qcom,shikra-pas.yaml  | 28 ++++++++++++++++
>   .../bindings/remoteproc/qcom,sm6115-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm6350-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm6375-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8150-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8350-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 30 +++++++++++++++++
>   arch/arm64/boot/dts/qcom/Makefile             | 15 +++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso      | 33 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8750-el2.dtso      | 30 +++++++++++++++++
>   20 files changed, 220 insertions(+), 3 deletions(-)
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

I have addressed these comments in v7, which is available here: [PATCH 
v7 0/5] arm64: dts: qcom: Add EL2 overlays for Shikra and SM8750 - Komal 
Bajaj 
<https://lore.kernel.org/all/20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com/>

Thanks
Komal

> ---
> Changes in v6:
> - Define iommus with a description in the top-level properties of every
>    binding referencing qcom,pas-common.yaml instead of in conditional
>    blocks, making patch 1 a no functional change move (Krzysztof, Mukesh)
> - Reword the commit messages
> - Shikra: allow up to three iommus entries at the top level, require
>    three for LPAICP, allow one for CDSP and disallow iommus for MPSS
> - Shikra: drop the per-item iommus descriptions
> - Add SM8750 EL2 overlay and the corresponding binding change
> - Link to v5: https://lore.kernel.org/r/20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com
>
> Changes in v5:
> - Declare iommus property once in top-level properties of qcom,sa8775p-pas.yaml instead of repeating it in every allOf branch (Krzysztof, sashiko)
> - Add Glymur ADSP/CDSP compatibles to iommus conditional in qcom,sm8550-pas.yaml
> - Add sc7280 ADSP/CDSP compatibles to iommus conditional in qcom,sc7180-pas.yaml
> - Add a description for each iommus entry
> - Shikra: list three entries for LPAICP and drop the iommus property for qcom,shikra-mpss-pas (Krzysztof)
> - Link to v4: https://lore.kernel.org/r/20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com
>
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
> Komal Bajaj (5):
>        dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>        dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
>        dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
>        arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>        arm64: dts: qcom: sm8750: Add EL2 overlay for remoteproc SMMU mappings
>
>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  6 ++++
>   .../remoteproc/qcom,kaanapali-soccp-pas.yaml       |  6 ++++
>   .../bindings/remoteproc/qcom,milos-pas.yaml        |  6 ++++
>   .../bindings/remoteproc/qcom,nord-pas.yaml         |  6 ++++
>   .../bindings/remoteproc/qcom,pas-common.yaml       |  3 --
>   .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  6 ++++
>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 ++++
>   .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  6 ++++
>   .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  6 ++++
>   .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  6 ++++
>   .../bindings/remoteproc/qcom,shikra-pas.yaml       | 28 ++++++++++++++++
>   .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  6 ++++
>   .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  6 ++++
>   .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  6 ++++
>   .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  6 ++++
>   .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  6 ++++
>   .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 30 +++++++++++++++++
>   arch/arm64/boot/dts/qcom/Makefile                  | 15 +++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 38 ++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8750-el2.dtso           | 30 +++++++++++++++++
>   20 files changed, 225 insertions(+), 3 deletions(-)
> ---
> base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
> change-id: 20260918-shikra-el2-ea8969385c3c
>
> Best regards,

