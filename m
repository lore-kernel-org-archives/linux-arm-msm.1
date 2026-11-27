Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773535;
	b=WsDcqF1JMbcToGKV7HaqASPes4/MFaf54fHm2gMPDE2tKWYu9r63kNrQeN13lRvSlXsG
	 7zOkVZXColYTbLxG9fzgriBJklFzUnMzhBlJUXH9Q9JWJIJnm8H9xGJlK0cb4QA8L2L4b
	 V0lki+wl/vNMADx4EkXkLD98ZxRvLREJ3yrH9FO7VdAOl7oqe7xAO2pcBBtbvn98Bm4jp
	 5AWZkTcmvuz77rhvYU0pRrONhUwgUJeYcaPn4N525jDzJFgOe+THYFJs+yRTvHVF3ZNUy
	 URZggwUCwRZe80iPZmjSFUFx+obUB/kr+EZNyLZWHWTiXV/UB5LM0vpmoOqZWUipG9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=;
	b=IeqIYgXJAu1vkDJfWK0B8HnuBFOtYaFQdcq1iFVvF82d/iVN6Wpj7qPgPAyK/ut4SOGI
	 hF4Rde5hJfSuutYtZvyOaaIlteVSGy8gGR12cryKrfV8oDKkTlFluCRVE9AwS73GstuYc
	 ytQyX+XANAQ1ylpKwapoksludZRZgZPKgdZtkKeuk8B7bKkYNzqRsq54aDyYO7KWRPvCg
	 k1lJsR0axkHmEsfwMOEa5m+9FbZX7qefSTi2vK18TxcVIZF1XTjwmgg7DkT7e+GlLt9qu
	 eFn2D98DOYC22EvjNb+tJqcfUkhZtayr6eWNPgwNTklm8U4FcH4yi0yk4FLx7ezeDXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FFYXB7KP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Om9ISZoM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEFF606A338
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEFF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FFYXB7KP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Om9ISZoM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gijj1475496
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=; b=FFYXB7KP8bTOV2BX
	lHqDSuLFy+ONvVxACTAfcO0CcPvghrqu7cQvU0hJAHg9izRSew5SHNQzgloU1tOt
	2ejmJYmLrByKMWSeaxUw4wR3RQHQMp7S03a0/34G+21mydxjgBKrsnjX1dMNjNU3
	mqqU1wfcLhX04/++MpJqONfGqLjQ9h0L7MhCyGqQZIxnugM7FEDhjmAhaWKEdsen
	DFNQB62BMjlqxaMO0Twx9+7tQGgx27NVUPqSuPBGfdKWc0BgsVJE7DxEeN0ZgGXE
	rUWTKabL5d9fZLwjmLDdh3lOqu1DZcML+B/hh+ynKod/01PQDsT7K7vVmGntxHzz
	VU42bw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4htevx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:58:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb90a6230cso3891925a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773532; x=1796378332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=;
        b=Om9ISZoM8xPlrkjpsFmOwEo76V768up4OJyPgSTqE2bfXov9FRnT3cWhWieHJgG7Vx
         c5BBRX2hNeannTjwOsDoqGjLiPFwThhxFaEDkHKzjfuzL9mnLMQ40vQMFfv/Jh5q/Q3/
         g+4LHpGKCurvBwEJ8wnUF1Mu5WKkGNHRafvfAuL+qHtMA05wHkXLr44qH1+q0r5bt7KI
         IMNRdp+D+/71FOvVSHrBwkWMHbVaqeH+rSlhHCxHhFeR+IvKrDCCQeRuQwvsd6QQUTPJ
         hqbuq/D+v1Al5LL3W15d0kU4Nnokj5LNQrDhRiN9jVy8c9fseZ3whAfY3qn7MDx0gQd+
         TPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773532; x=1796378332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=;
        b=mC8tFJBjNx2n9S26KfhRX48ew8xCiKkm663AHtf4RokzTvtRPRkcoL6bt9SA+Q387R
         jxP4+kBg7V0q13yKqvapW6tuc7f82d4byIvflZLXzGyq0u2bojMhsnM6uPFlVO85vz/1
         M1tI3dQVZ9lXqp+Knq3RhfBIgjNNYBoe8st/PtgAh0vF3u86K8t1aksKhUsw61fv9H6+
         BkogjmtFpZF20uKaW7PihajfkTgJI0ZPe+h2kC8DND1HbnuC0K1IXP62XB/1Rb1UVdb8
         QcoMZ5RDusQEL2SKu8yFngQ+giuYftUHl6QUGVGZwvRpSUxYJnTCNAzf+Td7ix99Po9M
         eN4A==
X-Forwarded-Encrypted: i=1; AL+hErHJcTjSfM/xjPhsb2NCnZq0WfDOSaFi1409/daMqZQYrR7DCsPUpxSCYW7u3v2iunlHNsVJsNSCr4LqCJ3T@vger.kernel.org
X-Gm-Message-State: APuU4Z/OPRay6ajWi+dVYVrbDgPX72p5OgWd3uGfoIW9I5w8lc4mJGYQ
	w/0WTasEDzs3UHv/ZDClOtJkU6mcoxROG98lbLUB+3VumOruoV4Z2LziMbIhJC48jyLszLmWiP2
	nklrZkXjoZi+ctbpG8D0i5vlGfCaahgW/NTIYuGoV+tPTEWIatgt9489RTyf+6H6UtxAn
X-Gm-Gg: AZFdTZdANHNep9fsUSvbgmkGKOuGO91AVDtneDwYtYzx76zXCWfSQlgO2v9XR3TFXLm
	Dwgs2UEVSThzhcPjIq39VcdtXxRwzOs6aIptlJ4Hg6twPD8E9J3q8bOmrnDPEjsG6Nf/CFRKXwc
	ujHf4TTkw9uEXqaquonVH3ahuuXiQHEnfR79bTuBSJq6qwgZyCT+JBP6lmkJGKK0/g00McdvEZr
	Z254tBIym9HF7fWYv/md5T+vQjP6tq28ws12iN8teippZZgRY+I5EA9RTfgRXr2vnbbrQXetGc4
	yAv4YDJPtRzgniPot92iGgYPmzwXUMVZ8ewDo8HdHPbMyH4ONj7Sx6xAxOOCn36V6Wnt/jxy1w6
	WBdJSGRBpt6y1EiQbZJwEwJbI1nP41aKCnRQhDsqfjynQYPJcWH0drnSJSRt2jdj0wvI29FOPke
	XCQ4Wo
X-Received: by 2002:a17:90a:e7d0:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b41c8d4881mr20897574a91.20.1795773531600;
        Fri, 27 Nov 2026 01:58:51 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b41c8d4881mr20897555a91.20.1795773531067;
        Fri, 27 Nov 2026 01:58:51 -0800 (PST)
Received: from [10.204.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm21547994a91.10.2026.11.27.01.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:58:50 -0800 (PST)
Message-ID: <8ec59e5f-c476-4721-91f7-7fd3fd1018f2@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:28:39 +0530
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
Subject: Re: [PATCH v3 5/9] media: venus: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX1pv7ZNF8An6f
 /I3x/iLRp5bwWQWG4rrzDIIq2LunW+R7l4+fgF/hS3FyUGhxS2WYl5YBIMLq6eZCc1m9rBFDhHi
 sVvmm81qyMr3ir5JwfWk3L464yY9LPw=
X-Proofpoint-GUID: Jjj7UEOVX2gVN3eFrz8mxsW8gr6T1ovW
X-Proofpoint-ORIG-GUID: Jjj7UEOVX2gVN3eFrz8mxsW8gr6T1ovW
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09545c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qTQABE6tYUUe6KctvrYA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX0mxmR0YPBhnR
 KkaMqfCaLC1ut30jLbdRPw40UlT+d8mCd+zhOSv96XXRrvI55rCD/c5Ae1ss456LAe3ayaaO5pu
 MELXo2o0ZQTLKtC3skFh+sw1EXjqHFJec1e4TkisxnLBto1APAfzzeC3FxKN5qM7UU7OS+Q1TeB
 I7Lt8biRW4M7L85a3Y3I8Ln95EB2IsyYgsLpp6m1CY57VOMg7WWeLQYU7vgYf+J8n6qpUgsGLxW
 mlO9rfdN9o1ATtClmHl2ZWJMHm9pCo7Cx6u1Rqjy/4w3fLDLSwYEYaGbsSpsmGUwN+nDimNnyEn
 8XJHY+GbnY8Z/ObJTpbK9Mt+OaoGmvSk8Sw/E490NpPxOrkMY8DG7gSPTvOtjW5bBMyC3d1pZLJ
 XgWMPaSWI4oiytouoWkzxuIw2+nm0R5L8dd+jwBzSEPzi8YrCifk0lfVw6qKPEMyxZLL1KX8Ztx
 h58OEJRpOKDyCntsegQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039



On 11/16/2026 9:51 PM, Mukesh Ojha wrote:
> venus_load_fw() calls qcom_mdt_load(), which bundles metadata
> initialization, memory setup, and segment loading into a single API that
> does not expose a PAS context. venus_boot() calls qcom_pas_auth_and_reset()
> for TrustZone authentication, which is the intended behaviour. However, a
> new qcom_mdt_pas_load() has recently been introduced that works with a PAS
> context and can handle everything qcom_mdt_load() provides, along with
> additional functionality such as shmbridge creation and retrieving memory
> from the shmbridge buffer when the same remote processor needs to run while
> Linux runs at EL2.
> 
> Embed a struct qcom_pas_context in struct video_firmware and initialize
> it with qcom_pas_context_init() inside venus_load_fw() on each call.
> Replace qcom_mdt_load() with qcom_mdt_pas_load() for the TZ path and
> replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
> The non-TZ path retains its memremap()/qcom_mdt_load_no_init()/memunmap()
> sequence since qcom_mdt_load_no_init() requires a caller-supplied mapping.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.h     |  2 ++
>  drivers/media/platform/qcom/venus/firmware.c | 29 ++++++++++----------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 93fa77f05834..84a0d4a8426c 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -10,6 +10,7 @@
>  #include <linux/bitops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/list.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -228,6 +229,7 @@ struct venus_core {
>  		size_t mapped_mem_size;
>  		phys_addr_t mem_phys;
>  		size_t mem_size;
> +		struct qcom_pas_context pas_ctx;
>  	} fw;
>  	struct mutex lock;
>  	struct list_head instances;
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 3a38ff985822..704343e241dc 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  		goto err_release_fw;
>  	}
>  
> -	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> -	if (!mem_va) {
> -		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
> -		ret = -ENOMEM;
> -		goto err_release_fw;
> -	}
> -
> -	if (core->use_tz)
> -		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
> -				    mem_va, *mem_phys, *mem_size, NULL);
> -	else
> +	if (core->use_tz) {
> +		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
> +				      *mem_phys, *mem_size);
> +		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
> +	} else {
> +		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> +		if (!mem_va) {
> +			dev_err(dev, "unable to map memory region %pa size %#zx\n",
> +				mem_phys, *mem_size);
> +			ret = -ENOMEM;
> +			goto err_release_fw;
> +		}
>  		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
>  					    *mem_phys, *mem_size, NULL);
> -
> -	memunmap(mem_va);
> +		memunmap(mem_va);
> +	}
>  err_release_fw:
>  	release_firmware(mdt);
>  	return ret;
> @@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
>  	core->fw.mem_phys = mem_phys;
>  
>  	if (core->use_tz)
> -		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
> +		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
>  	else
>  		ret = venus_boot_no_tz(core, mem_phys, mem_size);
>  

Thanks for addressing the earlier comments.

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
