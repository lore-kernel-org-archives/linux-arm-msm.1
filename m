Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686979;
	b=GekBn5BcsNoE5adL/r/7VF7vOWDANorImy2hx/ed8UirEnNhg9utr/FdjiCJywXTgjKw
	 mHtpDBqCwiLMdW4C2ZkjN/mP+S7ZNtMrhUoBsw6NjrptibN2TyoftB+LrGnb8Qs80RUZx
	 MDFLtpngqaEeZWYSQynEhz80AG/uNo0v2aTla+LUi/80eovYp9yfB8jinuYzuGAd654iu
	 IMZQQhcZlXSyWz+m81tk8RgpLevbO3q03cIv41QCd4XaBchIJH64LsYx9bDbXi0WYs6Tt
	 4lhFRQ0Tq6wC2+26M8XMLAsS/fUy/O1TUrg3nJ1qQmw4b82SXLGVoZdq8XNDq/LoorA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
	b=oYrtglCjNptPYAgnJVGx4I+nmhCmCsdMGgIT/+UVa/orYfjK917HK3TFhWOe05uaH1oP
	 Z6bILP0G2a7AIMU/T+4IfwjaaSWLel0MJutXGPtodq0c4/aIhsy5IyAyoPwHL8UWqaeNL
	 DzokuN64LJaQQKhpeXSjkmGbbEvAvB4duq+1P0jiwWNA+jCWNgbWuvCMiFjPlWK5FKyp1
	 Z1K6FHkO1Unu0dV9LDUj2n/eFdqlqk5IplPOk2GAbqSgrXTcyNezJW8o7W7LCq9NT6jlA
	 XotJVQe0zM/fR4iICwykqjf6TZSaFVqyV8p/594TCWB0UhvK6lmllE9xkqppus4dE4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xc2GvF+v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="G/Z9mgt9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E594F606A335
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E594F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xc2GvF+v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G/Z9mgt9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AwMK2175590
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GOcHW9tjnWPfy3JGXVh2ns2a
	T+hFNZ4ZuKMYEvOVVpw=; b=Xc2GvF+vY25WDOEhoJkPfrYHO+KliSW7FhBBwGbz
	lp/Q8RwpCWg2jS99vjSCijjKDNdtLH4cXHmH6qyGflt3RI1nv4Kt12YL6ivyfwnB
	Aoz2nu96rAoKH1PK6cO8a4K0PrKHiqohWchFDwn29ApJuNBaoiAsjzDoRLcjiBFZ
	AvTaGyGMe6F4bufKrpm+ggWroLaNtRw7PFDjIIIyj/piBxUoy/c6jnj7yVZs5e/R
	8Vb1nLuuHaC0ZibjLndy6qOSagAyrEaQW4GDDNKlA99xtaBO4ppl0ZHxjD00KVCd
	vLJFCRrKcPtTzayHdz8WYXNmGrGF/czJReEKfuR6JCofoQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuvn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:56:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7121690eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 01:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686978; x=1796291778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
        b=G/Z9mgt97fMagk0x7M17tFwcAgSxSSMPS9tmvT8hl5L5HG4RMFwKhM4tR8uWOtJZI3
         sBZ26l1va25YCs91zS3CZiGlK3aSGVSGir9yee4SLJh+pqdt6SxSefc6BT5MJTYMEwmn
         tLyziWBJIvlcGG8ruAfejVT95Qf6dEO+W9oZ88KuL8X57+634cvY5ygcsDDX8h63b6/o
         KJj8jvqO4Ee3XTofNv/IReA7bdJ4gj8iZDBkDqRf73CdocoQ+pamO8jGcms9MT60A9VC
         VrH0Dd+mRjjGOzMdNciuHteMpUGiC4uyOjXCTzqTPDstOoiD09boDNp5YAG18GQ2ODve
         hiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686978; x=1796291778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOcHW9tjnWPfy3JGXVh2ns2aT+hFNZ4ZuKMYEvOVVpw=;
        b=PuW0kkrCLttndu7AtZLDAruZQNzvvv/QPZMjxGqWd3nnxVAuUdHngzK3ozimqYKBmp
         IKcgP/fLRfmCUelYGIuhJWwIfTv5ESJUrrILcC8mm3po2dNnkZLLailGH3XCD7Awj1Sl
         PrJ71RkEakuKRf1TJm7OnlzN+JWZW200lFQNA8p8eUAnnbgq1hWuuZ7iXeYWQJwYake+
         bZ5dgvLPRtsIwUnZ4Is3fzRG/pHkRyQRLHHfC0oPWBFeFf3WRQIvNqXg+Ykg+xbHXYU9
         TDg9PzvxnS8Jwr4OigjWQKZ/vav8Z3E82e8NV+kbT7lGMB84AlwYTnq6iqEcnZNRYQPy
         4yDg==
X-Forwarded-Encrypted: i=1; AL+hErGyg3VXwVU3Aw76HUNXx9XsVrRhesA12k+VOb8EwmUtNN/qg+Z1qHzuLBoMQNjmABZx+f2fLaywc4w6EJvl@vger.kernel.org
X-Gm-Message-State: APuU4Z82ct0a8FJclctwrN/9R3rzL8h5k5lYcpMexdldxEMyyuv+MK7A
	DcEMFboEOSwKStD4sM4QitrbDBaemiM55/S5SN9CNKRNbGARViAwYjuugMOKXNN9wDj73pO1AjW
	y7/muhFFobzjR/mTHhAEtK7zJVvdYCMWFZ9w6HkidAwvXdXf9pyiWrKuk0gsUxGBzoOrr
X-Gm-Gg: AZFdTZcMrMKPdAhG7m+Umim3BCr6tcbrjM26wWl2Z9M0t0oLPuoy9tr/HPUvkjmgC7t
	hiO/R/5xcH6ZDS4LMpemCNk/9G4SrtJtsGrOri52y+JgA/3ifgKFHlBSMoCX+TxWE9e/E9PGO76
	cCOK+tLB9iNXVAoKFJhSV4CRpH52WaeqRFrGqdJGSJfbPHpDUBYPnUN1yXxnrRUngRnhq2f0obC
	aVk/8QP8+XRcq60saSHwnd0tidkvrHERWoyCmPGqjyq1WGV6iGN++QozJo+A5Y8YU3xO6KNp4AK
	lZTqSPU0jrlLJl13nZJ586g1ypkWo0w9W2lWRujW98LOr9vJyXs5/luAU7Fv6iLihWsI3f90Pkj
	yhmRD1TP8Q9/PiDhQhb1j/eFHcHnnDUcdGDrQ22rcQC+hiQWaks1x4bgt3BmL7m8GdwMh+ZYLwu
	Hpie//MPzGLZAHe4EP778MjQ==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr10926701eec.21.1795686977578;
        Thu, 26 Nov 2026 01:56:17 -0800 (PST)
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr10926679eec.21.1795686977053;
        Thu, 26 Nov 2026 01:56:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm33923950eec.18.2026.11.26.01.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:16 -0800 (PST)
Date: Thu, 26 Nov 2026 01:56:14 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/11] usb: dwc3: qcom: Assert controller reset on
 remove and probe failure
Message-ID: <awgCPsPdiQDgPUR6@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-GUID: SxAeThf7QLCEJ1dIz3Od_lQPQDKn7rOh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX9vNnI6pLKCch
 GdGog/I3lJIEMCYpSwbJPYknD83ecvJQmf+fUzOcUvDOVRmCVIjzVPDD+0w0AFqP0+KycPiEhEn
 hnce2z+jKwzzYA56HpoglECWKq7e104=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX859nFKk9kuG/
 hqMkOernfJJ8rt+0yeFgOnpHfxce02VAEgKnx0RXrh5JO8HHYo3vkw4jRo46sOvgFYBt5DUxF64
 XGvZpo9xrRh49kaOZ3/Xo8oEpLwxf75vJ3vM1iHG0fu/jxEDrnHa8enUW3hCTyC/M/wrqDeahOH
 KtYNdReZwfHLiuF0WB1C0jEN8Isx85eiHdJy4WbCpDqJDXDupBX5cDlzPls7ssJMtzbWWjkdhQh
 FhNORAPzSiZS8re6d3DaGPp7aypT0Ox0W+vmY9+t4icxKXnpmlFMfut1pVdryDqg2CAVR4QJeR5
 GI0G9G6hLYhSMmhLat/nkmCmEfyH2Zd6emvJhO9clf1EsIjtBd8MrzDrNlF6wcKqmObLLcGHkCR
 PSI504ubW5WukCB5DrJBvoWtl7YaNRZiMlTOKwvWSxLJoP3ZoQkTtV7wQtOWDWNTR5poHMBI+3l
 uvC9vO7v8VTU4T1TQLg==
X-Proofpoint-ORIG-GUID: SxAeThf7QLCEJ1dIz3Od_lQPQDKn7rOh
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080242 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2DI7WhOKpHI9u_kDJrMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 26-11-23 16:17:24, Faisal Hassan wrote:
> The controller is taken out of reset at probe, but nothing puts it back
> into reset when the driver is removed or when probe fails after that
> point. The controller is left running when its clocks are gated, and a
> later bind starts from whatever state it was left in.
> 
> Assert the reset before disabling the clocks on remove and on the probe
> error path, so the controller is held in reset while unused.
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 50fca06c83d4..61a3e3c38f59 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -804,6 +804,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  remove_core:
>  	dwc3_core_remove(&qcom->dwc);
>  clk_disable:
> +	reset_control_assert(qcom->resets);
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  
>  	return ret;
> @@ -818,6 +819,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  		return;
>  
>  	dwc3_core_remove(&qcom->dwc);
> +	reset_control_assert(qcom->resets);
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  	dwc3_qcom_interconnect_exit(qcom);
>  

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

-- 

Thanks,
Peter Chen
