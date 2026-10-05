Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE23386341
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 03:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791170727; cv=none; b=JuXYs9MJJH0utrwgeGI9wzeN2yPgSVBS77KhMpJTGYV6t0BLLNza8VtE6n4xMUL7rx5TYCwvTJcCQSx3N8Y3LiXHXfVlr/wr1YuGwsj7iU0EgmcB+Y84ZvHxd4olv+OukPJ/IknI54p8AXc//oDLCXu320q2XMX/xbDWep/0LQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791170727; c=relaxed/simple;
	bh=zBkF+ZkRes0EkAqAfK3cX1Q7ZZL4+vjNKJxUDVMQCNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoYQum3nEkXebYlGNST6fQN4CmgOE9UKy+IfkAj6v1zPwDu2xKg+Aavs+FXDvOwEDXseM42tYNlGG4q0favai0TYqkBQiYjanJwxBa/mpe6ZIQZ/XTnZ+/xIaxPAVHMZfudw6pk+VQ02GUyH+pj0TwtZ8dk+H4aUg1K7slpInbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nm8Lq3TI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqJXIu9h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nm8Lq3TI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqJXIu9h"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6951072b1464920
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 03:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hTYxHI2g7XScWCuVufXL3ZLK
	7k293CtuFnd4R0QnRjA=; b=Nm8Lq3TI5O0+0rLN4BPnewiBSGcXSJ8lOZ2MIb8j
	4rrMDrcWbduP/EWehSDwTQIza8RRFOAZ/YZawkzwfsJnWIa1Z0oguCa3H+GFBmXz
	uf8XdLazMazoRN2mCRLQmnw4KYURim3B4FwmFDBvXeBthA6QzQFIeySb0QAuuQeJ
	f361UKrPaWn7LtV41BWYM4ml6pQTWOo0tUqi9Ja+mt2gMY7YQ9pXofpzCwgnLXcK
	ZBMgaDQqxdwJGZXkvYR6mXJesSbUsHFk519R8rQcdZeYz6ZOiOx3KxK7UuGPTKfy
	n2bBjyTSTxCD6zi5CIJ/zPNx/s72zPiyT53fuxv6fiCdEA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssm94n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 03:25:24 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98c73533990so497891241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 20:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791170724; x=1791775524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTYxHI2g7XScWCuVufXL3ZLK7k293CtuFnd4R0QnRjA=;
        b=SqJXIu9h9hw1fjSyECU6TY6SrPc8+bpQp0qfUHJC4PBHcVLFSt3j5hnhUAA+vfUns7
         Pn4/ndhmnQ/3AhrZevfK6BAFz6YlYM+N/KABuPxuHdNZCaV4dBpoeGvrlhNcnj5HVzGp
         ZMri5PWTamwN+tPwocQwTPKgBSsublU8V6LfC3K8ZUj9lSyJrU7AACvrsZ98iIXo9FOH
         rEbyb3TXJ2OW6Z/QL5eQ6EfYF1fsi4BZrshTNbQROhsDt7QWIKqsF8IPF57pSG9CiqCz
         mnBkrGMGI3HVwHIgZg7Alv8y3f+BGd4xRybLj8gmioElf4RKHspBpx5UapRGc7E0dxtS
         DCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791170724; x=1791775524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTYxHI2g7XScWCuVufXL3ZLK7k293CtuFnd4R0QnRjA=;
        b=OPL2n8SuRCVBrXyCigJZq+7fki9sOisfrpraxxpYY4fjoK6gQzJYPK/bPO43391HSb
         SJoba0HQMh6wdkqfXyvTCo+6lzyfNRyoIrRAbiZuEgCCn1FZEBkuzk+ErP91xozMo8C6
         +8ye/0eFDgvsadeVbjwZ8BbHpKfT6js2xf82ugvSJfwh0FmBg89BfSdq89oU7XuMPnbH
         2uVnVdoplyo7OPN6nhBNKtZ/RgWevqcV2ysc4FE7YKc3tw1shIl8z/gPEm2LajWiNcga
         JEocjCJA+9FVf8Fc8hXLKK9qXI9TUZvFPji2xw83HqyMviIjVjy9n1qY9JRS9CH7Bj66
         NKbg==
X-Forwarded-Encrypted: i=1; AKwUvBz/SqyV585+BP7FrK5Z5ioSPcKu3J7nFuHsFFcbqUBHPrfGQthAsUJjDeARPsXkSy1eRKYR65rB2SoHj9jC@vger.kernel.org
X-Gm-Message-State: AFq9FYI4ane09K/Lv89r6YarwIJ5DDOeCyHiipT5CnvC+p/Dj5cy2WOp
	mQkGv+nq6NtbVoYFa11Giys5OD6DgLzVzqodzSOrdmZEKMGOwwR9SjRPmHcRKOT/Xgi5RNyjX9m
	P0nYtteEGxxr+DAgFSZo1PL8fAmidAzB9Vczcvdx129AsUBDBs1fGuIZM6foeCY/C97T2
X-Gm-Gg: AYBFou2/8WZHCgjrzEoOjIcNlhvtO7i6Lvrj6dkbwAcq6Ro9B7C63k252GdyAqxrBjq
	xuo2oxcYDe2bfQQrstH4De1tf4w45Dyy6WPk27JkZYt20unjoRaUzN4LZaq1sfJQjBaoV8ikWef
	v548VhjtkKY6QcpnrEJRhAq5j9h5lhWERVoFb5iUYnubqcjUkP2hHnEWshJkBcEHHPMrn3sp3DS
	P20vlv0UsPombR2PIA3Gt1YwXx9lohqJOoSpx1Fnapx5jpEe7tRtk2Z51HNoWYlycqDDDKXdnfO
	YVhTk17KXaIKJl2s37UTnLXGvuClwimeZ4z5p0PXDChSYZqXl/ol9KvS6G/EeEAVVUKJpVc4QEY
	NH4CUug002JSDXxYoNCjqpkOAG/ik/X2VTiIBe/u0RkdUBpe/hI//ygtk+7xEqXpLXn0jmzZsIF
	UTuwGhs/LBylgz
X-Received: by 2002:a05:6102:354b:b0:7b3:5b2f:7030 with SMTP id ada2fe7eead31-7bf80c9bc7fmr2346123137.4.1791170723902;
        Sun, 04 Oct 2026 20:25:23 -0700 (PDT)
X-Received: by 2002:a05:6102:354b:b0:7b3:5b2f:7030 with SMTP id ada2fe7eead31-7bf80c9bc7fmr2346105137.4.1791170723392;
        Sun, 04 Oct 2026 20:25:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e3235d5sm36670991fa.34.2026.10.04.20.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:25:22 -0700 (PDT)
Date: Mon, 5 Oct 2026 06:25:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: round up the compressed INTF width
Message-ID: <rcmt7bnqgu2kmwnr6mliytpjscnnknbm4qrfva77abozwwgraz@3r7giwxnzy43>
References: <20261004102758.84436-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004102758.84436-1-26rote@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxMyBTYWx0ZWRfX/42k9trkdRNw
 ZnX4qQYPuU7YJAwFNddnqqFE+97n+k3zBAaPSlIajtXdSgziQN863vJttazxVe9dq7WH9IeHQ2B
 n9yyGmAU87VnBHkXQqYg3e5fVkmvnuY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxMyBTYWx0ZWRfX+3WjC1l61jK/
 wgAB6wESHrYfmqyXXVo2N4pzrNsaF6nSAbGvGZSSqdpBw+uiuEomF3cUSa6rYfcwqUYLhwqbQlL
 PbwftLzeQi0574b34HdxkOoWpqJQn+hrb4TSuC1urlog7daN9NxoZou8fUlFE7q939DeqC4/6qK
 kev+yI9yXV6OACmhAMCjt6yIgHYQUMjzWYenyYoKxXxWQyilLM62iW5nKXUYSKe5UPnBYVgsvHX
 iez859lpD3kRa9/pBXJRBHHy21X8eWjsnv5PW9s7QFnnFR8NkrtAVmOAZkv+FVRTqKMQB1DP/eq
 bC2SFYqS4mvwx+fkbnAy4IGhi6VMij39rI/nu4gnLtdcbGmvdAq9pkIeXdknU4R0OiRwzhlRbL/
 3Li75nvZkO2pGnVIM8VPiYrF52cpFzinX4fNkF5sTsSfbV0nKQlxDjlzivrB3W65h6l7stGm6qm
 TyboyWRLnuQta0G0NnQ==
X-Proofpoint-GUID: odvFtjJ0XHBNwiXiMLHRDRX9JKLSkT7P
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac318a5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=q6ksuDL_9lF9NV4zmMMA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: odvFtjJ0XHBNwiXiMLHRDRX9JKLSkT7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050013

On Sun, Oct 04, 2026 at 07:27:58PM +0900, Joonhoe Kim wrote:
> For DSI with DSC, drm_mode_to_intf_timing_params() scales the INTF
> active width by bpp / (3 * bits_per_component) and rounds down. The DSI
> host computes the same width with DIV_ROUND_UP, both for the pixel clock
> (dsi_adjust_pclk_for_compression()) and for the active width it programs
> (dsi_timing_setup(), from bytes per line). When the division is not
> exact the INTF line is one pclk shorter than the DSI line, and the DSI
> FIFO overflows.
> 
> Example: a bonded DSI video-mode panel, 952 pixels per link, DSC 8 bpp at
> 10 bpc: 952 * 8 / 30 = 253.87, so the INTF uses 253 and the DSI 254.
> 
> Round up, as the DSI host does. Qualcomm's downstream SDE driver also
> rounds this width up, and Pengyu Luo needed the same rounding on the
> Legion Y700 gen 4 [1].
> 
> Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850) with that panel, with a
> module parameter selecting the rounding: rounding down, DPMS off/on gives
> no vblank and 14000-17000 DSI FIFO error interrupts per second
> (dsi_err_worker: status=4); rounding up, the picture comes back and there
> are no errors. Only tested on this device.
> 
> Link: https://lore.kernel.org/all/CAH2e8h6oinKxN1ndcvHCSc+=bFLXVVDZVAVF0cQHoiaMvEwhPQ@mail.gmail.com/ [1]
> Fixes: f9ce482d7dc0 ("drm/msm/dpu: fix video mode DSC for DSI")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
