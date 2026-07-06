Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A363BC664
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326779; cv=none; b=Nk1V1+ukI5oEvmdaW+my20y3Xjk9kib0+ZRmElVKOJBnq87G+yiW2eXbWyw6KLAyNpZDnioFcHmpDmD4WSLdrBZID401nObRnSLvEbFAJ9X2dS8psiqf7rkNSASnVFFPuQ90jKMioVZdXJ2yIca4iFaREvIhGiSlerGY73YKuKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326779; c=relaxed/simple;
	bh=BOh+Hb4ZxI0byKHwLdu1YMSdOQ8nQdY5hZERfclrwks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTJT0/s1ISBm19LVdDrSGB/VsX55UsCPtKrGZFxeVL4lEI/lZm410rg4hawbJRRdOKPZQk4tQ7KDxJHEGCUo62d4gM3WIWRFx8bJp7Evh+ssiQYC9t+tQ3eF5hSIUlAi3D4Lu0FVVOOkdyaZvQjvaUDvNzOc77NCWrBG6hET3v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tt1g9aWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrwL+YZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt1g9aWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrwL+YZJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66642CFV3618319
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=; b=Tt1g9aWRdhyI3BpO
	bvxcoGq7kYOipwI8sI86zxkmNdiblCbEIIy0D6ekqZISLjLM2a33y7RzY76GbicN
	Opq7MS5ZQyamKmgeZkedVYAFfw1KRPYi8hl3Y7h7kuir3yf0DUot7pMFqfcV2RX7
	X6ly6HXPcg70fqU+dH3N/iuMe5KE0DqLRF0s4qeJ6w03zgeEubZlkFJyH6FDUo2t
	Et+Ig2j6kpZC/v51lNaj0P+xbzzB2QuKkvGbM4AuZdQSxZloAH/4eroeiJwOgPxx
	kOehTF0x3+rZPy9CPDosN5R/kMP09AyBofAR6Pe/VMGVWMs1S1vCPm7OD23UZkSl
	ZSPxow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64ndwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:32:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c298a1b20so5786611cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326758; x=1783931558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
        b=RrwL+YZJ5eYHO8zvSFvL7oh+HhM3IlZKXjVA96grBUP21/5vvLDpZVi6mGocVpMVQI
         En4wvnUBpKsKdPUB6cbY8Eg3AOX/dzi+55OFQesuE/nY+nJMBtKwIAqNLcCVhqWr2ZBn
         5iU7rZ/VBeb0KW7tOZO2GSrDuZESmXxc+tdp3RGGctNka9DcihahQeAqVo/BXcPKSeAR
         NtAGhq2JGqHVbqUD7flsqmYYU1qjZJ8iU6vrYotu+Rw42K3pbJiiOJ2uNKGY6eMtdLgZ
         4BJRmb6wxhElkHOGHwaV/t+WTjDFDdYLQrCsHRLwoR+CyHfufqXItcFLQ95AN9vTkw+e
         hB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326758; x=1783931558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
        b=ZnKQojvIPXbPm9/C2t4ovZiX3osTT9x95zz8AHhHcyqjaQS+faOGvH8WIJDxHd1x6L
         WbDiXnLKnQwggTV3XkxqVfoq8qoUgLKVWvSM65Mn5N4rGgqZx5Wx66PFjcxT+knFydNx
         KPp9ZEapF4/qiUrUdsBLUhEZukGXlXn+zJ+EFjev+9B8trOY6RAt6zwKY6GVQp4Gu1Hl
         AfH9iIFahyVPn+++2zYvgS9mdTgGevpepuD4YxKF7CyLJm8vxG7EoRVcjg7RZNHIETE1
         Kb/rZmOtLoBI0LEOs0oL77V49gcPv10LBBenT9bAZxETnnErBB1hF3UZ4QT66n+N0Xfe
         b6Mw==
X-Forwarded-Encrypted: i=1; AHgh+RoGHJd33eC8C8ofjIVhdrJC5PHysBJLj2MMQHURleLX46vD3EK5dnsVub0tm40jFw5pwaCCUsYwc2va40RL@vger.kernel.org
X-Gm-Message-State: AOJu0YzivHkCl9zyYHEHhygYdee8p5+COk3jHB+sDlPAp86Pw0X6IhC4
	bIqKNZDzKQzHlK/1DVdlkRhBMFV0Mws3F0WnJfJvmqaWe0ECJHr5X3niqxQQpN34XkC34Gc80Eb
	ZPzvnJbhWOKPTvVgN5aLhSNFKcP9VcX8Jsqwd3Khs6OQE/JHlvGbBz0spFuLZAE60y3/w
X-Gm-Gg: AfdE7clSD1RBzw2wGRgsyxEM4bAas5SS3xjZCAB5e2KPaxejC41Q+cWkAj8XI0QSjki
	4BKflGuIxcUfWOOc5NsTgMJKMyPPkLDw83xRKy8se/PqIYICcss2tUn565VVh2o5/Gn5pTl1UvN
	hk/dldoiaqSdrr8Vcb/uA+yuU1K7WGoZndw2Urb2PAPKUFX1ryUrI3kx2qKAeLqUGMdbzC7anuJ
	STFg8lgB0ckRbS3B72Oofhl8b8PbCEravfB+tXZr6chibzQM/wR3sHMr5WxJTf47fGZUCuEJNGZ
	Wcwq8RdhsVnGXq9pctWdYS8zpdHnzGFwgg/yoByoWY5Vp0qc7VRhybwTsNJpXIX7sQTPsioTWcs
	V8lK3EN32lBc76aIn7L10o9WVuez6DIBMrfo=
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr79016711cf.5.1783326757987;
        Mon, 06 Jul 2026 01:32:37 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr79016281cf.5.1783326757507;
        Mon, 06 Jul 2026 01:32:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6093786sm694743966b.20.2026.07.06.01.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:32:36 -0700 (PDT)
Message-ID: <f1e7ef14-7186-4854-a832-a34596d3313f@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:32:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/42] firmware: qcom: scm: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin
 <abrodkin@synopsys.com>,
        Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon
 <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXwSdy+3vCgooM
 ClEwp72y+8VktdhmSAAZoMN/jfVRHuVf50fcbarXR0GjShZM5tU+g3Bu+m665AtPvoGJFePRLKE
 2V0M1h2ilkHxStVj/W8hKslV4hOFYtvpgwg+H6/3PEXu3Aq8jQXpoPKFLX7bR6UHeRY8nsfBYJE
 29MOZvgJqYE3V6qSaeJYLrXh7R0OnrQ9OKWmxmwdq7KCf6ggRB/uJnVV4m/Q1ROrLnoX+vO9hYG
 aYJr1qu9FuMwr8yTmWcxk/GWXc6qP4jn9im+Zte8A8xUh+LXHQgu92AgSZSRZm2P5LH4JyEs2a1
 ABRSqGy4cXTANELtvioQKb25ij8R6yF11NIYMxF7HMsT1J5uPG701hxXFUUFvCC8alVeM17+6W6
 1Y9KWbZhvNhfU3eXAhsWZR6Jbrdsfp1QHv48GDC/Abq3nhTFOTibFcN28G8t4sCFAh7Q9/QFU16
 gwBCfhSd3Ib3xkPCqXA==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b682f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7yxQZbK4ublJ3xJh_1MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: XaYG1uaKAWW8nsu1i5G-qm6fjnVLYbIl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX5bF1uQnDdk3Q
 Qhwis8nwd7FjJPi+13mtmVv8Au3TvEGNZYV2WuwUHmAwZRYev4rucihsRxFHj/zuiCHJ6Zy1chP
 AlR9M7cZMR+w41e8/Mj2ic71BkEW14E=
X-Proofpoint-GUID: XaYG1uaKAWW8nsu1i5G-qm6fjnVLYbIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083

On 7/3/26 9:38 PM, Mukesh Ojha wrote:
> Switch from of_reserved_mem_device_init() to the new resource managed
> devm_of_reserved_mem_device_init() so that the reserved memory region
> is released automatically on probe failure or device unbind. This
> eliminates the err_rmem cleanup label and the need to call
> of_reserved_mem_device_release() explicitly on error paths.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
