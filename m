Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774141;
	b=xeQ1pq0/r9PR5uEfDiX1mQXxDQF2qVwLBk5npvqj0ZDBmRXaYz6DlzB5xnuzwOUH4tJ7
	 enacnLTb5sZQZzIcW3E3DZenDdLpRfPYpVryvAssYJW+a3J6lHTpBkV4psCk3EsusdXr/
	 djVxVdlthUXYeMLRJQ4jSjn0o5eGAjhNw+SJau0p8sQ54QohjpXy+qz3KAczdyzCU0VsK
	 Y1bBsn8wexQHmwlh4Vf1ucTjMYdpmUaunwTpGSmtt8AbDddpFmItTdMT3XE+lYIIyyiHo
	 PKJ7OW2lUn2pJmoqn+2CKpNbiFv0Gl9XWKdIJdg8wEpjgcrvl9zTN7jXyw8F828Icjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=;
	b=z5X3w0P8AcwiV8lV9Rz49entqzym8R5kK/oz/mIT60APUzU1Rid9XA1Xg1YgI1VeMBTy
	 BVYLOAUKa6kvzEOgaXHzrW3cRIotvZDrPkPflttXI+ZE5JOorgq6ISZrdDFcRiO0PuviG
	 x6cjyb/+QIuVfVpm9FC0EQZCQLqUsZ2cle9XlPwPERWDjkeudIZ3NyEzfbiW6Eld4gGis
	 2Dub35uhbhXlRjOKK32fd7BE7qLnbcoKePpz3wNXwM1YHEytlc5IiSW95RO+7bFaSbWb3
	 zz4fP3eyzyOFkioJ/CnZQaUmgvYJ/T71/CohtlQsfCsYUY0AicRbnaSO3fAk5ih7+AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EaV/RRhH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EgLAE1Q+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9579B606A33F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9579B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EaV/RRhH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EgLAE1Q+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gbgx1564716
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=; b=EaV/RRhHnPtzMO1X
	UWWTdxaQV4xaqoCvSX9qEt5LlmEHCdBKWOCsiG8j3j1H07pLiOeZMg7e31DqTGBf
	Z9+E5o0GtaIJuwwVdYIO1ZT2oyUOivgKjiGNngR0fr9pw6jRlL07YRmowvBkJ0jO
	wUW9N6vRxAHMgk3fMq1wqLapcqjNQ+BPK0ABIiN+/HUmf01Q/UxH2Tb6HgIKAnUE
	4VyjhwSdhjeq7OmUFv2wCa+hTL/qneYSocn10A8YRL8iKE7Gv00MxkON6fR3Skjx
	6zmk6/holfwIU+zlIJAHwJKxy/8AzdqduY9ZkDAWgHH9jZYPzDL2cmGPiVsmguVa
	fg/d3A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74garwwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:08:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so2644639a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795774138; x=1796378938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=;
        b=EgLAE1Q+M/67GsEL5D+SS/BC3URMOb2i7EqkCL2Y4HnsW3mmVY+W2j7a+9Q1CITE1E
         E29eMdFMRGUTMjTP7uxDUOh6BVlBXaZ6a4x1y8B2orx4BtcS6QsXsG6ClxQgzVJVFvbE
         yCclS37AfdjCrhmBCDTVBwMRIN5L23PfVMOcGW2/E3sYZc3MLspsxCoSOSqHNrGHb/dl
         JWw8rYc67FU9MeVvUWh/G2vsd8rb5QXKOPcRV7JW/UWBYf8q2yonge/ra0kDk1We+NMQ
         6uciHsJCwXQt+LRtLnPP7bWQi/4lusdim4NVFxpm0W2xBpst7pZJNenSWz/8/IDDftm0
         jiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774138; x=1796378938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=;
        b=JKzhU/L7lq3cjUl6LsThRTuLT2M2HQPC1rx4y6M9/tBcps15l9tdgt+M4+juHZVeXx
         DNlFDKGAMDdgV95Dx666De7LNAwbgWd1045exoYLQ3cRvgEpjV732RuNL5Q0dT0P5rKy
         nUI2XmS84CZNYc2A4VyUUYFZMx3Fzm1e2p9fkBDvjAoKtNkzZQWGuinYQ40WISH+YAoI
         Ic3U5L0ktWwc/VD5unr6pIB+0jKapkKxeOkTJDlmJWxuTsVRfjjmLqmPEHIBveYY+Sdo
         VYFxv7pomA3sEM5RL9ww0DuplrydPIfJy0rc5NUoryhVRld0H3GapNLJSykTJIQh9F2K
         IcCA==
X-Forwarded-Encrypted: i=1; AL+hErFD22zFIIvMf9d9Gy6urA6BiaFK7si8GJxfhb8nvLbG+5nwpIbPU2wmEe4pGYHD+tyhe6k0M8izsQzMXdfz@vger.kernel.org
X-Gm-Message-State: APuU4Z/qlgYehYZiNyflnbgpDXiT+qZBJFvA9Kd5VVpR6fY/ZQXMpghX
	eU7yom8NUU1rv16QTltkylHDDIJKaSkw4mCirONhghJuMG2Qpkgtnq59MOogP2Y13NoD6dWVjs8
	0Bt2nLdLit7gCdMV1cRdP7bH/RosUJI9GOp2Ul6xm+U2H4XmsG9SkqoE5i7pFcxfVRbUc
X-Gm-Gg: AZFdTZeZW4D6GiIF+Spiya88gcAr8/ktIzRQkbP/A8rNbgNnumJQ+OB5MXFr2uN2K5I
	SdaieC5FQgR0i5oGEsy94ZyKxfHq+VKCqUxljpt46g5nmt8vDOaCmIiADRovgwb9yGMjVFmfM3Q
	S2C8wv4AAtTAxO3+oGuKxL/5ueltzDe2GGUDELm3ZSROFH/MXzRdFJmGB4eQoAQMQcRWIxQtpqc
	mJNdn55AQfo8iCmQIWyqHIMPHOiPCtARADuo/+d6WTnvN+11xkfxrIfycgVo+ET0W+uo5anJe50
	jRqJndxdjEIwcPxARadz9zUV/Kt9HzZCWXz8ETNICu3xqhUJAtxmx9SC0tuXb6QJk3XzlurhEyg
	+2t/5ej3T74DEoRaiaasN8ZPay8nK0SpcKshdvt7xHtTF0QiYfezMKxzvPNdMHXkt4IWStRXPEa
	MaaBHr
X-Received: by 2002:a17:903:4b2b:b0:2f0:e66c:4c42 with SMTP id d9443c01a7336-2f0e66c521bmr73777195ad.42.1795774138351;
        Fri, 27 Nov 2026 02:08:58 -0800 (PST)
X-Received: by 2002:a17:903:4b2b:b0:2f0:e66c:4c42 with SMTP id d9443c01a7336-2f0e66c521bmr73776695ad.42.1795774137878;
        Fri, 27 Nov 2026 02:08:57 -0800 (PST)
Received: from [10.204.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm115589195ad.9.2026.11.27.02.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:08:57 -0800 (PST)
Message-ID: <a07186d1-2c7f-483e-ba02-74e4cd078b1b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:38:46 +0530
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
Subject: Re: [PATCH v3 4/9] media: iris: migrate firmware loading to
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
 <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Jf8g9W4vlNtcZuEqeQ_MsFehkK1bgWYX
X-Proofpoint-GUID: Jf8g9W4vlNtcZuEqeQ_MsFehkK1bgWYX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MCBTYWx0ZWRfXwx9Yi+Kp5mLL
 zKrpQ0Ay9KOAqVbOZ3rCUA2MvnHavTVBmmO64xHVkSjhBYNKtWgLr5yPKohZeuYhQWttdSP4WR2
 pG0zh5c1S4nN1mhfbgEcF6PdVDzt0I97pOnvTs108yVPN/vXjiv67uS/Qw/5cKJ7+OodrJVe+8C
 BbAYCuof0KpdrQBBJQFBzNnQPmRBSCW4dJ6wIV+3fXgIyTCeM/UmHmnPC+cd5UaTt5DqyfwrwUX
 tIpTeblr/cLy8res+cI27v4bTkS1hWNxCk5ZjIuCHaAdApsRuKTxcCx59Fgx3o7Hwz2IAP5A/XD
 PWKrTeUNhKfajrzq8R6TElWUHXY3wk9+vUvZgzKKCW31nVhvYnUa9X8kkXs44VyZj7Yski60afY
 kJpWZn2omkniE1A9TpjznwQgHRoS+aX+Adj3E9XBYKbQW/ZoODzTxhP+ZoYnp3Y1UmMD1MoPPgJ
 wDc+ekkb96A9csRffag==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b0956bb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=F4YNwraytLJjv4g9V0YA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MCBTYWx0ZWRfX0W1scY2r6ZUU
 weDFQ4ZTjJGD13ic3p6AuiPifOKLsDFWNx+V/XNYCFhsyOXTL5gkBTlSzAFohU07QBfSzDpMuml
 X5xy4fKOjdYUPpuYC7FMvsd5mu37DT4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270040



On 11/16/2026 9:51 PM, Mukesh Ojha wrote:
> iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
> metadata initialization, memory setup, and segment loading into a
> single API that does not expose a PAS context.  iris_fw_load()
> calls qcom_pas_auth_and_reset() for TrustZone authentication,
> which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with
> a PAS context and can handle everything qcom_mdt_load() provides,
> along with additional functionality such as shmbridge creation
> and retrieving memory from the shmbridge buffer when the same
> remote processor needs to run while Linux runs at EL2.
> 
> Embed a struct qcom_pas_context directly in struct iris_core and
> initialize it with qcom_pas_context_init() inside
> iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
> with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
> with qcom_pas_prepare_and_auth_reset().  The
> iris_detect_firmware() scan retains a separate memremap window
> after qcom_mdt_pas_load() completes, since it needs to read back
> the loaded image data.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
>  .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
>  2 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 3e4cf652bf39..ac73bda072f8 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pm_domain.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/v4l2-device.h>
>  
>  #include "iris_hfi_common.h"
> @@ -129,6 +130,7 @@ struct iris_core {
>  	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
>  	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
>  	struct dma_iova_state			*iova_state;
> +	struct qcom_pas_context			pas_ctx;
>  };
>  
>  int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21f57d37da18..b701a7f43514 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  		goto err_release_fw;
>  	}
>  
> -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> -	if (!mem_virt) {
> -		ret = -ENOMEM;
> -		goto err_release_fw;
> -	}
> -
> -	memset(mem_virt, 0, res_size);

Restoring memset() is needed.
iris_detect_firmware() scans the whole res_size window for
"QC_IMAGE_VERSION_STRING=", but the loader only writes the firmware
segments, so the rest of the carveout can hold stale data. With a
firmware-name override on a platform that has both Gen1 and Gen2
descriptors, this could make a Gen1 image look like Gen2.
> -
> -	ret = qcom_mdt_load(dev, firmware, fw_name,
> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> +	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
> +			      res_size);
> +
> +	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
> +	if (!ret) {
> +		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> +		if (!mem_virt) {
> +			ret = -ENOMEM;
> +			goto err_release_fw;
> +		}
>  
> -	if (!ret)
>  		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
> -
> -	memunmap(mem_virt);
> +		memunmap(mem_virt);
> +	}
>  err_release_fw:
>  	release_firmware(firmware);
>  
> @@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
>  		return ret;
>  	}
>  
> -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> +	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;

- Gourav Kumar
