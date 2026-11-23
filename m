Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468179;
	b=AOjXoMtWHrjNoGyUNXBiHqx8Izn6uFS5OpuIL93JXbH3hRDr4epYxDif7Q05sPRpGPml
	 WQBQCflfF5HzI5sGlD+Nhvi7Dcznvehef1R+nBSCS9AKeM67r/88YH8f+E4mxvSNTP3D/
	 jycSkLW3BGylVsT377xg4OadYv4toa7sXKNm26OfR4467sranXRuZJ4aSQ966U14uUOgh
	 PrnQ3B312B/X8uFZ8J4kl+z2X1SaU37QgY0dCJkrhnAA7UjP3OKW1470WfX/Vzg/nwj6z
	 HA9v2gndnT5UdAtGSpHo8Uh4sjm5DupCcLQwFNOOVR1tNF4JqNPryqrTXblRA4NvU3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ANnf0uY5iDkomZkh+ngxY/U/kEJUmvmc53h0kbXzIDE=;
	b=t7Qm9Jst6vUlJqpML1MRA59nZC/qS3zO3ZzVO1V2WJegSKwAO26mAYm2++6MQO8WLHIO
	 eja3qOOdZ92bisa08zE6Bzd6bWEkU/DeUyFk3Rpiv85GJauzgrIghWgJx/7U/LGyLpHKa
	 uyOPa5GsFg30oVqO19eeFBg3evtIpG4WSsgcsnwpzklTl81eL+Z/foveWPm95vYyDH8Pg
	 IwSqdKq1p3i1MqpxYcAmwamXJJCh4K+rI3MP5TFVeloPUTejkeqlUi9olXE3ugNJBqkv8
	 KDGrEM6fv0PGfyrzrUpL1ZrDo1I321pfyiboogm2kwaSnDgv5ouOLkILuKqq7XG/I0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FuQsaC1i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yv7ZK0EI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5653C606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5653C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FuQsaC1i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yv7ZK0EI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJui0h3962917
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ANnf0uY5iDkomZkh+ngxY/U/kEJUmvmc53h0kbXzIDE=; b=FuQsaC1iZaTueUUO
	o9C6laKvSWwyB+2gcbL9eu9q0qRgveJpvFr7nu8nMZ69TdKLtk4Fh8r/H1/WZPeG
	g/i2dacKlbiXurAaTuk8nnZ+TvYnThdXyOwHOBM/+iWFMDD8dN5oMJzUuix0VSFa
	27wA3kvZaxW2QWV0ex3E0QADLZWV7Ua3ZSLUSd2ks2sMmdA50GjQEaOQR/ouX4MX
	S0DQeoiKDRY3U2qWsGa/jHi9VjSuzPAS60C1U3FqnGwjkS7zL92ymoHzMoPNF6DP
	8wJJW/pDGYzlJfJQlAwSUOnEhYZGgvKvHj60AHvd44AxVDE3AeZeYc7mxo74GF9k
	1lNV9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7u4g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:09:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a1f5e47so621537985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795468177; x=1796072977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANnf0uY5iDkomZkh+ngxY/U/kEJUmvmc53h0kbXzIDE=;
        b=Yv7ZK0EImgpogo4fU0L0Eqbw9oqBOA0YVKdetdLGlnXUrspRmKS7Ym5h2B5g4cxeQF
         XWWVY07Aj5hmBqS4Z/2OwydHFJch1yDBCoXz8AYYcYRUXsa+mzFyzWiczhbnb/l+QGP1
         SoZyQ3p7/FELQ8YxquIowo3NV096UDWmE95nBVYfUdQC2Yl5CjWko1Rvx9hlIdItA6ep
         DAgRxGXt6fqxWUPyJQsiiJNh8pim2SvN0ce7UYZ7NsCko3oWP8GIi06gvECcllhSNQsT
         F9JVVaV21jdjVyB6HgsGzx8cGueJtQuODZTQHzWl9UdLOrZN+i6dpIB1MI9t36aDNK9r
         U+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468177; x=1796072977;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANnf0uY5iDkomZkh+ngxY/U/kEJUmvmc53h0kbXzIDE=;
        b=ZzcD0VZ8H7Hzzme9MuGPhbcL/RNNMVPq756oQ4VTcZYSSTPJKnrESeuciJkTD6grRx
         E/Bk+KOeqtEfbBty/fnCKAdJODEKKwtbNi+T3OZAxfVhriafWtCDJv9AhxEB4er3aGOt
         JtCj4dkPtz6faP1MvJGt66EA2sUfeumktKEsklBwUNezqBLdvCbAQHNAq/e0/YgFC0s3
         S+mxIv0PJKsNrS6YHbJ4i/77rl5ldUcQvmZgo+dsYPUXzjl6bf9hp4n3xgu/uWdLavLR
         Vodm03MKvUm1Pv0+xJGIEwx6vlnohBpS5cuhYXa0Xe5IwYe04hbWdmWCisk8uDycrXoJ
         pYFg==
X-Forwarded-Encrypted: i=1; AL+hErHnVjfrfQ9zgG7+SG2HvP4q6CXSKnSOwI6y27DQW+rpqFtW8yJ1LrDOy0gDeEkZKbRmkchYHx7Nn4CKACZx@vger.kernel.org
X-Gm-Message-State: APuU4Z8M/nx471+6Y6mJZ4ZXbm8wzQaIbQ7w9D8Mu5yT6cWEZ+DrtRtm
	i8fa8n2UHvPEn1ZRkHv7UWb71/qGfSzTXbFx6fvezNlL9w+Xu4+LvSUVSWpbXl3zttiLTRzOIG8
	xvUYWQb6g3aYUm0TA/OiU/4F7Is9pyi2278s2kTAfpGjut4+pFWyhr0QTKWf6LZLacVcz
X-Gm-Gg: AZFdTZeCGmJVOvPfnCAyT3wwIVVNJ3SVVVQq55C8kNzQXkiSUp+ldJpBo3IHsnnxY20
	i4AtGdBmjXToa/zEVAe4tQGalIQ5hLHrYjLYBUAfDeHTceIgU5Um8nquBIeCG9q8k/JgT5h3gTH
	w+2/y0Jyv9wOHeuqIGvHd21iLJf94sbWNn43TXpmayhwCTYxjHX4m5XVo36Hn+bqZLEfrvnGyXK
	CU90wqKHFk2PyOdzRCOjBV4pNVgFdbIjg+uuril1pE7QbFPubBUiuBdWfC21NAubmCgaouVCLt1
	ISGpnzCozMDCVNOMeGVkOYMf7pp1Rj0voA2M+550jg45GeDtEO7rwNY0kMnVrMChcm2xc3DvLtF
	KfuNzlGuQeopraCaty/5310UZIKZoKcLoF3QwCtHu6qMXbSR4WWJVngSTMUNy
X-Received: by 2002:a05:620a:6c18:b0:949:6841:2ba2 with SMTP id af79cd13be357-949ba96e544mr2214618385a.22.1795468176471;
        Mon, 23 Nov 2026 13:09:36 -0800 (PST)
X-Received: by 2002:a05:620a:6c18:b0:949:6841:2ba2 with SMTP id af79cd13be357-949ba96e544mr2214615585a.22.1795468175977;
        Mon, 23 Nov 2026 13:09:35 -0800 (PST)
Received: from [10.5.0.2] ([187.14.51.61])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f5c31sm893876585a.30.2026.11.23.13.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:09:35 -0800 (PST)
Message-ID: <01bf064e-cd0c-47cf-bc06-8410df2e20e7@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:09:33 +0100
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
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: glymur-dispcc: Stop mdss_mdp and mdss_ahb
 clk_src from getting parked
To: Tobias Heider <tobias.heider@canonical.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
Content-Language: en-US, nl
In-Reply-To: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04ab91 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=DHU7RWTm0b9gVmOwAZ1hRw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=LHNQcD5hdC2IeSFHG2AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NCBTYWx0ZWRfX9Ndwh6+jiSDJ
 va452HaFIb1jhxtAq6fLEse21cuExqeHBQPNxPVYEOF6tYPuPxBX9kXj8pxrrpQbC+dq0r+9Wpt
 f6k4dPM71RLU+hntoOXJSaphCR3Xow0/OG+XUy8NA+eFkL6QRFk0HrJa56t3b1ZagxObF4dTSq4
 Xx6QsIefkES5xKAUG1tX7eZE33lhzlfqdJy1j/TNgmcID6kuHKleD4GTrNFgpkdOkkoWYE0oXCY
 cXWelLc+tALfnSfcEBP68dovcLaDreFyNB+X8+WFplKS72U7IzIts1jz8a+L07zC5FmodbJ7/V/
 FXULO+QsZ/n4Kire/xVAtWAZ6/cf3dthlztOS6E9F3UI8c3vuw4jhRPlJZKyXbp5DjWZcKPFBhO
 ycCHfeqgKvDgFstwdZX9AQgLfCMxBAWjiDRxfG6sUC9GC41BJfdxtjio6MvmsJ92Bxdlqbnb5wM
 6CdzfP62u7KIWKXwYaA==
X-Proofpoint-GUID: BxNNMjEeEBcCgBkZBBXPFGdiRJE920lw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NCBTYWx0ZWRfX3RxuXncABQ0s
 xDDzjYAkZEMBUw/0+JluAEljWYEzrCtBtwVSbSbB76ApbT0hzSVT7efwKzMEoSWF0lazEzAMUdJ
 JIODv/U8woMl9nFqY+aj0hQanOVCGcY=
X-Proofpoint-ORIG-GUID: BxNNMjEeEBcCgBkZBBXPFGdiRJE920lw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230084

Hi,

On 23-Nov-26 21:48, Tobias Heider wrote:
> Parking disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src at 19.2MHz
> kills the EFI GOP framebuffer. The EFI GOP framebuffer should keep working
> until the msm display driver loads, to help with boot debugging and to
> ensure display output when the msm module is not in the initramfs.
> 
> Switch both disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src over
> to clk_rcg2_shared_no_init_park_ops to keep the EFI framebuffer working
> after binding the glymur-dispcc driver, following the
> precedent of commit bc27dbefae6e ("clk: qcom: x1e80100-dispcc: Stop
> disp_cc_mdss_mdp_clk_src from getting parked") and
> commit 5285b0467578 ("clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src
> at registration time")'
> 
> Unlike x1e80100, where mdss_ahb is never parked, glymur's ahb also
> gets parked. Unparking disp_cc_mdss_mdp_clk_src alone was tested
> on the HP EliteBook X G2q and is not sufficient: the EFI GOP still
> dies unless disp_cc_mdss_ahb_clk_src is left un-parked as well.
> 
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/clk/qcom/dispcc-glymur.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
> index 32cc5226b4de7..6eb4ca8b3e771 100644
> --- a/drivers/clk/qcom/dispcc-glymur.c
> +++ b/drivers/clk/qcom/dispcc-glymur.c
> @@ -312,7 +312,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
>  		.parent_data = disp_cc_parent_data_6,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };
>  
> @@ -623,7 +623,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>  		.parent_data = disp_cc_parent_data_7,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };
>  
> 
> ---
> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
> change-id: 20261123-glymur-dispcc-park-53b7642cd626
> 
> Best regards,

